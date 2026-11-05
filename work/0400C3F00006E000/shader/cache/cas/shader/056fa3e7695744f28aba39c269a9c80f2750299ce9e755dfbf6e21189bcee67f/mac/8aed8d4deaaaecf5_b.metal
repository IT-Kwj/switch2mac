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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_16 [[id(9)]];
    sampler vp_t_tcb_16Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    texture2d_array<float> vp_t_tcb_14 [[id(17)]];
    sampler vp_t_tcb_14Smplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_84 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_98 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_86 [[user(locn5)]];
    float4 m_96 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_92 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(1)]];
    float4 m_78 [[attribute(2)]];
    float4 m_80 [[attribute(3)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_72 [[attribute(7)]];
    float4 m_70 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2263 = false;
    bool _1169 = false;
    bool _533 = false;
    bool _435 = false;
    bool _331 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_58.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (!_121)
    {
        out.m_61.x = 0.0;
    }
    int _127 = 0;
    if (!_121)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2495 = as_type<float>(_131);
        out.gl_Position.z = _2495;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_63.w;
    float _137 = float(_117);
    float _139 = 1.0 / _137;
    float _141 = -_135;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_135);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = _143 * _139;
    bool _157 = _143 >= _137;
    bool _159 = !_153;
    bool _161 = _157 || _159;
    out.m_65.x = _155;
    float _163 = _135;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_61.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2566 = as_type<float>(_169);
        out.gl_Position.z = _2566;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = in.m_70.w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_63.x;
    float _189 = in.m_63.y;
    float _191 = in.m_63.z;
    float _193 = in.m_58.x;
    float _195 = in.m_58.y;
    float _197 = in.m_58.z;
    float _199 = 0.0;
    float _201 = _173;
    if (!_185)
    {
        float _203 = _173 * _173;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    float _209 = _207;
    if (!_185)
    {
        float _211 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _211;
    }
    float _213 = _209;
    int _215 = as_type<int>(_171) & 1;
    bool _217 = _215 != 0;
    int _219 = as_type<int>(_171) & 2;
    bool _221 = _219 != 0;
    bool _223 = !_217;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_221;
    float _229 = _227 ? (-0.5) : 0.5;
    bool _231 = !_185;
    float _233 = _213;
    if (!_231)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = _173 * _237;
        float _247 = 1.0 / _241;
        float _249 = _243 * 0.693147182464599609375;
        float _251 = exp2(_245);
        float _253 = 1.0 / _249;
        float _255 = _251 + (-1.0);
        float _257 = -_255;
        float _259 = fma(_257, _253, _173);
        float _261 = _259 * _247;
        float _263 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _263;
    }
    float _265 = _233;
    bool _267 = !_185;
    if (!_267)
    {
        float _269 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = log2(_269);
        float _273 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _275 = _273 + 1.0;
        float _277 = 1.0 / _275;
        float _279 = _173 * _271;
        float _281 = exp2(_279);
        float _283 = -_281;
        float _285 = _283 + 1.0;
        float _287 = _285 * _277;
        _201 = _287;
    }
    float _289 = _201;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _293 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _295 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _297 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _299 = fma(_289, _187, _293);
    float _301 = fma(_289, _189, _295);
    float _303 = fma(_289, _191, _297);
    float _305 = fma(_299, _175, _193);
    float _307 = fma(_301, _175, _195);
    float _309 = fma(_303, _175, _197);
    bool _311 = !_291;
    float _329;
    if (!_311)
    {
        float _313 = in.m_72.x;
        float _315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _317 = _313 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _321 = _319 * _315;
        float _323 = floor(_321);
        float _325 = -_323;
        float _327 = _321 + _325;
        _329 = _327;
        _331 = true;
    }
    else
    {
        _329 = _155;
    }
    _331 = false;
    float _333 = _329;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = _333 + _335;
    float _339 = in.m_70.x;
    float _341 = in.m_70.y;
    bool _343 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _345 = isnan(_333);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _355;
    bool _359 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _361 = isnan(_333);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = -_353;
    float _373 = _371 + 1.0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = 1.0 / _357;
    bool _381 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _383 = _369 * _373;
    float _385 = -_369;
    float _387 = _385 + 1.0;
    float _389 = _337 * _379;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _391;
    float _395 = fma(_377, _389, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _397 = fma(_393, _389, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = _395 * _383;
    float _401 = _397 * _383;
    float _403 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[143].x, _399);
    float _405 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[143].y, _401);
    float _407 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[144].x, _403);
    float _409 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[144].y, _405);
    float _411 = _407 * _339;
    float _413 = _409 * _341;
    bool _415 = !_381;
    float _433;
    if (!_415)
    {
        float _417 = in.m_72.x;
        float _419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _421 = _417 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _425 = _423 * _419;
        float _427 = floor(_425);
        float _429 = -_427;
        float _431 = _425 + _429;
        _433 = _431;
        _435 = true;
    }
    else
    {
        _433 = _155;
    }
    _435 = false;
    float _437 = _433;
    bool _439 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = isnan(_437);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _455 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _457 = isnan(_437);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _473 = _437 + _471;
    float _475 = -_449;
    float _477 = _475 + 1.0;
    float _479 = 1.0 / _453;
    bool _481 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _483 = _465 * _477;
    float _485 = -_465;
    float _487 = _485 + 1.0;
    float _489 = _469 * _479;
    float _491 = fma(_489, _473, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _493 = _491 * _483;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _499 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[115].x, _493);
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _503 = _495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _505 = _497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _507 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[116].x, _499);
    float _509 = _501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _511 = _507 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_74.x = _503;
    out.m_74.y = _505;
    out.m_74.z = _509;
    out.m_74.w = _511;
    bool _513 = !_481;
    float _531;
    if (!_513)
    {
        float _515 = in.m_72.x;
        float _517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _519 = _515 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _523 = _521 * _517;
        float _525 = floor(_523);
        float _527 = -_525;
        float _529 = _523 + _527;
        _531 = _529;
        _533 = true;
    }
    else
    {
        _531 = _155;
    }
    _533 = false;
    float _535 = _531;
    float _537 = in.m_76.x;
    float _539 = in.m_76.y;
    float _541 = in.m_76.z;
    float _543 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _545 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _225);
    float _547 = in.m_78.x;
    float _549 = in.m_78.y;
    float _551 = in.m_78.z;
    float _553 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _555 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _229);
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _559 = _557 != 0;
    float _561 = in.m_80.x;
    float _563 = in.m_80.y;
    float _565 = in.m_80.z;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _569 = _567 != 0;
    float _571 = _553 * _555;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _575 = _573 != 0;
    float _577 = in.m_72.x;
    float _579 = in.m_72.y;
    float _581 = in.m_72.z;
    float _583 = in.m_72.w;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _587 = _585 != 0;
    float _589 = _543 * _545;
    float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _593 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _595 = isnan(_535);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _607 = _307 * _539;
    float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _611 = _307 * _549;
    float _613 = fma(_305, _537, _607);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _619 = fma(_305, _547, _611);
    float _621 = _307 * _563;
    float _623 = 1.0 / _617;
    bool _625 = _583 > 0.5;
    float _627 = fma(_305, _561, _621);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _633 = _577 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _637 = _635 != 0;
    float _639 = 1.0 / _631;
    float _641 = _579 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _645 = -_605;
    float _647 = fma(_633, 2.0, _645);
    float _649 = _229 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _651 = _577 > 0.5;
    float _653 = fma(_641, -2.0, _643);
    float _655 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _657 = _649 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _659 = _649 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _661 = _649 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _663 = fma(_309, _551, _619);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _669 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[24].x, _657);
    float _671 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[25].x, _659);
    float _673 = fma(_309, _541, _613);
    float _675 = fma(_309, _565, _627);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _677;
    float _681 = -_225;
    int _683 = _651 ? as_type<int>(_681) : as_type<int>(_225);
    float _685 = _667 * _623;
    bool _687 = _581 > 0.5;
    float _689 = _679 * _639;
    float _691 = _571 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _693 = -_229;
    int _695 = _625 ? as_type<int>(_693) : as_type<int>(_229);
    float _697 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[26].x, _661);
    bool _699 = _579 > 0.5;
    float _701 = _571 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _703 = _571 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _705 = -_225;
    float _707 = _687 ? _705 : _225;
    float _709 = _673 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _711 = !_559;
    float _713 = _711 ? _225 : as_type<float>(_683);
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _717 = -_229;
    int _719 = _699 ? as_type<int>(_717) : as_type<int>(_229);
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _723 = !_575;
    float _725 = _723 ? _225 : _707;
    float _727 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[78].z, _715);
    float _729 = _707;
    float _731 = _577;
    float _733 = _581;
    float _735 = _725;
    float _737 = _671;
    if (!_637)
    {
        _729 = _579;
    }
    float _739 = _729;
    float _741 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[24].x, _691);
    float _743 = 0.0;
    float _745 = _739;
    if (!_637)
    {
        _743 = _579;
    }
    float _747 = _743;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _751 = _535 + _749;
    float _753 = _747;
    if (_637)
    {
        _745 = _577;
    }
    float _755 = _745;
    float _757 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[78].w, _721);
    if (_637)
    {
        _753 = _577;
    }
    float _759 = _753;
    float _761 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[26].x, _703);
    bool _763 = !_569;
    float _765 = _763 ? _229 : as_type<float>(_719);
    float _767 = fma(_689, _751, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _769 = 0.0;
    if (!_637)
    {
        _769 = _581;
    }
    float _771 = _769;
    float _773 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _775 = _771;
    if (_637)
    {
        _731 = _581;
    }
    float _777 = _731;
    float _779 = _675 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _781 = !_587;
    float _783 = _781 ? _229 : as_type<float>(_695);
    float _785 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[25].x, _701);
    float _787 = _779;
    if (_637)
    {
        _775 = _579;
    }
    float _789 = _775;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _793 = _535 + _791;
    if (_637)
    {
        _733 = _579;
    }
    float _795 = _733;
    float _797 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[24].z, _741);
    float _799 = fma(_685, _793, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _801 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[26].z, _761);
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _805 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _807 = isnan(_535);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _819 = _801 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _821 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[84].z, _803);
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _825 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[83].z, _817);
    float _827 = _797 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _829 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[84].x, _821);
    float _831 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[83].w, _823);
    float _833 = _779 + _819;
    float _835 = _709 + _827;
    float _837 = _829 * (-0.15915493667125701904296875);
    float _839 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[25].z, _785);
    float _841 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _843 = _833 + _841;
    float _845 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _847 = _835 + _845;
    bool _849 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _851 = isnan(_535);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -_815;
    float _863 = _861 + 1.0;
    float _865 = _843 * _843;
    float _867 = _847 * _847;
    float _869 = _837 * 6.283185482025146484375;
    float _871 = sin(_869);
    float _873 = _859 * _863;
    float _875 = -_859;
    float _877 = _875 + 1.0;
    float _879 = _867 + _865;
    float _881 = _591 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _883 = -_143;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[76].x, _647);
    float _887 = _603 * _877;
    float _889 = _713 + 0.5;
    float _891 = sqrt(_879);
    float _893 = -_603;
    float _895 = _893 + 1.0;
    float _897 = _767 * _887;
    float _899 = fma(_881, _889, _885);
    float _901 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _653);
    float _903 = _609 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _907 = _765 + (-0.5);
    float _909 = _837 * 6.283185482025146484375;
    float _911 = cos(_909);
    float _913 = _755 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _915 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[131].x, _897);
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _919 = _789 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _921 = -_903;
    float _923 = -_901;
    float _925 = fma(_921, _907, _923);
    float _927 = -_905;
    float _929 = fma(_913, 2.0, _927);
    float _931 = fma(_799, _873, _915);
    bool _933 = _891 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _935 = fma(_919, -2.0, _917);
    float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _939 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _727);
    float _941 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _757);
    float _943 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _825);
    float _945 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _831);
    float _947 = -_143;
    float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[81].x, _929);
    float _951 = _663 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _953 = _839 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _957 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _935);
    float _959 = _783 * _911;
    float _961 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[133].x, _931);
    float _963 = _783 * _871;
    float _965 = _951 + _953;
    float _967 = fma(_725, _871, _959);
    float _969 = _959;
    float _971 = _865;
    float _973 = _867;
    float _975 = _839;
    float _977 = _911;
    if (!_933)
    {
        _969 = _865;
    }
    float _979 = _969;
    float _981 = -_963;
    float _983 = fma(_725, _911, _981);
    float _985 = _979;
    if (!_933)
    {
        _971 = _867;
    }
    float _987 = _971;
    float _989 = _987;
    if (!_933)
    {
        _735 = _835;
    }
    float _991 = _735;
    float _993 = _991;
    if (!_933)
    {
        _973 = _833;
    }
    float _995 = _973;
    float _997 = _995;
    if (!_933)
    {
        _975 = _965;
    }
    float _999 = _975;
    bool _1001 = !_933;
    float _1003 = _999;
    if (!_1001)
    {
        float _1005 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1009 = _891 + _1007;
        float _1011 = _965 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1013 = rsqrt(_879);
        float _1015 = _1009 * _1005;
        float _1017 = _1015 * 0.15915493667125701904296875;
        float _1019 = _1017 * 6.283185482025146484375;
        float _1021 = sin(_1019);
        float _1023 = _1017 * 6.283185482025146484375;
        float _1025 = cos(_1023);
        float _1027 = fma(_1021, _1011, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1029 = _1013 * _1027;
        float _1031 = _1025 + (-1.0);
        float _1033 = fma(_847, _1029, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1035 = fma(_843, _1029, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1037 = _1031 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1039 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1041 = _1033 + _1039;
        float _1043 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1045 = _1035 + _1043;
        float _1047 = fma(_965, _1025, _1037);
        float _1049 = _1041 * _1041;
        float _1051 = _1045 * _1045;
        _1003 = _1047;
        _989 = _1049;
        _985 = _1051;
        _993 = _1033;
        _997 = _1035;
    }
    float _1053 = _1003;
    float _1055 = _989;
    float _1057 = _985;
    float _1059 = _993;
    float _1061 = _997;
    float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1065 = _1053 + _1063;
    float _1067 = _937 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1069 = _955 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1071 = _967 + (-0.5);
    float _1073 = fma(_1065, _1065, _1055);
    float _1075 = _983 + 0.5;
    float _1077 = -_943;
    float _1079 = _1077 + 1.0;
    float _1081 = -_1067;
    float _1083 = -_957;
    float _1085 = fma(_1081, _1071, _1083);
    float _1087 = _1073 + _1057;
    float _1089 = fma(_1069, _1075, _949);
    float _1091 = -_945;
    float _1093 = _1091 + 1.0;
    float _1095 = -_939;
    float _1097 = _1095 + 1.0;
    float _1099 = -_941;
    float _1101 = _1099 + 1.0;
    float _1103 = -_1079;
    float _1105 = fma(_983, _1103, _1089);
    float _1107 = sqrt(_1087);
    float _1109 = fma(_967, _1093, _1085);
    float _1111 = -_1097;
    float _1113 = fma(_713, _1111, _899);
    float _1115 = fma(_765, _1101, _925);
    float _1117 = _669 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1119 = _961 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1121 = _671 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1123 = _697 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_82.x = _1113;
    out.m_82.y = _1115;
    out.m_82.z = _1105;
    out.m_82.w = _1109;
    out.m_84.w = _1119;
    out.m_86.x = _1117;
    out.m_86.y = _1121;
    out.m_86.z = _1123;
    bool _1125 = _1107 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1127 = isnan(_1107);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1133 = _1129 || _1131;
    if (!_1133)
    {
        _737 = 1.0;
    }
    float _1135 = _737;
    bool _1137 = !_1133;
    float _1139 = _1135;
    if (!_1137)
    {
        bool _1141 = _1107 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1143 = isnan(_1107);
        bool _1145 = _1141 || _1143;
        bool _1147 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1149 = _1145 || _1147;
        if (!_1149)
        {
            float _1151 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1153 = _1107 + _1151;
            float _1155 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1157 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1155;
            float _1159 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1161 = _1159 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1163 = 1.0 / _1157;
            float _1165 = _1153 * _1163;
            float _1167 = fma(_1165, _1161, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1139 = _1167;
            _1169 = true;
        }
        else
        {
            bool _1171 = _1107 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1173 = isnan(_1107);
            bool _1175 = _1171 || _1173;
            bool _1177 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1179 = _1175 || _1177;
            if (!_1179)
            {
                float _1181 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1183 = _1107 + _1181;
                float _1185 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1187 = _1185 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1189 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1191 = _1189 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1193 = 1.0 / _1187;
                float _1195 = _1183 * _1193;
                float _1197 = fma(_1195, _1191, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1139 = _1197;
                _1169 = true;
            }
            else
            {
                _1139 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1169 = false;
    float _1199 = _1139;
    float _1201 = _951 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1203 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1205 = _1053 + _1203;
    float _1207 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1209 = _1059 + _1207;
    float _1211 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1213 = _1061 + _1211;
    float _1215 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1201);
    float _1217 = fma(_1205, _1199, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1219 = fma(_1209, _1199, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1221 = fma(_1213, _1199, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1223 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1215);
    float _1225 = _951 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1229 = _1217 + _1227;
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1233 = _1219 + _1231;
    float _1235 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1237 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1225);
    float _1239 = _1229 * _1229;
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1243 = _1221 + _1241;
    float _1245 = 1.0 / _1235;
    float _1247 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1237);
    float _1249 = fma(_1233, _1233, _1239);
    float _1251 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1253 = fma(_1243, _1243, _1249);
    float _1255 = _1251 + _1235;
    float _1257 = rsqrt(_1253);
    float _1259 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1261 = _1255 * _1245;
    float _1263 = _1261 * 0.5;
    float _1265 = _951 + _1259;
    float _1267 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1271 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1269);
    float _1273 = _1265 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1275 = floor(_1267);
    float _1277 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1279 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1281 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1273);
    float _1283 = _1257 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1285 = precise::max(0.0, _1277);
    float _1287 = fma(_779, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1281);
    float _1289 = 1.0 / _1271;
    float _1291 = _1233 * _1283;
    float _1293 = _1243 * _1283;
    float _1295 = _1287 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1297 = _1265 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1299 = _1291 * _1291;
    float _1301 = _1293 * _1293;
    float _1303 = -_1283;
    float _1305 = -_1285;
    float _1307 = fma(_1229, _1303, _1305);
    float _1309 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1297);
    float _1311 = trunc(_1295);
    int _1313 = int(_1311);
    float _1315 = _1299 + _1301;
    float _1317 = -_1275;
    float _1319 = _1267 + _1317;
    float _1321 = fma(_779, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1309);
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1325 = _1289 * _1323;
    float _1327 = sqrt(_1315);
    float _1329 = _1321 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1331 = _1325 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1333 = _1325 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1335 = fma(_779, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _1337 = !_1331;
    int _1339 = _1337 ? 0 : 1;
    float _1341 = trunc(_1329);
    int _1343 = int(_1341);
    int _1345 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1347 = _1313 + _1345;
    int _1349 = _1347 + 1;
    float _1351 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1353 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1351);
    bool _1355 = _1327 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = _1327 + _1357;
    int _1361 = 2;
    float _1363 = _1275;
    float _1365 = _1359;
    float _1367 = _1315;
    int _1369 = as_type<int>(_1229);
    int _1371 = _1349;
    float _1373 = _1329;
    float _1375 = _1291;
    float _1377 = _1293;
    float _1379 = _1299;
    int _1381 = as_type<int>(_1301);
    if (!_1331)
    {
        _1361 = 1;
    }
    int _1383 = _1361;
    float _1385 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1353);
    int _1387 = _1383;
    if (!_1333)
    {
        _1387 = _1339;
    }
    int _1389 = _1387;
    float _1391 = floor(_1335);
    bool _1393 = _1349 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1395 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1397 = _1389 << 6;
    int _1399 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1401 = _1343 + _1399;
    int _1403 = _1401 + 1;
    float _1405 = _1395 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _1407 = _1397 + 64;
    uint _1410 = uint(int(uint(_1407) >> uint(2)));
    uint _1412 = uint(int(uint(int(_1410)) >> uint(2)));
    int _1414 = int(_1410) & 3;
    float _1416 = (*spvDescriptorSet0.vp_c15)._m0[int(_1412)][_1414];
    int _1418 = int(_1410) + 1;
    uint _1420 = uint(int(uint(_1418) >> uint(2)));
    int _1422 = _1418 & 3;
    float _1424 = (*spvDescriptorSet0.vp_c15)._m0[int(_1420)][_1422];
    float _1426 = _1115;
    float _1428 = as_type<float>(_1403);
    float _1430 = as_type<float>(_1389);
    if (_1355)
    {
        float _1432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1426 = _1432;
    }
    float _1434 = _1426;
    int _1436 = _1349 | _1403;
    bool _1438 = _1436 < 0;
    bool _1440 = _1438 || _1393;
    int _1442 = _1397 + 48;
    uint _1444 = uint(int(uint(_1442) >> uint(2)));
    uint _1446 = uint(int(uint(int(_1444)) >> uint(2)));
    int _1448 = int(_1444) & 3;
    float _1450 = (*spvDescriptorSet0.vp_c15)._m0[int(_1446)][_1448];
    int _1452 = int(_1444) + 1;
    uint _1454 = uint(int(uint(_1452) >> uint(2)));
    int _1456 = _1452 & 3;
    float _1458 = (*spvDescriptorSet0.vp_c15)._m0[int(_1454)][_1456];
    if (_1355)
    {
        float _1460 = rsqrt(_1315);
        _1363 = _1460;
    }
    float _1462 = _1363;
    bool _1464 = _1403 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1466 = _1464 || _1440;
    float _1468 = -_1391;
    float _1470 = _1335 + _1468;
    float _1472 = -_1405;
    float _1474 = fma(_1472, _1279, 1.0);
    int _1476 = _1397 + 96;
    uint _1478 = uint(int(uint(_1476) >> uint(2)));
    uint _1480 = uint(int(uint(int(_1478)) >> uint(2)));
    int _1482 = int(_1478) & 3;
    float _1484 = (*spvDescriptorSet0.vp_c15)._m0[int(_1480)][_1482];
    int _1486 = int(_1478) + 1;
    uint _1488 = uint(int(uint(_1486) >> uint(2)));
    int _1490 = _1486 & 3;
    float _1492 = (*spvDescriptorSet0.vp_c15)._m0[int(_1488)][_1490];
    float _1494 = _1462;
    if (_1355)
    {
        float _1496 = _1359 * _1434;
        _1365 = _1496;
    }
    float _1498 = _1365;
    if (!_1355)
    {
        _1367 = _1307;
    }
    float _1500 = _1367;
    float _1502 = sqrt(_1253);
    float _1504 = 0.0;
    float _1506 = _1500;
    if (_1355)
    {
        float _1508 = _1498 * 0.15915493667125701904296875;
        _1504 = _1508;
    }
    float _1510 = _1504;
    if (!_1466)
    {
        int _1512 = _1403 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1514 = _1512 + _1349;
        _1369 = _1514;
    }
    int _1516 = _1369;
    int _1518 = _1397 + 56;
    uint _1520 = uint(int(uint(_1518) >> uint(2)));
    uint _1522 = uint(int(uint(int(_1520)) >> uint(2)));
    int _1524 = int(_1520) & 3;
    float _1526 = (*spvDescriptorSet0.vp_c15)._m0[int(_1522)][_1524];
    int _1528 = int(_1520) + 1;
    uint _1530 = uint(int(uint(_1528) >> uint(2)));
    int _1532 = _1528 & 3;
    float _1534 = (*spvDescriptorSet0.vp_c15)._m0[int(_1530)][_1532];
    if (_1355)
    {
        float _1536 = _1307 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1428 = _1536;
    }
    float _1538 = _1428;
    float _1540 = _1538;
    if (_1355)
    {
        float _1542 = _1510 * 6.283185482025146484375;
        float _1544 = cos(_1542);
        _977 = _1544;
    }
    float _1546 = _977;
    float _1548 = _1546;
    if (!_1466)
    {
        int _1550 = _1516 << 2;
        _1371 = _1550;
    }
    int _1552 = _1371;
    int _1554 = _1397 + 104;
    uint _1556 = uint(int(uint(_1554) >> uint(2)));
    uint _1558 = uint(int(uint(int(_1556)) >> uint(2)));
    int _1560 = int(_1556) & 3;
    float _1562 = (*spvDescriptorSet0.vp_c15)._m0[int(_1558)][_1560];
    int _1564 = int(_1556) + 1;
    uint _1566 = uint(int(uint(_1564) >> uint(2)));
    int _1568 = _1564 & 3;
    float _1570 = (*spvDescriptorSet0.vp_c15)._m0[int(_1566)][_1568];
    int _1572 = _1552;
    if (!_1466)
    {
        int _1574 = 12 & _1552;
        _1572 = _1574;
    }
    int _1576 = _1572;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1466)
    {
        float _1580 = floor(_1329);
        _1578 = _1580;
    }
    float _1582 = _1578;
    float _1584 = 0.0;
    if (_1355)
    {
        float _1586 = _1510 * 6.283185482025146484375;
        float _1588 = sin(_1586);
        _1584 = _1588;
    }
    float _1590 = _1584;
    float _1592 = _1265 * _1424;
    float _1594 = _1416;
    if (!_1466)
    {
        float _1596 = -_1582;
        float _1598 = _1329 + _1596;
        _1373 = _1598;
    }
    float _1600 = _1373;
    float _1602 = fma(_709, _1416, _1592);
    if (_1355)
    {
        float _1604 = _1546 + (-1.0);
        _1594 = _1604;
    }
    float _1606 = _1594;
    float _1608 = log2(_1474);
    float _1610 = _1265 * _1458;
    float _1612 = _1606;
    if (_1355)
    {
        float _1614 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1612 = _1614;
    }
    float _1616 = _1612;
    if (_1355)
    {
        float _1618 = fma(_1590, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1540 = _1618;
    }
    float _1620 = _1540;
    float _1622 = fma(_709, _1450, _1610);
    if (_1355)
    {
        float _1624 = fma(_1307, _1546, _1616);
        _1506 = _1624;
    }
    float _1626 = _1506;
    int _1628 = _1397 + 80;
    uint _1630 = uint(int(uint(_1628) >> uint(2)));
    uint _1632 = uint(int(uint(int(_1630)) >> uint(2)));
    int _1634 = int(_1630) & 3;
    float _1636 = (*spvDescriptorSet0.vp_c15)._m0[int(_1632)][_1634];
    int _1638 = int(_1630) + 1;
    uint _1640 = uint(int(uint(_1638) >> uint(2)));
    int _1642 = _1638 & 3;
    float _1644 = (*spvDescriptorSet0.vp_c15)._m0[int(_1640)][_1642];
    if (_1355)
    {
        float _1646 = _1462 * _1620;
        _1494 = _1646;
    }
    float _1648 = _1494;
    float _1650 = _1265 * _1492;
    if (!_1355)
    {
        _1548 = _1301;
    }
    float _1652 = _1548;
    float _1654 = _1652;
    if (_1355)
    {
        float _1656 = _1291 * _1648;
        _1375 = _1656;
    }
    float _1658 = _1375;
    float _1660 = fma(_709, _1484, _1650);
    if (_1355)
    {
        float _1662 = _1293 * _1648;
        _1377 = _1662;
    }
    float _1664 = _1377;
    int _1666 = _1397 + 72;
    uint _1668 = uint(int(uint(_1666) >> uint(2)));
    uint _1670 = uint(int(uint(int(_1668)) >> uint(2)));
    int _1672 = int(_1668) & 3;
    float _1674 = (*spvDescriptorSet0.vp_c15)._m0[int(_1670)][_1672];
    int _1676 = int(_1668) + 1;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    int _1680 = _1676 & 3;
    float _1682 = (*spvDescriptorSet0.vp_c15)._m0[int(_1678)][_1680];
    if (_1355)
    {
        float _1684 = _1658 * _1658;
        _1379 = _1684;
    }
    float _1686 = _1379;
    if (!_1466)
    {
        uint _1688 = uint(int(uint(_1516) >> uint(2)));
        _1381 = int(_1688);
    }
    int _1690 = _1381;
    int _1692 = _1690;
    if (_1355)
    {
        float _1694 = _1664 * _1664;
        _1654 = _1694;
    }
    float _1696 = _1654;
    float _1698 = fma(_1626, _1626, _1686);
    if (!_1466)
    {
        int _1700 = _1690 << 4;
        int _1702 = _1700 + _1576;
        _1692 = _1702;
    }
    int _1704 = _1692;
    float _1706 = fma(_779, _1526, _1622);
    int _1708 = _1397 + 88;
    uint _1710 = uint(int(uint(_1708) >> uint(2)));
    uint _1712 = uint(int(uint(int(_1710)) >> uint(2)));
    int _1714 = int(_1710) & 3;
    float _1716 = (*spvDescriptorSet0.vp_c15)._m0[int(_1712)][_1714];
    int _1718 = int(_1710) + 1;
    uint _1720 = uint(int(uint(_1718) >> uint(2)));
    int _1722 = _1718 & 3;
    float _1724 = (*spvDescriptorSet0.vp_c15)._m0[int(_1720)][_1722];
    float _1726 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1728 = _1698 + _1696;
    float _1730 = fma(_779, _1562, _1660);
    float _1732 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1734 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1726);
    float _1736 = rsqrt(_1728);
    float _1738 = _1730 + _1570;
    float _1740 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1732);
    float _1742 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1734);
    float _1744 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1746 = _1706 + _1534;
    float _1748 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1740);
    float _1750 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1752 = 1.0 / _1738;
    float _1754 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1744);
    float _1756 = _1748 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1758 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1762 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1760);
    float _1764 = precise::clamp(_1762, 0.0, 1.0);
    float _1766 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1754);
    float _1768 = _1728;
    if (!_1466)
    {
        int _1770 = _1704 + 400;
        uint _1772 = uint(int(uint(_1770) >> uint(2)));
        uint _1774 = uint(int(uint(int(_1772)) >> uint(2)));
        int _1776 = int(_1772) & 3;
        float _1778 = (*spvDescriptorSet0.vp_c15)._m0[int(_1774)][_1776];
        _1768 = _1778;
    }
    float _1780 = _1768;
    float _1782 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1758);
    float _1784 = _1736 * _1658;
    float _1786 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1788 = -_1764;
    float _1790 = _1788 + 1.0;
    float _1792 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1782);
    float _1794 = _1736 * _1626;
    float _1796 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1798 = _1736 * _1664;
    float _1800 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1792);
    float _1802 = _1746 * _1752;
    float _1804 = -_1796;
    float _1806 = fma(_1794, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1804);
    float _1808 = _1265 * _1644;
    float _1810 = abs(_1790);
    float _1812 = log2(_1810);
    float _1814 = _1608 * 0.693147182464599609375;
    bool _1816 = _1802 >= 0.0;
    float _1818 = fma(_709, _1636, _1808);
    float _1820 = -_1798;
    float _1822 = fma(_1820, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1806);
    bool _1824 = _1802 <= 1.0;
    bool _1826 = _1824 && _1816;
    float _1828 = fma(_779, _1674, _1602);
    float _1830 = fma(_1822, -0.5, 0.5);
    float _1832 = 1.0 / _1800;
    float _1834 = _1828 + _1682;
    float _1836 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1838 = _1834 * _1752;
    float _1840 = fma(_779, _1716, _1818);
    float _1842 = fma(_1822, 0.5, 0.5);
    float _1844 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _1846 = _1838 >= 0.0;
    bool _1848 = _1846 && _1826;
    float _1850 = sqrt(_1830);
    float _1852 = fma(_1842, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1854 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1856 = _1838 <= 1.0;
    bool _1858 = _1856 && _1848;
    float _1860 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1836);
    float _1862 = fma(_1842, _1852, -0.212114393711090087890625);
    float _1864 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1854);
    float _1866 = _1840 + _1724;
    float _1868 = exp2(_1844);
    float _1870 = fma(_1842, _1862, 1.570728778839111328125);
    float _1872 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1864);
    float _1874 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1860);
    float _1876 = _1794 + 1.0;
    float _1878 = _1866 * _1752;
    float _1880 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1872);
    float _1882 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1874);
    float _1884 = _1876;
    if (_1858)
    {
        float _1886 = float(_1389);
        _1430 = _1886;
    }
    float _1888 = _1430;
    float _1890 = _1746;
    if (!_1466)
    {
        float _1892 = floor(_1295);
        _1890 = _1892;
    }
    float _1894 = _1890;
    float _1896 = _1850 * 0.636619746685028076171875;
    float _1898 = _1882 * _1832;
    float _1900 = _1880 * _1832;
    float2 _5440 = float2(_1319, _1470);
    float _1902 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5440, float2(0.0), isnan(_5440)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5440, float2(0.0), isnan(_5440)), level(0.0)).x;
    float _1904 = -_1870;
    float _1906 = fma(_1896, _1904, 1.0);
    float _1908 = fma(_1898, 0.5, 0.5);
    float _1910 = -_1794;
    float _1912 = fma(_1868, _1876, _1910);
    float _1914 = _1872;
    if (_1858)
    {
        float _1916 = rint(_1888);
        float _1918 = precise::max(_1916, 0.0);
        uint _1920 = uint(_1918);
        uint _1922 = clamp(_1920, 0u, 65535u);
        _1914 = as_type<float>(_1922);
    }
    float _1924 = _1914;
    float _1926 = fma(_1900, -0.5, 0.5);
    float _1928 = fma(_1912, 0.5, 0.5);
    if (!_1466)
    {
        float _1930 = -_1894;
        float _1932 = _1295 + _1930;
        _1884 = _1932;
    }
    float _1934 = _1884;
    float _1936 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1938 = _1900;
    if (!_1466)
    {
        float _1940 = rint(_1780);
        float _1942 = precise::max(_1940, 0.0);
        uint _1944 = uint(_1942);
        uint _1946 = clamp(_1944, 0u, 65535u);
        _1938 = as_type<float>(_1946);
    }
    float _1948 = _1938;
    float _1950 = _1838;
    if (_1858)
    {
        float3 _5521 = float3(_1802, _1838, float(as_type<int>(_1924)));
        float3 _5525 = select(_5521, float3(0.0), isnan(_5521));
        float _1952 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5525.xy, uint(rint(_5525.z)), _1878, level(0.0));
        _1950 = _1952;
    }
    float _1954 = _1950;
    float3 _5535 = float3(_1908, _1926, _1936);
    float _1956 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5535, float3(0.0), isnan(_5535)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5535, float3(0.0), isnan(_5535)), level(0.0)).x;
    float3 _5544 = float3(_1908, _1926, _1936);
    float4 _1959 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5544, float3(0.0), isnan(_5544)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5544, float3(0.0), isnan(_5544)), level(0.0)).xyzw;
    float _1961 = _1959.x;
    float _1963 = _1959.y;
    float _1965 = _1959.z;
    float _1967 = _1959.w;
    float2 _5560 = float2(_1906, _1928);
    float3 _1971 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5560, float2(0.0), isnan(_5560)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5560, float2(0.0), isnan(_5560)), level(0.0)).xyz;
    float _1973 = _1971.x;
    float _1975 = _1971.y;
    float _1977 = _1971.z;
    float _1979 = _1600;
    if (!_1466)
    {
        float3 _5581 = float3(_1934, _1600, float(as_type<int>(_1948)));
        float3 _5583 = select(_5581, float3(0.0), isnan(_5581));
        float _1981 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5583.xy, uint(rint(_5583.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5583.xy, uint(rint(_5583.z)), level(0.0)).x;
        _1979 = _1981;
    }
    float _1983 = _1979;
    float _1985 = abs(_1325);
    float _1987 = log2(_1985);
    float _1989 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_88.x = _709;
    out.m_88.y = _951;
    out.m_88.z = _779;
    float _1991 = exp2(_1989);
    bool _1993 = _1325 <= 8000.0;
    bool _1995 = isnan(_1325);
    bool _1997 = _1993 || _1995;
    bool _1999 = isnan(8000.0);
    bool _2001 = _1997 || _1999;
    float _2003 = float(_2001);
    float _2005 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2007 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2009 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2007);
    float _2011 = exp2(_2005);
    float _2013 = -_1991;
    float _2015 = _2013 + 1.0;
    float _2017 = fma(_2011, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2019 = precise::clamp(_2017, 0.0, 1.0);
    float _2021 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2009);
    float _2023 = _1800 * 0.5;
    float _2025 = fma(_2019, -2.0, 3.0);
    float _2027 = _2019 * _2019;
    float _2029 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2021);
    float _2031 = _2027 * _2025;
    float _2033 = _2029 + _1800;
    float _2035 = _1882 + _1800;
    float _2037 = fma(_1880, -0.5, _2023);
    float _2039 = -_2031;
    float _2041 = _2039 + 1.0;
    float _2043 = _2033 * 0.5;
    float _2045 = _2035 * 0.5;
    out.gl_Position.x = _1882;
    out.gl_Position.y = _1880;
    out.gl_Position.z = _2029;
    out.gl_Position.w = _1800;
    float _2047 = fma(_2041, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2031);
    float _2049 = _2023;
    float _2051 = _2015;
    if (!_1858)
    {
        _2049 = 1.0;
    }
    float _2053 = _2049;
    out.m_90.x = _2045;
    out.m_90.y = _2037;
    out.m_90.z = _2043;
    out.m_90.w = _1800;
    float _2055 = _2003 * _2047;
    float _2057 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2059 = _2015 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2061 = _2053;
    if (_1466)
    {
        _2051 = 1.0;
    }
    float _2063 = _2051;
    float _2065 = -_1902;
    float _2067 = _2065 + 1.0;
    float _2069 = _2067 * _2057;
    float _2071 = precise::clamp(_2069, 0.0, 1.0);
    float _2073 = _2063;
    if (_1858)
    {
        bool _2075 = _1954 >= _1878;
        bool _2077 = isnan(_1954);
        bool _2079 = _2075 || _2077;
        bool _2081 = isnan(_1878);
        bool _2083 = _2079 || _2081;
        float _2085 = float(_2083);
        _2061 = _2085;
    }
    float _2087 = _2061;
    if (!_1466)
    {
        int _2089 = _1516 << 4;
        int _2091 = _2089 + 2048;
        uint _2093 = uint(int(uint(_2091) >> uint(2)));
        uint _2095 = uint(int(uint(int(_2093)) >> uint(2)));
        int _2097 = int(_2093) & 3;
        float _2099 = (*spvDescriptorSet0.vp_c15)._m0[int(_2095)][_2097];
        int _2101 = int(_2093) + 1;
        uint _2103 = uint(int(uint(_2101) >> uint(2)));
        int _2105 = _2101 & 3;
        float _2107 = (*spvDescriptorSet0.vp_c15)._m0[int(_2103)][_2105];
        int _2109 = _2091 + 8;
        uint _2111 = uint(int(uint(_2109) >> uint(2)));
        uint _2113 = uint(int(uint(int(_2111)) >> uint(2)));
        int _2115 = int(_2111) & 3;
        float _2117 = (*spvDescriptorSet0.vp_c15)._m0[int(_2113)][_2115];
        int _2119 = int(_2111) + 1;
        uint _2121 = uint(int(uint(_2119) >> uint(2)));
        int _2123 = _2119 & 3;
        float _2125 = (*spvDescriptorSet0.vp_c15)._m0[int(_2121)][_2123];
        float _2127 = _1265 * _2107;
        float _2129 = fma(_709, _2099, _2127);
        float _2131 = fma(_779, _2117, _2129);
        float _2133 = _2131 + _2125;
        float _2135 = precise::clamp(_2133, 0.0, 1.0);
        float _2137 = -_2135;
        float _2139 = _2137 + _1983;
        float _2141 = fma(_2139, 500.0, 1.5);
        float _2143 = exp2(_2141);
        float _2145 = 0.0 + _2143;
        float _2147 = precise::clamp(_2145, 0.0, 1.0);
        _2073 = _2147;
        _787 = _2131;
    }
    float _2149 = _2073;
    float _2151 = _787;
    float _2153 = _2059 * _1956;
    float _2155 = _2087 * _2149;
    float _2157 = -_2071;
    float _2159 = fma(_2157, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2161 = -_2059;
    float _2163 = _2161 + 1.0;
    float _2165 = _1967 * _2153;
    float _2167 = _1977 * _2153;
    float _2169 = -_2155;
    float _2171 = fma(_2169, _2159, 1.0);
    float _2173 = precise::clamp(_2171, 0.0, 1.0);
    float _2175 = _1967 * _2163;
    float _2177 = fma(_1973, _2165, _1961);
    float _2179 = fma(_1975, _2165, _1963);
    float _2181 = _2173 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2183 = fma(_1967, _2167, _1965);
    bool _2185 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2187 = isnan(_1502);
    bool _2189 = _2185 || _2187;
    bool _2191 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2193 = _2189 || _2191;
    out.m_92.x = _2181;
    out.m_94.x = _2177;
    out.m_94.y = _2179;
    out.m_94.z = _2183;
    out.m_94.w = _2175;
    float _2195 = _2151;
    float _2197 = _2173;
    float _2199 = _2153;
    if (!_2193)
    {
        _2195 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2201 = _2195;
    float _2203 = _2201;
    float _2205 = _2201;
    if (!_2193)
    {
        _2197 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2207 = _2197;
    float _2209 = _2207;
    float _2211 = _2207;
    if (!_2193)
    {
        _2199 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2213 = _2199;
    bool _2215 = !_2193;
    float _2217 = _2213;
    float _2219 = _2213;
    if (!_2215)
    {
        bool _2221 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2223 = isnan(_1502);
        bool _2225 = _2221 || _2223;
        bool _2227 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2229 = _2225 || _2227;
        if (!_2229)
        {
            float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2233 = _1502 + _2231;
            float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2237 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2235;
            float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2247 = 1.0 / _2237;
            float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2251 = _2249 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2253 = _2233 * _2247;
            float _2255 = precise::clamp(_2253, 0.0, 1.0);
            float _2257 = fma(_2255, _2241, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2259 = fma(_2255, _2245, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2261 = fma(_2255, _2251, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2211 = _2259;
            _2205 = _2257;
            _2219 = _2261;
            _2263 = true;
        }
        else
        {
            bool _2265 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2267 = isnan(_1502);
            bool _2269 = _2265 || _2267;
            bool _2271 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2273 = _2269 || _2271;
            if (!_2273)
            {
                _2203 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2275 = _2203;
            _2205 = _2275;
            if (!_2273)
            {
                _2209 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2277 = _2209;
            _2211 = _2277;
            if (!_2273)
            {
                _2217 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2279 = _2217;
            bool _2281 = !_2273;
            _2219 = _2279;
            if (!_2281)
            {
                bool _2283 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2285 = isnan(_1502);
                bool _2287 = _2283 || _2285;
                bool _2289 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2291 = _2287 || _2289;
                if (!_2291)
                {
                    float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2295 = _1502 + _2293;
                    float _2297 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2299 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2297;
                    float _2301 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2309 = 1.0 / _2299;
                    float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2313 = _2311 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2315 = _2295 * _2309;
                    float _2317 = precise::clamp(_2315, 0.0, 1.0);
                    float _2319 = fma(_2317, _2303, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2321 = fma(_2317, _2307, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2323 = fma(_2317, _2313, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2211 = _2321;
                    _2205 = _2319;
                    _2219 = _2323;
                    _2263 = true;
                }
                else
                {
                    _2211 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2205 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2219 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2263 = false;
    float _2325 = _2211;
    float _2327 = _2205;
    float _2329 = _2219;
    float _2331 = _2325 * 0.586610972881317138671875;
    bool _2333 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_96.x = 0.0;
    float _2335 = fma(_2327, 0.298911988735198974609375, _2331);
    float _2337 = fma(_2329, 0.114477999508380889892578125, _2335);
    float _2339 = -_2337;
    float _2341 = _2339 + _2327;
    float _2343 = -_2337;
    float _2345 = _2343 + _2325;
    float _2347 = -_2337;
    float _2349 = _2347 + _2329;
    float _2351 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2353 = fma(_2341, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2337);
    float _2355 = fma(_2345, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2337);
    float _2357 = fma(_2349, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2337);
    out.m_61.x = _2351;
    out.m_98.x = _2353;
    out.m_98.y = _2355;
    out.m_98.z = _2357;
    if (!_2333)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2359 = -_1217;
    float _2361 = _2359 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2363 = -_1219;
    float _2365 = _2363 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2367 = -_1221;
    float _2369 = _2367 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2371 = _2361 * _2361;
    float _2373 = fma(_2365, _2365, _2371);
    float _2375 = fma(_2369, _2369, _2373);
    float _2377 = sqrt(_2375);
    float _2379 = rsqrt(_2375);
    float _2381 = -_2377;
    float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2385 = _2383 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2387 = precise::clamp(_2385, 0.0, 1.0);
    float _2389 = _2365 * _2379;
    float _2391 = _2361 * _2379;
    float _2393 = abs(_2387);
    float _2395 = log2(_2393);
    float _2397 = _2369 * _2379;
    float _2399 = _2389 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2401 = _1121 * _2391;
    float _2403 = -_2391;
    float _2405 = -_2399;
    float _2407 = fma(_2403, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2405);
    float _2409 = fma(_1117, _2389, _2401);
    float _2411 = -_2397;
    float _2413 = fma(_2411, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2407);
    float _2415 = fma(_1123, _2397, _2409);
    float _2417 = precise::clamp(_2415, 0.0, 1.0);
    float _2419 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2421 = _2413 + _2419;
    float _2423 = _2395 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2425 = _2421 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2427 = precise::clamp(_2425, 0.0, 1.0);
    float _2429 = exp2(_2423);
    float _2431 = _2429 * _2427;
    float _2433 = _2417 * _2431;
    float _2435 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2437 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2439 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _2435;
    out.m_96.y = _2437;
    out.m_96.z = _2439;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2263 = false;
    bool _1169 = false;
    bool _533 = false;
    bool _435 = false;
    bool _331 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_58.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (!_121)
    {
        out.m_61.x = 0.0;
    }
    int _127 = 0;
    if (!_121)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2495 = as_type<float>(_131);
        out.gl_Position.z = _2495;
    }
    if (!_121)
    {
        return out;
    }
    float _135 = in.m_63.w;
    float _137 = float(_117);
    float _139 = 1.0 / _137;
    float _141 = -_135;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_135);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = _143 * _139;
    bool _157 = _143 >= _137;
    bool _159 = !_153;
    bool _161 = _157 || _159;
    out.m_65.x = _155;
    float _163 = _135;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_61.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2566 = as_type<float>(_169);
        out.gl_Position.z = _2566;
    }
    if (_161)
    {
        return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = in.m_70.w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_63.x;
    float _189 = in.m_63.y;
    float _191 = in.m_63.z;
    float _193 = in.m_58.x;
    float _195 = in.m_58.y;
    float _197 = in.m_58.z;
    float _199 = 0.0;
    float _201 = _173;
    if (!_185)
    {
        float _203 = _173 * _173;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    float _209 = _207;
    if (!_185)
    {
        float _211 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _211;
    }
    float _213 = _209;
    int _215 = as_type<int>(_171) & 1;
    bool _217 = _215 != 0;
    int _219 = as_type<int>(_171) & 2;
    bool _221 = _219 != 0;
    bool _223 = !_217;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_221;
    float _229 = _227 ? (-0.5) : 0.5;
    bool _231 = !_185;
    float _233 = _213;
    if (!_231)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = _173 * _237;
        float _247 = 1.0 / _241;
        float _249 = _243 * 0.693147182464599609375;
        float _251 = exp2(_245);
        float _253 = 1.0 / _249;
        float _255 = _251 + (-1.0);
        float _257 = -_255;
        float _259 = fma(_257, _253, _173);
        float _261 = _259 * _247;
        float _263 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _263;
    }
    float _265 = _233;
    bool _267 = !_185;
    if (!_267)
    {
        float _269 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = log2(_269);
        float _273 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _275 = _273 + 1.0;
        float _277 = 1.0 / _275;
        float _279 = _173 * _271;
        float _281 = exp2(_279);
        float _283 = -_281;
        float _285 = _283 + 1.0;
        float _287 = _285 * _277;
        _201 = _287;
    }
    float _289 = _201;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _293 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _295 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _297 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _299 = fma(_289, _187, _293);
    float _301 = fma(_289, _189, _295);
    float _303 = fma(_289, _191, _297);
    float _305 = fma(_299, _175, _193);
    float _307 = fma(_301, _175, _195);
    float _309 = fma(_303, _175, _197);
    bool _311 = !_291;
    float _329;
    if (!_311)
    {
        float _313 = in.m_72.x;
        float _315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _317 = _313 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _321 = _319 * _315;
        float _323 = floor(_321);
        float _325 = -_323;
        float _327 = _321 + _325;
        _329 = _327;
        _331 = true;
    }
    else
    {
        _329 = _155;
    }
    _331 = false;
    float _333 = _329;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = _333 + _335;
    float _339 = in.m_70.x;
    float _341 = in.m_70.y;
    bool _343 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _345 = isnan(_333);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _355;
    bool _359 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _361 = isnan(_333);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = -_353;
    float _373 = _371 + 1.0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = 1.0 / _357;
    bool _381 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _383 = _369 * _373;
    float _385 = -_369;
    float _387 = _385 + 1.0;
    float _389 = _337 * _379;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _391;
    float _395 = fma(_377, _389, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _397 = fma(_393, _389, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = _395 * _383;
    float _401 = _397 * _383;
    float _403 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[143].x, _399);
    float _405 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[143].y, _401);
    float _407 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[144].x, _403);
    float _409 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[144].y, _405);
    float _411 = _407 * _339;
    float _413 = _409 * _341;
    bool _415 = !_381;
    float _433;
    if (!_415)
    {
        float _417 = in.m_72.x;
        float _419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _421 = _417 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _425 = _423 * _419;
        float _427 = floor(_425);
        float _429 = -_427;
        float _431 = _425 + _429;
        _433 = _431;
        _435 = true;
    }
    else
    {
        _433 = _155;
    }
    _435 = false;
    float _437 = _433;
    bool _439 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = isnan(_437);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _455 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _457 = isnan(_437);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _473 = _437 + _471;
    float _475 = -_449;
    float _477 = _475 + 1.0;
    float _479 = 1.0 / _453;
    bool _481 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _483 = _465 * _477;
    float _485 = -_465;
    float _487 = _485 + 1.0;
    float _489 = _469 * _479;
    float _491 = fma(_489, _473, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _493 = _491 * _483;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _499 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[115].x, _493);
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _503 = _495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _505 = _497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _507 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[116].x, _499);
    float _509 = _501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _511 = _507 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_74.x = _503;
    out.m_74.y = _505;
    out.m_74.z = _509;
    out.m_74.w = _511;
    bool _513 = !_481;
    float _531;
    if (!_513)
    {
        float _515 = in.m_72.x;
        float _517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _519 = _515 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _523 = _521 * _517;
        float _525 = floor(_523);
        float _527 = -_525;
        float _529 = _523 + _527;
        _531 = _529;
        _533 = true;
    }
    else
    {
        _531 = _155;
    }
    _533 = false;
    float _535 = _531;
    float _537 = in.m_76.x;
    float _539 = in.m_76.y;
    float _541 = in.m_76.z;
    float _543 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _545 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _225);
    float _547 = in.m_78.x;
    float _549 = in.m_78.y;
    float _551 = in.m_78.z;
    float _553 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _555 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _229);
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _559 = _557 != 0;
    float _561 = in.m_80.x;
    float _563 = in.m_80.y;
    float _565 = in.m_80.z;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _569 = _567 != 0;
    float _571 = _553 * _555;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _575 = _573 != 0;
    float _577 = in.m_72.x;
    float _579 = in.m_72.y;
    float _581 = in.m_72.z;
    float _583 = in.m_72.w;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _587 = _585 != 0;
    float _589 = _543 * _545;
    float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _593 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _595 = isnan(_535);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _607 = _307 * _539;
    float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _611 = _307 * _549;
    float _613 = fma(_305, _537, _607);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _619 = fma(_305, _547, _611);
    float _621 = _307 * _563;
    float _623 = 1.0 / _617;
    bool _625 = _583 > 0.5;
    float _627 = fma(_305, _561, _621);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _633 = _577 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _637 = _635 != 0;
    float _639 = 1.0 / _631;
    float _641 = _579 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _645 = -_605;
    float _647 = fma(_633, 2.0, _645);
    float _649 = _229 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _651 = _577 > 0.5;
    float _653 = fma(_641, -2.0, _643);
    float _655 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _657 = _649 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _659 = _649 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _661 = _649 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _663 = fma(_309, _551, _619);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _669 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[24].x, _657);
    float _671 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[25].x, _659);
    float _673 = fma(_309, _541, _613);
    float _675 = fma(_309, _565, _627);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _677;
    float _681 = -_225;
    int _683 = _651 ? as_type<int>(_681) : as_type<int>(_225);
    float _685 = _667 * _623;
    bool _687 = _581 > 0.5;
    float _689 = _679 * _639;
    float _691 = _571 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _693 = -_229;
    int _695 = _625 ? as_type<int>(_693) : as_type<int>(_229);
    float _697 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[26].x, _661);
    bool _699 = _579 > 0.5;
    float _701 = _571 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _703 = _571 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _705 = -_225;
    float _707 = _687 ? _705 : _225;
    float _709 = _673 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _711 = !_559;
    float _713 = _711 ? _225 : as_type<float>(_683);
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _717 = -_229;
    int _719 = _699 ? as_type<int>(_717) : as_type<int>(_229);
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _723 = !_575;
    float _725 = _723 ? _225 : _707;
    float _727 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[78].z, _715);
    float _729 = _707;
    float _731 = _577;
    float _733 = _581;
    float _735 = _725;
    float _737 = _671;
    if (!_637)
    {
        _729 = _579;
    }
    float _739 = _729;
    float _741 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[24].x, _691);
    float _743 = 0.0;
    float _745 = _739;
    if (!_637)
    {
        _743 = _579;
    }
    float _747 = _743;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _751 = _535 + _749;
    float _753 = _747;
    if (_637)
    {
        _745 = _577;
    }
    float _755 = _745;
    float _757 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[78].w, _721);
    if (_637)
    {
        _753 = _577;
    }
    float _759 = _753;
    float _761 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[26].x, _703);
    bool _763 = !_569;
    float _765 = _763 ? _229 : as_type<float>(_719);
    float _767 = fma(_689, _751, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _769 = 0.0;
    if (!_637)
    {
        _769 = _581;
    }
    float _771 = _769;
    float _773 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _775 = _771;
    if (_637)
    {
        _731 = _581;
    }
    float _777 = _731;
    float _779 = _675 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _781 = !_587;
    float _783 = _781 ? _229 : as_type<float>(_695);
    float _785 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[25].x, _701);
    float _787 = _779;
    if (_637)
    {
        _775 = _579;
    }
    float _789 = _775;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _793 = _535 + _791;
    if (_637)
    {
        _733 = _579;
    }
    float _795 = _733;
    float _797 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[24].z, _741);
    float _799 = fma(_685, _793, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _801 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[26].z, _761);
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _805 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _807 = isnan(_535);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _819 = _801 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _821 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[84].z, _803);
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _825 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[83].z, _817);
    float _827 = _797 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _829 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[84].x, _821);
    float _831 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[83].w, _823);
    float _833 = _779 + _819;
    float _835 = _709 + _827;
    float _837 = _829 * (-0.15915493667125701904296875);
    float _839 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[25].z, _785);
    float _841 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _843 = _833 + _841;
    float _845 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _847 = _835 + _845;
    bool _849 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _851 = isnan(_535);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -_815;
    float _863 = _861 + 1.0;
    float _865 = _843 * _843;
    float _867 = _847 * _847;
    float _869 = _837 * 6.283185482025146484375;
    float _871 = sin(_869);
    float _873 = _859 * _863;
    float _875 = -_859;
    float _877 = _875 + 1.0;
    float _879 = _867 + _865;
    float _881 = _591 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _883 = -_143;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[76].x, _647);
    float _887 = _603 * _877;
    float _889 = _713 + 0.5;
    float _891 = sqrt(_879);
    float _893 = -_603;
    float _895 = _893 + 1.0;
    float _897 = _767 * _887;
    float _899 = fma(_881, _889, _885);
    float _901 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _653);
    float _903 = _609 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _907 = _765 + (-0.5);
    float _909 = _837 * 6.283185482025146484375;
    float _911 = cos(_909);
    float _913 = _755 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _915 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[131].x, _897);
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _919 = _789 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _921 = -_903;
    float _923 = -_901;
    float _925 = fma(_921, _907, _923);
    float _927 = -_905;
    float _929 = fma(_913, 2.0, _927);
    float _931 = fma(_799, _873, _915);
    bool _933 = _891 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _935 = fma(_919, -2.0, _917);
    float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _939 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _727);
    float _941 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _757);
    float _943 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _825);
    float _945 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _831);
    float _947 = -_143;
    float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[81].x, _929);
    float _951 = _663 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _953 = _839 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _957 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _935);
    float _959 = _783 * _911;
    float _961 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[133].x, _931);
    float _963 = _783 * _871;
    float _965 = _951 + _953;
    float _967 = fma(_725, _871, _959);
    float _969 = _959;
    float _971 = _865;
    float _973 = _867;
    float _975 = _839;
    float _977 = _911;
    if (!_933)
    {
        _969 = _865;
    }
    float _979 = _969;
    float _981 = -_963;
    float _983 = fma(_725, _911, _981);
    float _985 = _979;
    if (!_933)
    {
        _971 = _867;
    }
    float _987 = _971;
    float _989 = _987;
    if (!_933)
    {
        _735 = _835;
    }
    float _991 = _735;
    float _993 = _991;
    if (!_933)
    {
        _973 = _833;
    }
    float _995 = _973;
    float _997 = _995;
    if (!_933)
    {
        _975 = _965;
    }
    float _999 = _975;
    bool _1001 = !_933;
    float _1003 = _999;
    if (!_1001)
    {
        float _1005 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1009 = _891 + _1007;
        float _1011 = _965 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1013 = rsqrt(_879);
        float _1015 = _1009 * _1005;
        float _1017 = _1015 * 0.15915493667125701904296875;
        float _1019 = _1017 * 6.283185482025146484375;
        float _1021 = sin(_1019);
        float _1023 = _1017 * 6.283185482025146484375;
        float _1025 = cos(_1023);
        float _1027 = fma(_1021, _1011, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1029 = _1013 * _1027;
        float _1031 = _1025 + (-1.0);
        float _1033 = fma(_847, _1029, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1035 = fma(_843, _1029, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1037 = _1031 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1039 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1041 = _1033 + _1039;
        float _1043 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1045 = _1035 + _1043;
        float _1047 = fma(_965, _1025, _1037);
        float _1049 = _1041 * _1041;
        float _1051 = _1045 * _1045;
        _1003 = _1047;
        _989 = _1049;
        _985 = _1051;
        _993 = _1033;
        _997 = _1035;
    }
    float _1053 = _1003;
    float _1055 = _989;
    float _1057 = _985;
    float _1059 = _993;
    float _1061 = _997;
    float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1065 = _1053 + _1063;
    float _1067 = _937 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1069 = _955 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1071 = _967 + (-0.5);
    float _1073 = fma(_1065, _1065, _1055);
    float _1075 = _983 + 0.5;
    float _1077 = -_943;
    float _1079 = _1077 + 1.0;
    float _1081 = -_1067;
    float _1083 = -_957;
    float _1085 = fma(_1081, _1071, _1083);
    float _1087 = _1073 + _1057;
    float _1089 = fma(_1069, _1075, _949);
    float _1091 = -_945;
    float _1093 = _1091 + 1.0;
    float _1095 = -_939;
    float _1097 = _1095 + 1.0;
    float _1099 = -_941;
    float _1101 = _1099 + 1.0;
    float _1103 = -_1079;
    float _1105 = fma(_983, _1103, _1089);
    float _1107 = sqrt(_1087);
    float _1109 = fma(_967, _1093, _1085);
    float _1111 = -_1097;
    float _1113 = fma(_713, _1111, _899);
    float _1115 = fma(_765, _1101, _925);
    float _1117 = _669 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1119 = _961 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1121 = _671 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1123 = _697 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_82.x = _1113;
    out.m_82.y = _1115;
    out.m_82.z = _1105;
    out.m_82.w = _1109;
    out.m_84.w = _1119;
    out.m_86.x = _1117;
    out.m_86.y = _1121;
    out.m_86.z = _1123;
    bool _1125 = _1107 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1127 = isnan(_1107);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1133 = _1129 || _1131;
    if (!_1133)
    {
        _737 = 1.0;
    }
    float _1135 = _737;
    bool _1137 = !_1133;
    float _1139 = _1135;
    if (!_1137)
    {
        bool _1141 = _1107 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1143 = isnan(_1107);
        bool _1145 = _1141 || _1143;
        bool _1147 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1149 = _1145 || _1147;
        if (!_1149)
        {
            float _1151 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1153 = _1107 + _1151;
            float _1155 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1157 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1155;
            float _1159 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1161 = _1159 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1163 = 1.0 / _1157;
            float _1165 = _1153 * _1163;
            float _1167 = fma(_1165, _1161, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1139 = _1167;
            _1169 = true;
        }
        else
        {
            bool _1171 = _1107 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1173 = isnan(_1107);
            bool _1175 = _1171 || _1173;
            bool _1177 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1179 = _1175 || _1177;
            if (!_1179)
            {
                float _1181 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1183 = _1107 + _1181;
                float _1185 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1187 = _1185 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1189 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1191 = _1189 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1193 = 1.0 / _1187;
                float _1195 = _1183 * _1193;
                float _1197 = fma(_1195, _1191, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1139 = _1197;
                _1169 = true;
            }
            else
            {
                _1139 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1169 = false;
    float _1199 = _1139;
    float _1201 = _951 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1203 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1205 = _1053 + _1203;
    float _1207 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1209 = _1059 + _1207;
    float _1211 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1213 = _1061 + _1211;
    float _1215 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1201);
    float _1217 = fma(_1205, _1199, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1219 = fma(_1209, _1199, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1221 = fma(_1213, _1199, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1223 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1215);
    float _1225 = _951 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1229 = _1217 + _1227;
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1233 = _1219 + _1231;
    float _1235 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1237 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1225);
    float _1239 = _1229 * _1229;
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1243 = _1221 + _1241;
    float _1245 = 1.0 / _1235;
    float _1247 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1237);
    float _1249 = fma(_1233, _1233, _1239);
    float _1251 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1253 = fma(_1243, _1243, _1249);
    float _1255 = _1251 + _1235;
    float _1257 = rsqrt(_1253);
    float _1259 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1261 = _1255 * _1245;
    float _1263 = _1261 * 0.5;
    float _1265 = _951 + _1259;
    float _1267 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1271 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1269);
    float _1273 = _1265 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1275 = floor(_1267);
    float _1277 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1279 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1281 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1273);
    float _1283 = _1257 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1285 = precise::max(0.0, _1277);
    float _1287 = fma(_779, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1281);
    float _1289 = 1.0 / _1271;
    float _1291 = _1233 * _1283;
    float _1293 = _1243 * _1283;
    float _1295 = _1287 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1297 = _1265 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1299 = _1291 * _1291;
    float _1301 = _1293 * _1293;
    float _1303 = -_1283;
    float _1305 = -_1285;
    float _1307 = fma(_1229, _1303, _1305);
    float _1309 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1297);
    float _1311 = trunc(_1295);
    int _1313 = int(_1311);
    float _1315 = _1299 + _1301;
    float _1317 = -_1275;
    float _1319 = _1267 + _1317;
    float _1321 = fma(_779, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1309);
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1325 = _1289 * _1323;
    float _1327 = sqrt(_1315);
    float _1329 = _1321 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1331 = _1325 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1333 = _1325 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1335 = fma(_779, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _1337 = !_1331;
    int _1339 = _1337 ? 0 : 1;
    float _1341 = trunc(_1329);
    int _1343 = int(_1341);
    int _1345 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1347 = _1313 + _1345;
    int _1349 = _1347 + 1;
    float _1351 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1353 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1351);
    bool _1355 = _1327 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = _1327 + _1357;
    int _1361 = 2;
    float _1363 = _1275;
    float _1365 = _1359;
    float _1367 = _1315;
    int _1369 = as_type<int>(_1229);
    int _1371 = _1349;
    float _1373 = _1329;
    float _1375 = _1291;
    float _1377 = _1293;
    float _1379 = _1299;
    int _1381 = as_type<int>(_1301);
    if (!_1331)
    {
        _1361 = 1;
    }
    int _1383 = _1361;
    float _1385 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1353);
    int _1387 = _1383;
    if (!_1333)
    {
        _1387 = _1339;
    }
    int _1389 = _1387;
    float _1391 = floor(_1335);
    bool _1393 = _1349 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1395 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1397 = _1389 << 6;
    int _1399 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1401 = _1343 + _1399;
    int _1403 = _1401 + 1;
    float _1405 = _1395 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _1407 = _1397 + 64;
    uint _1410 = uint(int(uint(_1407) >> uint(2)));
    uint _1412 = uint(int(uint(int(_1410)) >> uint(2)));
    int _1414 = int(_1410) & 3;
    float _1416 = (*spvDescriptorSet0.vp_c15)._m0[int(_1412)][_1414];
    int _1418 = int(_1410) + 1;
    uint _1420 = uint(int(uint(_1418) >> uint(2)));
    int _1422 = _1418 & 3;
    float _1424 = (*spvDescriptorSet0.vp_c15)._m0[int(_1420)][_1422];
    float _1426 = _1115;
    float _1428 = as_type<float>(_1403);
    float _1430 = as_type<float>(_1389);
    if (_1355)
    {
        float _1432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1426 = _1432;
    }
    float _1434 = _1426;
    int _1436 = _1349 | _1403;
    bool _1438 = _1436 < 0;
    bool _1440 = _1438 || _1393;
    int _1442 = _1397 + 48;
    uint _1444 = uint(int(uint(_1442) >> uint(2)));
    uint _1446 = uint(int(uint(int(_1444)) >> uint(2)));
    int _1448 = int(_1444) & 3;
    float _1450 = (*spvDescriptorSet0.vp_c15)._m0[int(_1446)][_1448];
    int _1452 = int(_1444) + 1;
    uint _1454 = uint(int(uint(_1452) >> uint(2)));
    int _1456 = _1452 & 3;
    float _1458 = (*spvDescriptorSet0.vp_c15)._m0[int(_1454)][_1456];
    if (_1355)
    {
        float _1460 = rsqrt(_1315);
        _1363 = _1460;
    }
    float _1462 = _1363;
    bool _1464 = _1403 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1466 = _1464 || _1440;
    float _1468 = -_1391;
    float _1470 = _1335 + _1468;
    float _1472 = -_1405;
    float _1474 = fma(_1472, _1279, 1.0);
    int _1476 = _1397 + 96;
    uint _1478 = uint(int(uint(_1476) >> uint(2)));
    uint _1480 = uint(int(uint(int(_1478)) >> uint(2)));
    int _1482 = int(_1478) & 3;
    float _1484 = (*spvDescriptorSet0.vp_c15)._m0[int(_1480)][_1482];
    int _1486 = int(_1478) + 1;
    uint _1488 = uint(int(uint(_1486) >> uint(2)));
    int _1490 = _1486 & 3;
    float _1492 = (*spvDescriptorSet0.vp_c15)._m0[int(_1488)][_1490];
    float _1494 = _1462;
    if (_1355)
    {
        float _1496 = _1359 * _1434;
        _1365 = _1496;
    }
    float _1498 = _1365;
    if (!_1355)
    {
        _1367 = _1307;
    }
    float _1500 = _1367;
    float _1502 = sqrt(_1253);
    float _1504 = 0.0;
    float _1506 = _1500;
    if (_1355)
    {
        float _1508 = _1498 * 0.15915493667125701904296875;
        _1504 = _1508;
    }
    float _1510 = _1504;
    if (!_1466)
    {
        int _1512 = _1403 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1514 = _1512 + _1349;
        _1369 = _1514;
    }
    int _1516 = _1369;
    int _1518 = _1397 + 56;
    uint _1520 = uint(int(uint(_1518) >> uint(2)));
    uint _1522 = uint(int(uint(int(_1520)) >> uint(2)));
    int _1524 = int(_1520) & 3;
    float _1526 = (*spvDescriptorSet0.vp_c15)._m0[int(_1522)][_1524];
    int _1528 = int(_1520) + 1;
    uint _1530 = uint(int(uint(_1528) >> uint(2)));
    int _1532 = _1528 & 3;
    float _1534 = (*spvDescriptorSet0.vp_c15)._m0[int(_1530)][_1532];
    if (_1355)
    {
        float _1536 = _1307 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1428 = _1536;
    }
    float _1538 = _1428;
    float _1540 = _1538;
    if (_1355)
    {
        float _1542 = _1510 * 6.283185482025146484375;
        float _1544 = cos(_1542);
        _977 = _1544;
    }
    float _1546 = _977;
    float _1548 = _1546;
    if (!_1466)
    {
        int _1550 = _1516 << 2;
        _1371 = _1550;
    }
    int _1552 = _1371;
    int _1554 = _1397 + 104;
    uint _1556 = uint(int(uint(_1554) >> uint(2)));
    uint _1558 = uint(int(uint(int(_1556)) >> uint(2)));
    int _1560 = int(_1556) & 3;
    float _1562 = (*spvDescriptorSet0.vp_c15)._m0[int(_1558)][_1560];
    int _1564 = int(_1556) + 1;
    uint _1566 = uint(int(uint(_1564) >> uint(2)));
    int _1568 = _1564 & 3;
    float _1570 = (*spvDescriptorSet0.vp_c15)._m0[int(_1566)][_1568];
    int _1572 = _1552;
    if (!_1466)
    {
        int _1574 = 12 & _1552;
        _1572 = _1574;
    }
    int _1576 = _1572;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1466)
    {
        float _1580 = floor(_1329);
        _1578 = _1580;
    }
    float _1582 = _1578;
    float _1584 = 0.0;
    if (_1355)
    {
        float _1586 = _1510 * 6.283185482025146484375;
        float _1588 = sin(_1586);
        _1584 = _1588;
    }
    float _1590 = _1584;
    float _1592 = _1265 * _1424;
    float _1594 = _1416;
    if (!_1466)
    {
        float _1596 = -_1582;
        float _1598 = _1329 + _1596;
        _1373 = _1598;
    }
    float _1600 = _1373;
    float _1602 = fma(_709, _1416, _1592);
    if (_1355)
    {
        float _1604 = _1546 + (-1.0);
        _1594 = _1604;
    }
    float _1606 = _1594;
    float _1608 = log2(_1474);
    float _1610 = _1265 * _1458;
    float _1612 = _1606;
    if (_1355)
    {
        float _1614 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1612 = _1614;
    }
    float _1616 = _1612;
    if (_1355)
    {
        float _1618 = fma(_1590, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1540 = _1618;
    }
    float _1620 = _1540;
    float _1622 = fma(_709, _1450, _1610);
    if (_1355)
    {
        float _1624 = fma(_1307, _1546, _1616);
        _1506 = _1624;
    }
    float _1626 = _1506;
    int _1628 = _1397 + 80;
    uint _1630 = uint(int(uint(_1628) >> uint(2)));
    uint _1632 = uint(int(uint(int(_1630)) >> uint(2)));
    int _1634 = int(_1630) & 3;
    float _1636 = (*spvDescriptorSet0.vp_c15)._m0[int(_1632)][_1634];
    int _1638 = int(_1630) + 1;
    uint _1640 = uint(int(uint(_1638) >> uint(2)));
    int _1642 = _1638 & 3;
    float _1644 = (*spvDescriptorSet0.vp_c15)._m0[int(_1640)][_1642];
    if (_1355)
    {
        float _1646 = _1462 * _1620;
        _1494 = _1646;
    }
    float _1648 = _1494;
    float _1650 = _1265 * _1492;
    if (!_1355)
    {
        _1548 = _1301;
    }
    float _1652 = _1548;
    float _1654 = _1652;
    if (_1355)
    {
        float _1656 = _1291 * _1648;
        _1375 = _1656;
    }
    float _1658 = _1375;
    float _1660 = fma(_709, _1484, _1650);
    if (_1355)
    {
        float _1662 = _1293 * _1648;
        _1377 = _1662;
    }
    float _1664 = _1377;
    int _1666 = _1397 + 72;
    uint _1668 = uint(int(uint(_1666) >> uint(2)));
    uint _1670 = uint(int(uint(int(_1668)) >> uint(2)));
    int _1672 = int(_1668) & 3;
    float _1674 = (*spvDescriptorSet0.vp_c15)._m0[int(_1670)][_1672];
    int _1676 = int(_1668) + 1;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    int _1680 = _1676 & 3;
    float _1682 = (*spvDescriptorSet0.vp_c15)._m0[int(_1678)][_1680];
    if (_1355)
    {
        float _1684 = _1658 * _1658;
        _1379 = _1684;
    }
    float _1686 = _1379;
    if (!_1466)
    {
        uint _1688 = uint(int(uint(_1516) >> uint(2)));
        _1381 = int(_1688);
    }
    int _1690 = _1381;
    int _1692 = _1690;
    if (_1355)
    {
        float _1694 = _1664 * _1664;
        _1654 = _1694;
    }
    float _1696 = _1654;
    float _1698 = fma(_1626, _1626, _1686);
    if (!_1466)
    {
        int _1700 = _1690 << 4;
        int _1702 = _1700 + _1576;
        _1692 = _1702;
    }
    int _1704 = _1692;
    float _1706 = fma(_779, _1526, _1622);
    int _1708 = _1397 + 88;
    uint _1710 = uint(int(uint(_1708) >> uint(2)));
    uint _1712 = uint(int(uint(int(_1710)) >> uint(2)));
    int _1714 = int(_1710) & 3;
    float _1716 = (*spvDescriptorSet0.vp_c15)._m0[int(_1712)][_1714];
    int _1718 = int(_1710) + 1;
    uint _1720 = uint(int(uint(_1718) >> uint(2)));
    int _1722 = _1718 & 3;
    float _1724 = (*spvDescriptorSet0.vp_c15)._m0[int(_1720)][_1722];
    float _1726 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1728 = _1698 + _1696;
    float _1730 = fma(_779, _1562, _1660);
    float _1732 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1734 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1726);
    float _1736 = rsqrt(_1728);
    float _1738 = _1730 + _1570;
    float _1740 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1732);
    float _1742 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1734);
    float _1744 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1746 = _1706 + _1534;
    float _1748 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1740);
    float _1750 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1752 = 1.0 / _1738;
    float _1754 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1744);
    float _1756 = _1748 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1758 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1762 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1760);
    float _1764 = precise::clamp(_1762, 0.0, 1.0);
    float _1766 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1754);
    float _1768 = _1728;
    if (!_1466)
    {
        int _1770 = _1704 + 400;
        uint _1772 = uint(int(uint(_1770) >> uint(2)));
        uint _1774 = uint(int(uint(int(_1772)) >> uint(2)));
        int _1776 = int(_1772) & 3;
        float _1778 = (*spvDescriptorSet0.vp_c15)._m0[int(_1774)][_1776];
        _1768 = _1778;
    }
    float _1780 = _1768;
    float _1782 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1758);
    float _1784 = _1736 * _1658;
    float _1786 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1788 = -_1764;
    float _1790 = _1788 + 1.0;
    float _1792 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1782);
    float _1794 = _1736 * _1626;
    float _1796 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1798 = _1736 * _1664;
    float _1800 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1792);
    float _1802 = _1746 * _1752;
    float _1804 = -_1796;
    float _1806 = fma(_1794, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1804);
    float _1808 = _1265 * _1644;
    float _1810 = abs(_1790);
    float _1812 = log2(_1810);
    float _1814 = _1608 * 0.693147182464599609375;
    bool _1816 = _1802 >= 0.0;
    float _1818 = fma(_709, _1636, _1808);
    float _1820 = -_1798;
    float _1822 = fma(_1820, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1806);
    bool _1824 = _1802 <= 1.0;
    bool _1826 = _1824 && _1816;
    float _1828 = fma(_779, _1674, _1602);
    float _1830 = fma(_1822, -0.5, 0.5);
    float _1832 = 1.0 / _1800;
    float _1834 = _1828 + _1682;
    float _1836 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1838 = _1834 * _1752;
    float _1840 = fma(_779, _1716, _1818);
    float _1842 = fma(_1822, 0.5, 0.5);
    float _1844 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _1846 = _1838 >= 0.0;
    bool _1848 = _1846 && _1826;
    float _1850 = sqrt(_1830);
    float _1852 = fma(_1842, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1854 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1856 = _1838 <= 1.0;
    bool _1858 = _1856 && _1848;
    float _1860 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1836);
    float _1862 = fma(_1842, _1852, -0.212114393711090087890625);
    float _1864 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1854);
    float _1866 = _1840 + _1724;
    float _1868 = exp2(_1844);
    float _1870 = fma(_1842, _1862, 1.570728778839111328125);
    float _1872 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1864);
    float _1874 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1860);
    float _1876 = _1794 + 1.0;
    float _1878 = _1866 * _1752;
    float _1880 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1872);
    float _1882 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1874);
    float _1884 = _1876;
    if (_1858)
    {
        float _1886 = float(_1389);
        _1430 = _1886;
    }
    float _1888 = _1430;
    float _1890 = _1746;
    if (!_1466)
    {
        float _1892 = floor(_1295);
        _1890 = _1892;
    }
    float _1894 = _1890;
    float _1896 = _1850 * 0.636619746685028076171875;
    float _1898 = _1882 * _1832;
    float _1900 = _1880 * _1832;
    float2 _5440 = float2(_1319, _1470);
    float _1902 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5440, float2(0.0), isnan(_5440)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5440, float2(0.0), isnan(_5440)), level(0.0)).x;
    float _1904 = -_1870;
    float _1906 = fma(_1896, _1904, 1.0);
    float _1908 = fma(_1898, 0.5, 0.5);
    float _1910 = -_1794;
    float _1912 = fma(_1868, _1876, _1910);
    float _1914 = _1872;
    if (_1858)
    {
        float _1916 = rint(_1888);
        float _1918 = precise::max(_1916, 0.0);
        uint _1920 = uint(_1918);
        uint _1922 = clamp(_1920, 0u, 65535u);
        _1914 = as_type<float>(_1922);
    }
    float _1924 = _1914;
    float _1926 = fma(_1900, -0.5, 0.5);
    float _1928 = fma(_1912, 0.5, 0.5);
    if (!_1466)
    {
        float _1930 = -_1894;
        float _1932 = _1295 + _1930;
        _1884 = _1932;
    }
    float _1934 = _1884;
    float _1936 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1938 = _1900;
    if (!_1466)
    {
        float _1940 = rint(_1780);
        float _1942 = precise::max(_1940, 0.0);
        uint _1944 = uint(_1942);
        uint _1946 = clamp(_1944, 0u, 65535u);
        _1938 = as_type<float>(_1946);
    }
    float _1948 = _1938;
    float _1950 = _1838;
    if (_1858)
    {
        float3 _5521 = float3(_1802, _1838, float(as_type<int>(_1924)));
        float3 _5525 = select(_5521, float3(0.0), isnan(_5521));
        float _1952 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5525.xy, uint(rint(_5525.z)), _1878, level(0.0));
        _1950 = _1952;
    }
    float _1954 = _1950;
    float3 _5535 = float3(_1908, _1926, _1936);
    float _1956 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5535, float3(0.0), isnan(_5535)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5535, float3(0.0), isnan(_5535)), level(0.0)).x;
    float3 _5544 = float3(_1908, _1926, _1936);
    float4 _1959 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5544, float3(0.0), isnan(_5544)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5544, float3(0.0), isnan(_5544)), level(0.0)).xyzw;
    float _1961 = _1959.x;
    float _1963 = _1959.y;
    float _1965 = _1959.z;
    float _1967 = _1959.w;
    float2 _5560 = float2(_1906, _1928);
    float3 _1971 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5560, float2(0.0), isnan(_5560)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5560, float2(0.0), isnan(_5560)), level(0.0)).xyz;
    float _1973 = _1971.x;
    float _1975 = _1971.y;
    float _1977 = _1971.z;
    float _1979 = _1600;
    if (!_1466)
    {
        float3 _5581 = float3(_1934, _1600, float(as_type<int>(_1948)));
        float3 _5583 = select(_5581, float3(0.0), isnan(_5581));
        float _1981 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5583.xy, uint(rint(_5583.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5583.xy, uint(rint(_5583.z)), level(0.0)).x;
        _1979 = _1981;
    }
    float _1983 = _1979;
    float _1985 = abs(_1325);
    float _1987 = log2(_1985);
    float _1989 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_88.x = _709;
    out.m_88.y = _951;
    out.m_88.z = _779;
    float _1991 = exp2(_1989);
    bool _1993 = _1325 <= 8000.0;
    bool _1995 = isnan(_1325);
    bool _1997 = _1993 || _1995;
    bool _1999 = isnan(8000.0);
    bool _2001 = _1997 || _1999;
    float _2003 = float(_2001);
    float _2005 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2007 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2009 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2007);
    float _2011 = exp2(_2005);
    float _2013 = -_1991;
    float _2015 = _2013 + 1.0;
    float _2017 = fma(_2011, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2019 = precise::clamp(_2017, 0.0, 1.0);
    float _2021 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2009);
    float _2023 = _1800 * 0.5;
    float _2025 = fma(_2019, -2.0, 3.0);
    float _2027 = _2019 * _2019;
    float _2029 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2021);
    float _2031 = _2027 * _2025;
    float _2033 = _2029 + _1800;
    float _2035 = _1882 + _1800;
    float _2037 = fma(_1880, -0.5, _2023);
    float _2039 = -_2031;
    float _2041 = _2039 + 1.0;
    float _2043 = _2033 * 0.5;
    float _2045 = _2035 * 0.5;
    out.gl_Position.x = _1882;
    out.gl_Position.y = _1880;
    out.gl_Position.z = _2029;
    out.gl_Position.w = _1800;
    float _2047 = fma(_2041, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2031);
    float _2049 = _2023;
    float _2051 = _2015;
    if (!_1858)
    {
        _2049 = 1.0;
    }
    float _2053 = _2049;
    out.m_90.x = _2045;
    out.m_90.y = _2037;
    out.m_90.z = _2043;
    out.m_90.w = _1800;
    float _2055 = _2003 * _2047;
    float _2057 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2059 = _2015 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2061 = _2053;
    if (_1466)
    {
        _2051 = 1.0;
    }
    float _2063 = _2051;
    float _2065 = -_1902;
    float _2067 = _2065 + 1.0;
    float _2069 = _2067 * _2057;
    float _2071 = precise::clamp(_2069, 0.0, 1.0);
    float _2073 = _2063;
    if (_1858)
    {
        bool _2075 = _1954 >= _1878;
        bool _2077 = isnan(_1954);
        bool _2079 = _2075 || _2077;
        bool _2081 = isnan(_1878);
        bool _2083 = _2079 || _2081;
        float _2085 = float(_2083);
        _2061 = _2085;
    }
    float _2087 = _2061;
    if (!_1466)
    {
        int _2089 = _1516 << 4;
        int _2091 = _2089 + 2048;
        uint _2093 = uint(int(uint(_2091) >> uint(2)));
        uint _2095 = uint(int(uint(int(_2093)) >> uint(2)));
        int _2097 = int(_2093) & 3;
        float _2099 = (*spvDescriptorSet0.vp_c15)._m0[int(_2095)][_2097];
        int _2101 = int(_2093) + 1;
        uint _2103 = uint(int(uint(_2101) >> uint(2)));
        int _2105 = _2101 & 3;
        float _2107 = (*spvDescriptorSet0.vp_c15)._m0[int(_2103)][_2105];
        int _2109 = _2091 + 8;
        uint _2111 = uint(int(uint(_2109) >> uint(2)));
        uint _2113 = uint(int(uint(int(_2111)) >> uint(2)));
        int _2115 = int(_2111) & 3;
        float _2117 = (*spvDescriptorSet0.vp_c15)._m0[int(_2113)][_2115];
        int _2119 = int(_2111) + 1;
        uint _2121 = uint(int(uint(_2119) >> uint(2)));
        int _2123 = _2119 & 3;
        float _2125 = (*spvDescriptorSet0.vp_c15)._m0[int(_2121)][_2123];
        float _2127 = _1265 * _2107;
        float _2129 = fma(_709, _2099, _2127);
        float _2131 = fma(_779, _2117, _2129);
        float _2133 = _2131 + _2125;
        float _2135 = precise::clamp(_2133, 0.0, 1.0);
        float _2137 = -_2135;
        float _2139 = _2137 + _1983;
        float _2141 = fma(_2139, 500.0, 1.5);
        float _2143 = exp2(_2141);
        float _2145 = 0.0 + _2143;
        float _2147 = precise::clamp(_2145, 0.0, 1.0);
        _2073 = _2147;
        _787 = _2131;
    }
    float _2149 = _2073;
    float _2151 = _787;
    float _2153 = _2059 * _1956;
    float _2155 = _2087 * _2149;
    float _2157 = -_2071;
    float _2159 = fma(_2157, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2161 = -_2059;
    float _2163 = _2161 + 1.0;
    float _2165 = _1967 * _2153;
    float _2167 = _1977 * _2153;
    float _2169 = -_2155;
    float _2171 = fma(_2169, _2159, 1.0);
    float _2173 = precise::clamp(_2171, 0.0, 1.0);
    float _2175 = _1967 * _2163;
    float _2177 = fma(_1973, _2165, _1961);
    float _2179 = fma(_1975, _2165, _1963);
    float _2181 = _2173 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2183 = fma(_1967, _2167, _1965);
    bool _2185 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2187 = isnan(_1502);
    bool _2189 = _2185 || _2187;
    bool _2191 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2193 = _2189 || _2191;
    out.m_92.x = _2181;
    out.m_94.x = _2177;
    out.m_94.y = _2179;
    out.m_94.z = _2183;
    out.m_94.w = _2175;
    float _2195 = _2151;
    float _2197 = _2173;
    float _2199 = _2153;
    if (!_2193)
    {
        _2195 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2201 = _2195;
    float _2203 = _2201;
    float _2205 = _2201;
    if (!_2193)
    {
        _2197 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2207 = _2197;
    float _2209 = _2207;
    float _2211 = _2207;
    if (!_2193)
    {
        _2199 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2213 = _2199;
    bool _2215 = !_2193;
    float _2217 = _2213;
    float _2219 = _2213;
    if (!_2215)
    {
        bool _2221 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2223 = isnan(_1502);
        bool _2225 = _2221 || _2223;
        bool _2227 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2229 = _2225 || _2227;
        if (!_2229)
        {
            float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2233 = _1502 + _2231;
            float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2237 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2235;
            float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2247 = 1.0 / _2237;
            float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2251 = _2249 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2253 = _2233 * _2247;
            float _2255 = precise::clamp(_2253, 0.0, 1.0);
            float _2257 = fma(_2255, _2241, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2259 = fma(_2255, _2245, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2261 = fma(_2255, _2251, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2211 = _2259;
            _2205 = _2257;
            _2219 = _2261;
            _2263 = true;
        }
        else
        {
            bool _2265 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2267 = isnan(_1502);
            bool _2269 = _2265 || _2267;
            bool _2271 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2273 = _2269 || _2271;
            if (!_2273)
            {
                _2203 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2275 = _2203;
            _2205 = _2275;
            if (!_2273)
            {
                _2209 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2277 = _2209;
            _2211 = _2277;
            if (!_2273)
            {
                _2217 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2279 = _2217;
            bool _2281 = !_2273;
            _2219 = _2279;
            if (!_2281)
            {
                bool _2283 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2285 = isnan(_1502);
                bool _2287 = _2283 || _2285;
                bool _2289 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2291 = _2287 || _2289;
                if (!_2291)
                {
                    float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2295 = _1502 + _2293;
                    float _2297 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2299 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2297;
                    float _2301 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2309 = 1.0 / _2299;
                    float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2313 = _2311 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2315 = _2295 * _2309;
                    float _2317 = precise::clamp(_2315, 0.0, 1.0);
                    float _2319 = fma(_2317, _2303, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2321 = fma(_2317, _2307, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2323 = fma(_2317, _2313, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2211 = _2321;
                    _2205 = _2319;
                    _2219 = _2323;
                    _2263 = true;
                }
                else
                {
                    _2211 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2205 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2219 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2263 = false;
    float _2325 = _2211;
    float _2327 = _2205;
    float _2329 = _2219;
    float _2331 = _2325 * 0.586610972881317138671875;
    bool _2333 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_96.x = 0.0;
    float _2335 = fma(_2327, 0.298911988735198974609375, _2331);
    float _2337 = fma(_2329, 0.114477999508380889892578125, _2335);
    float _2339 = -_2337;
    float _2341 = _2339 + _2327;
    float _2343 = -_2337;
    float _2345 = _2343 + _2325;
    float _2347 = -_2337;
    float _2349 = _2347 + _2329;
    float _2351 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2353 = fma(_2341, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2337);
    float _2355 = fma(_2345, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2337);
    float _2357 = fma(_2349, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2337);
    out.m_61.x = _2351;
    out.m_98.x = _2353;
    out.m_98.y = _2355;
    out.m_98.z = _2357;
    if (!_2333)
    {
        return out;
    }
    float _2359 = -_1217;
    float _2361 = _2359 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2363 = -_1219;
    float _2365 = _2363 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2367 = -_1221;
    float _2369 = _2367 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2371 = _2361 * _2361;
    float _2373 = fma(_2365, _2365, _2371);
    float _2375 = fma(_2369, _2369, _2373);
    float _2377 = sqrt(_2375);
    float _2379 = rsqrt(_2375);
    float _2381 = -_2377;
    float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2385 = _2383 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2387 = precise::clamp(_2385, 0.0, 1.0);
    float _2389 = _2365 * _2379;
    float _2391 = _2361 * _2379;
    float _2393 = abs(_2387);
    float _2395 = log2(_2393);
    float _2397 = _2369 * _2379;
    float _2399 = _2389 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2401 = _1121 * _2391;
    float _2403 = -_2391;
    float _2405 = -_2399;
    float _2407 = fma(_2403, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2405);
    float _2409 = fma(_1117, _2389, _2401);
    float _2411 = -_2397;
    float _2413 = fma(_2411, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2407);
    float _2415 = fma(_1123, _2397, _2409);
    float _2417 = precise::clamp(_2415, 0.0, 1.0);
    float _2419 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2421 = _2413 + _2419;
    float _2423 = _2395 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2425 = _2421 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2427 = precise::clamp(_2425, 0.0, 1.0);
    float _2429 = exp2(_2423);
    float _2431 = _2429 * _2427;
    float _2433 = _2417 * _2431;
    float _2435 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2437 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2439 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _2435;
    out.m_96.y = _2437;
    out.m_96.z = _2439;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2263 = false;
    bool _1169 = false;
    bool _533 = false;
    bool _435 = false;
    bool _331 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_58.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (!_121)
    {
        out.m_61.x = 0.0;
    }
    int _127 = 0;
    if (!_121)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2495 = as_type<float>(_131);
        out.gl_Position.z = _2495;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_63.w;
    float _137 = float(_117);
    float _139 = 1.0 / _137;
    float _141 = -_135;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_135);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = _143 * _139;
    bool _157 = _143 >= _137;
    bool _159 = !_153;
    bool _161 = _157 || _159;
    out.m_65.x = _155;
    float _163 = _135;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_61.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2566 = as_type<float>(_169);
        out.gl_Position.z = _2566;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = in.m_70.w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_63.x;
    float _189 = in.m_63.y;
    float _191 = in.m_63.z;
    float _193 = in.m_58.x;
    float _195 = in.m_58.y;
    float _197 = in.m_58.z;
    float _199 = 0.0;
    float _201 = _173;
    if (!_185)
    {
        float _203 = _173 * _173;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    float _209 = _207;
    if (!_185)
    {
        float _211 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _211;
    }
    float _213 = _209;
    int _215 = as_type<int>(_171) & 1;
    bool _217 = _215 != 0;
    int _219 = as_type<int>(_171) & 2;
    bool _221 = _219 != 0;
    bool _223 = !_217;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_221;
    float _229 = _227 ? (-0.5) : 0.5;
    bool _231 = !_185;
    float _233 = _213;
    if (!_231)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = _173 * _237;
        float _247 = 1.0 / _241;
        float _249 = _243 * 0.693147182464599609375;
        float _251 = exp2(_245);
        float _253 = 1.0 / _249;
        float _255 = _251 + (-1.0);
        float _257 = -_255;
        float _259 = fma(_257, _253, _173);
        float _261 = _259 * _247;
        float _263 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _263;
    }
    float _265 = _233;
    bool _267 = !_185;
    if (!_267)
    {
        float _269 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = log2(_269);
        float _273 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _275 = _273 + 1.0;
        float _277 = 1.0 / _275;
        float _279 = _173 * _271;
        float _281 = exp2(_279);
        float _283 = -_281;
        float _285 = _283 + 1.0;
        float _287 = _285 * _277;
        _201 = _287;
    }
    float _289 = _201;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _293 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _295 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _297 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _299 = fma(_289, _187, _293);
    float _301 = fma(_289, _189, _295);
    float _303 = fma(_289, _191, _297);
    float _305 = fma(_299, _175, _193);
    float _307 = fma(_301, _175, _195);
    float _309 = fma(_303, _175, _197);
    bool _311 = !_291;
    float _329;
    if (!_311)
    {
        float _313 = in.m_72.x;
        float _315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _317 = _313 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _321 = _319 * _315;
        float _323 = floor(_321);
        float _325 = -_323;
        float _327 = _321 + _325;
        _329 = _327;
        _331 = true;
    }
    else
    {
        _329 = _155;
    }
    _331 = false;
    float _333 = _329;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = _333 + _335;
    float _339 = in.m_70.x;
    float _341 = in.m_70.y;
    bool _343 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _345 = isnan(_333);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _355;
    bool _359 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _361 = isnan(_333);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = -_353;
    float _373 = _371 + 1.0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = 1.0 / _357;
    bool _381 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _383 = _369 * _373;
    float _385 = -_369;
    float _387 = _385 + 1.0;
    float _389 = _337 * _379;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _391;
    float _395 = fma(_377, _389, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _397 = fma(_393, _389, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = _395 * _383;
    float _401 = _397 * _383;
    float _403 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[143].x, _399);
    float _405 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[143].y, _401);
    float _407 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[144].x, _403);
    float _409 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[144].y, _405);
    float _411 = _407 * _339;
    float _413 = _409 * _341;
    bool _415 = !_381;
    float _433;
    if (!_415)
    {
        float _417 = in.m_72.x;
        float _419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _421 = _417 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _425 = _423 * _419;
        float _427 = floor(_425);
        float _429 = -_427;
        float _431 = _425 + _429;
        _433 = _431;
        _435 = true;
    }
    else
    {
        _433 = _155;
    }
    _435 = false;
    float _437 = _433;
    bool _439 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = isnan(_437);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _455 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _457 = isnan(_437);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _473 = _437 + _471;
    float _475 = -_449;
    float _477 = _475 + 1.0;
    float _479 = 1.0 / _453;
    bool _481 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _483 = _465 * _477;
    float _485 = -_465;
    float _487 = _485 + 1.0;
    float _489 = _469 * _479;
    float _491 = fma(_489, _473, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _493 = _491 * _483;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _499 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[115].x, _493);
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _503 = _495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _505 = _497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _507 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[116].x, _499);
    float _509 = _501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _511 = _507 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_74.x = _503;
    out.m_74.y = _505;
    out.m_74.z = _509;
    out.m_74.w = _511;
    bool _513 = !_481;
    float _531;
    if (!_513)
    {
        float _515 = in.m_72.x;
        float _517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _519 = _515 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _523 = _521 * _517;
        float _525 = floor(_523);
        float _527 = -_525;
        float _529 = _523 + _527;
        _531 = _529;
        _533 = true;
    }
    else
    {
        _531 = _155;
    }
    _533 = false;
    float _535 = _531;
    float _537 = in.m_76.x;
    float _539 = in.m_76.y;
    float _541 = in.m_76.z;
    float _543 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _545 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _225);
    float _547 = in.m_78.x;
    float _549 = in.m_78.y;
    float _551 = in.m_78.z;
    float _553 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _555 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _229);
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _559 = _557 != 0;
    float _561 = in.m_80.x;
    float _563 = in.m_80.y;
    float _565 = in.m_80.z;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _569 = _567 != 0;
    float _571 = _553 * _555;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _575 = _573 != 0;
    float _577 = in.m_72.x;
    float _579 = in.m_72.y;
    float _581 = in.m_72.z;
    float _583 = in.m_72.w;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _587 = _585 != 0;
    float _589 = _543 * _545;
    float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _593 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _595 = isnan(_535);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _607 = _307 * _539;
    float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _611 = _307 * _549;
    float _613 = fma(_305, _537, _607);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _619 = fma(_305, _547, _611);
    float _621 = _307 * _563;
    float _623 = 1.0 / _617;
    bool _625 = _583 > 0.5;
    float _627 = fma(_305, _561, _621);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _633 = _577 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _637 = _635 != 0;
    float _639 = 1.0 / _631;
    float _641 = _579 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _645 = -_605;
    float _647 = fma(_633, 2.0, _645);
    float _649 = _229 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _651 = _577 > 0.5;
    float _653 = fma(_641, -2.0, _643);
    float _655 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _657 = _649 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _659 = _649 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _661 = _649 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _663 = fma(_309, _551, _619);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _669 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[24].x, _657);
    float _671 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[25].x, _659);
    float _673 = fma(_309, _541, _613);
    float _675 = fma(_309, _565, _627);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _677;
    float _681 = -_225;
    int _683 = _651 ? as_type<int>(_681) : as_type<int>(_225);
    float _685 = _667 * _623;
    bool _687 = _581 > 0.5;
    float _689 = _679 * _639;
    float _691 = _571 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _693 = -_229;
    int _695 = _625 ? as_type<int>(_693) : as_type<int>(_229);
    float _697 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[26].x, _661);
    bool _699 = _579 > 0.5;
    float _701 = _571 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _703 = _571 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _705 = -_225;
    float _707 = _687 ? _705 : _225;
    float _709 = _673 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _711 = !_559;
    float _713 = _711 ? _225 : as_type<float>(_683);
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _717 = -_229;
    int _719 = _699 ? as_type<int>(_717) : as_type<int>(_229);
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _723 = !_575;
    float _725 = _723 ? _225 : _707;
    float _727 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[78].z, _715);
    float _729 = _707;
    float _731 = _577;
    float _733 = _581;
    float _735 = _725;
    float _737 = _671;
    if (!_637)
    {
        _729 = _579;
    }
    float _739 = _729;
    float _741 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[24].x, _691);
    float _743 = 0.0;
    float _745 = _739;
    if (!_637)
    {
        _743 = _579;
    }
    float _747 = _743;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _751 = _535 + _749;
    float _753 = _747;
    if (_637)
    {
        _745 = _577;
    }
    float _755 = _745;
    float _757 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[78].w, _721);
    if (_637)
    {
        _753 = _577;
    }
    float _759 = _753;
    float _761 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[26].x, _703);
    bool _763 = !_569;
    float _765 = _763 ? _229 : as_type<float>(_719);
    float _767 = fma(_689, _751, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _769 = 0.0;
    if (!_637)
    {
        _769 = _581;
    }
    float _771 = _769;
    float _773 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _775 = _771;
    if (_637)
    {
        _731 = _581;
    }
    float _777 = _731;
    float _779 = _675 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _781 = !_587;
    float _783 = _781 ? _229 : as_type<float>(_695);
    float _785 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[25].x, _701);
    float _787 = _779;
    if (_637)
    {
        _775 = _579;
    }
    float _789 = _775;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _793 = _535 + _791;
    if (_637)
    {
        _733 = _579;
    }
    float _795 = _733;
    float _797 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[24].z, _741);
    float _799 = fma(_685, _793, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _801 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[26].z, _761);
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _805 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _807 = isnan(_535);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _819 = _801 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _821 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[84].z, _803);
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _825 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[83].z, _817);
    float _827 = _797 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _829 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[84].x, _821);
    float _831 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[83].w, _823);
    float _833 = _779 + _819;
    float _835 = _709 + _827;
    float _837 = _829 * (-0.15915493667125701904296875);
    float _839 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[25].z, _785);
    float _841 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _843 = _833 + _841;
    float _845 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _847 = _835 + _845;
    bool _849 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _851 = isnan(_535);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -_815;
    float _863 = _861 + 1.0;
    float _865 = _843 * _843;
    float _867 = _847 * _847;
    float _869 = _837 * 6.283185482025146484375;
    float _871 = sin(_869);
    float _873 = _859 * _863;
    float _875 = -_859;
    float _877 = _875 + 1.0;
    float _879 = _867 + _865;
    float _881 = _591 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _883 = -_143;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[76].x, _647);
    float _887 = _603 * _877;
    float _889 = _713 + 0.5;
    float _891 = sqrt(_879);
    float _893 = -_603;
    float _895 = _893 + 1.0;
    float _897 = _767 * _887;
    float _899 = fma(_881, _889, _885);
    float _901 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _653);
    float _903 = _609 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _907 = _765 + (-0.5);
    float _909 = _837 * 6.283185482025146484375;
    float _911 = cos(_909);
    float _913 = _755 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _915 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[131].x, _897);
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _919 = _789 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _921 = -_903;
    float _923 = -_901;
    float _925 = fma(_921, _907, _923);
    float _927 = -_905;
    float _929 = fma(_913, 2.0, _927);
    float _931 = fma(_799, _873, _915);
    bool _933 = _891 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _935 = fma(_919, -2.0, _917);
    float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _939 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _727);
    float _941 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _757);
    float _943 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _825);
    float _945 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _831);
    float _947 = -_143;
    float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[81].x, _929);
    float _951 = _663 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _953 = _839 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _957 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _935);
    float _959 = _783 * _911;
    float _961 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[133].x, _931);
    float _963 = _783 * _871;
    float _965 = _951 + _953;
    float _967 = fma(_725, _871, _959);
    float _969 = _959;
    float _971 = _865;
    float _973 = _867;
    float _975 = _839;
    float _977 = _911;
    if (!_933)
    {
        _969 = _865;
    }
    float _979 = _969;
    float _981 = -_963;
    float _983 = fma(_725, _911, _981);
    float _985 = _979;
    if (!_933)
    {
        _971 = _867;
    }
    float _987 = _971;
    float _989 = _987;
    if (!_933)
    {
        _735 = _835;
    }
    float _991 = _735;
    float _993 = _991;
    if (!_933)
    {
        _973 = _833;
    }
    float _995 = _973;
    float _997 = _995;
    if (!_933)
    {
        _975 = _965;
    }
    float _999 = _975;
    bool _1001 = !_933;
    float _1003 = _999;
    if (!_1001)
    {
        float _1005 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1009 = _891 + _1007;
        float _1011 = _965 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1013 = rsqrt(_879);
        float _1015 = _1009 * _1005;
        float _1017 = _1015 * 0.15915493667125701904296875;
        float _1019 = _1017 * 6.283185482025146484375;
        float _1021 = sin(_1019);
        float _1023 = _1017 * 6.283185482025146484375;
        float _1025 = cos(_1023);
        float _1027 = fma(_1021, _1011, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1029 = _1013 * _1027;
        float _1031 = _1025 + (-1.0);
        float _1033 = fma(_847, _1029, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1035 = fma(_843, _1029, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1037 = _1031 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1039 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1041 = _1033 + _1039;
        float _1043 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1045 = _1035 + _1043;
        float _1047 = fma(_965, _1025, _1037);
        float _1049 = _1041 * _1041;
        float _1051 = _1045 * _1045;
        _1003 = _1047;
        _989 = _1049;
        _985 = _1051;
        _993 = _1033;
        _997 = _1035;
    }
    float _1053 = _1003;
    float _1055 = _989;
    float _1057 = _985;
    float _1059 = _993;
    float _1061 = _997;
    float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1065 = _1053 + _1063;
    float _1067 = _937 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1069 = _955 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1071 = _967 + (-0.5);
    float _1073 = fma(_1065, _1065, _1055);
    float _1075 = _983 + 0.5;
    float _1077 = -_943;
    float _1079 = _1077 + 1.0;
    float _1081 = -_1067;
    float _1083 = -_957;
    float _1085 = fma(_1081, _1071, _1083);
    float _1087 = _1073 + _1057;
    float _1089 = fma(_1069, _1075, _949);
    float _1091 = -_945;
    float _1093 = _1091 + 1.0;
    float _1095 = -_939;
    float _1097 = _1095 + 1.0;
    float _1099 = -_941;
    float _1101 = _1099 + 1.0;
    float _1103 = -_1079;
    float _1105 = fma(_983, _1103, _1089);
    float _1107 = sqrt(_1087);
    float _1109 = fma(_967, _1093, _1085);
    float _1111 = -_1097;
    float _1113 = fma(_713, _1111, _899);
    float _1115 = fma(_765, _1101, _925);
    float _1117 = _669 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1119 = _961 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1121 = _671 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1123 = _697 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_82.x = _1113;
    out.m_82.y = _1115;
    out.m_82.z = _1105;
    out.m_82.w = _1109;
    out.m_84.w = _1119;
    out.m_86.x = _1117;
    out.m_86.y = _1121;
    out.m_86.z = _1123;
    bool _1125 = _1107 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1127 = isnan(_1107);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1133 = _1129 || _1131;
    if (!_1133)
    {
        _737 = 1.0;
    }
    float _1135 = _737;
    bool _1137 = !_1133;
    float _1139 = _1135;
    if (!_1137)
    {
        bool _1141 = _1107 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1143 = isnan(_1107);
        bool _1145 = _1141 || _1143;
        bool _1147 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1149 = _1145 || _1147;
        if (!_1149)
        {
            float _1151 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1153 = _1107 + _1151;
            float _1155 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1157 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1155;
            float _1159 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1161 = _1159 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1163 = 1.0 / _1157;
            float _1165 = _1153 * _1163;
            float _1167 = fma(_1165, _1161, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1139 = _1167;
            _1169 = true;
        }
        else
        {
            bool _1171 = _1107 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1173 = isnan(_1107);
            bool _1175 = _1171 || _1173;
            bool _1177 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1179 = _1175 || _1177;
            if (!_1179)
            {
                float _1181 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1183 = _1107 + _1181;
                float _1185 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1187 = _1185 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1189 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1191 = _1189 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1193 = 1.0 / _1187;
                float _1195 = _1183 * _1193;
                float _1197 = fma(_1195, _1191, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1139 = _1197;
                _1169 = true;
            }
            else
            {
                _1139 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1169 = false;
    float _1199 = _1139;
    float _1201 = _951 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1203 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1205 = _1053 + _1203;
    float _1207 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1209 = _1059 + _1207;
    float _1211 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1213 = _1061 + _1211;
    float _1215 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1201);
    float _1217 = fma(_1205, _1199, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1219 = fma(_1209, _1199, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1221 = fma(_1213, _1199, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1223 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1215);
    float _1225 = _951 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1229 = _1217 + _1227;
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1233 = _1219 + _1231;
    float _1235 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1237 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1225);
    float _1239 = _1229 * _1229;
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1243 = _1221 + _1241;
    float _1245 = 1.0 / _1235;
    float _1247 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1237);
    float _1249 = fma(_1233, _1233, _1239);
    float _1251 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1253 = fma(_1243, _1243, _1249);
    float _1255 = _1251 + _1235;
    float _1257 = rsqrt(_1253);
    float _1259 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1261 = _1255 * _1245;
    float _1263 = _1261 * 0.5;
    float _1265 = _951 + _1259;
    float _1267 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1271 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1269);
    float _1273 = _1265 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1275 = floor(_1267);
    float _1277 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1279 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1281 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1273);
    float _1283 = _1257 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1285 = precise::max(0.0, _1277);
    float _1287 = fma(_779, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1281);
    float _1289 = 1.0 / _1271;
    float _1291 = _1233 * _1283;
    float _1293 = _1243 * _1283;
    float _1295 = _1287 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1297 = _1265 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1299 = _1291 * _1291;
    float _1301 = _1293 * _1293;
    float _1303 = -_1283;
    float _1305 = -_1285;
    float _1307 = fma(_1229, _1303, _1305);
    float _1309 = fma(_709, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1297);
    float _1311 = trunc(_1295);
    int _1313 = int(_1311);
    float _1315 = _1299 + _1301;
    float _1317 = -_1275;
    float _1319 = _1267 + _1317;
    float _1321 = fma(_779, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1309);
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1325 = _1289 * _1323;
    float _1327 = sqrt(_1315);
    float _1329 = _1321 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1331 = _1325 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1333 = _1325 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1335 = fma(_779, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _1337 = !_1331;
    int _1339 = _1337 ? 0 : 1;
    float _1341 = trunc(_1329);
    int _1343 = int(_1341);
    int _1345 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1347 = _1313 + _1345;
    int _1349 = _1347 + 1;
    float _1351 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1353 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1351);
    bool _1355 = _1327 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = _1327 + _1357;
    int _1361 = 2;
    float _1363 = _1275;
    float _1365 = _1359;
    float _1367 = _1315;
    int _1369 = as_type<int>(_1229);
    int _1371 = _1349;
    float _1373 = _1329;
    float _1375 = _1291;
    float _1377 = _1293;
    float _1379 = _1299;
    int _1381 = as_type<int>(_1301);
    if (!_1331)
    {
        _1361 = 1;
    }
    int _1383 = _1361;
    float _1385 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1353);
    int _1387 = _1383;
    if (!_1333)
    {
        _1387 = _1339;
    }
    int _1389 = _1387;
    float _1391 = floor(_1335);
    bool _1393 = _1349 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1395 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1397 = _1389 << 6;
    int _1399 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1401 = _1343 + _1399;
    int _1403 = _1401 + 1;
    float _1405 = _1395 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _1407 = _1397 + 64;
    uint _1410 = uint(int(uint(_1407) >> uint(2)));
    uint _1412 = uint(int(uint(int(_1410)) >> uint(2)));
    int _1414 = int(_1410) & 3;
    float _1416 = (*spvDescriptorSet0.vp_c15)._m0[int(_1412)][_1414];
    int _1418 = int(_1410) + 1;
    uint _1420 = uint(int(uint(_1418) >> uint(2)));
    int _1422 = _1418 & 3;
    float _1424 = (*spvDescriptorSet0.vp_c15)._m0[int(_1420)][_1422];
    float _1426 = _1115;
    float _1428 = as_type<float>(_1403);
    float _1430 = as_type<float>(_1389);
    if (_1355)
    {
        float _1432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1426 = _1432;
    }
    float _1434 = _1426;
    int _1436 = _1349 | _1403;
    bool _1438 = _1436 < 0;
    bool _1440 = _1438 || _1393;
    int _1442 = _1397 + 48;
    uint _1444 = uint(int(uint(_1442) >> uint(2)));
    uint _1446 = uint(int(uint(int(_1444)) >> uint(2)));
    int _1448 = int(_1444) & 3;
    float _1450 = (*spvDescriptorSet0.vp_c15)._m0[int(_1446)][_1448];
    int _1452 = int(_1444) + 1;
    uint _1454 = uint(int(uint(_1452) >> uint(2)));
    int _1456 = _1452 & 3;
    float _1458 = (*spvDescriptorSet0.vp_c15)._m0[int(_1454)][_1456];
    if (_1355)
    {
        float _1460 = rsqrt(_1315);
        _1363 = _1460;
    }
    float _1462 = _1363;
    bool _1464 = _1403 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1466 = _1464 || _1440;
    float _1468 = -_1391;
    float _1470 = _1335 + _1468;
    float _1472 = -_1405;
    float _1474 = fma(_1472, _1279, 1.0);
    int _1476 = _1397 + 96;
    uint _1478 = uint(int(uint(_1476) >> uint(2)));
    uint _1480 = uint(int(uint(int(_1478)) >> uint(2)));
    int _1482 = int(_1478) & 3;
    float _1484 = (*spvDescriptorSet0.vp_c15)._m0[int(_1480)][_1482];
    int _1486 = int(_1478) + 1;
    uint _1488 = uint(int(uint(_1486) >> uint(2)));
    int _1490 = _1486 & 3;
    float _1492 = (*spvDescriptorSet0.vp_c15)._m0[int(_1488)][_1490];
    float _1494 = _1462;
    if (_1355)
    {
        float _1496 = _1359 * _1434;
        _1365 = _1496;
    }
    float _1498 = _1365;
    if (!_1355)
    {
        _1367 = _1307;
    }
    float _1500 = _1367;
    float _1502 = sqrt(_1253);
    float _1504 = 0.0;
    float _1506 = _1500;
    if (_1355)
    {
        float _1508 = _1498 * 0.15915493667125701904296875;
        _1504 = _1508;
    }
    float _1510 = _1504;
    if (!_1466)
    {
        int _1512 = _1403 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1514 = _1512 + _1349;
        _1369 = _1514;
    }
    int _1516 = _1369;
    int _1518 = _1397 + 56;
    uint _1520 = uint(int(uint(_1518) >> uint(2)));
    uint _1522 = uint(int(uint(int(_1520)) >> uint(2)));
    int _1524 = int(_1520) & 3;
    float _1526 = (*spvDescriptorSet0.vp_c15)._m0[int(_1522)][_1524];
    int _1528 = int(_1520) + 1;
    uint _1530 = uint(int(uint(_1528) >> uint(2)));
    int _1532 = _1528 & 3;
    float _1534 = (*spvDescriptorSet0.vp_c15)._m0[int(_1530)][_1532];
    if (_1355)
    {
        float _1536 = _1307 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1428 = _1536;
    }
    float _1538 = _1428;
    float _1540 = _1538;
    if (_1355)
    {
        float _1542 = _1510 * 6.283185482025146484375;
        float _1544 = cos(_1542);
        _977 = _1544;
    }
    float _1546 = _977;
    float _1548 = _1546;
    if (!_1466)
    {
        int _1550 = _1516 << 2;
        _1371 = _1550;
    }
    int _1552 = _1371;
    int _1554 = _1397 + 104;
    uint _1556 = uint(int(uint(_1554) >> uint(2)));
    uint _1558 = uint(int(uint(int(_1556)) >> uint(2)));
    int _1560 = int(_1556) & 3;
    float _1562 = (*spvDescriptorSet0.vp_c15)._m0[int(_1558)][_1560];
    int _1564 = int(_1556) + 1;
    uint _1566 = uint(int(uint(_1564) >> uint(2)));
    int _1568 = _1564 & 3;
    float _1570 = (*spvDescriptorSet0.vp_c15)._m0[int(_1566)][_1568];
    int _1572 = _1552;
    if (!_1466)
    {
        int _1574 = 12 & _1552;
        _1572 = _1574;
    }
    int _1576 = _1572;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1466)
    {
        float _1580 = floor(_1329);
        _1578 = _1580;
    }
    float _1582 = _1578;
    float _1584 = 0.0;
    if (_1355)
    {
        float _1586 = _1510 * 6.283185482025146484375;
        float _1588 = sin(_1586);
        _1584 = _1588;
    }
    float _1590 = _1584;
    float _1592 = _1265 * _1424;
    float _1594 = _1416;
    if (!_1466)
    {
        float _1596 = -_1582;
        float _1598 = _1329 + _1596;
        _1373 = _1598;
    }
    float _1600 = _1373;
    float _1602 = fma(_709, _1416, _1592);
    if (_1355)
    {
        float _1604 = _1546 + (-1.0);
        _1594 = _1604;
    }
    float _1606 = _1594;
    float _1608 = log2(_1474);
    float _1610 = _1265 * _1458;
    float _1612 = _1606;
    if (_1355)
    {
        float _1614 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1612 = _1614;
    }
    float _1616 = _1612;
    if (_1355)
    {
        float _1618 = fma(_1590, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1540 = _1618;
    }
    float _1620 = _1540;
    float _1622 = fma(_709, _1450, _1610);
    if (_1355)
    {
        float _1624 = fma(_1307, _1546, _1616);
        _1506 = _1624;
    }
    float _1626 = _1506;
    int _1628 = _1397 + 80;
    uint _1630 = uint(int(uint(_1628) >> uint(2)));
    uint _1632 = uint(int(uint(int(_1630)) >> uint(2)));
    int _1634 = int(_1630) & 3;
    float _1636 = (*spvDescriptorSet0.vp_c15)._m0[int(_1632)][_1634];
    int _1638 = int(_1630) + 1;
    uint _1640 = uint(int(uint(_1638) >> uint(2)));
    int _1642 = _1638 & 3;
    float _1644 = (*spvDescriptorSet0.vp_c15)._m0[int(_1640)][_1642];
    if (_1355)
    {
        float _1646 = _1462 * _1620;
        _1494 = _1646;
    }
    float _1648 = _1494;
    float _1650 = _1265 * _1492;
    if (!_1355)
    {
        _1548 = _1301;
    }
    float _1652 = _1548;
    float _1654 = _1652;
    if (_1355)
    {
        float _1656 = _1291 * _1648;
        _1375 = _1656;
    }
    float _1658 = _1375;
    float _1660 = fma(_709, _1484, _1650);
    if (_1355)
    {
        float _1662 = _1293 * _1648;
        _1377 = _1662;
    }
    float _1664 = _1377;
    int _1666 = _1397 + 72;
    uint _1668 = uint(int(uint(_1666) >> uint(2)));
    uint _1670 = uint(int(uint(int(_1668)) >> uint(2)));
    int _1672 = int(_1668) & 3;
    float _1674 = (*spvDescriptorSet0.vp_c15)._m0[int(_1670)][_1672];
    int _1676 = int(_1668) + 1;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    int _1680 = _1676 & 3;
    float _1682 = (*spvDescriptorSet0.vp_c15)._m0[int(_1678)][_1680];
    if (_1355)
    {
        float _1684 = _1658 * _1658;
        _1379 = _1684;
    }
    float _1686 = _1379;
    if (!_1466)
    {
        uint _1688 = uint(int(uint(_1516) >> uint(2)));
        _1381 = int(_1688);
    }
    int _1690 = _1381;
    int _1692 = _1690;
    if (_1355)
    {
        float _1694 = _1664 * _1664;
        _1654 = _1694;
    }
    float _1696 = _1654;
    float _1698 = fma(_1626, _1626, _1686);
    if (!_1466)
    {
        int _1700 = _1690 << 4;
        int _1702 = _1700 + _1576;
        _1692 = _1702;
    }
    int _1704 = _1692;
    float _1706 = fma(_779, _1526, _1622);
    int _1708 = _1397 + 88;
    uint _1710 = uint(int(uint(_1708) >> uint(2)));
    uint _1712 = uint(int(uint(int(_1710)) >> uint(2)));
    int _1714 = int(_1710) & 3;
    float _1716 = (*spvDescriptorSet0.vp_c15)._m0[int(_1712)][_1714];
    int _1718 = int(_1710) + 1;
    uint _1720 = uint(int(uint(_1718) >> uint(2)));
    int _1722 = _1718 & 3;
    float _1724 = (*spvDescriptorSet0.vp_c15)._m0[int(_1720)][_1722];
    float _1726 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1728 = _1698 + _1696;
    float _1730 = fma(_779, _1562, _1660);
    float _1732 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1734 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1726);
    float _1736 = rsqrt(_1728);
    float _1738 = _1730 + _1570;
    float _1740 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1732);
    float _1742 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1734);
    float _1744 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1746 = _1706 + _1534;
    float _1748 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1740);
    float _1750 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1752 = 1.0 / _1738;
    float _1754 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1744);
    float _1756 = _1748 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1758 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1762 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1760);
    float _1764 = precise::clamp(_1762, 0.0, 1.0);
    float _1766 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1754);
    float _1768 = _1728;
    if (!_1466)
    {
        int _1770 = _1704 + 400;
        uint _1772 = uint(int(uint(_1770) >> uint(2)));
        uint _1774 = uint(int(uint(int(_1772)) >> uint(2)));
        int _1776 = int(_1772) & 3;
        float _1778 = (*spvDescriptorSet0.vp_c15)._m0[int(_1774)][_1776];
        _1768 = _1778;
    }
    float _1780 = _1768;
    float _1782 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1758);
    float _1784 = _1736 * _1658;
    float _1786 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1788 = -_1764;
    float _1790 = _1788 + 1.0;
    float _1792 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1782);
    float _1794 = _1736 * _1626;
    float _1796 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1798 = _1736 * _1664;
    float _1800 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1792);
    float _1802 = _1746 * _1752;
    float _1804 = -_1796;
    float _1806 = fma(_1794, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1804);
    float _1808 = _1265 * _1644;
    float _1810 = abs(_1790);
    float _1812 = log2(_1810);
    float _1814 = _1608 * 0.693147182464599609375;
    bool _1816 = _1802 >= 0.0;
    float _1818 = fma(_709, _1636, _1808);
    float _1820 = -_1798;
    float _1822 = fma(_1820, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1806);
    bool _1824 = _1802 <= 1.0;
    bool _1826 = _1824 && _1816;
    float _1828 = fma(_779, _1674, _1602);
    float _1830 = fma(_1822, -0.5, 0.5);
    float _1832 = 1.0 / _1800;
    float _1834 = _1828 + _1682;
    float _1836 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1838 = _1834 * _1752;
    float _1840 = fma(_779, _1716, _1818);
    float _1842 = fma(_1822, 0.5, 0.5);
    float _1844 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _1846 = _1838 >= 0.0;
    bool _1848 = _1846 && _1826;
    float _1850 = sqrt(_1830);
    float _1852 = fma(_1842, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1854 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1856 = _1838 <= 1.0;
    bool _1858 = _1856 && _1848;
    float _1860 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1836);
    float _1862 = fma(_1842, _1852, -0.212114393711090087890625);
    float _1864 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1854);
    float _1866 = _1840 + _1724;
    float _1868 = exp2(_1844);
    float _1870 = fma(_1842, _1862, 1.570728778839111328125);
    float _1872 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1864);
    float _1874 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1860);
    float _1876 = _1794 + 1.0;
    float _1878 = _1866 * _1752;
    float _1880 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1872);
    float _1882 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1874);
    float _1884 = _1876;
    if (_1858)
    {
        float _1886 = float(_1389);
        _1430 = _1886;
    }
    float _1888 = _1430;
    float _1890 = _1746;
    if (!_1466)
    {
        float _1892 = floor(_1295);
        _1890 = _1892;
    }
    float _1894 = _1890;
    float _1896 = _1850 * 0.636619746685028076171875;
    float _1898 = _1882 * _1832;
    float _1900 = _1880 * _1832;
    float2 _5440 = float2(_1319, _1470);
    float _1902 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5440, float2(0.0), isnan(_5440)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5440, float2(0.0), isnan(_5440)), level(0.0)).x;
    float _1904 = -_1870;
    float _1906 = fma(_1896, _1904, 1.0);
    float _1908 = fma(_1898, 0.5, 0.5);
    float _1910 = -_1794;
    float _1912 = fma(_1868, _1876, _1910);
    float _1914 = _1872;
    if (_1858)
    {
        float _1916 = rint(_1888);
        float _1918 = precise::max(_1916, 0.0);
        uint _1920 = uint(_1918);
        uint _1922 = clamp(_1920, 0u, 65535u);
        _1914 = as_type<float>(_1922);
    }
    float _1924 = _1914;
    float _1926 = fma(_1900, -0.5, 0.5);
    float _1928 = fma(_1912, 0.5, 0.5);
    if (!_1466)
    {
        float _1930 = -_1894;
        float _1932 = _1295 + _1930;
        _1884 = _1932;
    }
    float _1934 = _1884;
    float _1936 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1938 = _1900;
    if (!_1466)
    {
        float _1940 = rint(_1780);
        float _1942 = precise::max(_1940, 0.0);
        uint _1944 = uint(_1942);
        uint _1946 = clamp(_1944, 0u, 65535u);
        _1938 = as_type<float>(_1946);
    }
    float _1948 = _1938;
    float _1950 = _1838;
    if (_1858)
    {
        float3 _5521 = float3(_1802, _1838, float(as_type<int>(_1924)));
        float3 _5525 = select(_5521, float3(0.0), isnan(_5521));
        float _1952 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5525.xy, uint(rint(_5525.z)), _1878, level(0.0));
        _1950 = _1952;
    }
    float _1954 = _1950;
    float3 _5535 = float3(_1908, _1926, _1936);
    float _1956 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5535, float3(0.0), isnan(_5535)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5535, float3(0.0), isnan(_5535)), level(0.0)).x;
    float3 _5544 = float3(_1908, _1926, _1936);
    float4 _1959 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5544, float3(0.0), isnan(_5544)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5544, float3(0.0), isnan(_5544)), level(0.0)).xyzw;
    float _1961 = _1959.x;
    float _1963 = _1959.y;
    float _1965 = _1959.z;
    float _1967 = _1959.w;
    float2 _5560 = float2(_1906, _1928);
    float3 _1971 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5560, float2(0.0), isnan(_5560)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5560, float2(0.0), isnan(_5560)), level(0.0)).xyz;
    float _1973 = _1971.x;
    float _1975 = _1971.y;
    float _1977 = _1971.z;
    float _1979 = _1600;
    if (!_1466)
    {
        float3 _5581 = float3(_1934, _1600, float(as_type<int>(_1948)));
        float3 _5583 = select(_5581, float3(0.0), isnan(_5581));
        float _1981 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5583.xy, uint(rint(_5583.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5583.xy, uint(rint(_5583.z)), level(0.0)).x;
        _1979 = _1981;
    }
    float _1983 = _1979;
    float _1985 = abs(_1325);
    float _1987 = log2(_1985);
    float _1989 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_88.x = _709;
    out.m_88.y = _951;
    out.m_88.z = _779;
    float _1991 = exp2(_1989);
    bool _1993 = _1325 <= 8000.0;
    bool _1995 = isnan(_1325);
    bool _1997 = _1993 || _1995;
    bool _1999 = isnan(8000.0);
    bool _2001 = _1997 || _1999;
    float _2003 = float(_2001);
    float _2005 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2007 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2009 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2007);
    float _2011 = exp2(_2005);
    float _2013 = -_1991;
    float _2015 = _2013 + 1.0;
    float _2017 = fma(_2011, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2019 = precise::clamp(_2017, 0.0, 1.0);
    float _2021 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2009);
    float _2023 = _1800 * 0.5;
    float _2025 = fma(_2019, -2.0, 3.0);
    float _2027 = _2019 * _2019;
    float _2029 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2021);
    float _2031 = _2027 * _2025;
    float _2033 = _2029 + _1800;
    float _2035 = _1882 + _1800;
    float _2037 = fma(_1880, -0.5, _2023);
    float _2039 = -_2031;
    float _2041 = _2039 + 1.0;
    float _2043 = _2033 * 0.5;
    float _2045 = _2035 * 0.5;
    out.gl_Position.x = _1882;
    out.gl_Position.y = _1880;
    out.gl_Position.z = _2029;
    out.gl_Position.w = _1800;
    float _2047 = fma(_2041, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2031);
    float _2049 = _2023;
    float _2051 = _2015;
    if (!_1858)
    {
        _2049 = 1.0;
    }
    float _2053 = _2049;
    out.m_90.x = _2045;
    out.m_90.y = _2037;
    out.m_90.z = _2043;
    out.m_90.w = _1800;
    float _2055 = _2003 * _2047;
    float _2057 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2059 = _2015 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2061 = _2053;
    if (_1466)
    {
        _2051 = 1.0;
    }
    float _2063 = _2051;
    float _2065 = -_1902;
    float _2067 = _2065 + 1.0;
    float _2069 = _2067 * _2057;
    float _2071 = precise::clamp(_2069, 0.0, 1.0);
    float _2073 = _2063;
    if (_1858)
    {
        bool _2075 = _1954 >= _1878;
        bool _2077 = isnan(_1954);
        bool _2079 = _2075 || _2077;
        bool _2081 = isnan(_1878);
        bool _2083 = _2079 || _2081;
        float _2085 = float(_2083);
        _2061 = _2085;
    }
    float _2087 = _2061;
    if (!_1466)
    {
        int _2089 = _1516 << 4;
        int _2091 = _2089 + 2048;
        uint _2093 = uint(int(uint(_2091) >> uint(2)));
        uint _2095 = uint(int(uint(int(_2093)) >> uint(2)));
        int _2097 = int(_2093) & 3;
        float _2099 = (*spvDescriptorSet0.vp_c15)._m0[int(_2095)][_2097];
        int _2101 = int(_2093) + 1;
        uint _2103 = uint(int(uint(_2101) >> uint(2)));
        int _2105 = _2101 & 3;
        float _2107 = (*spvDescriptorSet0.vp_c15)._m0[int(_2103)][_2105];
        int _2109 = _2091 + 8;
        uint _2111 = uint(int(uint(_2109) >> uint(2)));
        uint _2113 = uint(int(uint(int(_2111)) >> uint(2)));
        int _2115 = int(_2111) & 3;
        float _2117 = (*spvDescriptorSet0.vp_c15)._m0[int(_2113)][_2115];
        int _2119 = int(_2111) + 1;
        uint _2121 = uint(int(uint(_2119) >> uint(2)));
        int _2123 = _2119 & 3;
        float _2125 = (*spvDescriptorSet0.vp_c15)._m0[int(_2121)][_2123];
        float _2127 = _1265 * _2107;
        float _2129 = fma(_709, _2099, _2127);
        float _2131 = fma(_779, _2117, _2129);
        float _2133 = _2131 + _2125;
        float _2135 = precise::clamp(_2133, 0.0, 1.0);
        float _2137 = -_2135;
        float _2139 = _2137 + _1983;
        float _2141 = fma(_2139, 500.0, 1.5);
        float _2143 = exp2(_2141);
        float _2145 = 0.0 + _2143;
        float _2147 = precise::clamp(_2145, 0.0, 1.0);
        _2073 = _2147;
        _787 = _2131;
    }
    float _2149 = _2073;
    float _2151 = _787;
    float _2153 = _2059 * _1956;
    float _2155 = _2087 * _2149;
    float _2157 = -_2071;
    float _2159 = fma(_2157, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2161 = -_2059;
    float _2163 = _2161 + 1.0;
    float _2165 = _1967 * _2153;
    float _2167 = _1977 * _2153;
    float _2169 = -_2155;
    float _2171 = fma(_2169, _2159, 1.0);
    float _2173 = precise::clamp(_2171, 0.0, 1.0);
    float _2175 = _1967 * _2163;
    float _2177 = fma(_1973, _2165, _1961);
    float _2179 = fma(_1975, _2165, _1963);
    float _2181 = _2173 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2183 = fma(_1967, _2167, _1965);
    bool _2185 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2187 = isnan(_1502);
    bool _2189 = _2185 || _2187;
    bool _2191 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2193 = _2189 || _2191;
    out.m_92.x = _2181;
    out.m_94.x = _2177;
    out.m_94.y = _2179;
    out.m_94.z = _2183;
    out.m_94.w = _2175;
    float _2195 = _2151;
    float _2197 = _2173;
    float _2199 = _2153;
    if (!_2193)
    {
        _2195 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2201 = _2195;
    float _2203 = _2201;
    float _2205 = _2201;
    if (!_2193)
    {
        _2197 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2207 = _2197;
    float _2209 = _2207;
    float _2211 = _2207;
    if (!_2193)
    {
        _2199 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2213 = _2199;
    bool _2215 = !_2193;
    float _2217 = _2213;
    float _2219 = _2213;
    if (!_2215)
    {
        bool _2221 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2223 = isnan(_1502);
        bool _2225 = _2221 || _2223;
        bool _2227 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2229 = _2225 || _2227;
        if (!_2229)
        {
            float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2233 = _1502 + _2231;
            float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2237 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2235;
            float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2247 = 1.0 / _2237;
            float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2251 = _2249 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2253 = _2233 * _2247;
            float _2255 = precise::clamp(_2253, 0.0, 1.0);
            float _2257 = fma(_2255, _2241, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2259 = fma(_2255, _2245, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2261 = fma(_2255, _2251, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2211 = _2259;
            _2205 = _2257;
            _2219 = _2261;
            _2263 = true;
        }
        else
        {
            bool _2265 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2267 = isnan(_1502);
            bool _2269 = _2265 || _2267;
            bool _2271 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2273 = _2269 || _2271;
            if (!_2273)
            {
                _2203 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2275 = _2203;
            _2205 = _2275;
            if (!_2273)
            {
                _2209 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2277 = _2209;
            _2211 = _2277;
            if (!_2273)
            {
                _2217 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2279 = _2217;
            bool _2281 = !_2273;
            _2219 = _2279;
            if (!_2281)
            {
                bool _2283 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2285 = isnan(_1502);
                bool _2287 = _2283 || _2285;
                bool _2289 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2291 = _2287 || _2289;
                if (!_2291)
                {
                    float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2295 = _1502 + _2293;
                    float _2297 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2299 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2297;
                    float _2301 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2309 = 1.0 / _2299;
                    float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2313 = _2311 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2315 = _2295 * _2309;
                    float _2317 = precise::clamp(_2315, 0.0, 1.0);
                    float _2319 = fma(_2317, _2303, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2321 = fma(_2317, _2307, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2323 = fma(_2317, _2313, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2211 = _2321;
                    _2205 = _2319;
                    _2219 = _2323;
                    _2263 = true;
                }
                else
                {
                    _2211 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2205 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2219 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2263 = false;
    float _2325 = _2211;
    float _2327 = _2205;
    float _2329 = _2219;
    float _2331 = _2325 * 0.586610972881317138671875;
    bool _2333 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_96.x = 0.0;
    float _2335 = fma(_2327, 0.298911988735198974609375, _2331);
    float _2337 = fma(_2329, 0.114477999508380889892578125, _2335);
    float _2339 = -_2337;
    float _2341 = _2339 + _2327;
    float _2343 = -_2337;
    float _2345 = _2343 + _2325;
    float _2347 = -_2337;
    float _2349 = _2347 + _2329;
    float _2351 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2353 = fma(_2341, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2337);
    float _2355 = fma(_2345, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2337);
    float _2357 = fma(_2349, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2337);
    out.m_61.x = _2351;
    out.m_98.x = _2353;
    out.m_98.y = _2355;
    out.m_98.z = _2357;
    if (!_2333)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2359 = -_1217;
    float _2361 = _2359 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2363 = -_1219;
    float _2365 = _2363 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2367 = -_1221;
    float _2369 = _2367 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2371 = _2361 * _2361;
    float _2373 = fma(_2365, _2365, _2371);
    float _2375 = fma(_2369, _2369, _2373);
    float _2377 = sqrt(_2375);
    float _2379 = rsqrt(_2375);
    float _2381 = -_2377;
    float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2385 = _2383 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2387 = precise::clamp(_2385, 0.0, 1.0);
    float _2389 = _2365 * _2379;
    float _2391 = _2361 * _2379;
    float _2393 = abs(_2387);
    float _2395 = log2(_2393);
    float _2397 = _2369 * _2379;
    float _2399 = _2389 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2401 = _1121 * _2391;
    float _2403 = -_2391;
    float _2405 = -_2399;
    float _2407 = fma(_2403, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2405);
    float _2409 = fma(_1117, _2389, _2401);
    float _2411 = -_2397;
    float _2413 = fma(_2411, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2407);
    float _2415 = fma(_1123, _2397, _2409);
    float _2417 = precise::clamp(_2415, 0.0, 1.0);
    float _2419 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2421 = _2413 + _2419;
    float _2423 = _2395 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2425 = _2421 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2427 = precise::clamp(_2425, 0.0, 1.0);
    float _2429 = exp2(_2423);
    float _2431 = _2429 * _2427;
    float _2433 = _2417 * _2431;
    float _2435 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2437 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2439 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _2435;
    out.m_96.y = _2437;
    out.m_96.z = _2439;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

