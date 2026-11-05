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
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_14 [[id(8)]];
    sampler vp_t_tcb_14Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_14Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_70 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_94 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(1)]];
    float4 m_74 [[attribute(2)]];
    float4 m_76 [[attribute(3)]];
    float4 m_82 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_66 [[attribute(7)]];
    float4 m_68 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2731 = false;
    bool _425 = false;
    bool _313 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _3036 = as_type<float>(_131);
        out.gl_Position.z = _3036;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_61.w;
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
        out.m_59.x = 0.0;
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
        float _3105 = as_type<float>(_169);
        out.gl_Position.z = _3105;
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
        float _193 = in.m_66.x;
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
    bool _245 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _247 = isnan(_219);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _257;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _263 = 1.0 / _239;
    float _265 = _255 * _243;
    float _267 = -_255;
    float _269 = _267 + 1.0;
    float _271 = _223 * _263;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = fma(_259, _271, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _279 = fma(_275, _271, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _281 = _277 * _265;
    float _283 = _279 * _265;
    float _285 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    bool _293 = !_261;
    float _311;
    if (!_293)
    {
        float _295 = in.m_66.x;
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
    float _359 = -_333;
    float _361 = _359 + 1.0;
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _365 = 1.0 / _337;
    float _367 = _349 * _361;
    float _369 = -_349;
    float _371 = _369 + 1.0;
    float _373 = _353 * _365;
    float _375 = fma(_373, _357, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _377 = _375 * _367;
    float _379 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[115].x, _377);
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _387 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[116].x, _379);
    float _389 = in.m_68.x;
    float _391 = in.m_68.y;
    float _393 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _395 = _383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _397 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _387 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_70.x = _393;
    out.m_70.y = _395;
    out.m_70.z = _397;
    out.m_70.w = _399;
    float _401 = _291 * _391;
    float _403 = _289 * _389;
    bool _405 = !_363;
    float _423;
    if (!_405)
    {
        float _407 = in.m_66.x;
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
    float _435 = in.m_66.x;
    float _437 = in.m_66.y;
    float _439 = in.m_66.z;
    float _441 = in.m_66.w;
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _445 = in.m_56.x;
    float _447 = in.m_56.y;
    float _449 = in.m_56.z;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _453 = _451 != 0;
    float _455 = in.m_72.x;
    float _457 = in.m_72.y;
    float _459 = in.m_72.z;
    float _461 = in.m_72.w;
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _465 = _463 != 0;
    int _467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _469 = _467 != 0;
    float _471 = in.m_74.x;
    float _473 = in.m_74.y;
    float _475 = in.m_74.z;
    float _477 = in.m_74.w;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _485 = _483 != 0;
    float _487 = in.m_76.x;
    float _489 = in.m_76.y;
    float _491 = in.m_76.z;
    float _493 = in.m_76.w;
    bool _495 = _441 > 0.5;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _501 = _435 > 0.5;
    float _503 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _505 = 1.0 / _499;
    float _507 = _447 * _457;
    float _509 = _447 * _473;
    float _511 = fma(_445, _455, _507);
    float _513 = fma(_445, _471, _509);
    float _515 = _447 * _489;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _517;
    float _521 = fma(_449, _475, _513);
    float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _525 = fma(_445, _487, _515);
    float _527 = -_185;
    int _529 = _501 ? as_type<int>(_527) : as_type<int>(_185);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _533 = _437 > 0.5;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _537 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _539 = fma(_449, _459, _511);
    float _541 = fma(_449, _491, _525);
    float _543 = _519 * _505;
    float _545 = -_189;
    int _547 = _533 ? as_type<int>(_545) : as_type<int>(_189);
    float _549 = -_531;
    float _551 = fma(_503, 2.0, _549);
    float _553 = _519;
    if (!_453)
    {
        _553 = _439;
    }
    float _555 = _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _559 = _433 + _557;
    float _561 = _555;
    if (_453)
    {
        _561 = _437;
    }
    float _563 = _561;
    float _565 = fma(_537, -2.0, _535);
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _569 = !_465;
    float _571 = _569 ? _185 : as_type<float>(_529);
    float _573 = fma(_543, _559, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _575 = !_469;
    float _577 = _575 ? _189 : as_type<float>(_547);
    float _579 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[83].w, _567);
    float _581 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _565);
    float _583 = _541 + _493;
    float _585 = _443 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _587 = _523 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _589 = -_149;
    float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[76].x, _551);
    float _593 = _571 + 0.5;
    float _595 = _577 + (-0.5);
    bool _597 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _599 = isnan(_433);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = _521 + _477;
    float _611 = fma(_585, _593, _591);
    float _613 = -_587;
    float _615 = -_581;
    float _617 = fma(_613, _595, _615);
    bool _619 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _621 = isnan(_433);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -_607;
    float _633 = _631 + 1.0;
    float _635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _637 = _581;
    float _639 = _617;
    if (!_453)
    {
        _637 = _437;
    }
    float _641 = _637;
    float _643 = _629 * _633;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _647 = _641;
    if (_453)
    {
        _647 = _435;
    }
    float _649 = _647;
    float _651 = _573 * _643;
    bool _653 = _439 > 0.5;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _659 = _649 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _661 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[83].z, _645);
    float _663 = -_185;
    int _665 = _653 ? as_type<int>(_663) : as_type<int>(_185);
    float _667 = -_629;
    float _669 = _667 + 1.0;
    float _671 = _649;
    if (!_453)
    {
        _671 = _439;
    }
    float _673 = _671;
    float _675 = -_655;
    float _677 = fma(_659, 2.0, _675);
    float _679 = _539 + _461;
    float _681 = _673;
    if (_453)
    {
        _681 = _437;
    }
    float _683 = _681;
    float _685 = -_149;
    float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[81].x, _677);
    bool _689 = !_481;
    float _691 = _689 ? _185 : as_type<float>(_665);
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _695 = _683 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _697 = _635 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _699 = _691 + 0.5;
    float _701 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _579);
    float _703 = fma(_695, -2.0, _693);
    float _705 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[131].x, _651);
    float _707 = -_189;
    int _709 = _495 ? as_type<int>(_707) : as_type<int>(_189);
    float _711 = fma(_697, _699, _687);
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _715 = _609 + _713;
    float _717 = _657 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _719 = !_485;
    float _721 = _719 ? _189 : as_type<float>(_709);
    float _723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _725 = _679 + _723;
    float _727 = _715 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _729 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _703);
    float _731 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _733 = _583 + _731;
    float _735 = _721 + (-0.5);
    float _737 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[28].x, _727);
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _743 = -_717;
    float _745 = -_729;
    float _747 = fma(_743, _735, _745);
    float _749 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[28].z, _737);
    float _751 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].z, _739);
    float _753 = -_701;
    float _755 = _753 + 1.0;
    float _757 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].w, _741);
    float _759 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[132].x, _705);
    float _761 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _751);
    bool _763 = _749 >= 0.0;
    float _765 = fma(_721, _755, _747);
    float _767 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _757);
    float _769 = -_761;
    float _771 = _769 + 1.0;
    float _773 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _661);
    float _775 = -_767;
    float _777 = _775 + 1.0;
    float _779 = -_771;
    float _781 = fma(_571, _779, _611);
    float _783 = _715 * _715;
    float _785 = -_773;
    float _787 = _785 + 1.0;
    float _789 = fma(_725, _725, _783);
    float _791 = fma(_577, _777, _617);
    if (_763)
    {
        _639 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _793 = _639;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _797 = fma(_733, _733, _789);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _803 = -_787;
    float _805 = fma(_691, _803, _711);
    float _807 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = rsqrt(_797);
    float _811 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = _801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _815 = _759 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _817 = as_type<int>(_793);
    if (_763)
    {
        float _819 = _793 * 5.0;
        _817 = as_type<int>(_819);
    }
    int _821 = _817;
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _825 = _823 != 0;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _829 = _827 != 0;
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _833 = _831 != 0;
    out.m_78.x = _781;
    out.m_78.y = _791;
    out.m_78.z = _805;
    out.m_78.w = _765;
    out.m_80.x = _807;
    out.m_80.y = _811;
    out.m_80.z = _813;
    out.m_80.w = _815;
    bool _835 = !_825;
    int _837 = _835 ? 0 : 1;
    bool _839 = !_829;
    int _841 = _839 ? 0 : 1;
    float _843 = as_type<float>(_821);
    if (_763)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4227 = as_type<float>(_821);
        out.gl_Position.z = _4227;
    }
    bool _845 = !_833;
    int _847 = _845 ? 0 : 1;
    float _849 = _715 * _809;
    float _851 = _725 * _809;
    float _853 = _849;
    if (_763)
    {
        out.m_59.x = 0.0;
    }
    if (_763)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _855 = -_849;
    float _857 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _609);
    float _859 = _733 * _809;
    float _861 = -_851;
    float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[18].w, _679);
    float _865 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _867 = _857 + _865;
    float _869 = -_859;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _583);
    float _873 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _875 = _863 + _873;
    float _877 = _867 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _881 = _871 + _879;
    float _883 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[28].x, _877);
    float _885 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[28].z, _883);
    bool _887 = _885 >= 0.0;
    float _889 = _859;
    if (_887)
    {
        _843 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _891 = _843;
    int _893 = as_type<int>(_891);
    if (_887)
    {
        out.m_59.x = 0.0;
    }
    if (_887)
    {
        float _895 = _891 * 5.0;
        _893 = as_type<int>(_895);
    }
    int _897 = _893;
    if (_887)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4333 = as_type<float>(_897);
        out.gl_Position.z = _4333;
    }
    if (_887)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _899 = fma(_863, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _901 = fma(_871, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _903 = floor(_899);
    float _905 = floor(_901);
    float _907 = -_903;
    float _909 = _899 + _907;
    float _911 = -_905;
    float _913 = _901 + _911;
    float2 _4369 = float2(_909, _913);
    float _915 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4369, float2(0.0), isnan(_4369)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4369, float2(0.0), isnan(_4369)), level(0.0)).x;
    float _917 = _439 * 2.0;
    float _919 = _435 * 2.0;
    float _921 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _923 = log2(_921);
    float _925 = -_849;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _715);
    int _929 = abs(_837);
    float _931 = -_851;
    float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[18].w, _725);
    float _935 = _927 * _927;
    float _937 = float(_929);
    float _939 = floor(_917);
    float _941 = -_859;
    float _943 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[18].w, _733);
    float _945 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _947 = floor(_919);
    float _949 = _923 * _149;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _953 = 1.0 + _951;
    float _955 = fma(_933, _933, _935);
    float _957 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _959 = fma(_943, _943, _955);
    bool _961 = _939 >= 0.0;
    bool _963 = isnan(_939);
    bool _965 = _961 || _963;
    bool _967 = isnan(0.0);
    bool _969 = _965 || _967;
    float _971 = exp2(_949);
    bool _973 = _939 > 0.0;
    float _975 = _857 + _957;
    int _977 = _969 ? 0 : 1;
    bool _979 = _947 > 0.0;
    float _981 = 1.0 / _953;
    bool _983 = _947 >= 0.0;
    bool _985 = isnan(_947);
    bool _987 = _983 || _985;
    bool _989 = isnan(0.0);
    bool _991 = _987 || _989;
    float _993 = _437 + _439;
    int _995 = ~_977;
    int _997 = _995 + 1;
    int _999 = _997 + 1;
    int _1001 = _991 ? 0 : 1;
    float _1003 = _993 + (-1.0);
    int _1005 = _999;
    int _1007 = 2;
    if (!_973)
    {
        int _1009 = ~_977;
        int _1011 = _1009 + 1;
        _1005 = _1011;
    }
    int _1013 = _1005;
    float _1015 = -_971;
    float _1017 = _1015 + 1.0;
    float _1019 = in.m_82.x;
    float _1021 = in.m_82.y;
    float _1023 = in.m_82.z;
    int _1025 = ~_1001;
    int _1027 = _1025 + 1;
    int _1029 = _1027 + 1;
    float _1031 = sqrt(_959);
    int _1033 = _1029;
    if (!_979)
    {
        int _1035 = ~_1001;
        int _1037 = _1035 + 1;
        _1033 = _1037;
    }
    int _1039 = _1033;
    float _1041 = _437 * 2.0;
    float _1043 = float(_1013);
    float _1045 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1047 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1049 = isnan(1.0);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1055 = _1051 || _1053;
    float _1057 = _437 + _435;
    bool _1059 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1061 = isnan(0.0);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1067 = _1063 || _1065;
    float _1069 = floor(_1041);
    float _1071 = _937 * _1043;
    int _1073 = abs(_841);
    float _1075 = _1057 + (-1.0);
    float _1077 = _1071 * (-2.0);
    float _1079 = float(_1073);
    float _1081 = _437 + (-0.5);
    float _1083 = float(_1039);
    float _1085 = _809 * _1031;
    float _1087 = _1067 ? _1017 : 0.0;
    float _1089 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1091 = _435 + (-0.5);
    float _1093 = _1079 * _1083;
    float _1095 = fma(_1077, _1019, _1019);
    if (_1055)
    {
        float _1097 = _1087 * _981;
        _153 = _1097;
    }
    float _1099 = _153;
    bool _1101 = _1069 > 0.0;
    float _1103 = fma(_1089, _1077, _1089);
    float _1105 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1095);
    float _1107 = _1093 * (-2.0);
    bool _1109 = _1069 >= 0.0;
    bool _1111 = isnan(_1069);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan(0.0);
    bool _1117 = _1113 || _1115;
    float _1119 = _439 + _435;
    float _1121 = fma(_1103, _1099, _1105);
    float _1123 = fma(_1045, _1107, _1045);
    float _1125 = fma(_1107, _1021, _1021);
    int _1127 = _1117 ? 0 : 1;
    float _1129 = _1121 * 0.15915493667125701904296875;
    int _1131 = abs(_847);
    float _1133 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1125);
    int _1135 = ~_1127;
    int _1137 = _1135 + 1;
    int _1139 = _1137 + 1;
    float _1141 = _1119 + (-1.0);
    int _1143 = _1139;
    if (!_1101)
    {
        int _1145 = ~_1127;
        int _1147 = _1145 + 1;
        _1143 = _1147;
    }
    int _1149 = _1143;
    float _1151 = fma(_1123, _1099, _1133);
    float _1153 = float(_1131);
    float _1155 = _1129 * 6.283185482025146484375;
    float _1157 = sin(_1155);
    float _1159 = float(_1149);
    float _1161 = _439 + (-0.5);
    float _1163 = _1151 * 0.15915493667125701904296875;
    float _1165 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1167 = _1153 * _1159;
    float _1169 = _857 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1171 = _1129 * 6.283185482025146484375;
    float _1173 = cos(_1171);
    float _1175 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1177 = _1167 * (-2.0);
    float _1179 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1169);
    float _1181 = _1085 * _945;
    float _1183 = _1085 * _1165;
    float _1185 = fma(_1175, _1177, _1175);
    float _1187 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1179);
    float _1189 = _1163 * 6.283185482025146484375;
    float _1191 = sin(_1189);
    float _1193 = fma(_1177, _1023, _1023);
    float _1195 = _975 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1197 = _1187 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1199 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1193);
    float _1201 = _975 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1203 = fma(_863, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1195);
    float _1205 = _1163 * 6.283185482025146484375;
    float _1207 = cos(_1205);
    float _1209 = fma(_1185, _1099, _1199);
    float _1211 = _857 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1213 = fma(_863, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1201);
    float _1215 = fma(_871, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1203);
    float _1217 = _1209 * 0.15915493667125701904296875;
    float _1219 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1211);
    float _1221 = fma(_871, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1213);
    float _1223 = 1.0 / _1197;
    float _1225 = _1215 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1227 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1219);
    float _1229 = _1221 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1231 = _1173 * _1191;
    float _1233 = _1157 * _1191;
    float _1235 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1237 = _1217 * 6.283185482025146484375;
    float _1239 = sin(_1237);
    float _1241 = _1173 * _1207;
    float _1243 = _1235 + _1197;
    float _1245 = _1243 * _1223;
    float _1247 = _1245 * 0.5;
    float _1249 = trunc(_1229);
    int _1251 = int(_1249);
    float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1255 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1253);
    float _1257 = _1157 * _1207;
    float _1259 = fma(_1239, _1241, _1233);
    float _1261 = 1.0 / _1255;
    float _1263 = -_1231;
    float _1265 = fma(_1239, _1257, _1263);
    float _1267 = -_1257;
    float _1269 = fma(_1239, _1231, _1267);
    float _1271 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1273 = fma(_1239, _1233, _1241);
    float _1275 = _1271 * _1181;
    float _1277 = _1217 * 6.283185482025146484375;
    float _1279 = cos(_1277);
    int _1281 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1283 = _1251 + _1281;
    int _1285 = _1283 + 1;
    bool _1287 = _1285 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1289 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1291 = _1261 * _1289;
    float _1293 = trunc(_1225);
    int _1295 = int(_1293);
    bool _1297 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1299 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1301 = _1173 * _1279;
    float _1303 = _1207 * _1279;
    float _1305 = _1157 * _1279;
    float _1307 = _1191 * _1279;
    bool _1309 = !_1297;
    int _1311 = _1309 ? 0 : 1;
    float _1313 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    int _1315 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1317 = _1295 + _1315;
    int _1319 = _1317 + 1;
    float _1321 = _1313 * _1183;
    int _1323 = _1285;
    int _1325 = _1319;
    float _1327 = _1229;
    if (!_1297)
    {
        _1007 = 1;
    }
    int _1329 = _1007;
    float _1331 = _1301 * _1275;
    int _1333 = _1329;
    if (!_1299)
    {
        _1333 = _1311;
    }
    int _1335 = _1333;
    float _1337 = -_1275;
    float _1339 = _1239 * _1337;
    int _1341 = _1285 | _1319;
    float _1343 = fma(_1259, _1321, _1331);
    int _1345 = _1335 << 6;
    float _1347 = fma(_1303, _1321, _1339);
    bool _1349 = _1341 < 0;
    bool _1351 = _1349 || _1287;
    float _1353 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1355 = _1353 * 0.5;
    int _1357 = _1345 + 96;
    uint _1360 = uint(int(uint(_1357) >> uint(2)));
    uint _1362 = uint(int(uint(int(_1360)) >> uint(2)));
    int _1364 = int(_1360) & 3;
    float _1366 = (*spvDescriptorSet0.vp_c15)._m0[int(_1362)][_1364];
    int _1368 = int(_1360) + 1;
    uint _1370 = uint(int(uint(_1368) >> uint(2)));
    int _1372 = _1368 & 3;
    float _1374 = (*spvDescriptorSet0.vp_c15)._m0[int(_1370)][_1372];
    float _1376 = _1305 * _1275;
    bool _1378 = _1319 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1380 = _1378 || _1351;
    float _1382 = fma(_1307, _1355, _1347);
    float _1384 = fma(_1269, _1355, _1343);
    float _1386 = fma(_1265, _1321, _1376);
    bool _1388 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1390 = isnan(0.5);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1396 = _1392 || _1394;
    int _1398 = _1345 + 104;
    uint _1400 = uint(int(uint(_1398) >> uint(2)));
    uint _1402 = uint(int(uint(int(_1400)) >> uint(2)));
    int _1404 = int(_1400) & 3;
    float _1406 = (*spvDescriptorSet0.vp_c15)._m0[int(_1402)][_1404];
    int _1408 = int(_1400) + 1;
    uint _1410 = uint(int(uint(_1408) >> uint(2)));
    int _1412 = _1408 & 3;
    float _1414 = (*spvDescriptorSet0.vp_c15)._m0[int(_1410)][_1412];
    float _1416 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1418 = fma(_1273, _1355, _1386);
    float _1420 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1422 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1416);
    float _1424 = as_type<float>(_1335);
    if (!_1380)
    {
        int _1426 = _1319 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1428 = _1426 + _1285;
        _1323 = _1428;
    }
    int _1430 = _1323;
    int _1432 = _1345 + 48;
    uint _1434 = uint(int(uint(_1432) >> uint(2)));
    uint _1436 = uint(int(uint(int(_1434)) >> uint(2)));
    int _1438 = int(_1434) & 3;
    float _1440 = (*spvDescriptorSet0.vp_c15)._m0[int(_1436)][_1438];
    int _1442 = int(_1434) + 1;
    uint _1444 = uint(int(uint(_1442) >> uint(2)));
    int _1446 = _1442 & 3;
    float _1448 = (*spvDescriptorSet0.vp_c15)._m0[int(_1444)][_1446];
    float _1450 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1420);
    float _1452 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1422);
    float _1454 = 0.0;
    float _1456 = as_type<float>(_1430);
    if (!_1380)
    {
        float _1458 = floor(_1229);
        _1454 = _1458;
    }
    float _1460 = _1454;
    int _1462 = 0;
    if (!_1380)
    {
        int _1464 = _1430 << 2;
        _1462 = _1464;
    }
    int _1466 = _1462;
    float _1468 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1450);
    int _1470 = _1466;
    if (!_1380)
    {
        uint _1472 = uint(int(uint(_1430) >> uint(2)));
        _1325 = int(_1472);
    }
    int _1474 = _1325;
    float _1476 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1478 = _1345 + 64;
    uint _1480 = uint(int(uint(_1478) >> uint(2)));
    uint _1482 = uint(int(uint(int(_1480)) >> uint(2)));
    int _1484 = int(_1480) & 3;
    float _1486 = (*spvDescriptorSet0.vp_c15)._m0[int(_1482)][_1484];
    int _1488 = int(_1480) + 1;
    uint _1490 = uint(int(uint(_1488) >> uint(2)));
    int _1492 = _1488 & 3;
    float _1494 = (*spvDescriptorSet0.vp_c15)._m0[int(_1490)][_1492];
    if (!_1380)
    {
        int _1496 = 12 & _1466;
        _1470 = _1496;
    }
    int _1498 = _1470;
    float _1500 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1502 = _583 + _1476;
    float _1504 = 0.0;
    float _1506 = _1502;
    if (!_1380)
    {
        int _1508 = _1474 << 4;
        int _1510 = _1508 + _1498;
        _1504 = as_type<float>(_1510);
    }
    float _1512 = _1504;
    float _1514 = _679 + _1500;
    float _1516 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1518 = _1502 + _1516;
    int _1520 = _1345 + 56;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    uint _1524 = uint(int(uint(int(_1522)) >> uint(2)));
    int _1526 = int(_1522) & 3;
    float _1528 = (*spvDescriptorSet0.vp_c15)._m0[int(_1524)][_1526];
    int _1530 = int(_1522) + 1;
    uint _1532 = uint(int(uint(_1530) >> uint(2)));
    int _1534 = _1530 & 3;
    float _1536 = (*spvDescriptorSet0.vp_c15)._m0[int(_1532)][_1534];
    float _1538 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1540 = _1514 + _1538;
    float _1542 = _1518 * _1518;
    float _1544 = fma(_1540, _1540, _1542);
    int _1546 = _1345 + 72;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    uint _1550 = uint(int(uint(int(_1548)) >> uint(2)));
    int _1552 = int(_1548) & 3;
    float _1554 = (*spvDescriptorSet0.vp_c15)._m0[int(_1550)][_1552];
    int _1556 = int(_1548) + 1;
    uint _1558 = uint(int(uint(_1556) >> uint(2)));
    int _1560 = _1556 & 3;
    float _1562 = (*spvDescriptorSet0.vp_c15)._m0[int(_1558)][_1560];
    float _1564 = sqrt(_1544);
    int _1566 = _1345 + 80;
    uint _1568 = uint(int(uint(_1566) >> uint(2)));
    uint _1570 = uint(int(uint(int(_1568)) >> uint(2)));
    int _1572 = int(_1568) & 3;
    float _1574 = (*spvDescriptorSet0.vp_c15)._m0[int(_1570)][_1572];
    int _1576 = int(_1568) + 1;
    uint _1578 = uint(int(uint(_1576) >> uint(2)));
    int _1580 = _1576 & 3;
    float _1582 = (*spvDescriptorSet0.vp_c15)._m0[int(_1578)][_1580];
    float _1584 = _975 * _1374;
    float _1586 = fma(_863, _1366, _1584);
    float _1588 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1590 = _1345 + 88;
    uint _1592 = uint(int(uint(_1590) >> uint(2)));
    uint _1594 = uint(int(uint(int(_1592)) >> uint(2)));
    int _1596 = int(_1592) & 3;
    float _1598 = (*spvDescriptorSet0.vp_c15)._m0[int(_1594)][_1596];
    int _1600 = int(_1592) + 1;
    uint _1602 = uint(int(uint(_1600) >> uint(2)));
    int _1604 = _1600 & 3;
    float _1606 = (*spvDescriptorSet0.vp_c15)._m0[int(_1602)][_1604];
    float _1608 = fma(_871, _1406, _1586);
    float _1610 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1588);
    bool _1612 = _1564 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1614 = _1384;
    float _1616 = _1514;
    if (!_1380)
    {
        float _1618 = floor(_1225);
        _1614 = _1618;
    }
    float _1620 = _1614;
    float _1622 = _1608 + _1414;
    float _1624 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1610);
    float _1626 = _1512;
    if (!_1380)
    {
        int _1628 = as_type<int>(_1512) + 400;
        uint _1630 = uint(int(uint(_1628) >> uint(2)));
        uint _1632 = uint(int(uint(int(_1630)) >> uint(2)));
        int _1634 = int(_1630) & 3;
        float _1636 = (*spvDescriptorSet0.vp_c15)._m0[int(_1632)][_1634];
        _1626 = _1636;
    }
    float _1638 = _1626;
    float _1640 = _975 * _1448;
    float _1642 = 1.0 / _1622;
    float _1644 = fma(_863, _1440, _1640);
    float _1646 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1648 = _975 * _1494;
    float _1650 = _609 + _1646;
    float _1652 = fma(_863, _1486, _1648);
    float _1654 = _1448;
    float _1656 = _1486;
    if (!_1612)
    {
        _1654 = _1650;
    }
    float _1658 = _1654;
    float _1660 = fma(_871, _1528, _1644);
    float _1662 = fma(_871, _1554, _1652);
    bool _1664 = !_1612;
    float _1666 = _1658;
    float _1668 = _1620;
    if (!_1664)
    {
        float _1670 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1674 = _1564 + _1672;
        float _1676 = rsqrt(_1544);
        float _1678 = _1674 * _1670;
        float _1680 = _1650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1682 = _1678 * 0.15915493667125701904296875;
        float _1684 = _1682 * 6.283185482025146484375;
        float _1686 = cos(_1684);
        float _1688 = _1682 * 6.283185482025146484375;
        float _1690 = sin(_1688);
        float _1692 = _1686 + (-1.0);
        float _1694 = fma(_1690, _1680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1696 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = _1676 * _1694;
        float _1700 = fma(_1650, _1686, _1696);
        float _1702 = fma(_1540, _1698, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1704 = fma(_1518, _1698, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1616 = _1702;
        _1666 = _1700;
        _1506 = _1704;
        _1656 = _1682;
    }
    float _1706 = _1616;
    float _1708 = _1666;
    float _1710 = _1506;
    float _1712 = _1656;
    float _1714 = -_851;
    float _1716 = fma(_1714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1706);
    float _1718 = -_849;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1708);
    float _1722 = -_859;
    float _1724 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1710);
    float _1726 = _1660 + _1536;
    float _1728 = _1662 + _1562;
    float _1730 = _1720;
    float _1732 = _1716;
    float _1734 = _1724;
    if (!_1396)
    {
        float _1736 = _867 * _867;
        float _1738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1740 = -_583;
        float _1742 = _1740 + _1710;
        float _1744 = -_609;
        float _1746 = _1744 + _1708;
        float _1748 = fma(_875, _875, _1736);
        float _1750 = fma(_881, _881, _1748);
        float _1752 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1754 = sqrt(_1750);
        float _1756 = 1.0 / _1085;
        float _1758 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1760 = precise::min(_1754, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1762 = _1760 * _1738;
        float _1764 = _1762 * _1756;
        float _1766 = -_679;
        float _1768 = _1766 + _1706;
        float _1770 = _1758 * _1764;
        float _1772 = _1742 * _1764;
        float _1774 = fma(_1746, _1770, _857);
        float _1776 = fma(_1768, _1770, _863);
        float _1778 = fma(_1758, _1772, _871);
        _1730 = _1774;
        _1732 = _1776;
        _1734 = _1778;
    }
    float _1780 = _1730;
    float _1782 = _1732;
    float _1784 = _1734;
    float _1786 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1788 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1790 = _1726 * _1642;
    float _1792 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1794 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1786);
    float _1796 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1788);
    float _1798 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1800 = _1790 >= 0.0;
    float _1802 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1794);
    float _1804 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1792);
    float _1806 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1796);
    float _1808 = _1728 * _1642;
    float _1810 = _1802 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1812 = _1790 <= 1.0;
    bool _1814 = _1812 && _1800;
    float _1816 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1804);
    float _1818 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1820 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1798);
    float _1822 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1824 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1826 = _1808 >= 0.0;
    bool _1828 = _1826 && _1814;
    float _1830 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1820);
    float _1832 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1822);
    float _1834 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1836 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1838 = _1808 <= 1.0;
    bool _1840 = _1838 && _1828;
    float _1842 = _1830 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1844 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1832);
    float _1846 = -_1836;
    float _1848 = fma(_1846, _1834, 1.0);
    float _1850 = _975 * _1582;
    float _1852 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1854 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1844);
    float _1856 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1858 = fma(_863, _1574, _1850);
    float _1860 = log2(_1848);
    float _1862 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1852);
    float _1864 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1856);
    float _1866 = fma(_871, _1598, _1858);
    float _1868 = _1854;
    if (_1840)
    {
        float _1870 = float(_1335);
        _1424 = _1870;
    }
    float _1872 = _1424;
    float _1874 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1862);
    float _1876 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1864);
    float _1878 = _1866 + _1606;
    float _1880 = 1.0 / _1854;
    float _1882 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1874);
    float _1884 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1876);
    float _1886 = _1876;
    float _1888 = _1882;
    if (!_1380)
    {
        float _1890 = -_1620;
        float _1892 = _1225 + _1890;
        _1668 = _1892;
    }
    float _1894 = _1668;
    if (!_1380)
    {
        float _1896 = -_1460;
        float _1898 = _1229 + _1896;
        _1886 = _1898;
    }
    float _1900 = _1886;
    float _1902 = _1712;
    if (!_1380)
    {
        float _1904 = rint(_1638);
        float _1906 = precise::max(_1904, 0.0);
        uint _1908 = uint(_1906);
        uint _1910 = clamp(_1908, 0u, 65535u);
        _1902 = as_type<float>(_1910);
    }
    float _1912 = _1902;
    float _1914 = _1860 * 0.693147182464599609375;
    float _1916 = _1878 * _1642;
    float _1918 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1920 = _1858;
    float _1922 = _1918;
    if (_1840)
    {
        float _1924 = rint(_1872);
        float _1926 = precise::max(_1924, 0.0);
        uint _1928 = uint(_1926);
        uint _1930 = clamp(_1928, 0u, 65535u);
        _1920 = as_type<float>(_1930);
    }
    float _1932 = _1920;
    float _1934 = _1882 * _1880;
    float _1936 = _1884 * _1880;
    float _1938 = fma(_1934, 0.5, 0.5);
    float _1940 = fma(_1936, -0.5, 0.5);
    float _1942 = _1460;
    float _1944 = _1940;
    float _1946 = _1938;
    if (!_1380)
    {
        float3 _6008 = float3(_1900, _1894, float(as_type<int>(_1912)));
        float3 _6012 = select(_6008, float3(0.0), isnan(_6008));
        float _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6012.xy, uint(rint(_6012.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6012.xy, uint(rint(_6012.z)), level(0.0)).x;
        _1942 = _1948;
    }
    float _1950 = _1942;
    float _1952 = _1808;
    if (_1840)
    {
        float3 _6027 = float3(_1790, _1808, float(as_type<int>(_1932)));
        float3 _6029 = select(_6027, float3(0.0), isnan(_6027));
        float _1954 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6029.xy, uint(rint(_6029.z)), _1916, level(0.0));
        _1952 = _1954;
    }
    float _1956 = _1952;
    float3 _6039 = float3(_1938, _1940, _1918);
    float _1958 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6039, float3(0.0), isnan(_6039)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6039, float3(0.0), isnan(_6039)), level(0.0)).x;
    float3 _6048 = float3(_1938, _1940, _1918);
    float4 _1961 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6048, float3(0.0), isnan(_6048)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6048, float3(0.0), isnan(_6048)), level(0.0)).xyzw;
    float _1963 = _1961.x;
    float _1965 = _1961.y;
    float _1967 = _1961.z;
    float _1969 = _1961.w;
    bool _1971 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1973 = isnan(0.5);
    bool _1975 = _1971 || _1973;
    bool _1977 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1979 = _1975 || _1977;
    if (_1380)
    {
        _889 = 1.0;
    }
    float _1981 = _889;
    float _1983 = _1981;
    if (_1979)
    {
        _1327 = 1.0;
    }
    float _1985 = _1327;
    float _1987 = _1985;
    if (_1979)
    {
        _853 = 1.0;
    }
    float _1989 = _853;
    float _1991 = _1989;
    float _1993 = _1963;
    if (!_1979)
    {
        float _1995 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1997 = _1995 * 0.15915493667125701904296875;
        float _1999 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2001 = _1997 * 6.283185482025146484375;
        float _2003 = cos(_2001);
        float _2005 = _1999 * 0.15915493667125701904296875;
        float _2007 = _1997 * 6.283185482025146484375;
        float _2009 = sin(_2007);
        float _2011 = 1.0 / _2003;
        float _2013 = _2005 * 6.283185482025146484375;
        float _2015 = cos(_2013);
        float _2017 = _2009 * _2011;
        float _2019 = _2005 * 6.283185482025146484375;
        float _2021 = sin(_2019);
        float _2023 = _2015 * _2017;
        float _2025 = 1.0 / _2023;
        float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2029 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2027;
        float _2031 = 1.0 / _2029;
        float _2033 = _2021 * _2025;
        float _2035 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2037 = fma(_1291, _2033, _2035);
        float _2039 = _2037 * _2031;
        float _2041 = precise::clamp(_2039, 0.0, 1.0);
        _1944 = _2037;
        _1946 = _2005;
        _1991 = _2041;
    }
    float _2043 = _1944;
    float _2045 = _1946;
    float _2047 = _1991;
    float _2049 = _2045;
    float _2051 = _2043;
    if (!_1979)
    {
        float _2053 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2055 = _2053 * 0.15915493667125701904296875;
        float _2057 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2059 = _2055 * 6.283185482025146484375;
        float _2061 = cos(_2059);
        float _2063 = _2057 * 0.15915493667125701904296875;
        float _2065 = _2055 * 6.283185482025146484375;
        float _2067 = sin(_2065);
        float _2069 = 1.0 / _2061;
        float _2071 = _2063 * 6.283185482025146484375;
        float _2073 = cos(_2071);
        float _2075 = _2067 * _2069;
        float _2077 = _2063 * 6.283185482025146484375;
        float _2079 = sin(_2077);
        float _2081 = _2073 * _2075;
        float _2083 = 1.0 / _2081;
        float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2087 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2085;
        float _2089 = 1.0 / _2087;
        float _2091 = _2079 * _2083;
        float _2093 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2095 = fma(_1291, _2091, _2093);
        float _2097 = _2095 * _2089;
        float _2099 = precise::clamp(_2097, 0.0, 1.0);
        float _2101 = -_2099;
        float _2103 = _2101 + 1.0;
        _2049 = _2081;
        _2051 = _2069;
        _1987 = _2103;
    }
    float _2105 = _2049;
    float _2107 = _2051;
    float _2109 = _1987;
    if (!_1380)
    {
        int _2111 = _1430 << 4;
        int _2113 = _2111 + 2048;
        uint _2115 = uint(int(uint(_2113) >> uint(2)));
        uint _2117 = uint(int(uint(int(_2115)) >> uint(2)));
        int _2119 = int(_2115) & 3;
        float _2121 = (*spvDescriptorSet0.vp_c15)._m0[int(_2117)][_2119];
        int _2123 = int(_2115) + 1;
        uint _2125 = uint(int(uint(_2123) >> uint(2)));
        int _2127 = _2123 & 3;
        float _2129 = (*spvDescriptorSet0.vp_c15)._m0[int(_2125)][_2127];
        int _2131 = _2113 + 8;
        uint _2133 = uint(int(uint(_2131) >> uint(2)));
        uint _2135 = uint(int(uint(int(_2133)) >> uint(2)));
        int _2137 = int(_2133) & 3;
        float _2139 = (*spvDescriptorSet0.vp_c15)._m0[int(_2135)][_2137];
        int _2141 = int(_2133) + 1;
        uint _2143 = uint(int(uint(_2141) >> uint(2)));
        int _2145 = _2141 & 3;
        float _2147 = (*spvDescriptorSet0.vp_c15)._m0[int(_2143)][_2145];
        float _2149 = _975 * _2129;
        float _2151 = fma(_863, _2121, _2149);
        float _2153 = fma(_871, _2139, _2151);
        float _2155 = _2153 + _2147;
        float _2157 = precise::clamp(_2155, 0.0, 1.0);
        float _2159 = -_2157;
        float _2161 = _2159 + _1950;
        float _2163 = fma(_2161, 500.0, 1.5);
        float _2165 = exp2(_2163);
        float _2167 = 0.0 + _2165;
        float _2169 = precise::clamp(_2167, 0.0, 1.0);
        _1456 = as_type<float>(_2113);
        _1983 = _2169;
    }
    float _2171 = _1456;
    float _2173 = _1983;
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2177 = _1780 + _2175;
    float _2179 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2181 = _1782 + _2179;
    float _2183 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2185 = _1784 + _2183;
    float _2187 = _2177 * _2177;
    float _2189 = fma(_2181, _2181, _2187);
    float _2191 = fma(_2185, _2185, _2189);
    float _2193 = rsqrt(_2191);
    float _2195 = sqrt(_2191);
    float _2197 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2199 = _2181 * _2197;
    float _2201 = _2185 * _2197;
    float _2203 = _2199 * _2199;
    float _2205 = _2201 * _2201;
    float _2207 = _2203 + _2205;
    float _2209 = sqrt(_2207);
    bool _2211 = _2209 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2215 = _2209 + _2213;
    float _2217 = _2105;
    float _2219 = _2207;
    float _2221 = _2215;
    float _2223 = _2199;
    float _2225 = _2201;
    float _2227 = _2203;
    float _2229 = _2205;
    if (_2211)
    {
        float _2231 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2217 = _2231;
    }
    float _2233 = _2217;
    if (_2211)
    {
        float _2235 = rsqrt(_2207);
        _2219 = _2235;
    }
    float _2237 = _2219;
    if (_2211)
    {
        float _2239 = _2215 * _2233;
        _2221 = _2239;
    }
    float _2241 = _2221;
    if (_2211)
    {
        float _2243 = _2241 * 0.15915493667125701904296875;
        _1922 = _2243;
    }
    float _2245 = _1922;
    float _2247 = _2107;
    if (_2211)
    {
        float _2249 = _2245 * 6.283185482025146484375;
        float _2251 = sin(_2249);
        _2247 = _2251;
    }
    float _2253 = _2247;
    float _2255 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2257 = precise::max(0.0, _2255);
    float _2259 = _2171;
    float _2261 = _2257;
    float _2263 = _2255;
    if (_2211)
    {
        float _2265 = _2245 * 6.283185482025146484375;
        float _2267 = cos(_2265);
        _2259 = _2267;
    }
    float _2269 = _2259;
    float _2271 = -_2197;
    float _2273 = -_2257;
    float _2275 = fma(_2177, _2271, _2273);
    float _2277 = _2275;
    if (_2211)
    {
        float _2279 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2261 = _2279;
    }
    float _2281 = _2261;
    float _2283 = _2253;
    float _2285 = _2281;
    if (_2211)
    {
        float _2287 = fma(_2253, _2281, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2283 = _2287;
    }
    float _2289 = _2283;
    float _2291 = _2289;
    if (_2211)
    {
        float _2293 = _2269 + (-1.0);
        _2263 = _2293;
    }
    float _2295 = _2263;
    if (_2211)
    {
        float _2297 = _2237 * _2289;
        _2291 = _2297;
    }
    float _2299 = _2291;
    if (_2211)
    {
        float _2301 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2285 = _2301;
    }
    float _2303 = _2285;
    if (_2211)
    {
        float _2305 = _2199 * _2299;
        _2223 = _2305;
    }
    float _2307 = _2223;
    if (_2211)
    {
        float _2309 = _2201 * _2299;
        _2225 = _2309;
    }
    float _2311 = _2225;
    if (_2211)
    {
        float _2313 = fma(_2275, _2269, _2303);
        _2277 = _2313;
    }
    float _2315 = _2277;
    if (_2211)
    {
        float _2317 = _2307 * _2307;
        _2227 = _2317;
    }
    float _2319 = _2227;
    if (_2211)
    {
        float _2321 = _2311 * _2311;
        _2229 = _2321;
    }
    float _2323 = _2229;
    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2327 = fma(_2195, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2325);
    float _2329 = precise::clamp(_2327, 0.0, 1.0);
    float _2331 = fma(_2315, _2315, _2319);
    float _2333 = -_2329;
    float _2335 = _2333 + 1.0;
    float _2337 = _2331 + _2323;
    float _2339 = rsqrt(_2337);
    float _2341 = _2339 * _2315;
    float _2343 = _2339 * _2307;
    float _2345 = abs(_2335);
    float _2347 = log2(_2345);
    float _2349 = _2339 * _2311;
    float _2351 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2353 = -_2351;
    float _2355 = fma(_2341, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2353);
    float _2357 = -_2349;
    float _2359 = fma(_2357, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2355);
    float _2361 = fma(_2359, -0.5, 0.5);
    float _2363 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2365 = fma(_2359, 0.5, 0.5);
    float _2367 = _2341 + 1.0;
    float _2369 = sqrt(_2361);
    float _2371 = fma(_2365, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2373 = fma(_2365, _2371, -0.212114393711090087890625);
    float _2375 = exp2(_2363);
    float _2377 = fma(_2365, _2373, 1.570728778839111328125);
    float _2379 = _2369 * 0.636619746685028076171875;
    float _2381 = -_2377;
    float _2383 = fma(_2379, _2381, 1.0);
    float _2385 = -_2341;
    float _2387 = fma(_2375, _2367, _2385);
    float _2389 = fma(_2387, 0.5, 0.5);
    float2 _6667 = float2(_2383, _2389);
    float3 _2393 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6667, float2(0.0), isnan(_6667)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6667, float2(0.0), isnan(_6667)), level(0.0)).xyz;
    float _2395 = _2393.x;
    float _2397 = _2393.y;
    float _2399 = _2393.z;
    float _2401 = abs(_1291);
    float _2403 = log2(_2401);
    float _2405 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2407 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2409 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2411 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2413 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2415 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2417 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2405);
    float _2419 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2407);
    float _2421 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2409);
    float _2423 = -_1239;
    float _2425 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2411);
    float _2427 = -_1239;
    float _2429 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2413);
    float _2431 = -_1239;
    float _2433 = fma(_2431, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2415);
    float _2435 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2437 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2439 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2441 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2443 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2445 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2417);
    float _2447 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2419);
    float _2449 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2421);
    float _2451 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2435);
    float _2453 = exp2(_2441);
    float _2455 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2457 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2437);
    float _2459 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2439);
    float _2461 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2425);
    float _2463 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2429);
    float _2465 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2467 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2433);
    float _2469 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2455);
    float _2471 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2451);
    float _2473 = exp2(_2443);
    float _2475 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2457);
    float _2477 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2459);
    float _2479 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2481 = _2465 * _2461;
    float _2483 = _2465 * _2463;
    float _2485 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2469);
    float _2487 = _2465 * _2467;
    float _2489 = fma(_2479, _2445, _2481);
    float _2491 = fma(_2479, _2447, _2483);
    float _2493 = fma(_2479, _2449, _2487);
    float _2495 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2485);
    float _2497 = fma(_2453, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2499 = precise::clamp(_2497, 0.0, 1.0);
    float _2501 = _1854 * 0.5;
    float _2503 = _1882 + _1854;
    float _2505 = _2495 + _1854;
    float _2507 = fma(_2499, -2.0, 3.0);
    out.gl_Position.x = _1882;
    out.gl_Position.y = _1884;
    out.gl_Position.z = _2495;
    out.gl_Position.w = _1854;
    float _2509 = _2499 * _2499;
    float _2511 = fma(_1884, -0.5, _2501);
    bool _2513 = _1291 <= 8000.0;
    bool _2515 = isnan(_1291);
    bool _2517 = _2513 || _2515;
    bool _2519 = isnan(8000.0);
    bool _2521 = _2517 || _2519;
    float _2523 = float(_2521);
    float _2525 = _2505 * 0.5;
    float _2527 = _2509 * _2507;
    float _2529 = _2503 * 0.5;
    float _2531 = _2471 + _2489;
    float _2533 = _2475 + _2491;
    float _2535 = _2477 + _2493;
    float _2537 = -_915;
    float _2539 = _2537 + 1.0;
    out.m_84.x = _2529;
    out.m_84.y = _2511;
    out.m_84.z = _2525;
    out.m_84.w = _1854;
    bool _2541 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2543 = isnan(_2195);
    bool _2545 = _2541 || _2543;
    bool _2547 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2549 = _2545 || _2547;
    float _2551 = -_2473;
    float _2553 = _2551 + 1.0;
    if (!_1840)
    {
        _1888 = 1.0;
    }
    float _2555 = _1888;
    float _2557 = -_2527;
    float _2559 = _2557 + 1.0;
    float _2561 = _2555;
    if (_1840)
    {
        bool _2563 = _1956 >= _1916;
        bool _2565 = isnan(_1956);
        bool _2567 = _2563 || _2565;
        bool _2569 = isnan(_1916);
        bool _2571 = _2567 || _2569;
        float _2573 = float(_2571);
        _2561 = _2573;
    }
    float _2575 = _2561;
    float _2577 = _2553 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _2531;
    out.m_86.y = _2533;
    out.m_86.z = _2535;
    float _2579 = fma(_2559, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2527);
    float _2581 = _2577 * _1958;
    float _2583 = -_2577;
    float _2585 = _2583 + 1.0;
    float _2587 = _2523 * _2579;
    out.m_88.x = _1782;
    out.m_88.y = _1780;
    out.m_88.z = _1784;
    float _2589 = _1969 * _2581;
    float _2591 = _1969 * _2585;
    float _2593 = _2587 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2595 = _2575 * _2173;
    float _2597 = _2585;
    if (!_2549)
    {
        _1868 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2599 = _1868;
    float _2601 = _2539 * _2593;
    float _2603 = precise::clamp(_2601, 0.0, 1.0);
    float _2605 = _2599;
    float _2607 = _2599;
    if (!_2549)
    {
        _2597 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2609 = _2597;
    float _2611 = -_2603;
    float _2613 = fma(_2611, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2615 = -_2595;
    float _2617 = fma(_2615, _2613, 1.0);
    float _2619 = precise::clamp(_2617, 0.0, 1.0);
    float _2621 = _2613;
    float _2623 = _2609;
    float _2625 = _2609;
    if (!_2549)
    {
        _2621 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2627 = _2621;
    float _2629 = _2619 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_90.x = _2629;
    float _2631 = _2629;
    float _2633 = _2627;
    float _2635 = _2627;
    if (!_2549)
    {
        _2631 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2637 = _2631;
    float _2639 = _2399 * _2581;
    float _2641 = fma(_2395, _2589, _1963);
    float _2643 = fma(_2397, _2589, _1965);
    float _2645 = _2047 * _2109;
    float _2647 = fma(_1969, _2639, _1967);
    float _2649 = _2645;
    float _2651 = _2637;
    float _2653 = _2637;
    if (!_2549)
    {
        _1993 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2655 = _1993;
    float _2657 = _2645 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2659 = _2655;
    float _2661 = _2655;
    if (!_2549)
    {
        _2649 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2663 = _2649;
    out.m_92.x = _2641;
    out.m_92.y = _2643;
    out.m_92.z = _2647;
    out.m_92.w = _2591;
    bool _2665 = !_2549;
    float _2667 = _2663;
    float _2669 = _2663;
    if (!_2665)
    {
        bool _2671 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2673 = isnan(_2195);
        bool _2675 = _2671 || _2673;
        bool _2677 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2679 = _2675 || _2677;
        if (!_2679)
        {
            float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2683 = _2195 + _2681;
            float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2687 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2685;
            float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2693 = 1.0 / _2687;
            float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2699 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2701 = _2699 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2703 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2705 = _2703 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2707 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2709 = _2707 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2711 = _2683 * _2693;
            float _2713 = precise::clamp(_2711, 0.0, 1.0);
            float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2717 = _2715 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2719 = fma(_2713, _2691, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2721 = fma(_2713, _2717, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2723 = fma(_2713, _2697, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2725 = fma(_2713, _2701, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2727 = fma(_2713, _2705, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2729 = fma(_2713, _2709, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2607 = _2723;
            _2653 = _2727;
            _2661 = _2719;
            _2635 = _2725;
            _2625 = _2721;
            _2669 = _2729;
            _2731 = true;
        }
        else
        {
            bool _2733 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2735 = isnan(_2195);
            bool _2737 = _2733 || _2735;
            bool _2739 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2741 = _2737 || _2739;
            if (!_2741)
            {
                _2659 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2743 = _2659;
            _2661 = _2743;
            if (!_2741)
            {
                _2605 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2745 = _2605;
            _2607 = _2745;
            if (!_2741)
            {
                _2623 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2747 = _2623;
            _2625 = _2747;
            if (!_2741)
            {
                _2633 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2749 = _2633;
            _2635 = _2749;
            if (!_2741)
            {
                _2651 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2751 = _2651;
            _2653 = _2751;
            if (!_2741)
            {
                _2667 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2753 = _2667;
            bool _2755 = !_2741;
            _2669 = _2753;
            if (!_2755)
            {
                bool _2757 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2759 = isnan(_2195);
                bool _2761 = _2757 || _2759;
                bool _2763 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2765 = _2761 || _2763;
                if (!_2765)
                {
                    float _2767 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2769 = _2195 + _2767;
                    float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2773 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2771;
                    float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2777 = _2775 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2779 = 1.0 / _2773;
                    float _2781 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2783 = _2781 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2785 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2787 = _2785 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2791 = _2789 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2795 = _2793 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2797 = _2769 * _2779;
                    float _2799 = precise::clamp(_2797, 0.0, 1.0);
                    float _2801 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2803 = _2801 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2805 = fma(_2799, _2777, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2807 = fma(_2799, _2803, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2809 = fma(_2799, _2783, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2811 = fma(_2799, _2787, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2813 = fma(_2799, _2791, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2815 = fma(_2799, _2795, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2607 = _2809;
                    _2653 = _2813;
                    _2661 = _2805;
                    _2635 = _2811;
                    _2625 = _2807;
                    _2669 = _2815;
                    _2731 = true;
                }
                else
                {
                    _2607 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2653 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2661 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2635 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2625 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2669 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2731 = false;
    float _2817 = _2607;
    float _2819 = _2653;
    float _2821 = _2661;
    float _2823 = _2635;
    float _2825 = _2625;
    float _2827 = _2669;
    float _2829 = fma(_2533, -0.5, 0.5);
    float _2831 = precise::clamp(_2829, 0.0, 1.0);
    float _2833 = -_2817;
    float _2835 = _2833 + _2819;
    float _2837 = _2657 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2839 = -_2821;
    float _2841 = _2839 + _2823;
    float _2843 = fma(_2831, _2835, _2817);
    out.m_94.x = 0.0;
    float _2845 = -_2825;
    float _2847 = _2845 + _2827;
    float _2849 = fma(_2831, _2841, _2821);
    float _2851 = _2843 * 0.586610972881317138671875;
    out.m_59.x = _2837;
    bool _2853 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2855 = fma(_2831, _2847, _2825);
    float _2857 = fma(_2849, 0.298911988735198974609375, _2851);
    bool _2859 = _2047 > 0.0;
    bool _2861 = isnan(_2047);
    bool _2863 = _2859 || _2861;
    bool _2865 = isnan(0.0);
    bool _2867 = _2863 || _2865;
    float _2869 = fma(_2855, 0.114477999508380889892578125, _2857);
    bool _2871 = _2109 <= 0.0;
    bool _2873 = !_2867;
    bool _2875 = _2871 || _2873;
    float _2877 = -_2869;
    float _2879 = _2849 + _2877;
    float _2881 = -_2869;
    float _2883 = _2843 + _2881;
    float _2885 = -_2869;
    float _2887 = _2855 + _2885;
    float _2889 = fma(_2879, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2869);
    float _2891 = fma(_2883, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2869);
    float _2893 = fma(_2887, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2869);
    bool _2895 = !_2853;
    if (!_2895)
    {
        float _2897 = -_1780;
        float _2899 = _2897 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2901 = -_1782;
        float _2903 = _2901 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2905 = -_1784;
        float _2907 = _2905 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2909 = _2899 * _2899;
        float _2911 = fma(_2903, _2903, _2909);
        float _2913 = fma(_2907, _2907, _2911);
        float _2915 = sqrt(_2913);
        float _2917 = rsqrt(_2913);
        float _2919 = -_2915;
        float _2921 = _2919 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2923 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2925 = precise::clamp(_2923, 0.0, 1.0);
        float _2927 = _2903 * _2917;
        float _2929 = _2899 * _2917;
        float _2931 = abs(_2925);
        float _2933 = log2(_2931);
        float _2935 = _2907 * _2917;
        float _2937 = _2927 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2939 = _2533 * _2929;
        float _2941 = -_2929;
        float _2943 = -_2937;
        float _2945 = fma(_2941, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2943);
        float _2947 = fma(_2531, _2927, _2939);
        float _2949 = -_2935;
        float _2951 = fma(_2949, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2945);
        float _2953 = fma(_2535, _2935, _2947);
        float _2955 = precise::clamp(_2953, 0.0, 1.0);
        float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2959 = _2951 + _2957;
        float _2961 = _2933 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2963 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2965 = precise::clamp(_2963, 0.0, 1.0);
        float _2967 = exp2(_2961);
        float _2969 = _2967 * _2965;
        float _2971 = _2955 * _2969;
        float _2973 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2975 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2977 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _2973;
        out.m_94.y = _2975;
        out.m_94.z = _2977;
    }
    out.m_96.x = _2889;
    out.m_96.y = _2891;
    out.m_96.z = _2893;
    if (!_2875)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2979 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2979;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2731 = false;
    bool _425 = false;
    bool _313 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _3036 = as_type<float>(_131);
        out.gl_Position.z = _3036;
    }
    if (!_119)
    {
        return out;
    }
    float _135 = in.m_61.w;
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
        out.m_59.x = 0.0;
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
        float _3105 = as_type<float>(_169);
        out.gl_Position.z = _3105;
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
        float _193 = in.m_66.x;
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
    bool _245 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _247 = isnan(_219);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _257;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _263 = 1.0 / _239;
    float _265 = _255 * _243;
    float _267 = -_255;
    float _269 = _267 + 1.0;
    float _271 = _223 * _263;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = fma(_259, _271, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _279 = fma(_275, _271, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _281 = _277 * _265;
    float _283 = _279 * _265;
    float _285 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    bool _293 = !_261;
    float _311;
    if (!_293)
    {
        float _295 = in.m_66.x;
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
    float _359 = -_333;
    float _361 = _359 + 1.0;
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _365 = 1.0 / _337;
    float _367 = _349 * _361;
    float _369 = -_349;
    float _371 = _369 + 1.0;
    float _373 = _353 * _365;
    float _375 = fma(_373, _357, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _377 = _375 * _367;
    float _379 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[115].x, _377);
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _387 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[116].x, _379);
    float _389 = in.m_68.x;
    float _391 = in.m_68.y;
    float _393 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _395 = _383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _397 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _387 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_70.x = _393;
    out.m_70.y = _395;
    out.m_70.z = _397;
    out.m_70.w = _399;
    float _401 = _291 * _391;
    float _403 = _289 * _389;
    bool _405 = !_363;
    float _423;
    if (!_405)
    {
        float _407 = in.m_66.x;
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
    float _435 = in.m_66.x;
    float _437 = in.m_66.y;
    float _439 = in.m_66.z;
    float _441 = in.m_66.w;
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _445 = in.m_56.x;
    float _447 = in.m_56.y;
    float _449 = in.m_56.z;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _453 = _451 != 0;
    float _455 = in.m_72.x;
    float _457 = in.m_72.y;
    float _459 = in.m_72.z;
    float _461 = in.m_72.w;
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _465 = _463 != 0;
    int _467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _469 = _467 != 0;
    float _471 = in.m_74.x;
    float _473 = in.m_74.y;
    float _475 = in.m_74.z;
    float _477 = in.m_74.w;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _485 = _483 != 0;
    float _487 = in.m_76.x;
    float _489 = in.m_76.y;
    float _491 = in.m_76.z;
    float _493 = in.m_76.w;
    bool _495 = _441 > 0.5;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _501 = _435 > 0.5;
    float _503 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _505 = 1.0 / _499;
    float _507 = _447 * _457;
    float _509 = _447 * _473;
    float _511 = fma(_445, _455, _507);
    float _513 = fma(_445, _471, _509);
    float _515 = _447 * _489;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _517;
    float _521 = fma(_449, _475, _513);
    float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _525 = fma(_445, _487, _515);
    float _527 = -_185;
    int _529 = _501 ? as_type<int>(_527) : as_type<int>(_185);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _533 = _437 > 0.5;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _537 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _539 = fma(_449, _459, _511);
    float _541 = fma(_449, _491, _525);
    float _543 = _519 * _505;
    float _545 = -_189;
    int _547 = _533 ? as_type<int>(_545) : as_type<int>(_189);
    float _549 = -_531;
    float _551 = fma(_503, 2.0, _549);
    float _553 = _519;
    if (!_453)
    {
        _553 = _439;
    }
    float _555 = _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _559 = _433 + _557;
    float _561 = _555;
    if (_453)
    {
        _561 = _437;
    }
    float _563 = _561;
    float _565 = fma(_537, -2.0, _535);
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _569 = !_465;
    float _571 = _569 ? _185 : as_type<float>(_529);
    float _573 = fma(_543, _559, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _575 = !_469;
    float _577 = _575 ? _189 : as_type<float>(_547);
    float _579 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[83].w, _567);
    float _581 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _565);
    float _583 = _541 + _493;
    float _585 = _443 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _587 = _523 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _589 = -_149;
    float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[76].x, _551);
    float _593 = _571 + 0.5;
    float _595 = _577 + (-0.5);
    bool _597 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _599 = isnan(_433);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = _521 + _477;
    float _611 = fma(_585, _593, _591);
    float _613 = -_587;
    float _615 = -_581;
    float _617 = fma(_613, _595, _615);
    bool _619 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _621 = isnan(_433);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -_607;
    float _633 = _631 + 1.0;
    float _635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _637 = _581;
    float _639 = _617;
    if (!_453)
    {
        _637 = _437;
    }
    float _641 = _637;
    float _643 = _629 * _633;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _647 = _641;
    if (_453)
    {
        _647 = _435;
    }
    float _649 = _647;
    float _651 = _573 * _643;
    bool _653 = _439 > 0.5;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _659 = _649 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _661 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[83].z, _645);
    float _663 = -_185;
    int _665 = _653 ? as_type<int>(_663) : as_type<int>(_185);
    float _667 = -_629;
    float _669 = _667 + 1.0;
    float _671 = _649;
    if (!_453)
    {
        _671 = _439;
    }
    float _673 = _671;
    float _675 = -_655;
    float _677 = fma(_659, 2.0, _675);
    float _679 = _539 + _461;
    float _681 = _673;
    if (_453)
    {
        _681 = _437;
    }
    float _683 = _681;
    float _685 = -_149;
    float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[81].x, _677);
    bool _689 = !_481;
    float _691 = _689 ? _185 : as_type<float>(_665);
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _695 = _683 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _697 = _635 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _699 = _691 + 0.5;
    float _701 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _579);
    float _703 = fma(_695, -2.0, _693);
    float _705 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[131].x, _651);
    float _707 = -_189;
    int _709 = _495 ? as_type<int>(_707) : as_type<int>(_189);
    float _711 = fma(_697, _699, _687);
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _715 = _609 + _713;
    float _717 = _657 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _719 = !_485;
    float _721 = _719 ? _189 : as_type<float>(_709);
    float _723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _725 = _679 + _723;
    float _727 = _715 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _729 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _703);
    float _731 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _733 = _583 + _731;
    float _735 = _721 + (-0.5);
    float _737 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[28].x, _727);
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _743 = -_717;
    float _745 = -_729;
    float _747 = fma(_743, _735, _745);
    float _749 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[28].z, _737);
    float _751 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].z, _739);
    float _753 = -_701;
    float _755 = _753 + 1.0;
    float _757 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].w, _741);
    float _759 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[132].x, _705);
    float _761 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _751);
    bool _763 = _749 >= 0.0;
    float _765 = fma(_721, _755, _747);
    float _767 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _757);
    float _769 = -_761;
    float _771 = _769 + 1.0;
    float _773 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _661);
    float _775 = -_767;
    float _777 = _775 + 1.0;
    float _779 = -_771;
    float _781 = fma(_571, _779, _611);
    float _783 = _715 * _715;
    float _785 = -_773;
    float _787 = _785 + 1.0;
    float _789 = fma(_725, _725, _783);
    float _791 = fma(_577, _777, _617);
    if (_763)
    {
        _639 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _793 = _639;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _797 = fma(_733, _733, _789);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _803 = -_787;
    float _805 = fma(_691, _803, _711);
    float _807 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = rsqrt(_797);
    float _811 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = _801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _815 = _759 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _817 = as_type<int>(_793);
    if (_763)
    {
        float _819 = _793 * 5.0;
        _817 = as_type<int>(_819);
    }
    int _821 = _817;
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _825 = _823 != 0;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _829 = _827 != 0;
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _833 = _831 != 0;
    out.m_78.x = _781;
    out.m_78.y = _791;
    out.m_78.z = _805;
    out.m_78.w = _765;
    out.m_80.x = _807;
    out.m_80.y = _811;
    out.m_80.z = _813;
    out.m_80.w = _815;
    bool _835 = !_825;
    int _837 = _835 ? 0 : 1;
    bool _839 = !_829;
    int _841 = _839 ? 0 : 1;
    float _843 = as_type<float>(_821);
    if (_763)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4227 = as_type<float>(_821);
        out.gl_Position.z = _4227;
    }
    bool _845 = !_833;
    int _847 = _845 ? 0 : 1;
    float _849 = _715 * _809;
    float _851 = _725 * _809;
    float _853 = _849;
    if (_763)
    {
        out.m_59.x = 0.0;
    }
    if (_763)
    {
        return out;
    }
    float _855 = -_849;
    float _857 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _609);
    float _859 = _733 * _809;
    float _861 = -_851;
    float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[18].w, _679);
    float _865 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _867 = _857 + _865;
    float _869 = -_859;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _583);
    float _873 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _875 = _863 + _873;
    float _877 = _867 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _881 = _871 + _879;
    float _883 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[28].x, _877);
    float _885 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[28].z, _883);
    bool _887 = _885 >= 0.0;
    float _889 = _859;
    if (_887)
    {
        _843 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _891 = _843;
    int _893 = as_type<int>(_891);
    if (_887)
    {
        out.m_59.x = 0.0;
    }
    if (_887)
    {
        float _895 = _891 * 5.0;
        _893 = as_type<int>(_895);
    }
    int _897 = _893;
    if (_887)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4333 = as_type<float>(_897);
        out.gl_Position.z = _4333;
    }
    if (_887)
    {
        return out;
    }
    float _899 = fma(_863, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _901 = fma(_871, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _903 = floor(_899);
    float _905 = floor(_901);
    float _907 = -_903;
    float _909 = _899 + _907;
    float _911 = -_905;
    float _913 = _901 + _911;
    float2 _4369 = float2(_909, _913);
    float _915 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4369, float2(0.0), isnan(_4369)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4369, float2(0.0), isnan(_4369)), level(0.0)).x;
    float _917 = _439 * 2.0;
    float _919 = _435 * 2.0;
    float _921 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _923 = log2(_921);
    float _925 = -_849;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _715);
    int _929 = abs(_837);
    float _931 = -_851;
    float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[18].w, _725);
    float _935 = _927 * _927;
    float _937 = float(_929);
    float _939 = floor(_917);
    float _941 = -_859;
    float _943 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[18].w, _733);
    float _945 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _947 = floor(_919);
    float _949 = _923 * _149;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _953 = 1.0 + _951;
    float _955 = fma(_933, _933, _935);
    float _957 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _959 = fma(_943, _943, _955);
    bool _961 = _939 >= 0.0;
    bool _963 = isnan(_939);
    bool _965 = _961 || _963;
    bool _967 = isnan(0.0);
    bool _969 = _965 || _967;
    float _971 = exp2(_949);
    bool _973 = _939 > 0.0;
    float _975 = _857 + _957;
    int _977 = _969 ? 0 : 1;
    bool _979 = _947 > 0.0;
    float _981 = 1.0 / _953;
    bool _983 = _947 >= 0.0;
    bool _985 = isnan(_947);
    bool _987 = _983 || _985;
    bool _989 = isnan(0.0);
    bool _991 = _987 || _989;
    float _993 = _437 + _439;
    int _995 = ~_977;
    int _997 = _995 + 1;
    int _999 = _997 + 1;
    int _1001 = _991 ? 0 : 1;
    float _1003 = _993 + (-1.0);
    int _1005 = _999;
    int _1007 = 2;
    if (!_973)
    {
        int _1009 = ~_977;
        int _1011 = _1009 + 1;
        _1005 = _1011;
    }
    int _1013 = _1005;
    float _1015 = -_971;
    float _1017 = _1015 + 1.0;
    float _1019 = in.m_82.x;
    float _1021 = in.m_82.y;
    float _1023 = in.m_82.z;
    int _1025 = ~_1001;
    int _1027 = _1025 + 1;
    int _1029 = _1027 + 1;
    float _1031 = sqrt(_959);
    int _1033 = _1029;
    if (!_979)
    {
        int _1035 = ~_1001;
        int _1037 = _1035 + 1;
        _1033 = _1037;
    }
    int _1039 = _1033;
    float _1041 = _437 * 2.0;
    float _1043 = float(_1013);
    float _1045 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1047 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1049 = isnan(1.0);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1055 = _1051 || _1053;
    float _1057 = _437 + _435;
    bool _1059 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1061 = isnan(0.0);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1067 = _1063 || _1065;
    float _1069 = floor(_1041);
    float _1071 = _937 * _1043;
    int _1073 = abs(_841);
    float _1075 = _1057 + (-1.0);
    float _1077 = _1071 * (-2.0);
    float _1079 = float(_1073);
    float _1081 = _437 + (-0.5);
    float _1083 = float(_1039);
    float _1085 = _809 * _1031;
    float _1087 = _1067 ? _1017 : 0.0;
    float _1089 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1091 = _435 + (-0.5);
    float _1093 = _1079 * _1083;
    float _1095 = fma(_1077, _1019, _1019);
    if (_1055)
    {
        float _1097 = _1087 * _981;
        _153 = _1097;
    }
    float _1099 = _153;
    bool _1101 = _1069 > 0.0;
    float _1103 = fma(_1089, _1077, _1089);
    float _1105 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1095);
    float _1107 = _1093 * (-2.0);
    bool _1109 = _1069 >= 0.0;
    bool _1111 = isnan(_1069);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan(0.0);
    bool _1117 = _1113 || _1115;
    float _1119 = _439 + _435;
    float _1121 = fma(_1103, _1099, _1105);
    float _1123 = fma(_1045, _1107, _1045);
    float _1125 = fma(_1107, _1021, _1021);
    int _1127 = _1117 ? 0 : 1;
    float _1129 = _1121 * 0.15915493667125701904296875;
    int _1131 = abs(_847);
    float _1133 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1125);
    int _1135 = ~_1127;
    int _1137 = _1135 + 1;
    int _1139 = _1137 + 1;
    float _1141 = _1119 + (-1.0);
    int _1143 = _1139;
    if (!_1101)
    {
        int _1145 = ~_1127;
        int _1147 = _1145 + 1;
        _1143 = _1147;
    }
    int _1149 = _1143;
    float _1151 = fma(_1123, _1099, _1133);
    float _1153 = float(_1131);
    float _1155 = _1129 * 6.283185482025146484375;
    float _1157 = sin(_1155);
    float _1159 = float(_1149);
    float _1161 = _439 + (-0.5);
    float _1163 = _1151 * 0.15915493667125701904296875;
    float _1165 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1167 = _1153 * _1159;
    float _1169 = _857 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1171 = _1129 * 6.283185482025146484375;
    float _1173 = cos(_1171);
    float _1175 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1177 = _1167 * (-2.0);
    float _1179 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1169);
    float _1181 = _1085 * _945;
    float _1183 = _1085 * _1165;
    float _1185 = fma(_1175, _1177, _1175);
    float _1187 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1179);
    float _1189 = _1163 * 6.283185482025146484375;
    float _1191 = sin(_1189);
    float _1193 = fma(_1177, _1023, _1023);
    float _1195 = _975 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1197 = _1187 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1199 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1193);
    float _1201 = _975 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1203 = fma(_863, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1195);
    float _1205 = _1163 * 6.283185482025146484375;
    float _1207 = cos(_1205);
    float _1209 = fma(_1185, _1099, _1199);
    float _1211 = _857 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1213 = fma(_863, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1201);
    float _1215 = fma(_871, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1203);
    float _1217 = _1209 * 0.15915493667125701904296875;
    float _1219 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1211);
    float _1221 = fma(_871, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1213);
    float _1223 = 1.0 / _1197;
    float _1225 = _1215 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1227 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1219);
    float _1229 = _1221 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1231 = _1173 * _1191;
    float _1233 = _1157 * _1191;
    float _1235 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1237 = _1217 * 6.283185482025146484375;
    float _1239 = sin(_1237);
    float _1241 = _1173 * _1207;
    float _1243 = _1235 + _1197;
    float _1245 = _1243 * _1223;
    float _1247 = _1245 * 0.5;
    float _1249 = trunc(_1229);
    int _1251 = int(_1249);
    float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1255 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1253);
    float _1257 = _1157 * _1207;
    float _1259 = fma(_1239, _1241, _1233);
    float _1261 = 1.0 / _1255;
    float _1263 = -_1231;
    float _1265 = fma(_1239, _1257, _1263);
    float _1267 = -_1257;
    float _1269 = fma(_1239, _1231, _1267);
    float _1271 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1273 = fma(_1239, _1233, _1241);
    float _1275 = _1271 * _1181;
    float _1277 = _1217 * 6.283185482025146484375;
    float _1279 = cos(_1277);
    int _1281 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1283 = _1251 + _1281;
    int _1285 = _1283 + 1;
    bool _1287 = _1285 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1289 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1291 = _1261 * _1289;
    float _1293 = trunc(_1225);
    int _1295 = int(_1293);
    bool _1297 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1299 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1301 = _1173 * _1279;
    float _1303 = _1207 * _1279;
    float _1305 = _1157 * _1279;
    float _1307 = _1191 * _1279;
    bool _1309 = !_1297;
    int _1311 = _1309 ? 0 : 1;
    float _1313 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    int _1315 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1317 = _1295 + _1315;
    int _1319 = _1317 + 1;
    float _1321 = _1313 * _1183;
    int _1323 = _1285;
    int _1325 = _1319;
    float _1327 = _1229;
    if (!_1297)
    {
        _1007 = 1;
    }
    int _1329 = _1007;
    float _1331 = _1301 * _1275;
    int _1333 = _1329;
    if (!_1299)
    {
        _1333 = _1311;
    }
    int _1335 = _1333;
    float _1337 = -_1275;
    float _1339 = _1239 * _1337;
    int _1341 = _1285 | _1319;
    float _1343 = fma(_1259, _1321, _1331);
    int _1345 = _1335 << 6;
    float _1347 = fma(_1303, _1321, _1339);
    bool _1349 = _1341 < 0;
    bool _1351 = _1349 || _1287;
    float _1353 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1355 = _1353 * 0.5;
    int _1357 = _1345 + 96;
    uint _1360 = uint(int(uint(_1357) >> uint(2)));
    uint _1362 = uint(int(uint(int(_1360)) >> uint(2)));
    int _1364 = int(_1360) & 3;
    float _1366 = (*spvDescriptorSet0.vp_c15)._m0[int(_1362)][_1364];
    int _1368 = int(_1360) + 1;
    uint _1370 = uint(int(uint(_1368) >> uint(2)));
    int _1372 = _1368 & 3;
    float _1374 = (*spvDescriptorSet0.vp_c15)._m0[int(_1370)][_1372];
    float _1376 = _1305 * _1275;
    bool _1378 = _1319 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1380 = _1378 || _1351;
    float _1382 = fma(_1307, _1355, _1347);
    float _1384 = fma(_1269, _1355, _1343);
    float _1386 = fma(_1265, _1321, _1376);
    bool _1388 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1390 = isnan(0.5);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1396 = _1392 || _1394;
    int _1398 = _1345 + 104;
    uint _1400 = uint(int(uint(_1398) >> uint(2)));
    uint _1402 = uint(int(uint(int(_1400)) >> uint(2)));
    int _1404 = int(_1400) & 3;
    float _1406 = (*spvDescriptorSet0.vp_c15)._m0[int(_1402)][_1404];
    int _1408 = int(_1400) + 1;
    uint _1410 = uint(int(uint(_1408) >> uint(2)));
    int _1412 = _1408 & 3;
    float _1414 = (*spvDescriptorSet0.vp_c15)._m0[int(_1410)][_1412];
    float _1416 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1418 = fma(_1273, _1355, _1386);
    float _1420 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1422 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1416);
    float _1424 = as_type<float>(_1335);
    if (!_1380)
    {
        int _1426 = _1319 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1428 = _1426 + _1285;
        _1323 = _1428;
    }
    int _1430 = _1323;
    int _1432 = _1345 + 48;
    uint _1434 = uint(int(uint(_1432) >> uint(2)));
    uint _1436 = uint(int(uint(int(_1434)) >> uint(2)));
    int _1438 = int(_1434) & 3;
    float _1440 = (*spvDescriptorSet0.vp_c15)._m0[int(_1436)][_1438];
    int _1442 = int(_1434) + 1;
    uint _1444 = uint(int(uint(_1442) >> uint(2)));
    int _1446 = _1442 & 3;
    float _1448 = (*spvDescriptorSet0.vp_c15)._m0[int(_1444)][_1446];
    float _1450 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1420);
    float _1452 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1422);
    float _1454 = 0.0;
    float _1456 = as_type<float>(_1430);
    if (!_1380)
    {
        float _1458 = floor(_1229);
        _1454 = _1458;
    }
    float _1460 = _1454;
    int _1462 = 0;
    if (!_1380)
    {
        int _1464 = _1430 << 2;
        _1462 = _1464;
    }
    int _1466 = _1462;
    float _1468 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1450);
    int _1470 = _1466;
    if (!_1380)
    {
        uint _1472 = uint(int(uint(_1430) >> uint(2)));
        _1325 = int(_1472);
    }
    int _1474 = _1325;
    float _1476 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1478 = _1345 + 64;
    uint _1480 = uint(int(uint(_1478) >> uint(2)));
    uint _1482 = uint(int(uint(int(_1480)) >> uint(2)));
    int _1484 = int(_1480) & 3;
    float _1486 = (*spvDescriptorSet0.vp_c15)._m0[int(_1482)][_1484];
    int _1488 = int(_1480) + 1;
    uint _1490 = uint(int(uint(_1488) >> uint(2)));
    int _1492 = _1488 & 3;
    float _1494 = (*spvDescriptorSet0.vp_c15)._m0[int(_1490)][_1492];
    if (!_1380)
    {
        int _1496 = 12 & _1466;
        _1470 = _1496;
    }
    int _1498 = _1470;
    float _1500 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1502 = _583 + _1476;
    float _1504 = 0.0;
    float _1506 = _1502;
    if (!_1380)
    {
        int _1508 = _1474 << 4;
        int _1510 = _1508 + _1498;
        _1504 = as_type<float>(_1510);
    }
    float _1512 = _1504;
    float _1514 = _679 + _1500;
    float _1516 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1518 = _1502 + _1516;
    int _1520 = _1345 + 56;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    uint _1524 = uint(int(uint(int(_1522)) >> uint(2)));
    int _1526 = int(_1522) & 3;
    float _1528 = (*spvDescriptorSet0.vp_c15)._m0[int(_1524)][_1526];
    int _1530 = int(_1522) + 1;
    uint _1532 = uint(int(uint(_1530) >> uint(2)));
    int _1534 = _1530 & 3;
    float _1536 = (*spvDescriptorSet0.vp_c15)._m0[int(_1532)][_1534];
    float _1538 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1540 = _1514 + _1538;
    float _1542 = _1518 * _1518;
    float _1544 = fma(_1540, _1540, _1542);
    int _1546 = _1345 + 72;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    uint _1550 = uint(int(uint(int(_1548)) >> uint(2)));
    int _1552 = int(_1548) & 3;
    float _1554 = (*spvDescriptorSet0.vp_c15)._m0[int(_1550)][_1552];
    int _1556 = int(_1548) + 1;
    uint _1558 = uint(int(uint(_1556) >> uint(2)));
    int _1560 = _1556 & 3;
    float _1562 = (*spvDescriptorSet0.vp_c15)._m0[int(_1558)][_1560];
    float _1564 = sqrt(_1544);
    int _1566 = _1345 + 80;
    uint _1568 = uint(int(uint(_1566) >> uint(2)));
    uint _1570 = uint(int(uint(int(_1568)) >> uint(2)));
    int _1572 = int(_1568) & 3;
    float _1574 = (*spvDescriptorSet0.vp_c15)._m0[int(_1570)][_1572];
    int _1576 = int(_1568) + 1;
    uint _1578 = uint(int(uint(_1576) >> uint(2)));
    int _1580 = _1576 & 3;
    float _1582 = (*spvDescriptorSet0.vp_c15)._m0[int(_1578)][_1580];
    float _1584 = _975 * _1374;
    float _1586 = fma(_863, _1366, _1584);
    float _1588 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1590 = _1345 + 88;
    uint _1592 = uint(int(uint(_1590) >> uint(2)));
    uint _1594 = uint(int(uint(int(_1592)) >> uint(2)));
    int _1596 = int(_1592) & 3;
    float _1598 = (*spvDescriptorSet0.vp_c15)._m0[int(_1594)][_1596];
    int _1600 = int(_1592) + 1;
    uint _1602 = uint(int(uint(_1600) >> uint(2)));
    int _1604 = _1600 & 3;
    float _1606 = (*spvDescriptorSet0.vp_c15)._m0[int(_1602)][_1604];
    float _1608 = fma(_871, _1406, _1586);
    float _1610 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1588);
    bool _1612 = _1564 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1614 = _1384;
    float _1616 = _1514;
    if (!_1380)
    {
        float _1618 = floor(_1225);
        _1614 = _1618;
    }
    float _1620 = _1614;
    float _1622 = _1608 + _1414;
    float _1624 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1610);
    float _1626 = _1512;
    if (!_1380)
    {
        int _1628 = as_type<int>(_1512) + 400;
        uint _1630 = uint(int(uint(_1628) >> uint(2)));
        uint _1632 = uint(int(uint(int(_1630)) >> uint(2)));
        int _1634 = int(_1630) & 3;
        float _1636 = (*spvDescriptorSet0.vp_c15)._m0[int(_1632)][_1634];
        _1626 = _1636;
    }
    float _1638 = _1626;
    float _1640 = _975 * _1448;
    float _1642 = 1.0 / _1622;
    float _1644 = fma(_863, _1440, _1640);
    float _1646 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1648 = _975 * _1494;
    float _1650 = _609 + _1646;
    float _1652 = fma(_863, _1486, _1648);
    float _1654 = _1448;
    float _1656 = _1486;
    if (!_1612)
    {
        _1654 = _1650;
    }
    float _1658 = _1654;
    float _1660 = fma(_871, _1528, _1644);
    float _1662 = fma(_871, _1554, _1652);
    bool _1664 = !_1612;
    float _1666 = _1658;
    float _1668 = _1620;
    if (!_1664)
    {
        float _1670 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1674 = _1564 + _1672;
        float _1676 = rsqrt(_1544);
        float _1678 = _1674 * _1670;
        float _1680 = _1650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1682 = _1678 * 0.15915493667125701904296875;
        float _1684 = _1682 * 6.283185482025146484375;
        float _1686 = cos(_1684);
        float _1688 = _1682 * 6.283185482025146484375;
        float _1690 = sin(_1688);
        float _1692 = _1686 + (-1.0);
        float _1694 = fma(_1690, _1680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1696 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = _1676 * _1694;
        float _1700 = fma(_1650, _1686, _1696);
        float _1702 = fma(_1540, _1698, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1704 = fma(_1518, _1698, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1616 = _1702;
        _1666 = _1700;
        _1506 = _1704;
        _1656 = _1682;
    }
    float _1706 = _1616;
    float _1708 = _1666;
    float _1710 = _1506;
    float _1712 = _1656;
    float _1714 = -_851;
    float _1716 = fma(_1714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1706);
    float _1718 = -_849;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1708);
    float _1722 = -_859;
    float _1724 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1710);
    float _1726 = _1660 + _1536;
    float _1728 = _1662 + _1562;
    float _1730 = _1720;
    float _1732 = _1716;
    float _1734 = _1724;
    if (!_1396)
    {
        float _1736 = _867 * _867;
        float _1738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1740 = -_583;
        float _1742 = _1740 + _1710;
        float _1744 = -_609;
        float _1746 = _1744 + _1708;
        float _1748 = fma(_875, _875, _1736);
        float _1750 = fma(_881, _881, _1748);
        float _1752 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1754 = sqrt(_1750);
        float _1756 = 1.0 / _1085;
        float _1758 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1760 = precise::min(_1754, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1762 = _1760 * _1738;
        float _1764 = _1762 * _1756;
        float _1766 = -_679;
        float _1768 = _1766 + _1706;
        float _1770 = _1758 * _1764;
        float _1772 = _1742 * _1764;
        float _1774 = fma(_1746, _1770, _857);
        float _1776 = fma(_1768, _1770, _863);
        float _1778 = fma(_1758, _1772, _871);
        _1730 = _1774;
        _1732 = _1776;
        _1734 = _1778;
    }
    float _1780 = _1730;
    float _1782 = _1732;
    float _1784 = _1734;
    float _1786 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1788 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1790 = _1726 * _1642;
    float _1792 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1794 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1786);
    float _1796 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1788);
    float _1798 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1800 = _1790 >= 0.0;
    float _1802 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1794);
    float _1804 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1792);
    float _1806 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1796);
    float _1808 = _1728 * _1642;
    float _1810 = _1802 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1812 = _1790 <= 1.0;
    bool _1814 = _1812 && _1800;
    float _1816 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1804);
    float _1818 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1820 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1798);
    float _1822 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1824 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1826 = _1808 >= 0.0;
    bool _1828 = _1826 && _1814;
    float _1830 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1820);
    float _1832 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1822);
    float _1834 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1836 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1838 = _1808 <= 1.0;
    bool _1840 = _1838 && _1828;
    float _1842 = _1830 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1844 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1832);
    float _1846 = -_1836;
    float _1848 = fma(_1846, _1834, 1.0);
    float _1850 = _975 * _1582;
    float _1852 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1854 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1844);
    float _1856 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1858 = fma(_863, _1574, _1850);
    float _1860 = log2(_1848);
    float _1862 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1852);
    float _1864 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1856);
    float _1866 = fma(_871, _1598, _1858);
    float _1868 = _1854;
    if (_1840)
    {
        float _1870 = float(_1335);
        _1424 = _1870;
    }
    float _1872 = _1424;
    float _1874 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1862);
    float _1876 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1864);
    float _1878 = _1866 + _1606;
    float _1880 = 1.0 / _1854;
    float _1882 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1874);
    float _1884 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1876);
    float _1886 = _1876;
    float _1888 = _1882;
    if (!_1380)
    {
        float _1890 = -_1620;
        float _1892 = _1225 + _1890;
        _1668 = _1892;
    }
    float _1894 = _1668;
    if (!_1380)
    {
        float _1896 = -_1460;
        float _1898 = _1229 + _1896;
        _1886 = _1898;
    }
    float _1900 = _1886;
    float _1902 = _1712;
    if (!_1380)
    {
        float _1904 = rint(_1638);
        float _1906 = precise::max(_1904, 0.0);
        uint _1908 = uint(_1906);
        uint _1910 = clamp(_1908, 0u, 65535u);
        _1902 = as_type<float>(_1910);
    }
    float _1912 = _1902;
    float _1914 = _1860 * 0.693147182464599609375;
    float _1916 = _1878 * _1642;
    float _1918 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1920 = _1858;
    float _1922 = _1918;
    if (_1840)
    {
        float _1924 = rint(_1872);
        float _1926 = precise::max(_1924, 0.0);
        uint _1928 = uint(_1926);
        uint _1930 = clamp(_1928, 0u, 65535u);
        _1920 = as_type<float>(_1930);
    }
    float _1932 = _1920;
    float _1934 = _1882 * _1880;
    float _1936 = _1884 * _1880;
    float _1938 = fma(_1934, 0.5, 0.5);
    float _1940 = fma(_1936, -0.5, 0.5);
    float _1942 = _1460;
    float _1944 = _1940;
    float _1946 = _1938;
    if (!_1380)
    {
        float3 _6008 = float3(_1900, _1894, float(as_type<int>(_1912)));
        float3 _6012 = select(_6008, float3(0.0), isnan(_6008));
        float _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6012.xy, uint(rint(_6012.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6012.xy, uint(rint(_6012.z)), level(0.0)).x;
        _1942 = _1948;
    }
    float _1950 = _1942;
    float _1952 = _1808;
    if (_1840)
    {
        float3 _6027 = float3(_1790, _1808, float(as_type<int>(_1932)));
        float3 _6029 = select(_6027, float3(0.0), isnan(_6027));
        float _1954 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6029.xy, uint(rint(_6029.z)), _1916, level(0.0));
        _1952 = _1954;
    }
    float _1956 = _1952;
    float3 _6039 = float3(_1938, _1940, _1918);
    float _1958 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6039, float3(0.0), isnan(_6039)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6039, float3(0.0), isnan(_6039)), level(0.0)).x;
    float3 _6048 = float3(_1938, _1940, _1918);
    float4 _1961 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6048, float3(0.0), isnan(_6048)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6048, float3(0.0), isnan(_6048)), level(0.0)).xyzw;
    float _1963 = _1961.x;
    float _1965 = _1961.y;
    float _1967 = _1961.z;
    float _1969 = _1961.w;
    bool _1971 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1973 = isnan(0.5);
    bool _1975 = _1971 || _1973;
    bool _1977 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1979 = _1975 || _1977;
    if (_1380)
    {
        _889 = 1.0;
    }
    float _1981 = _889;
    float _1983 = _1981;
    if (_1979)
    {
        _1327 = 1.0;
    }
    float _1985 = _1327;
    float _1987 = _1985;
    if (_1979)
    {
        _853 = 1.0;
    }
    float _1989 = _853;
    float _1991 = _1989;
    float _1993 = _1963;
    if (!_1979)
    {
        float _1995 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1997 = _1995 * 0.15915493667125701904296875;
        float _1999 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2001 = _1997 * 6.283185482025146484375;
        float _2003 = cos(_2001);
        float _2005 = _1999 * 0.15915493667125701904296875;
        float _2007 = _1997 * 6.283185482025146484375;
        float _2009 = sin(_2007);
        float _2011 = 1.0 / _2003;
        float _2013 = _2005 * 6.283185482025146484375;
        float _2015 = cos(_2013);
        float _2017 = _2009 * _2011;
        float _2019 = _2005 * 6.283185482025146484375;
        float _2021 = sin(_2019);
        float _2023 = _2015 * _2017;
        float _2025 = 1.0 / _2023;
        float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2029 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2027;
        float _2031 = 1.0 / _2029;
        float _2033 = _2021 * _2025;
        float _2035 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2037 = fma(_1291, _2033, _2035);
        float _2039 = _2037 * _2031;
        float _2041 = precise::clamp(_2039, 0.0, 1.0);
        _1944 = _2037;
        _1946 = _2005;
        _1991 = _2041;
    }
    float _2043 = _1944;
    float _2045 = _1946;
    float _2047 = _1991;
    float _2049 = _2045;
    float _2051 = _2043;
    if (!_1979)
    {
        float _2053 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2055 = _2053 * 0.15915493667125701904296875;
        float _2057 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2059 = _2055 * 6.283185482025146484375;
        float _2061 = cos(_2059);
        float _2063 = _2057 * 0.15915493667125701904296875;
        float _2065 = _2055 * 6.283185482025146484375;
        float _2067 = sin(_2065);
        float _2069 = 1.0 / _2061;
        float _2071 = _2063 * 6.283185482025146484375;
        float _2073 = cos(_2071);
        float _2075 = _2067 * _2069;
        float _2077 = _2063 * 6.283185482025146484375;
        float _2079 = sin(_2077);
        float _2081 = _2073 * _2075;
        float _2083 = 1.0 / _2081;
        float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2087 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2085;
        float _2089 = 1.0 / _2087;
        float _2091 = _2079 * _2083;
        float _2093 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2095 = fma(_1291, _2091, _2093);
        float _2097 = _2095 * _2089;
        float _2099 = precise::clamp(_2097, 0.0, 1.0);
        float _2101 = -_2099;
        float _2103 = _2101 + 1.0;
        _2049 = _2081;
        _2051 = _2069;
        _1987 = _2103;
    }
    float _2105 = _2049;
    float _2107 = _2051;
    float _2109 = _1987;
    if (!_1380)
    {
        int _2111 = _1430 << 4;
        int _2113 = _2111 + 2048;
        uint _2115 = uint(int(uint(_2113) >> uint(2)));
        uint _2117 = uint(int(uint(int(_2115)) >> uint(2)));
        int _2119 = int(_2115) & 3;
        float _2121 = (*spvDescriptorSet0.vp_c15)._m0[int(_2117)][_2119];
        int _2123 = int(_2115) + 1;
        uint _2125 = uint(int(uint(_2123) >> uint(2)));
        int _2127 = _2123 & 3;
        float _2129 = (*spvDescriptorSet0.vp_c15)._m0[int(_2125)][_2127];
        int _2131 = _2113 + 8;
        uint _2133 = uint(int(uint(_2131) >> uint(2)));
        uint _2135 = uint(int(uint(int(_2133)) >> uint(2)));
        int _2137 = int(_2133) & 3;
        float _2139 = (*spvDescriptorSet0.vp_c15)._m0[int(_2135)][_2137];
        int _2141 = int(_2133) + 1;
        uint _2143 = uint(int(uint(_2141) >> uint(2)));
        int _2145 = _2141 & 3;
        float _2147 = (*spvDescriptorSet0.vp_c15)._m0[int(_2143)][_2145];
        float _2149 = _975 * _2129;
        float _2151 = fma(_863, _2121, _2149);
        float _2153 = fma(_871, _2139, _2151);
        float _2155 = _2153 + _2147;
        float _2157 = precise::clamp(_2155, 0.0, 1.0);
        float _2159 = -_2157;
        float _2161 = _2159 + _1950;
        float _2163 = fma(_2161, 500.0, 1.5);
        float _2165 = exp2(_2163);
        float _2167 = 0.0 + _2165;
        float _2169 = precise::clamp(_2167, 0.0, 1.0);
        _1456 = as_type<float>(_2113);
        _1983 = _2169;
    }
    float _2171 = _1456;
    float _2173 = _1983;
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2177 = _1780 + _2175;
    float _2179 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2181 = _1782 + _2179;
    float _2183 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2185 = _1784 + _2183;
    float _2187 = _2177 * _2177;
    float _2189 = fma(_2181, _2181, _2187);
    float _2191 = fma(_2185, _2185, _2189);
    float _2193 = rsqrt(_2191);
    float _2195 = sqrt(_2191);
    float _2197 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2199 = _2181 * _2197;
    float _2201 = _2185 * _2197;
    float _2203 = _2199 * _2199;
    float _2205 = _2201 * _2201;
    float _2207 = _2203 + _2205;
    float _2209 = sqrt(_2207);
    bool _2211 = _2209 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2215 = _2209 + _2213;
    float _2217 = _2105;
    float _2219 = _2207;
    float _2221 = _2215;
    float _2223 = _2199;
    float _2225 = _2201;
    float _2227 = _2203;
    float _2229 = _2205;
    if (_2211)
    {
        float _2231 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2217 = _2231;
    }
    float _2233 = _2217;
    if (_2211)
    {
        float _2235 = rsqrt(_2207);
        _2219 = _2235;
    }
    float _2237 = _2219;
    if (_2211)
    {
        float _2239 = _2215 * _2233;
        _2221 = _2239;
    }
    float _2241 = _2221;
    if (_2211)
    {
        float _2243 = _2241 * 0.15915493667125701904296875;
        _1922 = _2243;
    }
    float _2245 = _1922;
    float _2247 = _2107;
    if (_2211)
    {
        float _2249 = _2245 * 6.283185482025146484375;
        float _2251 = sin(_2249);
        _2247 = _2251;
    }
    float _2253 = _2247;
    float _2255 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2257 = precise::max(0.0, _2255);
    float _2259 = _2171;
    float _2261 = _2257;
    float _2263 = _2255;
    if (_2211)
    {
        float _2265 = _2245 * 6.283185482025146484375;
        float _2267 = cos(_2265);
        _2259 = _2267;
    }
    float _2269 = _2259;
    float _2271 = -_2197;
    float _2273 = -_2257;
    float _2275 = fma(_2177, _2271, _2273);
    float _2277 = _2275;
    if (_2211)
    {
        float _2279 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2261 = _2279;
    }
    float _2281 = _2261;
    float _2283 = _2253;
    float _2285 = _2281;
    if (_2211)
    {
        float _2287 = fma(_2253, _2281, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2283 = _2287;
    }
    float _2289 = _2283;
    float _2291 = _2289;
    if (_2211)
    {
        float _2293 = _2269 + (-1.0);
        _2263 = _2293;
    }
    float _2295 = _2263;
    if (_2211)
    {
        float _2297 = _2237 * _2289;
        _2291 = _2297;
    }
    float _2299 = _2291;
    if (_2211)
    {
        float _2301 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2285 = _2301;
    }
    float _2303 = _2285;
    if (_2211)
    {
        float _2305 = _2199 * _2299;
        _2223 = _2305;
    }
    float _2307 = _2223;
    if (_2211)
    {
        float _2309 = _2201 * _2299;
        _2225 = _2309;
    }
    float _2311 = _2225;
    if (_2211)
    {
        float _2313 = fma(_2275, _2269, _2303);
        _2277 = _2313;
    }
    float _2315 = _2277;
    if (_2211)
    {
        float _2317 = _2307 * _2307;
        _2227 = _2317;
    }
    float _2319 = _2227;
    if (_2211)
    {
        float _2321 = _2311 * _2311;
        _2229 = _2321;
    }
    float _2323 = _2229;
    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2327 = fma(_2195, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2325);
    float _2329 = precise::clamp(_2327, 0.0, 1.0);
    float _2331 = fma(_2315, _2315, _2319);
    float _2333 = -_2329;
    float _2335 = _2333 + 1.0;
    float _2337 = _2331 + _2323;
    float _2339 = rsqrt(_2337);
    float _2341 = _2339 * _2315;
    float _2343 = _2339 * _2307;
    float _2345 = abs(_2335);
    float _2347 = log2(_2345);
    float _2349 = _2339 * _2311;
    float _2351 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2353 = -_2351;
    float _2355 = fma(_2341, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2353);
    float _2357 = -_2349;
    float _2359 = fma(_2357, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2355);
    float _2361 = fma(_2359, -0.5, 0.5);
    float _2363 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2365 = fma(_2359, 0.5, 0.5);
    float _2367 = _2341 + 1.0;
    float _2369 = sqrt(_2361);
    float _2371 = fma(_2365, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2373 = fma(_2365, _2371, -0.212114393711090087890625);
    float _2375 = exp2(_2363);
    float _2377 = fma(_2365, _2373, 1.570728778839111328125);
    float _2379 = _2369 * 0.636619746685028076171875;
    float _2381 = -_2377;
    float _2383 = fma(_2379, _2381, 1.0);
    float _2385 = -_2341;
    float _2387 = fma(_2375, _2367, _2385);
    float _2389 = fma(_2387, 0.5, 0.5);
    float2 _6667 = float2(_2383, _2389);
    float3 _2393 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6667, float2(0.0), isnan(_6667)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6667, float2(0.0), isnan(_6667)), level(0.0)).xyz;
    float _2395 = _2393.x;
    float _2397 = _2393.y;
    float _2399 = _2393.z;
    float _2401 = abs(_1291);
    float _2403 = log2(_2401);
    float _2405 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2407 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2409 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2411 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2413 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2415 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2417 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2405);
    float _2419 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2407);
    float _2421 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2409);
    float _2423 = -_1239;
    float _2425 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2411);
    float _2427 = -_1239;
    float _2429 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2413);
    float _2431 = -_1239;
    float _2433 = fma(_2431, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2415);
    float _2435 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2437 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2439 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2441 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2443 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2445 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2417);
    float _2447 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2419);
    float _2449 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2421);
    float _2451 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2435);
    float _2453 = exp2(_2441);
    float _2455 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2457 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2437);
    float _2459 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2439);
    float _2461 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2425);
    float _2463 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2429);
    float _2465 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2467 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2433);
    float _2469 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2455);
    float _2471 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2451);
    float _2473 = exp2(_2443);
    float _2475 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2457);
    float _2477 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2459);
    float _2479 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2481 = _2465 * _2461;
    float _2483 = _2465 * _2463;
    float _2485 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2469);
    float _2487 = _2465 * _2467;
    float _2489 = fma(_2479, _2445, _2481);
    float _2491 = fma(_2479, _2447, _2483);
    float _2493 = fma(_2479, _2449, _2487);
    float _2495 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2485);
    float _2497 = fma(_2453, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2499 = precise::clamp(_2497, 0.0, 1.0);
    float _2501 = _1854 * 0.5;
    float _2503 = _1882 + _1854;
    float _2505 = _2495 + _1854;
    float _2507 = fma(_2499, -2.0, 3.0);
    out.gl_Position.x = _1882;
    out.gl_Position.y = _1884;
    out.gl_Position.z = _2495;
    out.gl_Position.w = _1854;
    float _2509 = _2499 * _2499;
    float _2511 = fma(_1884, -0.5, _2501);
    bool _2513 = _1291 <= 8000.0;
    bool _2515 = isnan(_1291);
    bool _2517 = _2513 || _2515;
    bool _2519 = isnan(8000.0);
    bool _2521 = _2517 || _2519;
    float _2523 = float(_2521);
    float _2525 = _2505 * 0.5;
    float _2527 = _2509 * _2507;
    float _2529 = _2503 * 0.5;
    float _2531 = _2471 + _2489;
    float _2533 = _2475 + _2491;
    float _2535 = _2477 + _2493;
    float _2537 = -_915;
    float _2539 = _2537 + 1.0;
    out.m_84.x = _2529;
    out.m_84.y = _2511;
    out.m_84.z = _2525;
    out.m_84.w = _1854;
    bool _2541 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2543 = isnan(_2195);
    bool _2545 = _2541 || _2543;
    bool _2547 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2549 = _2545 || _2547;
    float _2551 = -_2473;
    float _2553 = _2551 + 1.0;
    if (!_1840)
    {
        _1888 = 1.0;
    }
    float _2555 = _1888;
    float _2557 = -_2527;
    float _2559 = _2557 + 1.0;
    float _2561 = _2555;
    if (_1840)
    {
        bool _2563 = _1956 >= _1916;
        bool _2565 = isnan(_1956);
        bool _2567 = _2563 || _2565;
        bool _2569 = isnan(_1916);
        bool _2571 = _2567 || _2569;
        float _2573 = float(_2571);
        _2561 = _2573;
    }
    float _2575 = _2561;
    float _2577 = _2553 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _2531;
    out.m_86.y = _2533;
    out.m_86.z = _2535;
    float _2579 = fma(_2559, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2527);
    float _2581 = _2577 * _1958;
    float _2583 = -_2577;
    float _2585 = _2583 + 1.0;
    float _2587 = _2523 * _2579;
    out.m_88.x = _1782;
    out.m_88.y = _1780;
    out.m_88.z = _1784;
    float _2589 = _1969 * _2581;
    float _2591 = _1969 * _2585;
    float _2593 = _2587 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2595 = _2575 * _2173;
    float _2597 = _2585;
    if (!_2549)
    {
        _1868 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2599 = _1868;
    float _2601 = _2539 * _2593;
    float _2603 = precise::clamp(_2601, 0.0, 1.0);
    float _2605 = _2599;
    float _2607 = _2599;
    if (!_2549)
    {
        _2597 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2609 = _2597;
    float _2611 = -_2603;
    float _2613 = fma(_2611, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2615 = -_2595;
    float _2617 = fma(_2615, _2613, 1.0);
    float _2619 = precise::clamp(_2617, 0.0, 1.0);
    float _2621 = _2613;
    float _2623 = _2609;
    float _2625 = _2609;
    if (!_2549)
    {
        _2621 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2627 = _2621;
    float _2629 = _2619 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_90.x = _2629;
    float _2631 = _2629;
    float _2633 = _2627;
    float _2635 = _2627;
    if (!_2549)
    {
        _2631 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2637 = _2631;
    float _2639 = _2399 * _2581;
    float _2641 = fma(_2395, _2589, _1963);
    float _2643 = fma(_2397, _2589, _1965);
    float _2645 = _2047 * _2109;
    float _2647 = fma(_1969, _2639, _1967);
    float _2649 = _2645;
    float _2651 = _2637;
    float _2653 = _2637;
    if (!_2549)
    {
        _1993 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2655 = _1993;
    float _2657 = _2645 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2659 = _2655;
    float _2661 = _2655;
    if (!_2549)
    {
        _2649 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2663 = _2649;
    out.m_92.x = _2641;
    out.m_92.y = _2643;
    out.m_92.z = _2647;
    out.m_92.w = _2591;
    bool _2665 = !_2549;
    float _2667 = _2663;
    float _2669 = _2663;
    if (!_2665)
    {
        bool _2671 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2673 = isnan(_2195);
        bool _2675 = _2671 || _2673;
        bool _2677 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2679 = _2675 || _2677;
        if (!_2679)
        {
            float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2683 = _2195 + _2681;
            float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2687 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2685;
            float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2693 = 1.0 / _2687;
            float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2699 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2701 = _2699 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2703 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2705 = _2703 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2707 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2709 = _2707 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2711 = _2683 * _2693;
            float _2713 = precise::clamp(_2711, 0.0, 1.0);
            float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2717 = _2715 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2719 = fma(_2713, _2691, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2721 = fma(_2713, _2717, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2723 = fma(_2713, _2697, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2725 = fma(_2713, _2701, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2727 = fma(_2713, _2705, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2729 = fma(_2713, _2709, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2607 = _2723;
            _2653 = _2727;
            _2661 = _2719;
            _2635 = _2725;
            _2625 = _2721;
            _2669 = _2729;
            _2731 = true;
        }
        else
        {
            bool _2733 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2735 = isnan(_2195);
            bool _2737 = _2733 || _2735;
            bool _2739 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2741 = _2737 || _2739;
            if (!_2741)
            {
                _2659 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2743 = _2659;
            _2661 = _2743;
            if (!_2741)
            {
                _2605 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2745 = _2605;
            _2607 = _2745;
            if (!_2741)
            {
                _2623 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2747 = _2623;
            _2625 = _2747;
            if (!_2741)
            {
                _2633 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2749 = _2633;
            _2635 = _2749;
            if (!_2741)
            {
                _2651 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2751 = _2651;
            _2653 = _2751;
            if (!_2741)
            {
                _2667 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2753 = _2667;
            bool _2755 = !_2741;
            _2669 = _2753;
            if (!_2755)
            {
                bool _2757 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2759 = isnan(_2195);
                bool _2761 = _2757 || _2759;
                bool _2763 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2765 = _2761 || _2763;
                if (!_2765)
                {
                    float _2767 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2769 = _2195 + _2767;
                    float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2773 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2771;
                    float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2777 = _2775 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2779 = 1.0 / _2773;
                    float _2781 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2783 = _2781 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2785 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2787 = _2785 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2791 = _2789 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2795 = _2793 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2797 = _2769 * _2779;
                    float _2799 = precise::clamp(_2797, 0.0, 1.0);
                    float _2801 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2803 = _2801 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2805 = fma(_2799, _2777, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2807 = fma(_2799, _2803, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2809 = fma(_2799, _2783, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2811 = fma(_2799, _2787, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2813 = fma(_2799, _2791, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2815 = fma(_2799, _2795, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2607 = _2809;
                    _2653 = _2813;
                    _2661 = _2805;
                    _2635 = _2811;
                    _2625 = _2807;
                    _2669 = _2815;
                    _2731 = true;
                }
                else
                {
                    _2607 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2653 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2661 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2635 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2625 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2669 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2731 = false;
    float _2817 = _2607;
    float _2819 = _2653;
    float _2821 = _2661;
    float _2823 = _2635;
    float _2825 = _2625;
    float _2827 = _2669;
    float _2829 = fma(_2533, -0.5, 0.5);
    float _2831 = precise::clamp(_2829, 0.0, 1.0);
    float _2833 = -_2817;
    float _2835 = _2833 + _2819;
    float _2837 = _2657 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2839 = -_2821;
    float _2841 = _2839 + _2823;
    float _2843 = fma(_2831, _2835, _2817);
    out.m_94.x = 0.0;
    float _2845 = -_2825;
    float _2847 = _2845 + _2827;
    float _2849 = fma(_2831, _2841, _2821);
    float _2851 = _2843 * 0.586610972881317138671875;
    out.m_59.x = _2837;
    bool _2853 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2855 = fma(_2831, _2847, _2825);
    float _2857 = fma(_2849, 0.298911988735198974609375, _2851);
    bool _2859 = _2047 > 0.0;
    bool _2861 = isnan(_2047);
    bool _2863 = _2859 || _2861;
    bool _2865 = isnan(0.0);
    bool _2867 = _2863 || _2865;
    float _2869 = fma(_2855, 0.114477999508380889892578125, _2857);
    bool _2871 = _2109 <= 0.0;
    bool _2873 = !_2867;
    bool _2875 = _2871 || _2873;
    float _2877 = -_2869;
    float _2879 = _2849 + _2877;
    float _2881 = -_2869;
    float _2883 = _2843 + _2881;
    float _2885 = -_2869;
    float _2887 = _2855 + _2885;
    float _2889 = fma(_2879, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2869);
    float _2891 = fma(_2883, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2869);
    float _2893 = fma(_2887, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2869);
    bool _2895 = !_2853;
    if (!_2895)
    {
        float _2897 = -_1780;
        float _2899 = _2897 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2901 = -_1782;
        float _2903 = _2901 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2905 = -_1784;
        float _2907 = _2905 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2909 = _2899 * _2899;
        float _2911 = fma(_2903, _2903, _2909);
        float _2913 = fma(_2907, _2907, _2911);
        float _2915 = sqrt(_2913);
        float _2917 = rsqrt(_2913);
        float _2919 = -_2915;
        float _2921 = _2919 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2923 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2925 = precise::clamp(_2923, 0.0, 1.0);
        float _2927 = _2903 * _2917;
        float _2929 = _2899 * _2917;
        float _2931 = abs(_2925);
        float _2933 = log2(_2931);
        float _2935 = _2907 * _2917;
        float _2937 = _2927 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2939 = _2533 * _2929;
        float _2941 = -_2929;
        float _2943 = -_2937;
        float _2945 = fma(_2941, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2943);
        float _2947 = fma(_2531, _2927, _2939);
        float _2949 = -_2935;
        float _2951 = fma(_2949, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2945);
        float _2953 = fma(_2535, _2935, _2947);
        float _2955 = precise::clamp(_2953, 0.0, 1.0);
        float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2959 = _2951 + _2957;
        float _2961 = _2933 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2963 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2965 = precise::clamp(_2963, 0.0, 1.0);
        float _2967 = exp2(_2961);
        float _2969 = _2967 * _2965;
        float _2971 = _2955 * _2969;
        float _2973 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2975 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2977 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _2973;
        out.m_94.y = _2975;
        out.m_94.z = _2977;
    }
    out.m_96.x = _2889;
    out.m_96.y = _2891;
    out.m_96.z = _2893;
    if (!_2875)
    {
        return out;
    }
    float _2979 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2979;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2731 = false;
    bool _425 = false;
    bool _313 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _3036 = as_type<float>(_131);
        out.gl_Position.z = _3036;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_61.w;
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
        out.m_59.x = 0.0;
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
        float _3105 = as_type<float>(_169);
        out.gl_Position.z = _3105;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _193 = in.m_66.x;
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
    bool _245 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _247 = isnan(_219);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _257;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _263 = 1.0 / _239;
    float _265 = _255 * _243;
    float _267 = -_255;
    float _269 = _267 + 1.0;
    float _271 = _223 * _263;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = fma(_259, _271, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _279 = fma(_275, _271, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _281 = _277 * _265;
    float _283 = _279 * _265;
    float _285 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    bool _293 = !_261;
    float _311;
    if (!_293)
    {
        float _295 = in.m_66.x;
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
    float _359 = -_333;
    float _361 = _359 + 1.0;
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _365 = 1.0 / _337;
    float _367 = _349 * _361;
    float _369 = -_349;
    float _371 = _369 + 1.0;
    float _373 = _353 * _365;
    float _375 = fma(_373, _357, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _377 = _375 * _367;
    float _379 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[115].x, _377);
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _387 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[116].x, _379);
    float _389 = in.m_68.x;
    float _391 = in.m_68.y;
    float _393 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _395 = _383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _397 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _387 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_70.x = _393;
    out.m_70.y = _395;
    out.m_70.z = _397;
    out.m_70.w = _399;
    float _401 = _291 * _391;
    float _403 = _289 * _389;
    bool _405 = !_363;
    float _423;
    if (!_405)
    {
        float _407 = in.m_66.x;
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
    float _435 = in.m_66.x;
    float _437 = in.m_66.y;
    float _439 = in.m_66.z;
    float _441 = in.m_66.w;
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _445 = in.m_56.x;
    float _447 = in.m_56.y;
    float _449 = in.m_56.z;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _453 = _451 != 0;
    float _455 = in.m_72.x;
    float _457 = in.m_72.y;
    float _459 = in.m_72.z;
    float _461 = in.m_72.w;
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _465 = _463 != 0;
    int _467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _469 = _467 != 0;
    float _471 = in.m_74.x;
    float _473 = in.m_74.y;
    float _475 = in.m_74.z;
    float _477 = in.m_74.w;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _485 = _483 != 0;
    float _487 = in.m_76.x;
    float _489 = in.m_76.y;
    float _491 = in.m_76.z;
    float _493 = in.m_76.w;
    bool _495 = _441 > 0.5;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _501 = _435 > 0.5;
    float _503 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _505 = 1.0 / _499;
    float _507 = _447 * _457;
    float _509 = _447 * _473;
    float _511 = fma(_445, _455, _507);
    float _513 = fma(_445, _471, _509);
    float _515 = _447 * _489;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _517;
    float _521 = fma(_449, _475, _513);
    float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _525 = fma(_445, _487, _515);
    float _527 = -_185;
    int _529 = _501 ? as_type<int>(_527) : as_type<int>(_185);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _533 = _437 > 0.5;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _537 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _539 = fma(_449, _459, _511);
    float _541 = fma(_449, _491, _525);
    float _543 = _519 * _505;
    float _545 = -_189;
    int _547 = _533 ? as_type<int>(_545) : as_type<int>(_189);
    float _549 = -_531;
    float _551 = fma(_503, 2.0, _549);
    float _553 = _519;
    if (!_453)
    {
        _553 = _439;
    }
    float _555 = _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _559 = _433 + _557;
    float _561 = _555;
    if (_453)
    {
        _561 = _437;
    }
    float _563 = _561;
    float _565 = fma(_537, -2.0, _535);
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _569 = !_465;
    float _571 = _569 ? _185 : as_type<float>(_529);
    float _573 = fma(_543, _559, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _575 = !_469;
    float _577 = _575 ? _189 : as_type<float>(_547);
    float _579 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[83].w, _567);
    float _581 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _565);
    float _583 = _541 + _493;
    float _585 = _443 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _587 = _523 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _589 = -_149;
    float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[76].x, _551);
    float _593 = _571 + 0.5;
    float _595 = _577 + (-0.5);
    bool _597 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _599 = isnan(_433);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = _521 + _477;
    float _611 = fma(_585, _593, _591);
    float _613 = -_587;
    float _615 = -_581;
    float _617 = fma(_613, _595, _615);
    bool _619 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _621 = isnan(_433);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -_607;
    float _633 = _631 + 1.0;
    float _635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _637 = _581;
    float _639 = _617;
    if (!_453)
    {
        _637 = _437;
    }
    float _641 = _637;
    float _643 = _629 * _633;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _647 = _641;
    if (_453)
    {
        _647 = _435;
    }
    float _649 = _647;
    float _651 = _573 * _643;
    bool _653 = _439 > 0.5;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _659 = _649 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _661 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[83].z, _645);
    float _663 = -_185;
    int _665 = _653 ? as_type<int>(_663) : as_type<int>(_185);
    float _667 = -_629;
    float _669 = _667 + 1.0;
    float _671 = _649;
    if (!_453)
    {
        _671 = _439;
    }
    float _673 = _671;
    float _675 = -_655;
    float _677 = fma(_659, 2.0, _675);
    float _679 = _539 + _461;
    float _681 = _673;
    if (_453)
    {
        _681 = _437;
    }
    float _683 = _681;
    float _685 = -_149;
    float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[81].x, _677);
    bool _689 = !_481;
    float _691 = _689 ? _185 : as_type<float>(_665);
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _695 = _683 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _697 = _635 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _699 = _691 + 0.5;
    float _701 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _579);
    float _703 = fma(_695, -2.0, _693);
    float _705 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[131].x, _651);
    float _707 = -_189;
    int _709 = _495 ? as_type<int>(_707) : as_type<int>(_189);
    float _711 = fma(_697, _699, _687);
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _715 = _609 + _713;
    float _717 = _657 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _719 = !_485;
    float _721 = _719 ? _189 : as_type<float>(_709);
    float _723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _725 = _679 + _723;
    float _727 = _715 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _729 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _703);
    float _731 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _733 = _583 + _731;
    float _735 = _721 + (-0.5);
    float _737 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[28].x, _727);
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _743 = -_717;
    float _745 = -_729;
    float _747 = fma(_743, _735, _745);
    float _749 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[28].z, _737);
    float _751 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].z, _739);
    float _753 = -_701;
    float _755 = _753 + 1.0;
    float _757 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].w, _741);
    float _759 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[132].x, _705);
    float _761 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _751);
    bool _763 = _749 >= 0.0;
    float _765 = fma(_721, _755, _747);
    float _767 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _757);
    float _769 = -_761;
    float _771 = _769 + 1.0;
    float _773 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _661);
    float _775 = -_767;
    float _777 = _775 + 1.0;
    float _779 = -_771;
    float _781 = fma(_571, _779, _611);
    float _783 = _715 * _715;
    float _785 = -_773;
    float _787 = _785 + 1.0;
    float _789 = fma(_725, _725, _783);
    float _791 = fma(_577, _777, _617);
    if (_763)
    {
        _639 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _793 = _639;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _797 = fma(_733, _733, _789);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _803 = -_787;
    float _805 = fma(_691, _803, _711);
    float _807 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = rsqrt(_797);
    float _811 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = _801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _815 = _759 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _817 = as_type<int>(_793);
    if (_763)
    {
        float _819 = _793 * 5.0;
        _817 = as_type<int>(_819);
    }
    int _821 = _817;
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _825 = _823 != 0;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _829 = _827 != 0;
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _833 = _831 != 0;
    out.m_78.x = _781;
    out.m_78.y = _791;
    out.m_78.z = _805;
    out.m_78.w = _765;
    out.m_80.x = _807;
    out.m_80.y = _811;
    out.m_80.z = _813;
    out.m_80.w = _815;
    bool _835 = !_825;
    int _837 = _835 ? 0 : 1;
    bool _839 = !_829;
    int _841 = _839 ? 0 : 1;
    float _843 = as_type<float>(_821);
    if (_763)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4227 = as_type<float>(_821);
        out.gl_Position.z = _4227;
    }
    bool _845 = !_833;
    int _847 = _845 ? 0 : 1;
    float _849 = _715 * _809;
    float _851 = _725 * _809;
    float _853 = _849;
    if (_763)
    {
        out.m_59.x = 0.0;
    }
    if (_763)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _855 = -_849;
    float _857 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _609);
    float _859 = _733 * _809;
    float _861 = -_851;
    float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[18].w, _679);
    float _865 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _867 = _857 + _865;
    float _869 = -_859;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _583);
    float _873 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _875 = _863 + _873;
    float _877 = _867 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _881 = _871 + _879;
    float _883 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[28].x, _877);
    float _885 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[28].z, _883);
    bool _887 = _885 >= 0.0;
    float _889 = _859;
    if (_887)
    {
        _843 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _891 = _843;
    int _893 = as_type<int>(_891);
    if (_887)
    {
        out.m_59.x = 0.0;
    }
    if (_887)
    {
        float _895 = _891 * 5.0;
        _893 = as_type<int>(_895);
    }
    int _897 = _893;
    if (_887)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4333 = as_type<float>(_897);
        out.gl_Position.z = _4333;
    }
    if (_887)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _899 = fma(_863, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _901 = fma(_871, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _903 = floor(_899);
    float _905 = floor(_901);
    float _907 = -_903;
    float _909 = _899 + _907;
    float _911 = -_905;
    float _913 = _901 + _911;
    float2 _4369 = float2(_909, _913);
    float _915 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4369, float2(0.0), isnan(_4369)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4369, float2(0.0), isnan(_4369)), level(0.0)).x;
    float _917 = _439 * 2.0;
    float _919 = _435 * 2.0;
    float _921 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _923 = log2(_921);
    float _925 = -_849;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _715);
    int _929 = abs(_837);
    float _931 = -_851;
    float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[18].w, _725);
    float _935 = _927 * _927;
    float _937 = float(_929);
    float _939 = floor(_917);
    float _941 = -_859;
    float _943 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[18].w, _733);
    float _945 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _947 = floor(_919);
    float _949 = _923 * _149;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _953 = 1.0 + _951;
    float _955 = fma(_933, _933, _935);
    float _957 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _959 = fma(_943, _943, _955);
    bool _961 = _939 >= 0.0;
    bool _963 = isnan(_939);
    bool _965 = _961 || _963;
    bool _967 = isnan(0.0);
    bool _969 = _965 || _967;
    float _971 = exp2(_949);
    bool _973 = _939 > 0.0;
    float _975 = _857 + _957;
    int _977 = _969 ? 0 : 1;
    bool _979 = _947 > 0.0;
    float _981 = 1.0 / _953;
    bool _983 = _947 >= 0.0;
    bool _985 = isnan(_947);
    bool _987 = _983 || _985;
    bool _989 = isnan(0.0);
    bool _991 = _987 || _989;
    float _993 = _437 + _439;
    int _995 = ~_977;
    int _997 = _995 + 1;
    int _999 = _997 + 1;
    int _1001 = _991 ? 0 : 1;
    float _1003 = _993 + (-1.0);
    int _1005 = _999;
    int _1007 = 2;
    if (!_973)
    {
        int _1009 = ~_977;
        int _1011 = _1009 + 1;
        _1005 = _1011;
    }
    int _1013 = _1005;
    float _1015 = -_971;
    float _1017 = _1015 + 1.0;
    float _1019 = in.m_82.x;
    float _1021 = in.m_82.y;
    float _1023 = in.m_82.z;
    int _1025 = ~_1001;
    int _1027 = _1025 + 1;
    int _1029 = _1027 + 1;
    float _1031 = sqrt(_959);
    int _1033 = _1029;
    if (!_979)
    {
        int _1035 = ~_1001;
        int _1037 = _1035 + 1;
        _1033 = _1037;
    }
    int _1039 = _1033;
    float _1041 = _437 * 2.0;
    float _1043 = float(_1013);
    float _1045 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1047 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1049 = isnan(1.0);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1055 = _1051 || _1053;
    float _1057 = _437 + _435;
    bool _1059 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1061 = isnan(0.0);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1067 = _1063 || _1065;
    float _1069 = floor(_1041);
    float _1071 = _937 * _1043;
    int _1073 = abs(_841);
    float _1075 = _1057 + (-1.0);
    float _1077 = _1071 * (-2.0);
    float _1079 = float(_1073);
    float _1081 = _437 + (-0.5);
    float _1083 = float(_1039);
    float _1085 = _809 * _1031;
    float _1087 = _1067 ? _1017 : 0.0;
    float _1089 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1091 = _435 + (-0.5);
    float _1093 = _1079 * _1083;
    float _1095 = fma(_1077, _1019, _1019);
    if (_1055)
    {
        float _1097 = _1087 * _981;
        _153 = _1097;
    }
    float _1099 = _153;
    bool _1101 = _1069 > 0.0;
    float _1103 = fma(_1089, _1077, _1089);
    float _1105 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1095);
    float _1107 = _1093 * (-2.0);
    bool _1109 = _1069 >= 0.0;
    bool _1111 = isnan(_1069);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan(0.0);
    bool _1117 = _1113 || _1115;
    float _1119 = _439 + _435;
    float _1121 = fma(_1103, _1099, _1105);
    float _1123 = fma(_1045, _1107, _1045);
    float _1125 = fma(_1107, _1021, _1021);
    int _1127 = _1117 ? 0 : 1;
    float _1129 = _1121 * 0.15915493667125701904296875;
    int _1131 = abs(_847);
    float _1133 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1125);
    int _1135 = ~_1127;
    int _1137 = _1135 + 1;
    int _1139 = _1137 + 1;
    float _1141 = _1119 + (-1.0);
    int _1143 = _1139;
    if (!_1101)
    {
        int _1145 = ~_1127;
        int _1147 = _1145 + 1;
        _1143 = _1147;
    }
    int _1149 = _1143;
    float _1151 = fma(_1123, _1099, _1133);
    float _1153 = float(_1131);
    float _1155 = _1129 * 6.283185482025146484375;
    float _1157 = sin(_1155);
    float _1159 = float(_1149);
    float _1161 = _439 + (-0.5);
    float _1163 = _1151 * 0.15915493667125701904296875;
    float _1165 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1167 = _1153 * _1159;
    float _1169 = _857 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1171 = _1129 * 6.283185482025146484375;
    float _1173 = cos(_1171);
    float _1175 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1177 = _1167 * (-2.0);
    float _1179 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1169);
    float _1181 = _1085 * _945;
    float _1183 = _1085 * _1165;
    float _1185 = fma(_1175, _1177, _1175);
    float _1187 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1179);
    float _1189 = _1163 * 6.283185482025146484375;
    float _1191 = sin(_1189);
    float _1193 = fma(_1177, _1023, _1023);
    float _1195 = _975 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1197 = _1187 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1199 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1193);
    float _1201 = _975 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1203 = fma(_863, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1195);
    float _1205 = _1163 * 6.283185482025146484375;
    float _1207 = cos(_1205);
    float _1209 = fma(_1185, _1099, _1199);
    float _1211 = _857 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1213 = fma(_863, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1201);
    float _1215 = fma(_871, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1203);
    float _1217 = _1209 * 0.15915493667125701904296875;
    float _1219 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1211);
    float _1221 = fma(_871, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1213);
    float _1223 = 1.0 / _1197;
    float _1225 = _1215 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1227 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1219);
    float _1229 = _1221 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1231 = _1173 * _1191;
    float _1233 = _1157 * _1191;
    float _1235 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1237 = _1217 * 6.283185482025146484375;
    float _1239 = sin(_1237);
    float _1241 = _1173 * _1207;
    float _1243 = _1235 + _1197;
    float _1245 = _1243 * _1223;
    float _1247 = _1245 * 0.5;
    float _1249 = trunc(_1229);
    int _1251 = int(_1249);
    float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1255 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1253);
    float _1257 = _1157 * _1207;
    float _1259 = fma(_1239, _1241, _1233);
    float _1261 = 1.0 / _1255;
    float _1263 = -_1231;
    float _1265 = fma(_1239, _1257, _1263);
    float _1267 = -_1257;
    float _1269 = fma(_1239, _1231, _1267);
    float _1271 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1273 = fma(_1239, _1233, _1241);
    float _1275 = _1271 * _1181;
    float _1277 = _1217 * 6.283185482025146484375;
    float _1279 = cos(_1277);
    int _1281 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1283 = _1251 + _1281;
    int _1285 = _1283 + 1;
    bool _1287 = _1285 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1289 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1291 = _1261 * _1289;
    float _1293 = trunc(_1225);
    int _1295 = int(_1293);
    bool _1297 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1299 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1301 = _1173 * _1279;
    float _1303 = _1207 * _1279;
    float _1305 = _1157 * _1279;
    float _1307 = _1191 * _1279;
    bool _1309 = !_1297;
    int _1311 = _1309 ? 0 : 1;
    float _1313 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    int _1315 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1317 = _1295 + _1315;
    int _1319 = _1317 + 1;
    float _1321 = _1313 * _1183;
    int _1323 = _1285;
    int _1325 = _1319;
    float _1327 = _1229;
    if (!_1297)
    {
        _1007 = 1;
    }
    int _1329 = _1007;
    float _1331 = _1301 * _1275;
    int _1333 = _1329;
    if (!_1299)
    {
        _1333 = _1311;
    }
    int _1335 = _1333;
    float _1337 = -_1275;
    float _1339 = _1239 * _1337;
    int _1341 = _1285 | _1319;
    float _1343 = fma(_1259, _1321, _1331);
    int _1345 = _1335 << 6;
    float _1347 = fma(_1303, _1321, _1339);
    bool _1349 = _1341 < 0;
    bool _1351 = _1349 || _1287;
    float _1353 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1355 = _1353 * 0.5;
    int _1357 = _1345 + 96;
    uint _1360 = uint(int(uint(_1357) >> uint(2)));
    uint _1362 = uint(int(uint(int(_1360)) >> uint(2)));
    int _1364 = int(_1360) & 3;
    float _1366 = (*spvDescriptorSet0.vp_c15)._m0[int(_1362)][_1364];
    int _1368 = int(_1360) + 1;
    uint _1370 = uint(int(uint(_1368) >> uint(2)));
    int _1372 = _1368 & 3;
    float _1374 = (*spvDescriptorSet0.vp_c15)._m0[int(_1370)][_1372];
    float _1376 = _1305 * _1275;
    bool _1378 = _1319 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1380 = _1378 || _1351;
    float _1382 = fma(_1307, _1355, _1347);
    float _1384 = fma(_1269, _1355, _1343);
    float _1386 = fma(_1265, _1321, _1376);
    bool _1388 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1390 = isnan(0.5);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1396 = _1392 || _1394;
    int _1398 = _1345 + 104;
    uint _1400 = uint(int(uint(_1398) >> uint(2)));
    uint _1402 = uint(int(uint(int(_1400)) >> uint(2)));
    int _1404 = int(_1400) & 3;
    float _1406 = (*spvDescriptorSet0.vp_c15)._m0[int(_1402)][_1404];
    int _1408 = int(_1400) + 1;
    uint _1410 = uint(int(uint(_1408) >> uint(2)));
    int _1412 = _1408 & 3;
    float _1414 = (*spvDescriptorSet0.vp_c15)._m0[int(_1410)][_1412];
    float _1416 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1418 = fma(_1273, _1355, _1386);
    float _1420 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1422 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1416);
    float _1424 = as_type<float>(_1335);
    if (!_1380)
    {
        int _1426 = _1319 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1428 = _1426 + _1285;
        _1323 = _1428;
    }
    int _1430 = _1323;
    int _1432 = _1345 + 48;
    uint _1434 = uint(int(uint(_1432) >> uint(2)));
    uint _1436 = uint(int(uint(int(_1434)) >> uint(2)));
    int _1438 = int(_1434) & 3;
    float _1440 = (*spvDescriptorSet0.vp_c15)._m0[int(_1436)][_1438];
    int _1442 = int(_1434) + 1;
    uint _1444 = uint(int(uint(_1442) >> uint(2)));
    int _1446 = _1442 & 3;
    float _1448 = (*spvDescriptorSet0.vp_c15)._m0[int(_1444)][_1446];
    float _1450 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1420);
    float _1452 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1422);
    float _1454 = 0.0;
    float _1456 = as_type<float>(_1430);
    if (!_1380)
    {
        float _1458 = floor(_1229);
        _1454 = _1458;
    }
    float _1460 = _1454;
    int _1462 = 0;
    if (!_1380)
    {
        int _1464 = _1430 << 2;
        _1462 = _1464;
    }
    int _1466 = _1462;
    float _1468 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1450);
    int _1470 = _1466;
    if (!_1380)
    {
        uint _1472 = uint(int(uint(_1430) >> uint(2)));
        _1325 = int(_1472);
    }
    int _1474 = _1325;
    float _1476 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1478 = _1345 + 64;
    uint _1480 = uint(int(uint(_1478) >> uint(2)));
    uint _1482 = uint(int(uint(int(_1480)) >> uint(2)));
    int _1484 = int(_1480) & 3;
    float _1486 = (*spvDescriptorSet0.vp_c15)._m0[int(_1482)][_1484];
    int _1488 = int(_1480) + 1;
    uint _1490 = uint(int(uint(_1488) >> uint(2)));
    int _1492 = _1488 & 3;
    float _1494 = (*spvDescriptorSet0.vp_c15)._m0[int(_1490)][_1492];
    if (!_1380)
    {
        int _1496 = 12 & _1466;
        _1470 = _1496;
    }
    int _1498 = _1470;
    float _1500 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1502 = _583 + _1476;
    float _1504 = 0.0;
    float _1506 = _1502;
    if (!_1380)
    {
        int _1508 = _1474 << 4;
        int _1510 = _1508 + _1498;
        _1504 = as_type<float>(_1510);
    }
    float _1512 = _1504;
    float _1514 = _679 + _1500;
    float _1516 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1518 = _1502 + _1516;
    int _1520 = _1345 + 56;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    uint _1524 = uint(int(uint(int(_1522)) >> uint(2)));
    int _1526 = int(_1522) & 3;
    float _1528 = (*spvDescriptorSet0.vp_c15)._m0[int(_1524)][_1526];
    int _1530 = int(_1522) + 1;
    uint _1532 = uint(int(uint(_1530) >> uint(2)));
    int _1534 = _1530 & 3;
    float _1536 = (*spvDescriptorSet0.vp_c15)._m0[int(_1532)][_1534];
    float _1538 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1540 = _1514 + _1538;
    float _1542 = _1518 * _1518;
    float _1544 = fma(_1540, _1540, _1542);
    int _1546 = _1345 + 72;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    uint _1550 = uint(int(uint(int(_1548)) >> uint(2)));
    int _1552 = int(_1548) & 3;
    float _1554 = (*spvDescriptorSet0.vp_c15)._m0[int(_1550)][_1552];
    int _1556 = int(_1548) + 1;
    uint _1558 = uint(int(uint(_1556) >> uint(2)));
    int _1560 = _1556 & 3;
    float _1562 = (*spvDescriptorSet0.vp_c15)._m0[int(_1558)][_1560];
    float _1564 = sqrt(_1544);
    int _1566 = _1345 + 80;
    uint _1568 = uint(int(uint(_1566) >> uint(2)));
    uint _1570 = uint(int(uint(int(_1568)) >> uint(2)));
    int _1572 = int(_1568) & 3;
    float _1574 = (*spvDescriptorSet0.vp_c15)._m0[int(_1570)][_1572];
    int _1576 = int(_1568) + 1;
    uint _1578 = uint(int(uint(_1576) >> uint(2)));
    int _1580 = _1576 & 3;
    float _1582 = (*spvDescriptorSet0.vp_c15)._m0[int(_1578)][_1580];
    float _1584 = _975 * _1374;
    float _1586 = fma(_863, _1366, _1584);
    float _1588 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1590 = _1345 + 88;
    uint _1592 = uint(int(uint(_1590) >> uint(2)));
    uint _1594 = uint(int(uint(int(_1592)) >> uint(2)));
    int _1596 = int(_1592) & 3;
    float _1598 = (*spvDescriptorSet0.vp_c15)._m0[int(_1594)][_1596];
    int _1600 = int(_1592) + 1;
    uint _1602 = uint(int(uint(_1600) >> uint(2)));
    int _1604 = _1600 & 3;
    float _1606 = (*spvDescriptorSet0.vp_c15)._m0[int(_1602)][_1604];
    float _1608 = fma(_871, _1406, _1586);
    float _1610 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1588);
    bool _1612 = _1564 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1614 = _1384;
    float _1616 = _1514;
    if (!_1380)
    {
        float _1618 = floor(_1225);
        _1614 = _1618;
    }
    float _1620 = _1614;
    float _1622 = _1608 + _1414;
    float _1624 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1610);
    float _1626 = _1512;
    if (!_1380)
    {
        int _1628 = as_type<int>(_1512) + 400;
        uint _1630 = uint(int(uint(_1628) >> uint(2)));
        uint _1632 = uint(int(uint(int(_1630)) >> uint(2)));
        int _1634 = int(_1630) & 3;
        float _1636 = (*spvDescriptorSet0.vp_c15)._m0[int(_1632)][_1634];
        _1626 = _1636;
    }
    float _1638 = _1626;
    float _1640 = _975 * _1448;
    float _1642 = 1.0 / _1622;
    float _1644 = fma(_863, _1440, _1640);
    float _1646 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1648 = _975 * _1494;
    float _1650 = _609 + _1646;
    float _1652 = fma(_863, _1486, _1648);
    float _1654 = _1448;
    float _1656 = _1486;
    if (!_1612)
    {
        _1654 = _1650;
    }
    float _1658 = _1654;
    float _1660 = fma(_871, _1528, _1644);
    float _1662 = fma(_871, _1554, _1652);
    bool _1664 = !_1612;
    float _1666 = _1658;
    float _1668 = _1620;
    if (!_1664)
    {
        float _1670 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1674 = _1564 + _1672;
        float _1676 = rsqrt(_1544);
        float _1678 = _1674 * _1670;
        float _1680 = _1650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1682 = _1678 * 0.15915493667125701904296875;
        float _1684 = _1682 * 6.283185482025146484375;
        float _1686 = cos(_1684);
        float _1688 = _1682 * 6.283185482025146484375;
        float _1690 = sin(_1688);
        float _1692 = _1686 + (-1.0);
        float _1694 = fma(_1690, _1680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1696 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = _1676 * _1694;
        float _1700 = fma(_1650, _1686, _1696);
        float _1702 = fma(_1540, _1698, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1704 = fma(_1518, _1698, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1616 = _1702;
        _1666 = _1700;
        _1506 = _1704;
        _1656 = _1682;
    }
    float _1706 = _1616;
    float _1708 = _1666;
    float _1710 = _1506;
    float _1712 = _1656;
    float _1714 = -_851;
    float _1716 = fma(_1714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1706);
    float _1718 = -_849;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1708);
    float _1722 = -_859;
    float _1724 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1710);
    float _1726 = _1660 + _1536;
    float _1728 = _1662 + _1562;
    float _1730 = _1720;
    float _1732 = _1716;
    float _1734 = _1724;
    if (!_1396)
    {
        float _1736 = _867 * _867;
        float _1738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1740 = -_583;
        float _1742 = _1740 + _1710;
        float _1744 = -_609;
        float _1746 = _1744 + _1708;
        float _1748 = fma(_875, _875, _1736);
        float _1750 = fma(_881, _881, _1748);
        float _1752 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1754 = sqrt(_1750);
        float _1756 = 1.0 / _1085;
        float _1758 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1760 = precise::min(_1754, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1762 = _1760 * _1738;
        float _1764 = _1762 * _1756;
        float _1766 = -_679;
        float _1768 = _1766 + _1706;
        float _1770 = _1758 * _1764;
        float _1772 = _1742 * _1764;
        float _1774 = fma(_1746, _1770, _857);
        float _1776 = fma(_1768, _1770, _863);
        float _1778 = fma(_1758, _1772, _871);
        _1730 = _1774;
        _1732 = _1776;
        _1734 = _1778;
    }
    float _1780 = _1730;
    float _1782 = _1732;
    float _1784 = _1734;
    float _1786 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1788 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1790 = _1726 * _1642;
    float _1792 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1794 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1786);
    float _1796 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1788);
    float _1798 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1800 = _1790 >= 0.0;
    float _1802 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1794);
    float _1804 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1792);
    float _1806 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1796);
    float _1808 = _1728 * _1642;
    float _1810 = _1802 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1812 = _1790 <= 1.0;
    bool _1814 = _1812 && _1800;
    float _1816 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1804);
    float _1818 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1820 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1798);
    float _1822 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1824 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1826 = _1808 >= 0.0;
    bool _1828 = _1826 && _1814;
    float _1830 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1820);
    float _1832 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1822);
    float _1834 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1836 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1838 = _1808 <= 1.0;
    bool _1840 = _1838 && _1828;
    float _1842 = _1830 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1844 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1832);
    float _1846 = -_1836;
    float _1848 = fma(_1846, _1834, 1.0);
    float _1850 = _975 * _1582;
    float _1852 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1854 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1844);
    float _1856 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1858 = fma(_863, _1574, _1850);
    float _1860 = log2(_1848);
    float _1862 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1852);
    float _1864 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1856);
    float _1866 = fma(_871, _1598, _1858);
    float _1868 = _1854;
    if (_1840)
    {
        float _1870 = float(_1335);
        _1424 = _1870;
    }
    float _1872 = _1424;
    float _1874 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1862);
    float _1876 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1864);
    float _1878 = _1866 + _1606;
    float _1880 = 1.0 / _1854;
    float _1882 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1874);
    float _1884 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1876);
    float _1886 = _1876;
    float _1888 = _1882;
    if (!_1380)
    {
        float _1890 = -_1620;
        float _1892 = _1225 + _1890;
        _1668 = _1892;
    }
    float _1894 = _1668;
    if (!_1380)
    {
        float _1896 = -_1460;
        float _1898 = _1229 + _1896;
        _1886 = _1898;
    }
    float _1900 = _1886;
    float _1902 = _1712;
    if (!_1380)
    {
        float _1904 = rint(_1638);
        float _1906 = precise::max(_1904, 0.0);
        uint _1908 = uint(_1906);
        uint _1910 = clamp(_1908, 0u, 65535u);
        _1902 = as_type<float>(_1910);
    }
    float _1912 = _1902;
    float _1914 = _1860 * 0.693147182464599609375;
    float _1916 = _1878 * _1642;
    float _1918 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1920 = _1858;
    float _1922 = _1918;
    if (_1840)
    {
        float _1924 = rint(_1872);
        float _1926 = precise::max(_1924, 0.0);
        uint _1928 = uint(_1926);
        uint _1930 = clamp(_1928, 0u, 65535u);
        _1920 = as_type<float>(_1930);
    }
    float _1932 = _1920;
    float _1934 = _1882 * _1880;
    float _1936 = _1884 * _1880;
    float _1938 = fma(_1934, 0.5, 0.5);
    float _1940 = fma(_1936, -0.5, 0.5);
    float _1942 = _1460;
    float _1944 = _1940;
    float _1946 = _1938;
    if (!_1380)
    {
        float3 _6008 = float3(_1900, _1894, float(as_type<int>(_1912)));
        float3 _6012 = select(_6008, float3(0.0), isnan(_6008));
        float _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6012.xy, uint(rint(_6012.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6012.xy, uint(rint(_6012.z)), level(0.0)).x;
        _1942 = _1948;
    }
    float _1950 = _1942;
    float _1952 = _1808;
    if (_1840)
    {
        float3 _6027 = float3(_1790, _1808, float(as_type<int>(_1932)));
        float3 _6029 = select(_6027, float3(0.0), isnan(_6027));
        float _1954 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6029.xy, uint(rint(_6029.z)), _1916, level(0.0));
        _1952 = _1954;
    }
    float _1956 = _1952;
    float3 _6039 = float3(_1938, _1940, _1918);
    float _1958 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6039, float3(0.0), isnan(_6039)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6039, float3(0.0), isnan(_6039)), level(0.0)).x;
    float3 _6048 = float3(_1938, _1940, _1918);
    float4 _1961 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6048, float3(0.0), isnan(_6048)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6048, float3(0.0), isnan(_6048)), level(0.0)).xyzw;
    float _1963 = _1961.x;
    float _1965 = _1961.y;
    float _1967 = _1961.z;
    float _1969 = _1961.w;
    bool _1971 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1973 = isnan(0.5);
    bool _1975 = _1971 || _1973;
    bool _1977 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1979 = _1975 || _1977;
    if (_1380)
    {
        _889 = 1.0;
    }
    float _1981 = _889;
    float _1983 = _1981;
    if (_1979)
    {
        _1327 = 1.0;
    }
    float _1985 = _1327;
    float _1987 = _1985;
    if (_1979)
    {
        _853 = 1.0;
    }
    float _1989 = _853;
    float _1991 = _1989;
    float _1993 = _1963;
    if (!_1979)
    {
        float _1995 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1997 = _1995 * 0.15915493667125701904296875;
        float _1999 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2001 = _1997 * 6.283185482025146484375;
        float _2003 = cos(_2001);
        float _2005 = _1999 * 0.15915493667125701904296875;
        float _2007 = _1997 * 6.283185482025146484375;
        float _2009 = sin(_2007);
        float _2011 = 1.0 / _2003;
        float _2013 = _2005 * 6.283185482025146484375;
        float _2015 = cos(_2013);
        float _2017 = _2009 * _2011;
        float _2019 = _2005 * 6.283185482025146484375;
        float _2021 = sin(_2019);
        float _2023 = _2015 * _2017;
        float _2025 = 1.0 / _2023;
        float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2029 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2027;
        float _2031 = 1.0 / _2029;
        float _2033 = _2021 * _2025;
        float _2035 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2037 = fma(_1291, _2033, _2035);
        float _2039 = _2037 * _2031;
        float _2041 = precise::clamp(_2039, 0.0, 1.0);
        _1944 = _2037;
        _1946 = _2005;
        _1991 = _2041;
    }
    float _2043 = _1944;
    float _2045 = _1946;
    float _2047 = _1991;
    float _2049 = _2045;
    float _2051 = _2043;
    if (!_1979)
    {
        float _2053 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2055 = _2053 * 0.15915493667125701904296875;
        float _2057 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2059 = _2055 * 6.283185482025146484375;
        float _2061 = cos(_2059);
        float _2063 = _2057 * 0.15915493667125701904296875;
        float _2065 = _2055 * 6.283185482025146484375;
        float _2067 = sin(_2065);
        float _2069 = 1.0 / _2061;
        float _2071 = _2063 * 6.283185482025146484375;
        float _2073 = cos(_2071);
        float _2075 = _2067 * _2069;
        float _2077 = _2063 * 6.283185482025146484375;
        float _2079 = sin(_2077);
        float _2081 = _2073 * _2075;
        float _2083 = 1.0 / _2081;
        float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2087 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2085;
        float _2089 = 1.0 / _2087;
        float _2091 = _2079 * _2083;
        float _2093 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2095 = fma(_1291, _2091, _2093);
        float _2097 = _2095 * _2089;
        float _2099 = precise::clamp(_2097, 0.0, 1.0);
        float _2101 = -_2099;
        float _2103 = _2101 + 1.0;
        _2049 = _2081;
        _2051 = _2069;
        _1987 = _2103;
    }
    float _2105 = _2049;
    float _2107 = _2051;
    float _2109 = _1987;
    if (!_1380)
    {
        int _2111 = _1430 << 4;
        int _2113 = _2111 + 2048;
        uint _2115 = uint(int(uint(_2113) >> uint(2)));
        uint _2117 = uint(int(uint(int(_2115)) >> uint(2)));
        int _2119 = int(_2115) & 3;
        float _2121 = (*spvDescriptorSet0.vp_c15)._m0[int(_2117)][_2119];
        int _2123 = int(_2115) + 1;
        uint _2125 = uint(int(uint(_2123) >> uint(2)));
        int _2127 = _2123 & 3;
        float _2129 = (*spvDescriptorSet0.vp_c15)._m0[int(_2125)][_2127];
        int _2131 = _2113 + 8;
        uint _2133 = uint(int(uint(_2131) >> uint(2)));
        uint _2135 = uint(int(uint(int(_2133)) >> uint(2)));
        int _2137 = int(_2133) & 3;
        float _2139 = (*spvDescriptorSet0.vp_c15)._m0[int(_2135)][_2137];
        int _2141 = int(_2133) + 1;
        uint _2143 = uint(int(uint(_2141) >> uint(2)));
        int _2145 = _2141 & 3;
        float _2147 = (*spvDescriptorSet0.vp_c15)._m0[int(_2143)][_2145];
        float _2149 = _975 * _2129;
        float _2151 = fma(_863, _2121, _2149);
        float _2153 = fma(_871, _2139, _2151);
        float _2155 = _2153 + _2147;
        float _2157 = precise::clamp(_2155, 0.0, 1.0);
        float _2159 = -_2157;
        float _2161 = _2159 + _1950;
        float _2163 = fma(_2161, 500.0, 1.5);
        float _2165 = exp2(_2163);
        float _2167 = 0.0 + _2165;
        float _2169 = precise::clamp(_2167, 0.0, 1.0);
        _1456 = as_type<float>(_2113);
        _1983 = _2169;
    }
    float _2171 = _1456;
    float _2173 = _1983;
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2177 = _1780 + _2175;
    float _2179 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2181 = _1782 + _2179;
    float _2183 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2185 = _1784 + _2183;
    float _2187 = _2177 * _2177;
    float _2189 = fma(_2181, _2181, _2187);
    float _2191 = fma(_2185, _2185, _2189);
    float _2193 = rsqrt(_2191);
    float _2195 = sqrt(_2191);
    float _2197 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2199 = _2181 * _2197;
    float _2201 = _2185 * _2197;
    float _2203 = _2199 * _2199;
    float _2205 = _2201 * _2201;
    float _2207 = _2203 + _2205;
    float _2209 = sqrt(_2207);
    bool _2211 = _2209 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2215 = _2209 + _2213;
    float _2217 = _2105;
    float _2219 = _2207;
    float _2221 = _2215;
    float _2223 = _2199;
    float _2225 = _2201;
    float _2227 = _2203;
    float _2229 = _2205;
    if (_2211)
    {
        float _2231 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2217 = _2231;
    }
    float _2233 = _2217;
    if (_2211)
    {
        float _2235 = rsqrt(_2207);
        _2219 = _2235;
    }
    float _2237 = _2219;
    if (_2211)
    {
        float _2239 = _2215 * _2233;
        _2221 = _2239;
    }
    float _2241 = _2221;
    if (_2211)
    {
        float _2243 = _2241 * 0.15915493667125701904296875;
        _1922 = _2243;
    }
    float _2245 = _1922;
    float _2247 = _2107;
    if (_2211)
    {
        float _2249 = _2245 * 6.283185482025146484375;
        float _2251 = sin(_2249);
        _2247 = _2251;
    }
    float _2253 = _2247;
    float _2255 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2257 = precise::max(0.0, _2255);
    float _2259 = _2171;
    float _2261 = _2257;
    float _2263 = _2255;
    if (_2211)
    {
        float _2265 = _2245 * 6.283185482025146484375;
        float _2267 = cos(_2265);
        _2259 = _2267;
    }
    float _2269 = _2259;
    float _2271 = -_2197;
    float _2273 = -_2257;
    float _2275 = fma(_2177, _2271, _2273);
    float _2277 = _2275;
    if (_2211)
    {
        float _2279 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2261 = _2279;
    }
    float _2281 = _2261;
    float _2283 = _2253;
    float _2285 = _2281;
    if (_2211)
    {
        float _2287 = fma(_2253, _2281, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2283 = _2287;
    }
    float _2289 = _2283;
    float _2291 = _2289;
    if (_2211)
    {
        float _2293 = _2269 + (-1.0);
        _2263 = _2293;
    }
    float _2295 = _2263;
    if (_2211)
    {
        float _2297 = _2237 * _2289;
        _2291 = _2297;
    }
    float _2299 = _2291;
    if (_2211)
    {
        float _2301 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2285 = _2301;
    }
    float _2303 = _2285;
    if (_2211)
    {
        float _2305 = _2199 * _2299;
        _2223 = _2305;
    }
    float _2307 = _2223;
    if (_2211)
    {
        float _2309 = _2201 * _2299;
        _2225 = _2309;
    }
    float _2311 = _2225;
    if (_2211)
    {
        float _2313 = fma(_2275, _2269, _2303);
        _2277 = _2313;
    }
    float _2315 = _2277;
    if (_2211)
    {
        float _2317 = _2307 * _2307;
        _2227 = _2317;
    }
    float _2319 = _2227;
    if (_2211)
    {
        float _2321 = _2311 * _2311;
        _2229 = _2321;
    }
    float _2323 = _2229;
    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2327 = fma(_2195, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2325);
    float _2329 = precise::clamp(_2327, 0.0, 1.0);
    float _2331 = fma(_2315, _2315, _2319);
    float _2333 = -_2329;
    float _2335 = _2333 + 1.0;
    float _2337 = _2331 + _2323;
    float _2339 = rsqrt(_2337);
    float _2341 = _2339 * _2315;
    float _2343 = _2339 * _2307;
    float _2345 = abs(_2335);
    float _2347 = log2(_2345);
    float _2349 = _2339 * _2311;
    float _2351 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2353 = -_2351;
    float _2355 = fma(_2341, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2353);
    float _2357 = -_2349;
    float _2359 = fma(_2357, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2355);
    float _2361 = fma(_2359, -0.5, 0.5);
    float _2363 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2365 = fma(_2359, 0.5, 0.5);
    float _2367 = _2341 + 1.0;
    float _2369 = sqrt(_2361);
    float _2371 = fma(_2365, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2373 = fma(_2365, _2371, -0.212114393711090087890625);
    float _2375 = exp2(_2363);
    float _2377 = fma(_2365, _2373, 1.570728778839111328125);
    float _2379 = _2369 * 0.636619746685028076171875;
    float _2381 = -_2377;
    float _2383 = fma(_2379, _2381, 1.0);
    float _2385 = -_2341;
    float _2387 = fma(_2375, _2367, _2385);
    float _2389 = fma(_2387, 0.5, 0.5);
    float2 _6667 = float2(_2383, _2389);
    float3 _2393 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6667, float2(0.0), isnan(_6667)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6667, float2(0.0), isnan(_6667)), level(0.0)).xyz;
    float _2395 = _2393.x;
    float _2397 = _2393.y;
    float _2399 = _2393.z;
    float _2401 = abs(_1291);
    float _2403 = log2(_2401);
    float _2405 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2407 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2409 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2411 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2413 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2415 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2417 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2405);
    float _2419 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2407);
    float _2421 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2409);
    float _2423 = -_1239;
    float _2425 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2411);
    float _2427 = -_1239;
    float _2429 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2413);
    float _2431 = -_1239;
    float _2433 = fma(_2431, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2415);
    float _2435 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2437 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2439 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2441 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2443 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2445 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2417);
    float _2447 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2419);
    float _2449 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2421);
    float _2451 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2435);
    float _2453 = exp2(_2441);
    float _2455 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2457 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2437);
    float _2459 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2439);
    float _2461 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2425);
    float _2463 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2429);
    float _2465 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2467 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2433);
    float _2469 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2455);
    float _2471 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2451);
    float _2473 = exp2(_2443);
    float _2475 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2457);
    float _2477 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2459);
    float _2479 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2481 = _2465 * _2461;
    float _2483 = _2465 * _2463;
    float _2485 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2469);
    float _2487 = _2465 * _2467;
    float _2489 = fma(_2479, _2445, _2481);
    float _2491 = fma(_2479, _2447, _2483);
    float _2493 = fma(_2479, _2449, _2487);
    float _2495 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2485);
    float _2497 = fma(_2453, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2499 = precise::clamp(_2497, 0.0, 1.0);
    float _2501 = _1854 * 0.5;
    float _2503 = _1882 + _1854;
    float _2505 = _2495 + _1854;
    float _2507 = fma(_2499, -2.0, 3.0);
    out.gl_Position.x = _1882;
    out.gl_Position.y = _1884;
    out.gl_Position.z = _2495;
    out.gl_Position.w = _1854;
    float _2509 = _2499 * _2499;
    float _2511 = fma(_1884, -0.5, _2501);
    bool _2513 = _1291 <= 8000.0;
    bool _2515 = isnan(_1291);
    bool _2517 = _2513 || _2515;
    bool _2519 = isnan(8000.0);
    bool _2521 = _2517 || _2519;
    float _2523 = float(_2521);
    float _2525 = _2505 * 0.5;
    float _2527 = _2509 * _2507;
    float _2529 = _2503 * 0.5;
    float _2531 = _2471 + _2489;
    float _2533 = _2475 + _2491;
    float _2535 = _2477 + _2493;
    float _2537 = -_915;
    float _2539 = _2537 + 1.0;
    out.m_84.x = _2529;
    out.m_84.y = _2511;
    out.m_84.z = _2525;
    out.m_84.w = _1854;
    bool _2541 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2543 = isnan(_2195);
    bool _2545 = _2541 || _2543;
    bool _2547 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2549 = _2545 || _2547;
    float _2551 = -_2473;
    float _2553 = _2551 + 1.0;
    if (!_1840)
    {
        _1888 = 1.0;
    }
    float _2555 = _1888;
    float _2557 = -_2527;
    float _2559 = _2557 + 1.0;
    float _2561 = _2555;
    if (_1840)
    {
        bool _2563 = _1956 >= _1916;
        bool _2565 = isnan(_1956);
        bool _2567 = _2563 || _2565;
        bool _2569 = isnan(_1916);
        bool _2571 = _2567 || _2569;
        float _2573 = float(_2571);
        _2561 = _2573;
    }
    float _2575 = _2561;
    float _2577 = _2553 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _2531;
    out.m_86.y = _2533;
    out.m_86.z = _2535;
    float _2579 = fma(_2559, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2527);
    float _2581 = _2577 * _1958;
    float _2583 = -_2577;
    float _2585 = _2583 + 1.0;
    float _2587 = _2523 * _2579;
    out.m_88.x = _1782;
    out.m_88.y = _1780;
    out.m_88.z = _1784;
    float _2589 = _1969 * _2581;
    float _2591 = _1969 * _2585;
    float _2593 = _2587 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2595 = _2575 * _2173;
    float _2597 = _2585;
    if (!_2549)
    {
        _1868 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2599 = _1868;
    float _2601 = _2539 * _2593;
    float _2603 = precise::clamp(_2601, 0.0, 1.0);
    float _2605 = _2599;
    float _2607 = _2599;
    if (!_2549)
    {
        _2597 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2609 = _2597;
    float _2611 = -_2603;
    float _2613 = fma(_2611, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2615 = -_2595;
    float _2617 = fma(_2615, _2613, 1.0);
    float _2619 = precise::clamp(_2617, 0.0, 1.0);
    float _2621 = _2613;
    float _2623 = _2609;
    float _2625 = _2609;
    if (!_2549)
    {
        _2621 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2627 = _2621;
    float _2629 = _2619 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_90.x = _2629;
    float _2631 = _2629;
    float _2633 = _2627;
    float _2635 = _2627;
    if (!_2549)
    {
        _2631 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2637 = _2631;
    float _2639 = _2399 * _2581;
    float _2641 = fma(_2395, _2589, _1963);
    float _2643 = fma(_2397, _2589, _1965);
    float _2645 = _2047 * _2109;
    float _2647 = fma(_1969, _2639, _1967);
    float _2649 = _2645;
    float _2651 = _2637;
    float _2653 = _2637;
    if (!_2549)
    {
        _1993 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2655 = _1993;
    float _2657 = _2645 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2659 = _2655;
    float _2661 = _2655;
    if (!_2549)
    {
        _2649 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2663 = _2649;
    out.m_92.x = _2641;
    out.m_92.y = _2643;
    out.m_92.z = _2647;
    out.m_92.w = _2591;
    bool _2665 = !_2549;
    float _2667 = _2663;
    float _2669 = _2663;
    if (!_2665)
    {
        bool _2671 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2673 = isnan(_2195);
        bool _2675 = _2671 || _2673;
        bool _2677 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2679 = _2675 || _2677;
        if (!_2679)
        {
            float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2683 = _2195 + _2681;
            float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2687 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2685;
            float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2693 = 1.0 / _2687;
            float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2699 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2701 = _2699 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2703 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2705 = _2703 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2707 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2709 = _2707 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2711 = _2683 * _2693;
            float _2713 = precise::clamp(_2711, 0.0, 1.0);
            float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2717 = _2715 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2719 = fma(_2713, _2691, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2721 = fma(_2713, _2717, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2723 = fma(_2713, _2697, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2725 = fma(_2713, _2701, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2727 = fma(_2713, _2705, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2729 = fma(_2713, _2709, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2607 = _2723;
            _2653 = _2727;
            _2661 = _2719;
            _2635 = _2725;
            _2625 = _2721;
            _2669 = _2729;
            _2731 = true;
        }
        else
        {
            bool _2733 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2735 = isnan(_2195);
            bool _2737 = _2733 || _2735;
            bool _2739 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2741 = _2737 || _2739;
            if (!_2741)
            {
                _2659 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2743 = _2659;
            _2661 = _2743;
            if (!_2741)
            {
                _2605 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2745 = _2605;
            _2607 = _2745;
            if (!_2741)
            {
                _2623 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2747 = _2623;
            _2625 = _2747;
            if (!_2741)
            {
                _2633 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2749 = _2633;
            _2635 = _2749;
            if (!_2741)
            {
                _2651 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2751 = _2651;
            _2653 = _2751;
            if (!_2741)
            {
                _2667 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2753 = _2667;
            bool _2755 = !_2741;
            _2669 = _2753;
            if (!_2755)
            {
                bool _2757 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2759 = isnan(_2195);
                bool _2761 = _2757 || _2759;
                bool _2763 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2765 = _2761 || _2763;
                if (!_2765)
                {
                    float _2767 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2769 = _2195 + _2767;
                    float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2773 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2771;
                    float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2777 = _2775 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2779 = 1.0 / _2773;
                    float _2781 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2783 = _2781 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2785 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2787 = _2785 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2791 = _2789 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2795 = _2793 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2797 = _2769 * _2779;
                    float _2799 = precise::clamp(_2797, 0.0, 1.0);
                    float _2801 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2803 = _2801 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2805 = fma(_2799, _2777, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2807 = fma(_2799, _2803, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2809 = fma(_2799, _2783, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2811 = fma(_2799, _2787, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2813 = fma(_2799, _2791, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2815 = fma(_2799, _2795, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2607 = _2809;
                    _2653 = _2813;
                    _2661 = _2805;
                    _2635 = _2811;
                    _2625 = _2807;
                    _2669 = _2815;
                    _2731 = true;
                }
                else
                {
                    _2607 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2653 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2661 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2635 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2625 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2669 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2731 = false;
    float _2817 = _2607;
    float _2819 = _2653;
    float _2821 = _2661;
    float _2823 = _2635;
    float _2825 = _2625;
    float _2827 = _2669;
    float _2829 = fma(_2533, -0.5, 0.5);
    float _2831 = precise::clamp(_2829, 0.0, 1.0);
    float _2833 = -_2817;
    float _2835 = _2833 + _2819;
    float _2837 = _2657 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2839 = -_2821;
    float _2841 = _2839 + _2823;
    float _2843 = fma(_2831, _2835, _2817);
    out.m_94.x = 0.0;
    float _2845 = -_2825;
    float _2847 = _2845 + _2827;
    float _2849 = fma(_2831, _2841, _2821);
    float _2851 = _2843 * 0.586610972881317138671875;
    out.m_59.x = _2837;
    bool _2853 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2855 = fma(_2831, _2847, _2825);
    float _2857 = fma(_2849, 0.298911988735198974609375, _2851);
    bool _2859 = _2047 > 0.0;
    bool _2861 = isnan(_2047);
    bool _2863 = _2859 || _2861;
    bool _2865 = isnan(0.0);
    bool _2867 = _2863 || _2865;
    float _2869 = fma(_2855, 0.114477999508380889892578125, _2857);
    bool _2871 = _2109 <= 0.0;
    bool _2873 = !_2867;
    bool _2875 = _2871 || _2873;
    float _2877 = -_2869;
    float _2879 = _2849 + _2877;
    float _2881 = -_2869;
    float _2883 = _2843 + _2881;
    float _2885 = -_2869;
    float _2887 = _2855 + _2885;
    float _2889 = fma(_2879, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2869);
    float _2891 = fma(_2883, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2869);
    float _2893 = fma(_2887, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2869);
    bool _2895 = !_2853;
    if (!_2895)
    {
        float _2897 = -_1780;
        float _2899 = _2897 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2901 = -_1782;
        float _2903 = _2901 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2905 = -_1784;
        float _2907 = _2905 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2909 = _2899 * _2899;
        float _2911 = fma(_2903, _2903, _2909);
        float _2913 = fma(_2907, _2907, _2911);
        float _2915 = sqrt(_2913);
        float _2917 = rsqrt(_2913);
        float _2919 = -_2915;
        float _2921 = _2919 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2923 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2925 = precise::clamp(_2923, 0.0, 1.0);
        float _2927 = _2903 * _2917;
        float _2929 = _2899 * _2917;
        float _2931 = abs(_2925);
        float _2933 = log2(_2931);
        float _2935 = _2907 * _2917;
        float _2937 = _2927 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2939 = _2533 * _2929;
        float _2941 = -_2929;
        float _2943 = -_2937;
        float _2945 = fma(_2941, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2943);
        float _2947 = fma(_2531, _2927, _2939);
        float _2949 = -_2935;
        float _2951 = fma(_2949, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2945);
        float _2953 = fma(_2535, _2935, _2947);
        float _2955 = precise::clamp(_2953, 0.0, 1.0);
        float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2959 = _2951 + _2957;
        float _2961 = _2933 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2963 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2965 = precise::clamp(_2963, 0.0, 1.0);
        float _2967 = exp2(_2961);
        float _2969 = _2967 * _2965;
        float _2971 = _2955 * _2969;
        float _2973 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2975 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2977 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _2973;
        out.m_94.y = _2975;
        out.m_94.z = _2977;
    }
    out.m_96.x = _2889;
    out.m_96.y = _2891;
    out.m_96.z = _2893;
    if (!_2875)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2979 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2979;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

