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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c8 [[id(3)]];
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
    float4 m_80 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_110 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_90 [[user(locn5)]];
    float4 m_100 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_92 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_98 [[user(locn11)]];
    float4 m_102 [[user(locn12)]];
    float4 m_96 [[user(locn13)]];
    float4 m_108 [[user(locn14)]];
    float4 m_104 [[user(locn15)]];
    float4 m_106 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(1)]];
    float4 m_72 [[attribute(2)]];
    float4 m_74 [[attribute(3)]];
    float4 m_94 [[attribute(4)]];
    float4 m_68 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_76 [[attribute(8)]];
    float4 m_78 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5375 = false;
    bool _639 = false;
    bool _457 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _124 = in.m_56.w;
    float _126 = in.m_58.w;
    float _128 = trunc(_124);
    int _131 = int(_128);
    float _133 = -_126;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _135;
    bool _139 = _131 >= 1;
    float _141 = 0.0;
    float _143 = _126;
    float _145 = _135;
    if (!_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _141;
    if (!_139)
    {
        out.m_63.x = 0.0;
    }
    int _149 = 0;
    if (!_139)
    {
        float _151 = _147 * 5.0;
        _149 = as_type<int>(_151);
    }
    int _153 = _149;
    int _155 = _153;
    if (!_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5685 = as_type<float>(_153);
        out.gl_Position.z = _5685;
    }
    if (!_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _157 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _159 = isnan(_126);
    bool _161 = _157 || _159;
    bool _163 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _165 = _161 || _163;
    float _167 = float(_131);
    bool _169 = _135 >= _167;
    bool _171 = !_165;
    bool _173 = _169 || _171;
    float _175 = 1.0 / _167;
    if (_173)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _143;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    float _179 = _135 * _175;
    float _181 = _179;
    if (_173)
    {
        float _183 = _177 * 5.0;
        _155 = as_type<int>(_183);
    }
    int _185 = _155;
    out.m_61.x = _179;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5748 = as_type<float>(_185);
        out.gl_Position.z = _5748;
    }
    if (_173)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_68.x;
    float _191 = in.m_68.y;
    float _193 = in.m_68.z;
    float _195 = in.m_70.x;
    float _197 = in.m_70.y;
    float _199 = in.m_70.z;
    float _201 = in.m_72.x;
    float _203 = in.m_72.y;
    float _205 = in.m_72.z;
    float _207 = in.m_74.x;
    float _209 = in.m_74.y;
    float _211 = in.m_74.z;
    int _213 = as_type<int>(_187) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_187) & 2;
    bool _219 = _217 != 0;
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _223 = !_219;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _191 * _197;
    float _229 = _191 * _203;
    float _231 = fma(_189, _195, _227);
    float _233 = _191 * _209;
    float _235 = fma(_189, _201, _229);
    float _237 = fma(_193, _199, _231);
    bool _239 = !_215;
    float _241 = _239 ? (-0.5) : 0.5;
    float _243 = fma(_189, _207, _233);
    float _245 = fma(_193, _205, _235);
    float _247 = fma(_193, _211, _243);
    bool _249 = !_221;
    float _267;
    if (!_249)
    {
        float _251 = in.m_76.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _251 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        _267 = _179;
    }
    _269 = false;
    float _271 = _267;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = _271 + _277;
    bool _281 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _283 = isnan(_271);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _271 + _305;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = 1.0 / _299;
    float _313 = 1.0 / _295;
    float _315 = 1.0 / _303;
    float _317 = _307 * _311;
    bool _319 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _321 = isnan(_271);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = _275 * _313;
    bool _333 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _335 = isnan(_271);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -_291;
    float _347 = _345 + 1.0;
    bool _349 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _351 = isnan(_271);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -_343;
    float _363 = _361 + 1.0;
    float _365 = _343 * _347;
    float _367 = _279 * _315;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = _359 * _363;
    float _387 = -_359;
    float _389 = _387 + 1.0;
    float _391 = fma(_379, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _393 = fma(_371, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _395 = _329 * _389;
    float _397 = -_329;
    float _399 = _397 + 1.0;
    float _401 = fma(_383, _317, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _403 = _391 * _395;
    float _405 = _393 * _395;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _407;
    float _411 = fma(_375, _317, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _413;
    float _417 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _419 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].y, _405);
    float _421 = fma(_409, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _423 = fma(_415, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _425 = fma(_401, _385, _417);
    float _427 = fma(_411, _385, _419);
    float _429 = fma(_421, _365, _425);
    float _431 = fma(_423, _365, _427);
    float _433 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[146].x, _429);
    float _435 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[146].y, _431);
    bool _437 = !_309;
    float _455;
    if (!_437)
    {
        float _439 = in.m_76.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        _455 = _179;
    }
    _457 = false;
    float _459 = _455;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _463 = _459 + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _469 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _471 = isnan(_459);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _489 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _491 = isnan(_459);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = 1.0 / _467;
    float _503 = -_479;
    float _505 = _503 + 1.0;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _507;
    bool _511 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _513 = isnan(_459);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = _499 * _505;
    float _525 = -_499;
    float _527 = _525 + 1.0;
    bool _529 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _531 = 1.0 / _483;
    float _533 = _521 * _527;
    float _535 = -_521;
    float _537 = _535 + 1.0;
    float _539 = 1.0 / _487;
    float _541 = _509 * _501;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _547 = fma(_541, _463, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _549 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _551 = isnan(_459);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _545 * _531;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _569 = _459 + _567;
    float _571 = _547 * _533;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = _459 + _573;
    float _577 = fma(_561, _569, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _579 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[115].x, _571);
    float _581 = _565 * _539;
    float _583 = -_559;
    float _585 = _583 + 1.0;
    float _587 = fma(_577, _523, _579);
    float _589 = fma(_581, _575, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _591 = _479 * _585;
    float _593 = in.m_78.x;
    float _595 = in.m_78.y;
    float _597 = fma(_589, _591, _587);
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _605 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[118].x, _597);
    float _607 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = _601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _611 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = _605 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_80.x = _607;
    out.m_80.y = _609;
    out.m_80.z = _611;
    out.m_80.w = _613;
    float _615 = _435 * _595;
    float _617 = _433 * _593;
    bool _619 = !_529;
    float _637;
    if (!_619)
    {
        float _621 = in.m_76.x;
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _625 = _621 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _627 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _629 = _627 * _623;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _637 = _635;
        _639 = true;
    }
    else
    {
        _637 = _179;
    }
    _639 = false;
    float _641 = _637;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _645 = _641 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _651 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _653 = isnan(_641);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _671 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _673 = isnan(_641);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = 1.0 / _649;
    float _685 = -_661;
    float _687 = _685 + 1.0;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _689;
    bool _693 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _695 = isnan(_641);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = _681 * _687;
    float _707 = -_681;
    float _709 = _707 + 1.0;
    bool _711 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _713 = 1.0 / _665;
    float _715 = _703 * _709;
    float _717 = -_703;
    float _719 = _717 + 1.0;
    float _721 = 1.0 / _669;
    float _723 = _691 * _683;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _727 = _725 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _729 = fma(_723, _645, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _731 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _733 = isnan(_641);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = _727 * _713;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _745;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _751 = _641 + _749;
    float _753 = _729 * _715;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _757 = _641 + _755;
    float _759 = fma(_743, _751, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _761 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[131].x, _753);
    float _763 = _747 * _721;
    float _765 = -_741;
    float _767 = _765 + 1.0;
    float _769 = fma(_759, _705, _761);
    float _771 = fma(_763, _757, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _773 = _661 * _767;
    float _775 = fma(_771, _773, _769);
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _783 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[134].x, _775);
    float _785 = _777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _789 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _791 = _783 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_82.x = _785;
    out.m_82.y = _787;
    out.m_82.z = _789;
    out.m_82.w = _791;
    bool _793 = !_711;
    if (!_793)
    {
        float _795 = in.m_76.x;
        float _797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _799 = _795 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _801 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _803 = _801 * _797;
        float _805 = floor(_803);
        float _807 = -_805;
        float _809 = _803 + _807;
        _181 = _809;
    }
    float _811 = _181;
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _815 = int(_813);
    float _817 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _819 = int(_817);
    float _821 = float(_815);
    float _823 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _825 = int(_823);
    float _827 = float(uint(_819));
    float _829 = 1.0 / _821;
    int _831 = ~_819;
    int _833 = _831 + 1;
    float _835 = 1.0 / _827;
    float _837 = float(uint(_825));
    float _839 = _829 * _135;
    int _841 = ~_819;
    int _843 = _841 + 1;
    float _845 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _847 = int(_845);
    int _849 = as_type<int>(_835) + (-2);
    float _851 = trunc(_839);
    int _853 = int(_851);
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _857 = _855 != 0;
    float _859 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _861 = int(_859);
    float _863 = float(uint(_853));
    float _865 = 0.0;
    if (_857)
    {
        _865 = 1.0;
    }
    float _867 = _865;
    int _869 = 0;
    int _871 = 0;
    float _873 = _867;
    if (_857)
    {
        _869 = 0;
        _871 = 0;
    }
    int _875 = _869;
    int _877 = _871;
    float _879 = 0.0;
    int _881 = _875;
    int _883 = _877;
    if (_857)
    {
        _879 = 1.0;
    }
    float _885 = _879;
    float _887 = as_type<float>(_849) * _863;
    float _889 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _891 = int(_889);
    float _893 = trunc(_887);
    float _895 = precise::max(_893, 0.0);
    uint _898 = uint(_895);
    float _900 = float(_891);
    float _902 = 1.0 / _900;
    int _904 = _843 * int(_898);
    int _906 = _904 + _853;
    float _908 = float(uint(_906));
    float _910 = as_type<float>(_849) * _908;
    float _912 = _908;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _916 = _900;
    float _918 = _885;
    if (_857)
    {
        float _920 = in.m_76.x;
        float _922 = in.m_76.y;
        _912 = _920;
        _914 = _922;
    }
    float _924 = _912;
    float _926 = _914;
    float _928 = trunc(_910);
    float _930 = precise::max(_928, 0.0);
    uint _932 = uint(_930);
    float _934 = 1.0 / _837;
    int _936 = int(_898) + int(_932);
    float _938 = float(_819);
    float _940 = float(_853);
    int _942 = _833 * _936;
    int _944 = _942 + _853;
    float _946 = 0.0;
    float _948 = _940;
    float _950 = _924;
    float _952 = _926;
    if (_857)
    {
        _946 = _924;
    }
    float _954 = _946;
    bool _956 = _940 >= _938;
    bool _958 = isnan(_940);
    bool _960 = _956 || _958;
    bool _962 = isnan(_938);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    bool _968 = uint(_944) >= uint(_819);
    float _970 = 0.0;
    float _972 = _954;
    if (_857)
    {
        _970 = _954;
    }
    float _974 = _970;
    float _976 = trunc(_966);
    int _978 = int(_976);
    float _980 = _974;
    if (_857)
    {
        _948 = _926;
    }
    float _982 = _948;
    float _984 = _982;
    if (_857)
    {
        _916 = _954;
    }
    float _986 = _916;
    float _988 = _986;
    if (!_857)
    {
        float _990 = in.m_76.x;
        float _992 = in.m_76.y;
        float _994 = in.m_76.z;
        float _996 = _990 * 3.1415927410125732421875;
        float _998 = _996 * 0.15915493667125701904296875;
        float _1000 = _992 * 3.1415927410125732421875;
        float _1002 = _1000 * 0.15915493667125701904296875;
        float _1004 = _998 * 6.283185482025146484375;
        float _1006 = sin(_1004);
        float _1008 = _1002 * 6.283185482025146484375;
        float _1010 = sin(_1008);
        _873 = 7.345489978790283203125;
        _950 = _990;
        _952 = _992;
        _918 = 5.839270114898681640625;
        _988 = _994;
        _972 = _992;
        _881 = 1;
        _883 = 2;
        _980 = _1006;
        _984 = _1010;
    }
    float _1012 = _873;
    float _1014 = _950;
    float _1016 = _952;
    float _1018 = _918;
    float _1020 = _988;
    float _1022 = _972;
    int _1024 = _881;
    int _1026 = _883;
    float _1028 = _980;
    float _1030 = _984;
    float _1032 = _1012 * _1014;
    float _1034 = in.m_76.z;
    float _1036 = in.m_76.w;
    bool _1038 = !_968;
    int _1040 = _1038 ? 0 : (-1);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1044 = _811 + _1042;
    float _1046 = floor(_1032);
    float _1048 = float(_861);
    float _1050 = in.m_70.w;
    int _1052 = ~_936;
    int _1054 = _1052 + _1040;
    int _1056 = _1054 + 1;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1060 = _811 + _1058;
    float _1062 = float(uint(_847));
    bool _1064 = _819 == 0;
    float _1066 = 1.0 / _1048;
    int _1068 = _819 * _1056;
    int _1070 = _1068 + _853;
    int _1072 = ~_978;
    int _1074 = _1072 + 1;
    int _1076 = _1074 + 1;
    bool _1078 = !_1064;
    int _1080 = _1078 ? _1070 : (-1);
    float _1082 = -_1046;
    float _1084 = _1032 + _1082;
    float _1086 = 1.0 / _1062;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1090 = _1088 != 0;
    int _1092 = _1080 * _1076;
    float _1094 = _1084 * _938;
    bool _1096 = _1034 > 0.5;
    float _1098 = _175 * _135;
    bool _1100 = !_1090;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = _1066 * _135;
    bool _1106 = _1016 > 0.5;
    float _1108 = _902 * _135;
    float _1110 = trunc(_1094);
    int _1112 = int(_1110);
    int _1114 = abs(_1102);
    float _1116 = _938 * _1098;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1120 = _1118 != 0;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1124 = _1122 != 0;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1128 = _1126 != 0;
    float _1130 = -_225;
    int _1132 = _1096 ? as_type<int>(_1130) : as_type<int>(_225);
    float _1134 = -_241;
    int _1136 = _1106 ? as_type<int>(_1134) : as_type<int>(_241);
    float _1138 = trunc(_1108);
    int _1140 = int(_1138);
    bool _1142 = !_1128;
    float _1144 = _1142 ? _225 : as_type<float>(_1132);
    bool _1146 = !_1124;
    float _1148 = _1146 ? _241 : as_type<float>(_1136);
    float _1150 = trunc(_1104);
    int _1152 = int(_1150);
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1156 = _1154 != 0;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1160 = _1158 != 0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1164 = _1162 != 0;
    int _1166 = _1112 * _1114;
    int _1168 = _1166 + _853;
    int _1170 = _819 + (-1);
    int _1172 = as_type<int>(_934) + (-2);
    bool _1174 = !_1160;
    int _1176 = _1174 ? 0 : 1;
    float _1178 = trunc(_1116);
    int _1180 = int(_1178);
    float _1182 = float(uint(_1140));
    int _1184 = _978 * _1170;
    int _1186 = _1184 + _1092;
    bool _1188 = !_1156;
    int _1190 = _1188 ? 0 : 1;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1194 = _1192 != 0;
    float _1196 = as_type<float>(_1172) * _1182;
    int _1198 = as_type<int>(_1086) + (-2);
    int _1200 = abs(_1176);
    bool _1202 = !_1164;
    int _1204 = _1202 ? 0 : 1;
    float _1206 = trunc(_1196);
    float _1208 = precise::max(_1206, 0.0);
    uint _1210 = uint(_1208);
    int _1212 = abs(_1190);
    int _1214 = _1186 * _1200;
    bool _1216 = !_1194;
    int _1218 = _1216 ? 0 : 1;
    float _1220 = float(uint(_1152));
    int _1222 = abs(_1204);
    int _1224 = abs(_1218);
    float _1226 = as_type<float>(_1198) * _1220;
    int _1228 = _1180 * _1212;
    int _1230 = _1228 + _1214;
    int _1232 = ~_825;
    int _1234 = _1232 + 1;
    float _1236 = trunc(_1226);
    float _1238 = precise::max(_1236, 0.0);
    uint _1240 = uint(_1238);
    int _1242 = _1168 * _1222;
    int _1244 = _1242 + _1230;
    int _1246 = ~_847;
    int _1248 = _1246 + 1;
    int _1250 = _1112 * _1224;
    int _1252 = _1250 + _1244;
    int _1254 = ~_825;
    int _1256 = _1254 + 1;
    int _1258 = _1234 * int(_1210);
    int _1260 = _1258 + _1140;
    int _1262 = ~_819;
    int _1264 = _1262 + 1;
    float _1266 = float(uint(_1252));
    float _1268 = float(uint(_1260));
    int _1270 = ~_847;
    int _1272 = _1270 + 1;
    int _1274 = _1248 * int(_1240);
    int _1276 = _1274 + _1152;
    float _1278 = as_type<float>(_849) * _1266;
    float _1280 = as_type<float>(_1172) * _1268;
    bool _1282 = _1036 > 0.5;
    float _1284 = float(uint(_1276));
    float _1286 = trunc(_1278);
    float _1288 = precise::max(_1286, 0.0);
    uint _1290 = uint(_1288);
    float _1292 = float(_825);
    float _1294 = as_type<float>(_1198) * _1284;
    float _1296 = trunc(_1280);
    float _1298 = precise::max(_1296, 0.0);
    uint _1300 = uint(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1306 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1308 = isnan(_811);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1320 = _1318 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1322 = trunc(_1294);
    float _1324 = precise::max(_1322, 0.0);
    uint _1326 = uint(_1324);
    int _1328 = _1264 * int(_1290);
    int _1330 = _1328 + _1252;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1334 = float(uint(_1330));
    int _1336 = int(_1210) + int(_1300);
    float _1338 = _1018 * _1020;
    float _1340 = -_241;
    int _1342 = _1096 ? as_type<int>(_1340) : as_type<int>(_241);
    float _1344 = as_type<float>(_849) * _1334;
    float _1346 = 1.0 / _1304;
    int _1348 = _1256 * _1336;
    int _1350 = _1348 + _1140;
    int _1352 = int(_1240) + int(_1326);
    float _1354 = _1012 * _1022;
    bool _1356 = uint(_1350) >= uint(_825);
    float _1358 = trunc(_1344);
    float _1360 = precise::max(_1358, 0.0);
    uint _1362 = uint(_1360);
    float _1364 = -_225;
    int _1366 = _1282 ? as_type<int>(_1364) : as_type<int>(_225);
    int _1368 = _1272 * _1352;
    int _1370 = _1368 + _1152;
    bool _1372 = !_1356;
    int _1374 = _1372 ? 0 : (-1);
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1378 = _1376 != 0;
    bool _1380 = uint(_1370) >= uint(_847);
    float _1382 = floor(_1338);
    bool _1384 = !_1378;
    float _1386 = _1384 ? _241 : as_type<float>(_1342);
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1390 = _1388 != 0;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1394 = _1392 != 0;
    int _1396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1398 = _1396 != 0;
    int _1400 = ~_819;
    int _1402 = _1400 + 1;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1406 = _1404 != 0;
    float _1408 = floor(_1354);
    bool _1410 = !_1394;
    int _1412 = _1410 ? 0 : 1;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1416 = _1414 != 0;
    int _1418 = int(_1290) + int(_1362);
    float _1420 = float(_1140);
    float _1422 = -_1382;
    float _1424 = _1338 + _1422;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1428 = _1426 != 0;
    int _1430 = _1402 * _1418;
    int _1432 = _1430 + _1252;
    bool _1434 = _1420 >= _1292;
    bool _1436 = isnan(_1420);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan(_1292);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = 1.0 / _1320;
    bool _1448 = !_1406;
    int _1450 = _1448 ? 0 : 1;
    bool _1452 = !_1428;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = 0.0;
    float _1458 = _1050;
    if (_1416)
    {
        float _1460 = in.m_76.w;
        _1456 = _1460;
    }
    float _1462 = _1456;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1466 = _1464 != 0;
    float _1468 = -_1408;
    float _1470 = _1354 + _1468;
    bool _1472 = uint(_1432) >= uint(_819);
    float _1474 = trunc(_1444);
    int _1476 = int(_1474);
    int _1478 = ~_1336;
    int _1480 = _1478 + _1374;
    int _1482 = _1480 + 1;
    bool _1484 = !_1120;
    float _1486 = _1484 ? _225 : as_type<float>(_1366);
    bool _1488 = !_1466;
    int _1490 = _1488 ? 0 : 1;
    int _1492 = _825 * _1482;
    int _1494 = _1492 + _1140;
    bool _1496 = !_1380;
    int _1498 = _1496 ? 0 : (-1);
    bool _1500 = !_1472;
    int _1502 = _1500 ? 0 : (-1);
    float _1504 = _1292 * _1098;
    int _1506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1508 = _1506 != 0;
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1512 = _1510 != 0;
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1516 = _1514 != 0;
    int _1518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1520 = _1518 != 0;
    float _1522 = _1424 * _1292;
    int _1524 = _825 + (-1);
    bool _1526 = !_1390;
    int _1528 = _1526 ? 0 : 1;
    float _1530 = trunc(_1504);
    int _1532 = int(_1530);
    bool _1534 = !_1512;
    int _1536 = _1534 ? 0 : 1;
    bool _1538 = _825 == 0;
    float _1540 = _1462;
    bool _1542 = _1516;
    if (_1416)
    {
        float _1544 = _1462 * 3.1415927410125732421875;
        _1540 = _1544;
    }
    float _1546 = _1540;
    int _1548 = ~_1476;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    bool _1554 = !_1538;
    int _1556 = _1554 ? _1494 : (-1);
    float _1558 = _1546;
    if (_1416)
    {
        float _1560 = _1546 * 0.15915493667125701904296875;
        _1558 = _1560;
    }
    float _1562 = _1558;
    bool _1564 = !_1398;
    int _1566 = _1564 ? 0 : 1;
    int _1568 = abs(_1412);
    int _1570 = _1556 * _1552;
    float _1572 = float(_847);
    float _1574 = trunc(_1522);
    int _1576 = int(_1574);
    float _1578 = float(_1152);
    int _1580 = _1476 * _1524;
    int _1582 = _1580 + _1570;
    int _1584 = abs(_1528);
    int _1586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1588 = _1586 != 0;
    int _1590 = _1582 * _1568;
    int _1592 = abs(_1566);
    float _1594 = _1562;
    if (_1416)
    {
        float _1596 = _1562 * 6.283185482025146484375;
        float _1598 = sin(_1596);
        _1594 = _1598;
    }
    float _1600 = _1594;
    int _1602 = abs(_1450);
    bool _1604 = _1578 >= _1572;
    bool _1606 = isnan(_1578);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan(_1572);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    int _1616 = _1576 * _1602;
    int _1618 = _1616 + _1140;
    float _1620 = trunc(_1614);
    int _1622 = int(_1620);
    int _1624 = _1532 * _1584;
    int _1626 = _1624 + _1590;
    float _1628 = _1572 * _1098;
    int _1630 = abs(_1454);
    float _1632 = _1470 * _1572;
    int _1634 = _1618 * _1592;
    int _1636 = _1634 + _1626;
    int _1638 = ~_1352;
    int _1640 = _1638 + _1498;
    int _1642 = _1640 + 1;
    float _1644 = _1470;
    if (_1588)
    {
        float _1646 = in.m_76.x;
        _1644 = _1646;
    }
    float _1648 = _1644;
    bool _1650 = !_1508;
    int _1652 = _1650 ? 0 : 1;
    int _1654 = _1576 * _1630;
    int _1656 = _1654 + _1636;
    bool _1658 = !_1516;
    int _1660 = _1658 ? 0 : 1;
    int _1662 = _847 * _1642;
    int _1664 = _1662 + _1152;
    bool _1666 = _847 == 0;
    float _1668 = trunc(_1632);
    int _1670 = int(_1668);
    if (_1416)
    {
        bool _1672 = _1600 > 0.5;
        _1542 = _1672;
    }
    bool _1674 = _1542;
    float _1676 = float(uint(_1168));
    float _1678 = float(uint(_1656));
    int _1680 = ~_1622;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = as_type<float>(_849) * _1676;
    bool _1688 = !_1666;
    int _1690 = _1688 ? _1664 : (-1);
    float _1692 = trunc(_1628);
    int _1694 = int(_1692);
    int _1696 = abs(_1490);
    float _1698 = as_type<float>(_1172) * _1678;
    int _1700 = _847 + (-1);
    int _1702 = _1690 * _1684;
    int _1704 = abs(_1536);
    float _1706 = trunc(_1686);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    int _1712 = _1622 * _1700;
    int _1714 = _1712 + _1702;
    int _1716 = abs(_1652);
    float _1718 = _1648;
    float _1720 = _1686;
    float _1722 = as_type<float>(_1716);
    if (_1588)
    {
        float _1724 = _1648 * 3.1415927410125732421875;
        _1718 = _1724;
    }
    float _1726 = _1718;
    int _1728 = ~_819;
    int _1730 = _1728 + 1;
    int _1732 = _1670 * _1696;
    int _1734 = _1732 + _1152;
    int _1736 = ~_825;
    int _1738 = _1736 + 1;
    float _1740 = trunc(_1698);
    float _1742 = precise::max(_1740, 0.0);
    uint _1744 = uint(_1742);
    int _1746 = _1714 * _1704;
    float _1748 = as_type<float>(_1730);
    if (_1588)
    {
        float _1750 = _1726 * 0.15915493667125701904296875;
        _1748 = _1750;
    }
    float _1752 = _1748;
    int _1754 = _1694 * _1716;
    int _1756 = _1754 + _1746;
    float _1758 = float(uint(_1618));
    int _1760 = _1730 * int(_1710);
    int _1762 = _1760 + _1168;
    int _1764 = abs(_1660);
    float _1766 = _1752;
    if (_1588)
    {
        float _1768 = _1752 * 6.283185482025146484375;
        float _1770 = sin(_1768);
        _1766 = _1770;
    }
    float _1772 = _1766;
    bool _1774 = !_1520;
    int _1776 = _1774 ? 0 : 1;
    float _1778 = as_type<float>(_1172) * _1758;
    int _1780 = ~_1418;
    int _1782 = _1780 + _1502;
    int _1784 = _1782 + 1;
    float _1786 = float(uint(_1762));
    int _1788 = _1738 * int(_1744);
    int _1790 = _1788 + _1656;
    int _1792 = _819 * _1784;
    int _1794 = _1792 + _1252;
    int _1796 = abs(_1776);
    float _1798 = trunc(_1778);
    float _1800 = precise::max(_1798, 0.0);
    uint _1802 = uint(_1800);
    float _1804 = float(uint(_1790));
    float _1806 = as_type<float>(_849) * _1786;
    bool _1808 = _819 == 0;
    int _1810 = _1734 * _1764;
    int _1812 = _1810 + _1756;
    float _1814 = as_type<float>(_1172) * _1804;
    int _1816 = ~_825;
    int _1818 = _1816 + 1;
    bool _1820 = !_1808;
    int _1822 = _1820 ? _1794 : (-1);
    int _1824 = _1670 * _1796;
    int _1826 = _1824 + _1812;
    if (!_1416)
    {
        _1720 = _241;
    }
    float _1828 = _1720;
    float _1830 = trunc(_1814);
    float _1832 = precise::max(_1830, 0.0);
    uint _1834 = uint(_1832);
    float _1836 = _1828;
    if (_1416)
    {
        float _1838 = -_241;
        float _1840 = _1674 ? _1838 : _241;
        _1836 = _1840;
    }
    float _1842 = _1836;
    int _1844 = _1822 & 3;
    bool _1846 = _1844 != 0;
    int _1848 = _1822 & 3;
    bool _1850 = _1848 != 0;
    int _1852 = _1818 * int(_1802);
    int _1854 = _1852 + _1618;
    int _1856 = _1846 ? 0 : 1;
    float _1858 = trunc(_1806);
    float _1860 = precise::max(_1858, 0.0);
    uint _1862 = uint(_1860);
    bool _1864 = uint(_1848) > 1u;
    bool _1866 = _1848 != 3;
    float _1868 = float(uint(_1826));
    int _1870 = int(_1744) + int(_1834);
    int _1872 = ~_825;
    int _1874 = _1872 + 1;
    float _1876 = as_type<float>(_1198) * _1868;
    float _1878 = float(uint(_1854));
    int _1880 = ~_1856;
    int _1882 = _1880 + 1;
    int _1884 = _1882 + 1;
    int _1886 = _1874 * _1870;
    int _1888 = _1886 + _1656;
    int _1890 = _1884;
    bool _1892 = _1866;
    if (!_1864)
    {
        int _1894 = ~_1856;
        int _1896 = _1894 + 1;
        _1890 = _1896;
    }
    int _1898 = _1890;
    float _1900 = as_type<float>(_1172) * _1878;
    bool _1902 = uint(_1848) >= 2u;
    float _1904 = trunc(_1876);
    float _1906 = precise::max(_1904, 0.0);
    uint _1908 = uint(_1906);
    bool _1910 = _1016 > 0.5;
    int _1912 = _1902 ? 0 : 1;
    bool _1914 = uint(_1888) >= uint(_825);
    int _1916 = ~_1912;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    float _1922 = trunc(_1900);
    float _1924 = precise::max(_1922, 0.0);
    uint _1926 = uint(_1924);
    bool _1928 = !_1914;
    int _1930 = _1928 ? 0 : (-1);
    int _1932 = _1920;
    if (_1866)
    {
        int _1934 = ~_1912;
        int _1936 = _1934 + 1;
        _1932 = _1936;
    }
    int _1938 = _1932;
    int _1940 = ~_1870;
    int _1942 = _1940 + _1930;
    int _1944 = _1942 + 1;
    if (_1588)
    {
        bool _1946 = _1772 > 0.5;
        _1892 = _1946;
    }
    bool _1948 = _1892;
    int _1950 = _825 * _1944;
    int _1952 = _1950 + _1656;
    if (!_1588)
    {
        _1722 = _225;
    }
    float _1954 = _1722;
    float _1956 = -_225;
    int _1958 = _1910 ? as_type<int>(_1956) : as_type<int>(_225);
    bool _1960 = !_1538;
    int _1962 = _1960 ? _1952 : (-1);
    int _1964 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1966 = _1964 != 0;
    float _1968 = _1954;
    if (_1588)
    {
        float _1970 = -_225;
        float _1972 = _1948 ? _1970 : _225;
        _1968 = _1972;
    }
    float _1974 = _1968;
    int _1976 = _1962 & 3;
    bool _1978 = _1976 != 0;
    int _1980 = ~_847;
    int _1982 = _1980 + 1;
    bool _1984 = !_1966;
    float _1986 = _1984 ? _225 : as_type<float>(_1958);
    bool _1988 = uint(_1976) > 1u;
    int _1990 = _1982 * int(_1908);
    int _1992 = _1990 + _1826;
    int _1994 = _1962 & 3;
    bool _1996 = _1994 != 0;
    int _1998 = int(_1710) + int(_1862);
    float _2000 = float(uint(_1992));
    int _2002 = _1996 ? 0 : 1;
    int _2004 = ~_819;
    int _2006 = _2004 + 1;
    float _2008 = as_type<float>(_1198) * _2000;
    int _2010 = ~_2002;
    int _2012 = _2010 + 1;
    int _2014 = _2012 + 1;
    int _2016 = _2014;
    if (!_1988)
    {
        int _2018 = ~_2002;
        int _2020 = _2018 + 1;
        _2016 = _2020;
    }
    int _2022 = _2016;
    int _2024 = _2006 * _1998;
    int _2026 = _2024 + _1168;
    bool _2028 = uint(_1976) >= 2u;
    float _2030 = trunc(_2008);
    float _2032 = precise::max(_2030, 0.0);
    uint _2034 = uint(_2032);
    bool _2036 = !_1978;
    int _2038 = _2036 ? 0 : 1;
    int _2040 = _2028 ? 0 : 1;
    bool _2042 = uint(_2026) >= uint(_819);
    bool _2044 = _1976 != 3;
    bool _2046 = _1976 != 3;
    int _2048 = int(_1802) + int(_1926);
    float _2050 = in.m_56.x;
    float _2052 = in.m_56.y;
    float _2054 = in.m_56.z;
    int _2056 = ~_825;
    int _2058 = _2056 + 1;
    bool _2060 = !_2042;
    int _2062 = _2060 ? 0 : (-1);
    int _2064 = int(_1908) + int(_2034);
    int _2066 = _2058 * _2048;
    int _2068 = _2066 + _1618;
    int _2070 = ~_2040;
    int _2072 = _2070 + 1;
    int _2074 = _2072 + 1;
    int _2076 = _2074;
    if (_2044)
    {
        int _2078 = ~_2040;
        int _2080 = _2078 + 1;
        _2076 = _2080;
    }
    int _2082 = _2076;
    bool _2084 = uint(_2068) >= uint(_825);
    int _2086 = ~_847;
    int _2088 = _2086 + 1;
    int _2090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2092 = _2090 != 0;
    bool _2094 = !_2046;
    int _2096 = _2094 ? 0 : (-1);
    int _2098 = _2088 * _2064;
    int _2100 = _2098 + _1826;
    bool _2102 = !_2092;
    int _2104 = _2102 ? 0 : 1;
    bool _2106 = uint(_2100) >= uint(_847);
    float _2108 = _197 * _2052;
    bool _2110 = !_2084;
    int _2112 = _2110 ? 0 : (-1);
    float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2116 = _2114 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2120 = _2118 != 0;
    float _2122 = fma(_195, _2050, _2108);
    int _2124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2126 = _2124 != 0;
    float _2128 = _209 * _2052;
    bool _2130 = !_2106;
    int _2132 = _2130 ? 0 : (-1);
    float _2134 = _203 * _2052;
    float _2136 = 1.0 / _2116;
    bool _2138 = _1014 > 0.5;
    float _2140 = fma(_201, _2050, _2134);
    float _2142 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2144 = _2142 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2146 = -_241;
    int _2148 = _2138 ? as_type<int>(_2146) : as_type<int>(_241);
    int _2150 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2152 = _2150 != 0;
    float _2154 = fma(_207, _2050, _2128);
    float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2158 = _2156 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2160 = 1.0 / _2144;
    float _2162 = fma(_199, _2054, _2122);
    float _2164 = fma(_205, _2054, _2140);
    float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2166;
    float _2170 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2172 = _2170 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2174 = 1.0 / _2158;
    float _2176 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2178 = _2176 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2180 = _2168 * _1346;
    float _2182 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2184 = _2182 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2186 = _2172 * _2136;
    float _2188 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2188;
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2196 = 1.0 / _2178;
    bool _2198 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2200 = isnan(_811);
    bool _2202 = _2198 || _2200;
    bool _2204 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2206 = _2202 || _2204;
    float _2208 = float(_2206);
    float _2210 = fma(_211, _2054, _2154);
    float _2212 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2214 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2212;
    float _2216 = _2194 * _2160;
    bool _2218 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2220 = isnan(_811);
    bool _2222 = _2218 || _2220;
    bool _2224 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2226 = _2222 || _2224;
    float _2228 = float(_2226);
    float _2230 = -_2208;
    float _2232 = _2230 + 1.0;
    float _2234 = 1.0 / _2184;
    float _2236 = _2214 * _2174;
    bool _2238 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2240 = isnan(_811);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2246 = _2242 || _2244;
    float _2248 = float(_2246);
    float _2250 = _2228 * _2232;
    float _2252 = -_2228;
    float _2254 = _2252 + 1.0;
    float _2256 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2256;
    bool _2260 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2262 = isnan(_811);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2268 = _2264 || _2266;
    float _2270 = float(_2268);
    float _2272 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2274 = _2272 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2276 = -_2248;
    float _2278 = _2276 + 1.0;
    float _2280 = _2248 * _2254;
    float _2282 = _2258 * _1446;
    float _2284 = _2274 * _2196;
    bool _2286 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2288 = isnan(_811);
    bool _2290 = _2286 || _2288;
    bool _2292 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2294 = _2290 || _2292;
    float _2296 = float(_2294);
    float _2298 = _2270 * _2278;
    float _2300 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2302 = _811 + _2300;
    float _2304 = -_2270;
    float _2306 = _2304 + 1.0;
    bool _2308 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2310 = isnan(_811);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2316 = _2312 || _2314;
    float _2318 = float(_2316);
    float _2320 = in.m_72.w;
    float _2322 = _2190 * _2234;
    float _2324 = fma(_2180, _2302, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2326 = _2296 * _2306;
    float _2328 = -_2296;
    float _2330 = _2328 + 1.0;
    float _2332 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2334 = _811 + _2332;
    float _2336 = -_2318;
    float _2338 = _2336 + 1.0;
    bool _2340 = !_2152;
    float _2342 = _2340 ? _241 : as_type<float>(_2148);
    float _2344 = _2318 * _2330;
    float _2346 = fma(_2186, _2334, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2348 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2350 = isnan(_811);
    bool _2352 = _2348 || _2350;
    bool _2354 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2356 = _2352 || _2354;
    float _2358 = float(_2356);
    float _2360 = _1316 * _2338;
    float _2362 = in.m_74.w;
    float _2364 = -_1316;
    float _2366 = _2364 + 1.0;
    bool _2368 = _1024 != 1;
    float _2370 = -_2358;
    float _2372 = _2370 + 1.0;
    float _2374 = fma(_2322, _1044, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2376 = _2358 * _2366;
    float _2378 = _2162 + _1050;
    float _2380 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2382 = _811 + _2380;
    float _2384 = _2324 * _2376;
    float _2386 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2388 = _811 + _2386;
    float _2390 = fma(_2236, _2382, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2392 = _2164 + _2320;
    float _2394 = fma(_2372, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2384);
    float _2396 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2398 = _811 + _2396;
    float _2400 = _2360;
    float _2402 = _2346;
    float _2404 = _2394;
    if (!_2368)
    {
        _1458 = _1016;
    }
    float _2406 = _1458;
    float _2408 = fma(_2346, _2360, _2394);
    float _2410 = _2406;
    if (!_2368)
    {
        _2400 = _1016;
    }
    float _2412 = _2400;
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2416 = _2412;
    if (!_2368)
    {
        _2402 = _1034;
    }
    float _2418 = _2402;
    float _2420 = fma(_2282, _2398, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2422 = _2418;
    if (!_2368)
    {
        _2404 = _1034;
    }
    float _2424 = _2404;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2428 = _2424;
    if (_2368)
    {
        _2416 = _1014;
    }
    float _2430 = _2416;
    float _2432 = _2210 + _2362;
    if (_2368)
    {
        _2410 = _1014;
    }
    float _2434 = _2410;
    float _2436 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_2368)
    {
        _2422 = _1016;
    }
    float _2438 = _2422;
    float _2440 = fma(_2216, _1060, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2442 = _2440;
    if (_2368)
    {
        _2428 = _1016;
    }
    float _2444 = _2428;
    float _2446 = -_2414;
    float _2448 = fma(_2436, 2.0, _2446);
    bool _2450 = _1026 != 2;
    float _2452 = fma(_2374, _2344, _2408);
    float _2454 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2456 = fma(_2440, _2326, _2452);
    float _2458 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2460 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2462 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2464 = _2392 + _2462;
    float _2466 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2458);
    float _2468 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2470 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2426);
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2474 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2476 = -_2460;
    float _2478 = fma(_2468, 2.0, _2476);
    float _2480 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2482 = fma(_2454, -2.0, _2472);
    float _2484 = fma(_2390, _2298, _2456);
    float _2486 = fma(_2480, -2.0, _2474);
    float _2488 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2490 = _2378 + _2488;
    float _2492 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2494 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2496 = _1974 + (-0.5);
    float _2498 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2486);
    float _2500 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2502 = _2432 + _2500;
    float _2504 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2492);
    float _2506 = fma(_2444, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2494);
    int _2508 = _1962 >> 31;
    float _2510 = -_2496;
    float _2512 = -_2498;
    float _2514 = fma(_2510, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2512);
    float _2516 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2504);
    float _2518 = -_135;
    float _2520 = fma(_2518, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2448);
    float _2522 = _2342 + 0.5;
    int _2524 = _2508 & 3;
    float _2526 = fma(_2284, _2388, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2528 = 0.0;
    if (_2450)
    {
        _2528 = _1016;
    }
    float _2530 = _2528;
    float _2532 = fma(_2522, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2520);
    float _2534 = _2530;
    if (_2450)
    {
        _2442 = _1014;
    }
    float _2536 = _2442;
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2540 = _2536;
    if (!_2450)
    {
        _2540 = _1034;
    }
    float _2542 = _2540;
    float _2544 = -_135;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2478);
    if (!_2450)
    {
        _2534 = _1014;
    }
    float _2548 = _2534;
    float _2550 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2538);
    bool _2552 = _2516 >= 0.0;
    float _2554 = _1842 + 0.5;
    int _2556 = _1962 + _2524;
    float _2558 = fma(_2526, _2280, _2484);
    float _2560 = float(uint(_1734));
    float _2562 = fma(_2554, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2546);
    int _2564 = _2556 >> 2;
    float _2566 = _1986 + (-0.5);
    float _2568 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2482);
    int _2570 = _2564 << 4;
    int _2572 = _2570 + 656;
    float _2574 = as_type<float>(_1198) * _2560;
    float _2576 = -_2566;
    float _2578 = -_2568;
    float _2580 = fma(_2576, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2578);
    float _2582 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2584 = trunc(_2574);
    float _2586 = precise::max(_2584, 0.0);
    uint _2588 = uint(_2586);
    uint _2590 = uint(int(uint(_2572) >> uint(2)));
    uint _2592 = uint(int(uint(int(_2590)) >> uint(2)));
    int _2594 = int(_2590) & 3;
    float _2596 = (*spvDescriptorSet0.vp_c9)._m0[int(_2592)][_2594];
    int _2598 = int(_2590) + 1;
    uint _2600 = uint(int(uint(_2598) >> uint(2)));
    int _2602 = _2598 & 3;
    float _2604 = (*spvDescriptorSet0.vp_c9)._m0[int(_2600)][_2602];
    float _2606 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2608 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2610 = ~_847;
    int _2612 = _2610 + 1;
    float _2614 = _2430 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2616 = -_2608;
    float _2618 = fma(_2606, 2.0, _2616);
    float _2620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2622 = _2572 + 8;
    uint _2624 = uint(int(uint(_2622) >> uint(2)));
    uint _2626 = uint(int(uint(int(_2624)) >> uint(2)));
    int _2628 = int(_2624) & 3;
    float _2630 = (*spvDescriptorSet0.vp_c9)._m0[int(_2626)][_2628];
    int _2632 = int(_2624) + 1;
    uint _2634 = uint(int(uint(_2632) >> uint(2)));
    int _2636 = _2632 & 3;
    float _2638 = (*spvDescriptorSet0.vp_c9)._m0[int(_2634)][_2636];
    float _2640 = -_1332;
    float _2642 = fma(_2614, 2.0, _2640);
    float _2644 = _2438 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2646 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2648 = _2574;
    if (_2552)
    {
        _2648 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2650 = _2648;
    float _2652 = _2548 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2654 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2466);
    int _2656 = _2612 * int(_2588);
    int _2658 = _2656 + _1734;
    float _2660 = fma(_2644, -2.0, _2582);
    float _2662 = fma(_2652, -2.0, _2646);
    int _2664 = as_type<int>(_2650);
    if (_2552)
    {
        float _2666 = _2650 * 5.0;
        _2664 = as_type<int>(_2666);
    }
    int _2668 = _2664;
    float _2670 = float(uint(_2658));
    float _2672 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2470);
    int _2674 = abs(_2022);
    float _2676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2552)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9401 = as_type<float>(_2668);
        out.gl_Position.z = _9401;
    }
    float _2678 = as_type<float>(_1198) * _2670;
    float _2680 = -_2654;
    float _2682 = _2680 + 1.0;
    float _2684 = -_2672;
    float _2686 = _2684 + 1.0;
    int _2688 = abs(_2082);
    float _2690 = fma(_2420, _2250, _2558);
    float _2692 = -_2682;
    float _2694 = fma(_2692, _1842, _2562);
    float _2696 = _2620 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2698 = fma(_2686, _1974, _2514);
    int _2700 = ~_2064;
    int _2702 = _2700 + _2132;
    int _2704 = _2702 + 1;
    float _2706 = trunc(_2678);
    float _2708 = precise::max(_2706, 0.0);
    uint _2710 = uint(_2708);
    int _2712 = ~_2048;
    int _2714 = _2712 + _2112;
    int _2716 = _2714 + 1;
    float _2718 = _1486 + (-0.5);
    float _2720 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2660);
    out.m_84.x = _2694;
    out.m_84.y = _2698;
    int _2722 = abs(_2104);
    float _2724 = _2676 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2726 = -_2696;
    float _2728 = -_2720;
    float _2730 = fma(_2726, _2718, _2728);
    float _2732 = _1386 + 0.5;
    int _2734 = abs(_2038);
    float _2736 = -_135;
    float _2738 = fma(_2736, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2642);
    int _2740 = ~_2674;
    int _2742 = _2740 + 1;
    int _2744 = _2742 + 1;
    float _2746 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2690);
    int _2748 = abs(_2096);
    int _2750 = _847 * _2704;
    int _2752 = _2750 + _1826;
    int _2754 = int(_2588) + int(_2710);
    int _2756 = _2744 * as_type<int>(_2604);
    int _2758 = ~_2734;
    int _2760 = _2758 + 1;
    int _2762 = _2760 + 1;
    float _2764 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2766 = int(_2764);
    float _2768 = fma(_2724, _2732, _2738);
    bool _2770 = !_1666;
    int _2772 = _2770 ? _2752 : (-1);
    int _2774 = _2762 * as_type<int>(_2596);
    int _2776 = _2774 + _2756;
    int _2778 = ~_2688;
    int _2780 = _2778 + 1;
    int _2782 = _2780 + 1;
    out.m_86.x = _2746;
    int _2784 = ~_2748;
    int _2786 = _2784 + 1;
    int _2788 = _2786 + 1;
    float _2790 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2662);
    int _2792 = _1822 >> 31;
    int _2794 = _2782 * as_type<int>(_2630);
    int _2796 = _2794 + _2776;
    int _2798 = ~_2722;
    int _2800 = _2798 + 1;
    int _2802 = _2800 + 1;
    float _2804 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2506);
    int _2806 = _2792 & 3;
    int _2808 = _2788 * as_type<int>(_2638);
    int _2810 = _2808 + _2796;
    int _2812 = _2772 >> 31;
    int _2814 = _825 * _2716;
    int _2816 = _2814 + _1618;
    int _2818 = _1822 + _2806;
    int _2820 = _2810 * _2802;
    int _2822 = _2812 & 3;
    float _2824 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2550);
    bool _2826 = !_1538;
    int _2828 = _2826 ? _2816 : (-1);
    float _2830 = -_2804;
    float _2832 = _2830 + 1.0;
    float _2834 = float(uint(_2766));
    float _2836 = -_2824;
    float _2838 = _2836 + 1.0;
    bool _2840 = !_2120;
    int _2842 = _2840 ? 0 : 1;
    int _2844 = _2828 * _2722;
    int _2846 = _2844 + _2820;
    int _2848 = _2772 & 3;
    bool _2850 = _2848 != 0;
    float _2852 = 1.0 / _2834;
    int _2854 = _2772 + _2822;
    float _2856 = -_2838;
    float _2858 = fma(_1386, _2856, _2768);
    int _2860 = _2818 >> 2;
    float _2862 = _2858;
    if (_2552)
    {
        out.m_63.x = 0.0;
    }
    int _2864 = _2772 & 3;
    bool _2866 = _2864 != 0;
    int _2868 = abs(_2766);
    int _2870 = _2850 ? 0 : 1;
    int _2872 = _2860 << 4;
    int _2874 = _2872 + 368;
    bool _2876 = uint(_2864) > 1u;
    int _2878 = _2854 >> 2;
    float _2880 = float(uint(_2868));
    uint _2882 = uint(int(uint(_2874) >> uint(2)));
    uint _2884 = uint(int(uint(int(_2882)) >> uint(2)));
    int _2886 = int(_2882) & 3;
    float _2888 = (*spvDescriptorSet0.vp_c9)._m0[int(_2884)][_2886];
    int _2890 = int(_2882) + 1;
    uint _2892 = uint(int(uint(_2890) >> uint(2)));
    int _2894 = _2890 & 3;
    float _2896 = (*spvDescriptorSet0.vp_c9)._m0[int(_2892)][_2894];
    int _2898 = _2878 << 4;
    int _2900 = _2898 + 800;
    int _2902 = ~_2870;
    int _2904 = _2902 + 1;
    int _2906 = _2904 + 1;
    float _2908 = 1.0 / _2880;
    int _2910 = ~_847;
    int _2912 = _2910 + 1;
    uint _2914 = uint(int(uint(_2900) >> uint(2)));
    uint _2916 = uint(int(uint(int(_2914)) >> uint(2)));
    int _2918 = int(_2914) & 3;
    float _2920 = (*spvDescriptorSet0.vp_c9)._m0[int(_2916)][_2918];
    int _2922 = int(_2914) + 1;
    uint _2924 = uint(int(uint(_2922) >> uint(2)));
    int _2926 = _2922 & 3;
    float _2928 = (*spvDescriptorSet0.vp_c9)._m0[int(_2924)][_2926];
    int _2930 = _2906;
    if (!_2876)
    {
        int _2932 = ~_2870;
        int _2934 = _2932 + 1;
        _2930 = _2934;
    }
    int _2936 = _2930;
    bool _2938 = _2864 != 3;
    int _2940 = _2912 * _2754;
    int _2942 = _2940 + _1734;
    int _2944 = as_type<int>(_2852) + (-2);
    float _2946 = float(uint(_2846));
    bool _2948 = !_2866;
    int _2950 = _2948 ? 0 : 1;
    bool _2952 = uint(_2864) >= 2u;
    float _2954 = as_type<float>(_2944) * _2946;
    bool _2956 = !_1850;
    int _2958 = _2956 ? 0 : 1;
    int _2960 = _2952 ? 0 : 1;
    int _2962 = abs(_2846);
    float _2964 = trunc(_2954);
    float _2966 = precise::max(_2964, 0.0);
    uint _2968 = uint(_2966);
    bool _2970 = uint(_2942) >= uint(_847);
    int _2972 = as_type<int>(_2908) + (-2);
    int _2974 = _2874 + 8;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    uint _2978 = uint(int(uint(int(_2976)) >> uint(2)));
    int _2980 = int(_2976) & 3;
    float _2982 = (*spvDescriptorSet0.vp_c9)._m0[int(_2978)][_2980];
    int _2984 = int(_2976) + 1;
    uint _2986 = uint(int(uint(_2984) >> uint(2)));
    int _2988 = _2984 & 3;
    float _2990 = (*spvDescriptorSet0.vp_c9)._m0[int(_2986)][_2988];
    int _2992 = ~_2960;
    int _2994 = _2992 + 1;
    int _2996 = _2994 + 1;
    int _2998 = _2996;
    if (_2938)
    {
        int _3000 = ~_2960;
        int _3002 = _3000 + 1;
        _2998 = _3002;
    }
    int _3004 = _2998;
    float _3006 = float(uint(_2962));
    bool _3008 = _2864 != 3;
    int _3010 = _2900 + 8;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    uint _3014 = uint(int(uint(int(_3012)) >> uint(2)));
    int _3016 = int(_3012) & 3;
    float _3018 = (*spvDescriptorSet0.vp_c9)._m0[int(_3014)][_3016];
    int _3020 = int(_3012) + 1;
    uint _3022 = uint(int(uint(_3020) >> uint(2)));
    int _3024 = _3020 & 3;
    float _3026 = (*spvDescriptorSet0.vp_c9)._m0[int(_3022)][_3024];
    float _3028 = as_type<float>(_2972) * _3006;
    bool _3030 = _1848 != 3;
    int _3032 = ~_2766;
    int _3034 = _3032 + 1;
    float _3036 = trunc(_3028);
    float _3038 = precise::max(_3036, 0.0);
    uint _3040 = uint(_3038);
    bool _3042 = !_2970;
    int _3044 = _3042 ? 0 : (-1);
    bool _3046 = !_3030;
    int _3048 = _3046 ? 0 : (-1);
    int _3050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3052 = _3050 != 0;
    int _3054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3056 = _3054 != 0;
    int _3058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3060 = _3058 != 0;
    int _3062 = ~_1998;
    int _3064 = _3062 + _2062;
    int _3066 = _3064 + 1;
    int _3068 = _3034 * int(_2968);
    int _3070 = _3068 + _2846;
    int _3072 = abs(_1898);
    int _3074 = ~_2868;
    int _3076 = _3074 + 1;
    int _3078 = _819 * _3066;
    int _3080 = _3078 + _1168;
    int _3082 = ~_3072;
    int _3084 = _3082 + 1;
    int _3086 = _3084 + 1;
    float _3088 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3090 = abs(_2936);
    float _3092 = float(uint(_3070));
    int _3094 = _3086 * as_type<int>(_2896);
    int _3096 = ~_3090;
    int _3098 = _3096 + 1;
    int _3100 = _3098 + 1;
    float _3102 = as_type<float>(_2944) * _3092;
    int _3104 = ~_2754;
    int _3106 = _3104 + _3044;
    int _3108 = _3106 + 1;
    int _3110 = _3076 * int(_3040);
    int _3112 = _3110 + _2962;
    int _3114 = abs(_2950);
    int _3116 = _3100 * as_type<int>(_2928);
    int _3118 = abs(_2958);
    float _3120 = trunc(_3102);
    float _3122 = precise::max(_3120, 0.0);
    uint _3124 = uint(_3122);
    float _3126 = float(uint(_3112));
    int _3128 = _847 * _3108;
    int _3130 = _3128 + _1734;
    int _3132 = abs(_1938);
    int _3134 = ~_3118;
    int _3136 = _3134 + 1;
    int _3138 = _3136 + 1;
    float _3140 = as_type<float>(_2972) * _3126;
    int _3142 = ~_3114;
    int _3144 = _3142 + 1;
    int _3146 = _3144 + 1;
    int _3148 = abs(_3004);
    int _3150 = _3138 * as_type<int>(_2888);
    int _3152 = _3150 + _3094;
    float _3154 = trunc(_3140);
    float _3156 = precise::max(_3154, 0.0);
    uint _3158 = uint(_3156);
    int _3160 = ~_3132;
    int _3162 = _3160 + 1;
    int _3164 = _3162 + 1;
    int _3166 = _3146 * as_type<int>(_2920);
    int _3168 = _3166 + _3116;
    int _3170 = ~_3148;
    int _3172 = _3170 + 1;
    int _3174 = _3172 + 1;
    int _3176 = abs(_3048);
    int _3178 = _3164 * as_type<int>(_2982);
    int _3180 = _3178 + _3152;
    bool _3182 = !_3008;
    int _3184 = _3182 ? 0 : (-1);
    int _3186 = _3174 * as_type<int>(_3018);
    int _3188 = _3186 + _3168;
    int _3190 = ~_2766;
    int _3192 = _3190 + 1;
    int _3194 = int(_2968) + int(_3124);
    int _3196 = ~_3176;
    int _3198 = _3196 + 1;
    int _3200 = _3198 + 1;
    int _3202 = abs(_3184);
    int _3204 = _3192 * _3194;
    int _3206 = _3204 + _2846;
    int _3208 = abs(_2842);
    int _3210 = _3200 * as_type<int>(_2990);
    int _3212 = _3210 + _3180;
    bool _3214 = _819 == 0;
    int _3216 = ~_3202;
    int _3218 = _3216 + 1;
    int _3220 = _3218 + 1;
    int _3222 = int(_3040) + int(_3158);
    int _3224 = ~_2868;
    int _3226 = _3224 + 1;
    int _3228 = _3220 * as_type<int>(_3026);
    int _3230 = _3228 + _3188;
    bool _3232 = !_3214;
    int _3234 = _3232 ? _3080 : (-1);
    int _3236 = _3226 * _3222;
    int _3238 = _3236 + _2962;
    bool _3240 = uint(_3206) >= uint(_2766);
    int _3242 = ~_3208;
    int _3244 = _3242 + 1;
    int _3246 = _3244 + 1;
    float _3248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3250 = !_3240;
    int _3252 = _3250 ? 0 : (-1);
    bool _3254 = uint(_3238) >= uint(_2868);
    int _3256 = _3212 * _3246;
    int _3258 = ~_3194;
    int _3260 = _3258 + _3252;
    int _3262 = _3260 + 1;
    float _3264 = -_135;
    float _3266 = fma(_3264, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2618);
    bool _3268 = !_2126;
    int _3270 = _3268 ? 0 : 1;
    int _3272 = _3234 * _3208;
    int _3274 = _3272 + _3256;
    int _3276 = _2846 ^ _2766;
    bool _3278 = !_3254;
    int _3280 = _3278 ? 0 : (-1);
    int _3282 = abs(_3270);
    int _3284 = _2766 * _3262;
    int _3286 = _3284 + _2846;
    uint _3288 = uint(int(uint(_3276) >> uint(31)));
    float _3290 = _3248 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3292 = _2766 == 0;
    int _3294 = ~_3280;
    int _3296 = _3222 + _3294;
    int _3298 = _3296 + 1;
    int _3300 = ~int(_3288);
    int _3302 = _3300 + 1;
    bool _3304 = !_3292;
    int _3306 = _3304 ? _3286 : (-1);
    int _3308 = _3298 ^ _3302;
    float _3310 = float(_3306);
    int _3312 = ~_3282;
    int _3314 = _3312 + 1;
    int _3316 = _3314 + 1;
    bool _3318 = _2766 == 0;
    int _3320 = ~_3302;
    int _3322 = _3320 + _3308;
    int _3324 = _3322 + 1;
    float _3326 = fma(_3290, _3310, _3266);
    bool _3328 = !_1666;
    int _3330 = _3328 ? _3130 : (-1);
    int _3332 = _3230 * _3316;
    bool _3334 = !_3318;
    int _3336 = _3334 ? _3324 : (-1);
    float _3338 = _1148 + 0.5;
    int _3340 = _3330 * _3282;
    int _3342 = _3340 + _3332;
    float _3344 = float(_3336);
    float _3346 = _3088 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3348 = fma(_3290, _3338, _3326);
    float _3350 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3352 = -_2790;
    float _3354 = fma(_3346, _3344, _3352);
    float _3356 = _1144 + (-0.5);
    float _3358 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3360 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3350);
    float _3362 = -_3346;
    float _3364 = fma(_3362, _3356, _3354);
    float _3366 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3358);
    float _3368 = _2464 * _2464;
    float _3370 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3360);
    float _3372 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3374 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3366);
    float _3376 = -_3370;
    float _3378 = _3376 + 1.0;
    float _3380 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3372);
    float _3382 = -_3374;
    float _3384 = _3382 + 1.0;
    float _3386 = fma(_2490, _2490, _3368);
    float _3388 = -_3378;
    float _3390 = fma(_1148, _3388, _3348);
    float _3392 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3380);
    float _3394 = -_3384;
    float _3396 = fma(_2342, _3394, _2532);
    float _3398 = fma(_2502, _2502, _3386);
    float _3400 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3402 = -_3392;
    float _3404 = _3402 + 1.0;
    float _3406 = _617 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3408 = rsqrt(_3398);
    float _3410 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3400);
    float _3412 = fma(_1486, _2832, _2730);
    float _3414 = float(_3274);
    float _3416 = fma(_1986, _3404, _2580);
    float _3418 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3410);
    float _3420 = _3406 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3422 = float(_3342);
    out.m_88.x = _3414;
    float _3424 = -_3418;
    float _3426 = _3424 + 1.0;
    bool _3428 = !_3056;
    int _3430 = _3428 ? 0 : 1;
    out.m_90.x = _3396;
    out.m_90.y = _3416;
    out.m_90.z = _2858;
    out.m_90.w = _3412;
    float _3432 = fma(_1144, _3426, _3364);
    bool _3434 = !_3060;
    int _3436 = _3434 ? 0 : 1;
    float _3438 = _3420 * _3408;
    out.m_88.w = _3422;
    bool _3440 = !_3052;
    int _3442 = _3440 ? 0 : 1;
    float _3444 = _2490 * _3438;
    out.m_92.x = _3390;
    out.m_92.y = _3432;
    float _3446 = _2464 * _3438;
    if (_2552)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3448 = -_3446;
    float _3450 = _2392 + _3448;
    float _3452 = _2502 * _3438;
    float _3454 = -_3444;
    float _3456 = _2378 + _3454;
    float _3458 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3460 = _3450 + _3458;
    float _3462 = -_3452;
    float _3464 = _2432 + _3462;
    float _3466 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3468 = _3456 + _3466;
    float _3470 = _3460 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3472 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3474 = _3464 + _3472;
    float _3476 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3470);
    float _3478 = fma(_3474, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3476);
    bool _3480 = _3478 >= 0.0;
    float _3482 = _3468;
    float _3484 = _3464;
    if (_3480)
    {
        _2862 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3486 = _2862;
    int _3488 = as_type<int>(_3486);
    if (_3480)
    {
        out.m_63.x = 0.0;
    }
    if (_3480)
    {
        float _3490 = _3486 * 5.0;
        _3488 = as_type<int>(_3490);
    }
    int _3492 = _3488;
    if (_3480)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10580 = as_type<float>(_3492);
        out.gl_Position.z = _10580;
    }
    if (_3480)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3494 = fma(_3456, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3496 = fma(_3464, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3498 = floor(_3494);
    float _3500 = floor(_3496);
    float _3502 = -_3498;
    float _3504 = _3494 + _3502;
    float _3506 = -_3500;
    float _3508 = _3496 + _3506;
    float2 _10616 = float2(_3504, _3508);
    float _3510 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10616, float2(0.0), isnan(_10616)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10616, float2(0.0), isnan(_10616)), level(0.0)).x;
    float _3512 = _1034 * 2.0;
    float _3514 = _1014 * 2.0;
    float _3516 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3518 = log2(_3516);
    float _3520 = _1016 + _1014;
    float _3522 = _1016 * 2.0;
    int _3524 = abs(_3442);
    float _3526 = -_3446;
    float _3528 = _2464 + _3526;
    float _3530 = _3520 + (-1.0);
    float _3532 = -_3444;
    float _3534 = _2490 + _3532;
    float _3536 = -_3452;
    float _3538 = _2502 + _3536;
    float _3540 = floor(_3512);
    float _3542 = _3528 * _3528;
    int _3544 = abs(_3436);
    float _3546 = _615 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3548 = floor(_3514);
    float _3550 = _3518 * _135;
    bool _3552 = _3540 > 0.0;
    float _3554 = floor(_3522);
    bool _3556 = _3540 >= 0.0;
    bool _3558 = isnan(_3540);
    bool _3560 = _3556 || _3558;
    bool _3562 = isnan(0.0);
    bool _3564 = _3560 || _3562;
    float _3566 = fma(_3530, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3568 = _1016 + _1034;
    float _3570 = _1016 + (-0.5);
    int _3572 = _3564 ? 0 : 1;
    float _3574 = _3568 + (-1.0);
    bool _3576 = _3548 >= 0.0;
    bool _3578 = isnan(_3548);
    bool _3580 = _3576 || _3578;
    bool _3582 = isnan(0.0);
    bool _3584 = _3580 || _3582;
    float _3586 = exp2(_3550);
    int _3588 = ~_3572;
    int _3590 = _3588 + 1;
    int _3592 = _3590 + 1;
    float _3594 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _3596 = _3592;
    int _3598 = 2;
    if (!_3552)
    {
        int _3600 = ~_3572;
        int _3602 = _3600 + 1;
        _3596 = _3602;
    }
    int _3604 = _3596;
    float _3606 = _3450 + _3594;
    bool _3608 = _3548 > 0.0;
    bool _3610 = _3554 > 0.0;
    float _3612 = fma(_3574, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _3614 = _3554 >= 0.0;
    bool _3616 = isnan(_3554);
    bool _3618 = _3614 || _3616;
    bool _3620 = isnan(0.0);
    bool _3622 = _3618 || _3620;
    float _3624 = in.m_94.x;
    float _3626 = in.m_94.y;
    float _3628 = in.m_94.z;
    float _3630 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3632 = 1.0 + _3630;
    int _3634 = _3584 ? 0 : 1;
    float _3636 = float(_3604);
    float _3638 = 1.0 / _3632;
    float _3640 = float(_3524);
    float _3642 = -_3586;
    float _3644 = _3642 + 1.0;
    int _3646 = ~_3634;
    int _3648 = _3646 + 1;
    int _3650 = _3648 + 1;
    int _3652 = _3650;
    if (!_3608)
    {
        int _3654 = ~_3634;
        int _3656 = _3654 + 1;
        _3652 = _3656;
    }
    int _3658 = _3652;
    float _3660 = _3640 * _3636;
    bool _3662 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3664 = isnan(1.0);
    bool _3666 = _3662 || _3664;
    bool _3668 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3670 = _3666 || _3668;
    float _3672 = fma(_3534, _3534, _3542);
    int _3674 = abs(_3430);
    float _3676 = _3660 * (-2.0);
    float _3678 = float(_3658);
    float _3680 = fma(_3538, _3538, _3672);
    float _3682 = float(_3674);
    float _3684 = fma(_3566, _3676, _3566);
    bool _3686 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3688 = isnan(0.0);
    bool _3690 = _3686 || _3688;
    bool _3692 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3694 = _3690 || _3692;
    float _3696 = _3682 * _3678;
    float _3698 = _3694 ? _3644 : 0.0;
    float _3700 = _1014 + (-0.5);
    float _3702 = fma(_3676, _3624, _3624);
    float _3704 = _1014 + _1034;
    float _3706 = _1034 + (-0.5);
    if (_3670)
    {
        float _3708 = _3698 * _3638;
        _145 = _3708;
    }
    float _3710 = _145;
    float _3712 = fma(_3700, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3702);
    int _3714 = _3622 ? 0 : 1;
    float _3716 = _3696 * (-2.0);
    float _3718 = _3704 + (-1.0);
    float _3720 = fma(_3684, _3710, _3712);
    int _3722 = ~_3714;
    int _3724 = _3722 + 1;
    int _3726 = _3724 + 1;
    float _3728 = fma(_3612, _3716, _3612);
    float _3730 = fma(_3716, _3626, _3626);
    int _3732 = _3726;
    if (!_3610)
    {
        int _3734 = ~_3714;
        int _3736 = _3734 + 1;
        _3732 = _3736;
    }
    int _3738 = _3732;
    float _3740 = _3720 * 0.15915493667125701904296875;
    float _3742 = fma(_3570, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3730);
    float _3744 = float(_3738);
    float _3746 = _3740 * 6.283185482025146484375;
    float _3748 = sin(_3746);
    float _3750 = float(_3544);
    float _3752 = fma(_3728, _3710, _3742);
    float _3754 = _3750 * _3744;
    float _3756 = _3752 * 0.15915493667125701904296875;
    float _3758 = _3740 * 6.283185482025146484375;
    float _3760 = cos(_3758);
    float _3762 = _3754 * (-2.0);
    float _3764 = fma(_3718, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3766 = fma(_3762, _3628, _3628);
    float _3768 = fma(_3764, _3762, _3764);
    float _3770 = _3756 * 6.283185482025146484375;
    float _3772 = sin(_3770);
    float _3774 = fma(_3706, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3766);
    float _3776 = fma(_3768, _3710, _3774);
    float _3778 = _3450 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3780 = _3756 * 6.283185482025146484375;
    float _3782 = cos(_3780);
    float _3784 = _3776 * 0.15915493667125701904296875;
    float _3786 = fma(_3456, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3778);
    float _3788 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3786);
    float _3790 = sqrt(_3680);
    float _3792 = _3748 * _3772;
    float _3794 = _3788 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3796 = _3450 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3798 = _3760 * _3772;
    float _3800 = fma(_3456, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3796);
    float _3802 = 1.0 / _3794;
    float _3804 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3800);
    float _3806 = _3804 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3808 = _3784 * 6.283185482025146484375;
    float _3810 = sin(_3808);
    float _3812 = _3760 * _3782;
    float _3814 = _3408 * _3790;
    float _3816 = _3806 + _3794;
    float _3818 = _3814 * _3546;
    float _3820 = _3406 * _3814;
    float _3822 = _3784 * 6.283185482025146484375;
    float _3824 = cos(_3822);
    float _3826 = _3816 * _3802;
    float _3828 = _3826 * 0.5;
    float _3830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3832 = _3814 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3834 = _3832 * 0.5;
    float _3836 = _3830 * _3818;
    float _3838 = fma(_3810, _3812, _3792);
    float _3840 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3842 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3840);
    float _3844 = fma(_3810, _3792, _3812);
    float _3846 = _3748 * _3782;
    float _3848 = 1.0 / _3842;
    float _3850 = -_3798;
    float _3852 = fma(_3810, _3846, _3850);
    float _3854 = _3760 * _3824;
    float _3856 = _3782 * _3824;
    float _3858 = _3748 * _3824;
    float _3860 = _3772 * _3824;
    float _3862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _241);
    float _3864 = -_3846;
    float _3866 = fma(_3810, _3798, _3864);
    float _3868 = -_3836;
    float _3870 = _3810 * _3868;
    float _3872 = _3858 * _3836;
    float _3874 = _3862 * _3820;
    float _3876 = _3606 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3878 = _3854 * _3836;
    float _3880 = _3606 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3882 = fma(_3856, _3874, _3870);
    float _3884 = fma(_3456, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3876);
    float _3886 = fma(_3852, _3874, _3872);
    float _3888 = fma(_3838, _3874, _3878);
    float _3890 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3892 = _3848 * _3890;
    float _3894 = fma(_3464, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3884);
    float _3896 = fma(_3456, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3880);
    float _3898 = fma(_3866, _3834, _3888);
    float _3900 = fma(_3860, _3834, _3882);
    bool _3902 = _3892 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3904 = _3894 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _3906 = _3892 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3908 = _3898 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3910 = fma(_3844, _3834, _3886);
    float _3912 = fma(_3464, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3896);
    float _3914 = trunc(_3904);
    int _3916 = int(_3914);
    float _3918 = _3898 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3920 = fma(_3900, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3908);
    float _3922 = _3912 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _3924 = !_3902;
    int _3926 = _3924 ? 0 : 1;
    float _3928 = fma(_3900, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3918);
    float _3930 = fma(_3910, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3920);
    int _3932 = as_type<int>(_3898);
    int _3934 = as_type<int>(_3910);
    float _3936 = _3904;
    if (!_3902)
    {
        _3598 = 1;
    }
    int _3938 = _3598;
    float _3940 = trunc(_3922);
    int _3942 = int(_3940);
    int _3944 = _3938;
    if (!_3906)
    {
        _3944 = _3926;
    }
    int _3946 = _3944;
    float _3948 = fma(_3910, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3928);
    float _3950 = _3930 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _3952 = _3946 << 6;
    float _3954 = _3948 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3956 = _2432 + _3950;
    int _3958 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3960 = _3916 + _3958;
    int _3962 = _3960 + 1;
    int _3964 = _3952 + 56;
    uint _3966 = uint(int(uint(_3964) >> uint(2)));
    uint _3968 = uint(int(uint(int(_3966)) >> uint(2)));
    int _3970 = int(_3966) & 3;
    float _3972 = (*spvDescriptorSet0.vp_c15)._m0[int(_3968)][_3970];
    int _3974 = int(_3966) + 1;
    uint _3976 = uint(int(uint(_3974) >> uint(2)));
    int _3978 = _3974 & 3;
    float _3980 = (*spvDescriptorSet0.vp_c15)._m0[int(_3976)][_3978];
    float _3982 = _2378 + _3954;
    float _3984 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3986 = _3956 + _3984;
    bool _3988 = _3962 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _3990 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3992 = _3982 + _3990;
    float _3994 = _3986 * _3986;
    int _3996 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3998 = _3942 + _3996;
    int _4000 = _3998 + 1;
    int _4002 = _3952 + 48;
    uint _4004 = uint(int(uint(_4002) >> uint(2)));
    uint _4006 = uint(int(uint(int(_4004)) >> uint(2)));
    int _4008 = int(_4004) & 3;
    float _4010 = (*spvDescriptorSet0.vp_c15)._m0[int(_4006)][_4008];
    int _4012 = int(_4004) + 1;
    uint _4014 = uint(int(uint(_4012) >> uint(2)));
    int _4016 = _4012 & 3;
    float _4018 = (*spvDescriptorSet0.vp_c15)._m0[int(_4014)][_4016];
    float _4020 = fma(_3992, _3992, _3994);
    int _4022 = _3962 | _4000;
    float _4024 = sqrt(_4020);
    bool _4026 = _4022 < 0;
    bool _4028 = _4026 || _3988;
    int _4030 = _3952 + 64;
    uint _4032 = uint(int(uint(_4030) >> uint(2)));
    uint _4034 = uint(int(uint(int(_4032)) >> uint(2)));
    int _4036 = int(_4032) & 3;
    float _4038 = (*spvDescriptorSet0.vp_c15)._m0[int(_4034)][_4036];
    int _4040 = int(_4032) + 1;
    uint _4042 = uint(int(uint(_4040) >> uint(2)));
    int _4044 = _4040 & 3;
    float _4046 = (*spvDescriptorSet0.vp_c15)._m0[int(_4042)][_4044];
    float _4048 = _3898 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _4050 = _4000 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4052 = _4050 || _4028;
    float _4054 = fma(_3900, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4048);
    int _4056 = _3952 + 72;
    uint _4058 = uint(int(uint(_4056) >> uint(2)));
    uint _4060 = uint(int(uint(int(_4058)) >> uint(2)));
    int _4062 = int(_4058) & 3;
    float _4064 = (*spvDescriptorSet0.vp_c15)._m0[int(_4060)][_4062];
    int _4066 = int(_4058) + 1;
    uint _4068 = uint(int(uint(_4066) >> uint(2)));
    int _4070 = _4066 & 3;
    float _4072 = (*spvDescriptorSet0.vp_c15)._m0[int(_4068)][_4070];
    float _4074 = fma(_3910, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4054);
    float _4076 = _4074 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _4078 = _4024 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _4080 = _3952 + 96;
    uint _4082 = uint(int(uint(_4080) >> uint(2)));
    uint _4084 = uint(int(uint(int(_4082)) >> uint(2)));
    int _4086 = int(_4082) & 3;
    float _4088 = (*spvDescriptorSet0.vp_c15)._m0[int(_4084)][_4086];
    int _4090 = int(_4082) + 1;
    uint _4092 = uint(int(uint(_4090) >> uint(2)));
    int _4094 = _4090 & 3;
    float _4096 = (*spvDescriptorSet0.vp_c15)._m0[int(_4092)][_4094];
    int _4098 = _3962;
    int _4100 = as_type<int>(_4074);
    float _4102 = _3994;
    float _4104 = _3982;
    float _4106 = _3956;
    if (!_4052)
    {
        int _4108 = _4000 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4110 = _4108 + _3962;
        _3932 = _4110;
    }
    int _4112 = _3932;
    float _4114 = _2392 + _4076;
    if (!_4052)
    {
        int _4116 = _4112 << 2;
        _3934 = _4116;
    }
    int _4118 = _3934;
    int _4120 = _3952 + 104;
    uint _4122 = uint(int(uint(_4120) >> uint(2)));
    uint _4124 = uint(int(uint(int(_4122)) >> uint(2)));
    int _4126 = int(_4122) & 3;
    float _4128 = (*spvDescriptorSet0.vp_c15)._m0[int(_4124)][_4126];
    int _4130 = int(_4122) + 1;
    uint _4132 = uint(int(uint(_4130) >> uint(2)));
    int _4134 = _4130 & 3;
    float _4136 = (*spvDescriptorSet0.vp_c15)._m0[int(_4132)][_4134];
    float _4138 = as_type<float>(_4118);
    if (!_4052)
    {
        uint _4140 = uint(int(uint(_4112) >> uint(2)));
        _4098 = int(_4140);
    }
    int _4142 = _4098;
    float _4144 = as_type<float>(_4142);
    if (!_4052)
    {
        int _4146 = 12 & _4118;
        _4100 = _4146;
    }
    int _4148 = _4100;
    if (!_4078)
    {
        _4102 = _3982;
    }
    float _4150 = _4102;
    float _4152 = _4150;
    if (!_4052)
    {
        int _4154 = _4142 << 4;
        int _4156 = _4154 + _4148;
        _4144 = as_type<float>(_4156);
    }
    float _4158 = _4144;
    if (!_4078)
    {
        _4104 = _4114;
    }
    float _4160 = _4104;
    bool _4162 = !_4078;
    float _4164 = _4160;
    if (!_4162)
    {
        float _4166 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4168 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4170 = _4024 + _4168;
        float _4172 = _4114 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4174 = rsqrt(_4020);
        float _4176 = _4170 * _4166;
        float _4178 = _4176 * 0.15915493667125701904296875;
        float _4180 = _4178 * 6.283185482025146484375;
        float _4182 = cos(_4180);
        float _4184 = _4178 * 6.283185482025146484375;
        float _4186 = sin(_4184);
        float _4188 = _4182 + (-1.0);
        float _4190 = fma(_4186, _4172, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4192 = _4188 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4194 = _4174 * _4190;
        float _4196 = fma(_4114, _4182, _4192);
        float _4198 = fma(_3992, _4194, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4200 = fma(_3986, _4194, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4164 = _4196;
        _4152 = _4198;
        _4106 = _4200;
        _4138 = _4188;
    }
    float _4202 = _4164;
    float _4204 = _4152;
    float _4206 = _4106;
    float _4208 = _4138;
    float _4210 = -_2392;
    float _4212 = _4210 + _4202;
    int _4214 = _3952 + 80;
    uint _4216 = uint(int(uint(_4214) >> uint(2)));
    uint _4218 = uint(int(uint(int(_4216)) >> uint(2)));
    int _4220 = int(_4216) & 3;
    float _4222 = (*spvDescriptorSet0.vp_c15)._m0[int(_4218)][_4220];
    int _4224 = int(_4216) + 1;
    uint _4226 = uint(int(uint(_4224) >> uint(2)));
    int _4228 = _4224 & 3;
    float _4230 = (*spvDescriptorSet0.vp_c15)._m0[int(_4226)][_4228];
    float _4232 = -_2378;
    float _4234 = _4232 + _4204;
    float _4236 = -_2432;
    float _4238 = _4236 + _4206;
    float _4240 = _4212 * _4212;
    float _4242 = _3606 * _4096;
    float _4244 = _4208;
    float _4246 = _4240;
    float _4248 = _4204;
    float _4250 = _4202;
    float _4252 = _4206;
    if (!_4052)
    {
        float _4254 = floor(_3904);
        _4244 = _4254;
    }
    float _4256 = _4244;
    float _4258 = _3606 * _4046;
    float _4260 = fma(_4234, _4234, _4240);
    int _4262 = _3952 + 88;
    uint _4264 = uint(int(uint(_4262) >> uint(2)));
    uint _4266 = uint(int(uint(int(_4264)) >> uint(2)));
    int _4268 = int(_4264) & 3;
    float _4270 = (*spvDescriptorSet0.vp_c15)._m0[int(_4266)][_4268];
    int _4272 = int(_4264) + 1;
    uint _4274 = uint(int(uint(_4272) >> uint(2)));
    int _4276 = _4272 & 3;
    float _4278 = (*spvDescriptorSet0.vp_c15)._m0[int(_4274)][_4276];
    float _4280 = fma(_3456, _4088, _4242);
    float _4282 = fma(_3456, _4038, _4258);
    float _4284 = fma(_4238, _4238, _4260);
    float _4286 = fma(_3464, _4128, _4280);
    if (!_4052)
    {
        float _4288 = floor(_3922);
        _4246 = _4288;
    }
    float _4290 = _4246;
    bool _4292 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _4294 = isnan(0.5);
    bool _4296 = _4292 || _4294;
    bool _4298 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4300 = _4296 || _4298;
    float _4302 = _4158;
    float _4304 = _4290;
    if (!_4052)
    {
        int _4306 = as_type<int>(_4158) + 400;
        uint _4308 = uint(int(uint(_4306) >> uint(2)));
        uint _4310 = uint(int(uint(int(_4308)) >> uint(2)));
        int _4312 = int(_4308) & 3;
        float _4314 = (*spvDescriptorSet0.vp_c15)._m0[int(_4310)][_4312];
        _4302 = _4314;
    }
    float _4316 = _4302;
    float _4318 = _4286 + _4136;
    float _4320 = _3606 * _4018;
    float _4322 = fma(_3464, _4064, _4282);
    float _4324 = sqrt(_4284);
    float _4326 = fma(_3456, _4010, _4320);
    float _4328 = fma(_3464, _3972, _4326);
    float _4330 = 1.0 / _4318;
    bool _4332 = _4324 > 0.0;
    bool _4334 = !_4332;
    if (!_4334)
    {
        float _4336 = _245 * _245;
        float _4338 = rsqrt(_4284);
        float _4340 = fma(_237, _237, _4336);
        float _4342 = fma(_247, _247, _4340);
        float _4344 = sqrt(_4342);
        float _4346 = _4234 * _4338;
        float _4348 = _4212 * _4338;
        float _4350 = _4238 * _4338;
        bool _4352 = _4344 > 0.0;
        bool _4354 = !_4352;
        if (!_4354)
        {
            float _4356 = rsqrt(_4342);
            float _4358 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4360 = _245 * _4356;
            float _4362 = _237 * _4356;
            float _4364 = _247 * _4356;
            float _4366 = _4348 * _4360;
            float _4368 = fma(_4346, _4362, _4366);
            float _4370 = _4358 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4372 = fma(_4350, _4364, _4368);
            float _4374 = _4372 * _4370;
            float _4376 = fma(_237, _4374, _4204);
            float _4378 = fma(_245, _4374, _4202);
            float _4380 = fma(_247, _4374, _4206);
            _4248 = _4376;
            _4250 = _4378;
            _4252 = _4380;
        }
    }
    float _4382 = _4248;
    float _4384 = _4250;
    float _4386 = _4252;
    float _4388 = -_3444;
    float _4390 = _4388 + _4382;
    float _4392 = -_3446;
    float _4394 = _4392 + _4384;
    float _4396 = -_3452;
    float _4398 = _4396 + _4386;
    float _4400 = _4328 + _3980;
    float _4402 = _4322 + _4072;
    float _4404 = _4394;
    float _4406 = _4390;
    float _4408 = _4398;
    float _4410 = _4402;
    if (!_4300)
    {
        float _4412 = _3460 * _3460;
        float _4414 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4416 = -_2432;
        float _4418 = _4416 + _4386;
        float _4420 = -_2392;
        float _4422 = _4420 + _4384;
        float _4424 = fma(_3468, _3468, _4412);
        float _4426 = -_2378;
        float _4428 = _4426 + _4382;
        float _4430 = fma(_3474, _3474, _4424);
        float _4432 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4434 = sqrt(_4430);
        float _4436 = 1.0 / _3814;
        float _4438 = precise::min(_4434, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4440 = _4438 * _4414;
        float _4442 = _4432 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4444 = _4440 * _4436;
        float _4446 = _4442 * _4444;
        float _4448 = _4418 * _4444;
        float _4450 = fma(_4422, _4446, _3450);
        float _4452 = fma(_4428, _4446, _3456);
        float _4454 = fma(_4442, _4448, _3464);
        _4404 = _4450;
        _4406 = _4452;
        _4408 = _4454;
    }
    float _4456 = _4404;
    float _4458 = _4406;
    float _4460 = _4408;
    float _4462 = _4456 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4464 = _4400 * _4330;
    float _4466 = _4456 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4468 = _4456 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4470 = fma(_4458, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4462);
    float _4472 = _4402 * _4330;
    float _4474 = fma(_4458, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4466);
    bool _4476 = _4464 >= 0.0;
    float _4478 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4470);
    float _4480 = fma(_4458, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4468);
    float _4482 = _4456 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4484 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4474);
    float _4486 = _4478 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _4488 = _4464 <= 1.0;
    bool _4490 = _4488 && _4476;
    float _4492 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4480);
    float _4494 = fma(_4458, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4482);
    float _4496 = _4484 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4498 = _4486 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _4500 = _4472 >= 0.0;
    bool _4502 = _4500 && _4490;
    float _4504 = _4492 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4506 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4494);
    float _4508 = fma(_4496, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4498);
    bool _4510 = _4472 <= 1.0;
    bool _4512 = _4510 && _4502;
    float _4514 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4516 = _4504 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4518 = _4506 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4520 = fma(_4504, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4508);
    float _4522 = _3606 * _4230;
    float _4524 = -_4516;
    float _4526 = fma(_4524, _4514, 1.0);
    float _4528 = _4486 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4530 = fma(_4518, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4520);
    float _4532 = _4486 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4534 = fma(_3456, _4222, _4522);
    float _4536 = fma(_4496, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4528);
    float _4538 = 1.0 / _4530;
    float _4540 = _4494;
    float _4542 = _4492;
    float _4544 = _4530;
    if (_4512)
    {
        float _4546 = float(_3946);
        _4540 = _4546;
    }
    float _4548 = _4540;
    float _4550 = fma(_4496, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4532);
    float _4552 = fma(_3464, _4270, _4534);
    float _4554 = fma(_4504, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4536);
    if (!_4052)
    {
        float _4556 = -_4290;
        float _4558 = _3922 + _4556;
        _4304 = _4558;
    }
    float _4560 = _4304;
    float _4562 = fma(_4504, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4550);
    float _4564 = _4552 + _4278;
    float _4566 = log2(_4526);
    float _4568 = fma(_4518, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4554);
    float _4570 = fma(_4518, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4562);
    if (!_4052)
    {
        float _4572 = -_4256;
        float _4574 = _3904 + _4572;
        _4410 = _4574;
    }
    float _4576 = _4410;
    float _4578 = _4564 * _4330;
    float _4580 = _4322;
    if (!_4052)
    {
        float _4582 = rint(_4316);
        float _4584 = precise::max(_4582, 0.0);
        uint _4586 = uint(_4584);
        uint _4588 = clamp(_4586, 0u, 65535u);
        _4580 = as_type<float>(_4588);
    }
    float _4590 = _4580;
    float _4592 = _4568 * _4538;
    float _4594 = _4570 * _4538;
    float _4596 = fma(_4592, 0.5, 0.5);
    float _4598 = fma(_4594, -0.5, 0.5);
    float _4600 = _4548;
    if (_4512)
    {
        float _4602 = rint(_4548);
        float _4604 = precise::max(_4602, 0.0);
        uint _4606 = uint(_4604);
        uint _4608 = clamp(_4606, 0u, 65535u);
        _4600 = as_type<float>(_4608);
    }
    float _4610 = _4600;
    float _4612 = _4566 * 0.693147182464599609375;
    float _4614 = _4612 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4616 = _4560;
    float _4618 = _4614;
    if (!_4052)
    {
        float3 _12365 = float3(_4576, _4560, float(as_type<int>(_4590)));
        float3 _12369 = select(_12365, float3(0.0), isnan(_12365));
        float _4620 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12369.xy, uint(rint(_12369.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12369.xy, uint(rint(_12369.z)), level(0.0)).x;
        _4616 = _4620;
    }
    float _4622 = _4616;
    float _4624 = _4612;
    if (_4512)
    {
        float3 _12384 = float3(_4464, _4472, float(as_type<int>(_4610)));
        float3 _12386 = select(_12384, float3(0.0), isnan(_12384));
        float _4626 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12386.xy, uint(rint(_12386.z)), _4578, level(0.0));
        _4624 = _4626;
    }
    float _4628 = _4624;
    float3 _12396 = float3(_4596, _4598, _4614);
    float _4630 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12396, float3(0.0), isnan(_12396)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12396, float3(0.0), isnan(_12396)), level(0.0)).x;
    float3 _12405 = float3(_4596, _4598, _4614);
    float4 _4633 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12405, float3(0.0), isnan(_12405)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12405, float3(0.0), isnan(_12405)), level(0.0)).xyzw;
    float _4635 = _4633.x;
    float _4637 = _4633.y;
    float _4639 = _4633.z;
    float _4641 = _4633.w;
    bool _4643 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4645 = isnan(0.5);
    bool _4647 = _4643 || _4645;
    bool _4649 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4651 = _4647 || _4649;
    if (_4052)
    {
        _3482 = 1.0;
    }
    float _4653 = _3482;
    float _4655 = _4653;
    if (_4651)
    {
        _4542 = 1.0;
    }
    float _4657 = _4542;
    float _4659 = _4657;
    float _4661 = _4637;
    float _4663 = _4635;
    if (!_4651)
    {
        float _4665 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4667 = _4665 * 0.15915493667125701904296875;
        float _4669 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4671 = _4667 * 6.283185482025146484375;
        float _4673 = cos(_4671);
        float _4675 = _4669 * 0.15915493667125701904296875;
        float _4677 = _4667 * 6.283185482025146484375;
        float _4679 = sin(_4677);
        float _4681 = 1.0 / _4673;
        float _4683 = _4675 * 6.283185482025146484375;
        float _4685 = cos(_4683);
        float _4687 = _4679 * _4681;
        float _4689 = _4675 * 6.283185482025146484375;
        float _4691 = sin(_4689);
        float _4693 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4695 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4693;
        float _4697 = _4685 * _4687;
        float _4699 = 1.0 / _4695;
        float _4701 = 1.0 / _4697;
        float _4703 = _4691 * _4701;
        float _4705 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4707 = fma(_3892, _4703, _4705);
        float _4709 = _4707 * _4699;
        float _4711 = precise::clamp(_4709, 0.0, 1.0);
        _4618 = _4667;
        _4659 = _4711;
    }
    float _4713 = _4618;
    float _4715 = _4659;
    float _4717 = _4713;
    if (!_4052)
    {
        int _4719 = _4112 << 4;
        int _4721 = _4719 + 2048;
        uint _4723 = uint(int(uint(_4721) >> uint(2)));
        uint _4725 = uint(int(uint(int(_4723)) >> uint(2)));
        int _4727 = int(_4723) & 3;
        float _4729 = (*spvDescriptorSet0.vp_c15)._m0[int(_4725)][_4727];
        int _4731 = int(_4723) + 1;
        uint _4733 = uint(int(uint(_4731) >> uint(2)));
        int _4735 = _4731 & 3;
        float _4737 = (*spvDescriptorSet0.vp_c15)._m0[int(_4733)][_4735];
        int _4739 = _4721 + 8;
        uint _4741 = uint(int(uint(_4739) >> uint(2)));
        uint _4743 = uint(int(uint(int(_4741)) >> uint(2)));
        int _4745 = int(_4741) & 3;
        float _4747 = (*spvDescriptorSet0.vp_c15)._m0[int(_4743)][_4745];
        int _4749 = int(_4741) + 1;
        uint _4751 = uint(int(uint(_4749) >> uint(2)));
        int _4753 = _4749 & 3;
        float _4755 = (*spvDescriptorSet0.vp_c15)._m0[int(_4751)][_4753];
        float _4757 = _3606 * _4737;
        float _4759 = fma(_3456, _4729, _4757);
        float _4761 = fma(_3464, _4747, _4759);
        float _4763 = _4761 + _4755;
        float _4765 = precise::clamp(_4763, 0.0, 1.0);
        float _4767 = -_4765;
        float _4769 = _4767 + _4622;
        float _4771 = fma(_4769, 500.0, 1.5);
        float _4773 = exp2(_4771);
        float _4775 = 0.0 + _4773;
        float _4777 = precise::clamp(_4775, 0.0, 1.0);
        _4655 = _4777;
    }
    float _4779 = _4655;
    float _4781 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4783 = _4456 + _4781;
    float _4785 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4787 = _4458 + _4785;
    float _4789 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4791 = _4460 + _4789;
    float _4793 = _4783 * _4783;
    float _4795 = fma(_4787, _4787, _4793);
    float _4797 = fma(_4791, _4791, _4795);
    float _4799 = rsqrt(_4797);
    float _4801 = _4799 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4803 = _4787 * _4801;
    float _4805 = _4791 * _4801;
    float _4807 = _4803 * _4803;
    float _4809 = _4805 * _4805;
    float _4811 = _4807 + _4809;
    float _4813 = sqrt(_4811);
    bool _4815 = _4813 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4817 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4819 = _4813 + _4817;
    float _4821 = _4791;
    float _4823 = _4819;
    float _4825 = _4783;
    if (_4815)
    {
        float _4827 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4821 = _4827;
    }
    float _4829 = _4821;
    if (_4815)
    {
        float _4831 = rsqrt(_4811);
        _4717 = _4831;
    }
    float _4833 = _4717;
    float _4835 = _4833;
    if (_4815)
    {
        float _4837 = _4819 * _4829;
        _4823 = _4837;
    }
    float _4839 = _4823;
    if (_4815)
    {
        float _4841 = _4839 * 0.15915493667125701904296875;
        _3484 = _4841;
    }
    float _4843 = _3484;
    float _4845 = _4799;
    if (_4815)
    {
        float _4847 = _4843 * 6.283185482025146484375;
        float _4849 = sin(_4847);
        _4845 = _4849;
    }
    float _4851 = _4845;
    float _4853 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4855 = precise::max(0.0, _4853);
    float _4857 = _4793;
    float _4859 = _4855;
    float _4861 = _4853;
    if (_4815)
    {
        float _4863 = _4843 * 6.283185482025146484375;
        float _4865 = cos(_4863);
        _4857 = _4865;
    }
    float _4867 = _4857;
    float _4869 = -_4801;
    float _4871 = -_4855;
    float _4873 = fma(_4783, _4869, _4871);
    if (!_4815)
    {
        _4825 = _4805;
    }
    float _4875 = _4825;
    float _4877 = _4875;
    if (_4815)
    {
        float _4879 = _4873 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4859 = _4879;
    }
    float _4881 = _4859;
    float _4883 = _4881;
    float _4885 = _4851;
    if (_4815)
    {
        float _4887 = fma(_4851, _4881, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4883 = _4887;
    }
    float _4889 = _4883;
    float _4891 = _4889;
    if (!_4815)
    {
        _4885 = _4803;
    }
    float _4893 = _4885;
    float _4895 = _4893;
    float _4897 = _4867;
    if (_4815)
    {
        float _4899 = _4867 + (-1.0);
        _4861 = _4899;
    }
    float _4901 = _4861;
    float _4903 = _4901;
    if (_4815)
    {
        float _4905 = _4833 * _4889;
        _3936 = _4905;
    }
    float _4907 = _3936;
    if (!_4815)
    {
        _4891 = _4873;
    }
    float _4909 = _4891;
    float _4911 = _4909;
    if (_4815)
    {
        float _4913 = _4901 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4903 = _4913;
    }
    float _4915 = _4903;
    if (_4815)
    {
        float _4917 = _4803 * _4907;
        _4895 = _4917;
    }
    float _4919 = _4895;
    if (!_4815)
    {
        _4835 = _4807;
    }
    float _4921 = _4835;
    float _4923 = _4921;
    if (_4815)
    {
        float _4925 = _4805 * _4907;
        _4877 = _4925;
    }
    float _4927 = _4877;
    if (_4815)
    {
        float _4929 = fma(_4873, _4867, _4915);
        _4911 = _4929;
    }
    float _4931 = _4911;
    if (_4815)
    {
        float _4933 = _4919 * _4919;
        _4923 = _4933;
    }
    float _4935 = _4923;
    if (!_4815)
    {
        _4897 = _4809;
    }
    float _4937 = _4897;
    float _4939 = _4937;
    if (_4815)
    {
        float _4941 = _4927 * _4927;
        _4939 = _4941;
    }
    float _4943 = _4939;
    float _4945 = sqrt(_4797);
    float _4947 = fma(_4931, _4931, _4935);
    float _4949 = _4947 + _4943;
    float _4951 = rsqrt(_4949);
    float _4953 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4955 = fma(_4945, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4953);
    float _4957 = precise::clamp(_4955, 0.0, 1.0);
    float _4959 = -_4957;
    float _4961 = _4959 + 1.0;
    float _4963 = abs(_4961);
    float _4965 = log2(_4963);
    float _4967 = _4951 * _4919;
    float _4969 = _4951 * _4931;
    float _4971 = _4951 * _4927;
    float _4973 = _4967 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4975 = -_4973;
    float _4977 = fma(_4969, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4975);
    float _4979 = -_4971;
    float _4981 = fma(_4979, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4977);
    float _4983 = _4965 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4985 = fma(_4981, -0.5, 0.5);
    float _4987 = fma(_4981, 0.5, 0.5);
    float _4989 = exp2(_4983);
    float _4991 = fma(_4987, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4993 = fma(_4987, _4991, -0.212114393711090087890625);
    float _4995 = _4969 + 1.0;
    float _4997 = sqrt(_4985);
    float _4999 = fma(_4987, _4993, 1.570728778839111328125);
    float _5001 = -_4969;
    float _5003 = fma(_4989, _4995, _5001);
    float _5005 = fma(_5003, 0.5, 0.5);
    float _5007 = _4997 * 0.636619746685028076171875;
    float _5009 = -_4999;
    float _5011 = fma(_5007, _5009, 1.0);
    float2 _12973 = float2(_5011, _5005);
    float3 _5015 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12973, float2(0.0), isnan(_12973)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12973, float2(0.0), isnan(_12973)), level(0.0)).xyz;
    float _5017 = _5015.x;
    float _5019 = _5015.y;
    float _5021 = _5015.z;
    float _5023 = abs(_3892);
    float _5025 = log2(_5023);
    float _5027 = _3838 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5029 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5031 = _3838 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5033 = _3838 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5035 = fma(_3856, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5027);
    float _5037 = fma(_5029, _5029, 1.0);
    float _5039 = fma(_3856, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5031);
    float _5041 = _3854 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5043 = _3854 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5045 = _3854 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5047 = fma(_3856, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5033);
    float _5049 = rsqrt(_5037);
    float _5051 = -_3810;
    float _5053 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5041);
    float _5055 = -_3810;
    float _5057 = fma(_5055, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5043);
    float _5059 = -_3810;
    float _5061 = fma(_5059, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5045);
    float _5063 = _5025 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5065 = _3866 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5067 = _3866 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5069 = _3866 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5071 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5047);
    float _5073 = _4486 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5075 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5065);
    float _5077 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5067);
    float _5079 = exp2(_5063);
    float _5081 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5069);
    float _5083 = fma(_3858, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5053);
    float _5085 = fma(_4496, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5073);
    float _5087 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5039);
    float _5089 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5035);
    float _5091 = _241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5093 = _5029 * _5083;
    float _5095 = fma(_3858, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5057);
    float _5097 = fma(_3858, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5061);
    float _5099 = fma(_4504, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5085);
    float _5101 = fma(_3844, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5075);
    float _5103 = fma(_3844, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5077);
    float _5105 = fma(_3844, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5081);
    float _5107 = fma(_5091, _5087, _5093);
    float _5109 = _5029 * _5095;
    float _5111 = _5029 * _5097;
    float _5113 = fma(_4518, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5099);
    float _5115 = _5029 * _5049;
    float _5117 = fma(_5091, _5089, _5109);
    float _5119 = fma(_5091, _5071, _5111);
    float _5121 = -_5101;
    float _5123 = _5115 * _5121;
    float _5125 = _4530 * 0.5;
    float _5127 = fma(_5079, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5129 = precise::clamp(_5127, 0.0, 1.0);
    out.m_96.x = _5087;
    out.m_96.y = _5089;
    out.m_96.z = _5071;
    float _5131 = _4965 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5133 = -_5105;
    float _5135 = _5115 * _5133;
    bool _5137 = _3892 <= 8000.0;
    bool _5139 = isnan(_3892);
    bool _5141 = _5137 || _5139;
    bool _5143 = isnan(8000.0);
    bool _5145 = _5141 || _5143;
    float _5147 = float(_5145);
    out.gl_Position.x = _4568;
    out.gl_Position.y = _4570;
    out.gl_Position.z = _5113;
    out.gl_Position.w = _4530;
    float _5149 = -_3510;
    float _5151 = _5149 + 1.0;
    float _5153 = _5113 + _4530;
    float _5155 = exp2(_5131);
    float _5157 = _5103 + _5117;
    bool _5159 = _4945 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5161 = isnan(_4945);
    bool _5163 = _5159 || _5161;
    bool _5165 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5167 = _5163 || _5165;
    float _5169 = _5153 * 0.5;
    float _5171 = fma(_5049, _5083, _5123);
    float _5173 = fma(_4570, -0.5, _5125);
    float _5175 = _5101 + _5107;
    float _5177 = fma(_5129, -2.0, 3.0);
    float _5179 = _5129 * _5129;
    float _5181 = -_5103;
    float _5183 = _5115 * _5181;
    float _5185 = _5179 * _5177;
    float _5187 = fma(_5049, _5095, _5183);
    float _5189 = fma(_5049, _5097, _5135);
    float _5191 = _4568 + _4530;
    float _5193 = -_5185;
    float _5195 = _5193 + 1.0;
    float _5197 = -_5155;
    float _5199 = _5197 + 1.0;
    float _5201 = _5105 + _5119;
    float _5203 = _5191 * 0.5;
    float _5205 = fma(_5195, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5185);
    float _5207 = _5199 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_98.x = _5171;
    out.m_98.y = _5187;
    out.m_98.z = _5189;
    float _5209 = _5205;
    float _5211 = _5199;
    if (!_5167)
    {
        _4544 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5213 = _4544;
    float _5215 = _5147 * _5205;
    float _5217 = _5213;
    float _5219 = _5213;
    if (!_4512)
    {
        _5209 = 1.0;
    }
    float _5221 = _5209;
    out.m_100.x = _5203;
    out.m_100.y = _5173;
    out.m_100.z = _5169;
    out.m_100.w = _4530;
    float _5223 = _5221;
    if (_4512)
    {
        bool _5225 = _4628 >= _4578;
        bool _5227 = isnan(_4628);
        bool _5229 = _5225 || _5227;
        bool _5231 = isnan(_4578);
        bool _5233 = _5229 || _5231;
        float _5235 = float(_5233);
        _5223 = _5235;
    }
    float _5237 = _5223;
    float _5239 = _5215 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_5167)
    {
        _5211 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5241 = _5211;
    out.m_102.x = _5175;
    out.m_102.y = _5157;
    out.m_102.z = _5201;
    float _5243 = _5151 * _5239;
    float _5245 = precise::clamp(_5243, 0.0, 1.0);
    float _5247 = _5237 * _4779;
    float _5249 = _5207 * _4630;
    float _5251 = -_5207;
    float _5253 = _5251 + 1.0;
    float _5255 = -_5245;
    float _5257 = fma(_5255, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5259 = _4715 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5261 = _4641 * _5249;
    float _5263 = -_5247;
    float _5265 = fma(_5263, _5257, 1.0);
    float _5267 = precise::clamp(_5265, 0.0, 1.0);
    float _5269 = _4641 * _5253;
    float _5271 = _5253;
    float _5273 = _5267;
    float _5275 = _5241;
    float _5277 = _5241;
    if (!_5167)
    {
        _5271 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5279 = _5271;
    float _5281 = _5267 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5283 = _5279;
    float _5285 = _5279;
    if (!_5167)
    {
        _5273 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5287 = _5273;
    out.m_104.x = _5281;
    float _5289 = _5021 * _5249;
    float _5291 = fma(_5017, _5261, _4635);
    float _5293 = fma(_5019, _5261, _4637);
    float _5295 = _5287;
    float _5297 = _5287;
    if (!_5167)
    {
        _4661 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5299 = _4661;
    float _5301 = fma(_4641, _5289, _4639);
    float _5303 = _5299;
    float _5305 = _5299;
    if (!_5167)
    {
        _4663 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5307 = _4663;
    out.m_106.x = _5291;
    out.m_106.y = _5293;
    out.m_106.z = _5301;
    out.m_106.w = _5269;
    bool _5309 = !_5167;
    float _5311 = _5307;
    float _5313 = _5307;
    if (!_5309)
    {
        bool _5315 = _4945 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5317 = isnan(_4945);
        bool _5319 = _5315 || _5317;
        bool _5321 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5323 = _5319 || _5321;
        if (!_5323)
        {
            float _5325 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5327 = _4945 + _5325;
            float _5329 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5331 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5329;
            float _5333 = 1.0 / _5331;
            float _5335 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5337 = _5335 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5339 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5341 = _5339 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5343 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5345 = _5343 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5347 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5349 = _5347 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5351 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5353 = _5351 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5355 = _5327 * _5333;
            float _5357 = precise::clamp(_5355, 0.0, 1.0);
            float _5359 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5361 = _5359 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5363 = fma(_5357, _5337, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5365 = fma(_5357, _5361, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5367 = fma(_5357, _5341, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5369 = fma(_5357, _5345, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5371 = fma(_5357, _5349, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5373 = fma(_5357, _5353, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5313 = _5365;
            _5277 = _5371;
            _5305 = _5363;
            _5285 = _5369;
            _5219 = _5367;
            _5297 = _5373;
            _5375 = true;
        }
        else
        {
            bool _5377 = _4945 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5379 = isnan(_4945);
            bool _5381 = _5377 || _5379;
            bool _5383 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5385 = _5381 || _5383;
            if (!_5385)
            {
                _5303 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5387 = _5303;
            _5305 = _5387;
            if (!_5385)
            {
                _5311 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5389 = _5311;
            _5313 = _5389;
            if (!_5385)
            {
                _5217 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5391 = _5217;
            _5219 = _5391;
            if (!_5385)
            {
                _5283 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5393 = _5283;
            _5285 = _5393;
            if (!_5385)
            {
                _5275 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5395 = _5275;
            _5277 = _5395;
            if (!_5385)
            {
                _5295 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5397 = _5295;
            bool _5399 = !_5385;
            _5297 = _5397;
            if (!_5399)
            {
                bool _5401 = _4945 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5403 = isnan(_4945);
                bool _5405 = _5401 || _5403;
                bool _5407 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5409 = _5405 || _5407;
                if (!_5409)
                {
                    float _5411 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5413 = _4945 + _5411;
                    float _5415 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5417 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5415;
                    float _5419 = 1.0 / _5417;
                    float _5421 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5423 = _5421 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5425 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5427 = _5425 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5429 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5431 = _5429 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5433 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5435 = _5433 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5437 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5439 = _5437 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5441 = _5413 * _5419;
                    float _5443 = precise::clamp(_5441, 0.0, 1.0);
                    float _5445 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5447 = _5445 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5449 = fma(_5443, _5423, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5451 = fma(_5443, _5447, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5453 = fma(_5443, _5427, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5455 = fma(_5443, _5431, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5457 = fma(_5443, _5435, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5459 = fma(_5443, _5439, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5313 = _5451;
                    _5277 = _5457;
                    _5305 = _5449;
                    _5285 = _5455;
                    _5219 = _5453;
                    _5297 = _5459;
                    _5375 = true;
                }
                else
                {
                    _5313 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5277 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5305 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5285 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5219 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5297 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5375 = false;
    float _5461 = _5313;
    float _5463 = _5277;
    float _5465 = _5305;
    float _5467 = _5285;
    float _5469 = _5219;
    float _5471 = _5297;
    float _5473 = fma(_5157, -0.5, 0.5);
    float _5475 = precise::clamp(_5473, 0.0, 1.0);
    float _5477 = -_5461;
    float _5479 = _5477 + _5463;
    float _5481 = _5259 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5483 = -_5465;
    float _5485 = _5483 + _5467;
    float _5487 = fma(_5475, _5479, _5461);
    out.m_108.x = 0.0;
    float _5489 = -_5469;
    float _5491 = _5489 + _5471;
    float _5493 = fma(_5475, _5485, _5465);
    float _5495 = _5487 * 0.586610972881317138671875;
    out.m_63.x = _5481;
    bool _5497 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5499 = fma(_5475, _5491, _5469);
    float _5501 = fma(_5493, 0.298911988735198974609375, _5495);
    bool _5503 = _4715 > 0.0;
    bool _5505 = isnan(_4715);
    bool _5507 = _5503 || _5505;
    bool _5509 = isnan(0.0);
    bool _5511 = _5507 || _5509;
    float _5513 = fma(_5499, 0.114477999508380889892578125, _5501);
    float _5515 = -_5513;
    float _5517 = _5493 + _5515;
    float _5519 = -_5513;
    float _5521 = _5487 + _5519;
    float _5523 = -_5513;
    float _5525 = _5499 + _5523;
    float _5527 = fma(_5517, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5513);
    float _5529 = fma(_5521, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5513);
    float _5531 = fma(_5525, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5513);
    bool _5533 = !_5497;
    if (!_5533)
    {
        float _5535 = -_4456;
        float _5537 = _5535 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5539 = -_4458;
        float _5541 = _5539 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5543 = -_4460;
        float _5545 = _5543 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5547 = _5537 * _5537;
        float _5549 = fma(_5541, _5541, _5547);
        float _5551 = fma(_5545, _5545, _5549);
        float _5553 = sqrt(_5551);
        float _5555 = rsqrt(_5551);
        float _5557 = -_5553;
        float _5559 = _5557 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5561 = _5559 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5563 = precise::clamp(_5561, 0.0, 1.0);
        float _5565 = _5541 * _5555;
        float _5567 = _5537 * _5555;
        float _5569 = abs(_5563);
        float _5571 = log2(_5569);
        float _5573 = _5545 * _5555;
        float _5575 = _5565 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5577 = _5157 * _5567;
        float _5579 = -_5567;
        float _5581 = -_5575;
        float _5583 = fma(_5579, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5581);
        float _5585 = fma(_5175, _5565, _5577);
        float _5587 = -_5573;
        float _5589 = fma(_5587, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5583);
        float _5591 = fma(_5201, _5573, _5585);
        float _5593 = precise::clamp(_5591, 0.0, 1.0);
        float _5595 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5597 = _5589 + _5595;
        float _5599 = _5571 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5601 = _5597 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5603 = precise::clamp(_5601, 0.0, 1.0);
        float _5605 = exp2(_5599);
        float _5607 = _5605 * _5603;
        float _5609 = _5593 * _5607;
        float _5611 = _5609 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5613 = _5609 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5615 = _5609 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_108.x = _5611;
        out.m_108.y = _5613;
        out.m_108.z = _5615;
    }
    out.m_110.x = _5527;
    out.m_110.y = _5529;
    out.m_110.z = _5531;
    if (_5511)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5617 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5617;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5375 = false;
    bool _639 = false;
    bool _457 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _124 = in.m_56.w;
    float _126 = in.m_58.w;
    float _128 = trunc(_124);
    int _131 = int(_128);
    float _133 = -_126;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _135;
    bool _139 = _131 >= 1;
    float _141 = 0.0;
    float _143 = _126;
    float _145 = _135;
    if (!_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _141;
    if (!_139)
    {
        out.m_63.x = 0.0;
    }
    int _149 = 0;
    if (!_139)
    {
        float _151 = _147 * 5.0;
        _149 = as_type<int>(_151);
    }
    int _153 = _149;
    int _155 = _153;
    if (!_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5685 = as_type<float>(_153);
        out.gl_Position.z = _5685;
    }
    if (!_139)
    {
        return out;
    }
    bool _157 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _159 = isnan(_126);
    bool _161 = _157 || _159;
    bool _163 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _165 = _161 || _163;
    float _167 = float(_131);
    bool _169 = _135 >= _167;
    bool _171 = !_165;
    bool _173 = _169 || _171;
    float _175 = 1.0 / _167;
    if (_173)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _143;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    float _179 = _135 * _175;
    float _181 = _179;
    if (_173)
    {
        float _183 = _177 * 5.0;
        _155 = as_type<int>(_183);
    }
    int _185 = _155;
    out.m_61.x = _179;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5748 = as_type<float>(_185);
        out.gl_Position.z = _5748;
    }
    if (_173)
    {
        return out;
    }
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_68.x;
    float _191 = in.m_68.y;
    float _193 = in.m_68.z;
    float _195 = in.m_70.x;
    float _197 = in.m_70.y;
    float _199 = in.m_70.z;
    float _201 = in.m_72.x;
    float _203 = in.m_72.y;
    float _205 = in.m_72.z;
    float _207 = in.m_74.x;
    float _209 = in.m_74.y;
    float _211 = in.m_74.z;
    int _213 = as_type<int>(_187) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_187) & 2;
    bool _219 = _217 != 0;
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _223 = !_219;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _191 * _197;
    float _229 = _191 * _203;
    float _231 = fma(_189, _195, _227);
    float _233 = _191 * _209;
    float _235 = fma(_189, _201, _229);
    float _237 = fma(_193, _199, _231);
    bool _239 = !_215;
    float _241 = _239 ? (-0.5) : 0.5;
    float _243 = fma(_189, _207, _233);
    float _245 = fma(_193, _205, _235);
    float _247 = fma(_193, _211, _243);
    bool _249 = !_221;
    float _267;
    if (!_249)
    {
        float _251 = in.m_76.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _251 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        _267 = _179;
    }
    _269 = false;
    float _271 = _267;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = _271 + _277;
    bool _281 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _283 = isnan(_271);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _271 + _305;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = 1.0 / _299;
    float _313 = 1.0 / _295;
    float _315 = 1.0 / _303;
    float _317 = _307 * _311;
    bool _319 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _321 = isnan(_271);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = _275 * _313;
    bool _333 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _335 = isnan(_271);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -_291;
    float _347 = _345 + 1.0;
    bool _349 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _351 = isnan(_271);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -_343;
    float _363 = _361 + 1.0;
    float _365 = _343 * _347;
    float _367 = _279 * _315;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = _359 * _363;
    float _387 = -_359;
    float _389 = _387 + 1.0;
    float _391 = fma(_379, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _393 = fma(_371, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _395 = _329 * _389;
    float _397 = -_329;
    float _399 = _397 + 1.0;
    float _401 = fma(_383, _317, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _403 = _391 * _395;
    float _405 = _393 * _395;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _407;
    float _411 = fma(_375, _317, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _413;
    float _417 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _419 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].y, _405);
    float _421 = fma(_409, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _423 = fma(_415, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _425 = fma(_401, _385, _417);
    float _427 = fma(_411, _385, _419);
    float _429 = fma(_421, _365, _425);
    float _431 = fma(_423, _365, _427);
    float _433 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[146].x, _429);
    float _435 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[146].y, _431);
    bool _437 = !_309;
    float _455;
    if (!_437)
    {
        float _439 = in.m_76.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        _455 = _179;
    }
    _457 = false;
    float _459 = _455;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _463 = _459 + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _469 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _471 = isnan(_459);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _489 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _491 = isnan(_459);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = 1.0 / _467;
    float _503 = -_479;
    float _505 = _503 + 1.0;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _507;
    bool _511 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _513 = isnan(_459);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = _499 * _505;
    float _525 = -_499;
    float _527 = _525 + 1.0;
    bool _529 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _531 = 1.0 / _483;
    float _533 = _521 * _527;
    float _535 = -_521;
    float _537 = _535 + 1.0;
    float _539 = 1.0 / _487;
    float _541 = _509 * _501;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _547 = fma(_541, _463, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _549 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _551 = isnan(_459);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _545 * _531;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _569 = _459 + _567;
    float _571 = _547 * _533;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = _459 + _573;
    float _577 = fma(_561, _569, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _579 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[115].x, _571);
    float _581 = _565 * _539;
    float _583 = -_559;
    float _585 = _583 + 1.0;
    float _587 = fma(_577, _523, _579);
    float _589 = fma(_581, _575, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _591 = _479 * _585;
    float _593 = in.m_78.x;
    float _595 = in.m_78.y;
    float _597 = fma(_589, _591, _587);
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _605 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[118].x, _597);
    float _607 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = _601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _611 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = _605 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_80.x = _607;
    out.m_80.y = _609;
    out.m_80.z = _611;
    out.m_80.w = _613;
    float _615 = _435 * _595;
    float _617 = _433 * _593;
    bool _619 = !_529;
    float _637;
    if (!_619)
    {
        float _621 = in.m_76.x;
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _625 = _621 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _627 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _629 = _627 * _623;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _637 = _635;
        _639 = true;
    }
    else
    {
        _637 = _179;
    }
    _639 = false;
    float _641 = _637;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _645 = _641 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _651 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _653 = isnan(_641);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _671 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _673 = isnan(_641);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = 1.0 / _649;
    float _685 = -_661;
    float _687 = _685 + 1.0;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _689;
    bool _693 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _695 = isnan(_641);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = _681 * _687;
    float _707 = -_681;
    float _709 = _707 + 1.0;
    bool _711 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _713 = 1.0 / _665;
    float _715 = _703 * _709;
    float _717 = -_703;
    float _719 = _717 + 1.0;
    float _721 = 1.0 / _669;
    float _723 = _691 * _683;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _727 = _725 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _729 = fma(_723, _645, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _731 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _733 = isnan(_641);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = _727 * _713;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _745;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _751 = _641 + _749;
    float _753 = _729 * _715;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _757 = _641 + _755;
    float _759 = fma(_743, _751, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _761 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[131].x, _753);
    float _763 = _747 * _721;
    float _765 = -_741;
    float _767 = _765 + 1.0;
    float _769 = fma(_759, _705, _761);
    float _771 = fma(_763, _757, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _773 = _661 * _767;
    float _775 = fma(_771, _773, _769);
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _783 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[134].x, _775);
    float _785 = _777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _789 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _791 = _783 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_82.x = _785;
    out.m_82.y = _787;
    out.m_82.z = _789;
    out.m_82.w = _791;
    bool _793 = !_711;
    if (!_793)
    {
        float _795 = in.m_76.x;
        float _797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _799 = _795 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _801 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _803 = _801 * _797;
        float _805 = floor(_803);
        float _807 = -_805;
        float _809 = _803 + _807;
        _181 = _809;
    }
    float _811 = _181;
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _815 = int(_813);
    float _817 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _819 = int(_817);
    float _821 = float(_815);
    float _823 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _825 = int(_823);
    float _827 = float(uint(_819));
    float _829 = 1.0 / _821;
    int _831 = ~_819;
    int _833 = _831 + 1;
    float _835 = 1.0 / _827;
    float _837 = float(uint(_825));
    float _839 = _829 * _135;
    int _841 = ~_819;
    int _843 = _841 + 1;
    float _845 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _847 = int(_845);
    int _849 = as_type<int>(_835) + (-2);
    float _851 = trunc(_839);
    int _853 = int(_851);
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _857 = _855 != 0;
    float _859 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _861 = int(_859);
    float _863 = float(uint(_853));
    float _865 = 0.0;
    if (_857)
    {
        _865 = 1.0;
    }
    float _867 = _865;
    int _869 = 0;
    int _871 = 0;
    float _873 = _867;
    if (_857)
    {
        _869 = 0;
        _871 = 0;
    }
    int _875 = _869;
    int _877 = _871;
    float _879 = 0.0;
    int _881 = _875;
    int _883 = _877;
    if (_857)
    {
        _879 = 1.0;
    }
    float _885 = _879;
    float _887 = as_type<float>(_849) * _863;
    float _889 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _891 = int(_889);
    float _893 = trunc(_887);
    float _895 = precise::max(_893, 0.0);
    uint _898 = uint(_895);
    float _900 = float(_891);
    float _902 = 1.0 / _900;
    int _904 = _843 * int(_898);
    int _906 = _904 + _853;
    float _908 = float(uint(_906));
    float _910 = as_type<float>(_849) * _908;
    float _912 = _908;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _916 = _900;
    float _918 = _885;
    if (_857)
    {
        float _920 = in.m_76.x;
        float _922 = in.m_76.y;
        _912 = _920;
        _914 = _922;
    }
    float _924 = _912;
    float _926 = _914;
    float _928 = trunc(_910);
    float _930 = precise::max(_928, 0.0);
    uint _932 = uint(_930);
    float _934 = 1.0 / _837;
    int _936 = int(_898) + int(_932);
    float _938 = float(_819);
    float _940 = float(_853);
    int _942 = _833 * _936;
    int _944 = _942 + _853;
    float _946 = 0.0;
    float _948 = _940;
    float _950 = _924;
    float _952 = _926;
    if (_857)
    {
        _946 = _924;
    }
    float _954 = _946;
    bool _956 = _940 >= _938;
    bool _958 = isnan(_940);
    bool _960 = _956 || _958;
    bool _962 = isnan(_938);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    bool _968 = uint(_944) >= uint(_819);
    float _970 = 0.0;
    float _972 = _954;
    if (_857)
    {
        _970 = _954;
    }
    float _974 = _970;
    float _976 = trunc(_966);
    int _978 = int(_976);
    float _980 = _974;
    if (_857)
    {
        _948 = _926;
    }
    float _982 = _948;
    float _984 = _982;
    if (_857)
    {
        _916 = _954;
    }
    float _986 = _916;
    float _988 = _986;
    if (!_857)
    {
        float _990 = in.m_76.x;
        float _992 = in.m_76.y;
        float _994 = in.m_76.z;
        float _996 = _990 * 3.1415927410125732421875;
        float _998 = _996 * 0.15915493667125701904296875;
        float _1000 = _992 * 3.1415927410125732421875;
        float _1002 = _1000 * 0.15915493667125701904296875;
        float _1004 = _998 * 6.283185482025146484375;
        float _1006 = sin(_1004);
        float _1008 = _1002 * 6.283185482025146484375;
        float _1010 = sin(_1008);
        _873 = 7.345489978790283203125;
        _950 = _990;
        _952 = _992;
        _918 = 5.839270114898681640625;
        _988 = _994;
        _972 = _992;
        _881 = 1;
        _883 = 2;
        _980 = _1006;
        _984 = _1010;
    }
    float _1012 = _873;
    float _1014 = _950;
    float _1016 = _952;
    float _1018 = _918;
    float _1020 = _988;
    float _1022 = _972;
    int _1024 = _881;
    int _1026 = _883;
    float _1028 = _980;
    float _1030 = _984;
    float _1032 = _1012 * _1014;
    float _1034 = in.m_76.z;
    float _1036 = in.m_76.w;
    bool _1038 = !_968;
    int _1040 = _1038 ? 0 : (-1);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1044 = _811 + _1042;
    float _1046 = floor(_1032);
    float _1048 = float(_861);
    float _1050 = in.m_70.w;
    int _1052 = ~_936;
    int _1054 = _1052 + _1040;
    int _1056 = _1054 + 1;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1060 = _811 + _1058;
    float _1062 = float(uint(_847));
    bool _1064 = _819 == 0;
    float _1066 = 1.0 / _1048;
    int _1068 = _819 * _1056;
    int _1070 = _1068 + _853;
    int _1072 = ~_978;
    int _1074 = _1072 + 1;
    int _1076 = _1074 + 1;
    bool _1078 = !_1064;
    int _1080 = _1078 ? _1070 : (-1);
    float _1082 = -_1046;
    float _1084 = _1032 + _1082;
    float _1086 = 1.0 / _1062;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1090 = _1088 != 0;
    int _1092 = _1080 * _1076;
    float _1094 = _1084 * _938;
    bool _1096 = _1034 > 0.5;
    float _1098 = _175 * _135;
    bool _1100 = !_1090;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = _1066 * _135;
    bool _1106 = _1016 > 0.5;
    float _1108 = _902 * _135;
    float _1110 = trunc(_1094);
    int _1112 = int(_1110);
    int _1114 = abs(_1102);
    float _1116 = _938 * _1098;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1120 = _1118 != 0;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1124 = _1122 != 0;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1128 = _1126 != 0;
    float _1130 = -_225;
    int _1132 = _1096 ? as_type<int>(_1130) : as_type<int>(_225);
    float _1134 = -_241;
    int _1136 = _1106 ? as_type<int>(_1134) : as_type<int>(_241);
    float _1138 = trunc(_1108);
    int _1140 = int(_1138);
    bool _1142 = !_1128;
    float _1144 = _1142 ? _225 : as_type<float>(_1132);
    bool _1146 = !_1124;
    float _1148 = _1146 ? _241 : as_type<float>(_1136);
    float _1150 = trunc(_1104);
    int _1152 = int(_1150);
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1156 = _1154 != 0;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1160 = _1158 != 0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1164 = _1162 != 0;
    int _1166 = _1112 * _1114;
    int _1168 = _1166 + _853;
    int _1170 = _819 + (-1);
    int _1172 = as_type<int>(_934) + (-2);
    bool _1174 = !_1160;
    int _1176 = _1174 ? 0 : 1;
    float _1178 = trunc(_1116);
    int _1180 = int(_1178);
    float _1182 = float(uint(_1140));
    int _1184 = _978 * _1170;
    int _1186 = _1184 + _1092;
    bool _1188 = !_1156;
    int _1190 = _1188 ? 0 : 1;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1194 = _1192 != 0;
    float _1196 = as_type<float>(_1172) * _1182;
    int _1198 = as_type<int>(_1086) + (-2);
    int _1200 = abs(_1176);
    bool _1202 = !_1164;
    int _1204 = _1202 ? 0 : 1;
    float _1206 = trunc(_1196);
    float _1208 = precise::max(_1206, 0.0);
    uint _1210 = uint(_1208);
    int _1212 = abs(_1190);
    int _1214 = _1186 * _1200;
    bool _1216 = !_1194;
    int _1218 = _1216 ? 0 : 1;
    float _1220 = float(uint(_1152));
    int _1222 = abs(_1204);
    int _1224 = abs(_1218);
    float _1226 = as_type<float>(_1198) * _1220;
    int _1228 = _1180 * _1212;
    int _1230 = _1228 + _1214;
    int _1232 = ~_825;
    int _1234 = _1232 + 1;
    float _1236 = trunc(_1226);
    float _1238 = precise::max(_1236, 0.0);
    uint _1240 = uint(_1238);
    int _1242 = _1168 * _1222;
    int _1244 = _1242 + _1230;
    int _1246 = ~_847;
    int _1248 = _1246 + 1;
    int _1250 = _1112 * _1224;
    int _1252 = _1250 + _1244;
    int _1254 = ~_825;
    int _1256 = _1254 + 1;
    int _1258 = _1234 * int(_1210);
    int _1260 = _1258 + _1140;
    int _1262 = ~_819;
    int _1264 = _1262 + 1;
    float _1266 = float(uint(_1252));
    float _1268 = float(uint(_1260));
    int _1270 = ~_847;
    int _1272 = _1270 + 1;
    int _1274 = _1248 * int(_1240);
    int _1276 = _1274 + _1152;
    float _1278 = as_type<float>(_849) * _1266;
    float _1280 = as_type<float>(_1172) * _1268;
    bool _1282 = _1036 > 0.5;
    float _1284 = float(uint(_1276));
    float _1286 = trunc(_1278);
    float _1288 = precise::max(_1286, 0.0);
    uint _1290 = uint(_1288);
    float _1292 = float(_825);
    float _1294 = as_type<float>(_1198) * _1284;
    float _1296 = trunc(_1280);
    float _1298 = precise::max(_1296, 0.0);
    uint _1300 = uint(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1306 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1308 = isnan(_811);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1320 = _1318 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1322 = trunc(_1294);
    float _1324 = precise::max(_1322, 0.0);
    uint _1326 = uint(_1324);
    int _1328 = _1264 * int(_1290);
    int _1330 = _1328 + _1252;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1334 = float(uint(_1330));
    int _1336 = int(_1210) + int(_1300);
    float _1338 = _1018 * _1020;
    float _1340 = -_241;
    int _1342 = _1096 ? as_type<int>(_1340) : as_type<int>(_241);
    float _1344 = as_type<float>(_849) * _1334;
    float _1346 = 1.0 / _1304;
    int _1348 = _1256 * _1336;
    int _1350 = _1348 + _1140;
    int _1352 = int(_1240) + int(_1326);
    float _1354 = _1012 * _1022;
    bool _1356 = uint(_1350) >= uint(_825);
    float _1358 = trunc(_1344);
    float _1360 = precise::max(_1358, 0.0);
    uint _1362 = uint(_1360);
    float _1364 = -_225;
    int _1366 = _1282 ? as_type<int>(_1364) : as_type<int>(_225);
    int _1368 = _1272 * _1352;
    int _1370 = _1368 + _1152;
    bool _1372 = !_1356;
    int _1374 = _1372 ? 0 : (-1);
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1378 = _1376 != 0;
    bool _1380 = uint(_1370) >= uint(_847);
    float _1382 = floor(_1338);
    bool _1384 = !_1378;
    float _1386 = _1384 ? _241 : as_type<float>(_1342);
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1390 = _1388 != 0;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1394 = _1392 != 0;
    int _1396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1398 = _1396 != 0;
    int _1400 = ~_819;
    int _1402 = _1400 + 1;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1406 = _1404 != 0;
    float _1408 = floor(_1354);
    bool _1410 = !_1394;
    int _1412 = _1410 ? 0 : 1;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1416 = _1414 != 0;
    int _1418 = int(_1290) + int(_1362);
    float _1420 = float(_1140);
    float _1422 = -_1382;
    float _1424 = _1338 + _1422;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1428 = _1426 != 0;
    int _1430 = _1402 * _1418;
    int _1432 = _1430 + _1252;
    bool _1434 = _1420 >= _1292;
    bool _1436 = isnan(_1420);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan(_1292);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = 1.0 / _1320;
    bool _1448 = !_1406;
    int _1450 = _1448 ? 0 : 1;
    bool _1452 = !_1428;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = 0.0;
    float _1458 = _1050;
    if (_1416)
    {
        float _1460 = in.m_76.w;
        _1456 = _1460;
    }
    float _1462 = _1456;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1466 = _1464 != 0;
    float _1468 = -_1408;
    float _1470 = _1354 + _1468;
    bool _1472 = uint(_1432) >= uint(_819);
    float _1474 = trunc(_1444);
    int _1476 = int(_1474);
    int _1478 = ~_1336;
    int _1480 = _1478 + _1374;
    int _1482 = _1480 + 1;
    bool _1484 = !_1120;
    float _1486 = _1484 ? _225 : as_type<float>(_1366);
    bool _1488 = !_1466;
    int _1490 = _1488 ? 0 : 1;
    int _1492 = _825 * _1482;
    int _1494 = _1492 + _1140;
    bool _1496 = !_1380;
    int _1498 = _1496 ? 0 : (-1);
    bool _1500 = !_1472;
    int _1502 = _1500 ? 0 : (-1);
    float _1504 = _1292 * _1098;
    int _1506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1508 = _1506 != 0;
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1512 = _1510 != 0;
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1516 = _1514 != 0;
    int _1518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1520 = _1518 != 0;
    float _1522 = _1424 * _1292;
    int _1524 = _825 + (-1);
    bool _1526 = !_1390;
    int _1528 = _1526 ? 0 : 1;
    float _1530 = trunc(_1504);
    int _1532 = int(_1530);
    bool _1534 = !_1512;
    int _1536 = _1534 ? 0 : 1;
    bool _1538 = _825 == 0;
    float _1540 = _1462;
    bool _1542 = _1516;
    if (_1416)
    {
        float _1544 = _1462 * 3.1415927410125732421875;
        _1540 = _1544;
    }
    float _1546 = _1540;
    int _1548 = ~_1476;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    bool _1554 = !_1538;
    int _1556 = _1554 ? _1494 : (-1);
    float _1558 = _1546;
    if (_1416)
    {
        float _1560 = _1546 * 0.15915493667125701904296875;
        _1558 = _1560;
    }
    float _1562 = _1558;
    bool _1564 = !_1398;
    int _1566 = _1564 ? 0 : 1;
    int _1568 = abs(_1412);
    int _1570 = _1556 * _1552;
    float _1572 = float(_847);
    float _1574 = trunc(_1522);
    int _1576 = int(_1574);
    float _1578 = float(_1152);
    int _1580 = _1476 * _1524;
    int _1582 = _1580 + _1570;
    int _1584 = abs(_1528);
    int _1586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1588 = _1586 != 0;
    int _1590 = _1582 * _1568;
    int _1592 = abs(_1566);
    float _1594 = _1562;
    if (_1416)
    {
        float _1596 = _1562 * 6.283185482025146484375;
        float _1598 = sin(_1596);
        _1594 = _1598;
    }
    float _1600 = _1594;
    int _1602 = abs(_1450);
    bool _1604 = _1578 >= _1572;
    bool _1606 = isnan(_1578);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan(_1572);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    int _1616 = _1576 * _1602;
    int _1618 = _1616 + _1140;
    float _1620 = trunc(_1614);
    int _1622 = int(_1620);
    int _1624 = _1532 * _1584;
    int _1626 = _1624 + _1590;
    float _1628 = _1572 * _1098;
    int _1630 = abs(_1454);
    float _1632 = _1470 * _1572;
    int _1634 = _1618 * _1592;
    int _1636 = _1634 + _1626;
    int _1638 = ~_1352;
    int _1640 = _1638 + _1498;
    int _1642 = _1640 + 1;
    float _1644 = _1470;
    if (_1588)
    {
        float _1646 = in.m_76.x;
        _1644 = _1646;
    }
    float _1648 = _1644;
    bool _1650 = !_1508;
    int _1652 = _1650 ? 0 : 1;
    int _1654 = _1576 * _1630;
    int _1656 = _1654 + _1636;
    bool _1658 = !_1516;
    int _1660 = _1658 ? 0 : 1;
    int _1662 = _847 * _1642;
    int _1664 = _1662 + _1152;
    bool _1666 = _847 == 0;
    float _1668 = trunc(_1632);
    int _1670 = int(_1668);
    if (_1416)
    {
        bool _1672 = _1600 > 0.5;
        _1542 = _1672;
    }
    bool _1674 = _1542;
    float _1676 = float(uint(_1168));
    float _1678 = float(uint(_1656));
    int _1680 = ~_1622;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = as_type<float>(_849) * _1676;
    bool _1688 = !_1666;
    int _1690 = _1688 ? _1664 : (-1);
    float _1692 = trunc(_1628);
    int _1694 = int(_1692);
    int _1696 = abs(_1490);
    float _1698 = as_type<float>(_1172) * _1678;
    int _1700 = _847 + (-1);
    int _1702 = _1690 * _1684;
    int _1704 = abs(_1536);
    float _1706 = trunc(_1686);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    int _1712 = _1622 * _1700;
    int _1714 = _1712 + _1702;
    int _1716 = abs(_1652);
    float _1718 = _1648;
    float _1720 = _1686;
    float _1722 = as_type<float>(_1716);
    if (_1588)
    {
        float _1724 = _1648 * 3.1415927410125732421875;
        _1718 = _1724;
    }
    float _1726 = _1718;
    int _1728 = ~_819;
    int _1730 = _1728 + 1;
    int _1732 = _1670 * _1696;
    int _1734 = _1732 + _1152;
    int _1736 = ~_825;
    int _1738 = _1736 + 1;
    float _1740 = trunc(_1698);
    float _1742 = precise::max(_1740, 0.0);
    uint _1744 = uint(_1742);
    int _1746 = _1714 * _1704;
    float _1748 = as_type<float>(_1730);
    if (_1588)
    {
        float _1750 = _1726 * 0.15915493667125701904296875;
        _1748 = _1750;
    }
    float _1752 = _1748;
    int _1754 = _1694 * _1716;
    int _1756 = _1754 + _1746;
    float _1758 = float(uint(_1618));
    int _1760 = _1730 * int(_1710);
    int _1762 = _1760 + _1168;
    int _1764 = abs(_1660);
    float _1766 = _1752;
    if (_1588)
    {
        float _1768 = _1752 * 6.283185482025146484375;
        float _1770 = sin(_1768);
        _1766 = _1770;
    }
    float _1772 = _1766;
    bool _1774 = !_1520;
    int _1776 = _1774 ? 0 : 1;
    float _1778 = as_type<float>(_1172) * _1758;
    int _1780 = ~_1418;
    int _1782 = _1780 + _1502;
    int _1784 = _1782 + 1;
    float _1786 = float(uint(_1762));
    int _1788 = _1738 * int(_1744);
    int _1790 = _1788 + _1656;
    int _1792 = _819 * _1784;
    int _1794 = _1792 + _1252;
    int _1796 = abs(_1776);
    float _1798 = trunc(_1778);
    float _1800 = precise::max(_1798, 0.0);
    uint _1802 = uint(_1800);
    float _1804 = float(uint(_1790));
    float _1806 = as_type<float>(_849) * _1786;
    bool _1808 = _819 == 0;
    int _1810 = _1734 * _1764;
    int _1812 = _1810 + _1756;
    float _1814 = as_type<float>(_1172) * _1804;
    int _1816 = ~_825;
    int _1818 = _1816 + 1;
    bool _1820 = !_1808;
    int _1822 = _1820 ? _1794 : (-1);
    int _1824 = _1670 * _1796;
    int _1826 = _1824 + _1812;
    if (!_1416)
    {
        _1720 = _241;
    }
    float _1828 = _1720;
    float _1830 = trunc(_1814);
    float _1832 = precise::max(_1830, 0.0);
    uint _1834 = uint(_1832);
    float _1836 = _1828;
    if (_1416)
    {
        float _1838 = -_241;
        float _1840 = _1674 ? _1838 : _241;
        _1836 = _1840;
    }
    float _1842 = _1836;
    int _1844 = _1822 & 3;
    bool _1846 = _1844 != 0;
    int _1848 = _1822 & 3;
    bool _1850 = _1848 != 0;
    int _1852 = _1818 * int(_1802);
    int _1854 = _1852 + _1618;
    int _1856 = _1846 ? 0 : 1;
    float _1858 = trunc(_1806);
    float _1860 = precise::max(_1858, 0.0);
    uint _1862 = uint(_1860);
    bool _1864 = uint(_1848) > 1u;
    bool _1866 = _1848 != 3;
    float _1868 = float(uint(_1826));
    int _1870 = int(_1744) + int(_1834);
    int _1872 = ~_825;
    int _1874 = _1872 + 1;
    float _1876 = as_type<float>(_1198) * _1868;
    float _1878 = float(uint(_1854));
    int _1880 = ~_1856;
    int _1882 = _1880 + 1;
    int _1884 = _1882 + 1;
    int _1886 = _1874 * _1870;
    int _1888 = _1886 + _1656;
    int _1890 = _1884;
    bool _1892 = _1866;
    if (!_1864)
    {
        int _1894 = ~_1856;
        int _1896 = _1894 + 1;
        _1890 = _1896;
    }
    int _1898 = _1890;
    float _1900 = as_type<float>(_1172) * _1878;
    bool _1902 = uint(_1848) >= 2u;
    float _1904 = trunc(_1876);
    float _1906 = precise::max(_1904, 0.0);
    uint _1908 = uint(_1906);
    bool _1910 = _1016 > 0.5;
    int _1912 = _1902 ? 0 : 1;
    bool _1914 = uint(_1888) >= uint(_825);
    int _1916 = ~_1912;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    float _1922 = trunc(_1900);
    float _1924 = precise::max(_1922, 0.0);
    uint _1926 = uint(_1924);
    bool _1928 = !_1914;
    int _1930 = _1928 ? 0 : (-1);
    int _1932 = _1920;
    if (_1866)
    {
        int _1934 = ~_1912;
        int _1936 = _1934 + 1;
        _1932 = _1936;
    }
    int _1938 = _1932;
    int _1940 = ~_1870;
    int _1942 = _1940 + _1930;
    int _1944 = _1942 + 1;
    if (_1588)
    {
        bool _1946 = _1772 > 0.5;
        _1892 = _1946;
    }
    bool _1948 = _1892;
    int _1950 = _825 * _1944;
    int _1952 = _1950 + _1656;
    if (!_1588)
    {
        _1722 = _225;
    }
    float _1954 = _1722;
    float _1956 = -_225;
    int _1958 = _1910 ? as_type<int>(_1956) : as_type<int>(_225);
    bool _1960 = !_1538;
    int _1962 = _1960 ? _1952 : (-1);
    int _1964 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1966 = _1964 != 0;
    float _1968 = _1954;
    if (_1588)
    {
        float _1970 = -_225;
        float _1972 = _1948 ? _1970 : _225;
        _1968 = _1972;
    }
    float _1974 = _1968;
    int _1976 = _1962 & 3;
    bool _1978 = _1976 != 0;
    int _1980 = ~_847;
    int _1982 = _1980 + 1;
    bool _1984 = !_1966;
    float _1986 = _1984 ? _225 : as_type<float>(_1958);
    bool _1988 = uint(_1976) > 1u;
    int _1990 = _1982 * int(_1908);
    int _1992 = _1990 + _1826;
    int _1994 = _1962 & 3;
    bool _1996 = _1994 != 0;
    int _1998 = int(_1710) + int(_1862);
    float _2000 = float(uint(_1992));
    int _2002 = _1996 ? 0 : 1;
    int _2004 = ~_819;
    int _2006 = _2004 + 1;
    float _2008 = as_type<float>(_1198) * _2000;
    int _2010 = ~_2002;
    int _2012 = _2010 + 1;
    int _2014 = _2012 + 1;
    int _2016 = _2014;
    if (!_1988)
    {
        int _2018 = ~_2002;
        int _2020 = _2018 + 1;
        _2016 = _2020;
    }
    int _2022 = _2016;
    int _2024 = _2006 * _1998;
    int _2026 = _2024 + _1168;
    bool _2028 = uint(_1976) >= 2u;
    float _2030 = trunc(_2008);
    float _2032 = precise::max(_2030, 0.0);
    uint _2034 = uint(_2032);
    bool _2036 = !_1978;
    int _2038 = _2036 ? 0 : 1;
    int _2040 = _2028 ? 0 : 1;
    bool _2042 = uint(_2026) >= uint(_819);
    bool _2044 = _1976 != 3;
    bool _2046 = _1976 != 3;
    int _2048 = int(_1802) + int(_1926);
    float _2050 = in.m_56.x;
    float _2052 = in.m_56.y;
    float _2054 = in.m_56.z;
    int _2056 = ~_825;
    int _2058 = _2056 + 1;
    bool _2060 = !_2042;
    int _2062 = _2060 ? 0 : (-1);
    int _2064 = int(_1908) + int(_2034);
    int _2066 = _2058 * _2048;
    int _2068 = _2066 + _1618;
    int _2070 = ~_2040;
    int _2072 = _2070 + 1;
    int _2074 = _2072 + 1;
    int _2076 = _2074;
    if (_2044)
    {
        int _2078 = ~_2040;
        int _2080 = _2078 + 1;
        _2076 = _2080;
    }
    int _2082 = _2076;
    bool _2084 = uint(_2068) >= uint(_825);
    int _2086 = ~_847;
    int _2088 = _2086 + 1;
    int _2090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2092 = _2090 != 0;
    bool _2094 = !_2046;
    int _2096 = _2094 ? 0 : (-1);
    int _2098 = _2088 * _2064;
    int _2100 = _2098 + _1826;
    bool _2102 = !_2092;
    int _2104 = _2102 ? 0 : 1;
    bool _2106 = uint(_2100) >= uint(_847);
    float _2108 = _197 * _2052;
    bool _2110 = !_2084;
    int _2112 = _2110 ? 0 : (-1);
    float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2116 = _2114 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2120 = _2118 != 0;
    float _2122 = fma(_195, _2050, _2108);
    int _2124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2126 = _2124 != 0;
    float _2128 = _209 * _2052;
    bool _2130 = !_2106;
    int _2132 = _2130 ? 0 : (-1);
    float _2134 = _203 * _2052;
    float _2136 = 1.0 / _2116;
    bool _2138 = _1014 > 0.5;
    float _2140 = fma(_201, _2050, _2134);
    float _2142 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2144 = _2142 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2146 = -_241;
    int _2148 = _2138 ? as_type<int>(_2146) : as_type<int>(_241);
    int _2150 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2152 = _2150 != 0;
    float _2154 = fma(_207, _2050, _2128);
    float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2158 = _2156 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2160 = 1.0 / _2144;
    float _2162 = fma(_199, _2054, _2122);
    float _2164 = fma(_205, _2054, _2140);
    float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2166;
    float _2170 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2172 = _2170 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2174 = 1.0 / _2158;
    float _2176 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2178 = _2176 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2180 = _2168 * _1346;
    float _2182 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2184 = _2182 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2186 = _2172 * _2136;
    float _2188 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2188;
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2196 = 1.0 / _2178;
    bool _2198 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2200 = isnan(_811);
    bool _2202 = _2198 || _2200;
    bool _2204 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2206 = _2202 || _2204;
    float _2208 = float(_2206);
    float _2210 = fma(_211, _2054, _2154);
    float _2212 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2214 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2212;
    float _2216 = _2194 * _2160;
    bool _2218 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2220 = isnan(_811);
    bool _2222 = _2218 || _2220;
    bool _2224 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2226 = _2222 || _2224;
    float _2228 = float(_2226);
    float _2230 = -_2208;
    float _2232 = _2230 + 1.0;
    float _2234 = 1.0 / _2184;
    float _2236 = _2214 * _2174;
    bool _2238 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2240 = isnan(_811);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2246 = _2242 || _2244;
    float _2248 = float(_2246);
    float _2250 = _2228 * _2232;
    float _2252 = -_2228;
    float _2254 = _2252 + 1.0;
    float _2256 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2256;
    bool _2260 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2262 = isnan(_811);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2268 = _2264 || _2266;
    float _2270 = float(_2268);
    float _2272 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2274 = _2272 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2276 = -_2248;
    float _2278 = _2276 + 1.0;
    float _2280 = _2248 * _2254;
    float _2282 = _2258 * _1446;
    float _2284 = _2274 * _2196;
    bool _2286 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2288 = isnan(_811);
    bool _2290 = _2286 || _2288;
    bool _2292 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2294 = _2290 || _2292;
    float _2296 = float(_2294);
    float _2298 = _2270 * _2278;
    float _2300 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2302 = _811 + _2300;
    float _2304 = -_2270;
    float _2306 = _2304 + 1.0;
    bool _2308 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2310 = isnan(_811);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2316 = _2312 || _2314;
    float _2318 = float(_2316);
    float _2320 = in.m_72.w;
    float _2322 = _2190 * _2234;
    float _2324 = fma(_2180, _2302, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2326 = _2296 * _2306;
    float _2328 = -_2296;
    float _2330 = _2328 + 1.0;
    float _2332 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2334 = _811 + _2332;
    float _2336 = -_2318;
    float _2338 = _2336 + 1.0;
    bool _2340 = !_2152;
    float _2342 = _2340 ? _241 : as_type<float>(_2148);
    float _2344 = _2318 * _2330;
    float _2346 = fma(_2186, _2334, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2348 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2350 = isnan(_811);
    bool _2352 = _2348 || _2350;
    bool _2354 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2356 = _2352 || _2354;
    float _2358 = float(_2356);
    float _2360 = _1316 * _2338;
    float _2362 = in.m_74.w;
    float _2364 = -_1316;
    float _2366 = _2364 + 1.0;
    bool _2368 = _1024 != 1;
    float _2370 = -_2358;
    float _2372 = _2370 + 1.0;
    float _2374 = fma(_2322, _1044, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2376 = _2358 * _2366;
    float _2378 = _2162 + _1050;
    float _2380 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2382 = _811 + _2380;
    float _2384 = _2324 * _2376;
    float _2386 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2388 = _811 + _2386;
    float _2390 = fma(_2236, _2382, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2392 = _2164 + _2320;
    float _2394 = fma(_2372, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2384);
    float _2396 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2398 = _811 + _2396;
    float _2400 = _2360;
    float _2402 = _2346;
    float _2404 = _2394;
    if (!_2368)
    {
        _1458 = _1016;
    }
    float _2406 = _1458;
    float _2408 = fma(_2346, _2360, _2394);
    float _2410 = _2406;
    if (!_2368)
    {
        _2400 = _1016;
    }
    float _2412 = _2400;
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2416 = _2412;
    if (!_2368)
    {
        _2402 = _1034;
    }
    float _2418 = _2402;
    float _2420 = fma(_2282, _2398, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2422 = _2418;
    if (!_2368)
    {
        _2404 = _1034;
    }
    float _2424 = _2404;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2428 = _2424;
    if (_2368)
    {
        _2416 = _1014;
    }
    float _2430 = _2416;
    float _2432 = _2210 + _2362;
    if (_2368)
    {
        _2410 = _1014;
    }
    float _2434 = _2410;
    float _2436 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_2368)
    {
        _2422 = _1016;
    }
    float _2438 = _2422;
    float _2440 = fma(_2216, _1060, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2442 = _2440;
    if (_2368)
    {
        _2428 = _1016;
    }
    float _2444 = _2428;
    float _2446 = -_2414;
    float _2448 = fma(_2436, 2.0, _2446);
    bool _2450 = _1026 != 2;
    float _2452 = fma(_2374, _2344, _2408);
    float _2454 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2456 = fma(_2440, _2326, _2452);
    float _2458 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2460 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2462 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2464 = _2392 + _2462;
    float _2466 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2458);
    float _2468 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2470 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2426);
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2474 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2476 = -_2460;
    float _2478 = fma(_2468, 2.0, _2476);
    float _2480 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2482 = fma(_2454, -2.0, _2472);
    float _2484 = fma(_2390, _2298, _2456);
    float _2486 = fma(_2480, -2.0, _2474);
    float _2488 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2490 = _2378 + _2488;
    float _2492 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2494 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2496 = _1974 + (-0.5);
    float _2498 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2486);
    float _2500 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2502 = _2432 + _2500;
    float _2504 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2492);
    float _2506 = fma(_2444, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2494);
    int _2508 = _1962 >> 31;
    float _2510 = -_2496;
    float _2512 = -_2498;
    float _2514 = fma(_2510, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2512);
    float _2516 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2504);
    float _2518 = -_135;
    float _2520 = fma(_2518, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2448);
    float _2522 = _2342 + 0.5;
    int _2524 = _2508 & 3;
    float _2526 = fma(_2284, _2388, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2528 = 0.0;
    if (_2450)
    {
        _2528 = _1016;
    }
    float _2530 = _2528;
    float _2532 = fma(_2522, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2520);
    float _2534 = _2530;
    if (_2450)
    {
        _2442 = _1014;
    }
    float _2536 = _2442;
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2540 = _2536;
    if (!_2450)
    {
        _2540 = _1034;
    }
    float _2542 = _2540;
    float _2544 = -_135;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2478);
    if (!_2450)
    {
        _2534 = _1014;
    }
    float _2548 = _2534;
    float _2550 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2538);
    bool _2552 = _2516 >= 0.0;
    float _2554 = _1842 + 0.5;
    int _2556 = _1962 + _2524;
    float _2558 = fma(_2526, _2280, _2484);
    float _2560 = float(uint(_1734));
    float _2562 = fma(_2554, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2546);
    int _2564 = _2556 >> 2;
    float _2566 = _1986 + (-0.5);
    float _2568 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2482);
    int _2570 = _2564 << 4;
    int _2572 = _2570 + 656;
    float _2574 = as_type<float>(_1198) * _2560;
    float _2576 = -_2566;
    float _2578 = -_2568;
    float _2580 = fma(_2576, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2578);
    float _2582 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2584 = trunc(_2574);
    float _2586 = precise::max(_2584, 0.0);
    uint _2588 = uint(_2586);
    uint _2590 = uint(int(uint(_2572) >> uint(2)));
    uint _2592 = uint(int(uint(int(_2590)) >> uint(2)));
    int _2594 = int(_2590) & 3;
    float _2596 = (*spvDescriptorSet0.vp_c9)._m0[int(_2592)][_2594];
    int _2598 = int(_2590) + 1;
    uint _2600 = uint(int(uint(_2598) >> uint(2)));
    int _2602 = _2598 & 3;
    float _2604 = (*spvDescriptorSet0.vp_c9)._m0[int(_2600)][_2602];
    float _2606 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2608 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2610 = ~_847;
    int _2612 = _2610 + 1;
    float _2614 = _2430 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2616 = -_2608;
    float _2618 = fma(_2606, 2.0, _2616);
    float _2620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2622 = _2572 + 8;
    uint _2624 = uint(int(uint(_2622) >> uint(2)));
    uint _2626 = uint(int(uint(int(_2624)) >> uint(2)));
    int _2628 = int(_2624) & 3;
    float _2630 = (*spvDescriptorSet0.vp_c9)._m0[int(_2626)][_2628];
    int _2632 = int(_2624) + 1;
    uint _2634 = uint(int(uint(_2632) >> uint(2)));
    int _2636 = _2632 & 3;
    float _2638 = (*spvDescriptorSet0.vp_c9)._m0[int(_2634)][_2636];
    float _2640 = -_1332;
    float _2642 = fma(_2614, 2.0, _2640);
    float _2644 = _2438 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2646 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2648 = _2574;
    if (_2552)
    {
        _2648 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2650 = _2648;
    float _2652 = _2548 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2654 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2466);
    int _2656 = _2612 * int(_2588);
    int _2658 = _2656 + _1734;
    float _2660 = fma(_2644, -2.0, _2582);
    float _2662 = fma(_2652, -2.0, _2646);
    int _2664 = as_type<int>(_2650);
    if (_2552)
    {
        float _2666 = _2650 * 5.0;
        _2664 = as_type<int>(_2666);
    }
    int _2668 = _2664;
    float _2670 = float(uint(_2658));
    float _2672 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2470);
    int _2674 = abs(_2022);
    float _2676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2552)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9401 = as_type<float>(_2668);
        out.gl_Position.z = _9401;
    }
    float _2678 = as_type<float>(_1198) * _2670;
    float _2680 = -_2654;
    float _2682 = _2680 + 1.0;
    float _2684 = -_2672;
    float _2686 = _2684 + 1.0;
    int _2688 = abs(_2082);
    float _2690 = fma(_2420, _2250, _2558);
    float _2692 = -_2682;
    float _2694 = fma(_2692, _1842, _2562);
    float _2696 = _2620 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2698 = fma(_2686, _1974, _2514);
    int _2700 = ~_2064;
    int _2702 = _2700 + _2132;
    int _2704 = _2702 + 1;
    float _2706 = trunc(_2678);
    float _2708 = precise::max(_2706, 0.0);
    uint _2710 = uint(_2708);
    int _2712 = ~_2048;
    int _2714 = _2712 + _2112;
    int _2716 = _2714 + 1;
    float _2718 = _1486 + (-0.5);
    float _2720 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2660);
    out.m_84.x = _2694;
    out.m_84.y = _2698;
    int _2722 = abs(_2104);
    float _2724 = _2676 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2726 = -_2696;
    float _2728 = -_2720;
    float _2730 = fma(_2726, _2718, _2728);
    float _2732 = _1386 + 0.5;
    int _2734 = abs(_2038);
    float _2736 = -_135;
    float _2738 = fma(_2736, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2642);
    int _2740 = ~_2674;
    int _2742 = _2740 + 1;
    int _2744 = _2742 + 1;
    float _2746 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2690);
    int _2748 = abs(_2096);
    int _2750 = _847 * _2704;
    int _2752 = _2750 + _1826;
    int _2754 = int(_2588) + int(_2710);
    int _2756 = _2744 * as_type<int>(_2604);
    int _2758 = ~_2734;
    int _2760 = _2758 + 1;
    int _2762 = _2760 + 1;
    float _2764 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2766 = int(_2764);
    float _2768 = fma(_2724, _2732, _2738);
    bool _2770 = !_1666;
    int _2772 = _2770 ? _2752 : (-1);
    int _2774 = _2762 * as_type<int>(_2596);
    int _2776 = _2774 + _2756;
    int _2778 = ~_2688;
    int _2780 = _2778 + 1;
    int _2782 = _2780 + 1;
    out.m_86.x = _2746;
    int _2784 = ~_2748;
    int _2786 = _2784 + 1;
    int _2788 = _2786 + 1;
    float _2790 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2662);
    int _2792 = _1822 >> 31;
    int _2794 = _2782 * as_type<int>(_2630);
    int _2796 = _2794 + _2776;
    int _2798 = ~_2722;
    int _2800 = _2798 + 1;
    int _2802 = _2800 + 1;
    float _2804 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2506);
    int _2806 = _2792 & 3;
    int _2808 = _2788 * as_type<int>(_2638);
    int _2810 = _2808 + _2796;
    int _2812 = _2772 >> 31;
    int _2814 = _825 * _2716;
    int _2816 = _2814 + _1618;
    int _2818 = _1822 + _2806;
    int _2820 = _2810 * _2802;
    int _2822 = _2812 & 3;
    float _2824 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2550);
    bool _2826 = !_1538;
    int _2828 = _2826 ? _2816 : (-1);
    float _2830 = -_2804;
    float _2832 = _2830 + 1.0;
    float _2834 = float(uint(_2766));
    float _2836 = -_2824;
    float _2838 = _2836 + 1.0;
    bool _2840 = !_2120;
    int _2842 = _2840 ? 0 : 1;
    int _2844 = _2828 * _2722;
    int _2846 = _2844 + _2820;
    int _2848 = _2772 & 3;
    bool _2850 = _2848 != 0;
    float _2852 = 1.0 / _2834;
    int _2854 = _2772 + _2822;
    float _2856 = -_2838;
    float _2858 = fma(_1386, _2856, _2768);
    int _2860 = _2818 >> 2;
    float _2862 = _2858;
    if (_2552)
    {
        out.m_63.x = 0.0;
    }
    int _2864 = _2772 & 3;
    bool _2866 = _2864 != 0;
    int _2868 = abs(_2766);
    int _2870 = _2850 ? 0 : 1;
    int _2872 = _2860 << 4;
    int _2874 = _2872 + 368;
    bool _2876 = uint(_2864) > 1u;
    int _2878 = _2854 >> 2;
    float _2880 = float(uint(_2868));
    uint _2882 = uint(int(uint(_2874) >> uint(2)));
    uint _2884 = uint(int(uint(int(_2882)) >> uint(2)));
    int _2886 = int(_2882) & 3;
    float _2888 = (*spvDescriptorSet0.vp_c9)._m0[int(_2884)][_2886];
    int _2890 = int(_2882) + 1;
    uint _2892 = uint(int(uint(_2890) >> uint(2)));
    int _2894 = _2890 & 3;
    float _2896 = (*spvDescriptorSet0.vp_c9)._m0[int(_2892)][_2894];
    int _2898 = _2878 << 4;
    int _2900 = _2898 + 800;
    int _2902 = ~_2870;
    int _2904 = _2902 + 1;
    int _2906 = _2904 + 1;
    float _2908 = 1.0 / _2880;
    int _2910 = ~_847;
    int _2912 = _2910 + 1;
    uint _2914 = uint(int(uint(_2900) >> uint(2)));
    uint _2916 = uint(int(uint(int(_2914)) >> uint(2)));
    int _2918 = int(_2914) & 3;
    float _2920 = (*spvDescriptorSet0.vp_c9)._m0[int(_2916)][_2918];
    int _2922 = int(_2914) + 1;
    uint _2924 = uint(int(uint(_2922) >> uint(2)));
    int _2926 = _2922 & 3;
    float _2928 = (*spvDescriptorSet0.vp_c9)._m0[int(_2924)][_2926];
    int _2930 = _2906;
    if (!_2876)
    {
        int _2932 = ~_2870;
        int _2934 = _2932 + 1;
        _2930 = _2934;
    }
    int _2936 = _2930;
    bool _2938 = _2864 != 3;
    int _2940 = _2912 * _2754;
    int _2942 = _2940 + _1734;
    int _2944 = as_type<int>(_2852) + (-2);
    float _2946 = float(uint(_2846));
    bool _2948 = !_2866;
    int _2950 = _2948 ? 0 : 1;
    bool _2952 = uint(_2864) >= 2u;
    float _2954 = as_type<float>(_2944) * _2946;
    bool _2956 = !_1850;
    int _2958 = _2956 ? 0 : 1;
    int _2960 = _2952 ? 0 : 1;
    int _2962 = abs(_2846);
    float _2964 = trunc(_2954);
    float _2966 = precise::max(_2964, 0.0);
    uint _2968 = uint(_2966);
    bool _2970 = uint(_2942) >= uint(_847);
    int _2972 = as_type<int>(_2908) + (-2);
    int _2974 = _2874 + 8;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    uint _2978 = uint(int(uint(int(_2976)) >> uint(2)));
    int _2980 = int(_2976) & 3;
    float _2982 = (*spvDescriptorSet0.vp_c9)._m0[int(_2978)][_2980];
    int _2984 = int(_2976) + 1;
    uint _2986 = uint(int(uint(_2984) >> uint(2)));
    int _2988 = _2984 & 3;
    float _2990 = (*spvDescriptorSet0.vp_c9)._m0[int(_2986)][_2988];
    int _2992 = ~_2960;
    int _2994 = _2992 + 1;
    int _2996 = _2994 + 1;
    int _2998 = _2996;
    if (_2938)
    {
        int _3000 = ~_2960;
        int _3002 = _3000 + 1;
        _2998 = _3002;
    }
    int _3004 = _2998;
    float _3006 = float(uint(_2962));
    bool _3008 = _2864 != 3;
    int _3010 = _2900 + 8;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    uint _3014 = uint(int(uint(int(_3012)) >> uint(2)));
    int _3016 = int(_3012) & 3;
    float _3018 = (*spvDescriptorSet0.vp_c9)._m0[int(_3014)][_3016];
    int _3020 = int(_3012) + 1;
    uint _3022 = uint(int(uint(_3020) >> uint(2)));
    int _3024 = _3020 & 3;
    float _3026 = (*spvDescriptorSet0.vp_c9)._m0[int(_3022)][_3024];
    float _3028 = as_type<float>(_2972) * _3006;
    bool _3030 = _1848 != 3;
    int _3032 = ~_2766;
    int _3034 = _3032 + 1;
    float _3036 = trunc(_3028);
    float _3038 = precise::max(_3036, 0.0);
    uint _3040 = uint(_3038);
    bool _3042 = !_2970;
    int _3044 = _3042 ? 0 : (-1);
    bool _3046 = !_3030;
    int _3048 = _3046 ? 0 : (-1);
    int _3050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3052 = _3050 != 0;
    int _3054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3056 = _3054 != 0;
    int _3058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3060 = _3058 != 0;
    int _3062 = ~_1998;
    int _3064 = _3062 + _2062;
    int _3066 = _3064 + 1;
    int _3068 = _3034 * int(_2968);
    int _3070 = _3068 + _2846;
    int _3072 = abs(_1898);
    int _3074 = ~_2868;
    int _3076 = _3074 + 1;
    int _3078 = _819 * _3066;
    int _3080 = _3078 + _1168;
    int _3082 = ~_3072;
    int _3084 = _3082 + 1;
    int _3086 = _3084 + 1;
    float _3088 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3090 = abs(_2936);
    float _3092 = float(uint(_3070));
    int _3094 = _3086 * as_type<int>(_2896);
    int _3096 = ~_3090;
    int _3098 = _3096 + 1;
    int _3100 = _3098 + 1;
    float _3102 = as_type<float>(_2944) * _3092;
    int _3104 = ~_2754;
    int _3106 = _3104 + _3044;
    int _3108 = _3106 + 1;
    int _3110 = _3076 * int(_3040);
    int _3112 = _3110 + _2962;
    int _3114 = abs(_2950);
    int _3116 = _3100 * as_type<int>(_2928);
    int _3118 = abs(_2958);
    float _3120 = trunc(_3102);
    float _3122 = precise::max(_3120, 0.0);
    uint _3124 = uint(_3122);
    float _3126 = float(uint(_3112));
    int _3128 = _847 * _3108;
    int _3130 = _3128 + _1734;
    int _3132 = abs(_1938);
    int _3134 = ~_3118;
    int _3136 = _3134 + 1;
    int _3138 = _3136 + 1;
    float _3140 = as_type<float>(_2972) * _3126;
    int _3142 = ~_3114;
    int _3144 = _3142 + 1;
    int _3146 = _3144 + 1;
    int _3148 = abs(_3004);
    int _3150 = _3138 * as_type<int>(_2888);
    int _3152 = _3150 + _3094;
    float _3154 = trunc(_3140);
    float _3156 = precise::max(_3154, 0.0);
    uint _3158 = uint(_3156);
    int _3160 = ~_3132;
    int _3162 = _3160 + 1;
    int _3164 = _3162 + 1;
    int _3166 = _3146 * as_type<int>(_2920);
    int _3168 = _3166 + _3116;
    int _3170 = ~_3148;
    int _3172 = _3170 + 1;
    int _3174 = _3172 + 1;
    int _3176 = abs(_3048);
    int _3178 = _3164 * as_type<int>(_2982);
    int _3180 = _3178 + _3152;
    bool _3182 = !_3008;
    int _3184 = _3182 ? 0 : (-1);
    int _3186 = _3174 * as_type<int>(_3018);
    int _3188 = _3186 + _3168;
    int _3190 = ~_2766;
    int _3192 = _3190 + 1;
    int _3194 = int(_2968) + int(_3124);
    int _3196 = ~_3176;
    int _3198 = _3196 + 1;
    int _3200 = _3198 + 1;
    int _3202 = abs(_3184);
    int _3204 = _3192 * _3194;
    int _3206 = _3204 + _2846;
    int _3208 = abs(_2842);
    int _3210 = _3200 * as_type<int>(_2990);
    int _3212 = _3210 + _3180;
    bool _3214 = _819 == 0;
    int _3216 = ~_3202;
    int _3218 = _3216 + 1;
    int _3220 = _3218 + 1;
    int _3222 = int(_3040) + int(_3158);
    int _3224 = ~_2868;
    int _3226 = _3224 + 1;
    int _3228 = _3220 * as_type<int>(_3026);
    int _3230 = _3228 + _3188;
    bool _3232 = !_3214;
    int _3234 = _3232 ? _3080 : (-1);
    int _3236 = _3226 * _3222;
    int _3238 = _3236 + _2962;
    bool _3240 = uint(_3206) >= uint(_2766);
    int _3242 = ~_3208;
    int _3244 = _3242 + 1;
    int _3246 = _3244 + 1;
    float _3248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3250 = !_3240;
    int _3252 = _3250 ? 0 : (-1);
    bool _3254 = uint(_3238) >= uint(_2868);
    int _3256 = _3212 * _3246;
    int _3258 = ~_3194;
    int _3260 = _3258 + _3252;
    int _3262 = _3260 + 1;
    float _3264 = -_135;
    float _3266 = fma(_3264, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2618);
    bool _3268 = !_2126;
    int _3270 = _3268 ? 0 : 1;
    int _3272 = _3234 * _3208;
    int _3274 = _3272 + _3256;
    int _3276 = _2846 ^ _2766;
    bool _3278 = !_3254;
    int _3280 = _3278 ? 0 : (-1);
    int _3282 = abs(_3270);
    int _3284 = _2766 * _3262;
    int _3286 = _3284 + _2846;
    uint _3288 = uint(int(uint(_3276) >> uint(31)));
    float _3290 = _3248 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3292 = _2766 == 0;
    int _3294 = ~_3280;
    int _3296 = _3222 + _3294;
    int _3298 = _3296 + 1;
    int _3300 = ~int(_3288);
    int _3302 = _3300 + 1;
    bool _3304 = !_3292;
    int _3306 = _3304 ? _3286 : (-1);
    int _3308 = _3298 ^ _3302;
    float _3310 = float(_3306);
    int _3312 = ~_3282;
    int _3314 = _3312 + 1;
    int _3316 = _3314 + 1;
    bool _3318 = _2766 == 0;
    int _3320 = ~_3302;
    int _3322 = _3320 + _3308;
    int _3324 = _3322 + 1;
    float _3326 = fma(_3290, _3310, _3266);
    bool _3328 = !_1666;
    int _3330 = _3328 ? _3130 : (-1);
    int _3332 = _3230 * _3316;
    bool _3334 = !_3318;
    int _3336 = _3334 ? _3324 : (-1);
    float _3338 = _1148 + 0.5;
    int _3340 = _3330 * _3282;
    int _3342 = _3340 + _3332;
    float _3344 = float(_3336);
    float _3346 = _3088 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3348 = fma(_3290, _3338, _3326);
    float _3350 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3352 = -_2790;
    float _3354 = fma(_3346, _3344, _3352);
    float _3356 = _1144 + (-0.5);
    float _3358 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3360 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3350);
    float _3362 = -_3346;
    float _3364 = fma(_3362, _3356, _3354);
    float _3366 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3358);
    float _3368 = _2464 * _2464;
    float _3370 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3360);
    float _3372 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3374 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3366);
    float _3376 = -_3370;
    float _3378 = _3376 + 1.0;
    float _3380 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3372);
    float _3382 = -_3374;
    float _3384 = _3382 + 1.0;
    float _3386 = fma(_2490, _2490, _3368);
    float _3388 = -_3378;
    float _3390 = fma(_1148, _3388, _3348);
    float _3392 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3380);
    float _3394 = -_3384;
    float _3396 = fma(_2342, _3394, _2532);
    float _3398 = fma(_2502, _2502, _3386);
    float _3400 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3402 = -_3392;
    float _3404 = _3402 + 1.0;
    float _3406 = _617 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3408 = rsqrt(_3398);
    float _3410 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3400);
    float _3412 = fma(_1486, _2832, _2730);
    float _3414 = float(_3274);
    float _3416 = fma(_1986, _3404, _2580);
    float _3418 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3410);
    float _3420 = _3406 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3422 = float(_3342);
    out.m_88.x = _3414;
    float _3424 = -_3418;
    float _3426 = _3424 + 1.0;
    bool _3428 = !_3056;
    int _3430 = _3428 ? 0 : 1;
    out.m_90.x = _3396;
    out.m_90.y = _3416;
    out.m_90.z = _2858;
    out.m_90.w = _3412;
    float _3432 = fma(_1144, _3426, _3364);
    bool _3434 = !_3060;
    int _3436 = _3434 ? 0 : 1;
    float _3438 = _3420 * _3408;
    out.m_88.w = _3422;
    bool _3440 = !_3052;
    int _3442 = _3440 ? 0 : 1;
    float _3444 = _2490 * _3438;
    out.m_92.x = _3390;
    out.m_92.y = _3432;
    float _3446 = _2464 * _3438;
    if (_2552)
    {
        return out;
    }
    float _3448 = -_3446;
    float _3450 = _2392 + _3448;
    float _3452 = _2502 * _3438;
    float _3454 = -_3444;
    float _3456 = _2378 + _3454;
    float _3458 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3460 = _3450 + _3458;
    float _3462 = -_3452;
    float _3464 = _2432 + _3462;
    float _3466 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3468 = _3456 + _3466;
    float _3470 = _3460 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3472 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3474 = _3464 + _3472;
    float _3476 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3470);
    float _3478 = fma(_3474, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3476);
    bool _3480 = _3478 >= 0.0;
    float _3482 = _3468;
    float _3484 = _3464;
    if (_3480)
    {
        _2862 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3486 = _2862;
    int _3488 = as_type<int>(_3486);
    if (_3480)
    {
        out.m_63.x = 0.0;
    }
    if (_3480)
    {
        float _3490 = _3486 * 5.0;
        _3488 = as_type<int>(_3490);
    }
    int _3492 = _3488;
    if (_3480)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10580 = as_type<float>(_3492);
        out.gl_Position.z = _10580;
    }
    if (_3480)
    {
        return out;
    }
    float _3494 = fma(_3456, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3496 = fma(_3464, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3498 = floor(_3494);
    float _3500 = floor(_3496);
    float _3502 = -_3498;
    float _3504 = _3494 + _3502;
    float _3506 = -_3500;
    float _3508 = _3496 + _3506;
    float2 _10616 = float2(_3504, _3508);
    float _3510 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10616, float2(0.0), isnan(_10616)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10616, float2(0.0), isnan(_10616)), level(0.0)).x;
    float _3512 = _1034 * 2.0;
    float _3514 = _1014 * 2.0;
    float _3516 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3518 = log2(_3516);
    float _3520 = _1016 + _1014;
    float _3522 = _1016 * 2.0;
    int _3524 = abs(_3442);
    float _3526 = -_3446;
    float _3528 = _2464 + _3526;
    float _3530 = _3520 + (-1.0);
    float _3532 = -_3444;
    float _3534 = _2490 + _3532;
    float _3536 = -_3452;
    float _3538 = _2502 + _3536;
    float _3540 = floor(_3512);
    float _3542 = _3528 * _3528;
    int _3544 = abs(_3436);
    float _3546 = _615 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3548 = floor(_3514);
    float _3550 = _3518 * _135;
    bool _3552 = _3540 > 0.0;
    float _3554 = floor(_3522);
    bool _3556 = _3540 >= 0.0;
    bool _3558 = isnan(_3540);
    bool _3560 = _3556 || _3558;
    bool _3562 = isnan(0.0);
    bool _3564 = _3560 || _3562;
    float _3566 = fma(_3530, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3568 = _1016 + _1034;
    float _3570 = _1016 + (-0.5);
    int _3572 = _3564 ? 0 : 1;
    float _3574 = _3568 + (-1.0);
    bool _3576 = _3548 >= 0.0;
    bool _3578 = isnan(_3548);
    bool _3580 = _3576 || _3578;
    bool _3582 = isnan(0.0);
    bool _3584 = _3580 || _3582;
    float _3586 = exp2(_3550);
    int _3588 = ~_3572;
    int _3590 = _3588 + 1;
    int _3592 = _3590 + 1;
    float _3594 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _3596 = _3592;
    int _3598 = 2;
    if (!_3552)
    {
        int _3600 = ~_3572;
        int _3602 = _3600 + 1;
        _3596 = _3602;
    }
    int _3604 = _3596;
    float _3606 = _3450 + _3594;
    bool _3608 = _3548 > 0.0;
    bool _3610 = _3554 > 0.0;
    float _3612 = fma(_3574, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _3614 = _3554 >= 0.0;
    bool _3616 = isnan(_3554);
    bool _3618 = _3614 || _3616;
    bool _3620 = isnan(0.0);
    bool _3622 = _3618 || _3620;
    float _3624 = in.m_94.x;
    float _3626 = in.m_94.y;
    float _3628 = in.m_94.z;
    float _3630 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3632 = 1.0 + _3630;
    int _3634 = _3584 ? 0 : 1;
    float _3636 = float(_3604);
    float _3638 = 1.0 / _3632;
    float _3640 = float(_3524);
    float _3642 = -_3586;
    float _3644 = _3642 + 1.0;
    int _3646 = ~_3634;
    int _3648 = _3646 + 1;
    int _3650 = _3648 + 1;
    int _3652 = _3650;
    if (!_3608)
    {
        int _3654 = ~_3634;
        int _3656 = _3654 + 1;
        _3652 = _3656;
    }
    int _3658 = _3652;
    float _3660 = _3640 * _3636;
    bool _3662 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3664 = isnan(1.0);
    bool _3666 = _3662 || _3664;
    bool _3668 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3670 = _3666 || _3668;
    float _3672 = fma(_3534, _3534, _3542);
    int _3674 = abs(_3430);
    float _3676 = _3660 * (-2.0);
    float _3678 = float(_3658);
    float _3680 = fma(_3538, _3538, _3672);
    float _3682 = float(_3674);
    float _3684 = fma(_3566, _3676, _3566);
    bool _3686 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3688 = isnan(0.0);
    bool _3690 = _3686 || _3688;
    bool _3692 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3694 = _3690 || _3692;
    float _3696 = _3682 * _3678;
    float _3698 = _3694 ? _3644 : 0.0;
    float _3700 = _1014 + (-0.5);
    float _3702 = fma(_3676, _3624, _3624);
    float _3704 = _1014 + _1034;
    float _3706 = _1034 + (-0.5);
    if (_3670)
    {
        float _3708 = _3698 * _3638;
        _145 = _3708;
    }
    float _3710 = _145;
    float _3712 = fma(_3700, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3702);
    int _3714 = _3622 ? 0 : 1;
    float _3716 = _3696 * (-2.0);
    float _3718 = _3704 + (-1.0);
    float _3720 = fma(_3684, _3710, _3712);
    int _3722 = ~_3714;
    int _3724 = _3722 + 1;
    int _3726 = _3724 + 1;
    float _3728 = fma(_3612, _3716, _3612);
    float _3730 = fma(_3716, _3626, _3626);
    int _3732 = _3726;
    if (!_3610)
    {
        int _3734 = ~_3714;
        int _3736 = _3734 + 1;
        _3732 = _3736;
    }
    int _3738 = _3732;
    float _3740 = _3720 * 0.15915493667125701904296875;
    float _3742 = fma(_3570, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3730);
    float _3744 = float(_3738);
    float _3746 = _3740 * 6.283185482025146484375;
    float _3748 = sin(_3746);
    float _3750 = float(_3544);
    float _3752 = fma(_3728, _3710, _3742);
    float _3754 = _3750 * _3744;
    float _3756 = _3752 * 0.15915493667125701904296875;
    float _3758 = _3740 * 6.283185482025146484375;
    float _3760 = cos(_3758);
    float _3762 = _3754 * (-2.0);
    float _3764 = fma(_3718, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3766 = fma(_3762, _3628, _3628);
    float _3768 = fma(_3764, _3762, _3764);
    float _3770 = _3756 * 6.283185482025146484375;
    float _3772 = sin(_3770);
    float _3774 = fma(_3706, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3766);
    float _3776 = fma(_3768, _3710, _3774);
    float _3778 = _3450 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3780 = _3756 * 6.283185482025146484375;
    float _3782 = cos(_3780);
    float _3784 = _3776 * 0.15915493667125701904296875;
    float _3786 = fma(_3456, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3778);
    float _3788 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3786);
    float _3790 = sqrt(_3680);
    float _3792 = _3748 * _3772;
    float _3794 = _3788 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3796 = _3450 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3798 = _3760 * _3772;
    float _3800 = fma(_3456, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3796);
    float _3802 = 1.0 / _3794;
    float _3804 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3800);
    float _3806 = _3804 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3808 = _3784 * 6.283185482025146484375;
    float _3810 = sin(_3808);
    float _3812 = _3760 * _3782;
    float _3814 = _3408 * _3790;
    float _3816 = _3806 + _3794;
    float _3818 = _3814 * _3546;
    float _3820 = _3406 * _3814;
    float _3822 = _3784 * 6.283185482025146484375;
    float _3824 = cos(_3822);
    float _3826 = _3816 * _3802;
    float _3828 = _3826 * 0.5;
    float _3830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3832 = _3814 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3834 = _3832 * 0.5;
    float _3836 = _3830 * _3818;
    float _3838 = fma(_3810, _3812, _3792);
    float _3840 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3842 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3840);
    float _3844 = fma(_3810, _3792, _3812);
    float _3846 = _3748 * _3782;
    float _3848 = 1.0 / _3842;
    float _3850 = -_3798;
    float _3852 = fma(_3810, _3846, _3850);
    float _3854 = _3760 * _3824;
    float _3856 = _3782 * _3824;
    float _3858 = _3748 * _3824;
    float _3860 = _3772 * _3824;
    float _3862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _241);
    float _3864 = -_3846;
    float _3866 = fma(_3810, _3798, _3864);
    float _3868 = -_3836;
    float _3870 = _3810 * _3868;
    float _3872 = _3858 * _3836;
    float _3874 = _3862 * _3820;
    float _3876 = _3606 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3878 = _3854 * _3836;
    float _3880 = _3606 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3882 = fma(_3856, _3874, _3870);
    float _3884 = fma(_3456, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3876);
    float _3886 = fma(_3852, _3874, _3872);
    float _3888 = fma(_3838, _3874, _3878);
    float _3890 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3892 = _3848 * _3890;
    float _3894 = fma(_3464, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3884);
    float _3896 = fma(_3456, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3880);
    float _3898 = fma(_3866, _3834, _3888);
    float _3900 = fma(_3860, _3834, _3882);
    bool _3902 = _3892 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3904 = _3894 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _3906 = _3892 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3908 = _3898 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3910 = fma(_3844, _3834, _3886);
    float _3912 = fma(_3464, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3896);
    float _3914 = trunc(_3904);
    int _3916 = int(_3914);
    float _3918 = _3898 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3920 = fma(_3900, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3908);
    float _3922 = _3912 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _3924 = !_3902;
    int _3926 = _3924 ? 0 : 1;
    float _3928 = fma(_3900, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3918);
    float _3930 = fma(_3910, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3920);
    int _3932 = as_type<int>(_3898);
    int _3934 = as_type<int>(_3910);
    float _3936 = _3904;
    if (!_3902)
    {
        _3598 = 1;
    }
    int _3938 = _3598;
    float _3940 = trunc(_3922);
    int _3942 = int(_3940);
    int _3944 = _3938;
    if (!_3906)
    {
        _3944 = _3926;
    }
    int _3946 = _3944;
    float _3948 = fma(_3910, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3928);
    float _3950 = _3930 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _3952 = _3946 << 6;
    float _3954 = _3948 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3956 = _2432 + _3950;
    int _3958 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3960 = _3916 + _3958;
    int _3962 = _3960 + 1;
    int _3964 = _3952 + 56;
    uint _3966 = uint(int(uint(_3964) >> uint(2)));
    uint _3968 = uint(int(uint(int(_3966)) >> uint(2)));
    int _3970 = int(_3966) & 3;
    float _3972 = (*spvDescriptorSet0.vp_c15)._m0[int(_3968)][_3970];
    int _3974 = int(_3966) + 1;
    uint _3976 = uint(int(uint(_3974) >> uint(2)));
    int _3978 = _3974 & 3;
    float _3980 = (*spvDescriptorSet0.vp_c15)._m0[int(_3976)][_3978];
    float _3982 = _2378 + _3954;
    float _3984 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3986 = _3956 + _3984;
    bool _3988 = _3962 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _3990 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3992 = _3982 + _3990;
    float _3994 = _3986 * _3986;
    int _3996 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3998 = _3942 + _3996;
    int _4000 = _3998 + 1;
    int _4002 = _3952 + 48;
    uint _4004 = uint(int(uint(_4002) >> uint(2)));
    uint _4006 = uint(int(uint(int(_4004)) >> uint(2)));
    int _4008 = int(_4004) & 3;
    float _4010 = (*spvDescriptorSet0.vp_c15)._m0[int(_4006)][_4008];
    int _4012 = int(_4004) + 1;
    uint _4014 = uint(int(uint(_4012) >> uint(2)));
    int _4016 = _4012 & 3;
    float _4018 = (*spvDescriptorSet0.vp_c15)._m0[int(_4014)][_4016];
    float _4020 = fma(_3992, _3992, _3994);
    int _4022 = _3962 | _4000;
    float _4024 = sqrt(_4020);
    bool _4026 = _4022 < 0;
    bool _4028 = _4026 || _3988;
    int _4030 = _3952 + 64;
    uint _4032 = uint(int(uint(_4030) >> uint(2)));
    uint _4034 = uint(int(uint(int(_4032)) >> uint(2)));
    int _4036 = int(_4032) & 3;
    float _4038 = (*spvDescriptorSet0.vp_c15)._m0[int(_4034)][_4036];
    int _4040 = int(_4032) + 1;
    uint _4042 = uint(int(uint(_4040) >> uint(2)));
    int _4044 = _4040 & 3;
    float _4046 = (*spvDescriptorSet0.vp_c15)._m0[int(_4042)][_4044];
    float _4048 = _3898 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _4050 = _4000 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4052 = _4050 || _4028;
    float _4054 = fma(_3900, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4048);
    int _4056 = _3952 + 72;
    uint _4058 = uint(int(uint(_4056) >> uint(2)));
    uint _4060 = uint(int(uint(int(_4058)) >> uint(2)));
    int _4062 = int(_4058) & 3;
    float _4064 = (*spvDescriptorSet0.vp_c15)._m0[int(_4060)][_4062];
    int _4066 = int(_4058) + 1;
    uint _4068 = uint(int(uint(_4066) >> uint(2)));
    int _4070 = _4066 & 3;
    float _4072 = (*spvDescriptorSet0.vp_c15)._m0[int(_4068)][_4070];
    float _4074 = fma(_3910, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4054);
    float _4076 = _4074 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _4078 = _4024 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _4080 = _3952 + 96;
    uint _4082 = uint(int(uint(_4080) >> uint(2)));
    uint _4084 = uint(int(uint(int(_4082)) >> uint(2)));
    int _4086 = int(_4082) & 3;
    float _4088 = (*spvDescriptorSet0.vp_c15)._m0[int(_4084)][_4086];
    int _4090 = int(_4082) + 1;
    uint _4092 = uint(int(uint(_4090) >> uint(2)));
    int _4094 = _4090 & 3;
    float _4096 = (*spvDescriptorSet0.vp_c15)._m0[int(_4092)][_4094];
    int _4098 = _3962;
    int _4100 = as_type<int>(_4074);
    float _4102 = _3994;
    float _4104 = _3982;
    float _4106 = _3956;
    if (!_4052)
    {
        int _4108 = _4000 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4110 = _4108 + _3962;
        _3932 = _4110;
    }
    int _4112 = _3932;
    float _4114 = _2392 + _4076;
    if (!_4052)
    {
        int _4116 = _4112 << 2;
        _3934 = _4116;
    }
    int _4118 = _3934;
    int _4120 = _3952 + 104;
    uint _4122 = uint(int(uint(_4120) >> uint(2)));
    uint _4124 = uint(int(uint(int(_4122)) >> uint(2)));
    int _4126 = int(_4122) & 3;
    float _4128 = (*spvDescriptorSet0.vp_c15)._m0[int(_4124)][_4126];
    int _4130 = int(_4122) + 1;
    uint _4132 = uint(int(uint(_4130) >> uint(2)));
    int _4134 = _4130 & 3;
    float _4136 = (*spvDescriptorSet0.vp_c15)._m0[int(_4132)][_4134];
    float _4138 = as_type<float>(_4118);
    if (!_4052)
    {
        uint _4140 = uint(int(uint(_4112) >> uint(2)));
        _4098 = int(_4140);
    }
    int _4142 = _4098;
    float _4144 = as_type<float>(_4142);
    if (!_4052)
    {
        int _4146 = 12 & _4118;
        _4100 = _4146;
    }
    int _4148 = _4100;
    if (!_4078)
    {
        _4102 = _3982;
    }
    float _4150 = _4102;
    float _4152 = _4150;
    if (!_4052)
    {
        int _4154 = _4142 << 4;
        int _4156 = _4154 + _4148;
        _4144 = as_type<float>(_4156);
    }
    float _4158 = _4144;
    if (!_4078)
    {
        _4104 = _4114;
    }
    float _4160 = _4104;
    bool _4162 = !_4078;
    float _4164 = _4160;
    if (!_4162)
    {
        float _4166 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4168 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4170 = _4024 + _4168;
        float _4172 = _4114 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4174 = rsqrt(_4020);
        float _4176 = _4170 * _4166;
        float _4178 = _4176 * 0.15915493667125701904296875;
        float _4180 = _4178 * 6.283185482025146484375;
        float _4182 = cos(_4180);
        float _4184 = _4178 * 6.283185482025146484375;
        float _4186 = sin(_4184);
        float _4188 = _4182 + (-1.0);
        float _4190 = fma(_4186, _4172, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4192 = _4188 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4194 = _4174 * _4190;
        float _4196 = fma(_4114, _4182, _4192);
        float _4198 = fma(_3992, _4194, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4200 = fma(_3986, _4194, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4164 = _4196;
        _4152 = _4198;
        _4106 = _4200;
        _4138 = _4188;
    }
    float _4202 = _4164;
    float _4204 = _4152;
    float _4206 = _4106;
    float _4208 = _4138;
    float _4210 = -_2392;
    float _4212 = _4210 + _4202;
    int _4214 = _3952 + 80;
    uint _4216 = uint(int(uint(_4214) >> uint(2)));
    uint _4218 = uint(int(uint(int(_4216)) >> uint(2)));
    int _4220 = int(_4216) & 3;
    float _4222 = (*spvDescriptorSet0.vp_c15)._m0[int(_4218)][_4220];
    int _4224 = int(_4216) + 1;
    uint _4226 = uint(int(uint(_4224) >> uint(2)));
    int _4228 = _4224 & 3;
    float _4230 = (*spvDescriptorSet0.vp_c15)._m0[int(_4226)][_4228];
    float _4232 = -_2378;
    float _4234 = _4232 + _4204;
    float _4236 = -_2432;
    float _4238 = _4236 + _4206;
    float _4240 = _4212 * _4212;
    float _4242 = _3606 * _4096;
    float _4244 = _4208;
    float _4246 = _4240;
    float _4248 = _4204;
    float _4250 = _4202;
    float _4252 = _4206;
    if (!_4052)
    {
        float _4254 = floor(_3904);
        _4244 = _4254;
    }
    float _4256 = _4244;
    float _4258 = _3606 * _4046;
    float _4260 = fma(_4234, _4234, _4240);
    int _4262 = _3952 + 88;
    uint _4264 = uint(int(uint(_4262) >> uint(2)));
    uint _4266 = uint(int(uint(int(_4264)) >> uint(2)));
    int _4268 = int(_4264) & 3;
    float _4270 = (*spvDescriptorSet0.vp_c15)._m0[int(_4266)][_4268];
    int _4272 = int(_4264) + 1;
    uint _4274 = uint(int(uint(_4272) >> uint(2)));
    int _4276 = _4272 & 3;
    float _4278 = (*spvDescriptorSet0.vp_c15)._m0[int(_4274)][_4276];
    float _4280 = fma(_3456, _4088, _4242);
    float _4282 = fma(_3456, _4038, _4258);
    float _4284 = fma(_4238, _4238, _4260);
    float _4286 = fma(_3464, _4128, _4280);
    if (!_4052)
    {
        float _4288 = floor(_3922);
        _4246 = _4288;
    }
    float _4290 = _4246;
    bool _4292 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _4294 = isnan(0.5);
    bool _4296 = _4292 || _4294;
    bool _4298 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4300 = _4296 || _4298;
    float _4302 = _4158;
    float _4304 = _4290;
    if (!_4052)
    {
        int _4306 = as_type<int>(_4158) + 400;
        uint _4308 = uint(int(uint(_4306) >> uint(2)));
        uint _4310 = uint(int(uint(int(_4308)) >> uint(2)));
        int _4312 = int(_4308) & 3;
        float _4314 = (*spvDescriptorSet0.vp_c15)._m0[int(_4310)][_4312];
        _4302 = _4314;
    }
    float _4316 = _4302;
    float _4318 = _4286 + _4136;
    float _4320 = _3606 * _4018;
    float _4322 = fma(_3464, _4064, _4282);
    float _4324 = sqrt(_4284);
    float _4326 = fma(_3456, _4010, _4320);
    float _4328 = fma(_3464, _3972, _4326);
    float _4330 = 1.0 / _4318;
    bool _4332 = _4324 > 0.0;
    bool _4334 = !_4332;
    if (!_4334)
    {
        float _4336 = _245 * _245;
        float _4338 = rsqrt(_4284);
        float _4340 = fma(_237, _237, _4336);
        float _4342 = fma(_247, _247, _4340);
        float _4344 = sqrt(_4342);
        float _4346 = _4234 * _4338;
        float _4348 = _4212 * _4338;
        float _4350 = _4238 * _4338;
        bool _4352 = _4344 > 0.0;
        bool _4354 = !_4352;
        if (!_4354)
        {
            float _4356 = rsqrt(_4342);
            float _4358 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4360 = _245 * _4356;
            float _4362 = _237 * _4356;
            float _4364 = _247 * _4356;
            float _4366 = _4348 * _4360;
            float _4368 = fma(_4346, _4362, _4366);
            float _4370 = _4358 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4372 = fma(_4350, _4364, _4368);
            float _4374 = _4372 * _4370;
            float _4376 = fma(_237, _4374, _4204);
            float _4378 = fma(_245, _4374, _4202);
            float _4380 = fma(_247, _4374, _4206);
            _4248 = _4376;
            _4250 = _4378;
            _4252 = _4380;
        }
    }
    float _4382 = _4248;
    float _4384 = _4250;
    float _4386 = _4252;
    float _4388 = -_3444;
    float _4390 = _4388 + _4382;
    float _4392 = -_3446;
    float _4394 = _4392 + _4384;
    float _4396 = -_3452;
    float _4398 = _4396 + _4386;
    float _4400 = _4328 + _3980;
    float _4402 = _4322 + _4072;
    float _4404 = _4394;
    float _4406 = _4390;
    float _4408 = _4398;
    float _4410 = _4402;
    if (!_4300)
    {
        float _4412 = _3460 * _3460;
        float _4414 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4416 = -_2432;
        float _4418 = _4416 + _4386;
        float _4420 = -_2392;
        float _4422 = _4420 + _4384;
        float _4424 = fma(_3468, _3468, _4412);
        float _4426 = -_2378;
        float _4428 = _4426 + _4382;
        float _4430 = fma(_3474, _3474, _4424);
        float _4432 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4434 = sqrt(_4430);
        float _4436 = 1.0 / _3814;
        float _4438 = precise::min(_4434, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4440 = _4438 * _4414;
        float _4442 = _4432 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4444 = _4440 * _4436;
        float _4446 = _4442 * _4444;
        float _4448 = _4418 * _4444;
        float _4450 = fma(_4422, _4446, _3450);
        float _4452 = fma(_4428, _4446, _3456);
        float _4454 = fma(_4442, _4448, _3464);
        _4404 = _4450;
        _4406 = _4452;
        _4408 = _4454;
    }
    float _4456 = _4404;
    float _4458 = _4406;
    float _4460 = _4408;
    float _4462 = _4456 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4464 = _4400 * _4330;
    float _4466 = _4456 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4468 = _4456 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4470 = fma(_4458, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4462);
    float _4472 = _4402 * _4330;
    float _4474 = fma(_4458, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4466);
    bool _4476 = _4464 >= 0.0;
    float _4478 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4470);
    float _4480 = fma(_4458, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4468);
    float _4482 = _4456 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4484 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4474);
    float _4486 = _4478 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _4488 = _4464 <= 1.0;
    bool _4490 = _4488 && _4476;
    float _4492 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4480);
    float _4494 = fma(_4458, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4482);
    float _4496 = _4484 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4498 = _4486 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _4500 = _4472 >= 0.0;
    bool _4502 = _4500 && _4490;
    float _4504 = _4492 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4506 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4494);
    float _4508 = fma(_4496, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4498);
    bool _4510 = _4472 <= 1.0;
    bool _4512 = _4510 && _4502;
    float _4514 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4516 = _4504 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4518 = _4506 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4520 = fma(_4504, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4508);
    float _4522 = _3606 * _4230;
    float _4524 = -_4516;
    float _4526 = fma(_4524, _4514, 1.0);
    float _4528 = _4486 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4530 = fma(_4518, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4520);
    float _4532 = _4486 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4534 = fma(_3456, _4222, _4522);
    float _4536 = fma(_4496, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4528);
    float _4538 = 1.0 / _4530;
    float _4540 = _4494;
    float _4542 = _4492;
    float _4544 = _4530;
    if (_4512)
    {
        float _4546 = float(_3946);
        _4540 = _4546;
    }
    float _4548 = _4540;
    float _4550 = fma(_4496, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4532);
    float _4552 = fma(_3464, _4270, _4534);
    float _4554 = fma(_4504, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4536);
    if (!_4052)
    {
        float _4556 = -_4290;
        float _4558 = _3922 + _4556;
        _4304 = _4558;
    }
    float _4560 = _4304;
    float _4562 = fma(_4504, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4550);
    float _4564 = _4552 + _4278;
    float _4566 = log2(_4526);
    float _4568 = fma(_4518, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4554);
    float _4570 = fma(_4518, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4562);
    if (!_4052)
    {
        float _4572 = -_4256;
        float _4574 = _3904 + _4572;
        _4410 = _4574;
    }
    float _4576 = _4410;
    float _4578 = _4564 * _4330;
    float _4580 = _4322;
    if (!_4052)
    {
        float _4582 = rint(_4316);
        float _4584 = precise::max(_4582, 0.0);
        uint _4586 = uint(_4584);
        uint _4588 = clamp(_4586, 0u, 65535u);
        _4580 = as_type<float>(_4588);
    }
    float _4590 = _4580;
    float _4592 = _4568 * _4538;
    float _4594 = _4570 * _4538;
    float _4596 = fma(_4592, 0.5, 0.5);
    float _4598 = fma(_4594, -0.5, 0.5);
    float _4600 = _4548;
    if (_4512)
    {
        float _4602 = rint(_4548);
        float _4604 = precise::max(_4602, 0.0);
        uint _4606 = uint(_4604);
        uint _4608 = clamp(_4606, 0u, 65535u);
        _4600 = as_type<float>(_4608);
    }
    float _4610 = _4600;
    float _4612 = _4566 * 0.693147182464599609375;
    float _4614 = _4612 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4616 = _4560;
    float _4618 = _4614;
    if (!_4052)
    {
        float3 _12365 = float3(_4576, _4560, float(as_type<int>(_4590)));
        float3 _12369 = select(_12365, float3(0.0), isnan(_12365));
        float _4620 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12369.xy, uint(rint(_12369.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12369.xy, uint(rint(_12369.z)), level(0.0)).x;
        _4616 = _4620;
    }
    float _4622 = _4616;
    float _4624 = _4612;
    if (_4512)
    {
        float3 _12384 = float3(_4464, _4472, float(as_type<int>(_4610)));
        float3 _12386 = select(_12384, float3(0.0), isnan(_12384));
        float _4626 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12386.xy, uint(rint(_12386.z)), _4578, level(0.0));
        _4624 = _4626;
    }
    float _4628 = _4624;
    float3 _12396 = float3(_4596, _4598, _4614);
    float _4630 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12396, float3(0.0), isnan(_12396)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12396, float3(0.0), isnan(_12396)), level(0.0)).x;
    float3 _12405 = float3(_4596, _4598, _4614);
    float4 _4633 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12405, float3(0.0), isnan(_12405)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12405, float3(0.0), isnan(_12405)), level(0.0)).xyzw;
    float _4635 = _4633.x;
    float _4637 = _4633.y;
    float _4639 = _4633.z;
    float _4641 = _4633.w;
    bool _4643 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4645 = isnan(0.5);
    bool _4647 = _4643 || _4645;
    bool _4649 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4651 = _4647 || _4649;
    if (_4052)
    {
        _3482 = 1.0;
    }
    float _4653 = _3482;
    float _4655 = _4653;
    if (_4651)
    {
        _4542 = 1.0;
    }
    float _4657 = _4542;
    float _4659 = _4657;
    float _4661 = _4637;
    float _4663 = _4635;
    if (!_4651)
    {
        float _4665 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4667 = _4665 * 0.15915493667125701904296875;
        float _4669 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4671 = _4667 * 6.283185482025146484375;
        float _4673 = cos(_4671);
        float _4675 = _4669 * 0.15915493667125701904296875;
        float _4677 = _4667 * 6.283185482025146484375;
        float _4679 = sin(_4677);
        float _4681 = 1.0 / _4673;
        float _4683 = _4675 * 6.283185482025146484375;
        float _4685 = cos(_4683);
        float _4687 = _4679 * _4681;
        float _4689 = _4675 * 6.283185482025146484375;
        float _4691 = sin(_4689);
        float _4693 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4695 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4693;
        float _4697 = _4685 * _4687;
        float _4699 = 1.0 / _4695;
        float _4701 = 1.0 / _4697;
        float _4703 = _4691 * _4701;
        float _4705 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4707 = fma(_3892, _4703, _4705);
        float _4709 = _4707 * _4699;
        float _4711 = precise::clamp(_4709, 0.0, 1.0);
        _4618 = _4667;
        _4659 = _4711;
    }
    float _4713 = _4618;
    float _4715 = _4659;
    float _4717 = _4713;
    if (!_4052)
    {
        int _4719 = _4112 << 4;
        int _4721 = _4719 + 2048;
        uint _4723 = uint(int(uint(_4721) >> uint(2)));
        uint _4725 = uint(int(uint(int(_4723)) >> uint(2)));
        int _4727 = int(_4723) & 3;
        float _4729 = (*spvDescriptorSet0.vp_c15)._m0[int(_4725)][_4727];
        int _4731 = int(_4723) + 1;
        uint _4733 = uint(int(uint(_4731) >> uint(2)));
        int _4735 = _4731 & 3;
        float _4737 = (*spvDescriptorSet0.vp_c15)._m0[int(_4733)][_4735];
        int _4739 = _4721 + 8;
        uint _4741 = uint(int(uint(_4739) >> uint(2)));
        uint _4743 = uint(int(uint(int(_4741)) >> uint(2)));
        int _4745 = int(_4741) & 3;
        float _4747 = (*spvDescriptorSet0.vp_c15)._m0[int(_4743)][_4745];
        int _4749 = int(_4741) + 1;
        uint _4751 = uint(int(uint(_4749) >> uint(2)));
        int _4753 = _4749 & 3;
        float _4755 = (*spvDescriptorSet0.vp_c15)._m0[int(_4751)][_4753];
        float _4757 = _3606 * _4737;
        float _4759 = fma(_3456, _4729, _4757);
        float _4761 = fma(_3464, _4747, _4759);
        float _4763 = _4761 + _4755;
        float _4765 = precise::clamp(_4763, 0.0, 1.0);
        float _4767 = -_4765;
        float _4769 = _4767 + _4622;
        float _4771 = fma(_4769, 500.0, 1.5);
        float _4773 = exp2(_4771);
        float _4775 = 0.0 + _4773;
        float _4777 = precise::clamp(_4775, 0.0, 1.0);
        _4655 = _4777;
    }
    float _4779 = _4655;
    float _4781 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4783 = _4456 + _4781;
    float _4785 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4787 = _4458 + _4785;
    float _4789 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4791 = _4460 + _4789;
    float _4793 = _4783 * _4783;
    float _4795 = fma(_4787, _4787, _4793);
    float _4797 = fma(_4791, _4791, _4795);
    float _4799 = rsqrt(_4797);
    float _4801 = _4799 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4803 = _4787 * _4801;
    float _4805 = _4791 * _4801;
    float _4807 = _4803 * _4803;
    float _4809 = _4805 * _4805;
    float _4811 = _4807 + _4809;
    float _4813 = sqrt(_4811);
    bool _4815 = _4813 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4817 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4819 = _4813 + _4817;
    float _4821 = _4791;
    float _4823 = _4819;
    float _4825 = _4783;
    if (_4815)
    {
        float _4827 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4821 = _4827;
    }
    float _4829 = _4821;
    if (_4815)
    {
        float _4831 = rsqrt(_4811);
        _4717 = _4831;
    }
    float _4833 = _4717;
    float _4835 = _4833;
    if (_4815)
    {
        float _4837 = _4819 * _4829;
        _4823 = _4837;
    }
    float _4839 = _4823;
    if (_4815)
    {
        float _4841 = _4839 * 0.15915493667125701904296875;
        _3484 = _4841;
    }
    float _4843 = _3484;
    float _4845 = _4799;
    if (_4815)
    {
        float _4847 = _4843 * 6.283185482025146484375;
        float _4849 = sin(_4847);
        _4845 = _4849;
    }
    float _4851 = _4845;
    float _4853 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4855 = precise::max(0.0, _4853);
    float _4857 = _4793;
    float _4859 = _4855;
    float _4861 = _4853;
    if (_4815)
    {
        float _4863 = _4843 * 6.283185482025146484375;
        float _4865 = cos(_4863);
        _4857 = _4865;
    }
    float _4867 = _4857;
    float _4869 = -_4801;
    float _4871 = -_4855;
    float _4873 = fma(_4783, _4869, _4871);
    if (!_4815)
    {
        _4825 = _4805;
    }
    float _4875 = _4825;
    float _4877 = _4875;
    if (_4815)
    {
        float _4879 = _4873 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4859 = _4879;
    }
    float _4881 = _4859;
    float _4883 = _4881;
    float _4885 = _4851;
    if (_4815)
    {
        float _4887 = fma(_4851, _4881, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4883 = _4887;
    }
    float _4889 = _4883;
    float _4891 = _4889;
    if (!_4815)
    {
        _4885 = _4803;
    }
    float _4893 = _4885;
    float _4895 = _4893;
    float _4897 = _4867;
    if (_4815)
    {
        float _4899 = _4867 + (-1.0);
        _4861 = _4899;
    }
    float _4901 = _4861;
    float _4903 = _4901;
    if (_4815)
    {
        float _4905 = _4833 * _4889;
        _3936 = _4905;
    }
    float _4907 = _3936;
    if (!_4815)
    {
        _4891 = _4873;
    }
    float _4909 = _4891;
    float _4911 = _4909;
    if (_4815)
    {
        float _4913 = _4901 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4903 = _4913;
    }
    float _4915 = _4903;
    if (_4815)
    {
        float _4917 = _4803 * _4907;
        _4895 = _4917;
    }
    float _4919 = _4895;
    if (!_4815)
    {
        _4835 = _4807;
    }
    float _4921 = _4835;
    float _4923 = _4921;
    if (_4815)
    {
        float _4925 = _4805 * _4907;
        _4877 = _4925;
    }
    float _4927 = _4877;
    if (_4815)
    {
        float _4929 = fma(_4873, _4867, _4915);
        _4911 = _4929;
    }
    float _4931 = _4911;
    if (_4815)
    {
        float _4933 = _4919 * _4919;
        _4923 = _4933;
    }
    float _4935 = _4923;
    if (!_4815)
    {
        _4897 = _4809;
    }
    float _4937 = _4897;
    float _4939 = _4937;
    if (_4815)
    {
        float _4941 = _4927 * _4927;
        _4939 = _4941;
    }
    float _4943 = _4939;
    float _4945 = sqrt(_4797);
    float _4947 = fma(_4931, _4931, _4935);
    float _4949 = _4947 + _4943;
    float _4951 = rsqrt(_4949);
    float _4953 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4955 = fma(_4945, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4953);
    float _4957 = precise::clamp(_4955, 0.0, 1.0);
    float _4959 = -_4957;
    float _4961 = _4959 + 1.0;
    float _4963 = abs(_4961);
    float _4965 = log2(_4963);
    float _4967 = _4951 * _4919;
    float _4969 = _4951 * _4931;
    float _4971 = _4951 * _4927;
    float _4973 = _4967 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4975 = -_4973;
    float _4977 = fma(_4969, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4975);
    float _4979 = -_4971;
    float _4981 = fma(_4979, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4977);
    float _4983 = _4965 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4985 = fma(_4981, -0.5, 0.5);
    float _4987 = fma(_4981, 0.5, 0.5);
    float _4989 = exp2(_4983);
    float _4991 = fma(_4987, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4993 = fma(_4987, _4991, -0.212114393711090087890625);
    float _4995 = _4969 + 1.0;
    float _4997 = sqrt(_4985);
    float _4999 = fma(_4987, _4993, 1.570728778839111328125);
    float _5001 = -_4969;
    float _5003 = fma(_4989, _4995, _5001);
    float _5005 = fma(_5003, 0.5, 0.5);
    float _5007 = _4997 * 0.636619746685028076171875;
    float _5009 = -_4999;
    float _5011 = fma(_5007, _5009, 1.0);
    float2 _12973 = float2(_5011, _5005);
    float3 _5015 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12973, float2(0.0), isnan(_12973)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12973, float2(0.0), isnan(_12973)), level(0.0)).xyz;
    float _5017 = _5015.x;
    float _5019 = _5015.y;
    float _5021 = _5015.z;
    float _5023 = abs(_3892);
    float _5025 = log2(_5023);
    float _5027 = _3838 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5029 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5031 = _3838 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5033 = _3838 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5035 = fma(_3856, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5027);
    float _5037 = fma(_5029, _5029, 1.0);
    float _5039 = fma(_3856, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5031);
    float _5041 = _3854 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5043 = _3854 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5045 = _3854 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5047 = fma(_3856, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5033);
    float _5049 = rsqrt(_5037);
    float _5051 = -_3810;
    float _5053 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5041);
    float _5055 = -_3810;
    float _5057 = fma(_5055, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5043);
    float _5059 = -_3810;
    float _5061 = fma(_5059, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5045);
    float _5063 = _5025 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5065 = _3866 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5067 = _3866 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5069 = _3866 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5071 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5047);
    float _5073 = _4486 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5075 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5065);
    float _5077 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5067);
    float _5079 = exp2(_5063);
    float _5081 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5069);
    float _5083 = fma(_3858, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5053);
    float _5085 = fma(_4496, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5073);
    float _5087 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5039);
    float _5089 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5035);
    float _5091 = _241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5093 = _5029 * _5083;
    float _5095 = fma(_3858, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5057);
    float _5097 = fma(_3858, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5061);
    float _5099 = fma(_4504, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5085);
    float _5101 = fma(_3844, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5075);
    float _5103 = fma(_3844, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5077);
    float _5105 = fma(_3844, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5081);
    float _5107 = fma(_5091, _5087, _5093);
    float _5109 = _5029 * _5095;
    float _5111 = _5029 * _5097;
    float _5113 = fma(_4518, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5099);
    float _5115 = _5029 * _5049;
    float _5117 = fma(_5091, _5089, _5109);
    float _5119 = fma(_5091, _5071, _5111);
    float _5121 = -_5101;
    float _5123 = _5115 * _5121;
    float _5125 = _4530 * 0.5;
    float _5127 = fma(_5079, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5129 = precise::clamp(_5127, 0.0, 1.0);
    out.m_96.x = _5087;
    out.m_96.y = _5089;
    out.m_96.z = _5071;
    float _5131 = _4965 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5133 = -_5105;
    float _5135 = _5115 * _5133;
    bool _5137 = _3892 <= 8000.0;
    bool _5139 = isnan(_3892);
    bool _5141 = _5137 || _5139;
    bool _5143 = isnan(8000.0);
    bool _5145 = _5141 || _5143;
    float _5147 = float(_5145);
    out.gl_Position.x = _4568;
    out.gl_Position.y = _4570;
    out.gl_Position.z = _5113;
    out.gl_Position.w = _4530;
    float _5149 = -_3510;
    float _5151 = _5149 + 1.0;
    float _5153 = _5113 + _4530;
    float _5155 = exp2(_5131);
    float _5157 = _5103 + _5117;
    bool _5159 = _4945 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5161 = isnan(_4945);
    bool _5163 = _5159 || _5161;
    bool _5165 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5167 = _5163 || _5165;
    float _5169 = _5153 * 0.5;
    float _5171 = fma(_5049, _5083, _5123);
    float _5173 = fma(_4570, -0.5, _5125);
    float _5175 = _5101 + _5107;
    float _5177 = fma(_5129, -2.0, 3.0);
    float _5179 = _5129 * _5129;
    float _5181 = -_5103;
    float _5183 = _5115 * _5181;
    float _5185 = _5179 * _5177;
    float _5187 = fma(_5049, _5095, _5183);
    float _5189 = fma(_5049, _5097, _5135);
    float _5191 = _4568 + _4530;
    float _5193 = -_5185;
    float _5195 = _5193 + 1.0;
    float _5197 = -_5155;
    float _5199 = _5197 + 1.0;
    float _5201 = _5105 + _5119;
    float _5203 = _5191 * 0.5;
    float _5205 = fma(_5195, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5185);
    float _5207 = _5199 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_98.x = _5171;
    out.m_98.y = _5187;
    out.m_98.z = _5189;
    float _5209 = _5205;
    float _5211 = _5199;
    if (!_5167)
    {
        _4544 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5213 = _4544;
    float _5215 = _5147 * _5205;
    float _5217 = _5213;
    float _5219 = _5213;
    if (!_4512)
    {
        _5209 = 1.0;
    }
    float _5221 = _5209;
    out.m_100.x = _5203;
    out.m_100.y = _5173;
    out.m_100.z = _5169;
    out.m_100.w = _4530;
    float _5223 = _5221;
    if (_4512)
    {
        bool _5225 = _4628 >= _4578;
        bool _5227 = isnan(_4628);
        bool _5229 = _5225 || _5227;
        bool _5231 = isnan(_4578);
        bool _5233 = _5229 || _5231;
        float _5235 = float(_5233);
        _5223 = _5235;
    }
    float _5237 = _5223;
    float _5239 = _5215 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_5167)
    {
        _5211 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5241 = _5211;
    out.m_102.x = _5175;
    out.m_102.y = _5157;
    out.m_102.z = _5201;
    float _5243 = _5151 * _5239;
    float _5245 = precise::clamp(_5243, 0.0, 1.0);
    float _5247 = _5237 * _4779;
    float _5249 = _5207 * _4630;
    float _5251 = -_5207;
    float _5253 = _5251 + 1.0;
    float _5255 = -_5245;
    float _5257 = fma(_5255, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5259 = _4715 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5261 = _4641 * _5249;
    float _5263 = -_5247;
    float _5265 = fma(_5263, _5257, 1.0);
    float _5267 = precise::clamp(_5265, 0.0, 1.0);
    float _5269 = _4641 * _5253;
    float _5271 = _5253;
    float _5273 = _5267;
    float _5275 = _5241;
    float _5277 = _5241;
    if (!_5167)
    {
        _5271 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5279 = _5271;
    float _5281 = _5267 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5283 = _5279;
    float _5285 = _5279;
    if (!_5167)
    {
        _5273 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5287 = _5273;
    out.m_104.x = _5281;
    float _5289 = _5021 * _5249;
    float _5291 = fma(_5017, _5261, _4635);
    float _5293 = fma(_5019, _5261, _4637);
    float _5295 = _5287;
    float _5297 = _5287;
    if (!_5167)
    {
        _4661 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5299 = _4661;
    float _5301 = fma(_4641, _5289, _4639);
    float _5303 = _5299;
    float _5305 = _5299;
    if (!_5167)
    {
        _4663 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5307 = _4663;
    out.m_106.x = _5291;
    out.m_106.y = _5293;
    out.m_106.z = _5301;
    out.m_106.w = _5269;
    bool _5309 = !_5167;
    float _5311 = _5307;
    float _5313 = _5307;
    if (!_5309)
    {
        bool _5315 = _4945 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5317 = isnan(_4945);
        bool _5319 = _5315 || _5317;
        bool _5321 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5323 = _5319 || _5321;
        if (!_5323)
        {
            float _5325 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5327 = _4945 + _5325;
            float _5329 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5331 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5329;
            float _5333 = 1.0 / _5331;
            float _5335 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5337 = _5335 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5339 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5341 = _5339 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5343 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5345 = _5343 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5347 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5349 = _5347 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5351 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5353 = _5351 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5355 = _5327 * _5333;
            float _5357 = precise::clamp(_5355, 0.0, 1.0);
            float _5359 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5361 = _5359 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5363 = fma(_5357, _5337, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5365 = fma(_5357, _5361, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5367 = fma(_5357, _5341, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5369 = fma(_5357, _5345, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5371 = fma(_5357, _5349, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5373 = fma(_5357, _5353, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5313 = _5365;
            _5277 = _5371;
            _5305 = _5363;
            _5285 = _5369;
            _5219 = _5367;
            _5297 = _5373;
            _5375 = true;
        }
        else
        {
            bool _5377 = _4945 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5379 = isnan(_4945);
            bool _5381 = _5377 || _5379;
            bool _5383 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5385 = _5381 || _5383;
            if (!_5385)
            {
                _5303 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5387 = _5303;
            _5305 = _5387;
            if (!_5385)
            {
                _5311 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5389 = _5311;
            _5313 = _5389;
            if (!_5385)
            {
                _5217 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5391 = _5217;
            _5219 = _5391;
            if (!_5385)
            {
                _5283 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5393 = _5283;
            _5285 = _5393;
            if (!_5385)
            {
                _5275 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5395 = _5275;
            _5277 = _5395;
            if (!_5385)
            {
                _5295 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5397 = _5295;
            bool _5399 = !_5385;
            _5297 = _5397;
            if (!_5399)
            {
                bool _5401 = _4945 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5403 = isnan(_4945);
                bool _5405 = _5401 || _5403;
                bool _5407 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5409 = _5405 || _5407;
                if (!_5409)
                {
                    float _5411 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5413 = _4945 + _5411;
                    float _5415 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5417 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5415;
                    float _5419 = 1.0 / _5417;
                    float _5421 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5423 = _5421 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5425 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5427 = _5425 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5429 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5431 = _5429 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5433 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5435 = _5433 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5437 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5439 = _5437 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5441 = _5413 * _5419;
                    float _5443 = precise::clamp(_5441, 0.0, 1.0);
                    float _5445 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5447 = _5445 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5449 = fma(_5443, _5423, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5451 = fma(_5443, _5447, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5453 = fma(_5443, _5427, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5455 = fma(_5443, _5431, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5457 = fma(_5443, _5435, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5459 = fma(_5443, _5439, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5313 = _5451;
                    _5277 = _5457;
                    _5305 = _5449;
                    _5285 = _5455;
                    _5219 = _5453;
                    _5297 = _5459;
                    _5375 = true;
                }
                else
                {
                    _5313 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5277 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5305 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5285 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5219 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5297 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5375 = false;
    float _5461 = _5313;
    float _5463 = _5277;
    float _5465 = _5305;
    float _5467 = _5285;
    float _5469 = _5219;
    float _5471 = _5297;
    float _5473 = fma(_5157, -0.5, 0.5);
    float _5475 = precise::clamp(_5473, 0.0, 1.0);
    float _5477 = -_5461;
    float _5479 = _5477 + _5463;
    float _5481 = _5259 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5483 = -_5465;
    float _5485 = _5483 + _5467;
    float _5487 = fma(_5475, _5479, _5461);
    out.m_108.x = 0.0;
    float _5489 = -_5469;
    float _5491 = _5489 + _5471;
    float _5493 = fma(_5475, _5485, _5465);
    float _5495 = _5487 * 0.586610972881317138671875;
    out.m_63.x = _5481;
    bool _5497 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5499 = fma(_5475, _5491, _5469);
    float _5501 = fma(_5493, 0.298911988735198974609375, _5495);
    bool _5503 = _4715 > 0.0;
    bool _5505 = isnan(_4715);
    bool _5507 = _5503 || _5505;
    bool _5509 = isnan(0.0);
    bool _5511 = _5507 || _5509;
    float _5513 = fma(_5499, 0.114477999508380889892578125, _5501);
    float _5515 = -_5513;
    float _5517 = _5493 + _5515;
    float _5519 = -_5513;
    float _5521 = _5487 + _5519;
    float _5523 = -_5513;
    float _5525 = _5499 + _5523;
    float _5527 = fma(_5517, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5513);
    float _5529 = fma(_5521, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5513);
    float _5531 = fma(_5525, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5513);
    bool _5533 = !_5497;
    if (!_5533)
    {
        float _5535 = -_4456;
        float _5537 = _5535 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5539 = -_4458;
        float _5541 = _5539 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5543 = -_4460;
        float _5545 = _5543 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5547 = _5537 * _5537;
        float _5549 = fma(_5541, _5541, _5547);
        float _5551 = fma(_5545, _5545, _5549);
        float _5553 = sqrt(_5551);
        float _5555 = rsqrt(_5551);
        float _5557 = -_5553;
        float _5559 = _5557 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5561 = _5559 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5563 = precise::clamp(_5561, 0.0, 1.0);
        float _5565 = _5541 * _5555;
        float _5567 = _5537 * _5555;
        float _5569 = abs(_5563);
        float _5571 = log2(_5569);
        float _5573 = _5545 * _5555;
        float _5575 = _5565 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5577 = _5157 * _5567;
        float _5579 = -_5567;
        float _5581 = -_5575;
        float _5583 = fma(_5579, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5581);
        float _5585 = fma(_5175, _5565, _5577);
        float _5587 = -_5573;
        float _5589 = fma(_5587, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5583);
        float _5591 = fma(_5201, _5573, _5585);
        float _5593 = precise::clamp(_5591, 0.0, 1.0);
        float _5595 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5597 = _5589 + _5595;
        float _5599 = _5571 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5601 = _5597 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5603 = precise::clamp(_5601, 0.0, 1.0);
        float _5605 = exp2(_5599);
        float _5607 = _5605 * _5603;
        float _5609 = _5593 * _5607;
        float _5611 = _5609 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5613 = _5609 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5615 = _5609 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_108.x = _5611;
        out.m_108.y = _5613;
        out.m_108.z = _5615;
    }
    out.m_110.x = _5527;
    out.m_110.y = _5529;
    out.m_110.z = _5531;
    if (_5511)
    {
        return out;
    }
    float _5617 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5617;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5375 = false;
    bool _639 = false;
    bool _457 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _124 = in.m_56.w;
    float _126 = in.m_58.w;
    float _128 = trunc(_124);
    int _131 = int(_128);
    float _133 = -_126;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _135;
    bool _139 = _131 >= 1;
    float _141 = 0.0;
    float _143 = _126;
    float _145 = _135;
    if (!_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _141;
    if (!_139)
    {
        out.m_63.x = 0.0;
    }
    int _149 = 0;
    if (!_139)
    {
        float _151 = _147 * 5.0;
        _149 = as_type<int>(_151);
    }
    int _153 = _149;
    int _155 = _153;
    if (!_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5685 = as_type<float>(_153);
        out.gl_Position.z = _5685;
    }
    if (!_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _157 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _159 = isnan(_126);
    bool _161 = _157 || _159;
    bool _163 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _165 = _161 || _163;
    float _167 = float(_131);
    bool _169 = _135 >= _167;
    bool _171 = !_165;
    bool _173 = _169 || _171;
    float _175 = 1.0 / _167;
    if (_173)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _143;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    float _179 = _135 * _175;
    float _181 = _179;
    if (_173)
    {
        float _183 = _177 * 5.0;
        _155 = as_type<int>(_183);
    }
    int _185 = _155;
    out.m_61.x = _179;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5748 = as_type<float>(_185);
        out.gl_Position.z = _5748;
    }
    if (_173)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_68.x;
    float _191 = in.m_68.y;
    float _193 = in.m_68.z;
    float _195 = in.m_70.x;
    float _197 = in.m_70.y;
    float _199 = in.m_70.z;
    float _201 = in.m_72.x;
    float _203 = in.m_72.y;
    float _205 = in.m_72.z;
    float _207 = in.m_74.x;
    float _209 = in.m_74.y;
    float _211 = in.m_74.z;
    int _213 = as_type<int>(_187) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_187) & 2;
    bool _219 = _217 != 0;
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _223 = !_219;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _191 * _197;
    float _229 = _191 * _203;
    float _231 = fma(_189, _195, _227);
    float _233 = _191 * _209;
    float _235 = fma(_189, _201, _229);
    float _237 = fma(_193, _199, _231);
    bool _239 = !_215;
    float _241 = _239 ? (-0.5) : 0.5;
    float _243 = fma(_189, _207, _233);
    float _245 = fma(_193, _205, _235);
    float _247 = fma(_193, _211, _243);
    bool _249 = !_221;
    float _267;
    if (!_249)
    {
        float _251 = in.m_76.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _251 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        _267 = _179;
    }
    _269 = false;
    float _271 = _267;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = _271 + _277;
    bool _281 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _283 = isnan(_271);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _271 + _305;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = 1.0 / _299;
    float _313 = 1.0 / _295;
    float _315 = 1.0 / _303;
    float _317 = _307 * _311;
    bool _319 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _321 = isnan(_271);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = _275 * _313;
    bool _333 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _335 = isnan(_271);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -_291;
    float _347 = _345 + 1.0;
    bool _349 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _351 = isnan(_271);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -_343;
    float _363 = _361 + 1.0;
    float _365 = _343 * _347;
    float _367 = _279 * _315;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = _359 * _363;
    float _387 = -_359;
    float _389 = _387 + 1.0;
    float _391 = fma(_379, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _393 = fma(_371, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _395 = _329 * _389;
    float _397 = -_329;
    float _399 = _397 + 1.0;
    float _401 = fma(_383, _317, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _403 = _391 * _395;
    float _405 = _393 * _395;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _407;
    float _411 = fma(_375, _317, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _413;
    float _417 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _419 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].y, _405);
    float _421 = fma(_409, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _423 = fma(_415, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _425 = fma(_401, _385, _417);
    float _427 = fma(_411, _385, _419);
    float _429 = fma(_421, _365, _425);
    float _431 = fma(_423, _365, _427);
    float _433 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[146].x, _429);
    float _435 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[146].y, _431);
    bool _437 = !_309;
    float _455;
    if (!_437)
    {
        float _439 = in.m_76.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        _455 = _179;
    }
    _457 = false;
    float _459 = _455;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _463 = _459 + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _469 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _471 = isnan(_459);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _489 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _491 = isnan(_459);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = 1.0 / _467;
    float _503 = -_479;
    float _505 = _503 + 1.0;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _507;
    bool _511 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _513 = isnan(_459);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = _499 * _505;
    float _525 = -_499;
    float _527 = _525 + 1.0;
    bool _529 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _531 = 1.0 / _483;
    float _533 = _521 * _527;
    float _535 = -_521;
    float _537 = _535 + 1.0;
    float _539 = 1.0 / _487;
    float _541 = _509 * _501;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _547 = fma(_541, _463, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _549 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _551 = isnan(_459);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _545 * _531;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _569 = _459 + _567;
    float _571 = _547 * _533;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = _459 + _573;
    float _577 = fma(_561, _569, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _579 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[115].x, _571);
    float _581 = _565 * _539;
    float _583 = -_559;
    float _585 = _583 + 1.0;
    float _587 = fma(_577, _523, _579);
    float _589 = fma(_581, _575, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _591 = _479 * _585;
    float _593 = in.m_78.x;
    float _595 = in.m_78.y;
    float _597 = fma(_589, _591, _587);
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _605 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[118].x, _597);
    float _607 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = _601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _611 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = _605 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_80.x = _607;
    out.m_80.y = _609;
    out.m_80.z = _611;
    out.m_80.w = _613;
    float _615 = _435 * _595;
    float _617 = _433 * _593;
    bool _619 = !_529;
    float _637;
    if (!_619)
    {
        float _621 = in.m_76.x;
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _625 = _621 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _627 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _629 = _627 * _623;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _637 = _635;
        _639 = true;
    }
    else
    {
        _637 = _179;
    }
    _639 = false;
    float _641 = _637;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _645 = _641 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _651 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _653 = isnan(_641);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _671 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _673 = isnan(_641);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = 1.0 / _649;
    float _685 = -_661;
    float _687 = _685 + 1.0;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _689;
    bool _693 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _695 = isnan(_641);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = _681 * _687;
    float _707 = -_681;
    float _709 = _707 + 1.0;
    bool _711 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _713 = 1.0 / _665;
    float _715 = _703 * _709;
    float _717 = -_703;
    float _719 = _717 + 1.0;
    float _721 = 1.0 / _669;
    float _723 = _691 * _683;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _727 = _725 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _729 = fma(_723, _645, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _731 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _733 = isnan(_641);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = _727 * _713;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _745;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _751 = _641 + _749;
    float _753 = _729 * _715;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _757 = _641 + _755;
    float _759 = fma(_743, _751, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _761 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[131].x, _753);
    float _763 = _747 * _721;
    float _765 = -_741;
    float _767 = _765 + 1.0;
    float _769 = fma(_759, _705, _761);
    float _771 = fma(_763, _757, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _773 = _661 * _767;
    float _775 = fma(_771, _773, _769);
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _783 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[134].x, _775);
    float _785 = _777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _789 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _791 = _783 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_82.x = _785;
    out.m_82.y = _787;
    out.m_82.z = _789;
    out.m_82.w = _791;
    bool _793 = !_711;
    if (!_793)
    {
        float _795 = in.m_76.x;
        float _797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _799 = _795 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _801 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _803 = _801 * _797;
        float _805 = floor(_803);
        float _807 = -_805;
        float _809 = _803 + _807;
        _181 = _809;
    }
    float _811 = _181;
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _815 = int(_813);
    float _817 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _819 = int(_817);
    float _821 = float(_815);
    float _823 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _825 = int(_823);
    float _827 = float(uint(_819));
    float _829 = 1.0 / _821;
    int _831 = ~_819;
    int _833 = _831 + 1;
    float _835 = 1.0 / _827;
    float _837 = float(uint(_825));
    float _839 = _829 * _135;
    int _841 = ~_819;
    int _843 = _841 + 1;
    float _845 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _847 = int(_845);
    int _849 = as_type<int>(_835) + (-2);
    float _851 = trunc(_839);
    int _853 = int(_851);
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _857 = _855 != 0;
    float _859 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _861 = int(_859);
    float _863 = float(uint(_853));
    float _865 = 0.0;
    if (_857)
    {
        _865 = 1.0;
    }
    float _867 = _865;
    int _869 = 0;
    int _871 = 0;
    float _873 = _867;
    if (_857)
    {
        _869 = 0;
        _871 = 0;
    }
    int _875 = _869;
    int _877 = _871;
    float _879 = 0.0;
    int _881 = _875;
    int _883 = _877;
    if (_857)
    {
        _879 = 1.0;
    }
    float _885 = _879;
    float _887 = as_type<float>(_849) * _863;
    float _889 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _891 = int(_889);
    float _893 = trunc(_887);
    float _895 = precise::max(_893, 0.0);
    uint _898 = uint(_895);
    float _900 = float(_891);
    float _902 = 1.0 / _900;
    int _904 = _843 * int(_898);
    int _906 = _904 + _853;
    float _908 = float(uint(_906));
    float _910 = as_type<float>(_849) * _908;
    float _912 = _908;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _916 = _900;
    float _918 = _885;
    if (_857)
    {
        float _920 = in.m_76.x;
        float _922 = in.m_76.y;
        _912 = _920;
        _914 = _922;
    }
    float _924 = _912;
    float _926 = _914;
    float _928 = trunc(_910);
    float _930 = precise::max(_928, 0.0);
    uint _932 = uint(_930);
    float _934 = 1.0 / _837;
    int _936 = int(_898) + int(_932);
    float _938 = float(_819);
    float _940 = float(_853);
    int _942 = _833 * _936;
    int _944 = _942 + _853;
    float _946 = 0.0;
    float _948 = _940;
    float _950 = _924;
    float _952 = _926;
    if (_857)
    {
        _946 = _924;
    }
    float _954 = _946;
    bool _956 = _940 >= _938;
    bool _958 = isnan(_940);
    bool _960 = _956 || _958;
    bool _962 = isnan(_938);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    bool _968 = uint(_944) >= uint(_819);
    float _970 = 0.0;
    float _972 = _954;
    if (_857)
    {
        _970 = _954;
    }
    float _974 = _970;
    float _976 = trunc(_966);
    int _978 = int(_976);
    float _980 = _974;
    if (_857)
    {
        _948 = _926;
    }
    float _982 = _948;
    float _984 = _982;
    if (_857)
    {
        _916 = _954;
    }
    float _986 = _916;
    float _988 = _986;
    if (!_857)
    {
        float _990 = in.m_76.x;
        float _992 = in.m_76.y;
        float _994 = in.m_76.z;
        float _996 = _990 * 3.1415927410125732421875;
        float _998 = _996 * 0.15915493667125701904296875;
        float _1000 = _992 * 3.1415927410125732421875;
        float _1002 = _1000 * 0.15915493667125701904296875;
        float _1004 = _998 * 6.283185482025146484375;
        float _1006 = sin(_1004);
        float _1008 = _1002 * 6.283185482025146484375;
        float _1010 = sin(_1008);
        _873 = 7.345489978790283203125;
        _950 = _990;
        _952 = _992;
        _918 = 5.839270114898681640625;
        _988 = _994;
        _972 = _992;
        _881 = 1;
        _883 = 2;
        _980 = _1006;
        _984 = _1010;
    }
    float _1012 = _873;
    float _1014 = _950;
    float _1016 = _952;
    float _1018 = _918;
    float _1020 = _988;
    float _1022 = _972;
    int _1024 = _881;
    int _1026 = _883;
    float _1028 = _980;
    float _1030 = _984;
    float _1032 = _1012 * _1014;
    float _1034 = in.m_76.z;
    float _1036 = in.m_76.w;
    bool _1038 = !_968;
    int _1040 = _1038 ? 0 : (-1);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1044 = _811 + _1042;
    float _1046 = floor(_1032);
    float _1048 = float(_861);
    float _1050 = in.m_70.w;
    int _1052 = ~_936;
    int _1054 = _1052 + _1040;
    int _1056 = _1054 + 1;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1060 = _811 + _1058;
    float _1062 = float(uint(_847));
    bool _1064 = _819 == 0;
    float _1066 = 1.0 / _1048;
    int _1068 = _819 * _1056;
    int _1070 = _1068 + _853;
    int _1072 = ~_978;
    int _1074 = _1072 + 1;
    int _1076 = _1074 + 1;
    bool _1078 = !_1064;
    int _1080 = _1078 ? _1070 : (-1);
    float _1082 = -_1046;
    float _1084 = _1032 + _1082;
    float _1086 = 1.0 / _1062;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1090 = _1088 != 0;
    int _1092 = _1080 * _1076;
    float _1094 = _1084 * _938;
    bool _1096 = _1034 > 0.5;
    float _1098 = _175 * _135;
    bool _1100 = !_1090;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = _1066 * _135;
    bool _1106 = _1016 > 0.5;
    float _1108 = _902 * _135;
    float _1110 = trunc(_1094);
    int _1112 = int(_1110);
    int _1114 = abs(_1102);
    float _1116 = _938 * _1098;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1120 = _1118 != 0;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1124 = _1122 != 0;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1128 = _1126 != 0;
    float _1130 = -_225;
    int _1132 = _1096 ? as_type<int>(_1130) : as_type<int>(_225);
    float _1134 = -_241;
    int _1136 = _1106 ? as_type<int>(_1134) : as_type<int>(_241);
    float _1138 = trunc(_1108);
    int _1140 = int(_1138);
    bool _1142 = !_1128;
    float _1144 = _1142 ? _225 : as_type<float>(_1132);
    bool _1146 = !_1124;
    float _1148 = _1146 ? _241 : as_type<float>(_1136);
    float _1150 = trunc(_1104);
    int _1152 = int(_1150);
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1156 = _1154 != 0;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1160 = _1158 != 0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1164 = _1162 != 0;
    int _1166 = _1112 * _1114;
    int _1168 = _1166 + _853;
    int _1170 = _819 + (-1);
    int _1172 = as_type<int>(_934) + (-2);
    bool _1174 = !_1160;
    int _1176 = _1174 ? 0 : 1;
    float _1178 = trunc(_1116);
    int _1180 = int(_1178);
    float _1182 = float(uint(_1140));
    int _1184 = _978 * _1170;
    int _1186 = _1184 + _1092;
    bool _1188 = !_1156;
    int _1190 = _1188 ? 0 : 1;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1194 = _1192 != 0;
    float _1196 = as_type<float>(_1172) * _1182;
    int _1198 = as_type<int>(_1086) + (-2);
    int _1200 = abs(_1176);
    bool _1202 = !_1164;
    int _1204 = _1202 ? 0 : 1;
    float _1206 = trunc(_1196);
    float _1208 = precise::max(_1206, 0.0);
    uint _1210 = uint(_1208);
    int _1212 = abs(_1190);
    int _1214 = _1186 * _1200;
    bool _1216 = !_1194;
    int _1218 = _1216 ? 0 : 1;
    float _1220 = float(uint(_1152));
    int _1222 = abs(_1204);
    int _1224 = abs(_1218);
    float _1226 = as_type<float>(_1198) * _1220;
    int _1228 = _1180 * _1212;
    int _1230 = _1228 + _1214;
    int _1232 = ~_825;
    int _1234 = _1232 + 1;
    float _1236 = trunc(_1226);
    float _1238 = precise::max(_1236, 0.0);
    uint _1240 = uint(_1238);
    int _1242 = _1168 * _1222;
    int _1244 = _1242 + _1230;
    int _1246 = ~_847;
    int _1248 = _1246 + 1;
    int _1250 = _1112 * _1224;
    int _1252 = _1250 + _1244;
    int _1254 = ~_825;
    int _1256 = _1254 + 1;
    int _1258 = _1234 * int(_1210);
    int _1260 = _1258 + _1140;
    int _1262 = ~_819;
    int _1264 = _1262 + 1;
    float _1266 = float(uint(_1252));
    float _1268 = float(uint(_1260));
    int _1270 = ~_847;
    int _1272 = _1270 + 1;
    int _1274 = _1248 * int(_1240);
    int _1276 = _1274 + _1152;
    float _1278 = as_type<float>(_849) * _1266;
    float _1280 = as_type<float>(_1172) * _1268;
    bool _1282 = _1036 > 0.5;
    float _1284 = float(uint(_1276));
    float _1286 = trunc(_1278);
    float _1288 = precise::max(_1286, 0.0);
    uint _1290 = uint(_1288);
    float _1292 = float(_825);
    float _1294 = as_type<float>(_1198) * _1284;
    float _1296 = trunc(_1280);
    float _1298 = precise::max(_1296, 0.0);
    uint _1300 = uint(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1306 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1308 = isnan(_811);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1320 = _1318 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1322 = trunc(_1294);
    float _1324 = precise::max(_1322, 0.0);
    uint _1326 = uint(_1324);
    int _1328 = _1264 * int(_1290);
    int _1330 = _1328 + _1252;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1334 = float(uint(_1330));
    int _1336 = int(_1210) + int(_1300);
    float _1338 = _1018 * _1020;
    float _1340 = -_241;
    int _1342 = _1096 ? as_type<int>(_1340) : as_type<int>(_241);
    float _1344 = as_type<float>(_849) * _1334;
    float _1346 = 1.0 / _1304;
    int _1348 = _1256 * _1336;
    int _1350 = _1348 + _1140;
    int _1352 = int(_1240) + int(_1326);
    float _1354 = _1012 * _1022;
    bool _1356 = uint(_1350) >= uint(_825);
    float _1358 = trunc(_1344);
    float _1360 = precise::max(_1358, 0.0);
    uint _1362 = uint(_1360);
    float _1364 = -_225;
    int _1366 = _1282 ? as_type<int>(_1364) : as_type<int>(_225);
    int _1368 = _1272 * _1352;
    int _1370 = _1368 + _1152;
    bool _1372 = !_1356;
    int _1374 = _1372 ? 0 : (-1);
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1378 = _1376 != 0;
    bool _1380 = uint(_1370) >= uint(_847);
    float _1382 = floor(_1338);
    bool _1384 = !_1378;
    float _1386 = _1384 ? _241 : as_type<float>(_1342);
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1390 = _1388 != 0;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1394 = _1392 != 0;
    int _1396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1398 = _1396 != 0;
    int _1400 = ~_819;
    int _1402 = _1400 + 1;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1406 = _1404 != 0;
    float _1408 = floor(_1354);
    bool _1410 = !_1394;
    int _1412 = _1410 ? 0 : 1;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1416 = _1414 != 0;
    int _1418 = int(_1290) + int(_1362);
    float _1420 = float(_1140);
    float _1422 = -_1382;
    float _1424 = _1338 + _1422;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1428 = _1426 != 0;
    int _1430 = _1402 * _1418;
    int _1432 = _1430 + _1252;
    bool _1434 = _1420 >= _1292;
    bool _1436 = isnan(_1420);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan(_1292);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = 1.0 / _1320;
    bool _1448 = !_1406;
    int _1450 = _1448 ? 0 : 1;
    bool _1452 = !_1428;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = 0.0;
    float _1458 = _1050;
    if (_1416)
    {
        float _1460 = in.m_76.w;
        _1456 = _1460;
    }
    float _1462 = _1456;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1466 = _1464 != 0;
    float _1468 = -_1408;
    float _1470 = _1354 + _1468;
    bool _1472 = uint(_1432) >= uint(_819);
    float _1474 = trunc(_1444);
    int _1476 = int(_1474);
    int _1478 = ~_1336;
    int _1480 = _1478 + _1374;
    int _1482 = _1480 + 1;
    bool _1484 = !_1120;
    float _1486 = _1484 ? _225 : as_type<float>(_1366);
    bool _1488 = !_1466;
    int _1490 = _1488 ? 0 : 1;
    int _1492 = _825 * _1482;
    int _1494 = _1492 + _1140;
    bool _1496 = !_1380;
    int _1498 = _1496 ? 0 : (-1);
    bool _1500 = !_1472;
    int _1502 = _1500 ? 0 : (-1);
    float _1504 = _1292 * _1098;
    int _1506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1508 = _1506 != 0;
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1512 = _1510 != 0;
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1516 = _1514 != 0;
    int _1518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1520 = _1518 != 0;
    float _1522 = _1424 * _1292;
    int _1524 = _825 + (-1);
    bool _1526 = !_1390;
    int _1528 = _1526 ? 0 : 1;
    float _1530 = trunc(_1504);
    int _1532 = int(_1530);
    bool _1534 = !_1512;
    int _1536 = _1534 ? 0 : 1;
    bool _1538 = _825 == 0;
    float _1540 = _1462;
    bool _1542 = _1516;
    if (_1416)
    {
        float _1544 = _1462 * 3.1415927410125732421875;
        _1540 = _1544;
    }
    float _1546 = _1540;
    int _1548 = ~_1476;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    bool _1554 = !_1538;
    int _1556 = _1554 ? _1494 : (-1);
    float _1558 = _1546;
    if (_1416)
    {
        float _1560 = _1546 * 0.15915493667125701904296875;
        _1558 = _1560;
    }
    float _1562 = _1558;
    bool _1564 = !_1398;
    int _1566 = _1564 ? 0 : 1;
    int _1568 = abs(_1412);
    int _1570 = _1556 * _1552;
    float _1572 = float(_847);
    float _1574 = trunc(_1522);
    int _1576 = int(_1574);
    float _1578 = float(_1152);
    int _1580 = _1476 * _1524;
    int _1582 = _1580 + _1570;
    int _1584 = abs(_1528);
    int _1586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1588 = _1586 != 0;
    int _1590 = _1582 * _1568;
    int _1592 = abs(_1566);
    float _1594 = _1562;
    if (_1416)
    {
        float _1596 = _1562 * 6.283185482025146484375;
        float _1598 = sin(_1596);
        _1594 = _1598;
    }
    float _1600 = _1594;
    int _1602 = abs(_1450);
    bool _1604 = _1578 >= _1572;
    bool _1606 = isnan(_1578);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan(_1572);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    int _1616 = _1576 * _1602;
    int _1618 = _1616 + _1140;
    float _1620 = trunc(_1614);
    int _1622 = int(_1620);
    int _1624 = _1532 * _1584;
    int _1626 = _1624 + _1590;
    float _1628 = _1572 * _1098;
    int _1630 = abs(_1454);
    float _1632 = _1470 * _1572;
    int _1634 = _1618 * _1592;
    int _1636 = _1634 + _1626;
    int _1638 = ~_1352;
    int _1640 = _1638 + _1498;
    int _1642 = _1640 + 1;
    float _1644 = _1470;
    if (_1588)
    {
        float _1646 = in.m_76.x;
        _1644 = _1646;
    }
    float _1648 = _1644;
    bool _1650 = !_1508;
    int _1652 = _1650 ? 0 : 1;
    int _1654 = _1576 * _1630;
    int _1656 = _1654 + _1636;
    bool _1658 = !_1516;
    int _1660 = _1658 ? 0 : 1;
    int _1662 = _847 * _1642;
    int _1664 = _1662 + _1152;
    bool _1666 = _847 == 0;
    float _1668 = trunc(_1632);
    int _1670 = int(_1668);
    if (_1416)
    {
        bool _1672 = _1600 > 0.5;
        _1542 = _1672;
    }
    bool _1674 = _1542;
    float _1676 = float(uint(_1168));
    float _1678 = float(uint(_1656));
    int _1680 = ~_1622;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = as_type<float>(_849) * _1676;
    bool _1688 = !_1666;
    int _1690 = _1688 ? _1664 : (-1);
    float _1692 = trunc(_1628);
    int _1694 = int(_1692);
    int _1696 = abs(_1490);
    float _1698 = as_type<float>(_1172) * _1678;
    int _1700 = _847 + (-1);
    int _1702 = _1690 * _1684;
    int _1704 = abs(_1536);
    float _1706 = trunc(_1686);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    int _1712 = _1622 * _1700;
    int _1714 = _1712 + _1702;
    int _1716 = abs(_1652);
    float _1718 = _1648;
    float _1720 = _1686;
    float _1722 = as_type<float>(_1716);
    if (_1588)
    {
        float _1724 = _1648 * 3.1415927410125732421875;
        _1718 = _1724;
    }
    float _1726 = _1718;
    int _1728 = ~_819;
    int _1730 = _1728 + 1;
    int _1732 = _1670 * _1696;
    int _1734 = _1732 + _1152;
    int _1736 = ~_825;
    int _1738 = _1736 + 1;
    float _1740 = trunc(_1698);
    float _1742 = precise::max(_1740, 0.0);
    uint _1744 = uint(_1742);
    int _1746 = _1714 * _1704;
    float _1748 = as_type<float>(_1730);
    if (_1588)
    {
        float _1750 = _1726 * 0.15915493667125701904296875;
        _1748 = _1750;
    }
    float _1752 = _1748;
    int _1754 = _1694 * _1716;
    int _1756 = _1754 + _1746;
    float _1758 = float(uint(_1618));
    int _1760 = _1730 * int(_1710);
    int _1762 = _1760 + _1168;
    int _1764 = abs(_1660);
    float _1766 = _1752;
    if (_1588)
    {
        float _1768 = _1752 * 6.283185482025146484375;
        float _1770 = sin(_1768);
        _1766 = _1770;
    }
    float _1772 = _1766;
    bool _1774 = !_1520;
    int _1776 = _1774 ? 0 : 1;
    float _1778 = as_type<float>(_1172) * _1758;
    int _1780 = ~_1418;
    int _1782 = _1780 + _1502;
    int _1784 = _1782 + 1;
    float _1786 = float(uint(_1762));
    int _1788 = _1738 * int(_1744);
    int _1790 = _1788 + _1656;
    int _1792 = _819 * _1784;
    int _1794 = _1792 + _1252;
    int _1796 = abs(_1776);
    float _1798 = trunc(_1778);
    float _1800 = precise::max(_1798, 0.0);
    uint _1802 = uint(_1800);
    float _1804 = float(uint(_1790));
    float _1806 = as_type<float>(_849) * _1786;
    bool _1808 = _819 == 0;
    int _1810 = _1734 * _1764;
    int _1812 = _1810 + _1756;
    float _1814 = as_type<float>(_1172) * _1804;
    int _1816 = ~_825;
    int _1818 = _1816 + 1;
    bool _1820 = !_1808;
    int _1822 = _1820 ? _1794 : (-1);
    int _1824 = _1670 * _1796;
    int _1826 = _1824 + _1812;
    if (!_1416)
    {
        _1720 = _241;
    }
    float _1828 = _1720;
    float _1830 = trunc(_1814);
    float _1832 = precise::max(_1830, 0.0);
    uint _1834 = uint(_1832);
    float _1836 = _1828;
    if (_1416)
    {
        float _1838 = -_241;
        float _1840 = _1674 ? _1838 : _241;
        _1836 = _1840;
    }
    float _1842 = _1836;
    int _1844 = _1822 & 3;
    bool _1846 = _1844 != 0;
    int _1848 = _1822 & 3;
    bool _1850 = _1848 != 0;
    int _1852 = _1818 * int(_1802);
    int _1854 = _1852 + _1618;
    int _1856 = _1846 ? 0 : 1;
    float _1858 = trunc(_1806);
    float _1860 = precise::max(_1858, 0.0);
    uint _1862 = uint(_1860);
    bool _1864 = uint(_1848) > 1u;
    bool _1866 = _1848 != 3;
    float _1868 = float(uint(_1826));
    int _1870 = int(_1744) + int(_1834);
    int _1872 = ~_825;
    int _1874 = _1872 + 1;
    float _1876 = as_type<float>(_1198) * _1868;
    float _1878 = float(uint(_1854));
    int _1880 = ~_1856;
    int _1882 = _1880 + 1;
    int _1884 = _1882 + 1;
    int _1886 = _1874 * _1870;
    int _1888 = _1886 + _1656;
    int _1890 = _1884;
    bool _1892 = _1866;
    if (!_1864)
    {
        int _1894 = ~_1856;
        int _1896 = _1894 + 1;
        _1890 = _1896;
    }
    int _1898 = _1890;
    float _1900 = as_type<float>(_1172) * _1878;
    bool _1902 = uint(_1848) >= 2u;
    float _1904 = trunc(_1876);
    float _1906 = precise::max(_1904, 0.0);
    uint _1908 = uint(_1906);
    bool _1910 = _1016 > 0.5;
    int _1912 = _1902 ? 0 : 1;
    bool _1914 = uint(_1888) >= uint(_825);
    int _1916 = ~_1912;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    float _1922 = trunc(_1900);
    float _1924 = precise::max(_1922, 0.0);
    uint _1926 = uint(_1924);
    bool _1928 = !_1914;
    int _1930 = _1928 ? 0 : (-1);
    int _1932 = _1920;
    if (_1866)
    {
        int _1934 = ~_1912;
        int _1936 = _1934 + 1;
        _1932 = _1936;
    }
    int _1938 = _1932;
    int _1940 = ~_1870;
    int _1942 = _1940 + _1930;
    int _1944 = _1942 + 1;
    if (_1588)
    {
        bool _1946 = _1772 > 0.5;
        _1892 = _1946;
    }
    bool _1948 = _1892;
    int _1950 = _825 * _1944;
    int _1952 = _1950 + _1656;
    if (!_1588)
    {
        _1722 = _225;
    }
    float _1954 = _1722;
    float _1956 = -_225;
    int _1958 = _1910 ? as_type<int>(_1956) : as_type<int>(_225);
    bool _1960 = !_1538;
    int _1962 = _1960 ? _1952 : (-1);
    int _1964 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1966 = _1964 != 0;
    float _1968 = _1954;
    if (_1588)
    {
        float _1970 = -_225;
        float _1972 = _1948 ? _1970 : _225;
        _1968 = _1972;
    }
    float _1974 = _1968;
    int _1976 = _1962 & 3;
    bool _1978 = _1976 != 0;
    int _1980 = ~_847;
    int _1982 = _1980 + 1;
    bool _1984 = !_1966;
    float _1986 = _1984 ? _225 : as_type<float>(_1958);
    bool _1988 = uint(_1976) > 1u;
    int _1990 = _1982 * int(_1908);
    int _1992 = _1990 + _1826;
    int _1994 = _1962 & 3;
    bool _1996 = _1994 != 0;
    int _1998 = int(_1710) + int(_1862);
    float _2000 = float(uint(_1992));
    int _2002 = _1996 ? 0 : 1;
    int _2004 = ~_819;
    int _2006 = _2004 + 1;
    float _2008 = as_type<float>(_1198) * _2000;
    int _2010 = ~_2002;
    int _2012 = _2010 + 1;
    int _2014 = _2012 + 1;
    int _2016 = _2014;
    if (!_1988)
    {
        int _2018 = ~_2002;
        int _2020 = _2018 + 1;
        _2016 = _2020;
    }
    int _2022 = _2016;
    int _2024 = _2006 * _1998;
    int _2026 = _2024 + _1168;
    bool _2028 = uint(_1976) >= 2u;
    float _2030 = trunc(_2008);
    float _2032 = precise::max(_2030, 0.0);
    uint _2034 = uint(_2032);
    bool _2036 = !_1978;
    int _2038 = _2036 ? 0 : 1;
    int _2040 = _2028 ? 0 : 1;
    bool _2042 = uint(_2026) >= uint(_819);
    bool _2044 = _1976 != 3;
    bool _2046 = _1976 != 3;
    int _2048 = int(_1802) + int(_1926);
    float _2050 = in.m_56.x;
    float _2052 = in.m_56.y;
    float _2054 = in.m_56.z;
    int _2056 = ~_825;
    int _2058 = _2056 + 1;
    bool _2060 = !_2042;
    int _2062 = _2060 ? 0 : (-1);
    int _2064 = int(_1908) + int(_2034);
    int _2066 = _2058 * _2048;
    int _2068 = _2066 + _1618;
    int _2070 = ~_2040;
    int _2072 = _2070 + 1;
    int _2074 = _2072 + 1;
    int _2076 = _2074;
    if (_2044)
    {
        int _2078 = ~_2040;
        int _2080 = _2078 + 1;
        _2076 = _2080;
    }
    int _2082 = _2076;
    bool _2084 = uint(_2068) >= uint(_825);
    int _2086 = ~_847;
    int _2088 = _2086 + 1;
    int _2090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2092 = _2090 != 0;
    bool _2094 = !_2046;
    int _2096 = _2094 ? 0 : (-1);
    int _2098 = _2088 * _2064;
    int _2100 = _2098 + _1826;
    bool _2102 = !_2092;
    int _2104 = _2102 ? 0 : 1;
    bool _2106 = uint(_2100) >= uint(_847);
    float _2108 = _197 * _2052;
    bool _2110 = !_2084;
    int _2112 = _2110 ? 0 : (-1);
    float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2116 = _2114 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2120 = _2118 != 0;
    float _2122 = fma(_195, _2050, _2108);
    int _2124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2126 = _2124 != 0;
    float _2128 = _209 * _2052;
    bool _2130 = !_2106;
    int _2132 = _2130 ? 0 : (-1);
    float _2134 = _203 * _2052;
    float _2136 = 1.0 / _2116;
    bool _2138 = _1014 > 0.5;
    float _2140 = fma(_201, _2050, _2134);
    float _2142 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2144 = _2142 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2146 = -_241;
    int _2148 = _2138 ? as_type<int>(_2146) : as_type<int>(_241);
    int _2150 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2152 = _2150 != 0;
    float _2154 = fma(_207, _2050, _2128);
    float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2158 = _2156 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2160 = 1.0 / _2144;
    float _2162 = fma(_199, _2054, _2122);
    float _2164 = fma(_205, _2054, _2140);
    float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2166;
    float _2170 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2172 = _2170 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2174 = 1.0 / _2158;
    float _2176 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2178 = _2176 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2180 = _2168 * _1346;
    float _2182 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2184 = _2182 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2186 = _2172 * _2136;
    float _2188 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2188;
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2196 = 1.0 / _2178;
    bool _2198 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2200 = isnan(_811);
    bool _2202 = _2198 || _2200;
    bool _2204 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2206 = _2202 || _2204;
    float _2208 = float(_2206);
    float _2210 = fma(_211, _2054, _2154);
    float _2212 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2214 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2212;
    float _2216 = _2194 * _2160;
    bool _2218 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2220 = isnan(_811);
    bool _2222 = _2218 || _2220;
    bool _2224 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2226 = _2222 || _2224;
    float _2228 = float(_2226);
    float _2230 = -_2208;
    float _2232 = _2230 + 1.0;
    float _2234 = 1.0 / _2184;
    float _2236 = _2214 * _2174;
    bool _2238 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2240 = isnan(_811);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2246 = _2242 || _2244;
    float _2248 = float(_2246);
    float _2250 = _2228 * _2232;
    float _2252 = -_2228;
    float _2254 = _2252 + 1.0;
    float _2256 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2256;
    bool _2260 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2262 = isnan(_811);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2268 = _2264 || _2266;
    float _2270 = float(_2268);
    float _2272 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2274 = _2272 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2276 = -_2248;
    float _2278 = _2276 + 1.0;
    float _2280 = _2248 * _2254;
    float _2282 = _2258 * _1446;
    float _2284 = _2274 * _2196;
    bool _2286 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2288 = isnan(_811);
    bool _2290 = _2286 || _2288;
    bool _2292 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2294 = _2290 || _2292;
    float _2296 = float(_2294);
    float _2298 = _2270 * _2278;
    float _2300 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2302 = _811 + _2300;
    float _2304 = -_2270;
    float _2306 = _2304 + 1.0;
    bool _2308 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2310 = isnan(_811);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2316 = _2312 || _2314;
    float _2318 = float(_2316);
    float _2320 = in.m_72.w;
    float _2322 = _2190 * _2234;
    float _2324 = fma(_2180, _2302, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2326 = _2296 * _2306;
    float _2328 = -_2296;
    float _2330 = _2328 + 1.0;
    float _2332 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2334 = _811 + _2332;
    float _2336 = -_2318;
    float _2338 = _2336 + 1.0;
    bool _2340 = !_2152;
    float _2342 = _2340 ? _241 : as_type<float>(_2148);
    float _2344 = _2318 * _2330;
    float _2346 = fma(_2186, _2334, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2348 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2350 = isnan(_811);
    bool _2352 = _2348 || _2350;
    bool _2354 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2356 = _2352 || _2354;
    float _2358 = float(_2356);
    float _2360 = _1316 * _2338;
    float _2362 = in.m_74.w;
    float _2364 = -_1316;
    float _2366 = _2364 + 1.0;
    bool _2368 = _1024 != 1;
    float _2370 = -_2358;
    float _2372 = _2370 + 1.0;
    float _2374 = fma(_2322, _1044, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2376 = _2358 * _2366;
    float _2378 = _2162 + _1050;
    float _2380 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2382 = _811 + _2380;
    float _2384 = _2324 * _2376;
    float _2386 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2388 = _811 + _2386;
    float _2390 = fma(_2236, _2382, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2392 = _2164 + _2320;
    float _2394 = fma(_2372, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2384);
    float _2396 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2398 = _811 + _2396;
    float _2400 = _2360;
    float _2402 = _2346;
    float _2404 = _2394;
    if (!_2368)
    {
        _1458 = _1016;
    }
    float _2406 = _1458;
    float _2408 = fma(_2346, _2360, _2394);
    float _2410 = _2406;
    if (!_2368)
    {
        _2400 = _1016;
    }
    float _2412 = _2400;
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2416 = _2412;
    if (!_2368)
    {
        _2402 = _1034;
    }
    float _2418 = _2402;
    float _2420 = fma(_2282, _2398, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2422 = _2418;
    if (!_2368)
    {
        _2404 = _1034;
    }
    float _2424 = _2404;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2428 = _2424;
    if (_2368)
    {
        _2416 = _1014;
    }
    float _2430 = _2416;
    float _2432 = _2210 + _2362;
    if (_2368)
    {
        _2410 = _1014;
    }
    float _2434 = _2410;
    float _2436 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_2368)
    {
        _2422 = _1016;
    }
    float _2438 = _2422;
    float _2440 = fma(_2216, _1060, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2442 = _2440;
    if (_2368)
    {
        _2428 = _1016;
    }
    float _2444 = _2428;
    float _2446 = -_2414;
    float _2448 = fma(_2436, 2.0, _2446);
    bool _2450 = _1026 != 2;
    float _2452 = fma(_2374, _2344, _2408);
    float _2454 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2456 = fma(_2440, _2326, _2452);
    float _2458 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2460 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2462 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2464 = _2392 + _2462;
    float _2466 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2458);
    float _2468 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2470 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2426);
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2474 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2476 = -_2460;
    float _2478 = fma(_2468, 2.0, _2476);
    float _2480 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2482 = fma(_2454, -2.0, _2472);
    float _2484 = fma(_2390, _2298, _2456);
    float _2486 = fma(_2480, -2.0, _2474);
    float _2488 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2490 = _2378 + _2488;
    float _2492 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2494 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2496 = _1974 + (-0.5);
    float _2498 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2486);
    float _2500 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2502 = _2432 + _2500;
    float _2504 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2492);
    float _2506 = fma(_2444, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2494);
    int _2508 = _1962 >> 31;
    float _2510 = -_2496;
    float _2512 = -_2498;
    float _2514 = fma(_2510, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2512);
    float _2516 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2504);
    float _2518 = -_135;
    float _2520 = fma(_2518, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2448);
    float _2522 = _2342 + 0.5;
    int _2524 = _2508 & 3;
    float _2526 = fma(_2284, _2388, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2528 = 0.0;
    if (_2450)
    {
        _2528 = _1016;
    }
    float _2530 = _2528;
    float _2532 = fma(_2522, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2520);
    float _2534 = _2530;
    if (_2450)
    {
        _2442 = _1014;
    }
    float _2536 = _2442;
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2540 = _2536;
    if (!_2450)
    {
        _2540 = _1034;
    }
    float _2542 = _2540;
    float _2544 = -_135;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2478);
    if (!_2450)
    {
        _2534 = _1014;
    }
    float _2548 = _2534;
    float _2550 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2538);
    bool _2552 = _2516 >= 0.0;
    float _2554 = _1842 + 0.5;
    int _2556 = _1962 + _2524;
    float _2558 = fma(_2526, _2280, _2484);
    float _2560 = float(uint(_1734));
    float _2562 = fma(_2554, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2546);
    int _2564 = _2556 >> 2;
    float _2566 = _1986 + (-0.5);
    float _2568 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2482);
    int _2570 = _2564 << 4;
    int _2572 = _2570 + 656;
    float _2574 = as_type<float>(_1198) * _2560;
    float _2576 = -_2566;
    float _2578 = -_2568;
    float _2580 = fma(_2576, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2578);
    float _2582 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2584 = trunc(_2574);
    float _2586 = precise::max(_2584, 0.0);
    uint _2588 = uint(_2586);
    uint _2590 = uint(int(uint(_2572) >> uint(2)));
    uint _2592 = uint(int(uint(int(_2590)) >> uint(2)));
    int _2594 = int(_2590) & 3;
    float _2596 = (*spvDescriptorSet0.vp_c9)._m0[int(_2592)][_2594];
    int _2598 = int(_2590) + 1;
    uint _2600 = uint(int(uint(_2598) >> uint(2)));
    int _2602 = _2598 & 3;
    float _2604 = (*spvDescriptorSet0.vp_c9)._m0[int(_2600)][_2602];
    float _2606 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2608 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2610 = ~_847;
    int _2612 = _2610 + 1;
    float _2614 = _2430 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2616 = -_2608;
    float _2618 = fma(_2606, 2.0, _2616);
    float _2620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2622 = _2572 + 8;
    uint _2624 = uint(int(uint(_2622) >> uint(2)));
    uint _2626 = uint(int(uint(int(_2624)) >> uint(2)));
    int _2628 = int(_2624) & 3;
    float _2630 = (*spvDescriptorSet0.vp_c9)._m0[int(_2626)][_2628];
    int _2632 = int(_2624) + 1;
    uint _2634 = uint(int(uint(_2632) >> uint(2)));
    int _2636 = _2632 & 3;
    float _2638 = (*spvDescriptorSet0.vp_c9)._m0[int(_2634)][_2636];
    float _2640 = -_1332;
    float _2642 = fma(_2614, 2.0, _2640);
    float _2644 = _2438 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2646 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2648 = _2574;
    if (_2552)
    {
        _2648 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2650 = _2648;
    float _2652 = _2548 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2654 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2466);
    int _2656 = _2612 * int(_2588);
    int _2658 = _2656 + _1734;
    float _2660 = fma(_2644, -2.0, _2582);
    float _2662 = fma(_2652, -2.0, _2646);
    int _2664 = as_type<int>(_2650);
    if (_2552)
    {
        float _2666 = _2650 * 5.0;
        _2664 = as_type<int>(_2666);
    }
    int _2668 = _2664;
    float _2670 = float(uint(_2658));
    float _2672 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2470);
    int _2674 = abs(_2022);
    float _2676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2552)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9401 = as_type<float>(_2668);
        out.gl_Position.z = _9401;
    }
    float _2678 = as_type<float>(_1198) * _2670;
    float _2680 = -_2654;
    float _2682 = _2680 + 1.0;
    float _2684 = -_2672;
    float _2686 = _2684 + 1.0;
    int _2688 = abs(_2082);
    float _2690 = fma(_2420, _2250, _2558);
    float _2692 = -_2682;
    float _2694 = fma(_2692, _1842, _2562);
    float _2696 = _2620 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2698 = fma(_2686, _1974, _2514);
    int _2700 = ~_2064;
    int _2702 = _2700 + _2132;
    int _2704 = _2702 + 1;
    float _2706 = trunc(_2678);
    float _2708 = precise::max(_2706, 0.0);
    uint _2710 = uint(_2708);
    int _2712 = ~_2048;
    int _2714 = _2712 + _2112;
    int _2716 = _2714 + 1;
    float _2718 = _1486 + (-0.5);
    float _2720 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2660);
    out.m_84.x = _2694;
    out.m_84.y = _2698;
    int _2722 = abs(_2104);
    float _2724 = _2676 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2726 = -_2696;
    float _2728 = -_2720;
    float _2730 = fma(_2726, _2718, _2728);
    float _2732 = _1386 + 0.5;
    int _2734 = abs(_2038);
    float _2736 = -_135;
    float _2738 = fma(_2736, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2642);
    int _2740 = ~_2674;
    int _2742 = _2740 + 1;
    int _2744 = _2742 + 1;
    float _2746 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2690);
    int _2748 = abs(_2096);
    int _2750 = _847 * _2704;
    int _2752 = _2750 + _1826;
    int _2754 = int(_2588) + int(_2710);
    int _2756 = _2744 * as_type<int>(_2604);
    int _2758 = ~_2734;
    int _2760 = _2758 + 1;
    int _2762 = _2760 + 1;
    float _2764 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2766 = int(_2764);
    float _2768 = fma(_2724, _2732, _2738);
    bool _2770 = !_1666;
    int _2772 = _2770 ? _2752 : (-1);
    int _2774 = _2762 * as_type<int>(_2596);
    int _2776 = _2774 + _2756;
    int _2778 = ~_2688;
    int _2780 = _2778 + 1;
    int _2782 = _2780 + 1;
    out.m_86.x = _2746;
    int _2784 = ~_2748;
    int _2786 = _2784 + 1;
    int _2788 = _2786 + 1;
    float _2790 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2662);
    int _2792 = _1822 >> 31;
    int _2794 = _2782 * as_type<int>(_2630);
    int _2796 = _2794 + _2776;
    int _2798 = ~_2722;
    int _2800 = _2798 + 1;
    int _2802 = _2800 + 1;
    float _2804 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2506);
    int _2806 = _2792 & 3;
    int _2808 = _2788 * as_type<int>(_2638);
    int _2810 = _2808 + _2796;
    int _2812 = _2772 >> 31;
    int _2814 = _825 * _2716;
    int _2816 = _2814 + _1618;
    int _2818 = _1822 + _2806;
    int _2820 = _2810 * _2802;
    int _2822 = _2812 & 3;
    float _2824 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2550);
    bool _2826 = !_1538;
    int _2828 = _2826 ? _2816 : (-1);
    float _2830 = -_2804;
    float _2832 = _2830 + 1.0;
    float _2834 = float(uint(_2766));
    float _2836 = -_2824;
    float _2838 = _2836 + 1.0;
    bool _2840 = !_2120;
    int _2842 = _2840 ? 0 : 1;
    int _2844 = _2828 * _2722;
    int _2846 = _2844 + _2820;
    int _2848 = _2772 & 3;
    bool _2850 = _2848 != 0;
    float _2852 = 1.0 / _2834;
    int _2854 = _2772 + _2822;
    float _2856 = -_2838;
    float _2858 = fma(_1386, _2856, _2768);
    int _2860 = _2818 >> 2;
    float _2862 = _2858;
    if (_2552)
    {
        out.m_63.x = 0.0;
    }
    int _2864 = _2772 & 3;
    bool _2866 = _2864 != 0;
    int _2868 = abs(_2766);
    int _2870 = _2850 ? 0 : 1;
    int _2872 = _2860 << 4;
    int _2874 = _2872 + 368;
    bool _2876 = uint(_2864) > 1u;
    int _2878 = _2854 >> 2;
    float _2880 = float(uint(_2868));
    uint _2882 = uint(int(uint(_2874) >> uint(2)));
    uint _2884 = uint(int(uint(int(_2882)) >> uint(2)));
    int _2886 = int(_2882) & 3;
    float _2888 = (*spvDescriptorSet0.vp_c9)._m0[int(_2884)][_2886];
    int _2890 = int(_2882) + 1;
    uint _2892 = uint(int(uint(_2890) >> uint(2)));
    int _2894 = _2890 & 3;
    float _2896 = (*spvDescriptorSet0.vp_c9)._m0[int(_2892)][_2894];
    int _2898 = _2878 << 4;
    int _2900 = _2898 + 800;
    int _2902 = ~_2870;
    int _2904 = _2902 + 1;
    int _2906 = _2904 + 1;
    float _2908 = 1.0 / _2880;
    int _2910 = ~_847;
    int _2912 = _2910 + 1;
    uint _2914 = uint(int(uint(_2900) >> uint(2)));
    uint _2916 = uint(int(uint(int(_2914)) >> uint(2)));
    int _2918 = int(_2914) & 3;
    float _2920 = (*spvDescriptorSet0.vp_c9)._m0[int(_2916)][_2918];
    int _2922 = int(_2914) + 1;
    uint _2924 = uint(int(uint(_2922) >> uint(2)));
    int _2926 = _2922 & 3;
    float _2928 = (*spvDescriptorSet0.vp_c9)._m0[int(_2924)][_2926];
    int _2930 = _2906;
    if (!_2876)
    {
        int _2932 = ~_2870;
        int _2934 = _2932 + 1;
        _2930 = _2934;
    }
    int _2936 = _2930;
    bool _2938 = _2864 != 3;
    int _2940 = _2912 * _2754;
    int _2942 = _2940 + _1734;
    int _2944 = as_type<int>(_2852) + (-2);
    float _2946 = float(uint(_2846));
    bool _2948 = !_2866;
    int _2950 = _2948 ? 0 : 1;
    bool _2952 = uint(_2864) >= 2u;
    float _2954 = as_type<float>(_2944) * _2946;
    bool _2956 = !_1850;
    int _2958 = _2956 ? 0 : 1;
    int _2960 = _2952 ? 0 : 1;
    int _2962 = abs(_2846);
    float _2964 = trunc(_2954);
    float _2966 = precise::max(_2964, 0.0);
    uint _2968 = uint(_2966);
    bool _2970 = uint(_2942) >= uint(_847);
    int _2972 = as_type<int>(_2908) + (-2);
    int _2974 = _2874 + 8;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    uint _2978 = uint(int(uint(int(_2976)) >> uint(2)));
    int _2980 = int(_2976) & 3;
    float _2982 = (*spvDescriptorSet0.vp_c9)._m0[int(_2978)][_2980];
    int _2984 = int(_2976) + 1;
    uint _2986 = uint(int(uint(_2984) >> uint(2)));
    int _2988 = _2984 & 3;
    float _2990 = (*spvDescriptorSet0.vp_c9)._m0[int(_2986)][_2988];
    int _2992 = ~_2960;
    int _2994 = _2992 + 1;
    int _2996 = _2994 + 1;
    int _2998 = _2996;
    if (_2938)
    {
        int _3000 = ~_2960;
        int _3002 = _3000 + 1;
        _2998 = _3002;
    }
    int _3004 = _2998;
    float _3006 = float(uint(_2962));
    bool _3008 = _2864 != 3;
    int _3010 = _2900 + 8;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    uint _3014 = uint(int(uint(int(_3012)) >> uint(2)));
    int _3016 = int(_3012) & 3;
    float _3018 = (*spvDescriptorSet0.vp_c9)._m0[int(_3014)][_3016];
    int _3020 = int(_3012) + 1;
    uint _3022 = uint(int(uint(_3020) >> uint(2)));
    int _3024 = _3020 & 3;
    float _3026 = (*spvDescriptorSet0.vp_c9)._m0[int(_3022)][_3024];
    float _3028 = as_type<float>(_2972) * _3006;
    bool _3030 = _1848 != 3;
    int _3032 = ~_2766;
    int _3034 = _3032 + 1;
    float _3036 = trunc(_3028);
    float _3038 = precise::max(_3036, 0.0);
    uint _3040 = uint(_3038);
    bool _3042 = !_2970;
    int _3044 = _3042 ? 0 : (-1);
    bool _3046 = !_3030;
    int _3048 = _3046 ? 0 : (-1);
    int _3050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3052 = _3050 != 0;
    int _3054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3056 = _3054 != 0;
    int _3058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3060 = _3058 != 0;
    int _3062 = ~_1998;
    int _3064 = _3062 + _2062;
    int _3066 = _3064 + 1;
    int _3068 = _3034 * int(_2968);
    int _3070 = _3068 + _2846;
    int _3072 = abs(_1898);
    int _3074 = ~_2868;
    int _3076 = _3074 + 1;
    int _3078 = _819 * _3066;
    int _3080 = _3078 + _1168;
    int _3082 = ~_3072;
    int _3084 = _3082 + 1;
    int _3086 = _3084 + 1;
    float _3088 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3090 = abs(_2936);
    float _3092 = float(uint(_3070));
    int _3094 = _3086 * as_type<int>(_2896);
    int _3096 = ~_3090;
    int _3098 = _3096 + 1;
    int _3100 = _3098 + 1;
    float _3102 = as_type<float>(_2944) * _3092;
    int _3104 = ~_2754;
    int _3106 = _3104 + _3044;
    int _3108 = _3106 + 1;
    int _3110 = _3076 * int(_3040);
    int _3112 = _3110 + _2962;
    int _3114 = abs(_2950);
    int _3116 = _3100 * as_type<int>(_2928);
    int _3118 = abs(_2958);
    float _3120 = trunc(_3102);
    float _3122 = precise::max(_3120, 0.0);
    uint _3124 = uint(_3122);
    float _3126 = float(uint(_3112));
    int _3128 = _847 * _3108;
    int _3130 = _3128 + _1734;
    int _3132 = abs(_1938);
    int _3134 = ~_3118;
    int _3136 = _3134 + 1;
    int _3138 = _3136 + 1;
    float _3140 = as_type<float>(_2972) * _3126;
    int _3142 = ~_3114;
    int _3144 = _3142 + 1;
    int _3146 = _3144 + 1;
    int _3148 = abs(_3004);
    int _3150 = _3138 * as_type<int>(_2888);
    int _3152 = _3150 + _3094;
    float _3154 = trunc(_3140);
    float _3156 = precise::max(_3154, 0.0);
    uint _3158 = uint(_3156);
    int _3160 = ~_3132;
    int _3162 = _3160 + 1;
    int _3164 = _3162 + 1;
    int _3166 = _3146 * as_type<int>(_2920);
    int _3168 = _3166 + _3116;
    int _3170 = ~_3148;
    int _3172 = _3170 + 1;
    int _3174 = _3172 + 1;
    int _3176 = abs(_3048);
    int _3178 = _3164 * as_type<int>(_2982);
    int _3180 = _3178 + _3152;
    bool _3182 = !_3008;
    int _3184 = _3182 ? 0 : (-1);
    int _3186 = _3174 * as_type<int>(_3018);
    int _3188 = _3186 + _3168;
    int _3190 = ~_2766;
    int _3192 = _3190 + 1;
    int _3194 = int(_2968) + int(_3124);
    int _3196 = ~_3176;
    int _3198 = _3196 + 1;
    int _3200 = _3198 + 1;
    int _3202 = abs(_3184);
    int _3204 = _3192 * _3194;
    int _3206 = _3204 + _2846;
    int _3208 = abs(_2842);
    int _3210 = _3200 * as_type<int>(_2990);
    int _3212 = _3210 + _3180;
    bool _3214 = _819 == 0;
    int _3216 = ~_3202;
    int _3218 = _3216 + 1;
    int _3220 = _3218 + 1;
    int _3222 = int(_3040) + int(_3158);
    int _3224 = ~_2868;
    int _3226 = _3224 + 1;
    int _3228 = _3220 * as_type<int>(_3026);
    int _3230 = _3228 + _3188;
    bool _3232 = !_3214;
    int _3234 = _3232 ? _3080 : (-1);
    int _3236 = _3226 * _3222;
    int _3238 = _3236 + _2962;
    bool _3240 = uint(_3206) >= uint(_2766);
    int _3242 = ~_3208;
    int _3244 = _3242 + 1;
    int _3246 = _3244 + 1;
    float _3248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3250 = !_3240;
    int _3252 = _3250 ? 0 : (-1);
    bool _3254 = uint(_3238) >= uint(_2868);
    int _3256 = _3212 * _3246;
    int _3258 = ~_3194;
    int _3260 = _3258 + _3252;
    int _3262 = _3260 + 1;
    float _3264 = -_135;
    float _3266 = fma(_3264, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2618);
    bool _3268 = !_2126;
    int _3270 = _3268 ? 0 : 1;
    int _3272 = _3234 * _3208;
    int _3274 = _3272 + _3256;
    int _3276 = _2846 ^ _2766;
    bool _3278 = !_3254;
    int _3280 = _3278 ? 0 : (-1);
    int _3282 = abs(_3270);
    int _3284 = _2766 * _3262;
    int _3286 = _3284 + _2846;
    uint _3288 = uint(int(uint(_3276) >> uint(31)));
    float _3290 = _3248 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3292 = _2766 == 0;
    int _3294 = ~_3280;
    int _3296 = _3222 + _3294;
    int _3298 = _3296 + 1;
    int _3300 = ~int(_3288);
    int _3302 = _3300 + 1;
    bool _3304 = !_3292;
    int _3306 = _3304 ? _3286 : (-1);
    int _3308 = _3298 ^ _3302;
    float _3310 = float(_3306);
    int _3312 = ~_3282;
    int _3314 = _3312 + 1;
    int _3316 = _3314 + 1;
    bool _3318 = _2766 == 0;
    int _3320 = ~_3302;
    int _3322 = _3320 + _3308;
    int _3324 = _3322 + 1;
    float _3326 = fma(_3290, _3310, _3266);
    bool _3328 = !_1666;
    int _3330 = _3328 ? _3130 : (-1);
    int _3332 = _3230 * _3316;
    bool _3334 = !_3318;
    int _3336 = _3334 ? _3324 : (-1);
    float _3338 = _1148 + 0.5;
    int _3340 = _3330 * _3282;
    int _3342 = _3340 + _3332;
    float _3344 = float(_3336);
    float _3346 = _3088 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3348 = fma(_3290, _3338, _3326);
    float _3350 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3352 = -_2790;
    float _3354 = fma(_3346, _3344, _3352);
    float _3356 = _1144 + (-0.5);
    float _3358 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3360 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3350);
    float _3362 = -_3346;
    float _3364 = fma(_3362, _3356, _3354);
    float _3366 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3358);
    float _3368 = _2464 * _2464;
    float _3370 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3360);
    float _3372 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3374 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3366);
    float _3376 = -_3370;
    float _3378 = _3376 + 1.0;
    float _3380 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3372);
    float _3382 = -_3374;
    float _3384 = _3382 + 1.0;
    float _3386 = fma(_2490, _2490, _3368);
    float _3388 = -_3378;
    float _3390 = fma(_1148, _3388, _3348);
    float _3392 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3380);
    float _3394 = -_3384;
    float _3396 = fma(_2342, _3394, _2532);
    float _3398 = fma(_2502, _2502, _3386);
    float _3400 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3402 = -_3392;
    float _3404 = _3402 + 1.0;
    float _3406 = _617 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3408 = rsqrt(_3398);
    float _3410 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3400);
    float _3412 = fma(_1486, _2832, _2730);
    float _3414 = float(_3274);
    float _3416 = fma(_1986, _3404, _2580);
    float _3418 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3410);
    float _3420 = _3406 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3422 = float(_3342);
    out.m_88.x = _3414;
    float _3424 = -_3418;
    float _3426 = _3424 + 1.0;
    bool _3428 = !_3056;
    int _3430 = _3428 ? 0 : 1;
    out.m_90.x = _3396;
    out.m_90.y = _3416;
    out.m_90.z = _2858;
    out.m_90.w = _3412;
    float _3432 = fma(_1144, _3426, _3364);
    bool _3434 = !_3060;
    int _3436 = _3434 ? 0 : 1;
    float _3438 = _3420 * _3408;
    out.m_88.w = _3422;
    bool _3440 = !_3052;
    int _3442 = _3440 ? 0 : 1;
    float _3444 = _2490 * _3438;
    out.m_92.x = _3390;
    out.m_92.y = _3432;
    float _3446 = _2464 * _3438;
    if (_2552)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3448 = -_3446;
    float _3450 = _2392 + _3448;
    float _3452 = _2502 * _3438;
    float _3454 = -_3444;
    float _3456 = _2378 + _3454;
    float _3458 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3460 = _3450 + _3458;
    float _3462 = -_3452;
    float _3464 = _2432 + _3462;
    float _3466 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3468 = _3456 + _3466;
    float _3470 = _3460 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3472 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3474 = _3464 + _3472;
    float _3476 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3470);
    float _3478 = fma(_3474, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3476);
    bool _3480 = _3478 >= 0.0;
    float _3482 = _3468;
    float _3484 = _3464;
    if (_3480)
    {
        _2862 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3486 = _2862;
    int _3488 = as_type<int>(_3486);
    if (_3480)
    {
        out.m_63.x = 0.0;
    }
    if (_3480)
    {
        float _3490 = _3486 * 5.0;
        _3488 = as_type<int>(_3490);
    }
    int _3492 = _3488;
    if (_3480)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10580 = as_type<float>(_3492);
        out.gl_Position.z = _10580;
    }
    if (_3480)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3494 = fma(_3456, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3496 = fma(_3464, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3498 = floor(_3494);
    float _3500 = floor(_3496);
    float _3502 = -_3498;
    float _3504 = _3494 + _3502;
    float _3506 = -_3500;
    float _3508 = _3496 + _3506;
    float2 _10616 = float2(_3504, _3508);
    float _3510 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10616, float2(0.0), isnan(_10616)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10616, float2(0.0), isnan(_10616)), level(0.0)).x;
    float _3512 = _1034 * 2.0;
    float _3514 = _1014 * 2.0;
    float _3516 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3518 = log2(_3516);
    float _3520 = _1016 + _1014;
    float _3522 = _1016 * 2.0;
    int _3524 = abs(_3442);
    float _3526 = -_3446;
    float _3528 = _2464 + _3526;
    float _3530 = _3520 + (-1.0);
    float _3532 = -_3444;
    float _3534 = _2490 + _3532;
    float _3536 = -_3452;
    float _3538 = _2502 + _3536;
    float _3540 = floor(_3512);
    float _3542 = _3528 * _3528;
    int _3544 = abs(_3436);
    float _3546 = _615 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3548 = floor(_3514);
    float _3550 = _3518 * _135;
    bool _3552 = _3540 > 0.0;
    float _3554 = floor(_3522);
    bool _3556 = _3540 >= 0.0;
    bool _3558 = isnan(_3540);
    bool _3560 = _3556 || _3558;
    bool _3562 = isnan(0.0);
    bool _3564 = _3560 || _3562;
    float _3566 = fma(_3530, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3568 = _1016 + _1034;
    float _3570 = _1016 + (-0.5);
    int _3572 = _3564 ? 0 : 1;
    float _3574 = _3568 + (-1.0);
    bool _3576 = _3548 >= 0.0;
    bool _3578 = isnan(_3548);
    bool _3580 = _3576 || _3578;
    bool _3582 = isnan(0.0);
    bool _3584 = _3580 || _3582;
    float _3586 = exp2(_3550);
    int _3588 = ~_3572;
    int _3590 = _3588 + 1;
    int _3592 = _3590 + 1;
    float _3594 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _3596 = _3592;
    int _3598 = 2;
    if (!_3552)
    {
        int _3600 = ~_3572;
        int _3602 = _3600 + 1;
        _3596 = _3602;
    }
    int _3604 = _3596;
    float _3606 = _3450 + _3594;
    bool _3608 = _3548 > 0.0;
    bool _3610 = _3554 > 0.0;
    float _3612 = fma(_3574, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _3614 = _3554 >= 0.0;
    bool _3616 = isnan(_3554);
    bool _3618 = _3614 || _3616;
    bool _3620 = isnan(0.0);
    bool _3622 = _3618 || _3620;
    float _3624 = in.m_94.x;
    float _3626 = in.m_94.y;
    float _3628 = in.m_94.z;
    float _3630 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3632 = 1.0 + _3630;
    int _3634 = _3584 ? 0 : 1;
    float _3636 = float(_3604);
    float _3638 = 1.0 / _3632;
    float _3640 = float(_3524);
    float _3642 = -_3586;
    float _3644 = _3642 + 1.0;
    int _3646 = ~_3634;
    int _3648 = _3646 + 1;
    int _3650 = _3648 + 1;
    int _3652 = _3650;
    if (!_3608)
    {
        int _3654 = ~_3634;
        int _3656 = _3654 + 1;
        _3652 = _3656;
    }
    int _3658 = _3652;
    float _3660 = _3640 * _3636;
    bool _3662 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3664 = isnan(1.0);
    bool _3666 = _3662 || _3664;
    bool _3668 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3670 = _3666 || _3668;
    float _3672 = fma(_3534, _3534, _3542);
    int _3674 = abs(_3430);
    float _3676 = _3660 * (-2.0);
    float _3678 = float(_3658);
    float _3680 = fma(_3538, _3538, _3672);
    float _3682 = float(_3674);
    float _3684 = fma(_3566, _3676, _3566);
    bool _3686 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3688 = isnan(0.0);
    bool _3690 = _3686 || _3688;
    bool _3692 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3694 = _3690 || _3692;
    float _3696 = _3682 * _3678;
    float _3698 = _3694 ? _3644 : 0.0;
    float _3700 = _1014 + (-0.5);
    float _3702 = fma(_3676, _3624, _3624);
    float _3704 = _1014 + _1034;
    float _3706 = _1034 + (-0.5);
    if (_3670)
    {
        float _3708 = _3698 * _3638;
        _145 = _3708;
    }
    float _3710 = _145;
    float _3712 = fma(_3700, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3702);
    int _3714 = _3622 ? 0 : 1;
    float _3716 = _3696 * (-2.0);
    float _3718 = _3704 + (-1.0);
    float _3720 = fma(_3684, _3710, _3712);
    int _3722 = ~_3714;
    int _3724 = _3722 + 1;
    int _3726 = _3724 + 1;
    float _3728 = fma(_3612, _3716, _3612);
    float _3730 = fma(_3716, _3626, _3626);
    int _3732 = _3726;
    if (!_3610)
    {
        int _3734 = ~_3714;
        int _3736 = _3734 + 1;
        _3732 = _3736;
    }
    int _3738 = _3732;
    float _3740 = _3720 * 0.15915493667125701904296875;
    float _3742 = fma(_3570, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3730);
    float _3744 = float(_3738);
    float _3746 = _3740 * 6.283185482025146484375;
    float _3748 = sin(_3746);
    float _3750 = float(_3544);
    float _3752 = fma(_3728, _3710, _3742);
    float _3754 = _3750 * _3744;
    float _3756 = _3752 * 0.15915493667125701904296875;
    float _3758 = _3740 * 6.283185482025146484375;
    float _3760 = cos(_3758);
    float _3762 = _3754 * (-2.0);
    float _3764 = fma(_3718, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3766 = fma(_3762, _3628, _3628);
    float _3768 = fma(_3764, _3762, _3764);
    float _3770 = _3756 * 6.283185482025146484375;
    float _3772 = sin(_3770);
    float _3774 = fma(_3706, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3766);
    float _3776 = fma(_3768, _3710, _3774);
    float _3778 = _3450 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3780 = _3756 * 6.283185482025146484375;
    float _3782 = cos(_3780);
    float _3784 = _3776 * 0.15915493667125701904296875;
    float _3786 = fma(_3456, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3778);
    float _3788 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3786);
    float _3790 = sqrt(_3680);
    float _3792 = _3748 * _3772;
    float _3794 = _3788 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3796 = _3450 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3798 = _3760 * _3772;
    float _3800 = fma(_3456, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3796);
    float _3802 = 1.0 / _3794;
    float _3804 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3800);
    float _3806 = _3804 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3808 = _3784 * 6.283185482025146484375;
    float _3810 = sin(_3808);
    float _3812 = _3760 * _3782;
    float _3814 = _3408 * _3790;
    float _3816 = _3806 + _3794;
    float _3818 = _3814 * _3546;
    float _3820 = _3406 * _3814;
    float _3822 = _3784 * 6.283185482025146484375;
    float _3824 = cos(_3822);
    float _3826 = _3816 * _3802;
    float _3828 = _3826 * 0.5;
    float _3830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3832 = _3814 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3834 = _3832 * 0.5;
    float _3836 = _3830 * _3818;
    float _3838 = fma(_3810, _3812, _3792);
    float _3840 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3842 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3840);
    float _3844 = fma(_3810, _3792, _3812);
    float _3846 = _3748 * _3782;
    float _3848 = 1.0 / _3842;
    float _3850 = -_3798;
    float _3852 = fma(_3810, _3846, _3850);
    float _3854 = _3760 * _3824;
    float _3856 = _3782 * _3824;
    float _3858 = _3748 * _3824;
    float _3860 = _3772 * _3824;
    float _3862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _241);
    float _3864 = -_3846;
    float _3866 = fma(_3810, _3798, _3864);
    float _3868 = -_3836;
    float _3870 = _3810 * _3868;
    float _3872 = _3858 * _3836;
    float _3874 = _3862 * _3820;
    float _3876 = _3606 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3878 = _3854 * _3836;
    float _3880 = _3606 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3882 = fma(_3856, _3874, _3870);
    float _3884 = fma(_3456, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3876);
    float _3886 = fma(_3852, _3874, _3872);
    float _3888 = fma(_3838, _3874, _3878);
    float _3890 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3892 = _3848 * _3890;
    float _3894 = fma(_3464, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3884);
    float _3896 = fma(_3456, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3880);
    float _3898 = fma(_3866, _3834, _3888);
    float _3900 = fma(_3860, _3834, _3882);
    bool _3902 = _3892 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3904 = _3894 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _3906 = _3892 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3908 = _3898 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3910 = fma(_3844, _3834, _3886);
    float _3912 = fma(_3464, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3896);
    float _3914 = trunc(_3904);
    int _3916 = int(_3914);
    float _3918 = _3898 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3920 = fma(_3900, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3908);
    float _3922 = _3912 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _3924 = !_3902;
    int _3926 = _3924 ? 0 : 1;
    float _3928 = fma(_3900, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3918);
    float _3930 = fma(_3910, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3920);
    int _3932 = as_type<int>(_3898);
    int _3934 = as_type<int>(_3910);
    float _3936 = _3904;
    if (!_3902)
    {
        _3598 = 1;
    }
    int _3938 = _3598;
    float _3940 = trunc(_3922);
    int _3942 = int(_3940);
    int _3944 = _3938;
    if (!_3906)
    {
        _3944 = _3926;
    }
    int _3946 = _3944;
    float _3948 = fma(_3910, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3928);
    float _3950 = _3930 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _3952 = _3946 << 6;
    float _3954 = _3948 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3956 = _2432 + _3950;
    int _3958 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3960 = _3916 + _3958;
    int _3962 = _3960 + 1;
    int _3964 = _3952 + 56;
    uint _3966 = uint(int(uint(_3964) >> uint(2)));
    uint _3968 = uint(int(uint(int(_3966)) >> uint(2)));
    int _3970 = int(_3966) & 3;
    float _3972 = (*spvDescriptorSet0.vp_c15)._m0[int(_3968)][_3970];
    int _3974 = int(_3966) + 1;
    uint _3976 = uint(int(uint(_3974) >> uint(2)));
    int _3978 = _3974 & 3;
    float _3980 = (*spvDescriptorSet0.vp_c15)._m0[int(_3976)][_3978];
    float _3982 = _2378 + _3954;
    float _3984 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3986 = _3956 + _3984;
    bool _3988 = _3962 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _3990 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3992 = _3982 + _3990;
    float _3994 = _3986 * _3986;
    int _3996 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3998 = _3942 + _3996;
    int _4000 = _3998 + 1;
    int _4002 = _3952 + 48;
    uint _4004 = uint(int(uint(_4002) >> uint(2)));
    uint _4006 = uint(int(uint(int(_4004)) >> uint(2)));
    int _4008 = int(_4004) & 3;
    float _4010 = (*spvDescriptorSet0.vp_c15)._m0[int(_4006)][_4008];
    int _4012 = int(_4004) + 1;
    uint _4014 = uint(int(uint(_4012) >> uint(2)));
    int _4016 = _4012 & 3;
    float _4018 = (*spvDescriptorSet0.vp_c15)._m0[int(_4014)][_4016];
    float _4020 = fma(_3992, _3992, _3994);
    int _4022 = _3962 | _4000;
    float _4024 = sqrt(_4020);
    bool _4026 = _4022 < 0;
    bool _4028 = _4026 || _3988;
    int _4030 = _3952 + 64;
    uint _4032 = uint(int(uint(_4030) >> uint(2)));
    uint _4034 = uint(int(uint(int(_4032)) >> uint(2)));
    int _4036 = int(_4032) & 3;
    float _4038 = (*spvDescriptorSet0.vp_c15)._m0[int(_4034)][_4036];
    int _4040 = int(_4032) + 1;
    uint _4042 = uint(int(uint(_4040) >> uint(2)));
    int _4044 = _4040 & 3;
    float _4046 = (*spvDescriptorSet0.vp_c15)._m0[int(_4042)][_4044];
    float _4048 = _3898 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _4050 = _4000 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4052 = _4050 || _4028;
    float _4054 = fma(_3900, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4048);
    int _4056 = _3952 + 72;
    uint _4058 = uint(int(uint(_4056) >> uint(2)));
    uint _4060 = uint(int(uint(int(_4058)) >> uint(2)));
    int _4062 = int(_4058) & 3;
    float _4064 = (*spvDescriptorSet0.vp_c15)._m0[int(_4060)][_4062];
    int _4066 = int(_4058) + 1;
    uint _4068 = uint(int(uint(_4066) >> uint(2)));
    int _4070 = _4066 & 3;
    float _4072 = (*spvDescriptorSet0.vp_c15)._m0[int(_4068)][_4070];
    float _4074 = fma(_3910, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4054);
    float _4076 = _4074 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _4078 = _4024 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _4080 = _3952 + 96;
    uint _4082 = uint(int(uint(_4080) >> uint(2)));
    uint _4084 = uint(int(uint(int(_4082)) >> uint(2)));
    int _4086 = int(_4082) & 3;
    float _4088 = (*spvDescriptorSet0.vp_c15)._m0[int(_4084)][_4086];
    int _4090 = int(_4082) + 1;
    uint _4092 = uint(int(uint(_4090) >> uint(2)));
    int _4094 = _4090 & 3;
    float _4096 = (*spvDescriptorSet0.vp_c15)._m0[int(_4092)][_4094];
    int _4098 = _3962;
    int _4100 = as_type<int>(_4074);
    float _4102 = _3994;
    float _4104 = _3982;
    float _4106 = _3956;
    if (!_4052)
    {
        int _4108 = _4000 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4110 = _4108 + _3962;
        _3932 = _4110;
    }
    int _4112 = _3932;
    float _4114 = _2392 + _4076;
    if (!_4052)
    {
        int _4116 = _4112 << 2;
        _3934 = _4116;
    }
    int _4118 = _3934;
    int _4120 = _3952 + 104;
    uint _4122 = uint(int(uint(_4120) >> uint(2)));
    uint _4124 = uint(int(uint(int(_4122)) >> uint(2)));
    int _4126 = int(_4122) & 3;
    float _4128 = (*spvDescriptorSet0.vp_c15)._m0[int(_4124)][_4126];
    int _4130 = int(_4122) + 1;
    uint _4132 = uint(int(uint(_4130) >> uint(2)));
    int _4134 = _4130 & 3;
    float _4136 = (*spvDescriptorSet0.vp_c15)._m0[int(_4132)][_4134];
    float _4138 = as_type<float>(_4118);
    if (!_4052)
    {
        uint _4140 = uint(int(uint(_4112) >> uint(2)));
        _4098 = int(_4140);
    }
    int _4142 = _4098;
    float _4144 = as_type<float>(_4142);
    if (!_4052)
    {
        int _4146 = 12 & _4118;
        _4100 = _4146;
    }
    int _4148 = _4100;
    if (!_4078)
    {
        _4102 = _3982;
    }
    float _4150 = _4102;
    float _4152 = _4150;
    if (!_4052)
    {
        int _4154 = _4142 << 4;
        int _4156 = _4154 + _4148;
        _4144 = as_type<float>(_4156);
    }
    float _4158 = _4144;
    if (!_4078)
    {
        _4104 = _4114;
    }
    float _4160 = _4104;
    bool _4162 = !_4078;
    float _4164 = _4160;
    if (!_4162)
    {
        float _4166 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4168 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4170 = _4024 + _4168;
        float _4172 = _4114 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4174 = rsqrt(_4020);
        float _4176 = _4170 * _4166;
        float _4178 = _4176 * 0.15915493667125701904296875;
        float _4180 = _4178 * 6.283185482025146484375;
        float _4182 = cos(_4180);
        float _4184 = _4178 * 6.283185482025146484375;
        float _4186 = sin(_4184);
        float _4188 = _4182 + (-1.0);
        float _4190 = fma(_4186, _4172, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4192 = _4188 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4194 = _4174 * _4190;
        float _4196 = fma(_4114, _4182, _4192);
        float _4198 = fma(_3992, _4194, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4200 = fma(_3986, _4194, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4164 = _4196;
        _4152 = _4198;
        _4106 = _4200;
        _4138 = _4188;
    }
    float _4202 = _4164;
    float _4204 = _4152;
    float _4206 = _4106;
    float _4208 = _4138;
    float _4210 = -_2392;
    float _4212 = _4210 + _4202;
    int _4214 = _3952 + 80;
    uint _4216 = uint(int(uint(_4214) >> uint(2)));
    uint _4218 = uint(int(uint(int(_4216)) >> uint(2)));
    int _4220 = int(_4216) & 3;
    float _4222 = (*spvDescriptorSet0.vp_c15)._m0[int(_4218)][_4220];
    int _4224 = int(_4216) + 1;
    uint _4226 = uint(int(uint(_4224) >> uint(2)));
    int _4228 = _4224 & 3;
    float _4230 = (*spvDescriptorSet0.vp_c15)._m0[int(_4226)][_4228];
    float _4232 = -_2378;
    float _4234 = _4232 + _4204;
    float _4236 = -_2432;
    float _4238 = _4236 + _4206;
    float _4240 = _4212 * _4212;
    float _4242 = _3606 * _4096;
    float _4244 = _4208;
    float _4246 = _4240;
    float _4248 = _4204;
    float _4250 = _4202;
    float _4252 = _4206;
    if (!_4052)
    {
        float _4254 = floor(_3904);
        _4244 = _4254;
    }
    float _4256 = _4244;
    float _4258 = _3606 * _4046;
    float _4260 = fma(_4234, _4234, _4240);
    int _4262 = _3952 + 88;
    uint _4264 = uint(int(uint(_4262) >> uint(2)));
    uint _4266 = uint(int(uint(int(_4264)) >> uint(2)));
    int _4268 = int(_4264) & 3;
    float _4270 = (*spvDescriptorSet0.vp_c15)._m0[int(_4266)][_4268];
    int _4272 = int(_4264) + 1;
    uint _4274 = uint(int(uint(_4272) >> uint(2)));
    int _4276 = _4272 & 3;
    float _4278 = (*spvDescriptorSet0.vp_c15)._m0[int(_4274)][_4276];
    float _4280 = fma(_3456, _4088, _4242);
    float _4282 = fma(_3456, _4038, _4258);
    float _4284 = fma(_4238, _4238, _4260);
    float _4286 = fma(_3464, _4128, _4280);
    if (!_4052)
    {
        float _4288 = floor(_3922);
        _4246 = _4288;
    }
    float _4290 = _4246;
    bool _4292 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _4294 = isnan(0.5);
    bool _4296 = _4292 || _4294;
    bool _4298 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4300 = _4296 || _4298;
    float _4302 = _4158;
    float _4304 = _4290;
    if (!_4052)
    {
        int _4306 = as_type<int>(_4158) + 400;
        uint _4308 = uint(int(uint(_4306) >> uint(2)));
        uint _4310 = uint(int(uint(int(_4308)) >> uint(2)));
        int _4312 = int(_4308) & 3;
        float _4314 = (*spvDescriptorSet0.vp_c15)._m0[int(_4310)][_4312];
        _4302 = _4314;
    }
    float _4316 = _4302;
    float _4318 = _4286 + _4136;
    float _4320 = _3606 * _4018;
    float _4322 = fma(_3464, _4064, _4282);
    float _4324 = sqrt(_4284);
    float _4326 = fma(_3456, _4010, _4320);
    float _4328 = fma(_3464, _3972, _4326);
    float _4330 = 1.0 / _4318;
    bool _4332 = _4324 > 0.0;
    bool _4334 = !_4332;
    if (!_4334)
    {
        float _4336 = _245 * _245;
        float _4338 = rsqrt(_4284);
        float _4340 = fma(_237, _237, _4336);
        float _4342 = fma(_247, _247, _4340);
        float _4344 = sqrt(_4342);
        float _4346 = _4234 * _4338;
        float _4348 = _4212 * _4338;
        float _4350 = _4238 * _4338;
        bool _4352 = _4344 > 0.0;
        bool _4354 = !_4352;
        if (!_4354)
        {
            float _4356 = rsqrt(_4342);
            float _4358 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4360 = _245 * _4356;
            float _4362 = _237 * _4356;
            float _4364 = _247 * _4356;
            float _4366 = _4348 * _4360;
            float _4368 = fma(_4346, _4362, _4366);
            float _4370 = _4358 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4372 = fma(_4350, _4364, _4368);
            float _4374 = _4372 * _4370;
            float _4376 = fma(_237, _4374, _4204);
            float _4378 = fma(_245, _4374, _4202);
            float _4380 = fma(_247, _4374, _4206);
            _4248 = _4376;
            _4250 = _4378;
            _4252 = _4380;
        }
    }
    float _4382 = _4248;
    float _4384 = _4250;
    float _4386 = _4252;
    float _4388 = -_3444;
    float _4390 = _4388 + _4382;
    float _4392 = -_3446;
    float _4394 = _4392 + _4384;
    float _4396 = -_3452;
    float _4398 = _4396 + _4386;
    float _4400 = _4328 + _3980;
    float _4402 = _4322 + _4072;
    float _4404 = _4394;
    float _4406 = _4390;
    float _4408 = _4398;
    float _4410 = _4402;
    if (!_4300)
    {
        float _4412 = _3460 * _3460;
        float _4414 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4416 = -_2432;
        float _4418 = _4416 + _4386;
        float _4420 = -_2392;
        float _4422 = _4420 + _4384;
        float _4424 = fma(_3468, _3468, _4412);
        float _4426 = -_2378;
        float _4428 = _4426 + _4382;
        float _4430 = fma(_3474, _3474, _4424);
        float _4432 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4434 = sqrt(_4430);
        float _4436 = 1.0 / _3814;
        float _4438 = precise::min(_4434, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4440 = _4438 * _4414;
        float _4442 = _4432 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4444 = _4440 * _4436;
        float _4446 = _4442 * _4444;
        float _4448 = _4418 * _4444;
        float _4450 = fma(_4422, _4446, _3450);
        float _4452 = fma(_4428, _4446, _3456);
        float _4454 = fma(_4442, _4448, _3464);
        _4404 = _4450;
        _4406 = _4452;
        _4408 = _4454;
    }
    float _4456 = _4404;
    float _4458 = _4406;
    float _4460 = _4408;
    float _4462 = _4456 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4464 = _4400 * _4330;
    float _4466 = _4456 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4468 = _4456 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4470 = fma(_4458, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4462);
    float _4472 = _4402 * _4330;
    float _4474 = fma(_4458, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4466);
    bool _4476 = _4464 >= 0.0;
    float _4478 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4470);
    float _4480 = fma(_4458, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4468);
    float _4482 = _4456 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4484 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4474);
    float _4486 = _4478 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _4488 = _4464 <= 1.0;
    bool _4490 = _4488 && _4476;
    float _4492 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4480);
    float _4494 = fma(_4458, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4482);
    float _4496 = _4484 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4498 = _4486 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _4500 = _4472 >= 0.0;
    bool _4502 = _4500 && _4490;
    float _4504 = _4492 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4506 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4494);
    float _4508 = fma(_4496, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4498);
    bool _4510 = _4472 <= 1.0;
    bool _4512 = _4510 && _4502;
    float _4514 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4516 = _4504 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4518 = _4506 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4520 = fma(_4504, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4508);
    float _4522 = _3606 * _4230;
    float _4524 = -_4516;
    float _4526 = fma(_4524, _4514, 1.0);
    float _4528 = _4486 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4530 = fma(_4518, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4520);
    float _4532 = _4486 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4534 = fma(_3456, _4222, _4522);
    float _4536 = fma(_4496, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4528);
    float _4538 = 1.0 / _4530;
    float _4540 = _4494;
    float _4542 = _4492;
    float _4544 = _4530;
    if (_4512)
    {
        float _4546 = float(_3946);
        _4540 = _4546;
    }
    float _4548 = _4540;
    float _4550 = fma(_4496, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4532);
    float _4552 = fma(_3464, _4270, _4534);
    float _4554 = fma(_4504, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4536);
    if (!_4052)
    {
        float _4556 = -_4290;
        float _4558 = _3922 + _4556;
        _4304 = _4558;
    }
    float _4560 = _4304;
    float _4562 = fma(_4504, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4550);
    float _4564 = _4552 + _4278;
    float _4566 = log2(_4526);
    float _4568 = fma(_4518, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4554);
    float _4570 = fma(_4518, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4562);
    if (!_4052)
    {
        float _4572 = -_4256;
        float _4574 = _3904 + _4572;
        _4410 = _4574;
    }
    float _4576 = _4410;
    float _4578 = _4564 * _4330;
    float _4580 = _4322;
    if (!_4052)
    {
        float _4582 = rint(_4316);
        float _4584 = precise::max(_4582, 0.0);
        uint _4586 = uint(_4584);
        uint _4588 = clamp(_4586, 0u, 65535u);
        _4580 = as_type<float>(_4588);
    }
    float _4590 = _4580;
    float _4592 = _4568 * _4538;
    float _4594 = _4570 * _4538;
    float _4596 = fma(_4592, 0.5, 0.5);
    float _4598 = fma(_4594, -0.5, 0.5);
    float _4600 = _4548;
    if (_4512)
    {
        float _4602 = rint(_4548);
        float _4604 = precise::max(_4602, 0.0);
        uint _4606 = uint(_4604);
        uint _4608 = clamp(_4606, 0u, 65535u);
        _4600 = as_type<float>(_4608);
    }
    float _4610 = _4600;
    float _4612 = _4566 * 0.693147182464599609375;
    float _4614 = _4612 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4616 = _4560;
    float _4618 = _4614;
    if (!_4052)
    {
        float3 _12365 = float3(_4576, _4560, float(as_type<int>(_4590)));
        float3 _12369 = select(_12365, float3(0.0), isnan(_12365));
        float _4620 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12369.xy, uint(rint(_12369.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12369.xy, uint(rint(_12369.z)), level(0.0)).x;
        _4616 = _4620;
    }
    float _4622 = _4616;
    float _4624 = _4612;
    if (_4512)
    {
        float3 _12384 = float3(_4464, _4472, float(as_type<int>(_4610)));
        float3 _12386 = select(_12384, float3(0.0), isnan(_12384));
        float _4626 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12386.xy, uint(rint(_12386.z)), _4578, level(0.0));
        _4624 = _4626;
    }
    float _4628 = _4624;
    float3 _12396 = float3(_4596, _4598, _4614);
    float _4630 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12396, float3(0.0), isnan(_12396)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12396, float3(0.0), isnan(_12396)), level(0.0)).x;
    float3 _12405 = float3(_4596, _4598, _4614);
    float4 _4633 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12405, float3(0.0), isnan(_12405)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12405, float3(0.0), isnan(_12405)), level(0.0)).xyzw;
    float _4635 = _4633.x;
    float _4637 = _4633.y;
    float _4639 = _4633.z;
    float _4641 = _4633.w;
    bool _4643 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4645 = isnan(0.5);
    bool _4647 = _4643 || _4645;
    bool _4649 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4651 = _4647 || _4649;
    if (_4052)
    {
        _3482 = 1.0;
    }
    float _4653 = _3482;
    float _4655 = _4653;
    if (_4651)
    {
        _4542 = 1.0;
    }
    float _4657 = _4542;
    float _4659 = _4657;
    float _4661 = _4637;
    float _4663 = _4635;
    if (!_4651)
    {
        float _4665 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4667 = _4665 * 0.15915493667125701904296875;
        float _4669 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4671 = _4667 * 6.283185482025146484375;
        float _4673 = cos(_4671);
        float _4675 = _4669 * 0.15915493667125701904296875;
        float _4677 = _4667 * 6.283185482025146484375;
        float _4679 = sin(_4677);
        float _4681 = 1.0 / _4673;
        float _4683 = _4675 * 6.283185482025146484375;
        float _4685 = cos(_4683);
        float _4687 = _4679 * _4681;
        float _4689 = _4675 * 6.283185482025146484375;
        float _4691 = sin(_4689);
        float _4693 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4695 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4693;
        float _4697 = _4685 * _4687;
        float _4699 = 1.0 / _4695;
        float _4701 = 1.0 / _4697;
        float _4703 = _4691 * _4701;
        float _4705 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4707 = fma(_3892, _4703, _4705);
        float _4709 = _4707 * _4699;
        float _4711 = precise::clamp(_4709, 0.0, 1.0);
        _4618 = _4667;
        _4659 = _4711;
    }
    float _4713 = _4618;
    float _4715 = _4659;
    float _4717 = _4713;
    if (!_4052)
    {
        int _4719 = _4112 << 4;
        int _4721 = _4719 + 2048;
        uint _4723 = uint(int(uint(_4721) >> uint(2)));
        uint _4725 = uint(int(uint(int(_4723)) >> uint(2)));
        int _4727 = int(_4723) & 3;
        float _4729 = (*spvDescriptorSet0.vp_c15)._m0[int(_4725)][_4727];
        int _4731 = int(_4723) + 1;
        uint _4733 = uint(int(uint(_4731) >> uint(2)));
        int _4735 = _4731 & 3;
        float _4737 = (*spvDescriptorSet0.vp_c15)._m0[int(_4733)][_4735];
        int _4739 = _4721 + 8;
        uint _4741 = uint(int(uint(_4739) >> uint(2)));
        uint _4743 = uint(int(uint(int(_4741)) >> uint(2)));
        int _4745 = int(_4741) & 3;
        float _4747 = (*spvDescriptorSet0.vp_c15)._m0[int(_4743)][_4745];
        int _4749 = int(_4741) + 1;
        uint _4751 = uint(int(uint(_4749) >> uint(2)));
        int _4753 = _4749 & 3;
        float _4755 = (*spvDescriptorSet0.vp_c15)._m0[int(_4751)][_4753];
        float _4757 = _3606 * _4737;
        float _4759 = fma(_3456, _4729, _4757);
        float _4761 = fma(_3464, _4747, _4759);
        float _4763 = _4761 + _4755;
        float _4765 = precise::clamp(_4763, 0.0, 1.0);
        float _4767 = -_4765;
        float _4769 = _4767 + _4622;
        float _4771 = fma(_4769, 500.0, 1.5);
        float _4773 = exp2(_4771);
        float _4775 = 0.0 + _4773;
        float _4777 = precise::clamp(_4775, 0.0, 1.0);
        _4655 = _4777;
    }
    float _4779 = _4655;
    float _4781 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4783 = _4456 + _4781;
    float _4785 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4787 = _4458 + _4785;
    float _4789 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4791 = _4460 + _4789;
    float _4793 = _4783 * _4783;
    float _4795 = fma(_4787, _4787, _4793);
    float _4797 = fma(_4791, _4791, _4795);
    float _4799 = rsqrt(_4797);
    float _4801 = _4799 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4803 = _4787 * _4801;
    float _4805 = _4791 * _4801;
    float _4807 = _4803 * _4803;
    float _4809 = _4805 * _4805;
    float _4811 = _4807 + _4809;
    float _4813 = sqrt(_4811);
    bool _4815 = _4813 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4817 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4819 = _4813 + _4817;
    float _4821 = _4791;
    float _4823 = _4819;
    float _4825 = _4783;
    if (_4815)
    {
        float _4827 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4821 = _4827;
    }
    float _4829 = _4821;
    if (_4815)
    {
        float _4831 = rsqrt(_4811);
        _4717 = _4831;
    }
    float _4833 = _4717;
    float _4835 = _4833;
    if (_4815)
    {
        float _4837 = _4819 * _4829;
        _4823 = _4837;
    }
    float _4839 = _4823;
    if (_4815)
    {
        float _4841 = _4839 * 0.15915493667125701904296875;
        _3484 = _4841;
    }
    float _4843 = _3484;
    float _4845 = _4799;
    if (_4815)
    {
        float _4847 = _4843 * 6.283185482025146484375;
        float _4849 = sin(_4847);
        _4845 = _4849;
    }
    float _4851 = _4845;
    float _4853 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4855 = precise::max(0.0, _4853);
    float _4857 = _4793;
    float _4859 = _4855;
    float _4861 = _4853;
    if (_4815)
    {
        float _4863 = _4843 * 6.283185482025146484375;
        float _4865 = cos(_4863);
        _4857 = _4865;
    }
    float _4867 = _4857;
    float _4869 = -_4801;
    float _4871 = -_4855;
    float _4873 = fma(_4783, _4869, _4871);
    if (!_4815)
    {
        _4825 = _4805;
    }
    float _4875 = _4825;
    float _4877 = _4875;
    if (_4815)
    {
        float _4879 = _4873 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4859 = _4879;
    }
    float _4881 = _4859;
    float _4883 = _4881;
    float _4885 = _4851;
    if (_4815)
    {
        float _4887 = fma(_4851, _4881, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4883 = _4887;
    }
    float _4889 = _4883;
    float _4891 = _4889;
    if (!_4815)
    {
        _4885 = _4803;
    }
    float _4893 = _4885;
    float _4895 = _4893;
    float _4897 = _4867;
    if (_4815)
    {
        float _4899 = _4867 + (-1.0);
        _4861 = _4899;
    }
    float _4901 = _4861;
    float _4903 = _4901;
    if (_4815)
    {
        float _4905 = _4833 * _4889;
        _3936 = _4905;
    }
    float _4907 = _3936;
    if (!_4815)
    {
        _4891 = _4873;
    }
    float _4909 = _4891;
    float _4911 = _4909;
    if (_4815)
    {
        float _4913 = _4901 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4903 = _4913;
    }
    float _4915 = _4903;
    if (_4815)
    {
        float _4917 = _4803 * _4907;
        _4895 = _4917;
    }
    float _4919 = _4895;
    if (!_4815)
    {
        _4835 = _4807;
    }
    float _4921 = _4835;
    float _4923 = _4921;
    if (_4815)
    {
        float _4925 = _4805 * _4907;
        _4877 = _4925;
    }
    float _4927 = _4877;
    if (_4815)
    {
        float _4929 = fma(_4873, _4867, _4915);
        _4911 = _4929;
    }
    float _4931 = _4911;
    if (_4815)
    {
        float _4933 = _4919 * _4919;
        _4923 = _4933;
    }
    float _4935 = _4923;
    if (!_4815)
    {
        _4897 = _4809;
    }
    float _4937 = _4897;
    float _4939 = _4937;
    if (_4815)
    {
        float _4941 = _4927 * _4927;
        _4939 = _4941;
    }
    float _4943 = _4939;
    float _4945 = sqrt(_4797);
    float _4947 = fma(_4931, _4931, _4935);
    float _4949 = _4947 + _4943;
    float _4951 = rsqrt(_4949);
    float _4953 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4955 = fma(_4945, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4953);
    float _4957 = precise::clamp(_4955, 0.0, 1.0);
    float _4959 = -_4957;
    float _4961 = _4959 + 1.0;
    float _4963 = abs(_4961);
    float _4965 = log2(_4963);
    float _4967 = _4951 * _4919;
    float _4969 = _4951 * _4931;
    float _4971 = _4951 * _4927;
    float _4973 = _4967 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4975 = -_4973;
    float _4977 = fma(_4969, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4975);
    float _4979 = -_4971;
    float _4981 = fma(_4979, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4977);
    float _4983 = _4965 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4985 = fma(_4981, -0.5, 0.5);
    float _4987 = fma(_4981, 0.5, 0.5);
    float _4989 = exp2(_4983);
    float _4991 = fma(_4987, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4993 = fma(_4987, _4991, -0.212114393711090087890625);
    float _4995 = _4969 + 1.0;
    float _4997 = sqrt(_4985);
    float _4999 = fma(_4987, _4993, 1.570728778839111328125);
    float _5001 = -_4969;
    float _5003 = fma(_4989, _4995, _5001);
    float _5005 = fma(_5003, 0.5, 0.5);
    float _5007 = _4997 * 0.636619746685028076171875;
    float _5009 = -_4999;
    float _5011 = fma(_5007, _5009, 1.0);
    float2 _12973 = float2(_5011, _5005);
    float3 _5015 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12973, float2(0.0), isnan(_12973)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12973, float2(0.0), isnan(_12973)), level(0.0)).xyz;
    float _5017 = _5015.x;
    float _5019 = _5015.y;
    float _5021 = _5015.z;
    float _5023 = abs(_3892);
    float _5025 = log2(_5023);
    float _5027 = _3838 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5029 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5031 = _3838 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5033 = _3838 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5035 = fma(_3856, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5027);
    float _5037 = fma(_5029, _5029, 1.0);
    float _5039 = fma(_3856, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5031);
    float _5041 = _3854 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5043 = _3854 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5045 = _3854 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5047 = fma(_3856, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5033);
    float _5049 = rsqrt(_5037);
    float _5051 = -_3810;
    float _5053 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5041);
    float _5055 = -_3810;
    float _5057 = fma(_5055, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5043);
    float _5059 = -_3810;
    float _5061 = fma(_5059, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5045);
    float _5063 = _5025 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5065 = _3866 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5067 = _3866 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5069 = _3866 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5071 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5047);
    float _5073 = _4486 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5075 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5065);
    float _5077 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5067);
    float _5079 = exp2(_5063);
    float _5081 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5069);
    float _5083 = fma(_3858, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5053);
    float _5085 = fma(_4496, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5073);
    float _5087 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5039);
    float _5089 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5035);
    float _5091 = _241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5093 = _5029 * _5083;
    float _5095 = fma(_3858, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5057);
    float _5097 = fma(_3858, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5061);
    float _5099 = fma(_4504, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5085);
    float _5101 = fma(_3844, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5075);
    float _5103 = fma(_3844, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5077);
    float _5105 = fma(_3844, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5081);
    float _5107 = fma(_5091, _5087, _5093);
    float _5109 = _5029 * _5095;
    float _5111 = _5029 * _5097;
    float _5113 = fma(_4518, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5099);
    float _5115 = _5029 * _5049;
    float _5117 = fma(_5091, _5089, _5109);
    float _5119 = fma(_5091, _5071, _5111);
    float _5121 = -_5101;
    float _5123 = _5115 * _5121;
    float _5125 = _4530 * 0.5;
    float _5127 = fma(_5079, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5129 = precise::clamp(_5127, 0.0, 1.0);
    out.m_96.x = _5087;
    out.m_96.y = _5089;
    out.m_96.z = _5071;
    float _5131 = _4965 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5133 = -_5105;
    float _5135 = _5115 * _5133;
    bool _5137 = _3892 <= 8000.0;
    bool _5139 = isnan(_3892);
    bool _5141 = _5137 || _5139;
    bool _5143 = isnan(8000.0);
    bool _5145 = _5141 || _5143;
    float _5147 = float(_5145);
    out.gl_Position.x = _4568;
    out.gl_Position.y = _4570;
    out.gl_Position.z = _5113;
    out.gl_Position.w = _4530;
    float _5149 = -_3510;
    float _5151 = _5149 + 1.0;
    float _5153 = _5113 + _4530;
    float _5155 = exp2(_5131);
    float _5157 = _5103 + _5117;
    bool _5159 = _4945 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5161 = isnan(_4945);
    bool _5163 = _5159 || _5161;
    bool _5165 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5167 = _5163 || _5165;
    float _5169 = _5153 * 0.5;
    float _5171 = fma(_5049, _5083, _5123);
    float _5173 = fma(_4570, -0.5, _5125);
    float _5175 = _5101 + _5107;
    float _5177 = fma(_5129, -2.0, 3.0);
    float _5179 = _5129 * _5129;
    float _5181 = -_5103;
    float _5183 = _5115 * _5181;
    float _5185 = _5179 * _5177;
    float _5187 = fma(_5049, _5095, _5183);
    float _5189 = fma(_5049, _5097, _5135);
    float _5191 = _4568 + _4530;
    float _5193 = -_5185;
    float _5195 = _5193 + 1.0;
    float _5197 = -_5155;
    float _5199 = _5197 + 1.0;
    float _5201 = _5105 + _5119;
    float _5203 = _5191 * 0.5;
    float _5205 = fma(_5195, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5185);
    float _5207 = _5199 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_98.x = _5171;
    out.m_98.y = _5187;
    out.m_98.z = _5189;
    float _5209 = _5205;
    float _5211 = _5199;
    if (!_5167)
    {
        _4544 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5213 = _4544;
    float _5215 = _5147 * _5205;
    float _5217 = _5213;
    float _5219 = _5213;
    if (!_4512)
    {
        _5209 = 1.0;
    }
    float _5221 = _5209;
    out.m_100.x = _5203;
    out.m_100.y = _5173;
    out.m_100.z = _5169;
    out.m_100.w = _4530;
    float _5223 = _5221;
    if (_4512)
    {
        bool _5225 = _4628 >= _4578;
        bool _5227 = isnan(_4628);
        bool _5229 = _5225 || _5227;
        bool _5231 = isnan(_4578);
        bool _5233 = _5229 || _5231;
        float _5235 = float(_5233);
        _5223 = _5235;
    }
    float _5237 = _5223;
    float _5239 = _5215 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_5167)
    {
        _5211 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5241 = _5211;
    out.m_102.x = _5175;
    out.m_102.y = _5157;
    out.m_102.z = _5201;
    float _5243 = _5151 * _5239;
    float _5245 = precise::clamp(_5243, 0.0, 1.0);
    float _5247 = _5237 * _4779;
    float _5249 = _5207 * _4630;
    float _5251 = -_5207;
    float _5253 = _5251 + 1.0;
    float _5255 = -_5245;
    float _5257 = fma(_5255, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5259 = _4715 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5261 = _4641 * _5249;
    float _5263 = -_5247;
    float _5265 = fma(_5263, _5257, 1.0);
    float _5267 = precise::clamp(_5265, 0.0, 1.0);
    float _5269 = _4641 * _5253;
    float _5271 = _5253;
    float _5273 = _5267;
    float _5275 = _5241;
    float _5277 = _5241;
    if (!_5167)
    {
        _5271 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5279 = _5271;
    float _5281 = _5267 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5283 = _5279;
    float _5285 = _5279;
    if (!_5167)
    {
        _5273 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5287 = _5273;
    out.m_104.x = _5281;
    float _5289 = _5021 * _5249;
    float _5291 = fma(_5017, _5261, _4635);
    float _5293 = fma(_5019, _5261, _4637);
    float _5295 = _5287;
    float _5297 = _5287;
    if (!_5167)
    {
        _4661 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5299 = _4661;
    float _5301 = fma(_4641, _5289, _4639);
    float _5303 = _5299;
    float _5305 = _5299;
    if (!_5167)
    {
        _4663 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5307 = _4663;
    out.m_106.x = _5291;
    out.m_106.y = _5293;
    out.m_106.z = _5301;
    out.m_106.w = _5269;
    bool _5309 = !_5167;
    float _5311 = _5307;
    float _5313 = _5307;
    if (!_5309)
    {
        bool _5315 = _4945 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5317 = isnan(_4945);
        bool _5319 = _5315 || _5317;
        bool _5321 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5323 = _5319 || _5321;
        if (!_5323)
        {
            float _5325 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5327 = _4945 + _5325;
            float _5329 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5331 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5329;
            float _5333 = 1.0 / _5331;
            float _5335 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5337 = _5335 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5339 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5341 = _5339 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5343 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5345 = _5343 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5347 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5349 = _5347 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5351 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5353 = _5351 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5355 = _5327 * _5333;
            float _5357 = precise::clamp(_5355, 0.0, 1.0);
            float _5359 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5361 = _5359 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5363 = fma(_5357, _5337, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5365 = fma(_5357, _5361, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5367 = fma(_5357, _5341, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5369 = fma(_5357, _5345, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5371 = fma(_5357, _5349, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5373 = fma(_5357, _5353, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5313 = _5365;
            _5277 = _5371;
            _5305 = _5363;
            _5285 = _5369;
            _5219 = _5367;
            _5297 = _5373;
            _5375 = true;
        }
        else
        {
            bool _5377 = _4945 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5379 = isnan(_4945);
            bool _5381 = _5377 || _5379;
            bool _5383 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5385 = _5381 || _5383;
            if (!_5385)
            {
                _5303 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5387 = _5303;
            _5305 = _5387;
            if (!_5385)
            {
                _5311 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5389 = _5311;
            _5313 = _5389;
            if (!_5385)
            {
                _5217 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5391 = _5217;
            _5219 = _5391;
            if (!_5385)
            {
                _5283 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5393 = _5283;
            _5285 = _5393;
            if (!_5385)
            {
                _5275 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5395 = _5275;
            _5277 = _5395;
            if (!_5385)
            {
                _5295 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5397 = _5295;
            bool _5399 = !_5385;
            _5297 = _5397;
            if (!_5399)
            {
                bool _5401 = _4945 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5403 = isnan(_4945);
                bool _5405 = _5401 || _5403;
                bool _5407 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5409 = _5405 || _5407;
                if (!_5409)
                {
                    float _5411 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5413 = _4945 + _5411;
                    float _5415 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5417 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5415;
                    float _5419 = 1.0 / _5417;
                    float _5421 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5423 = _5421 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5425 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5427 = _5425 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5429 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5431 = _5429 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5433 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5435 = _5433 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5437 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5439 = _5437 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5441 = _5413 * _5419;
                    float _5443 = precise::clamp(_5441, 0.0, 1.0);
                    float _5445 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5447 = _5445 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5449 = fma(_5443, _5423, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5451 = fma(_5443, _5447, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5453 = fma(_5443, _5427, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5455 = fma(_5443, _5431, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5457 = fma(_5443, _5435, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5459 = fma(_5443, _5439, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5313 = _5451;
                    _5277 = _5457;
                    _5305 = _5449;
                    _5285 = _5455;
                    _5219 = _5453;
                    _5297 = _5459;
                    _5375 = true;
                }
                else
                {
                    _5313 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5277 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5305 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5285 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5219 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5297 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5375 = false;
    float _5461 = _5313;
    float _5463 = _5277;
    float _5465 = _5305;
    float _5467 = _5285;
    float _5469 = _5219;
    float _5471 = _5297;
    float _5473 = fma(_5157, -0.5, 0.5);
    float _5475 = precise::clamp(_5473, 0.0, 1.0);
    float _5477 = -_5461;
    float _5479 = _5477 + _5463;
    float _5481 = _5259 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5483 = -_5465;
    float _5485 = _5483 + _5467;
    float _5487 = fma(_5475, _5479, _5461);
    out.m_108.x = 0.0;
    float _5489 = -_5469;
    float _5491 = _5489 + _5471;
    float _5493 = fma(_5475, _5485, _5465);
    float _5495 = _5487 * 0.586610972881317138671875;
    out.m_63.x = _5481;
    bool _5497 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5499 = fma(_5475, _5491, _5469);
    float _5501 = fma(_5493, 0.298911988735198974609375, _5495);
    bool _5503 = _4715 > 0.0;
    bool _5505 = isnan(_4715);
    bool _5507 = _5503 || _5505;
    bool _5509 = isnan(0.0);
    bool _5511 = _5507 || _5509;
    float _5513 = fma(_5499, 0.114477999508380889892578125, _5501);
    float _5515 = -_5513;
    float _5517 = _5493 + _5515;
    float _5519 = -_5513;
    float _5521 = _5487 + _5519;
    float _5523 = -_5513;
    float _5525 = _5499 + _5523;
    float _5527 = fma(_5517, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5513);
    float _5529 = fma(_5521, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5513);
    float _5531 = fma(_5525, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5513);
    bool _5533 = !_5497;
    if (!_5533)
    {
        float _5535 = -_4456;
        float _5537 = _5535 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5539 = -_4458;
        float _5541 = _5539 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5543 = -_4460;
        float _5545 = _5543 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5547 = _5537 * _5537;
        float _5549 = fma(_5541, _5541, _5547);
        float _5551 = fma(_5545, _5545, _5549);
        float _5553 = sqrt(_5551);
        float _5555 = rsqrt(_5551);
        float _5557 = -_5553;
        float _5559 = _5557 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5561 = _5559 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5563 = precise::clamp(_5561, 0.0, 1.0);
        float _5565 = _5541 * _5555;
        float _5567 = _5537 * _5555;
        float _5569 = abs(_5563);
        float _5571 = log2(_5569);
        float _5573 = _5545 * _5555;
        float _5575 = _5565 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5577 = _5157 * _5567;
        float _5579 = -_5567;
        float _5581 = -_5575;
        float _5583 = fma(_5579, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5581);
        float _5585 = fma(_5175, _5565, _5577);
        float _5587 = -_5573;
        float _5589 = fma(_5587, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5583);
        float _5591 = fma(_5201, _5573, _5585);
        float _5593 = precise::clamp(_5591, 0.0, 1.0);
        float _5595 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5597 = _5589 + _5595;
        float _5599 = _5571 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5601 = _5597 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5603 = precise::clamp(_5601, 0.0, 1.0);
        float _5605 = exp2(_5599);
        float _5607 = _5605 * _5603;
        float _5609 = _5593 * _5607;
        float _5611 = _5609 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5613 = _5609 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5615 = _5609 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_108.x = _5611;
        out.m_108.y = _5613;
        out.m_108.z = _5615;
    }
    out.m_110.x = _5527;
    out.m_110.y = _5529;
    out.m_110.z = _5531;
    if (_5511)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5617 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5617;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

