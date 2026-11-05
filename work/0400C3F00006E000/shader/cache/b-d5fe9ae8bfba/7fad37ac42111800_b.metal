#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_22 [[id(6)]];
    sampler vp_t_tcb_22Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_14 [[id(10)]];
    sampler vp_t_tcb_14Smplr [[id(11)]];
    texture2d_array<float> vp_t_tcb_16 [[id(12)]];
    sampler vp_t_tcb_16Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_32 [[id(14)]];
    sampler vp_t_tcb_32Smplr [[id(15)]];
    texture3d<float> vp_t_tcb_30 [[id(16)]];
    sampler vp_t_tcb_30Smplr [[id(17)]];
    texture2d<float> vp_t_tcb_1C [[id(18)]];
    sampler vp_t_tcb_1CSmplr [[id(19)]];
    sampler vp_t_tcb_22Smplr_w [[id(20)]];
    sampler vp_t_tcb_24Smplr_w [[id(21)]];
    sampler vp_t_tcb_14Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_1CSmplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_72 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_80 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_94 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_92 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_78 [[attribute(0)]];
    float4 m_76 [[attribute(1)]];
    float4 m_74 [[attribute(3)]];
    float4 m_84 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_68 [[attribute(7)]];
    float4 m_70 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3051 = false;
    bool _425 = false;
    bool _313 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_58.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_61.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3350 = as_type<float>(_131);
        out.gl_Position.z = _3350;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_63.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_61.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3419 = as_type<float>(_169);
        out.gl_Position.z = _3419;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _175 = as_type<int>(_171) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_171) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    float _209;
    if (!_191)
    {
        float _193 = in.m_68.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_115);
        float _215 = 1.0 / _213;
        float _217 = _149 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    bool _225 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _227 = isnan(_219);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    float _241 = -_235;
    float _243 = _241 + 1.0;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _247 = 1.0 / _239;
    float _249 = _223 * _247;
    bool _251 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _253 = isnan(_219);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _267;
    float _271 = _261 * _243;
    float _273 = fma(_265, _249, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_269, _249, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = -_261;
    float _279 = _277 + 1.0;
    float _281 = _273 * _271;
    float _283 = _275 * _271;
    float _285 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    bool _293 = !_245;
    float _311;
    if (!_293)
    {
        float _295 = in.m_68.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_115);
        float _317 = 1.0 / _315;
        float _319 = _149 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    bool _323 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _325 = isnan(_321);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _339 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _341 = isnan(_321);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _357 = _321 + _355;
    float _359 = 1.0 / _337;
    float _361 = -_333;
    float _363 = _361 + 1.0;
    bool _365 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _367 = _349 * _363;
    float _369 = -_349;
    float _371 = _369 + 1.0;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _375 = _353 * _359;
    float _377 = _373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _379 = fma(_375, _357, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _381 = _379 * _367;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _385 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[115].x, _381);
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _389 = _383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[116].x, _385);
    float _393 = in.m_70.x;
    float _395 = in.m_70.y;
    float _397 = _387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _391 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _397;
    out.m_72.y = _389;
    out.m_72.z = _377;
    out.m_72.w = _399;
    float _401 = _291 * _395;
    float _403 = _289 * _393;
    bool _405 = !_365;
    float _423;
    if (!_405)
    {
        float _407 = in.m_68.x;
        float _409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _411 = _407 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _415 = _413 * _409;
        float _417 = floor(_415);
        float _419 = -_417;
        float _421 = _415 + _419;
        _423 = _421;
        _425 = true;
    }
    else
    {
        float _427 = float(_115);
        float _429 = 1.0 / _427;
        float _431 = _149 * _429;
        _423 = _431;
    }
    _425 = false;
    float _433 = _423;
    float _435 = in.m_68.x;
    float _437 = in.m_68.y;
    float _439 = in.m_68.z;
    float _441 = in.m_68.w;
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _445 = in.m_58.x;
    float _447 = in.m_58.y;
    float _449 = in.m_58.z;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _457 = _455 != 0;
    float _459 = in.m_74.x;
    float _461 = in.m_74.y;
    float _463 = in.m_74.z;
    float _465 = in.m_74.w;
    int _467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _469 = _467 != 0;
    float _471 = 1.0 / _453;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _475 = _473 != 0;
    float _477 = in.m_76.x;
    float _479 = in.m_76.y;
    float _481 = in.m_76.z;
    float _483 = in.m_76.w;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _487 = _485 != 0;
    float _489 = in.m_78.y;
    bool _491 = _441 > 0.5;
    float _493 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _495 = _435 > 0.5;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _499 = _497 != 0;
    float _501 = _447 * _461;
    float _503 = _447 * _479;
    float _505 = fma(_445, _459, _501);
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _509 = _447 + _489;
    float _511 = fma(_445, _477, _503);
    float _513 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _517 = fma(_449, _463, _505);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _519;
    float _523 = -_507;
    float _525 = fma(_513, 2.0, _523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _529 = _433 + _527;
    float _531 = -_185;
    int _533 = _495 ? as_type<int>(_531) : as_type<int>(_185);
    float _535 = _521 * _471;
    bool _537 = _437 > 0.5;
    float _539 = fma(_449, _481, _511);
    float _541 = fma(_535, _529, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _543 = -_189;
    int _545 = _537 ? as_type<int>(_543) : as_type<int>(_189);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _549 = _521;
    if (!_499)
    {
        _549 = _439;
    }
    float _551 = _549;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _555 = _551;
    if (_499)
    {
        _555 = _437;
    }
    float _557 = _555;
    float _559 = fma(_493, -2.0, _547);
    bool _561 = !_457;
    float _563 = _561 ? _185 : as_type<float>(_533);
    float _565 = _443 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _567 = !_469;
    float _569 = _567 ? _189 : as_type<float>(_545);
    float _571 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[83].w, _553);
    float _573 = _515 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _575 = -_149;
    float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[76].x, _525);
    float _579 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _559);
    float _581 = _563 + 0.5;
    float _583 = _569 + (-0.5);
    float _585 = _539 + _483;
    float _587 = _517 + _465;
    float _589 = fma(_565, _581, _577);
    float _591 = -_573;
    float _593 = -_579;
    float _595 = fma(_591, _583, _593);
    float _597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _599 = _565;
    if (!_499)
    {
        _599 = _437;
    }
    float _601 = _599;
    float _603 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _571);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _607 = _601;
    if (_499)
    {
        _607 = _435;
    }
    float _609 = _607;
    float _611 = -_603;
    float _613 = _611 + 1.0;
    bool _615 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _617 = isnan(_433);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _629 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _631 = isnan(_433);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = _609 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _643 = _439 > 0.5;
    float _645 = -_625;
    float _647 = _645 + 1.0;
    float _649 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[83].z, _605);
    float _651 = _609;
    if (!_499)
    {
        _651 = _439;
    }
    float _653 = _651;
    float _655 = -_627;
    float _657 = fma(_641, 2.0, _655);
    float _659 = _639 * _647;
    float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _663 = _653;
    if (_499)
    {
        _663 = _437;
    }
    float _665 = _663;
    float _667 = _541 * _659;
    float _669 = -_185;
    int _671 = _643 ? as_type<int>(_669) : as_type<int>(_185);
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _675 = -_639;
    float _677 = _675 + 1.0;
    float _679 = _665 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _681 = !_475;
    float _683 = _681 ? _185 : as_type<float>(_671);
    float _685 = _597 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _687 = -_149;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[81].x, _657);
    float _691 = fma(_679, -2.0, _673);
    float _693 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[131].x, _667);
    float _695 = _683 + 0.5;
    float _697 = -_189;
    int _699 = _491 ? as_type<int>(_697) : as_type<int>(_189);
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _703 = _509 + _701;
    float _705 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _649);
    float _707 = fma(_685, _695, _689);
    bool _709 = !_487;
    float _711 = _709 ? _189 : as_type<float>(_699);
    float _713 = _703 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _715 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _717 = _585 + _715;
    float _719 = _661 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _721 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _691);
    float _723 = _711 + (-0.5);
    float _725 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[28].x, _713);
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _731 = _587 + _729;
    float _733 = -_719;
    float _735 = -_721;
    float _737 = fma(_733, _723, _735);
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _741 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].w, _727);
    float _743 = -_705;
    float _745 = _743 + 1.0;
    float _747 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[28].z, _725);
    float _749 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].z, _739);
    float _751 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _741);
    float _753 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[132].x, _693);
    float _755 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _749);
    float _757 = -_751;
    float _759 = _757 + 1.0;
    bool _761 = _747 >= 0.0;
    float _763 = -_755;
    float _765 = _763 + 1.0;
    float _767 = fma(_569, _759, _595);
    float _769 = -_745;
    float _771 = fma(_683, _769, _707);
    float _773 = _703 * _703;
    float _775 = -_765;
    float _777 = fma(_563, _775, _589);
    float _779 = fma(_711, _613, _737);
    float _781 = fma(_717, _717, _773);
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _785 = fma(_731, _731, _781);
    float _787 = _727;
    float _789 = _771;
    if (_761)
    {
        _787 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _791 = _787;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _797 = _753 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _799 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _801 = rsqrt(_785);
    float _803 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _807 = as_type<int>(_791);
    if (_761)
    {
        float _809 = _791 * 5.0;
        _807 = as_type<int>(_809);
    }
    int _811 = _807;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _815 = _813 != 0;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _819 = _817 != 0;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _823 = _821 != 0;
    out.m_80.x = _777;
    out.m_80.y = _767;
    out.m_80.z = _771;
    out.m_80.w = _779;
    out.m_82.x = _803;
    out.m_82.y = _799;
    out.m_82.z = _805;
    out.m_82.w = _797;
    bool _825 = !_815;
    int _827 = _825 ? 0 : 1;
    bool _829 = !_819;
    int _831 = _829 ? 0 : 1;
    if (_761)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4523 = as_type<float>(_811);
        out.gl_Position.z = _4523;
    }
    bool _833 = !_823;
    int _835 = _833 ? 0 : 1;
    float _837 = _703 * _801;
    float _839 = _717 * _801;
    float _841 = _837;
    if (_761)
    {
        out.m_61.x = 0.0;
    }
    if (_761)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _843 = -_837;
    float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[18].w, _509);
    float _847 = _731 * _801;
    float _849 = -_839;
    float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _585);
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _855 = _845 + _853;
    float _857 = -_847;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[18].w, _587);
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _863 = _851 + _861;
    float _865 = _855 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _869 = _859 + _867;
    float _871 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[28].x, _865);
    float _873 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[28].z, _871);
    bool _875 = _873 >= 0.0;
    if (_875)
    {
        _789 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _877 = _789;
    int _879 = as_type<int>(_877);
    if (_875)
    {
        out.m_61.x = 0.0;
    }
    if (_875)
    {
        float _881 = _877 * 5.0;
        _879 = as_type<int>(_881);
    }
    int _883 = _879;
    if (_875)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4628 = as_type<float>(_883);
        out.gl_Position.z = _4628;
    }
    if (_875)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _885 = _845 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _887 = _845 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _889 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[11].x, _885);
    float _891 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[11].z, _889);
    float _893 = _845 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _895 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _897 = _891 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _899 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[10].x, _893);
    float _901 = 1.0 / _897;
    float _903 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[10].z, _899);
    float _905 = _903 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _907 = _905 + _897;
    float _909 = _851 * (*spvDescriptorSet0.vp_c15)._m0[127].x;
    float _911 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[127].y, _909);
    float _913 = _907 * _901;
    float _915 = _913 * 0.5;
    float _917 = _851 * (*spvDescriptorSet0.vp_c15)._m0[126].x;
    float _919 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[127].z, _911);
    float _921 = _845 + _895;
    float _923 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _925 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[30].w, _923);
    float _927 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[126].y, _917);
    float _929 = _919 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _931 = fma(_921, (*spvDescriptorSet0.vp_c15)._m0[126].y, _917);
    float _933 = fma(_921, (*spvDescriptorSet0.vp_c15)._m0[127].y, _909);
    float _935 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[126].z, _927);
    float _937 = 1.0 / _925;
    float _939 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[127].z, _933);
    float _941 = _935 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _943 = _939 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _945 = trunc(_943);
    int _947 = int(_945);
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _951 = _937 * _949;
    float _953 = trunc(_941);
    int _955 = int(_953);
    bool _957 = _951 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _959 = _951 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _961 = !_957;
    int _963 = _961 ? 0 : 1;
    int _965 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _967 = _947 + _965;
    int _969 = _967 + 1;
    int _971 = 2;
    float _973 = _887;
    if (!_957)
    {
        _971 = 1;
    }
    int _975 = _971;
    int _977 = _975;
    if (!_959)
    {
        _977 = _963;
    }
    int _979 = _977;
    float _981 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[126].z, _931);
    int _983 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _985 = _955 + _983;
    int _987 = _985 + 1;
    float _989 = trunc(_929);
    int _991 = int(_989);
    int _993 = _979 << 6;
    float _995 = _981 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _997 = _987 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _999 = _993 + 96;
    uint _1002 = uint(int(uint(_999) >> uint(2)));
    uint _1004 = uint(int(uint(int(_1002)) >> uint(2)));
    int _1006 = int(_1002) & 3;
    float _1008 = (*spvDescriptorSet0.vp_c15)._m0[int(_1004)][_1006];
    int _1010 = int(_1002) + 1;
    uint _1012 = uint(int(uint(_1010) >> uint(2)));
    int _1014 = _1010 & 3;
    float _1016 = (*spvDescriptorSet0.vp_c15)._m0[int(_1012)][_1014];
    float _1018 = trunc(_995);
    int _1020 = int(_1018);
    int _1022 = _993 + 104;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    uint _1026 = uint(int(uint(int(_1024)) >> uint(2)));
    int _1028 = int(_1024) & 3;
    float _1030 = (*spvDescriptorSet0.vp_c15)._m0[int(_1026)][_1028];
    int _1032 = int(_1024) + 1;
    uint _1034 = uint(int(uint(_1032) >> uint(2)));
    int _1036 = _1032 & 3;
    float _1038 = (*spvDescriptorSet0.vp_c15)._m0[int(_1034)][_1036];
    int _1040 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1042 = _991 + _1040;
    int _1044 = _1042 + 1;
    int _1046 = _987 | _1044;
    int _1048 = _993 + 48;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    uint _1052 = uint(int(uint(int(_1050)) >> uint(2)));
    int _1054 = int(_1050) & 3;
    float _1056 = (*spvDescriptorSet0.vp_c15)._m0[int(_1052)][_1054];
    int _1058 = int(_1050) + 1;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    int _1062 = _1058 & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    int _1066 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1068 = _1020 + _1066;
    int _1070 = _1068 + 1;
    bool _1072 = _1046 < 0;
    bool _1074 = _1072 || _997;
    bool _1076 = _1070 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1078 = _993 + 64;
    uint _1080 = uint(int(uint(_1078) >> uint(2)));
    uint _1082 = uint(int(uint(int(_1080)) >> uint(2)));
    int _1084 = int(_1080) & 3;
    float _1086 = (*spvDescriptorSet0.vp_c15)._m0[int(_1082)][_1084];
    int _1088 = int(_1080) + 1;
    uint _1090 = uint(int(uint(_1088) >> uint(2)));
    int _1092 = _1088 & 3;
    float _1094 = (*spvDescriptorSet0.vp_c15)._m0[int(_1090)][_1092];
    int _1096 = _1070 | _969;
    bool _1098 = _1044 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1100 = _1098 || _1074;
    bool _1102 = _1096 < 0;
    bool _1104 = _1102 || _1076;
    int _1106 = _993 + 56;
    uint _1108 = uint(int(uint(_1106) >> uint(2)));
    uint _1110 = uint(int(uint(int(_1108)) >> uint(2)));
    int _1112 = int(_1108) & 3;
    float _1114 = (*spvDescriptorSet0.vp_c15)._m0[int(_1110)][_1112];
    int _1116 = int(_1108) + 1;
    uint _1118 = uint(int(uint(_1116) >> uint(2)));
    int _1120 = _1116 & 3;
    float _1122 = (*spvDescriptorSet0.vp_c15)._m0[int(_1118)][_1120];
    bool _1124 = _969 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1126 = _1124 || _1104;
    int _1128 = _993 + 72;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
    int _1134 = int(_1130) & 3;
    float _1136 = (*spvDescriptorSet0.vp_c15)._m0[int(_1132)][_1134];
    int _1138 = int(_1130) + 1;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    int _1142 = _1138 & 3;
    float _1144 = (*spvDescriptorSet0.vp_c15)._m0[int(_1140)][_1142];
    int _1146 = _987;
    int _1148 = _1044;
    float _1150 = as_type<float>(_979);
    if (!_1100)
    {
        int _1152 = _1044 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1154 = _1152 + _987;
        _1146 = _1154;
    }
    int _1156 = _1146;
    if (!_1126)
    {
        int _1158 = _969 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1160 = _1158 + _1070;
        _1148 = _1160;
    }
    int _1162 = _1148;
    float _1164 = _921 * _1016;
    int _1166 = as_type<int>(_1016);
    int _1168 = as_type<int>(_1008);
    float _1170 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (!_1100)
    {
        int _1172 = _1156 << 2;
        _1166 = _1172;
    }
    int _1174 = _1166;
    int _1176 = 0;
    int _1178 = _1174;
    if (!_1126)
    {
        int _1180 = _1162 << 2;
        _1176 = _1180;
    }
    int _1182 = _1176;
    float _1184 = fma(_851, _1008, _1164);
    int _1186 = _1182;
    if (!_1100)
    {
        uint _1188 = uint(int(uint(_1156) >> uint(2)));
        _1168 = int(_1188);
    }
    int _1190 = _1168;
    float _1192 = fma(_851, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1194 = _1192;
    if (!_1100)
    {
        int _1196 = 12 & _1174;
        _1178 = _1196;
    }
    int _1198 = _1178;
    float _1200 = fma(_859, _1030, _1184);
    int _1202 = 0;
    if (!_1126)
    {
        uint _1204 = uint(int(uint(_1162) >> uint(2)));
        _1202 = int(_1204);
    }
    int _1206 = _1202;
    float _1208 = floor(_1192);
    if (!_1126)
    {
        int _1210 = 12 & _1182;
        _1186 = _1210;
    }
    int _1212 = _1186;
    if (!_1100)
    {
        int _1214 = _1190 << 4;
        int _1216 = _1214 + _1198;
        _1170 = as_type<float>(_1216);
    }
    float _1218 = _1170;
    int _1220 = 0;
    if (!_1126)
    {
        int _1222 = _1206 << 4;
        int _1224 = _1222 + _1212;
        _1220 = _1224;
    }
    int _1226 = _1220;
    float _1228 = _1200 + _1038;
    int _1230 = _993 + 80;
    uint _1232 = uint(int(uint(_1230) >> uint(2)));
    uint _1234 = uint(int(uint(int(_1232)) >> uint(2)));
    int _1236 = int(_1232) & 3;
    float _1238 = (*spvDescriptorSet0.vp_c15)._m0[int(_1234)][_1236];
    int _1240 = int(_1232) + 1;
    uint _1242 = uint(int(uint(_1240) >> uint(2)));
    int _1244 = _1240 & 3;
    float _1246 = (*spvDescriptorSet0.vp_c15)._m0[int(_1242)][_1244];
    float _1248 = _921 * _1064;
    float _1250 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1252 = 1.0 / _1228;
    float _1254 = fma(_851, _1056, _1248);
    float _1256 = _921 * _1094;
    float _1258 = _1218;
    float _1260 = _1250;
    if (!_1100)
    {
        int _1262 = as_type<int>(_1218) + 400;
        uint _1264 = uint(int(uint(_1262) >> uint(2)));
        uint _1266 = uint(int(uint(int(_1264)) >> uint(2)));
        int _1268 = int(_1264) & 3;
        float _1270 = (*spvDescriptorSet0.vp_c15)._m0[int(_1266)][_1268];
        _1258 = _1270;
    }
    float _1272 = _1258;
    float _1274 = -_1208;
    float _1276 = _1192 + _1274;
    float _1278 = fma(_851, _1086, _1256);
    float _1280 = floor(_1250);
    float _1282 = fma(_859, _1114, _1254);
    float _1284 = _1200;
    if (!_1126)
    {
        int _1286 = _1226 + 400;
        uint _1288 = uint(int(uint(_1286) >> uint(2)));
        uint _1290 = uint(int(uint(int(_1288)) >> uint(2)));
        int _1292 = int(_1288) & 3;
        float _1294 = (*spvDescriptorSet0.vp_c15)._m0[int(_1290)][_1292];
        _1284 = _1294;
    }
    float _1296 = _1284;
    float _1298 = _1282 + _1122;
    float _1300 = _1122;
    if (!_1126)
    {
        float _1302 = floor(_943);
        _1300 = _1302;
    }
    float _1304 = _1300;
    float _1306 = fma(_859, _1136, _1278);
    int _1308 = _993 + 88;
    uint _1310 = uint(int(uint(_1308) >> uint(2)));
    uint _1312 = uint(int(uint(int(_1310)) >> uint(2)));
    int _1314 = int(_1310) & 3;
    float _1316 = (*spvDescriptorSet0.vp_c15)._m0[int(_1312)][_1314];
    int _1318 = int(_1310) + 1;
    uint _1320 = uint(int(uint(_1318) >> uint(2)));
    int _1322 = _1318 & 3;
    float _1324 = (*spvDescriptorSet0.vp_c15)._m0[int(_1320)][_1322];
    float _1326 = _1298 * _1252;
    float _1328 = _1306 + _1144;
    float _1330 = _1254;
    if (!_1100)
    {
        float _1332 = floor(_941);
        _1330 = _1332;
    }
    float _1334 = _1330;
    bool _1336 = _1326 >= 0.0;
    float _1338 = _1328 * _1252;
    float _1340 = -_1280;
    float _1342 = _1250 + _1340;
    bool _1344 = _1326 <= 1.0;
    bool _1346 = _1344 && _1336;
    float _1348 = _1256;
    if (!_1100)
    {
        float _1350 = floor(_929);
        _1348 = _1350;
    }
    float _1352 = _1348;
    bool _1354 = _1338 >= 0.0;
    bool _1356 = _1354 && _1346;
    float _1358 = _1304;
    if (!_1126)
    {
        float _1360 = -_1304;
        float _1362 = _943 + _1360;
        _1194 = _1362;
    }
    float _1364 = _1194;
    bool _1366 = _1338 <= 1.0;
    bool _1368 = _1366 && _1356;
    float _1370 = _1144;
    if (!_1126)
    {
        float _1372 = floor(_995);
        _1370 = _1372;
    }
    float _1374 = _1370;
    if (!_1100)
    {
        float _1376 = -_1334;
        float _1378 = _941 + _1376;
        _1358 = _1378;
    }
    float _1380 = _1358;
    float _1382 = _921 * _1246;
    float _1384 = fma(_851, _1238, _1382);
    float _1386 = _1352;
    if (!_1100)
    {
        float _1388 = -_1352;
        float _1390 = _929 + _1388;
        _1386 = _1390;
    }
    float _1392 = _1386;
    if (_1368)
    {
        float _1394 = float(_979);
        _1150 = _1394;
    }
    float _1396 = _1150;
    float _1398 = _1298;
    if (!_1100)
    {
        float _1400 = rint(_1272);
        float _1402 = precise::max(_1400, 0.0);
        uint _1404 = uint(_1402);
        uint _1406 = clamp(_1404, 0u, 65535u);
        _1398 = as_type<float>(_1406);
    }
    float _1408 = _1398;
    if (!_1126)
    {
        float _1410 = -_1374;
        float _1412 = _995 + _1410;
        _1260 = _1412;
    }
    float _1414 = _1260;
    float _1416 = _1296;
    if (!_1126)
    {
        float _1418 = rint(_1296);
        float _1420 = precise::max(_1418, 0.0);
        uint _1422 = uint(_1420);
        uint _1424 = clamp(_1422, 0u, 65535u);
        _1416 = as_type<float>(_1424);
    }
    float _1426 = _1416;
    float _1428 = _1382;
    if (_1368)
    {
        float _1430 = rint(_1396);
        float _1432 = precise::max(_1430, 0.0);
        uint _1434 = uint(_1432);
        uint _1436 = clamp(_1434, 0u, 65535u);
        _1428 = as_type<float>(_1436);
    }
    float _1438 = _1428;
    float _1440 = fma(_859, _1316, _1384);
    float _1442 = fma(_859, 6.2500002968590706586837768554688e-05, 0.5);
    float _1444 = _1440 + _1324;
    float _1446 = fma(_851, 6.2500002968590706586837768554688e-05, 0.5);
    float _1448 = _1444 * _1252;
    float2 _5568 = float2(_1446, _1442);
    float _1450 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_5568, float2(0.0), isnan(_5568)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_5568, float2(0.0), isnan(_5568)), level(0.0)).x;
    float2 _5578 = float2(_1276, _1342);
    float _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5578, float2(0.0), isnan(_5578)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5578, float2(0.0), isnan(_5578)), level(0.0)).x;
    float _1454 = _1408;
    if (!_1100)
    {
        float3 _5593 = float3(_1380, _1392, float(as_type<int>(_1408)));
        float3 _5597 = select(_5593, float3(0.0), isnan(_5593));
        float _1456 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5597.xy, uint(rint(_5597.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5597.xy, uint(rint(_5597.z)), level(0.0)).x;
        _1454 = _1456;
    }
    float _1458 = _1454;
    float _1460 = _1426;
    if (!_1126)
    {
        float3 _5613 = float3(_1414, _1364, float(as_type<int>(_1426)));
        float3 _5615 = select(_5613, float3(0.0), isnan(_5613));
        float _1462 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5615.xy, uint(rint(_5615.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5615.xy, uint(rint(_5615.z)), level(0.0)).x;
        _1460 = _1462;
    }
    float _1464 = _1460;
    float _1466 = _1338;
    if (_1368)
    {
        float3 _5630 = float3(_1326, _1338, float(as_type<int>(_1438)));
        float3 _5632 = select(_5630, float3(0.0), isnan(_5630));
        float _1468 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5632.xy, uint(rint(_5632.z)), _1448, level(0.0));
        _1466 = _1468;
    }
    float _1470 = _1466;
    float _1472 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1474 = log2(_1472);
    float _1476 = _435 * 2.0;
    float _1478 = _439 * 2.0;
    float _1480 = _437 + _439;
    int _1482 = abs(_827);
    float _1484 = -_837;
    float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[18].w, _703);
    int _1488 = abs(_831);
    float _1490 = -_839;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[18].w, _717);
    float _1494 = floor(_1478);
    float _1496 = -_847;
    float _1498 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[18].w, _731);
    int _1500 = abs(_835);
    float _1502 = floor(_1476);
    float _1504 = _1474 * _149;
    float _1506 = _1480 + (-1.0);
    float _1508 = _437 + _435;
    float _1510 = _437 * 2.0;
    float _1512 = _1508 + (-1.0);
    float _1514 = exp2(_1504);
    bool _1516 = _1494 > 0.0;
    float _1518 = _1486 * _1486;
    bool _1520 = _1494 >= 0.0;
    bool _1522 = isnan(_1494);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan(0.0);
    bool _1528 = _1524 || _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1532 = 1.0 + _1530;
    float _1534 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1536 = float(_1482);
    bool _1538 = _1502 > 0.0;
    float _1540 = in.m_84.x;
    float _1542 = in.m_84.y;
    float _1544 = in.m_84.z;
    bool _1546 = _1502 >= 0.0;
    bool _1548 = isnan(_1502);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    float _1556 = 1.0 / _1532;
    int _1558 = _1528 ? 0 : 1;
    float _1560 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1562 = _1554 ? 0 : 1;
    float _1564 = _437 + (-0.5);
    bool _1566 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1568 = isnan(1.0);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1574 = _1570 || _1572;
    float _1576 = -_1514;
    float _1578 = _1576 + 1.0;
    int _1580 = ~_1558;
    int _1582 = _1580 + 1;
    int _1584 = _1582 + 1;
    float _1586 = floor(_1510);
    int _1588 = ~_1562;
    int _1590 = _1588 + 1;
    int _1592 = _1590 + 1;
    int _1594 = _1584;
    int _1596 = _1592;
    if (!_1516)
    {
        int _1598 = ~_1558;
        int _1600 = _1598 + 1;
        _1594 = _1600;
    }
    int _1602 = _1594;
    if (!_1538)
    {
        int _1604 = ~_1562;
        int _1606 = _1604 + 1;
        _1596 = _1606;
    }
    int _1608 = _1596;
    bool _1610 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1612 = isnan(0.0);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1618 = _1614 || _1616;
    float _1620 = float(_1602);
    float _1622 = _1618 ? _1578 : 0.0;
    float _1624 = float(_1608);
    float _1626 = _1536 * _1620;
    bool _1628 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1630 = isnan(0.5);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1636 = _1632 || _1634;
    if (_1574)
    {
        float _1638 = _1622 * _1556;
        _153 = _1638;
    }
    float _1640 = _153;
    float _1642 = _1626 * (-2.0);
    float _1644 = fma(_1492, _1492, _1518);
    bool _1646 = _1586 > 0.0;
    float _1648 = _435 + (-0.5);
    float _1650 = fma(_1642, _1540, _1540);
    float _1652 = float(_1488);
    float _1654 = fma(_1534, _1642, _1534);
    bool _1656 = _1586 >= 0.0;
    bool _1658 = isnan(_1586);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan(0.0);
    bool _1664 = _1660 || _1662;
    float _1666 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1650);
    float _1668 = fma(_1498, _1498, _1644);
    float _1670 = _1652 * _1624;
    int _1672 = _1664 ? 0 : 1;
    float _1674 = fma(_1654, _1640, _1666);
    float _1676 = _439 + _435;
    float _1678 = _1670 * (-2.0);
    int _1680 = ~_1672;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = _1674 * 0.15915493667125701904296875;
    int _1688 = _1684;
    if (!_1646)
    {
        int _1690 = ~_1672;
        int _1692 = _1690 + 1;
        _1688 = _1692;
    }
    int _1694 = _1688;
    float _1696 = -_509;
    float _1698 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1700 = fma(_1678, _1542, _1542);
    float _1702 = sqrt(_1668);
    float _1704 = _1698 * _1698;
    float _1706 = float(_1500);
    float _1708 = -_585;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1712 = fma(_1560, _1678, _1560);
    float _1714 = -_587;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1718 = float(_1694);
    float _1720 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1700);
    float _1722 = fma(_1710, _1710, _1704);
    float _1724 = _1676 + (-1.0);
    float _1726 = _1706 * _1718;
    float _1728 = fma(_1712, _1640, _1720);
    float _1730 = fma(_1716, _1716, _1722);
    float _1732 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1734 = _1726 * (-2.0);
    float _1736 = _439 + (-0.5);
    float _1738 = rsqrt(_1730);
    float _1740 = fma(_1734, _1544, _1544);
    float _1742 = fma(_1732, _1734, _1732);
    float _1744 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1740);
    float _1746 = _1686 * 6.283185482025146484375;
    float _1748 = sin(_1746);
    float _1750 = fma(_1742, _1640, _1744);
    float _1752 = _801 * _1702;
    float _1754 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1756 = _1750 * 0.15915493667125701904296875;
    float _1758 = _1710 * _1738;
    float _1760 = _1686 * 6.283185482025146484375;
    float _1762 = cos(_1760);
    float _1764 = _1716 * _1738;
    float _1766 = _1698 * _1738;
    float _1768 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1770 = _1764 * _1768;
    float _1772 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1774 = _1766 * _1772;
    float _1776 = _1756 * 6.283185482025146484375;
    float _1778 = sin(_1776);
    float _1780 = _1728 * 0.15915493667125701904296875;
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1784 = _1758 * _1782;
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1788 = -_1770;
    float _1790 = fma(_1766, _1786, _1788);
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1794 = -_1774;
    float _1796 = fma(_1758, _1792, _1794);
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1800 = -_1784;
    float _1802 = fma(_1764, _1798, _1800);
    float _1804 = _1780 * 6.283185482025146484375;
    float _1806 = sin(_1804);
    float _1808 = _1802 * _1802;
    float _1810 = fma(_1790, _1790, _1808);
    float _1812 = _1780 * 6.283185482025146484375;
    float _1814 = cos(_1812);
    float _1816 = fma(_1796, _1796, _1810);
    float _1818 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1820 = _1752 * _1818;
    float _1822 = _1756 * 6.283185482025146484375;
    float _1824 = cos(_1822);
    float _1826 = _1748 * _1806;
    float _1828 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1830 = _1762 * _1806;
    float _1832 = _1752 * _1828;
    float _1834 = rsqrt(_1816);
    float _1836 = _1762 * _1814;
    float _1838 = _1754 * _1832;
    float _1840 = _1748 * _1814;
    float _1842 = fma(_1778, _1836, _1826);
    float _1844 = fma(_1778, _1826, _1836);
    float _1846 = -_1830;
    float _1848 = fma(_1778, _1840, _1846);
    float _1850 = _1762 * _1824;
    float _1852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _1854 = _1814 * _1824;
    float _1856 = _1748 * _1824;
    float _1858 = _1806 * _1824;
    float _1860 = _1852 * _1820;
    float _1862 = _1850 * _1838;
    float _1864 = -_1838;
    float _1866 = _1778 * _1864;
    float _1868 = _1790 * _1834;
    float _1870 = _1802 * _1834;
    float _1872 = _1796 * _1834;
    float _1874 = -_1840;
    float _1876 = fma(_1778, _1830, _1874);
    float _1878 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1880 = _1878 * 0.5;
    float _1882 = fma(_1842, _1860, _1862);
    float _1884 = _1766 * _1868;
    float _1886 = _1856 * _1838;
    float _1888 = fma(_1854, _1860, _1866);
    float _1890 = fma(_1876, _1880, _1882);
    float _1892 = _1764 * _1870;
    float _1894 = -_1884;
    float _1896 = fma(_1758, _1870, _1894);
    float _1898 = fma(_1848, _1860, _1886);
    float _1900 = fma(_1858, _1880, _1888);
    float _1902 = -_1892;
    float _1904 = fma(_1766, _1872, _1902);
    float _1906 = _1896 * _1890;
    float _1908 = fma(_1844, _1880, _1898);
    float _1910 = _1904 * _1890;
    float _1912 = fma(_1872, _1900, _1906);
    float _1914 = fma(_1868, _1900, _1910);
    float _1916 = fma(_1764, _1908, _1912);
    float _1918 = fma(_1758, _1908, _1914);
    float _1920 = _587 + _1916;
    float _1922 = _585 + _1918;
    float _1924 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1926 = _1920 + _1924;
    float _1928 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1930 = _1922 + _1928;
    float _1932 = _1926 * _1926;
    float _1934 = fma(_1930, _1930, _1932);
    float _1936 = _1758 * _1872;
    float _1938 = sqrt(_1934);
    float _1940 = -_1936;
    float _1942 = fma(_1764, _1868, _1940);
    float _1944 = _1942 * _1890;
    float _1946 = fma(_1870, _1900, _1944);
    float _1948 = fma(_1766, _1908, _1946);
    bool _1950 = _1938 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1952 = _509 + _1948;
    float _1954 = _1900;
    float _1956 = _1952;
    float _1958 = _1920;
    float _1960 = _1934;
    if (!_1950)
    {
        _1954 = _1922;
    }
    float _1962 = _1954;
    bool _1964 = !_1950;
    float _1966 = _1962;
    float _1968 = _1464;
    if (!_1964)
    {
        float _1970 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1974 = _1938 + _1972;
        float _1976 = _1952 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1978 = rsqrt(_1934);
        float _1980 = _1974 * _1970;
        float _1982 = _1980 * 0.15915493667125701904296875;
        float _1984 = _1982 * 6.283185482025146484375;
        float _1986 = cos(_1984);
        float _1988 = _1982 * 6.283185482025146484375;
        float _1990 = sin(_1988);
        float _1992 = _1986 + (-1.0);
        float _1994 = fma(_1990, _1976, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1996 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1998 = _1978 * _1994;
        float _2000 = fma(_1952, _1986, _1996);
        float _2002 = fma(_1930, _1998, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2004 = fma(_1926, _1998, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1966 = _2002;
        _1956 = _2000;
        _1958 = _2004;
        _1960 = _1978;
    }
    float _2006 = _1966;
    float _2008 = _1956;
    float _2010 = _1958;
    float _2012 = _1960;
    float _2014 = -_839;
    float _2016 = fma(_2014, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2006);
    float _2018 = -_837;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2008);
    float _2022 = -_847;
    float _2024 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2010);
    float _2026 = _2020;
    float _2028 = _2024;
    float _2030 = _2016;
    float _2032 = _2012;
    if (_1636)
    {
        _841 = _2016;
    }
    float _2034 = _841;
    float _2036 = _2034;
    if (!_1636)
    {
        float _2038 = _855 * _855;
        float _2040 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2042 = -_587;
        float _2044 = _2042 + _2010;
        float _2046 = fma(_863, _863, _2038);
        float _2048 = fma(_869, _869, _2046);
        float _2050 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2052 = sqrt(_2048);
        float _2054 = 1.0 / _1752;
        float _2056 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2058 = precise::min(_2052, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2060 = _2058 * _2040;
        float _2062 = _2060 * _2054;
        float _2064 = -_509;
        float _2066 = _2064 + _2008;
        float _2068 = -_585;
        float _2070 = _2068 + _2006;
        float _2072 = _2056 * _2062;
        float _2074 = _2044 * _2062;
        float _2076 = fma(_2066, _2072, _845);
        float _2078 = fma(_2070, _2072, _851);
        float _2080 = fma(_2056, _2074, _859);
        _2026 = _2076;
        _2036 = _2078;
        _2028 = _2080;
    }
    float _2082 = _2026;
    float _2084 = _2036;
    float _2086 = _2028;
    float _2088 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2090 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2092 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2094 = abs(_1450);
    bool _2096 = _2094 != 0.0;
    bool _2098 = isnan(_2094);
    bool _2100 = _2096 || _2098;
    bool _2102 = isnan(0.0);
    bool _2104 = _2100 || _2102;
    float _2106 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2088);
    float _2108 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2090);
    float _2110 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2112 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2092);
    float _2114 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2106);
    float _2116 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2108);
    float _2118 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2110);
    float _2120 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2112);
    float _2122 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2124 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2126 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2118);
    float _2128 = _2120 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2130 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2132 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2134 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2136 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2138 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2130);
    float _2140 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2132);
    float _2142 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2134);
    float _2144 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2136);
    float _2146 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2148 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2140);
    float _2150 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2138);
    float _2152 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2142);
    float _2154 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2144);
    float _2156 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2148);
    float _2158 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2150);
    float _2160 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2152);
    float _2162 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2154);
    out.gl_Position.x = _2158;
    out.gl_Position.y = _2156;
    out.gl_Position.z = _2160;
    out.gl_Position.w = _2162;
    float _2164 = _2152;
    float _2166 = _2142;
    float _2168 = _2140;
    if (_2104)
    {
        _2164 = _2162;
    }
    float _2170 = _2164;
    float _2172 = _2170;
    if (!_2104)
    {
        _2172 = 0.0;
    }
    float _2174 = _2172;
    float _2176 = _2174;
    if (!_2104)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_1100)
    {
        int _2178 = _1156 << 4;
        int _2180 = _2178 + 2048;
        uint _2182 = uint(int(uint(_2180) >> uint(2)));
        uint _2184 = uint(int(uint(int(_2182)) >> uint(2)));
        int _2186 = int(_2182) & 3;
        float _2188 = (*spvDescriptorSet0.vp_c15)._m0[int(_2184)][_2186];
        int _2190 = int(_2182) + 1;
        uint _2192 = uint(int(uint(_2190) >> uint(2)));
        int _2194 = _2190 & 3;
        float _2196 = (*spvDescriptorSet0.vp_c15)._m0[int(_2192)][_2194];
        int _2198 = _2180 + 8;
        uint _2200 = uint(int(uint(_2198) >> uint(2)));
        uint _2202 = uint(int(uint(int(_2200)) >> uint(2)));
        int _2204 = int(_2200) & 3;
        float _2206 = (*spvDescriptorSet0.vp_c15)._m0[int(_2202)][_2204];
        int _2208 = int(_2200) + 1;
        uint _2210 = uint(int(uint(_2208) >> uint(2)));
        int _2212 = _2208 & 3;
        float _2214 = (*spvDescriptorSet0.vp_c15)._m0[int(_2210)][_2212];
        float _2216 = _887 * _2196;
        float _2218 = fma(_851, _2188, _2216);
        float _2220 = fma(_859, _2206, _2218);
        float _2222 = _2220 + _2214;
        float _2224 = precise::clamp(_2222, 0.0, 1.0);
        float _2226 = -_2224;
        float _2228 = _2226 + _1458;
        float _2230 = fma(_2228, 500.0, 1.5);
        float _2232 = exp2(_2230);
        float _2234 = 0.0 + _2232;
        float _2236 = precise::clamp(_2234, 0.0, 1.0);
        bool _2238 = _2236 >= 1.0;
        bool _2240 = isnan(_2236);
        bool _2242 = _2238 || _2240;
        bool _2244 = isnan(1.0);
        bool _2246 = _2242 || _2244;
        _2030 = _2206;
        _2166 = _2232;
        _973 = _2216;
        _2168 = as_type<float>(_2180);
        if (!_2246)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_2246)
        {
            _2176 = 0.0;
        }
    }
    float _2248 = _2030;
    float _2250 = _2166;
    float _2252 = _2176;
    float _2254 = _973;
    float _2256 = _2168;
    float _2258 = _2256;
    float _2260 = _2248;
    float _2262 = _2250;
    float _2264 = _2254;
    if (_1126)
    {
        _2258 = 1.0;
    }
    float _2266 = _2258;
    float _2268 = _2266;
    if (!_1126)
    {
        int _2270 = _1162 << 4;
        int _2272 = _2270 + 2048;
        uint _2274 = uint(int(uint(_2272) >> uint(2)));
        uint _2276 = uint(int(uint(int(_2274)) >> uint(2)));
        int _2278 = int(_2274) & 3;
        float _2280 = (*spvDescriptorSet0.vp_c15)._m0[int(_2276)][_2278];
        int _2282 = int(_2274) + 1;
        uint _2284 = uint(int(uint(_2282) >> uint(2)));
        int _2286 = _2282 & 3;
        float _2288 = (*spvDescriptorSet0.vp_c15)._m0[int(_2284)][_2286];
        int _2290 = _2272 + 8;
        uint _2292 = uint(int(uint(_2290) >> uint(2)));
        uint _2294 = uint(int(uint(int(_2292)) >> uint(2)));
        int _2296 = int(_2292) & 3;
        float _2298 = (*spvDescriptorSet0.vp_c15)._m0[int(_2294)][_2296];
        int _2300 = int(_2292) + 1;
        uint _2302 = uint(int(uint(_2300) >> uint(2)));
        int _2304 = _2300 & 3;
        float _2306 = (*spvDescriptorSet0.vp_c15)._m0[int(_2302)][_2304];
        float _2308 = _921 * _2288;
        float _2310 = fma(_851, _2280, _2308);
        float _2312 = fma(_859, _2298, _2310);
        float _2314 = _2312 + _2306;
        float _2316 = precise::clamp(_2314, 0.0, 1.0);
        float _2318 = -_2316;
        float _2320 = _2318 + _1464;
        float _2322 = fma(_2320, 500.0, 1.5);
        float _2324 = exp2(_2322);
        float _2326 = 0.0 + _2324;
        float _2328 = precise::clamp(_2326, 0.0, 1.0);
        _2260 = _2298;
        _2262 = _2324;
        _2268 = _2328;
    }
    float _2330 = _2260;
    float _2332 = _2262;
    float _2334 = _2268;
    float _2336 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2338 = _2082 + _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2342 = _2084 + _2340;
    float _2344 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2346 = _2086 + _2344;
    float _2348 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2350 = _2338 * _2338;
    float _2352 = fma(_2342, _2342, _2350);
    float _2354 = fma(_2346, _2346, _2352);
    float _2356 = rsqrt(_2354);
    float _2358 = sqrt(_2354);
    float _2360 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2362 = _2342 * _2360;
    float _2364 = _2346 * _2360;
    float _2366 = _2362 * _2362;
    float _2368 = _2364 * _2364;
    float _2370 = _2366 + _2368;
    float _2372 = sqrt(_2370);
    bool _2374 = _2372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2378 = _2372 + _2376;
    float _2380 = _2330;
    float _2382 = _2370;
    float _2384 = _2378;
    float _2386 = _2338;
    float _2388 = _2362;
    float _2390 = _2364;
    float _2392 = _2366;
    float _2394 = _2368;
    if (_2374)
    {
        float _2396 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2380 = _2396;
    }
    float _2398 = _2380;
    if (_2374)
    {
        float _2400 = rsqrt(_2370);
        _2382 = _2400;
    }
    float _2402 = _2382;
    float _2404 = _2402;
    if (_2374)
    {
        float _2406 = _2378 * _2398;
        _2384 = _2406;
    }
    float _2408 = _2384;
    if (_2374)
    {
        float _2410 = _2408 * 0.15915493667125701904296875;
        _1968 = _2410;
    }
    float _2412 = _1968;
    float _2414 = _2332;
    if (_2374)
    {
        float _2416 = _2412 * 6.283185482025146484375;
        float _2418 = cos(_2416);
        _2414 = _2418;
    }
    float _2420 = _2414;
    float _2422 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2424 = precise::max(0.0, _2422);
    float _2426 = _1458;
    float _2428 = _2422;
    float _2430 = _2424;
    if (_2374)
    {
        float _2432 = _2412 * 6.283185482025146484375;
        float _2434 = sin(_2432);
        _2426 = _2434;
    }
    float _2436 = _2426;
    float _2438 = -_2360;
    float _2440 = -_2424;
    float _2442 = fma(_2338, _2438, _2440);
    if (_2374)
    {
        float _2444 = _2442 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2386 = _2444;
    }
    float _2446 = _2386;
    float _2448 = _2446;
    if (_2374)
    {
        float _2450 = _2420 + (-1.0);
        _2428 = _2450;
    }
    float _2452 = _2428;
    float _2454 = _2452;
    if (_2374)
    {
        float _2456 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2430 = _2456;
    }
    float _2458 = _2430;
    float _2460 = _2436;
    if (_2374)
    {
        float _2462 = fma(_2436, _2446, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2460 = _2462;
    }
    float _2464 = _2460;
    if (!_2374)
    {
        _2448 = _2442;
    }
    float _2466 = _2448;
    float _2468 = _2466;
    if (_2374)
    {
        float _2470 = fma(_2442, _2420, _2458);
        _2468 = _2470;
    }
    float _2472 = _2468;
    if (_2374)
    {
        float _2474 = _2402 * _2464;
        _2454 = _2474;
    }
    float _2476 = _2454;
    if (_2374)
    {
        float _2478 = _2362 * _2476;
        _2388 = _2478;
    }
    float _2480 = _2388;
    if (_2374)
    {
        float _2482 = _2364 * _2476;
        _2390 = _2482;
    }
    float _2484 = _2390;
    if (_2374)
    {
        float _2486 = _2480 * _2480;
        _2392 = _2486;
    }
    float _2488 = _2392;
    if (_2374)
    {
        float _2490 = _2484 * _2484;
        _2394 = _2490;
    }
    float _2492 = _2394;
    float _2494 = fma(_2472, _2472, _2488);
    float _2496 = _2494 + _2492;
    float _2498 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2500 = rsqrt(_2496);
    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2504 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2502);
    float _2506 = precise::clamp(_2504, 0.0, 1.0);
    float _2508 = -_2348;
    float _2510 = fma(_2508, _2498, 1.0);
    float _2512 = -_2506;
    float _2514 = _2512 + 1.0;
    float _2516 = log2(_2510);
    float _2518 = _2500 * _2480;
    float _2520 = abs(_2514);
    float _2522 = log2(_2520);
    float _2524 = _2500 * _2472;
    float _2526 = _2500 * _2484;
    float _2528 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2530 = -_2528;
    float _2532 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2530);
    float _2534 = 1.0 / _2252;
    float _2536 = _2516 * 0.693147182464599609375;
    float _2538 = -_2526;
    float _2540 = fma(_2538, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2532);
    float _2542 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2544 = fma(_2540, -0.5, 0.5);
    float _2546 = _2522 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2548 = fma(_2540, 0.5, 0.5);
    float _2550 = _2524 + 1.0;
    float _2552 = sqrt(_2544);
    float _2554 = fma(_2548, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2556 = fma(_2548, _2554, -0.212114393711090087890625);
    float _2558 = _2158 * _2534;
    float _2560 = _2156 * _2534;
    float _2562 = exp2(_2546);
    float _2564 = fma(_2548, _2556, 1.570728778839111328125);
    float _2566 = fma(_2558, 0.5, 0.5);
    float _2568 = fma(_2560, -0.5, 0.5);
    float _2570 = _2552 * 0.636619746685028076171875;
    float _2572 = -_2524;
    float _2574 = fma(_2562, _2550, _2572);
    float _2576 = -_2564;
    float _2578 = fma(_2570, _2576, 1.0);
    float3 _7324 = float3(_2566, _2568, _2542);
    float _2580 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7324, float3(0.0), isnan(_7324)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7324, float3(0.0), isnan(_7324)), level(0.0)).x;
    float3 _7333 = float3(_2566, _2568, _2542);
    float4 _2583 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7333, float3(0.0), isnan(_7333)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7333, float3(0.0), isnan(_7333)), level(0.0)).xyzw;
    float _2585 = _2583.x;
    float _2587 = _2583.y;
    float _2589 = _2583.z;
    float _2591 = _2583.w;
    float _2593 = fma(_2574, 0.5, 0.5);
    float2 _7351 = float2(_2578, _2593);
    float3 _2597 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7351, float2(0.0), isnan(_7351)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7351, float2(0.0), isnan(_7351)), level(0.0)).xyz;
    float _2599 = _2597.x;
    float _2601 = _2597.y;
    float _2603 = _2597.z;
    bool _2605 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2607 = isnan(0.5);
    bool _2609 = _2605 || _2607;
    bool _2611 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2613 = _2609 || _2611;
    float _2615 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2617 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2619 = _2522 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2621 = -_1452;
    float _2623 = _2621 + 1.0;
    float _2625 = abs(_951);
    float _2627 = log2(_2625);
    float _2629 = _2160 + _2162;
    float _2631 = _2629 * 0.5;
    float _2633 = _2536;
    float _2635 = _2627;
    if (!_2613)
    {
        float _2637 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        _2633 = _2637;
    }
    float _2639 = _2633;
    float _2641 = exp2(_2619);
    out.m_86.z = _2631;
    out.m_86.w = _2162;
    float _2643 = _2639;
    if (!_2613)
    {
        float _2645 = _2639 * 0.15915493667125701904296875;
        _2032 = _2645;
    }
    float _2647 = _2032;
    if (!_2613)
    {
        float _2649 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        _2643 = _2649;
    }
    float _2651 = _2643;
    float _2653 = _2412;
    float _2655 = _2651;
    if (!_2613)
    {
        float _2657 = _2647 * 6.283185482025146484375;
        float _2659 = cos(_2657);
        _2653 = _2659;
    }
    float _2661 = _2653;
    if (!_2613)
    {
        float _2663 = _2651 * 0.15915493667125701904296875;
        _2264 = _2663;
    }
    float _2665 = _2264;
    if (!_2613)
    {
        float _2667 = _2647 * 6.283185482025146484375;
        float _2669 = sin(_2667);
        _2404 = _2669;
    }
    float _2671 = _2404;
    float _2673 = _2661;
    float _2675 = _2671;
    if (!_2613)
    {
        float _2677 = 1.0 / _2661;
        _2673 = _2677;
    }
    float _2679 = _2673;
    float _2681 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (_2613)
    {
        _2635 = 1.0;
    }
    float _2683 = _2635;
    float _2685 = _2464;
    float _2687 = _2683;
    if (!_2613)
    {
        float _2689 = _2665 * 6.283185482025146484375;
        float _2691 = cos(_2689);
        _2685 = _2691;
    }
    float _2693 = _2685;
    if (!_2613)
    {
        float _2695 = _2671 * _2679;
        _2675 = _2695;
    }
    float _2697 = _2675;
    float _2699 = _2697;
    if (!_2613)
    {
        float _2701 = _2665 * 6.283185482025146484375;
        float _2703 = sin(_2701);
        _2655 = _2703;
    }
    float _2705 = _2655;
    float _2707 = _2693;
    float _2709 = _2705;
    if (!_2613)
    {
        float _2711 = _2693 * _2697;
        _2707 = _2711;
    }
    float _2713 = _2707;
    if (!_2613)
    {
        _2699 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2715 = _2699;
    float _2717 = exp2(_2681);
    float _2719 = _1876 * _1942;
    float _2721 = _2715;
    if (!_2613)
    {
        float _2723 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2725 = _2715 + _2723;
        _2721 = _2725;
    }
    float _2727 = _2721;
    float _2729 = fma(_1858, _1870, _2719);
    float _2731 = _2442;
    if (!_2613)
    {
        float _2733 = 1.0 / _2713;
        _2731 = _2733;
    }
    float _2735 = _2731;
    float _2737 = _1876 * _1904;
    float _2739 = _1876 * _1896;
    float _2741 = fma(_1858, _1868, _2737);
    float _2743 = fma(_1858, _1872, _2739);
    float _2745 = _2727;
    if (!_2613)
    {
        float _2747 = 1.0 / _2727;
        _2745 = _2747;
    }
    float _2749 = _2745;
    float _2751 = fma(_2717, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2753 = precise::clamp(_2751, 0.0, 1.0);
    float _2755 = _1850 * _1904;
    float _2757 = _1850 * _1942;
    float _2759 = fma(_1844, _1758, _2741);
    float _2761 = -_1778;
    float _2763 = fma(_2761, _1868, _2755);
    float _2765 = -_1778;
    float _2767 = fma(_2765, _1870, _2757);
    if (!_2613)
    {
        float _2769 = _2705 * _2735;
        _2709 = _2769;
    }
    float _2771 = _2709;
    float _2773 = fma(_1856, _1758, _2763);
    float _2775 = fma(_1856, _1766, _2767);
    float _2777 = _2771;
    if (!_2613)
    {
        float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2781 = fma(_951, _2771, _2779);
        _2777 = _2781;
    }
    float _2783 = _2777;
    bool _2785 = _951 <= 8000.0;
    bool _2787 = isnan(_951);
    bool _2789 = _2785 || _2787;
    bool _2791 = isnan(8000.0);
    bool _2793 = _2789 || _2791;
    float _2795 = float(_2793);
    float _2797 = _2615 * _2773;
    if (!_2613)
    {
        float _2799 = _2783 * _2749;
        float _2801 = precise::clamp(_2799, 0.0, 1.0);
        _2687 = _2801;
    }
    float _2803 = _2687;
    float _2805 = _1850 * _1896;
    float _2807 = _1842 * _1904;
    float _2809 = _1842 * _1942;
    float _2811 = _1842 * _1896;
    float _2813 = -_1778;
    float _2815 = fma(_2813, _1872, _2805);
    float _2817 = fma(_1854, _1868, _2807);
    float _2819 = fma(_1854, _1870, _2809);
    float _2821 = fma(_1854, _1872, _2811);
    float _2823 = fma(_1856, _1764, _2815);
    float _2825 = fma(_1844, _1766, _2729);
    float _2827 = fma(_1848, _1766, _2819);
    float _2829 = fma(_1848, _1764, _2821);
    float _2831 = _2615 * _2823;
    float _2833 = fma(_1848, _1758, _2817);
    float _2835 = _2615 * _2775;
    float _2837 = fma(_1844, _1764, _2743);
    float _2839 = fma(_2617, _2829, _2831);
    float _2841 = fma(_2617, _2833, _2797);
    float _2843 = fma(_2617, _2827, _2835);
    float _2845 = _2837 + _2839;
    bool _2847 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2849 = isnan(_2358);
    bool _2851 = _2847 || _2849;
    bool _2853 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2855 = _2851 || _2853;
    float _2857 = fma(_2753, -2.0, 3.0);
    float _2859 = _2753 * _2753;
    float _2861 = _2759 + _2841;
    float _2863 = _2825 + _2843;
    float _2865 = _2803 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2867 = _2859 * _2857;
    out.m_88.x = _2861;
    out.m_88.y = _2863;
    out.m_88.z = _2845;
    float _2869 = -_2867;
    float _2871 = _2869 + 1.0;
    float _2873 = _2841;
    if (!_2855)
    {
        _2873 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2875 = _2873;
    float _2877 = fma(_2871, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2867);
    float _2879 = -_2641;
    float _2881 = _2879 + 1.0;
    float _2883 = _2795 * _2877;
    float _2885 = _2877;
    float _2887 = _2875;
    float _2889 = _2875;
    if (!_1368)
    {
        _2885 = 1.0;
    }
    float _2891 = _2885;
    float _2893 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2895 = _2891;
    float _2897 = _2893;
    float _2899 = _2587;
    float _2901 = _2585;
    if (_1368)
    {
        bool _2903 = _1470 >= _1448;
        bool _2905 = isnan(_1470);
        bool _2907 = _2903 || _2905;
        bool _2909 = isnan(_1448);
        bool _2911 = _2907 || _2909;
        float _2913 = float(_2911);
        _2895 = _2913;
    }
    float _2915 = _2895;
    float _2917 = _2883 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2919 = -_2893;
    float _2921 = _2919 + 1.0;
    float _2923 = _2623 * _2917;
    float _2925 = precise::clamp(_2923, 0.0, 1.0);
    float _2927 = _2915 * _2334;
    float _2929 = -_2925;
    float _2931 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2933 = -_2927;
    float _2935 = fma(_2933, _2931, 1.0);
    float _2937 = precise::clamp(_2935, 0.0, 1.0);
    float _2939 = _2937 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2941 = _2937;
    float _2943 = _2921;
    if (!_2855)
    {
        _2941 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2945 = _2941;
    out.m_90.x = _2939;
    float _2947 = _2893 * _2580;
    float _2949 = _2591 * _2921;
    float _2951 = _2945;
    float _2953 = _2945;
    if (!_2855)
    {
        _2943 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2955 = _2943;
    float _2957 = _2591 * _2947;
    float _2959 = _2955;
    float _2961 = _2955;
    if (!_2855)
    {
        _2897 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2963 = _2897;
    float _2965 = _2603 * _2947;
    float _2967 = fma(_2599, _2957, _2585);
    float _2969 = fma(_2601, _2957, _2587);
    float _2971 = _2963;
    float _2973 = _2963;
    if (!_2855)
    {
        _2899 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2975 = _2899;
    float _2977 = fma(_2591, _2965, _2589);
    float _2979 = _2975;
    float _2981 = _2975;
    if (!_2855)
    {
        _2901 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2983 = _2901;
    out.m_92.x = _2967;
    out.m_92.y = _2969;
    out.m_92.z = _2977;
    out.m_92.w = _2949;
    bool _2985 = !_2855;
    float _2987 = _2983;
    float _2989 = _2983;
    if (!_2985)
    {
        bool _2991 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2993 = isnan(_2358);
        bool _2995 = _2991 || _2993;
        bool _2997 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2999 = _2995 || _2997;
        if (!_2999)
        {
            float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3003 = _2358 + _3001;
            float _3005 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3007 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3005;
            float _3009 = 1.0 / _3007;
            float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3013 = _3011 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3017 = _3015 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3025 = _3023 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3027 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3029 = _3027 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3031 = _3003 * _3009;
            float _3033 = precise::clamp(_3031, 0.0, 1.0);
            float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3037 = _3035 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3039 = fma(_3033, _3013, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3041 = fma(_3033, _3037, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3043 = fma(_3033, _3017, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3045 = fma(_3033, _3021, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3047 = fma(_3033, _3025, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3049 = fma(_3033, _3029, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2981 = _3041;
            _2953 = _3047;
            _2961 = _3039;
            _2889 = _3045;
            _2989 = _3043;
            _2973 = _3049;
            _3051 = true;
        }
        else
        {
            bool _3053 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3055 = isnan(_2358);
            bool _3057 = _3053 || _3055;
            bool _3059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3061 = _3057 || _3059;
            if (!_3061)
            {
                _2959 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3063 = _2959;
            _2961 = _3063;
            if (!_3061)
            {
                _2979 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3065 = _2979;
            _2981 = _3065;
            if (!_3061)
            {
                _2987 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3067 = _2987;
            _2989 = _3067;
            if (!_3061)
            {
                _2887 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3069 = _2887;
            _2889 = _3069;
            if (!_3061)
            {
                _2951 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3071 = _2951;
            _2953 = _3071;
            if (!_3061)
            {
                _2971 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3073 = _2971;
            bool _3075 = !_3061;
            _2973 = _3073;
            if (!_3075)
            {
                bool _3077 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3079 = isnan(_2358);
                bool _3081 = _3077 || _3079;
                bool _3083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3085 = _3081 || _3083;
                if (!_3085)
                {
                    float _3087 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3089 = _2358 + _3087;
                    float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3093 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3091;
                    float _3095 = 1.0 / _3093;
                    float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3103 = _3101 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3117 = _3089 * _3095;
                    float _3119 = precise::clamp(_3117, 0.0, 1.0);
                    float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3123 = _3121 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3125 = fma(_3119, _3099, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3127 = fma(_3119, _3123, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3129 = fma(_3119, _3103, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3131 = fma(_3119, _3107, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3133 = fma(_3119, _3111, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3135 = fma(_3119, _3115, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2981 = _3127;
                    _2953 = _3133;
                    _2961 = _3125;
                    _2889 = _3131;
                    _2989 = _3129;
                    _2973 = _3135;
                    _3051 = true;
                }
                else
                {
                    _2981 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2953 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2961 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2889 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2989 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2973 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3051 = false;
    float _3137 = _2981;
    float _3139 = _2953;
    float _3141 = _2961;
    float _3143 = _2889;
    float _3145 = _2989;
    float _3147 = _2973;
    float _3149 = _2865 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3151 = fma(_2863, -0.5, 0.5);
    float _3153 = precise::clamp(_3151, 0.0, 1.0);
    float _3155 = -_3137;
    float _3157 = _3155 + _3139;
    float _3159 = -_3141;
    float _3161 = _3159 + _3143;
    out.m_61.x = _3149;
    float _3163 = -_3145;
    float _3165 = _3163 + _3147;
    float _3167 = fma(_3153, _3157, _3137);
    float _3169 = fma(_3153, _3161, _3141);
    bool _3171 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3173 = _3167 * 0.586610972881317138671875;
    float _3175 = fma(_3153, _3165, _3145);
    out.m_94.x = 0.0;
    bool _3177 = _2803 > 0.0;
    bool _3179 = isnan(_2803);
    bool _3181 = _3177 || _3179;
    bool _3183 = isnan(0.0);
    bool _3185 = _3181 || _3183;
    float _3187 = fma(_3169, 0.298911988735198974609375, _3173);
    float _3189 = fma(_3175, 0.114477999508380889892578125, _3187);
    float _3191 = -_3189;
    float _3193 = _3169 + _3191;
    float _3195 = -_3189;
    float _3197 = _3167 + _3195;
    float _3199 = -_3189;
    float _3201 = _3175 + _3199;
    float _3203 = fma(_3193, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3189);
    float _3205 = fma(_3197, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3189);
    float _3207 = fma(_3201, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3189);
    bool _3209 = !_3171;
    if (!_3209)
    {
        float _3211 = -_2082;
        float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3215 = -_2084;
        float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3219 = -_2086;
        float _3221 = _3219 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3223 = _3213 * _3213;
        float _3225 = fma(_3217, _3217, _3223);
        float _3227 = fma(_3221, _3221, _3225);
        float _3229 = sqrt(_3227);
        float _3231 = rsqrt(_3227);
        float _3233 = -_3229;
        float _3235 = _3233 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3237 = _3235 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3239 = precise::clamp(_3237, 0.0, 1.0);
        float _3241 = _3217 * _3231;
        float _3243 = _3213 * _3231;
        float _3245 = abs(_3239);
        float _3247 = log2(_3245);
        float _3249 = _3221 * _3231;
        float _3251 = _3241 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3253 = _2863 * _3243;
        float _3255 = -_3243;
        float _3257 = -_3251;
        float _3259 = fma(_3255, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3257);
        float _3261 = fma(_2861, _3241, _3253);
        float _3263 = -_3249;
        float _3265 = fma(_3263, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3259);
        float _3267 = fma(_2845, _3249, _3261);
        float _3269 = precise::clamp(_3267, 0.0, 1.0);
        float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3273 = _3265 + _3271;
        float _3275 = _3247 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3277 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3279 = precise::clamp(_3277, 0.0, 1.0);
        float _3281 = exp2(_3275);
        float _3283 = _3281 * _3279;
        float _3285 = _3269 * _3283;
        float _3287 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3289 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3291 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _3287;
        out.m_94.y = _3289;
        out.m_94.z = _3291;
    }
    out.m_96.x = _3203;
    out.m_96.y = _3205;
    out.m_96.z = _3207;
    if (_3185)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3293 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_61.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3293;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3051 = false;
    bool _425 = false;
    bool _313 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_58.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_61.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3350 = as_type<float>(_131);
        out.gl_Position.z = _3350;
    }
    if (!_119)
    {
        return out;
    }
    float _135 = in.m_63.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_61.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3419 = as_type<float>(_169);
        out.gl_Position.z = _3419;
    }
    if (_163)
    {
        return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _175 = as_type<int>(_171) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_171) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    float _209;
    if (!_191)
    {
        float _193 = in.m_68.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_115);
        float _215 = 1.0 / _213;
        float _217 = _149 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    bool _225 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _227 = isnan(_219);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    float _241 = -_235;
    float _243 = _241 + 1.0;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _247 = 1.0 / _239;
    float _249 = _223 * _247;
    bool _251 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _253 = isnan(_219);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _267;
    float _271 = _261 * _243;
    float _273 = fma(_265, _249, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_269, _249, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = -_261;
    float _279 = _277 + 1.0;
    float _281 = _273 * _271;
    float _283 = _275 * _271;
    float _285 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    bool _293 = !_245;
    float _311;
    if (!_293)
    {
        float _295 = in.m_68.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_115);
        float _317 = 1.0 / _315;
        float _319 = _149 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    bool _323 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _325 = isnan(_321);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _339 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _341 = isnan(_321);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _357 = _321 + _355;
    float _359 = 1.0 / _337;
    float _361 = -_333;
    float _363 = _361 + 1.0;
    bool _365 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _367 = _349 * _363;
    float _369 = -_349;
    float _371 = _369 + 1.0;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _375 = _353 * _359;
    float _377 = _373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _379 = fma(_375, _357, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _381 = _379 * _367;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _385 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[115].x, _381);
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _389 = _383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[116].x, _385);
    float _393 = in.m_70.x;
    float _395 = in.m_70.y;
    float _397 = _387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _391 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _397;
    out.m_72.y = _389;
    out.m_72.z = _377;
    out.m_72.w = _399;
    float _401 = _291 * _395;
    float _403 = _289 * _393;
    bool _405 = !_365;
    float _423;
    if (!_405)
    {
        float _407 = in.m_68.x;
        float _409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _411 = _407 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _415 = _413 * _409;
        float _417 = floor(_415);
        float _419 = -_417;
        float _421 = _415 + _419;
        _423 = _421;
        _425 = true;
    }
    else
    {
        float _427 = float(_115);
        float _429 = 1.0 / _427;
        float _431 = _149 * _429;
        _423 = _431;
    }
    _425 = false;
    float _433 = _423;
    float _435 = in.m_68.x;
    float _437 = in.m_68.y;
    float _439 = in.m_68.z;
    float _441 = in.m_68.w;
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _445 = in.m_58.x;
    float _447 = in.m_58.y;
    float _449 = in.m_58.z;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _457 = _455 != 0;
    float _459 = in.m_74.x;
    float _461 = in.m_74.y;
    float _463 = in.m_74.z;
    float _465 = in.m_74.w;
    int _467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _469 = _467 != 0;
    float _471 = 1.0 / _453;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _475 = _473 != 0;
    float _477 = in.m_76.x;
    float _479 = in.m_76.y;
    float _481 = in.m_76.z;
    float _483 = in.m_76.w;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _487 = _485 != 0;
    float _489 = in.m_78.y;
    bool _491 = _441 > 0.5;
    float _493 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _495 = _435 > 0.5;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _499 = _497 != 0;
    float _501 = _447 * _461;
    float _503 = _447 * _479;
    float _505 = fma(_445, _459, _501);
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _509 = _447 + _489;
    float _511 = fma(_445, _477, _503);
    float _513 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _517 = fma(_449, _463, _505);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _519;
    float _523 = -_507;
    float _525 = fma(_513, 2.0, _523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _529 = _433 + _527;
    float _531 = -_185;
    int _533 = _495 ? as_type<int>(_531) : as_type<int>(_185);
    float _535 = _521 * _471;
    bool _537 = _437 > 0.5;
    float _539 = fma(_449, _481, _511);
    float _541 = fma(_535, _529, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _543 = -_189;
    int _545 = _537 ? as_type<int>(_543) : as_type<int>(_189);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _549 = _521;
    if (!_499)
    {
        _549 = _439;
    }
    float _551 = _549;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _555 = _551;
    if (_499)
    {
        _555 = _437;
    }
    float _557 = _555;
    float _559 = fma(_493, -2.0, _547);
    bool _561 = !_457;
    float _563 = _561 ? _185 : as_type<float>(_533);
    float _565 = _443 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _567 = !_469;
    float _569 = _567 ? _189 : as_type<float>(_545);
    float _571 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[83].w, _553);
    float _573 = _515 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _575 = -_149;
    float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[76].x, _525);
    float _579 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _559);
    float _581 = _563 + 0.5;
    float _583 = _569 + (-0.5);
    float _585 = _539 + _483;
    float _587 = _517 + _465;
    float _589 = fma(_565, _581, _577);
    float _591 = -_573;
    float _593 = -_579;
    float _595 = fma(_591, _583, _593);
    float _597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _599 = _565;
    if (!_499)
    {
        _599 = _437;
    }
    float _601 = _599;
    float _603 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _571);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _607 = _601;
    if (_499)
    {
        _607 = _435;
    }
    float _609 = _607;
    float _611 = -_603;
    float _613 = _611 + 1.0;
    bool _615 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _617 = isnan(_433);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _629 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _631 = isnan(_433);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = _609 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _643 = _439 > 0.5;
    float _645 = -_625;
    float _647 = _645 + 1.0;
    float _649 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[83].z, _605);
    float _651 = _609;
    if (!_499)
    {
        _651 = _439;
    }
    float _653 = _651;
    float _655 = -_627;
    float _657 = fma(_641, 2.0, _655);
    float _659 = _639 * _647;
    float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _663 = _653;
    if (_499)
    {
        _663 = _437;
    }
    float _665 = _663;
    float _667 = _541 * _659;
    float _669 = -_185;
    int _671 = _643 ? as_type<int>(_669) : as_type<int>(_185);
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _675 = -_639;
    float _677 = _675 + 1.0;
    float _679 = _665 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _681 = !_475;
    float _683 = _681 ? _185 : as_type<float>(_671);
    float _685 = _597 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _687 = -_149;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[81].x, _657);
    float _691 = fma(_679, -2.0, _673);
    float _693 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[131].x, _667);
    float _695 = _683 + 0.5;
    float _697 = -_189;
    int _699 = _491 ? as_type<int>(_697) : as_type<int>(_189);
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _703 = _509 + _701;
    float _705 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _649);
    float _707 = fma(_685, _695, _689);
    bool _709 = !_487;
    float _711 = _709 ? _189 : as_type<float>(_699);
    float _713 = _703 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _715 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _717 = _585 + _715;
    float _719 = _661 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _721 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _691);
    float _723 = _711 + (-0.5);
    float _725 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[28].x, _713);
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _731 = _587 + _729;
    float _733 = -_719;
    float _735 = -_721;
    float _737 = fma(_733, _723, _735);
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _741 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].w, _727);
    float _743 = -_705;
    float _745 = _743 + 1.0;
    float _747 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[28].z, _725);
    float _749 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].z, _739);
    float _751 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _741);
    float _753 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[132].x, _693);
    float _755 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _749);
    float _757 = -_751;
    float _759 = _757 + 1.0;
    bool _761 = _747 >= 0.0;
    float _763 = -_755;
    float _765 = _763 + 1.0;
    float _767 = fma(_569, _759, _595);
    float _769 = -_745;
    float _771 = fma(_683, _769, _707);
    float _773 = _703 * _703;
    float _775 = -_765;
    float _777 = fma(_563, _775, _589);
    float _779 = fma(_711, _613, _737);
    float _781 = fma(_717, _717, _773);
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _785 = fma(_731, _731, _781);
    float _787 = _727;
    float _789 = _771;
    if (_761)
    {
        _787 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _791 = _787;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _797 = _753 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _799 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _801 = rsqrt(_785);
    float _803 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _807 = as_type<int>(_791);
    if (_761)
    {
        float _809 = _791 * 5.0;
        _807 = as_type<int>(_809);
    }
    int _811 = _807;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _815 = _813 != 0;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _819 = _817 != 0;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _823 = _821 != 0;
    out.m_80.x = _777;
    out.m_80.y = _767;
    out.m_80.z = _771;
    out.m_80.w = _779;
    out.m_82.x = _803;
    out.m_82.y = _799;
    out.m_82.z = _805;
    out.m_82.w = _797;
    bool _825 = !_815;
    int _827 = _825 ? 0 : 1;
    bool _829 = !_819;
    int _831 = _829 ? 0 : 1;
    if (_761)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4523 = as_type<float>(_811);
        out.gl_Position.z = _4523;
    }
    bool _833 = !_823;
    int _835 = _833 ? 0 : 1;
    float _837 = _703 * _801;
    float _839 = _717 * _801;
    float _841 = _837;
    if (_761)
    {
        out.m_61.x = 0.0;
    }
    if (_761)
    {
        return out;
    }
    float _843 = -_837;
    float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[18].w, _509);
    float _847 = _731 * _801;
    float _849 = -_839;
    float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _585);
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _855 = _845 + _853;
    float _857 = -_847;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[18].w, _587);
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _863 = _851 + _861;
    float _865 = _855 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _869 = _859 + _867;
    float _871 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[28].x, _865);
    float _873 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[28].z, _871);
    bool _875 = _873 >= 0.0;
    if (_875)
    {
        _789 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _877 = _789;
    int _879 = as_type<int>(_877);
    if (_875)
    {
        out.m_61.x = 0.0;
    }
    if (_875)
    {
        float _881 = _877 * 5.0;
        _879 = as_type<int>(_881);
    }
    int _883 = _879;
    if (_875)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4628 = as_type<float>(_883);
        out.gl_Position.z = _4628;
    }
    if (_875)
    {
        return out;
    }
    float _885 = _845 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _887 = _845 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _889 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[11].x, _885);
    float _891 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[11].z, _889);
    float _893 = _845 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _895 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _897 = _891 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _899 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[10].x, _893);
    float _901 = 1.0 / _897;
    float _903 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[10].z, _899);
    float _905 = _903 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _907 = _905 + _897;
    float _909 = _851 * (*spvDescriptorSet0.vp_c15)._m0[127].x;
    float _911 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[127].y, _909);
    float _913 = _907 * _901;
    float _915 = _913 * 0.5;
    float _917 = _851 * (*spvDescriptorSet0.vp_c15)._m0[126].x;
    float _919 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[127].z, _911);
    float _921 = _845 + _895;
    float _923 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _925 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[30].w, _923);
    float _927 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[126].y, _917);
    float _929 = _919 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _931 = fma(_921, (*spvDescriptorSet0.vp_c15)._m0[126].y, _917);
    float _933 = fma(_921, (*spvDescriptorSet0.vp_c15)._m0[127].y, _909);
    float _935 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[126].z, _927);
    float _937 = 1.0 / _925;
    float _939 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[127].z, _933);
    float _941 = _935 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _943 = _939 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _945 = trunc(_943);
    int _947 = int(_945);
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _951 = _937 * _949;
    float _953 = trunc(_941);
    int _955 = int(_953);
    bool _957 = _951 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _959 = _951 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _961 = !_957;
    int _963 = _961 ? 0 : 1;
    int _965 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _967 = _947 + _965;
    int _969 = _967 + 1;
    int _971 = 2;
    float _973 = _887;
    if (!_957)
    {
        _971 = 1;
    }
    int _975 = _971;
    int _977 = _975;
    if (!_959)
    {
        _977 = _963;
    }
    int _979 = _977;
    float _981 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[126].z, _931);
    int _983 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _985 = _955 + _983;
    int _987 = _985 + 1;
    float _989 = trunc(_929);
    int _991 = int(_989);
    int _993 = _979 << 6;
    float _995 = _981 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _997 = _987 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _999 = _993 + 96;
    uint _1002 = uint(int(uint(_999) >> uint(2)));
    uint _1004 = uint(int(uint(int(_1002)) >> uint(2)));
    int _1006 = int(_1002) & 3;
    float _1008 = (*spvDescriptorSet0.vp_c15)._m0[int(_1004)][_1006];
    int _1010 = int(_1002) + 1;
    uint _1012 = uint(int(uint(_1010) >> uint(2)));
    int _1014 = _1010 & 3;
    float _1016 = (*spvDescriptorSet0.vp_c15)._m0[int(_1012)][_1014];
    float _1018 = trunc(_995);
    int _1020 = int(_1018);
    int _1022 = _993 + 104;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    uint _1026 = uint(int(uint(int(_1024)) >> uint(2)));
    int _1028 = int(_1024) & 3;
    float _1030 = (*spvDescriptorSet0.vp_c15)._m0[int(_1026)][_1028];
    int _1032 = int(_1024) + 1;
    uint _1034 = uint(int(uint(_1032) >> uint(2)));
    int _1036 = _1032 & 3;
    float _1038 = (*spvDescriptorSet0.vp_c15)._m0[int(_1034)][_1036];
    int _1040 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1042 = _991 + _1040;
    int _1044 = _1042 + 1;
    int _1046 = _987 | _1044;
    int _1048 = _993 + 48;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    uint _1052 = uint(int(uint(int(_1050)) >> uint(2)));
    int _1054 = int(_1050) & 3;
    float _1056 = (*spvDescriptorSet0.vp_c15)._m0[int(_1052)][_1054];
    int _1058 = int(_1050) + 1;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    int _1062 = _1058 & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    int _1066 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1068 = _1020 + _1066;
    int _1070 = _1068 + 1;
    bool _1072 = _1046 < 0;
    bool _1074 = _1072 || _997;
    bool _1076 = _1070 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1078 = _993 + 64;
    uint _1080 = uint(int(uint(_1078) >> uint(2)));
    uint _1082 = uint(int(uint(int(_1080)) >> uint(2)));
    int _1084 = int(_1080) & 3;
    float _1086 = (*spvDescriptorSet0.vp_c15)._m0[int(_1082)][_1084];
    int _1088 = int(_1080) + 1;
    uint _1090 = uint(int(uint(_1088) >> uint(2)));
    int _1092 = _1088 & 3;
    float _1094 = (*spvDescriptorSet0.vp_c15)._m0[int(_1090)][_1092];
    int _1096 = _1070 | _969;
    bool _1098 = _1044 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1100 = _1098 || _1074;
    bool _1102 = _1096 < 0;
    bool _1104 = _1102 || _1076;
    int _1106 = _993 + 56;
    uint _1108 = uint(int(uint(_1106) >> uint(2)));
    uint _1110 = uint(int(uint(int(_1108)) >> uint(2)));
    int _1112 = int(_1108) & 3;
    float _1114 = (*spvDescriptorSet0.vp_c15)._m0[int(_1110)][_1112];
    int _1116 = int(_1108) + 1;
    uint _1118 = uint(int(uint(_1116) >> uint(2)));
    int _1120 = _1116 & 3;
    float _1122 = (*spvDescriptorSet0.vp_c15)._m0[int(_1118)][_1120];
    bool _1124 = _969 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1126 = _1124 || _1104;
    int _1128 = _993 + 72;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
    int _1134 = int(_1130) & 3;
    float _1136 = (*spvDescriptorSet0.vp_c15)._m0[int(_1132)][_1134];
    int _1138 = int(_1130) + 1;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    int _1142 = _1138 & 3;
    float _1144 = (*spvDescriptorSet0.vp_c15)._m0[int(_1140)][_1142];
    int _1146 = _987;
    int _1148 = _1044;
    float _1150 = as_type<float>(_979);
    if (!_1100)
    {
        int _1152 = _1044 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1154 = _1152 + _987;
        _1146 = _1154;
    }
    int _1156 = _1146;
    if (!_1126)
    {
        int _1158 = _969 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1160 = _1158 + _1070;
        _1148 = _1160;
    }
    int _1162 = _1148;
    float _1164 = _921 * _1016;
    int _1166 = as_type<int>(_1016);
    int _1168 = as_type<int>(_1008);
    float _1170 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (!_1100)
    {
        int _1172 = _1156 << 2;
        _1166 = _1172;
    }
    int _1174 = _1166;
    int _1176 = 0;
    int _1178 = _1174;
    if (!_1126)
    {
        int _1180 = _1162 << 2;
        _1176 = _1180;
    }
    int _1182 = _1176;
    float _1184 = fma(_851, _1008, _1164);
    int _1186 = _1182;
    if (!_1100)
    {
        uint _1188 = uint(int(uint(_1156) >> uint(2)));
        _1168 = int(_1188);
    }
    int _1190 = _1168;
    float _1192 = fma(_851, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1194 = _1192;
    if (!_1100)
    {
        int _1196 = 12 & _1174;
        _1178 = _1196;
    }
    int _1198 = _1178;
    float _1200 = fma(_859, _1030, _1184);
    int _1202 = 0;
    if (!_1126)
    {
        uint _1204 = uint(int(uint(_1162) >> uint(2)));
        _1202 = int(_1204);
    }
    int _1206 = _1202;
    float _1208 = floor(_1192);
    if (!_1126)
    {
        int _1210 = 12 & _1182;
        _1186 = _1210;
    }
    int _1212 = _1186;
    if (!_1100)
    {
        int _1214 = _1190 << 4;
        int _1216 = _1214 + _1198;
        _1170 = as_type<float>(_1216);
    }
    float _1218 = _1170;
    int _1220 = 0;
    if (!_1126)
    {
        int _1222 = _1206 << 4;
        int _1224 = _1222 + _1212;
        _1220 = _1224;
    }
    int _1226 = _1220;
    float _1228 = _1200 + _1038;
    int _1230 = _993 + 80;
    uint _1232 = uint(int(uint(_1230) >> uint(2)));
    uint _1234 = uint(int(uint(int(_1232)) >> uint(2)));
    int _1236 = int(_1232) & 3;
    float _1238 = (*spvDescriptorSet0.vp_c15)._m0[int(_1234)][_1236];
    int _1240 = int(_1232) + 1;
    uint _1242 = uint(int(uint(_1240) >> uint(2)));
    int _1244 = _1240 & 3;
    float _1246 = (*spvDescriptorSet0.vp_c15)._m0[int(_1242)][_1244];
    float _1248 = _921 * _1064;
    float _1250 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1252 = 1.0 / _1228;
    float _1254 = fma(_851, _1056, _1248);
    float _1256 = _921 * _1094;
    float _1258 = _1218;
    float _1260 = _1250;
    if (!_1100)
    {
        int _1262 = as_type<int>(_1218) + 400;
        uint _1264 = uint(int(uint(_1262) >> uint(2)));
        uint _1266 = uint(int(uint(int(_1264)) >> uint(2)));
        int _1268 = int(_1264) & 3;
        float _1270 = (*spvDescriptorSet0.vp_c15)._m0[int(_1266)][_1268];
        _1258 = _1270;
    }
    float _1272 = _1258;
    float _1274 = -_1208;
    float _1276 = _1192 + _1274;
    float _1278 = fma(_851, _1086, _1256);
    float _1280 = floor(_1250);
    float _1282 = fma(_859, _1114, _1254);
    float _1284 = _1200;
    if (!_1126)
    {
        int _1286 = _1226 + 400;
        uint _1288 = uint(int(uint(_1286) >> uint(2)));
        uint _1290 = uint(int(uint(int(_1288)) >> uint(2)));
        int _1292 = int(_1288) & 3;
        float _1294 = (*spvDescriptorSet0.vp_c15)._m0[int(_1290)][_1292];
        _1284 = _1294;
    }
    float _1296 = _1284;
    float _1298 = _1282 + _1122;
    float _1300 = _1122;
    if (!_1126)
    {
        float _1302 = floor(_943);
        _1300 = _1302;
    }
    float _1304 = _1300;
    float _1306 = fma(_859, _1136, _1278);
    int _1308 = _993 + 88;
    uint _1310 = uint(int(uint(_1308) >> uint(2)));
    uint _1312 = uint(int(uint(int(_1310)) >> uint(2)));
    int _1314 = int(_1310) & 3;
    float _1316 = (*spvDescriptorSet0.vp_c15)._m0[int(_1312)][_1314];
    int _1318 = int(_1310) + 1;
    uint _1320 = uint(int(uint(_1318) >> uint(2)));
    int _1322 = _1318 & 3;
    float _1324 = (*spvDescriptorSet0.vp_c15)._m0[int(_1320)][_1322];
    float _1326 = _1298 * _1252;
    float _1328 = _1306 + _1144;
    float _1330 = _1254;
    if (!_1100)
    {
        float _1332 = floor(_941);
        _1330 = _1332;
    }
    float _1334 = _1330;
    bool _1336 = _1326 >= 0.0;
    float _1338 = _1328 * _1252;
    float _1340 = -_1280;
    float _1342 = _1250 + _1340;
    bool _1344 = _1326 <= 1.0;
    bool _1346 = _1344 && _1336;
    float _1348 = _1256;
    if (!_1100)
    {
        float _1350 = floor(_929);
        _1348 = _1350;
    }
    float _1352 = _1348;
    bool _1354 = _1338 >= 0.0;
    bool _1356 = _1354 && _1346;
    float _1358 = _1304;
    if (!_1126)
    {
        float _1360 = -_1304;
        float _1362 = _943 + _1360;
        _1194 = _1362;
    }
    float _1364 = _1194;
    bool _1366 = _1338 <= 1.0;
    bool _1368 = _1366 && _1356;
    float _1370 = _1144;
    if (!_1126)
    {
        float _1372 = floor(_995);
        _1370 = _1372;
    }
    float _1374 = _1370;
    if (!_1100)
    {
        float _1376 = -_1334;
        float _1378 = _941 + _1376;
        _1358 = _1378;
    }
    float _1380 = _1358;
    float _1382 = _921 * _1246;
    float _1384 = fma(_851, _1238, _1382);
    float _1386 = _1352;
    if (!_1100)
    {
        float _1388 = -_1352;
        float _1390 = _929 + _1388;
        _1386 = _1390;
    }
    float _1392 = _1386;
    if (_1368)
    {
        float _1394 = float(_979);
        _1150 = _1394;
    }
    float _1396 = _1150;
    float _1398 = _1298;
    if (!_1100)
    {
        float _1400 = rint(_1272);
        float _1402 = precise::max(_1400, 0.0);
        uint _1404 = uint(_1402);
        uint _1406 = clamp(_1404, 0u, 65535u);
        _1398 = as_type<float>(_1406);
    }
    float _1408 = _1398;
    if (!_1126)
    {
        float _1410 = -_1374;
        float _1412 = _995 + _1410;
        _1260 = _1412;
    }
    float _1414 = _1260;
    float _1416 = _1296;
    if (!_1126)
    {
        float _1418 = rint(_1296);
        float _1420 = precise::max(_1418, 0.0);
        uint _1422 = uint(_1420);
        uint _1424 = clamp(_1422, 0u, 65535u);
        _1416 = as_type<float>(_1424);
    }
    float _1426 = _1416;
    float _1428 = _1382;
    if (_1368)
    {
        float _1430 = rint(_1396);
        float _1432 = precise::max(_1430, 0.0);
        uint _1434 = uint(_1432);
        uint _1436 = clamp(_1434, 0u, 65535u);
        _1428 = as_type<float>(_1436);
    }
    float _1438 = _1428;
    float _1440 = fma(_859, _1316, _1384);
    float _1442 = fma(_859, 6.2500002968590706586837768554688e-05, 0.5);
    float _1444 = _1440 + _1324;
    float _1446 = fma(_851, 6.2500002968590706586837768554688e-05, 0.5);
    float _1448 = _1444 * _1252;
    float2 _5568 = float2(_1446, _1442);
    float _1450 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_5568, float2(0.0), isnan(_5568)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_5568, float2(0.0), isnan(_5568)), level(0.0)).x;
    float2 _5578 = float2(_1276, _1342);
    float _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5578, float2(0.0), isnan(_5578)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5578, float2(0.0), isnan(_5578)), level(0.0)).x;
    float _1454 = _1408;
    if (!_1100)
    {
        float3 _5593 = float3(_1380, _1392, float(as_type<int>(_1408)));
        float3 _5597 = select(_5593, float3(0.0), isnan(_5593));
        float _1456 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5597.xy, uint(rint(_5597.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5597.xy, uint(rint(_5597.z)), level(0.0)).x;
        _1454 = _1456;
    }
    float _1458 = _1454;
    float _1460 = _1426;
    if (!_1126)
    {
        float3 _5613 = float3(_1414, _1364, float(as_type<int>(_1426)));
        float3 _5615 = select(_5613, float3(0.0), isnan(_5613));
        float _1462 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5615.xy, uint(rint(_5615.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5615.xy, uint(rint(_5615.z)), level(0.0)).x;
        _1460 = _1462;
    }
    float _1464 = _1460;
    float _1466 = _1338;
    if (_1368)
    {
        float3 _5630 = float3(_1326, _1338, float(as_type<int>(_1438)));
        float3 _5632 = select(_5630, float3(0.0), isnan(_5630));
        float _1468 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5632.xy, uint(rint(_5632.z)), _1448, level(0.0));
        _1466 = _1468;
    }
    float _1470 = _1466;
    float _1472 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1474 = log2(_1472);
    float _1476 = _435 * 2.0;
    float _1478 = _439 * 2.0;
    float _1480 = _437 + _439;
    int _1482 = abs(_827);
    float _1484 = -_837;
    float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[18].w, _703);
    int _1488 = abs(_831);
    float _1490 = -_839;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[18].w, _717);
    float _1494 = floor(_1478);
    float _1496 = -_847;
    float _1498 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[18].w, _731);
    int _1500 = abs(_835);
    float _1502 = floor(_1476);
    float _1504 = _1474 * _149;
    float _1506 = _1480 + (-1.0);
    float _1508 = _437 + _435;
    float _1510 = _437 * 2.0;
    float _1512 = _1508 + (-1.0);
    float _1514 = exp2(_1504);
    bool _1516 = _1494 > 0.0;
    float _1518 = _1486 * _1486;
    bool _1520 = _1494 >= 0.0;
    bool _1522 = isnan(_1494);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan(0.0);
    bool _1528 = _1524 || _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1532 = 1.0 + _1530;
    float _1534 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1536 = float(_1482);
    bool _1538 = _1502 > 0.0;
    float _1540 = in.m_84.x;
    float _1542 = in.m_84.y;
    float _1544 = in.m_84.z;
    bool _1546 = _1502 >= 0.0;
    bool _1548 = isnan(_1502);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    float _1556 = 1.0 / _1532;
    int _1558 = _1528 ? 0 : 1;
    float _1560 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1562 = _1554 ? 0 : 1;
    float _1564 = _437 + (-0.5);
    bool _1566 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1568 = isnan(1.0);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1574 = _1570 || _1572;
    float _1576 = -_1514;
    float _1578 = _1576 + 1.0;
    int _1580 = ~_1558;
    int _1582 = _1580 + 1;
    int _1584 = _1582 + 1;
    float _1586 = floor(_1510);
    int _1588 = ~_1562;
    int _1590 = _1588 + 1;
    int _1592 = _1590 + 1;
    int _1594 = _1584;
    int _1596 = _1592;
    if (!_1516)
    {
        int _1598 = ~_1558;
        int _1600 = _1598 + 1;
        _1594 = _1600;
    }
    int _1602 = _1594;
    if (!_1538)
    {
        int _1604 = ~_1562;
        int _1606 = _1604 + 1;
        _1596 = _1606;
    }
    int _1608 = _1596;
    bool _1610 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1612 = isnan(0.0);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1618 = _1614 || _1616;
    float _1620 = float(_1602);
    float _1622 = _1618 ? _1578 : 0.0;
    float _1624 = float(_1608);
    float _1626 = _1536 * _1620;
    bool _1628 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1630 = isnan(0.5);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1636 = _1632 || _1634;
    if (_1574)
    {
        float _1638 = _1622 * _1556;
        _153 = _1638;
    }
    float _1640 = _153;
    float _1642 = _1626 * (-2.0);
    float _1644 = fma(_1492, _1492, _1518);
    bool _1646 = _1586 > 0.0;
    float _1648 = _435 + (-0.5);
    float _1650 = fma(_1642, _1540, _1540);
    float _1652 = float(_1488);
    float _1654 = fma(_1534, _1642, _1534);
    bool _1656 = _1586 >= 0.0;
    bool _1658 = isnan(_1586);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan(0.0);
    bool _1664 = _1660 || _1662;
    float _1666 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1650);
    float _1668 = fma(_1498, _1498, _1644);
    float _1670 = _1652 * _1624;
    int _1672 = _1664 ? 0 : 1;
    float _1674 = fma(_1654, _1640, _1666);
    float _1676 = _439 + _435;
    float _1678 = _1670 * (-2.0);
    int _1680 = ~_1672;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = _1674 * 0.15915493667125701904296875;
    int _1688 = _1684;
    if (!_1646)
    {
        int _1690 = ~_1672;
        int _1692 = _1690 + 1;
        _1688 = _1692;
    }
    int _1694 = _1688;
    float _1696 = -_509;
    float _1698 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1700 = fma(_1678, _1542, _1542);
    float _1702 = sqrt(_1668);
    float _1704 = _1698 * _1698;
    float _1706 = float(_1500);
    float _1708 = -_585;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1712 = fma(_1560, _1678, _1560);
    float _1714 = -_587;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1718 = float(_1694);
    float _1720 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1700);
    float _1722 = fma(_1710, _1710, _1704);
    float _1724 = _1676 + (-1.0);
    float _1726 = _1706 * _1718;
    float _1728 = fma(_1712, _1640, _1720);
    float _1730 = fma(_1716, _1716, _1722);
    float _1732 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1734 = _1726 * (-2.0);
    float _1736 = _439 + (-0.5);
    float _1738 = rsqrt(_1730);
    float _1740 = fma(_1734, _1544, _1544);
    float _1742 = fma(_1732, _1734, _1732);
    float _1744 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1740);
    float _1746 = _1686 * 6.283185482025146484375;
    float _1748 = sin(_1746);
    float _1750 = fma(_1742, _1640, _1744);
    float _1752 = _801 * _1702;
    float _1754 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1756 = _1750 * 0.15915493667125701904296875;
    float _1758 = _1710 * _1738;
    float _1760 = _1686 * 6.283185482025146484375;
    float _1762 = cos(_1760);
    float _1764 = _1716 * _1738;
    float _1766 = _1698 * _1738;
    float _1768 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1770 = _1764 * _1768;
    float _1772 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1774 = _1766 * _1772;
    float _1776 = _1756 * 6.283185482025146484375;
    float _1778 = sin(_1776);
    float _1780 = _1728 * 0.15915493667125701904296875;
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1784 = _1758 * _1782;
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1788 = -_1770;
    float _1790 = fma(_1766, _1786, _1788);
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1794 = -_1774;
    float _1796 = fma(_1758, _1792, _1794);
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1800 = -_1784;
    float _1802 = fma(_1764, _1798, _1800);
    float _1804 = _1780 * 6.283185482025146484375;
    float _1806 = sin(_1804);
    float _1808 = _1802 * _1802;
    float _1810 = fma(_1790, _1790, _1808);
    float _1812 = _1780 * 6.283185482025146484375;
    float _1814 = cos(_1812);
    float _1816 = fma(_1796, _1796, _1810);
    float _1818 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1820 = _1752 * _1818;
    float _1822 = _1756 * 6.283185482025146484375;
    float _1824 = cos(_1822);
    float _1826 = _1748 * _1806;
    float _1828 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1830 = _1762 * _1806;
    float _1832 = _1752 * _1828;
    float _1834 = rsqrt(_1816);
    float _1836 = _1762 * _1814;
    float _1838 = _1754 * _1832;
    float _1840 = _1748 * _1814;
    float _1842 = fma(_1778, _1836, _1826);
    float _1844 = fma(_1778, _1826, _1836);
    float _1846 = -_1830;
    float _1848 = fma(_1778, _1840, _1846);
    float _1850 = _1762 * _1824;
    float _1852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _1854 = _1814 * _1824;
    float _1856 = _1748 * _1824;
    float _1858 = _1806 * _1824;
    float _1860 = _1852 * _1820;
    float _1862 = _1850 * _1838;
    float _1864 = -_1838;
    float _1866 = _1778 * _1864;
    float _1868 = _1790 * _1834;
    float _1870 = _1802 * _1834;
    float _1872 = _1796 * _1834;
    float _1874 = -_1840;
    float _1876 = fma(_1778, _1830, _1874);
    float _1878 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1880 = _1878 * 0.5;
    float _1882 = fma(_1842, _1860, _1862);
    float _1884 = _1766 * _1868;
    float _1886 = _1856 * _1838;
    float _1888 = fma(_1854, _1860, _1866);
    float _1890 = fma(_1876, _1880, _1882);
    float _1892 = _1764 * _1870;
    float _1894 = -_1884;
    float _1896 = fma(_1758, _1870, _1894);
    float _1898 = fma(_1848, _1860, _1886);
    float _1900 = fma(_1858, _1880, _1888);
    float _1902 = -_1892;
    float _1904 = fma(_1766, _1872, _1902);
    float _1906 = _1896 * _1890;
    float _1908 = fma(_1844, _1880, _1898);
    float _1910 = _1904 * _1890;
    float _1912 = fma(_1872, _1900, _1906);
    float _1914 = fma(_1868, _1900, _1910);
    float _1916 = fma(_1764, _1908, _1912);
    float _1918 = fma(_1758, _1908, _1914);
    float _1920 = _587 + _1916;
    float _1922 = _585 + _1918;
    float _1924 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1926 = _1920 + _1924;
    float _1928 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1930 = _1922 + _1928;
    float _1932 = _1926 * _1926;
    float _1934 = fma(_1930, _1930, _1932);
    float _1936 = _1758 * _1872;
    float _1938 = sqrt(_1934);
    float _1940 = -_1936;
    float _1942 = fma(_1764, _1868, _1940);
    float _1944 = _1942 * _1890;
    float _1946 = fma(_1870, _1900, _1944);
    float _1948 = fma(_1766, _1908, _1946);
    bool _1950 = _1938 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1952 = _509 + _1948;
    float _1954 = _1900;
    float _1956 = _1952;
    float _1958 = _1920;
    float _1960 = _1934;
    if (!_1950)
    {
        _1954 = _1922;
    }
    float _1962 = _1954;
    bool _1964 = !_1950;
    float _1966 = _1962;
    float _1968 = _1464;
    if (!_1964)
    {
        float _1970 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1974 = _1938 + _1972;
        float _1976 = _1952 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1978 = rsqrt(_1934);
        float _1980 = _1974 * _1970;
        float _1982 = _1980 * 0.15915493667125701904296875;
        float _1984 = _1982 * 6.283185482025146484375;
        float _1986 = cos(_1984);
        float _1988 = _1982 * 6.283185482025146484375;
        float _1990 = sin(_1988);
        float _1992 = _1986 + (-1.0);
        float _1994 = fma(_1990, _1976, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1996 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1998 = _1978 * _1994;
        float _2000 = fma(_1952, _1986, _1996);
        float _2002 = fma(_1930, _1998, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2004 = fma(_1926, _1998, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1966 = _2002;
        _1956 = _2000;
        _1958 = _2004;
        _1960 = _1978;
    }
    float _2006 = _1966;
    float _2008 = _1956;
    float _2010 = _1958;
    float _2012 = _1960;
    float _2014 = -_839;
    float _2016 = fma(_2014, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2006);
    float _2018 = -_837;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2008);
    float _2022 = -_847;
    float _2024 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2010);
    float _2026 = _2020;
    float _2028 = _2024;
    float _2030 = _2016;
    float _2032 = _2012;
    if (_1636)
    {
        _841 = _2016;
    }
    float _2034 = _841;
    float _2036 = _2034;
    if (!_1636)
    {
        float _2038 = _855 * _855;
        float _2040 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2042 = -_587;
        float _2044 = _2042 + _2010;
        float _2046 = fma(_863, _863, _2038);
        float _2048 = fma(_869, _869, _2046);
        float _2050 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2052 = sqrt(_2048);
        float _2054 = 1.0 / _1752;
        float _2056 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2058 = precise::min(_2052, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2060 = _2058 * _2040;
        float _2062 = _2060 * _2054;
        float _2064 = -_509;
        float _2066 = _2064 + _2008;
        float _2068 = -_585;
        float _2070 = _2068 + _2006;
        float _2072 = _2056 * _2062;
        float _2074 = _2044 * _2062;
        float _2076 = fma(_2066, _2072, _845);
        float _2078 = fma(_2070, _2072, _851);
        float _2080 = fma(_2056, _2074, _859);
        _2026 = _2076;
        _2036 = _2078;
        _2028 = _2080;
    }
    float _2082 = _2026;
    float _2084 = _2036;
    float _2086 = _2028;
    float _2088 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2090 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2092 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2094 = abs(_1450);
    bool _2096 = _2094 != 0.0;
    bool _2098 = isnan(_2094);
    bool _2100 = _2096 || _2098;
    bool _2102 = isnan(0.0);
    bool _2104 = _2100 || _2102;
    float _2106 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2088);
    float _2108 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2090);
    float _2110 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2112 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2092);
    float _2114 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2106);
    float _2116 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2108);
    float _2118 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2110);
    float _2120 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2112);
    float _2122 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2124 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2126 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2118);
    float _2128 = _2120 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2130 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2132 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2134 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2136 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2138 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2130);
    float _2140 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2132);
    float _2142 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2134);
    float _2144 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2136);
    float _2146 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2148 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2140);
    float _2150 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2138);
    float _2152 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2142);
    float _2154 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2144);
    float _2156 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2148);
    float _2158 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2150);
    float _2160 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2152);
    float _2162 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2154);
    out.gl_Position.x = _2158;
    out.gl_Position.y = _2156;
    out.gl_Position.z = _2160;
    out.gl_Position.w = _2162;
    float _2164 = _2152;
    float _2166 = _2142;
    float _2168 = _2140;
    if (_2104)
    {
        _2164 = _2162;
    }
    float _2170 = _2164;
    float _2172 = _2170;
    if (!_2104)
    {
        _2172 = 0.0;
    }
    float _2174 = _2172;
    float _2176 = _2174;
    if (!_2104)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_1100)
    {
        int _2178 = _1156 << 4;
        int _2180 = _2178 + 2048;
        uint _2182 = uint(int(uint(_2180) >> uint(2)));
        uint _2184 = uint(int(uint(int(_2182)) >> uint(2)));
        int _2186 = int(_2182) & 3;
        float _2188 = (*spvDescriptorSet0.vp_c15)._m0[int(_2184)][_2186];
        int _2190 = int(_2182) + 1;
        uint _2192 = uint(int(uint(_2190) >> uint(2)));
        int _2194 = _2190 & 3;
        float _2196 = (*spvDescriptorSet0.vp_c15)._m0[int(_2192)][_2194];
        int _2198 = _2180 + 8;
        uint _2200 = uint(int(uint(_2198) >> uint(2)));
        uint _2202 = uint(int(uint(int(_2200)) >> uint(2)));
        int _2204 = int(_2200) & 3;
        float _2206 = (*spvDescriptorSet0.vp_c15)._m0[int(_2202)][_2204];
        int _2208 = int(_2200) + 1;
        uint _2210 = uint(int(uint(_2208) >> uint(2)));
        int _2212 = _2208 & 3;
        float _2214 = (*spvDescriptorSet0.vp_c15)._m0[int(_2210)][_2212];
        float _2216 = _887 * _2196;
        float _2218 = fma(_851, _2188, _2216);
        float _2220 = fma(_859, _2206, _2218);
        float _2222 = _2220 + _2214;
        float _2224 = precise::clamp(_2222, 0.0, 1.0);
        float _2226 = -_2224;
        float _2228 = _2226 + _1458;
        float _2230 = fma(_2228, 500.0, 1.5);
        float _2232 = exp2(_2230);
        float _2234 = 0.0 + _2232;
        float _2236 = precise::clamp(_2234, 0.0, 1.0);
        bool _2238 = _2236 >= 1.0;
        bool _2240 = isnan(_2236);
        bool _2242 = _2238 || _2240;
        bool _2244 = isnan(1.0);
        bool _2246 = _2242 || _2244;
        _2030 = _2206;
        _2166 = _2232;
        _973 = _2216;
        _2168 = as_type<float>(_2180);
        if (!_2246)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_2246)
        {
            _2176 = 0.0;
        }
    }
    float _2248 = _2030;
    float _2250 = _2166;
    float _2252 = _2176;
    float _2254 = _973;
    float _2256 = _2168;
    float _2258 = _2256;
    float _2260 = _2248;
    float _2262 = _2250;
    float _2264 = _2254;
    if (_1126)
    {
        _2258 = 1.0;
    }
    float _2266 = _2258;
    float _2268 = _2266;
    if (!_1126)
    {
        int _2270 = _1162 << 4;
        int _2272 = _2270 + 2048;
        uint _2274 = uint(int(uint(_2272) >> uint(2)));
        uint _2276 = uint(int(uint(int(_2274)) >> uint(2)));
        int _2278 = int(_2274) & 3;
        float _2280 = (*spvDescriptorSet0.vp_c15)._m0[int(_2276)][_2278];
        int _2282 = int(_2274) + 1;
        uint _2284 = uint(int(uint(_2282) >> uint(2)));
        int _2286 = _2282 & 3;
        float _2288 = (*spvDescriptorSet0.vp_c15)._m0[int(_2284)][_2286];
        int _2290 = _2272 + 8;
        uint _2292 = uint(int(uint(_2290) >> uint(2)));
        uint _2294 = uint(int(uint(int(_2292)) >> uint(2)));
        int _2296 = int(_2292) & 3;
        float _2298 = (*spvDescriptorSet0.vp_c15)._m0[int(_2294)][_2296];
        int _2300 = int(_2292) + 1;
        uint _2302 = uint(int(uint(_2300) >> uint(2)));
        int _2304 = _2300 & 3;
        float _2306 = (*spvDescriptorSet0.vp_c15)._m0[int(_2302)][_2304];
        float _2308 = _921 * _2288;
        float _2310 = fma(_851, _2280, _2308);
        float _2312 = fma(_859, _2298, _2310);
        float _2314 = _2312 + _2306;
        float _2316 = precise::clamp(_2314, 0.0, 1.0);
        float _2318 = -_2316;
        float _2320 = _2318 + _1464;
        float _2322 = fma(_2320, 500.0, 1.5);
        float _2324 = exp2(_2322);
        float _2326 = 0.0 + _2324;
        float _2328 = precise::clamp(_2326, 0.0, 1.0);
        _2260 = _2298;
        _2262 = _2324;
        _2268 = _2328;
    }
    float _2330 = _2260;
    float _2332 = _2262;
    float _2334 = _2268;
    float _2336 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2338 = _2082 + _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2342 = _2084 + _2340;
    float _2344 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2346 = _2086 + _2344;
    float _2348 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2350 = _2338 * _2338;
    float _2352 = fma(_2342, _2342, _2350);
    float _2354 = fma(_2346, _2346, _2352);
    float _2356 = rsqrt(_2354);
    float _2358 = sqrt(_2354);
    float _2360 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2362 = _2342 * _2360;
    float _2364 = _2346 * _2360;
    float _2366 = _2362 * _2362;
    float _2368 = _2364 * _2364;
    float _2370 = _2366 + _2368;
    float _2372 = sqrt(_2370);
    bool _2374 = _2372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2378 = _2372 + _2376;
    float _2380 = _2330;
    float _2382 = _2370;
    float _2384 = _2378;
    float _2386 = _2338;
    float _2388 = _2362;
    float _2390 = _2364;
    float _2392 = _2366;
    float _2394 = _2368;
    if (_2374)
    {
        float _2396 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2380 = _2396;
    }
    float _2398 = _2380;
    if (_2374)
    {
        float _2400 = rsqrt(_2370);
        _2382 = _2400;
    }
    float _2402 = _2382;
    float _2404 = _2402;
    if (_2374)
    {
        float _2406 = _2378 * _2398;
        _2384 = _2406;
    }
    float _2408 = _2384;
    if (_2374)
    {
        float _2410 = _2408 * 0.15915493667125701904296875;
        _1968 = _2410;
    }
    float _2412 = _1968;
    float _2414 = _2332;
    if (_2374)
    {
        float _2416 = _2412 * 6.283185482025146484375;
        float _2418 = cos(_2416);
        _2414 = _2418;
    }
    float _2420 = _2414;
    float _2422 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2424 = precise::max(0.0, _2422);
    float _2426 = _1458;
    float _2428 = _2422;
    float _2430 = _2424;
    if (_2374)
    {
        float _2432 = _2412 * 6.283185482025146484375;
        float _2434 = sin(_2432);
        _2426 = _2434;
    }
    float _2436 = _2426;
    float _2438 = -_2360;
    float _2440 = -_2424;
    float _2442 = fma(_2338, _2438, _2440);
    if (_2374)
    {
        float _2444 = _2442 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2386 = _2444;
    }
    float _2446 = _2386;
    float _2448 = _2446;
    if (_2374)
    {
        float _2450 = _2420 + (-1.0);
        _2428 = _2450;
    }
    float _2452 = _2428;
    float _2454 = _2452;
    if (_2374)
    {
        float _2456 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2430 = _2456;
    }
    float _2458 = _2430;
    float _2460 = _2436;
    if (_2374)
    {
        float _2462 = fma(_2436, _2446, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2460 = _2462;
    }
    float _2464 = _2460;
    if (!_2374)
    {
        _2448 = _2442;
    }
    float _2466 = _2448;
    float _2468 = _2466;
    if (_2374)
    {
        float _2470 = fma(_2442, _2420, _2458);
        _2468 = _2470;
    }
    float _2472 = _2468;
    if (_2374)
    {
        float _2474 = _2402 * _2464;
        _2454 = _2474;
    }
    float _2476 = _2454;
    if (_2374)
    {
        float _2478 = _2362 * _2476;
        _2388 = _2478;
    }
    float _2480 = _2388;
    if (_2374)
    {
        float _2482 = _2364 * _2476;
        _2390 = _2482;
    }
    float _2484 = _2390;
    if (_2374)
    {
        float _2486 = _2480 * _2480;
        _2392 = _2486;
    }
    float _2488 = _2392;
    if (_2374)
    {
        float _2490 = _2484 * _2484;
        _2394 = _2490;
    }
    float _2492 = _2394;
    float _2494 = fma(_2472, _2472, _2488);
    float _2496 = _2494 + _2492;
    float _2498 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2500 = rsqrt(_2496);
    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2504 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2502);
    float _2506 = precise::clamp(_2504, 0.0, 1.0);
    float _2508 = -_2348;
    float _2510 = fma(_2508, _2498, 1.0);
    float _2512 = -_2506;
    float _2514 = _2512 + 1.0;
    float _2516 = log2(_2510);
    float _2518 = _2500 * _2480;
    float _2520 = abs(_2514);
    float _2522 = log2(_2520);
    float _2524 = _2500 * _2472;
    float _2526 = _2500 * _2484;
    float _2528 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2530 = -_2528;
    float _2532 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2530);
    float _2534 = 1.0 / _2252;
    float _2536 = _2516 * 0.693147182464599609375;
    float _2538 = -_2526;
    float _2540 = fma(_2538, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2532);
    float _2542 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2544 = fma(_2540, -0.5, 0.5);
    float _2546 = _2522 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2548 = fma(_2540, 0.5, 0.5);
    float _2550 = _2524 + 1.0;
    float _2552 = sqrt(_2544);
    float _2554 = fma(_2548, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2556 = fma(_2548, _2554, -0.212114393711090087890625);
    float _2558 = _2158 * _2534;
    float _2560 = _2156 * _2534;
    float _2562 = exp2(_2546);
    float _2564 = fma(_2548, _2556, 1.570728778839111328125);
    float _2566 = fma(_2558, 0.5, 0.5);
    float _2568 = fma(_2560, -0.5, 0.5);
    float _2570 = _2552 * 0.636619746685028076171875;
    float _2572 = -_2524;
    float _2574 = fma(_2562, _2550, _2572);
    float _2576 = -_2564;
    float _2578 = fma(_2570, _2576, 1.0);
    float3 _7324 = float3(_2566, _2568, _2542);
    float _2580 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7324, float3(0.0), isnan(_7324)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7324, float3(0.0), isnan(_7324)), level(0.0)).x;
    float3 _7333 = float3(_2566, _2568, _2542);
    float4 _2583 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7333, float3(0.0), isnan(_7333)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7333, float3(0.0), isnan(_7333)), level(0.0)).xyzw;
    float _2585 = _2583.x;
    float _2587 = _2583.y;
    float _2589 = _2583.z;
    float _2591 = _2583.w;
    float _2593 = fma(_2574, 0.5, 0.5);
    float2 _7351 = float2(_2578, _2593);
    float3 _2597 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7351, float2(0.0), isnan(_7351)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7351, float2(0.0), isnan(_7351)), level(0.0)).xyz;
    float _2599 = _2597.x;
    float _2601 = _2597.y;
    float _2603 = _2597.z;
    bool _2605 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2607 = isnan(0.5);
    bool _2609 = _2605 || _2607;
    bool _2611 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2613 = _2609 || _2611;
    float _2615 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2617 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2619 = _2522 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2621 = -_1452;
    float _2623 = _2621 + 1.0;
    float _2625 = abs(_951);
    float _2627 = log2(_2625);
    float _2629 = _2160 + _2162;
    float _2631 = _2629 * 0.5;
    float _2633 = _2536;
    float _2635 = _2627;
    if (!_2613)
    {
        float _2637 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        _2633 = _2637;
    }
    float _2639 = _2633;
    float _2641 = exp2(_2619);
    out.m_86.z = _2631;
    out.m_86.w = _2162;
    float _2643 = _2639;
    if (!_2613)
    {
        float _2645 = _2639 * 0.15915493667125701904296875;
        _2032 = _2645;
    }
    float _2647 = _2032;
    if (!_2613)
    {
        float _2649 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        _2643 = _2649;
    }
    float _2651 = _2643;
    float _2653 = _2412;
    float _2655 = _2651;
    if (!_2613)
    {
        float _2657 = _2647 * 6.283185482025146484375;
        float _2659 = cos(_2657);
        _2653 = _2659;
    }
    float _2661 = _2653;
    if (!_2613)
    {
        float _2663 = _2651 * 0.15915493667125701904296875;
        _2264 = _2663;
    }
    float _2665 = _2264;
    if (!_2613)
    {
        float _2667 = _2647 * 6.283185482025146484375;
        float _2669 = sin(_2667);
        _2404 = _2669;
    }
    float _2671 = _2404;
    float _2673 = _2661;
    float _2675 = _2671;
    if (!_2613)
    {
        float _2677 = 1.0 / _2661;
        _2673 = _2677;
    }
    float _2679 = _2673;
    float _2681 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (_2613)
    {
        _2635 = 1.0;
    }
    float _2683 = _2635;
    float _2685 = _2464;
    float _2687 = _2683;
    if (!_2613)
    {
        float _2689 = _2665 * 6.283185482025146484375;
        float _2691 = cos(_2689);
        _2685 = _2691;
    }
    float _2693 = _2685;
    if (!_2613)
    {
        float _2695 = _2671 * _2679;
        _2675 = _2695;
    }
    float _2697 = _2675;
    float _2699 = _2697;
    if (!_2613)
    {
        float _2701 = _2665 * 6.283185482025146484375;
        float _2703 = sin(_2701);
        _2655 = _2703;
    }
    float _2705 = _2655;
    float _2707 = _2693;
    float _2709 = _2705;
    if (!_2613)
    {
        float _2711 = _2693 * _2697;
        _2707 = _2711;
    }
    float _2713 = _2707;
    if (!_2613)
    {
        _2699 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2715 = _2699;
    float _2717 = exp2(_2681);
    float _2719 = _1876 * _1942;
    float _2721 = _2715;
    if (!_2613)
    {
        float _2723 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2725 = _2715 + _2723;
        _2721 = _2725;
    }
    float _2727 = _2721;
    float _2729 = fma(_1858, _1870, _2719);
    float _2731 = _2442;
    if (!_2613)
    {
        float _2733 = 1.0 / _2713;
        _2731 = _2733;
    }
    float _2735 = _2731;
    float _2737 = _1876 * _1904;
    float _2739 = _1876 * _1896;
    float _2741 = fma(_1858, _1868, _2737);
    float _2743 = fma(_1858, _1872, _2739);
    float _2745 = _2727;
    if (!_2613)
    {
        float _2747 = 1.0 / _2727;
        _2745 = _2747;
    }
    float _2749 = _2745;
    float _2751 = fma(_2717, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2753 = precise::clamp(_2751, 0.0, 1.0);
    float _2755 = _1850 * _1904;
    float _2757 = _1850 * _1942;
    float _2759 = fma(_1844, _1758, _2741);
    float _2761 = -_1778;
    float _2763 = fma(_2761, _1868, _2755);
    float _2765 = -_1778;
    float _2767 = fma(_2765, _1870, _2757);
    if (!_2613)
    {
        float _2769 = _2705 * _2735;
        _2709 = _2769;
    }
    float _2771 = _2709;
    float _2773 = fma(_1856, _1758, _2763);
    float _2775 = fma(_1856, _1766, _2767);
    float _2777 = _2771;
    if (!_2613)
    {
        float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2781 = fma(_951, _2771, _2779);
        _2777 = _2781;
    }
    float _2783 = _2777;
    bool _2785 = _951 <= 8000.0;
    bool _2787 = isnan(_951);
    bool _2789 = _2785 || _2787;
    bool _2791 = isnan(8000.0);
    bool _2793 = _2789 || _2791;
    float _2795 = float(_2793);
    float _2797 = _2615 * _2773;
    if (!_2613)
    {
        float _2799 = _2783 * _2749;
        float _2801 = precise::clamp(_2799, 0.0, 1.0);
        _2687 = _2801;
    }
    float _2803 = _2687;
    float _2805 = _1850 * _1896;
    float _2807 = _1842 * _1904;
    float _2809 = _1842 * _1942;
    float _2811 = _1842 * _1896;
    float _2813 = -_1778;
    float _2815 = fma(_2813, _1872, _2805);
    float _2817 = fma(_1854, _1868, _2807);
    float _2819 = fma(_1854, _1870, _2809);
    float _2821 = fma(_1854, _1872, _2811);
    float _2823 = fma(_1856, _1764, _2815);
    float _2825 = fma(_1844, _1766, _2729);
    float _2827 = fma(_1848, _1766, _2819);
    float _2829 = fma(_1848, _1764, _2821);
    float _2831 = _2615 * _2823;
    float _2833 = fma(_1848, _1758, _2817);
    float _2835 = _2615 * _2775;
    float _2837 = fma(_1844, _1764, _2743);
    float _2839 = fma(_2617, _2829, _2831);
    float _2841 = fma(_2617, _2833, _2797);
    float _2843 = fma(_2617, _2827, _2835);
    float _2845 = _2837 + _2839;
    bool _2847 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2849 = isnan(_2358);
    bool _2851 = _2847 || _2849;
    bool _2853 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2855 = _2851 || _2853;
    float _2857 = fma(_2753, -2.0, 3.0);
    float _2859 = _2753 * _2753;
    float _2861 = _2759 + _2841;
    float _2863 = _2825 + _2843;
    float _2865 = _2803 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2867 = _2859 * _2857;
    out.m_88.x = _2861;
    out.m_88.y = _2863;
    out.m_88.z = _2845;
    float _2869 = -_2867;
    float _2871 = _2869 + 1.0;
    float _2873 = _2841;
    if (!_2855)
    {
        _2873 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2875 = _2873;
    float _2877 = fma(_2871, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2867);
    float _2879 = -_2641;
    float _2881 = _2879 + 1.0;
    float _2883 = _2795 * _2877;
    float _2885 = _2877;
    float _2887 = _2875;
    float _2889 = _2875;
    if (!_1368)
    {
        _2885 = 1.0;
    }
    float _2891 = _2885;
    float _2893 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2895 = _2891;
    float _2897 = _2893;
    float _2899 = _2587;
    float _2901 = _2585;
    if (_1368)
    {
        bool _2903 = _1470 >= _1448;
        bool _2905 = isnan(_1470);
        bool _2907 = _2903 || _2905;
        bool _2909 = isnan(_1448);
        bool _2911 = _2907 || _2909;
        float _2913 = float(_2911);
        _2895 = _2913;
    }
    float _2915 = _2895;
    float _2917 = _2883 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2919 = -_2893;
    float _2921 = _2919 + 1.0;
    float _2923 = _2623 * _2917;
    float _2925 = precise::clamp(_2923, 0.0, 1.0);
    float _2927 = _2915 * _2334;
    float _2929 = -_2925;
    float _2931 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2933 = -_2927;
    float _2935 = fma(_2933, _2931, 1.0);
    float _2937 = precise::clamp(_2935, 0.0, 1.0);
    float _2939 = _2937 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2941 = _2937;
    float _2943 = _2921;
    if (!_2855)
    {
        _2941 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2945 = _2941;
    out.m_90.x = _2939;
    float _2947 = _2893 * _2580;
    float _2949 = _2591 * _2921;
    float _2951 = _2945;
    float _2953 = _2945;
    if (!_2855)
    {
        _2943 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2955 = _2943;
    float _2957 = _2591 * _2947;
    float _2959 = _2955;
    float _2961 = _2955;
    if (!_2855)
    {
        _2897 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2963 = _2897;
    float _2965 = _2603 * _2947;
    float _2967 = fma(_2599, _2957, _2585);
    float _2969 = fma(_2601, _2957, _2587);
    float _2971 = _2963;
    float _2973 = _2963;
    if (!_2855)
    {
        _2899 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2975 = _2899;
    float _2977 = fma(_2591, _2965, _2589);
    float _2979 = _2975;
    float _2981 = _2975;
    if (!_2855)
    {
        _2901 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2983 = _2901;
    out.m_92.x = _2967;
    out.m_92.y = _2969;
    out.m_92.z = _2977;
    out.m_92.w = _2949;
    bool _2985 = !_2855;
    float _2987 = _2983;
    float _2989 = _2983;
    if (!_2985)
    {
        bool _2991 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2993 = isnan(_2358);
        bool _2995 = _2991 || _2993;
        bool _2997 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2999 = _2995 || _2997;
        if (!_2999)
        {
            float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3003 = _2358 + _3001;
            float _3005 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3007 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3005;
            float _3009 = 1.0 / _3007;
            float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3013 = _3011 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3017 = _3015 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3025 = _3023 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3027 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3029 = _3027 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3031 = _3003 * _3009;
            float _3033 = precise::clamp(_3031, 0.0, 1.0);
            float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3037 = _3035 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3039 = fma(_3033, _3013, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3041 = fma(_3033, _3037, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3043 = fma(_3033, _3017, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3045 = fma(_3033, _3021, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3047 = fma(_3033, _3025, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3049 = fma(_3033, _3029, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2981 = _3041;
            _2953 = _3047;
            _2961 = _3039;
            _2889 = _3045;
            _2989 = _3043;
            _2973 = _3049;
            _3051 = true;
        }
        else
        {
            bool _3053 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3055 = isnan(_2358);
            bool _3057 = _3053 || _3055;
            bool _3059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3061 = _3057 || _3059;
            if (!_3061)
            {
                _2959 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3063 = _2959;
            _2961 = _3063;
            if (!_3061)
            {
                _2979 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3065 = _2979;
            _2981 = _3065;
            if (!_3061)
            {
                _2987 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3067 = _2987;
            _2989 = _3067;
            if (!_3061)
            {
                _2887 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3069 = _2887;
            _2889 = _3069;
            if (!_3061)
            {
                _2951 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3071 = _2951;
            _2953 = _3071;
            if (!_3061)
            {
                _2971 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3073 = _2971;
            bool _3075 = !_3061;
            _2973 = _3073;
            if (!_3075)
            {
                bool _3077 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3079 = isnan(_2358);
                bool _3081 = _3077 || _3079;
                bool _3083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3085 = _3081 || _3083;
                if (!_3085)
                {
                    float _3087 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3089 = _2358 + _3087;
                    float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3093 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3091;
                    float _3095 = 1.0 / _3093;
                    float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3103 = _3101 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3117 = _3089 * _3095;
                    float _3119 = precise::clamp(_3117, 0.0, 1.0);
                    float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3123 = _3121 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3125 = fma(_3119, _3099, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3127 = fma(_3119, _3123, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3129 = fma(_3119, _3103, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3131 = fma(_3119, _3107, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3133 = fma(_3119, _3111, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3135 = fma(_3119, _3115, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2981 = _3127;
                    _2953 = _3133;
                    _2961 = _3125;
                    _2889 = _3131;
                    _2989 = _3129;
                    _2973 = _3135;
                    _3051 = true;
                }
                else
                {
                    _2981 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2953 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2961 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2889 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2989 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2973 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3051 = false;
    float _3137 = _2981;
    float _3139 = _2953;
    float _3141 = _2961;
    float _3143 = _2889;
    float _3145 = _2989;
    float _3147 = _2973;
    float _3149 = _2865 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3151 = fma(_2863, -0.5, 0.5);
    float _3153 = precise::clamp(_3151, 0.0, 1.0);
    float _3155 = -_3137;
    float _3157 = _3155 + _3139;
    float _3159 = -_3141;
    float _3161 = _3159 + _3143;
    out.m_61.x = _3149;
    float _3163 = -_3145;
    float _3165 = _3163 + _3147;
    float _3167 = fma(_3153, _3157, _3137);
    float _3169 = fma(_3153, _3161, _3141);
    bool _3171 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3173 = _3167 * 0.586610972881317138671875;
    float _3175 = fma(_3153, _3165, _3145);
    out.m_94.x = 0.0;
    bool _3177 = _2803 > 0.0;
    bool _3179 = isnan(_2803);
    bool _3181 = _3177 || _3179;
    bool _3183 = isnan(0.0);
    bool _3185 = _3181 || _3183;
    float _3187 = fma(_3169, 0.298911988735198974609375, _3173);
    float _3189 = fma(_3175, 0.114477999508380889892578125, _3187);
    float _3191 = -_3189;
    float _3193 = _3169 + _3191;
    float _3195 = -_3189;
    float _3197 = _3167 + _3195;
    float _3199 = -_3189;
    float _3201 = _3175 + _3199;
    float _3203 = fma(_3193, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3189);
    float _3205 = fma(_3197, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3189);
    float _3207 = fma(_3201, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3189);
    bool _3209 = !_3171;
    if (!_3209)
    {
        float _3211 = -_2082;
        float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3215 = -_2084;
        float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3219 = -_2086;
        float _3221 = _3219 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3223 = _3213 * _3213;
        float _3225 = fma(_3217, _3217, _3223);
        float _3227 = fma(_3221, _3221, _3225);
        float _3229 = sqrt(_3227);
        float _3231 = rsqrt(_3227);
        float _3233 = -_3229;
        float _3235 = _3233 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3237 = _3235 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3239 = precise::clamp(_3237, 0.0, 1.0);
        float _3241 = _3217 * _3231;
        float _3243 = _3213 * _3231;
        float _3245 = abs(_3239);
        float _3247 = log2(_3245);
        float _3249 = _3221 * _3231;
        float _3251 = _3241 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3253 = _2863 * _3243;
        float _3255 = -_3243;
        float _3257 = -_3251;
        float _3259 = fma(_3255, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3257);
        float _3261 = fma(_2861, _3241, _3253);
        float _3263 = -_3249;
        float _3265 = fma(_3263, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3259);
        float _3267 = fma(_2845, _3249, _3261);
        float _3269 = precise::clamp(_3267, 0.0, 1.0);
        float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3273 = _3265 + _3271;
        float _3275 = _3247 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3277 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3279 = precise::clamp(_3277, 0.0, 1.0);
        float _3281 = exp2(_3275);
        float _3283 = _3281 * _3279;
        float _3285 = _3269 * _3283;
        float _3287 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3289 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3291 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _3287;
        out.m_94.y = _3289;
        out.m_94.z = _3291;
    }
    out.m_96.x = _3203;
    out.m_96.y = _3205;
    out.m_96.z = _3207;
    if (_3185)
    {
        return out;
    }
    float _3293 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_61.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3293;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3051 = false;
    bool _425 = false;
    bool _313 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_58.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_61.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3350 = as_type<float>(_131);
        out.gl_Position.z = _3350;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_63.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_61.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3419 = as_type<float>(_169);
        out.gl_Position.z = _3419;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _175 = as_type<int>(_171) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_171) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    float _209;
    if (!_191)
    {
        float _193 = in.m_68.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_115);
        float _215 = 1.0 / _213;
        float _217 = _149 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    bool _225 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _227 = isnan(_219);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    float _241 = -_235;
    float _243 = _241 + 1.0;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _247 = 1.0 / _239;
    float _249 = _223 * _247;
    bool _251 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _253 = isnan(_219);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _267;
    float _271 = _261 * _243;
    float _273 = fma(_265, _249, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_269, _249, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = -_261;
    float _279 = _277 + 1.0;
    float _281 = _273 * _271;
    float _283 = _275 * _271;
    float _285 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    bool _293 = !_245;
    float _311;
    if (!_293)
    {
        float _295 = in.m_68.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_115);
        float _317 = 1.0 / _315;
        float _319 = _149 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    bool _323 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _325 = isnan(_321);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _339 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _341 = isnan(_321);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _357 = _321 + _355;
    float _359 = 1.0 / _337;
    float _361 = -_333;
    float _363 = _361 + 1.0;
    bool _365 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _367 = _349 * _363;
    float _369 = -_349;
    float _371 = _369 + 1.0;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _375 = _353 * _359;
    float _377 = _373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _379 = fma(_375, _357, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _381 = _379 * _367;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _385 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[115].x, _381);
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _389 = _383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[116].x, _385);
    float _393 = in.m_70.x;
    float _395 = in.m_70.y;
    float _397 = _387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _391 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _397;
    out.m_72.y = _389;
    out.m_72.z = _377;
    out.m_72.w = _399;
    float _401 = _291 * _395;
    float _403 = _289 * _393;
    bool _405 = !_365;
    float _423;
    if (!_405)
    {
        float _407 = in.m_68.x;
        float _409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _411 = _407 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _415 = _413 * _409;
        float _417 = floor(_415);
        float _419 = -_417;
        float _421 = _415 + _419;
        _423 = _421;
        _425 = true;
    }
    else
    {
        float _427 = float(_115);
        float _429 = 1.0 / _427;
        float _431 = _149 * _429;
        _423 = _431;
    }
    _425 = false;
    float _433 = _423;
    float _435 = in.m_68.x;
    float _437 = in.m_68.y;
    float _439 = in.m_68.z;
    float _441 = in.m_68.w;
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _445 = in.m_58.x;
    float _447 = in.m_58.y;
    float _449 = in.m_58.z;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _457 = _455 != 0;
    float _459 = in.m_74.x;
    float _461 = in.m_74.y;
    float _463 = in.m_74.z;
    float _465 = in.m_74.w;
    int _467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _469 = _467 != 0;
    float _471 = 1.0 / _453;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _475 = _473 != 0;
    float _477 = in.m_76.x;
    float _479 = in.m_76.y;
    float _481 = in.m_76.z;
    float _483 = in.m_76.w;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _487 = _485 != 0;
    float _489 = in.m_78.y;
    bool _491 = _441 > 0.5;
    float _493 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _495 = _435 > 0.5;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _499 = _497 != 0;
    float _501 = _447 * _461;
    float _503 = _447 * _479;
    float _505 = fma(_445, _459, _501);
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _509 = _447 + _489;
    float _511 = fma(_445, _477, _503);
    float _513 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _517 = fma(_449, _463, _505);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _519;
    float _523 = -_507;
    float _525 = fma(_513, 2.0, _523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _529 = _433 + _527;
    float _531 = -_185;
    int _533 = _495 ? as_type<int>(_531) : as_type<int>(_185);
    float _535 = _521 * _471;
    bool _537 = _437 > 0.5;
    float _539 = fma(_449, _481, _511);
    float _541 = fma(_535, _529, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _543 = -_189;
    int _545 = _537 ? as_type<int>(_543) : as_type<int>(_189);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _549 = _521;
    if (!_499)
    {
        _549 = _439;
    }
    float _551 = _549;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _555 = _551;
    if (_499)
    {
        _555 = _437;
    }
    float _557 = _555;
    float _559 = fma(_493, -2.0, _547);
    bool _561 = !_457;
    float _563 = _561 ? _185 : as_type<float>(_533);
    float _565 = _443 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _567 = !_469;
    float _569 = _567 ? _189 : as_type<float>(_545);
    float _571 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[83].w, _553);
    float _573 = _515 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _575 = -_149;
    float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[76].x, _525);
    float _579 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _559);
    float _581 = _563 + 0.5;
    float _583 = _569 + (-0.5);
    float _585 = _539 + _483;
    float _587 = _517 + _465;
    float _589 = fma(_565, _581, _577);
    float _591 = -_573;
    float _593 = -_579;
    float _595 = fma(_591, _583, _593);
    float _597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _599 = _565;
    if (!_499)
    {
        _599 = _437;
    }
    float _601 = _599;
    float _603 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _571);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _607 = _601;
    if (_499)
    {
        _607 = _435;
    }
    float _609 = _607;
    float _611 = -_603;
    float _613 = _611 + 1.0;
    bool _615 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _617 = isnan(_433);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _629 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _631 = isnan(_433);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = _609 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _643 = _439 > 0.5;
    float _645 = -_625;
    float _647 = _645 + 1.0;
    float _649 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[83].z, _605);
    float _651 = _609;
    if (!_499)
    {
        _651 = _439;
    }
    float _653 = _651;
    float _655 = -_627;
    float _657 = fma(_641, 2.0, _655);
    float _659 = _639 * _647;
    float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _663 = _653;
    if (_499)
    {
        _663 = _437;
    }
    float _665 = _663;
    float _667 = _541 * _659;
    float _669 = -_185;
    int _671 = _643 ? as_type<int>(_669) : as_type<int>(_185);
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _675 = -_639;
    float _677 = _675 + 1.0;
    float _679 = _665 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _681 = !_475;
    float _683 = _681 ? _185 : as_type<float>(_671);
    float _685 = _597 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _687 = -_149;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[81].x, _657);
    float _691 = fma(_679, -2.0, _673);
    float _693 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[131].x, _667);
    float _695 = _683 + 0.5;
    float _697 = -_189;
    int _699 = _491 ? as_type<int>(_697) : as_type<int>(_189);
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _703 = _509 + _701;
    float _705 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _649);
    float _707 = fma(_685, _695, _689);
    bool _709 = !_487;
    float _711 = _709 ? _189 : as_type<float>(_699);
    float _713 = _703 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _715 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _717 = _585 + _715;
    float _719 = _661 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _721 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _691);
    float _723 = _711 + (-0.5);
    float _725 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[28].x, _713);
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _731 = _587 + _729;
    float _733 = -_719;
    float _735 = -_721;
    float _737 = fma(_733, _723, _735);
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _741 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].w, _727);
    float _743 = -_705;
    float _745 = _743 + 1.0;
    float _747 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[28].z, _725);
    float _749 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].z, _739);
    float _751 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _741);
    float _753 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[132].x, _693);
    float _755 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _749);
    float _757 = -_751;
    float _759 = _757 + 1.0;
    bool _761 = _747 >= 0.0;
    float _763 = -_755;
    float _765 = _763 + 1.0;
    float _767 = fma(_569, _759, _595);
    float _769 = -_745;
    float _771 = fma(_683, _769, _707);
    float _773 = _703 * _703;
    float _775 = -_765;
    float _777 = fma(_563, _775, _589);
    float _779 = fma(_711, _613, _737);
    float _781 = fma(_717, _717, _773);
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _785 = fma(_731, _731, _781);
    float _787 = _727;
    float _789 = _771;
    if (_761)
    {
        _787 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _791 = _787;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _797 = _753 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _799 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _801 = rsqrt(_785);
    float _803 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _807 = as_type<int>(_791);
    if (_761)
    {
        float _809 = _791 * 5.0;
        _807 = as_type<int>(_809);
    }
    int _811 = _807;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _815 = _813 != 0;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _819 = _817 != 0;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _823 = _821 != 0;
    out.m_80.x = _777;
    out.m_80.y = _767;
    out.m_80.z = _771;
    out.m_80.w = _779;
    out.m_82.x = _803;
    out.m_82.y = _799;
    out.m_82.z = _805;
    out.m_82.w = _797;
    bool _825 = !_815;
    int _827 = _825 ? 0 : 1;
    bool _829 = !_819;
    int _831 = _829 ? 0 : 1;
    if (_761)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4523 = as_type<float>(_811);
        out.gl_Position.z = _4523;
    }
    bool _833 = !_823;
    int _835 = _833 ? 0 : 1;
    float _837 = _703 * _801;
    float _839 = _717 * _801;
    float _841 = _837;
    if (_761)
    {
        out.m_61.x = 0.0;
    }
    if (_761)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _843 = -_837;
    float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[18].w, _509);
    float _847 = _731 * _801;
    float _849 = -_839;
    float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _585);
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _855 = _845 + _853;
    float _857 = -_847;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[18].w, _587);
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _863 = _851 + _861;
    float _865 = _855 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _869 = _859 + _867;
    float _871 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[28].x, _865);
    float _873 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[28].z, _871);
    bool _875 = _873 >= 0.0;
    if (_875)
    {
        _789 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _877 = _789;
    int _879 = as_type<int>(_877);
    if (_875)
    {
        out.m_61.x = 0.0;
    }
    if (_875)
    {
        float _881 = _877 * 5.0;
        _879 = as_type<int>(_881);
    }
    int _883 = _879;
    if (_875)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4628 = as_type<float>(_883);
        out.gl_Position.z = _4628;
    }
    if (_875)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _885 = _845 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _887 = _845 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _889 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[11].x, _885);
    float _891 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[11].z, _889);
    float _893 = _845 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _895 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _897 = _891 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _899 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[10].x, _893);
    float _901 = 1.0 / _897;
    float _903 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[10].z, _899);
    float _905 = _903 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _907 = _905 + _897;
    float _909 = _851 * (*spvDescriptorSet0.vp_c15)._m0[127].x;
    float _911 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[127].y, _909);
    float _913 = _907 * _901;
    float _915 = _913 * 0.5;
    float _917 = _851 * (*spvDescriptorSet0.vp_c15)._m0[126].x;
    float _919 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[127].z, _911);
    float _921 = _845 + _895;
    float _923 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _925 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[30].w, _923);
    float _927 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[126].y, _917);
    float _929 = _919 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _931 = fma(_921, (*spvDescriptorSet0.vp_c15)._m0[126].y, _917);
    float _933 = fma(_921, (*spvDescriptorSet0.vp_c15)._m0[127].y, _909);
    float _935 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[126].z, _927);
    float _937 = 1.0 / _925;
    float _939 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[127].z, _933);
    float _941 = _935 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _943 = _939 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _945 = trunc(_943);
    int _947 = int(_945);
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _951 = _937 * _949;
    float _953 = trunc(_941);
    int _955 = int(_953);
    bool _957 = _951 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _959 = _951 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _961 = !_957;
    int _963 = _961 ? 0 : 1;
    int _965 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _967 = _947 + _965;
    int _969 = _967 + 1;
    int _971 = 2;
    float _973 = _887;
    if (!_957)
    {
        _971 = 1;
    }
    int _975 = _971;
    int _977 = _975;
    if (!_959)
    {
        _977 = _963;
    }
    int _979 = _977;
    float _981 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[126].z, _931);
    int _983 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _985 = _955 + _983;
    int _987 = _985 + 1;
    float _989 = trunc(_929);
    int _991 = int(_989);
    int _993 = _979 << 6;
    float _995 = _981 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _997 = _987 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _999 = _993 + 96;
    uint _1002 = uint(int(uint(_999) >> uint(2)));
    uint _1004 = uint(int(uint(int(_1002)) >> uint(2)));
    int _1006 = int(_1002) & 3;
    float _1008 = (*spvDescriptorSet0.vp_c15)._m0[int(_1004)][_1006];
    int _1010 = int(_1002) + 1;
    uint _1012 = uint(int(uint(_1010) >> uint(2)));
    int _1014 = _1010 & 3;
    float _1016 = (*spvDescriptorSet0.vp_c15)._m0[int(_1012)][_1014];
    float _1018 = trunc(_995);
    int _1020 = int(_1018);
    int _1022 = _993 + 104;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    uint _1026 = uint(int(uint(int(_1024)) >> uint(2)));
    int _1028 = int(_1024) & 3;
    float _1030 = (*spvDescriptorSet0.vp_c15)._m0[int(_1026)][_1028];
    int _1032 = int(_1024) + 1;
    uint _1034 = uint(int(uint(_1032) >> uint(2)));
    int _1036 = _1032 & 3;
    float _1038 = (*spvDescriptorSet0.vp_c15)._m0[int(_1034)][_1036];
    int _1040 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1042 = _991 + _1040;
    int _1044 = _1042 + 1;
    int _1046 = _987 | _1044;
    int _1048 = _993 + 48;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    uint _1052 = uint(int(uint(int(_1050)) >> uint(2)));
    int _1054 = int(_1050) & 3;
    float _1056 = (*spvDescriptorSet0.vp_c15)._m0[int(_1052)][_1054];
    int _1058 = int(_1050) + 1;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    int _1062 = _1058 & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    int _1066 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1068 = _1020 + _1066;
    int _1070 = _1068 + 1;
    bool _1072 = _1046 < 0;
    bool _1074 = _1072 || _997;
    bool _1076 = _1070 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1078 = _993 + 64;
    uint _1080 = uint(int(uint(_1078) >> uint(2)));
    uint _1082 = uint(int(uint(int(_1080)) >> uint(2)));
    int _1084 = int(_1080) & 3;
    float _1086 = (*spvDescriptorSet0.vp_c15)._m0[int(_1082)][_1084];
    int _1088 = int(_1080) + 1;
    uint _1090 = uint(int(uint(_1088) >> uint(2)));
    int _1092 = _1088 & 3;
    float _1094 = (*spvDescriptorSet0.vp_c15)._m0[int(_1090)][_1092];
    int _1096 = _1070 | _969;
    bool _1098 = _1044 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1100 = _1098 || _1074;
    bool _1102 = _1096 < 0;
    bool _1104 = _1102 || _1076;
    int _1106 = _993 + 56;
    uint _1108 = uint(int(uint(_1106) >> uint(2)));
    uint _1110 = uint(int(uint(int(_1108)) >> uint(2)));
    int _1112 = int(_1108) & 3;
    float _1114 = (*spvDescriptorSet0.vp_c15)._m0[int(_1110)][_1112];
    int _1116 = int(_1108) + 1;
    uint _1118 = uint(int(uint(_1116) >> uint(2)));
    int _1120 = _1116 & 3;
    float _1122 = (*spvDescriptorSet0.vp_c15)._m0[int(_1118)][_1120];
    bool _1124 = _969 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1126 = _1124 || _1104;
    int _1128 = _993 + 72;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
    int _1134 = int(_1130) & 3;
    float _1136 = (*spvDescriptorSet0.vp_c15)._m0[int(_1132)][_1134];
    int _1138 = int(_1130) + 1;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    int _1142 = _1138 & 3;
    float _1144 = (*spvDescriptorSet0.vp_c15)._m0[int(_1140)][_1142];
    int _1146 = _987;
    int _1148 = _1044;
    float _1150 = as_type<float>(_979);
    if (!_1100)
    {
        int _1152 = _1044 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1154 = _1152 + _987;
        _1146 = _1154;
    }
    int _1156 = _1146;
    if (!_1126)
    {
        int _1158 = _969 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1160 = _1158 + _1070;
        _1148 = _1160;
    }
    int _1162 = _1148;
    float _1164 = _921 * _1016;
    int _1166 = as_type<int>(_1016);
    int _1168 = as_type<int>(_1008);
    float _1170 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (!_1100)
    {
        int _1172 = _1156 << 2;
        _1166 = _1172;
    }
    int _1174 = _1166;
    int _1176 = 0;
    int _1178 = _1174;
    if (!_1126)
    {
        int _1180 = _1162 << 2;
        _1176 = _1180;
    }
    int _1182 = _1176;
    float _1184 = fma(_851, _1008, _1164);
    int _1186 = _1182;
    if (!_1100)
    {
        uint _1188 = uint(int(uint(_1156) >> uint(2)));
        _1168 = int(_1188);
    }
    int _1190 = _1168;
    float _1192 = fma(_851, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1194 = _1192;
    if (!_1100)
    {
        int _1196 = 12 & _1174;
        _1178 = _1196;
    }
    int _1198 = _1178;
    float _1200 = fma(_859, _1030, _1184);
    int _1202 = 0;
    if (!_1126)
    {
        uint _1204 = uint(int(uint(_1162) >> uint(2)));
        _1202 = int(_1204);
    }
    int _1206 = _1202;
    float _1208 = floor(_1192);
    if (!_1126)
    {
        int _1210 = 12 & _1182;
        _1186 = _1210;
    }
    int _1212 = _1186;
    if (!_1100)
    {
        int _1214 = _1190 << 4;
        int _1216 = _1214 + _1198;
        _1170 = as_type<float>(_1216);
    }
    float _1218 = _1170;
    int _1220 = 0;
    if (!_1126)
    {
        int _1222 = _1206 << 4;
        int _1224 = _1222 + _1212;
        _1220 = _1224;
    }
    int _1226 = _1220;
    float _1228 = _1200 + _1038;
    int _1230 = _993 + 80;
    uint _1232 = uint(int(uint(_1230) >> uint(2)));
    uint _1234 = uint(int(uint(int(_1232)) >> uint(2)));
    int _1236 = int(_1232) & 3;
    float _1238 = (*spvDescriptorSet0.vp_c15)._m0[int(_1234)][_1236];
    int _1240 = int(_1232) + 1;
    uint _1242 = uint(int(uint(_1240) >> uint(2)));
    int _1244 = _1240 & 3;
    float _1246 = (*spvDescriptorSet0.vp_c15)._m0[int(_1242)][_1244];
    float _1248 = _921 * _1064;
    float _1250 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1252 = 1.0 / _1228;
    float _1254 = fma(_851, _1056, _1248);
    float _1256 = _921 * _1094;
    float _1258 = _1218;
    float _1260 = _1250;
    if (!_1100)
    {
        int _1262 = as_type<int>(_1218) + 400;
        uint _1264 = uint(int(uint(_1262) >> uint(2)));
        uint _1266 = uint(int(uint(int(_1264)) >> uint(2)));
        int _1268 = int(_1264) & 3;
        float _1270 = (*spvDescriptorSet0.vp_c15)._m0[int(_1266)][_1268];
        _1258 = _1270;
    }
    float _1272 = _1258;
    float _1274 = -_1208;
    float _1276 = _1192 + _1274;
    float _1278 = fma(_851, _1086, _1256);
    float _1280 = floor(_1250);
    float _1282 = fma(_859, _1114, _1254);
    float _1284 = _1200;
    if (!_1126)
    {
        int _1286 = _1226 + 400;
        uint _1288 = uint(int(uint(_1286) >> uint(2)));
        uint _1290 = uint(int(uint(int(_1288)) >> uint(2)));
        int _1292 = int(_1288) & 3;
        float _1294 = (*spvDescriptorSet0.vp_c15)._m0[int(_1290)][_1292];
        _1284 = _1294;
    }
    float _1296 = _1284;
    float _1298 = _1282 + _1122;
    float _1300 = _1122;
    if (!_1126)
    {
        float _1302 = floor(_943);
        _1300 = _1302;
    }
    float _1304 = _1300;
    float _1306 = fma(_859, _1136, _1278);
    int _1308 = _993 + 88;
    uint _1310 = uint(int(uint(_1308) >> uint(2)));
    uint _1312 = uint(int(uint(int(_1310)) >> uint(2)));
    int _1314 = int(_1310) & 3;
    float _1316 = (*spvDescriptorSet0.vp_c15)._m0[int(_1312)][_1314];
    int _1318 = int(_1310) + 1;
    uint _1320 = uint(int(uint(_1318) >> uint(2)));
    int _1322 = _1318 & 3;
    float _1324 = (*spvDescriptorSet0.vp_c15)._m0[int(_1320)][_1322];
    float _1326 = _1298 * _1252;
    float _1328 = _1306 + _1144;
    float _1330 = _1254;
    if (!_1100)
    {
        float _1332 = floor(_941);
        _1330 = _1332;
    }
    float _1334 = _1330;
    bool _1336 = _1326 >= 0.0;
    float _1338 = _1328 * _1252;
    float _1340 = -_1280;
    float _1342 = _1250 + _1340;
    bool _1344 = _1326 <= 1.0;
    bool _1346 = _1344 && _1336;
    float _1348 = _1256;
    if (!_1100)
    {
        float _1350 = floor(_929);
        _1348 = _1350;
    }
    float _1352 = _1348;
    bool _1354 = _1338 >= 0.0;
    bool _1356 = _1354 && _1346;
    float _1358 = _1304;
    if (!_1126)
    {
        float _1360 = -_1304;
        float _1362 = _943 + _1360;
        _1194 = _1362;
    }
    float _1364 = _1194;
    bool _1366 = _1338 <= 1.0;
    bool _1368 = _1366 && _1356;
    float _1370 = _1144;
    if (!_1126)
    {
        float _1372 = floor(_995);
        _1370 = _1372;
    }
    float _1374 = _1370;
    if (!_1100)
    {
        float _1376 = -_1334;
        float _1378 = _941 + _1376;
        _1358 = _1378;
    }
    float _1380 = _1358;
    float _1382 = _921 * _1246;
    float _1384 = fma(_851, _1238, _1382);
    float _1386 = _1352;
    if (!_1100)
    {
        float _1388 = -_1352;
        float _1390 = _929 + _1388;
        _1386 = _1390;
    }
    float _1392 = _1386;
    if (_1368)
    {
        float _1394 = float(_979);
        _1150 = _1394;
    }
    float _1396 = _1150;
    float _1398 = _1298;
    if (!_1100)
    {
        float _1400 = rint(_1272);
        float _1402 = precise::max(_1400, 0.0);
        uint _1404 = uint(_1402);
        uint _1406 = clamp(_1404, 0u, 65535u);
        _1398 = as_type<float>(_1406);
    }
    float _1408 = _1398;
    if (!_1126)
    {
        float _1410 = -_1374;
        float _1412 = _995 + _1410;
        _1260 = _1412;
    }
    float _1414 = _1260;
    float _1416 = _1296;
    if (!_1126)
    {
        float _1418 = rint(_1296);
        float _1420 = precise::max(_1418, 0.0);
        uint _1422 = uint(_1420);
        uint _1424 = clamp(_1422, 0u, 65535u);
        _1416 = as_type<float>(_1424);
    }
    float _1426 = _1416;
    float _1428 = _1382;
    if (_1368)
    {
        float _1430 = rint(_1396);
        float _1432 = precise::max(_1430, 0.0);
        uint _1434 = uint(_1432);
        uint _1436 = clamp(_1434, 0u, 65535u);
        _1428 = as_type<float>(_1436);
    }
    float _1438 = _1428;
    float _1440 = fma(_859, _1316, _1384);
    float _1442 = fma(_859, 6.2500002968590706586837768554688e-05, 0.5);
    float _1444 = _1440 + _1324;
    float _1446 = fma(_851, 6.2500002968590706586837768554688e-05, 0.5);
    float _1448 = _1444 * _1252;
    float2 _5568 = float2(_1446, _1442);
    float _1450 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_5568, float2(0.0), isnan(_5568)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_5568, float2(0.0), isnan(_5568)), level(0.0)).x;
    float2 _5578 = float2(_1276, _1342);
    float _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5578, float2(0.0), isnan(_5578)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5578, float2(0.0), isnan(_5578)), level(0.0)).x;
    float _1454 = _1408;
    if (!_1100)
    {
        float3 _5593 = float3(_1380, _1392, float(as_type<int>(_1408)));
        float3 _5597 = select(_5593, float3(0.0), isnan(_5593));
        float _1456 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5597.xy, uint(rint(_5597.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5597.xy, uint(rint(_5597.z)), level(0.0)).x;
        _1454 = _1456;
    }
    float _1458 = _1454;
    float _1460 = _1426;
    if (!_1126)
    {
        float3 _5613 = float3(_1414, _1364, float(as_type<int>(_1426)));
        float3 _5615 = select(_5613, float3(0.0), isnan(_5613));
        float _1462 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5615.xy, uint(rint(_5615.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5615.xy, uint(rint(_5615.z)), level(0.0)).x;
        _1460 = _1462;
    }
    float _1464 = _1460;
    float _1466 = _1338;
    if (_1368)
    {
        float3 _5630 = float3(_1326, _1338, float(as_type<int>(_1438)));
        float3 _5632 = select(_5630, float3(0.0), isnan(_5630));
        float _1468 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5632.xy, uint(rint(_5632.z)), _1448, level(0.0));
        _1466 = _1468;
    }
    float _1470 = _1466;
    float _1472 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1474 = log2(_1472);
    float _1476 = _435 * 2.0;
    float _1478 = _439 * 2.0;
    float _1480 = _437 + _439;
    int _1482 = abs(_827);
    float _1484 = -_837;
    float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[18].w, _703);
    int _1488 = abs(_831);
    float _1490 = -_839;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[18].w, _717);
    float _1494 = floor(_1478);
    float _1496 = -_847;
    float _1498 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[18].w, _731);
    int _1500 = abs(_835);
    float _1502 = floor(_1476);
    float _1504 = _1474 * _149;
    float _1506 = _1480 + (-1.0);
    float _1508 = _437 + _435;
    float _1510 = _437 * 2.0;
    float _1512 = _1508 + (-1.0);
    float _1514 = exp2(_1504);
    bool _1516 = _1494 > 0.0;
    float _1518 = _1486 * _1486;
    bool _1520 = _1494 >= 0.0;
    bool _1522 = isnan(_1494);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan(0.0);
    bool _1528 = _1524 || _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1532 = 1.0 + _1530;
    float _1534 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1536 = float(_1482);
    bool _1538 = _1502 > 0.0;
    float _1540 = in.m_84.x;
    float _1542 = in.m_84.y;
    float _1544 = in.m_84.z;
    bool _1546 = _1502 >= 0.0;
    bool _1548 = isnan(_1502);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    float _1556 = 1.0 / _1532;
    int _1558 = _1528 ? 0 : 1;
    float _1560 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1562 = _1554 ? 0 : 1;
    float _1564 = _437 + (-0.5);
    bool _1566 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1568 = isnan(1.0);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1574 = _1570 || _1572;
    float _1576 = -_1514;
    float _1578 = _1576 + 1.0;
    int _1580 = ~_1558;
    int _1582 = _1580 + 1;
    int _1584 = _1582 + 1;
    float _1586 = floor(_1510);
    int _1588 = ~_1562;
    int _1590 = _1588 + 1;
    int _1592 = _1590 + 1;
    int _1594 = _1584;
    int _1596 = _1592;
    if (!_1516)
    {
        int _1598 = ~_1558;
        int _1600 = _1598 + 1;
        _1594 = _1600;
    }
    int _1602 = _1594;
    if (!_1538)
    {
        int _1604 = ~_1562;
        int _1606 = _1604 + 1;
        _1596 = _1606;
    }
    int _1608 = _1596;
    bool _1610 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1612 = isnan(0.0);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1618 = _1614 || _1616;
    float _1620 = float(_1602);
    float _1622 = _1618 ? _1578 : 0.0;
    float _1624 = float(_1608);
    float _1626 = _1536 * _1620;
    bool _1628 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1630 = isnan(0.5);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1636 = _1632 || _1634;
    if (_1574)
    {
        float _1638 = _1622 * _1556;
        _153 = _1638;
    }
    float _1640 = _153;
    float _1642 = _1626 * (-2.0);
    float _1644 = fma(_1492, _1492, _1518);
    bool _1646 = _1586 > 0.0;
    float _1648 = _435 + (-0.5);
    float _1650 = fma(_1642, _1540, _1540);
    float _1652 = float(_1488);
    float _1654 = fma(_1534, _1642, _1534);
    bool _1656 = _1586 >= 0.0;
    bool _1658 = isnan(_1586);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan(0.0);
    bool _1664 = _1660 || _1662;
    float _1666 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1650);
    float _1668 = fma(_1498, _1498, _1644);
    float _1670 = _1652 * _1624;
    int _1672 = _1664 ? 0 : 1;
    float _1674 = fma(_1654, _1640, _1666);
    float _1676 = _439 + _435;
    float _1678 = _1670 * (-2.0);
    int _1680 = ~_1672;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = _1674 * 0.15915493667125701904296875;
    int _1688 = _1684;
    if (!_1646)
    {
        int _1690 = ~_1672;
        int _1692 = _1690 + 1;
        _1688 = _1692;
    }
    int _1694 = _1688;
    float _1696 = -_509;
    float _1698 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1700 = fma(_1678, _1542, _1542);
    float _1702 = sqrt(_1668);
    float _1704 = _1698 * _1698;
    float _1706 = float(_1500);
    float _1708 = -_585;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1712 = fma(_1560, _1678, _1560);
    float _1714 = -_587;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1718 = float(_1694);
    float _1720 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1700);
    float _1722 = fma(_1710, _1710, _1704);
    float _1724 = _1676 + (-1.0);
    float _1726 = _1706 * _1718;
    float _1728 = fma(_1712, _1640, _1720);
    float _1730 = fma(_1716, _1716, _1722);
    float _1732 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1734 = _1726 * (-2.0);
    float _1736 = _439 + (-0.5);
    float _1738 = rsqrt(_1730);
    float _1740 = fma(_1734, _1544, _1544);
    float _1742 = fma(_1732, _1734, _1732);
    float _1744 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1740);
    float _1746 = _1686 * 6.283185482025146484375;
    float _1748 = sin(_1746);
    float _1750 = fma(_1742, _1640, _1744);
    float _1752 = _801 * _1702;
    float _1754 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1756 = _1750 * 0.15915493667125701904296875;
    float _1758 = _1710 * _1738;
    float _1760 = _1686 * 6.283185482025146484375;
    float _1762 = cos(_1760);
    float _1764 = _1716 * _1738;
    float _1766 = _1698 * _1738;
    float _1768 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1770 = _1764 * _1768;
    float _1772 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1774 = _1766 * _1772;
    float _1776 = _1756 * 6.283185482025146484375;
    float _1778 = sin(_1776);
    float _1780 = _1728 * 0.15915493667125701904296875;
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1784 = _1758 * _1782;
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1788 = -_1770;
    float _1790 = fma(_1766, _1786, _1788);
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1794 = -_1774;
    float _1796 = fma(_1758, _1792, _1794);
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1800 = -_1784;
    float _1802 = fma(_1764, _1798, _1800);
    float _1804 = _1780 * 6.283185482025146484375;
    float _1806 = sin(_1804);
    float _1808 = _1802 * _1802;
    float _1810 = fma(_1790, _1790, _1808);
    float _1812 = _1780 * 6.283185482025146484375;
    float _1814 = cos(_1812);
    float _1816 = fma(_1796, _1796, _1810);
    float _1818 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1820 = _1752 * _1818;
    float _1822 = _1756 * 6.283185482025146484375;
    float _1824 = cos(_1822);
    float _1826 = _1748 * _1806;
    float _1828 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1830 = _1762 * _1806;
    float _1832 = _1752 * _1828;
    float _1834 = rsqrt(_1816);
    float _1836 = _1762 * _1814;
    float _1838 = _1754 * _1832;
    float _1840 = _1748 * _1814;
    float _1842 = fma(_1778, _1836, _1826);
    float _1844 = fma(_1778, _1826, _1836);
    float _1846 = -_1830;
    float _1848 = fma(_1778, _1840, _1846);
    float _1850 = _1762 * _1824;
    float _1852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _1854 = _1814 * _1824;
    float _1856 = _1748 * _1824;
    float _1858 = _1806 * _1824;
    float _1860 = _1852 * _1820;
    float _1862 = _1850 * _1838;
    float _1864 = -_1838;
    float _1866 = _1778 * _1864;
    float _1868 = _1790 * _1834;
    float _1870 = _1802 * _1834;
    float _1872 = _1796 * _1834;
    float _1874 = -_1840;
    float _1876 = fma(_1778, _1830, _1874);
    float _1878 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1880 = _1878 * 0.5;
    float _1882 = fma(_1842, _1860, _1862);
    float _1884 = _1766 * _1868;
    float _1886 = _1856 * _1838;
    float _1888 = fma(_1854, _1860, _1866);
    float _1890 = fma(_1876, _1880, _1882);
    float _1892 = _1764 * _1870;
    float _1894 = -_1884;
    float _1896 = fma(_1758, _1870, _1894);
    float _1898 = fma(_1848, _1860, _1886);
    float _1900 = fma(_1858, _1880, _1888);
    float _1902 = -_1892;
    float _1904 = fma(_1766, _1872, _1902);
    float _1906 = _1896 * _1890;
    float _1908 = fma(_1844, _1880, _1898);
    float _1910 = _1904 * _1890;
    float _1912 = fma(_1872, _1900, _1906);
    float _1914 = fma(_1868, _1900, _1910);
    float _1916 = fma(_1764, _1908, _1912);
    float _1918 = fma(_1758, _1908, _1914);
    float _1920 = _587 + _1916;
    float _1922 = _585 + _1918;
    float _1924 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1926 = _1920 + _1924;
    float _1928 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1930 = _1922 + _1928;
    float _1932 = _1926 * _1926;
    float _1934 = fma(_1930, _1930, _1932);
    float _1936 = _1758 * _1872;
    float _1938 = sqrt(_1934);
    float _1940 = -_1936;
    float _1942 = fma(_1764, _1868, _1940);
    float _1944 = _1942 * _1890;
    float _1946 = fma(_1870, _1900, _1944);
    float _1948 = fma(_1766, _1908, _1946);
    bool _1950 = _1938 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1952 = _509 + _1948;
    float _1954 = _1900;
    float _1956 = _1952;
    float _1958 = _1920;
    float _1960 = _1934;
    if (!_1950)
    {
        _1954 = _1922;
    }
    float _1962 = _1954;
    bool _1964 = !_1950;
    float _1966 = _1962;
    float _1968 = _1464;
    if (!_1964)
    {
        float _1970 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1974 = _1938 + _1972;
        float _1976 = _1952 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1978 = rsqrt(_1934);
        float _1980 = _1974 * _1970;
        float _1982 = _1980 * 0.15915493667125701904296875;
        float _1984 = _1982 * 6.283185482025146484375;
        float _1986 = cos(_1984);
        float _1988 = _1982 * 6.283185482025146484375;
        float _1990 = sin(_1988);
        float _1992 = _1986 + (-1.0);
        float _1994 = fma(_1990, _1976, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1996 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1998 = _1978 * _1994;
        float _2000 = fma(_1952, _1986, _1996);
        float _2002 = fma(_1930, _1998, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2004 = fma(_1926, _1998, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1966 = _2002;
        _1956 = _2000;
        _1958 = _2004;
        _1960 = _1978;
    }
    float _2006 = _1966;
    float _2008 = _1956;
    float _2010 = _1958;
    float _2012 = _1960;
    float _2014 = -_839;
    float _2016 = fma(_2014, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2006);
    float _2018 = -_837;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2008);
    float _2022 = -_847;
    float _2024 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2010);
    float _2026 = _2020;
    float _2028 = _2024;
    float _2030 = _2016;
    float _2032 = _2012;
    if (_1636)
    {
        _841 = _2016;
    }
    float _2034 = _841;
    float _2036 = _2034;
    if (!_1636)
    {
        float _2038 = _855 * _855;
        float _2040 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2042 = -_587;
        float _2044 = _2042 + _2010;
        float _2046 = fma(_863, _863, _2038);
        float _2048 = fma(_869, _869, _2046);
        float _2050 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2052 = sqrt(_2048);
        float _2054 = 1.0 / _1752;
        float _2056 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2058 = precise::min(_2052, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2060 = _2058 * _2040;
        float _2062 = _2060 * _2054;
        float _2064 = -_509;
        float _2066 = _2064 + _2008;
        float _2068 = -_585;
        float _2070 = _2068 + _2006;
        float _2072 = _2056 * _2062;
        float _2074 = _2044 * _2062;
        float _2076 = fma(_2066, _2072, _845);
        float _2078 = fma(_2070, _2072, _851);
        float _2080 = fma(_2056, _2074, _859);
        _2026 = _2076;
        _2036 = _2078;
        _2028 = _2080;
    }
    float _2082 = _2026;
    float _2084 = _2036;
    float _2086 = _2028;
    float _2088 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2090 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2092 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2094 = abs(_1450);
    bool _2096 = _2094 != 0.0;
    bool _2098 = isnan(_2094);
    bool _2100 = _2096 || _2098;
    bool _2102 = isnan(0.0);
    bool _2104 = _2100 || _2102;
    float _2106 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2088);
    float _2108 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2090);
    float _2110 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2112 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2092);
    float _2114 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2106);
    float _2116 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2108);
    float _2118 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2110);
    float _2120 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2112);
    float _2122 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2124 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2126 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2118);
    float _2128 = _2120 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2130 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2132 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2134 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2136 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2138 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2130);
    float _2140 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2132);
    float _2142 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2134);
    float _2144 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2136);
    float _2146 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2148 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2140);
    float _2150 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2138);
    float _2152 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2142);
    float _2154 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2144);
    float _2156 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2148);
    float _2158 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2150);
    float _2160 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2152);
    float _2162 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2154);
    out.gl_Position.x = _2158;
    out.gl_Position.y = _2156;
    out.gl_Position.z = _2160;
    out.gl_Position.w = _2162;
    float _2164 = _2152;
    float _2166 = _2142;
    float _2168 = _2140;
    if (_2104)
    {
        _2164 = _2162;
    }
    float _2170 = _2164;
    float _2172 = _2170;
    if (!_2104)
    {
        _2172 = 0.0;
    }
    float _2174 = _2172;
    float _2176 = _2174;
    if (!_2104)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_1100)
    {
        int _2178 = _1156 << 4;
        int _2180 = _2178 + 2048;
        uint _2182 = uint(int(uint(_2180) >> uint(2)));
        uint _2184 = uint(int(uint(int(_2182)) >> uint(2)));
        int _2186 = int(_2182) & 3;
        float _2188 = (*spvDescriptorSet0.vp_c15)._m0[int(_2184)][_2186];
        int _2190 = int(_2182) + 1;
        uint _2192 = uint(int(uint(_2190) >> uint(2)));
        int _2194 = _2190 & 3;
        float _2196 = (*spvDescriptorSet0.vp_c15)._m0[int(_2192)][_2194];
        int _2198 = _2180 + 8;
        uint _2200 = uint(int(uint(_2198) >> uint(2)));
        uint _2202 = uint(int(uint(int(_2200)) >> uint(2)));
        int _2204 = int(_2200) & 3;
        float _2206 = (*spvDescriptorSet0.vp_c15)._m0[int(_2202)][_2204];
        int _2208 = int(_2200) + 1;
        uint _2210 = uint(int(uint(_2208) >> uint(2)));
        int _2212 = _2208 & 3;
        float _2214 = (*spvDescriptorSet0.vp_c15)._m0[int(_2210)][_2212];
        float _2216 = _887 * _2196;
        float _2218 = fma(_851, _2188, _2216);
        float _2220 = fma(_859, _2206, _2218);
        float _2222 = _2220 + _2214;
        float _2224 = precise::clamp(_2222, 0.0, 1.0);
        float _2226 = -_2224;
        float _2228 = _2226 + _1458;
        float _2230 = fma(_2228, 500.0, 1.5);
        float _2232 = exp2(_2230);
        float _2234 = 0.0 + _2232;
        float _2236 = precise::clamp(_2234, 0.0, 1.0);
        bool _2238 = _2236 >= 1.0;
        bool _2240 = isnan(_2236);
        bool _2242 = _2238 || _2240;
        bool _2244 = isnan(1.0);
        bool _2246 = _2242 || _2244;
        _2030 = _2206;
        _2166 = _2232;
        _973 = _2216;
        _2168 = as_type<float>(_2180);
        if (!_2246)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_2246)
        {
            _2176 = 0.0;
        }
    }
    float _2248 = _2030;
    float _2250 = _2166;
    float _2252 = _2176;
    float _2254 = _973;
    float _2256 = _2168;
    float _2258 = _2256;
    float _2260 = _2248;
    float _2262 = _2250;
    float _2264 = _2254;
    if (_1126)
    {
        _2258 = 1.0;
    }
    float _2266 = _2258;
    float _2268 = _2266;
    if (!_1126)
    {
        int _2270 = _1162 << 4;
        int _2272 = _2270 + 2048;
        uint _2274 = uint(int(uint(_2272) >> uint(2)));
        uint _2276 = uint(int(uint(int(_2274)) >> uint(2)));
        int _2278 = int(_2274) & 3;
        float _2280 = (*spvDescriptorSet0.vp_c15)._m0[int(_2276)][_2278];
        int _2282 = int(_2274) + 1;
        uint _2284 = uint(int(uint(_2282) >> uint(2)));
        int _2286 = _2282 & 3;
        float _2288 = (*spvDescriptorSet0.vp_c15)._m0[int(_2284)][_2286];
        int _2290 = _2272 + 8;
        uint _2292 = uint(int(uint(_2290) >> uint(2)));
        uint _2294 = uint(int(uint(int(_2292)) >> uint(2)));
        int _2296 = int(_2292) & 3;
        float _2298 = (*spvDescriptorSet0.vp_c15)._m0[int(_2294)][_2296];
        int _2300 = int(_2292) + 1;
        uint _2302 = uint(int(uint(_2300) >> uint(2)));
        int _2304 = _2300 & 3;
        float _2306 = (*spvDescriptorSet0.vp_c15)._m0[int(_2302)][_2304];
        float _2308 = _921 * _2288;
        float _2310 = fma(_851, _2280, _2308);
        float _2312 = fma(_859, _2298, _2310);
        float _2314 = _2312 + _2306;
        float _2316 = precise::clamp(_2314, 0.0, 1.0);
        float _2318 = -_2316;
        float _2320 = _2318 + _1464;
        float _2322 = fma(_2320, 500.0, 1.5);
        float _2324 = exp2(_2322);
        float _2326 = 0.0 + _2324;
        float _2328 = precise::clamp(_2326, 0.0, 1.0);
        _2260 = _2298;
        _2262 = _2324;
        _2268 = _2328;
    }
    float _2330 = _2260;
    float _2332 = _2262;
    float _2334 = _2268;
    float _2336 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2338 = _2082 + _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2342 = _2084 + _2340;
    float _2344 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2346 = _2086 + _2344;
    float _2348 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2350 = _2338 * _2338;
    float _2352 = fma(_2342, _2342, _2350);
    float _2354 = fma(_2346, _2346, _2352);
    float _2356 = rsqrt(_2354);
    float _2358 = sqrt(_2354);
    float _2360 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2362 = _2342 * _2360;
    float _2364 = _2346 * _2360;
    float _2366 = _2362 * _2362;
    float _2368 = _2364 * _2364;
    float _2370 = _2366 + _2368;
    float _2372 = sqrt(_2370);
    bool _2374 = _2372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2378 = _2372 + _2376;
    float _2380 = _2330;
    float _2382 = _2370;
    float _2384 = _2378;
    float _2386 = _2338;
    float _2388 = _2362;
    float _2390 = _2364;
    float _2392 = _2366;
    float _2394 = _2368;
    if (_2374)
    {
        float _2396 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2380 = _2396;
    }
    float _2398 = _2380;
    if (_2374)
    {
        float _2400 = rsqrt(_2370);
        _2382 = _2400;
    }
    float _2402 = _2382;
    float _2404 = _2402;
    if (_2374)
    {
        float _2406 = _2378 * _2398;
        _2384 = _2406;
    }
    float _2408 = _2384;
    if (_2374)
    {
        float _2410 = _2408 * 0.15915493667125701904296875;
        _1968 = _2410;
    }
    float _2412 = _1968;
    float _2414 = _2332;
    if (_2374)
    {
        float _2416 = _2412 * 6.283185482025146484375;
        float _2418 = cos(_2416);
        _2414 = _2418;
    }
    float _2420 = _2414;
    float _2422 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2424 = precise::max(0.0, _2422);
    float _2426 = _1458;
    float _2428 = _2422;
    float _2430 = _2424;
    if (_2374)
    {
        float _2432 = _2412 * 6.283185482025146484375;
        float _2434 = sin(_2432);
        _2426 = _2434;
    }
    float _2436 = _2426;
    float _2438 = -_2360;
    float _2440 = -_2424;
    float _2442 = fma(_2338, _2438, _2440);
    if (_2374)
    {
        float _2444 = _2442 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2386 = _2444;
    }
    float _2446 = _2386;
    float _2448 = _2446;
    if (_2374)
    {
        float _2450 = _2420 + (-1.0);
        _2428 = _2450;
    }
    float _2452 = _2428;
    float _2454 = _2452;
    if (_2374)
    {
        float _2456 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2430 = _2456;
    }
    float _2458 = _2430;
    float _2460 = _2436;
    if (_2374)
    {
        float _2462 = fma(_2436, _2446, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2460 = _2462;
    }
    float _2464 = _2460;
    if (!_2374)
    {
        _2448 = _2442;
    }
    float _2466 = _2448;
    float _2468 = _2466;
    if (_2374)
    {
        float _2470 = fma(_2442, _2420, _2458);
        _2468 = _2470;
    }
    float _2472 = _2468;
    if (_2374)
    {
        float _2474 = _2402 * _2464;
        _2454 = _2474;
    }
    float _2476 = _2454;
    if (_2374)
    {
        float _2478 = _2362 * _2476;
        _2388 = _2478;
    }
    float _2480 = _2388;
    if (_2374)
    {
        float _2482 = _2364 * _2476;
        _2390 = _2482;
    }
    float _2484 = _2390;
    if (_2374)
    {
        float _2486 = _2480 * _2480;
        _2392 = _2486;
    }
    float _2488 = _2392;
    if (_2374)
    {
        float _2490 = _2484 * _2484;
        _2394 = _2490;
    }
    float _2492 = _2394;
    float _2494 = fma(_2472, _2472, _2488);
    float _2496 = _2494 + _2492;
    float _2498 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2500 = rsqrt(_2496);
    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2504 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2502);
    float _2506 = precise::clamp(_2504, 0.0, 1.0);
    float _2508 = -_2348;
    float _2510 = fma(_2508, _2498, 1.0);
    float _2512 = -_2506;
    float _2514 = _2512 + 1.0;
    float _2516 = log2(_2510);
    float _2518 = _2500 * _2480;
    float _2520 = abs(_2514);
    float _2522 = log2(_2520);
    float _2524 = _2500 * _2472;
    float _2526 = _2500 * _2484;
    float _2528 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2530 = -_2528;
    float _2532 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2530);
    float _2534 = 1.0 / _2252;
    float _2536 = _2516 * 0.693147182464599609375;
    float _2538 = -_2526;
    float _2540 = fma(_2538, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2532);
    float _2542 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2544 = fma(_2540, -0.5, 0.5);
    float _2546 = _2522 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2548 = fma(_2540, 0.5, 0.5);
    float _2550 = _2524 + 1.0;
    float _2552 = sqrt(_2544);
    float _2554 = fma(_2548, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2556 = fma(_2548, _2554, -0.212114393711090087890625);
    float _2558 = _2158 * _2534;
    float _2560 = _2156 * _2534;
    float _2562 = exp2(_2546);
    float _2564 = fma(_2548, _2556, 1.570728778839111328125);
    float _2566 = fma(_2558, 0.5, 0.5);
    float _2568 = fma(_2560, -0.5, 0.5);
    float _2570 = _2552 * 0.636619746685028076171875;
    float _2572 = -_2524;
    float _2574 = fma(_2562, _2550, _2572);
    float _2576 = -_2564;
    float _2578 = fma(_2570, _2576, 1.0);
    float3 _7324 = float3(_2566, _2568, _2542);
    float _2580 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7324, float3(0.0), isnan(_7324)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7324, float3(0.0), isnan(_7324)), level(0.0)).x;
    float3 _7333 = float3(_2566, _2568, _2542);
    float4 _2583 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7333, float3(0.0), isnan(_7333)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7333, float3(0.0), isnan(_7333)), level(0.0)).xyzw;
    float _2585 = _2583.x;
    float _2587 = _2583.y;
    float _2589 = _2583.z;
    float _2591 = _2583.w;
    float _2593 = fma(_2574, 0.5, 0.5);
    float2 _7351 = float2(_2578, _2593);
    float3 _2597 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7351, float2(0.0), isnan(_7351)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7351, float2(0.0), isnan(_7351)), level(0.0)).xyz;
    float _2599 = _2597.x;
    float _2601 = _2597.y;
    float _2603 = _2597.z;
    bool _2605 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2607 = isnan(0.5);
    bool _2609 = _2605 || _2607;
    bool _2611 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2613 = _2609 || _2611;
    float _2615 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2617 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2619 = _2522 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2621 = -_1452;
    float _2623 = _2621 + 1.0;
    float _2625 = abs(_951);
    float _2627 = log2(_2625);
    float _2629 = _2160 + _2162;
    float _2631 = _2629 * 0.5;
    float _2633 = _2536;
    float _2635 = _2627;
    if (!_2613)
    {
        float _2637 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        _2633 = _2637;
    }
    float _2639 = _2633;
    float _2641 = exp2(_2619);
    out.m_86.z = _2631;
    out.m_86.w = _2162;
    float _2643 = _2639;
    if (!_2613)
    {
        float _2645 = _2639 * 0.15915493667125701904296875;
        _2032 = _2645;
    }
    float _2647 = _2032;
    if (!_2613)
    {
        float _2649 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        _2643 = _2649;
    }
    float _2651 = _2643;
    float _2653 = _2412;
    float _2655 = _2651;
    if (!_2613)
    {
        float _2657 = _2647 * 6.283185482025146484375;
        float _2659 = cos(_2657);
        _2653 = _2659;
    }
    float _2661 = _2653;
    if (!_2613)
    {
        float _2663 = _2651 * 0.15915493667125701904296875;
        _2264 = _2663;
    }
    float _2665 = _2264;
    if (!_2613)
    {
        float _2667 = _2647 * 6.283185482025146484375;
        float _2669 = sin(_2667);
        _2404 = _2669;
    }
    float _2671 = _2404;
    float _2673 = _2661;
    float _2675 = _2671;
    if (!_2613)
    {
        float _2677 = 1.0 / _2661;
        _2673 = _2677;
    }
    float _2679 = _2673;
    float _2681 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (_2613)
    {
        _2635 = 1.0;
    }
    float _2683 = _2635;
    float _2685 = _2464;
    float _2687 = _2683;
    if (!_2613)
    {
        float _2689 = _2665 * 6.283185482025146484375;
        float _2691 = cos(_2689);
        _2685 = _2691;
    }
    float _2693 = _2685;
    if (!_2613)
    {
        float _2695 = _2671 * _2679;
        _2675 = _2695;
    }
    float _2697 = _2675;
    float _2699 = _2697;
    if (!_2613)
    {
        float _2701 = _2665 * 6.283185482025146484375;
        float _2703 = sin(_2701);
        _2655 = _2703;
    }
    float _2705 = _2655;
    float _2707 = _2693;
    float _2709 = _2705;
    if (!_2613)
    {
        float _2711 = _2693 * _2697;
        _2707 = _2711;
    }
    float _2713 = _2707;
    if (!_2613)
    {
        _2699 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2715 = _2699;
    float _2717 = exp2(_2681);
    float _2719 = _1876 * _1942;
    float _2721 = _2715;
    if (!_2613)
    {
        float _2723 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2725 = _2715 + _2723;
        _2721 = _2725;
    }
    float _2727 = _2721;
    float _2729 = fma(_1858, _1870, _2719);
    float _2731 = _2442;
    if (!_2613)
    {
        float _2733 = 1.0 / _2713;
        _2731 = _2733;
    }
    float _2735 = _2731;
    float _2737 = _1876 * _1904;
    float _2739 = _1876 * _1896;
    float _2741 = fma(_1858, _1868, _2737);
    float _2743 = fma(_1858, _1872, _2739);
    float _2745 = _2727;
    if (!_2613)
    {
        float _2747 = 1.0 / _2727;
        _2745 = _2747;
    }
    float _2749 = _2745;
    float _2751 = fma(_2717, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2753 = precise::clamp(_2751, 0.0, 1.0);
    float _2755 = _1850 * _1904;
    float _2757 = _1850 * _1942;
    float _2759 = fma(_1844, _1758, _2741);
    float _2761 = -_1778;
    float _2763 = fma(_2761, _1868, _2755);
    float _2765 = -_1778;
    float _2767 = fma(_2765, _1870, _2757);
    if (!_2613)
    {
        float _2769 = _2705 * _2735;
        _2709 = _2769;
    }
    float _2771 = _2709;
    float _2773 = fma(_1856, _1758, _2763);
    float _2775 = fma(_1856, _1766, _2767);
    float _2777 = _2771;
    if (!_2613)
    {
        float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2781 = fma(_951, _2771, _2779);
        _2777 = _2781;
    }
    float _2783 = _2777;
    bool _2785 = _951 <= 8000.0;
    bool _2787 = isnan(_951);
    bool _2789 = _2785 || _2787;
    bool _2791 = isnan(8000.0);
    bool _2793 = _2789 || _2791;
    float _2795 = float(_2793);
    float _2797 = _2615 * _2773;
    if (!_2613)
    {
        float _2799 = _2783 * _2749;
        float _2801 = precise::clamp(_2799, 0.0, 1.0);
        _2687 = _2801;
    }
    float _2803 = _2687;
    float _2805 = _1850 * _1896;
    float _2807 = _1842 * _1904;
    float _2809 = _1842 * _1942;
    float _2811 = _1842 * _1896;
    float _2813 = -_1778;
    float _2815 = fma(_2813, _1872, _2805);
    float _2817 = fma(_1854, _1868, _2807);
    float _2819 = fma(_1854, _1870, _2809);
    float _2821 = fma(_1854, _1872, _2811);
    float _2823 = fma(_1856, _1764, _2815);
    float _2825 = fma(_1844, _1766, _2729);
    float _2827 = fma(_1848, _1766, _2819);
    float _2829 = fma(_1848, _1764, _2821);
    float _2831 = _2615 * _2823;
    float _2833 = fma(_1848, _1758, _2817);
    float _2835 = _2615 * _2775;
    float _2837 = fma(_1844, _1764, _2743);
    float _2839 = fma(_2617, _2829, _2831);
    float _2841 = fma(_2617, _2833, _2797);
    float _2843 = fma(_2617, _2827, _2835);
    float _2845 = _2837 + _2839;
    bool _2847 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2849 = isnan(_2358);
    bool _2851 = _2847 || _2849;
    bool _2853 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2855 = _2851 || _2853;
    float _2857 = fma(_2753, -2.0, 3.0);
    float _2859 = _2753 * _2753;
    float _2861 = _2759 + _2841;
    float _2863 = _2825 + _2843;
    float _2865 = _2803 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2867 = _2859 * _2857;
    out.m_88.x = _2861;
    out.m_88.y = _2863;
    out.m_88.z = _2845;
    float _2869 = -_2867;
    float _2871 = _2869 + 1.0;
    float _2873 = _2841;
    if (!_2855)
    {
        _2873 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2875 = _2873;
    float _2877 = fma(_2871, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2867);
    float _2879 = -_2641;
    float _2881 = _2879 + 1.0;
    float _2883 = _2795 * _2877;
    float _2885 = _2877;
    float _2887 = _2875;
    float _2889 = _2875;
    if (!_1368)
    {
        _2885 = 1.0;
    }
    float _2891 = _2885;
    float _2893 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2895 = _2891;
    float _2897 = _2893;
    float _2899 = _2587;
    float _2901 = _2585;
    if (_1368)
    {
        bool _2903 = _1470 >= _1448;
        bool _2905 = isnan(_1470);
        bool _2907 = _2903 || _2905;
        bool _2909 = isnan(_1448);
        bool _2911 = _2907 || _2909;
        float _2913 = float(_2911);
        _2895 = _2913;
    }
    float _2915 = _2895;
    float _2917 = _2883 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2919 = -_2893;
    float _2921 = _2919 + 1.0;
    float _2923 = _2623 * _2917;
    float _2925 = precise::clamp(_2923, 0.0, 1.0);
    float _2927 = _2915 * _2334;
    float _2929 = -_2925;
    float _2931 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2933 = -_2927;
    float _2935 = fma(_2933, _2931, 1.0);
    float _2937 = precise::clamp(_2935, 0.0, 1.0);
    float _2939 = _2937 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2941 = _2937;
    float _2943 = _2921;
    if (!_2855)
    {
        _2941 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2945 = _2941;
    out.m_90.x = _2939;
    float _2947 = _2893 * _2580;
    float _2949 = _2591 * _2921;
    float _2951 = _2945;
    float _2953 = _2945;
    if (!_2855)
    {
        _2943 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2955 = _2943;
    float _2957 = _2591 * _2947;
    float _2959 = _2955;
    float _2961 = _2955;
    if (!_2855)
    {
        _2897 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2963 = _2897;
    float _2965 = _2603 * _2947;
    float _2967 = fma(_2599, _2957, _2585);
    float _2969 = fma(_2601, _2957, _2587);
    float _2971 = _2963;
    float _2973 = _2963;
    if (!_2855)
    {
        _2899 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2975 = _2899;
    float _2977 = fma(_2591, _2965, _2589);
    float _2979 = _2975;
    float _2981 = _2975;
    if (!_2855)
    {
        _2901 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2983 = _2901;
    out.m_92.x = _2967;
    out.m_92.y = _2969;
    out.m_92.z = _2977;
    out.m_92.w = _2949;
    bool _2985 = !_2855;
    float _2987 = _2983;
    float _2989 = _2983;
    if (!_2985)
    {
        bool _2991 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2993 = isnan(_2358);
        bool _2995 = _2991 || _2993;
        bool _2997 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2999 = _2995 || _2997;
        if (!_2999)
        {
            float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3003 = _2358 + _3001;
            float _3005 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3007 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3005;
            float _3009 = 1.0 / _3007;
            float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3013 = _3011 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3017 = _3015 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3025 = _3023 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3027 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3029 = _3027 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3031 = _3003 * _3009;
            float _3033 = precise::clamp(_3031, 0.0, 1.0);
            float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3037 = _3035 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3039 = fma(_3033, _3013, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3041 = fma(_3033, _3037, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3043 = fma(_3033, _3017, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3045 = fma(_3033, _3021, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3047 = fma(_3033, _3025, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3049 = fma(_3033, _3029, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2981 = _3041;
            _2953 = _3047;
            _2961 = _3039;
            _2889 = _3045;
            _2989 = _3043;
            _2973 = _3049;
            _3051 = true;
        }
        else
        {
            bool _3053 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3055 = isnan(_2358);
            bool _3057 = _3053 || _3055;
            bool _3059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3061 = _3057 || _3059;
            if (!_3061)
            {
                _2959 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3063 = _2959;
            _2961 = _3063;
            if (!_3061)
            {
                _2979 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3065 = _2979;
            _2981 = _3065;
            if (!_3061)
            {
                _2987 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3067 = _2987;
            _2989 = _3067;
            if (!_3061)
            {
                _2887 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3069 = _2887;
            _2889 = _3069;
            if (!_3061)
            {
                _2951 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3071 = _2951;
            _2953 = _3071;
            if (!_3061)
            {
                _2971 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3073 = _2971;
            bool _3075 = !_3061;
            _2973 = _3073;
            if (!_3075)
            {
                bool _3077 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3079 = isnan(_2358);
                bool _3081 = _3077 || _3079;
                bool _3083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3085 = _3081 || _3083;
                if (!_3085)
                {
                    float _3087 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3089 = _2358 + _3087;
                    float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3093 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3091;
                    float _3095 = 1.0 / _3093;
                    float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3103 = _3101 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3117 = _3089 * _3095;
                    float _3119 = precise::clamp(_3117, 0.0, 1.0);
                    float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3123 = _3121 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3125 = fma(_3119, _3099, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3127 = fma(_3119, _3123, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3129 = fma(_3119, _3103, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3131 = fma(_3119, _3107, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3133 = fma(_3119, _3111, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3135 = fma(_3119, _3115, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2981 = _3127;
                    _2953 = _3133;
                    _2961 = _3125;
                    _2889 = _3131;
                    _2989 = _3129;
                    _2973 = _3135;
                    _3051 = true;
                }
                else
                {
                    _2981 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2953 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2961 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2889 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2989 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2973 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3051 = false;
    float _3137 = _2981;
    float _3139 = _2953;
    float _3141 = _2961;
    float _3143 = _2889;
    float _3145 = _2989;
    float _3147 = _2973;
    float _3149 = _2865 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3151 = fma(_2863, -0.5, 0.5);
    float _3153 = precise::clamp(_3151, 0.0, 1.0);
    float _3155 = -_3137;
    float _3157 = _3155 + _3139;
    float _3159 = -_3141;
    float _3161 = _3159 + _3143;
    out.m_61.x = _3149;
    float _3163 = -_3145;
    float _3165 = _3163 + _3147;
    float _3167 = fma(_3153, _3157, _3137);
    float _3169 = fma(_3153, _3161, _3141);
    bool _3171 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3173 = _3167 * 0.586610972881317138671875;
    float _3175 = fma(_3153, _3165, _3145);
    out.m_94.x = 0.0;
    bool _3177 = _2803 > 0.0;
    bool _3179 = isnan(_2803);
    bool _3181 = _3177 || _3179;
    bool _3183 = isnan(0.0);
    bool _3185 = _3181 || _3183;
    float _3187 = fma(_3169, 0.298911988735198974609375, _3173);
    float _3189 = fma(_3175, 0.114477999508380889892578125, _3187);
    float _3191 = -_3189;
    float _3193 = _3169 + _3191;
    float _3195 = -_3189;
    float _3197 = _3167 + _3195;
    float _3199 = -_3189;
    float _3201 = _3175 + _3199;
    float _3203 = fma(_3193, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3189);
    float _3205 = fma(_3197, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3189);
    float _3207 = fma(_3201, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3189);
    bool _3209 = !_3171;
    if (!_3209)
    {
        float _3211 = -_2082;
        float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3215 = -_2084;
        float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3219 = -_2086;
        float _3221 = _3219 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3223 = _3213 * _3213;
        float _3225 = fma(_3217, _3217, _3223);
        float _3227 = fma(_3221, _3221, _3225);
        float _3229 = sqrt(_3227);
        float _3231 = rsqrt(_3227);
        float _3233 = -_3229;
        float _3235 = _3233 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3237 = _3235 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3239 = precise::clamp(_3237, 0.0, 1.0);
        float _3241 = _3217 * _3231;
        float _3243 = _3213 * _3231;
        float _3245 = abs(_3239);
        float _3247 = log2(_3245);
        float _3249 = _3221 * _3231;
        float _3251 = _3241 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3253 = _2863 * _3243;
        float _3255 = -_3243;
        float _3257 = -_3251;
        float _3259 = fma(_3255, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3257);
        float _3261 = fma(_2861, _3241, _3253);
        float _3263 = -_3249;
        float _3265 = fma(_3263, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3259);
        float _3267 = fma(_2845, _3249, _3261);
        float _3269 = precise::clamp(_3267, 0.0, 1.0);
        float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3273 = _3265 + _3271;
        float _3275 = _3247 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3277 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3279 = precise::clamp(_3277, 0.0, 1.0);
        float _3281 = exp2(_3275);
        float _3283 = _3281 * _3279;
        float _3285 = _3269 * _3283;
        float _3287 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3289 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3291 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _3287;
        out.m_94.y = _3289;
        out.m_94.z = _3291;
    }
    out.m_96.x = _3203;
    out.m_96.y = _3205;
    out.m_96.z = _3207;
    if (_3185)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3293 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_61.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3293;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

