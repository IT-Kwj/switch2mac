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
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
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
    float4 m_76 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_94 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_82 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_88 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_70 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3831 = false;
    bool _351 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_59.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4135 = as_type<float>(_129);
        out.gl_Position.z = _4135;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_61.w;
    float _133 = in.m_63.x;
    bool _135 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_131);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_131;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_65.x = _133;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_59.x = 0.0;
    }
    int _165 = 0;
    if (_161)
    {
        float _167 = _163 * 5.0;
        _165 = as_type<int>(_167);
    }
    int _169 = _165;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4208 = as_type<float>(_169);
        out.gl_Position.z = _4208;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = in.m_70.w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_61.x;
    float _189 = in.m_61.y;
    float _191 = in.m_61.z;
    float _193 = in.m_56.x;
    float _195 = in.m_56.y;
    float _197 = in.m_56.z;
    int _199 = as_type<int>(_171) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_171) & 2;
    bool _205 = _203 != 0;
    float _207 = _171;
    if (!_185)
    {
        float _209 = _173 * _173;
        float _211 = _209 * 0.5;
        _207 = _211;
    }
    float _213 = _207;
    bool _215 = !_201;
    float _217 = _215 ? (-0.5) : 0.5;
    float _219 = _213;
    if (!_185)
    {
        float _221 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _221;
    }
    float _223 = _219;
    bool _225 = !_205;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_185;
    float _231 = _223;
    if (!_229)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = _173 * _235;
        float _245 = 1.0 / _239;
        float _247 = _241 * 0.693147182464599609375;
        float _249 = exp2(_243);
        float _251 = 1.0 / _247;
        float _253 = _249 + (-1.0);
        float _255 = -_253;
        float _257 = fma(_255, _251, _173);
        float _259 = _257 * _245;
        float _261 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _261;
    }
    float _263 = _231;
    float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _271 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _273 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _275 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _277 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[8].x, _271);
    float _279 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[8].y, _273);
    float _281 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[8].z, _275);
    float _283 = _273;
    if (!_185)
    {
        _283 = _173;
    }
    float _285 = _283;
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[10].x, _277);
    bool _289 = !_185;
    float _291 = _285;
    if (!_289)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = 1.0 / _299;
        float _303 = _173 * _295;
        float _305 = exp2(_303);
        float _307 = -_305;
        float _309 = _307 + 1.0;
        float _311 = _309 * _301;
        _291 = _311;
    }
    float _313 = _291;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _317 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[10].y, _279);
    float _319 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[10].z, _281);
    float _321 = fma(_313, _187, _287);
    float _323 = fma(_313, _189, _317);
    float _325 = fma(_313, _191, _319);
    float _327 = fma(_321, _175, _193);
    float _329 = fma(_323, _175, _195);
    float _331 = fma(_325, _175, _197);
    bool _333 = !_315;
    float _349;
    if (!_333)
    {
        float _335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _337 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _341 = _339 * _335;
        float _343 = floor(_341);
        float _345 = -_343;
        float _347 = _341 + _345;
        _349 = _347;
        _351 = true;
    }
    else
    {
        float _353 = float(_113);
        float _355 = 1.0 / _353;
        float _357 = _147 * _355;
        _349 = _357;
    }
    _351 = false;
    float _359 = _349;
    float _361 = _329 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _363 = _329 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _365 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[4].x, _361);
    float _367 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[6].x, _363);
    float _369 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[4].z, _365);
    float _371 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[6].z, _367);
    float _373 = _369 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _375 = _371 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _377 = fma(_373, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _379 = fma(_375, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _381 = floor(_377);
    float _383 = floor(_379);
    float _385 = -_381;
    float _387 = _377 + _385;
    float _389 = -_383;
    float _391 = _379 + _389;
    float2 _4576 = float2(_387, _391);
    float _393 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4576, float2(0.0), isnan(_4576)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4576, float2(0.0), isnan(_4576)), level(0.0)).x;
    float _395 = in.m_63.z;
    float _397 = _133 * 2.0;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _401 = _359 + _399;
    float _403 = in.m_63.y;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _413 = floor(_397);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _423 = 1.0 / _407;
    float _425 = _329 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _431 = _429 != 0;
    float _433 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[5].x, _425);
    float _435 = _133 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _437 = 1.0 / _411;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _443 = -_427;
    float _445 = fma(_435, 2.0, _443);
    bool _447 = _413 > 0.0;
    float _449 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[5].z, _433);
    bool _451 = _413 >= 0.0;
    bool _453 = isnan(_413);
    bool _455 = _451 || _453;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _463 = 1.0 / _421;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _467 = _359 + _465;
    float _469 = _449 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _471 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _473 = isnan(_359);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _483;
    float _487 = 1.0 / _417;
    float _489 = _467 * _437;
    float _491 = _403 * 2.0;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _497;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _503 = _359 + _501;
    float _505 = 1.0 / _441;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _507;
    float _511 = _403 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _513 = _503 * _463;
    float _515 = _133 + _395;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _519 = _359 + _517;
    float _521 = fma(_511, -2.0, _461);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _525 = _359 + _523;
    float _527 = 1.0 / _499;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _531 = _359 + _529;
    float _533 = _515 + (-1.0);
    float _535 = fma(_495, _513, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _537 = _531 * _423;
    float _539 = _395 * 2.0;
    float _541 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _543 = 1.0 / _509;
    float _545 = _401 * _505;
    float _547 = -_481;
    float _549 = _547 + 1.0;
    float _551 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _521);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _553;
    float _557 = floor(_539);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _561 = _359 + _559;
    float _563 = _519 * _527;
    float _565 = _561 * _487;
    float _567 = _133 + _403;
    float _569 = floor(_491);
    float _571 = _525 * _543;
    bool _573 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _575 = isnan(_359);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = _567 + (-1.0);
    float _587 = _395 + _403;
    float _589 = fma(_485, _565, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _591 = fma(_555, _565, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _593 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _595 = _587 + (-1.0);
    bool _597 = _557 > 0.0;
    float _599 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _601 = int(_599);
    bool _603 = _557 >= 0.0;
    bool _605 = isnan(_557);
    bool _607 = _603 || _605;
    bool _609 = isnan(0.0);
    bool _611 = _607 || _609;
    float _613 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _623;
    bool _627 = _569 > 0.0;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _633 = _569 >= 0.0;
    bool _635 = isnan(_569);
    bool _637 = _633 || _635;
    bool _639 = isnan(0.0);
    bool _641 = _637 || _639;
    float _643 = fma(_621, _537, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _645 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _647 = isnan(_359);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = fma(_625, _537, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _659 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _661 = isnan(_359);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _675 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _677 = isnan(_359);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -_655;
    float _689 = _687 + 1.0;
    float _691 = fma(_631, _489, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _693 = -_669;
    float _695 = _693 + 1.0;
    float _697 = fma(_673, _489, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _699 = _669 * _689;
    float _701 = fma(_617, _513, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _703 = _685 * _695;
    float _705 = -_685;
    float _707 = _705 + 1.0;
    bool _709 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _711 = isnan(_359);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _721;
    int _725 = _459 ? 0 : 1;
    float _727 = _583 * _707;
    float _729 = -_583;
    float _731 = _729 + 1.0;
    float _733 = -_719;
    float _735 = _733 + 1.0;
    float _737 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _739 = log2(_737);
    float _741 = _719 * _731;
    bool _743 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _745 = isnan(_359);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _755;
    float _759 = _481 * _735;
    float _761 = float(_601);
    float _763 = fma(_757, _571, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _765 = _753 * _549;
    float _767 = fma(_723, _571, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    int _769 = as_type<int>(_549);
    float _771 = _469;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_431)
    {
        _769 = 0;
    }
    int _775 = _769;
    float _777 = -_753;
    float _779 = _777 + 1.0;
    bool _781 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _783 = isnan(_359);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    int _797 = _775;
    if (!_431)
    {
        _797 = 1;
    }
    int _799 = _797;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    int _805 = _641 ? 0 : 1;
    float _807 = _791 * _779;
    bool _809 = _799 != 1;
    float _811 = -_791;
    float _813 = _811 + 1.0;
    float _815 = fma(_795, _545, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _817 = _589 * _807;
    float _819 = _591 * _807;
    float _821 = fma(_803, _545, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _823 = ~_725;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    float _829 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[143].x, _817);
    float _831 = 1.0 / _761;
    int _833 = _827;
    float _835 = _813;
    if (!_447)
    {
        int _837 = ~_725;
        int _839 = _837 + 1;
        _833 = _839;
    }
    int _841 = _833;
    float _843 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[143].y, _819);
    float _845 = _611 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _849 = _845;
    if (!_809)
    {
        _835 = _403;
    }
    float _851 = _835;
    float _853 = fma(_535, _765, _829);
    float _855 = _851;
    if (_809)
    {
        _855 = _133;
    }
    float _857 = _855;
    float _859 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _861 = int(_859);
    int _863 = ~as_type<int>(_845);
    int _865 = _863 + 1;
    int _867 = _865 + 1;
    float _869 = fma(_701, _765, _843);
    int _871 = _867;
    if (!_597)
    {
        int _873 = ~as_type<int>(_845);
        int _875 = _873 + 1;
        _871 = _875;
    }
    int _877 = _871;
    float _879 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[83].z, _847);
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _883 = _881 != 0;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _887 = _885 != 0;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _891 = _889 != 0;
    float _893 = fma(_643, _759, _853);
    float _895 = fma(_657, _759, _869);
    float _897 = _469 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _899 = ~_805;
    int _901 = _899 + 1;
    int _903 = _901 + 1;
    float _905 = _739 * _147;
    bool _907 = !_887;
    int _909 = _907 ? 0 : 1;
    float _911 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[11].x, _897);
    bool _913 = !_883;
    int _915 = _913 ? 0 : 1;
    float _917 = _831 * _147;
    bool _919 = !_891;
    int _921 = _919 ? 0 : 1;
    float _923 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[11].z, _911);
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _927 = _925 != 0;
    int _929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _931 = _929 != 0;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _935 = _933 != 0;
    float _937 = _469 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _939 = float(_861);
    float _941 = _923 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _943 = _903;
    float _945 = _923;
    if (!_627)
    {
        int _947 = ~_805;
        int _949 = _947 + 1;
        _943 = _949;
    }
    int _951 = _943;
    float _953 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[10].x, _937);
    bool _955 = !_931;
    float _957 = _955 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _959 = 1.0 / _939;
    float _961 = float(_113);
    float _963 = fma(_691, _741, _893);
    int _965 = abs(as_type<int>(_957));
    float _967 = fma(_697, _741, _895);
    float _969 = float(_841);
    float _971 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[10].z, _953);
    float _973 = float(_965);
    float _975 = 1.0 / _941;
    float _977 = _957;
    if (!_809)
    {
        _977 = _395;
    }
    float _979 = _977;
    float _981 = _971 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _983 = _979;
    if (_809)
    {
        _983 = _403;
    }
    float _985 = _983;
    float _987 = _973 * _969;
    float _989 = _981 + _941;
    float _991 = _985 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_809)
    {
        _945 = _403;
    }
    float _993 = _945;
    float _995 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _997 = _993;
    if (_809)
    {
        _997 = _133;
    }
    float _999 = _997;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1003 = _469 + _995;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1007 = 1.0 + _1005;
    float _1009 = _999 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1011 = fma(_991, -2.0, _1001);
    float _1013 = _1003 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1015 = in.m_72.x;
    float _1017 = in.m_72.y;
    float _1019 = in.m_72.z;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1023 = 1.0 / _1007;
    float _1025 = fma(_373, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1013);
    bool _1027 = !_935;
    int _1029 = _1027 ? 0 : 1;
    float _1031 = -_1021;
    float _1033 = fma(_1009, 2.0, _1031);
    float _1035 = _987 * (-2.0);
    int _1037 = abs(_1029);
    float _1039 = _989 * _975;
    float _1041 = _1039 * 0.5;
    float _1043 = exp2(_905);
    float _1045 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1011);
    float _1047 = fma(_375, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1025);
    bool _1049 = !_927;
    int _1051 = _1049 ? 0 : 1;
    float _1053 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1055 = _1047 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _1057 = abs(_1051);
    float _1059 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1053);
    float _1061 = float(_951);
    float _1063 = 1.0 / _961;
    float _1065 = float(_1057);
    float _1067 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _879);
    float _1069 = float(_877);
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1073 = fma(_613, _1035, _613);
    float _1075 = _1065 * _1069;
    bool _1077 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1079 = isnan(1.0);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1085 = _1081 || _1083;
    float _1087 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1071);
    float _1089 = _1061;
    float _1091 = _1055;
    if (!_809)
    {
        _849 = _395;
    }
    float _1093 = _849;
    float _1095 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1097 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1095);
    float _1099 = _1093;
    if (_809)
    {
        _1099 = _403;
    }
    float _1101 = _1099;
    float _1103 = _959 * _147;
    float _1105 = -_1043;
    float _1107 = _1105 + 1.0;
    float _1109 = _1075 * (-2.0);
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1113 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1115 = isnan(0.0);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1121 = _1117 || _1119;
    float _1123 = fma(_1035, _1017, _1017);
    float _1125 = float(_1037);
    float _1127 = fma(_593, _1109, _593);
    float _1129 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1111);
    float _1131 = _1121 ? _1107 : 0.0;
    float _1133 = fma(_1109, _1015, _1015);
    float _1135 = _133 + (-0.5);
    float _1137 = _1125 * _1061;
    float _1139 = -_147;
    float _1141 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[76].x, _445);
    float _1143 = _1063 * _147;
    float _1145 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1059);
    float _1147 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1087);
    float _1149 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1129);
    float _1151 = -_147;
    float _1153 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1033);
    if (_1085)
    {
        float _1155 = _1131 * _1023;
        _151 = _1155;
    }
    float _1157 = _151;
    float _1159 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1133);
    float _1161 = _1137 * (-2.0);
    float _1163 = _1003 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1165 = 1.0 / _1097;
    float _1167 = _395 + (-0.5);
    float _1169 = fma(_1127, _1157, _1159);
    float _1171 = fma(_1161, _1019, _1019);
    float _1173 = _403 + (-0.5);
    float _1175 = fma(_373, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1163);
    float _1177 = fma(_541, _1161, _541);
    float _1179 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1171);
    float _1181 = _1169 * 0.15915493667125701904296875;
    float _1183 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1123);
    float _1185 = in.m_70.x;
    float _1187 = in.m_70.y;
    float _1189 = fma(_375, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1175);
    float _1191 = fma(_1177, _1157, _1179);
    float _1193 = fma(_1073, _1157, _1183);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _1195;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _1199;
    float _1203 = _1189 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1205 = _1193 * 0.15915493667125701904296875;
    float _1207 = fma(_763, _727, _963);
    float _1209 = fma(_1197, _563, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _1211 = fma(_1201, _563, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _1213 = trunc(_1055);
    int _1215 = int(_1213);
    float _1217 = _1191 * 0.15915493667125701904296875;
    float _1219 = fma(_767, _727, _967);
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1223 = _1165 * _1221;
    float _1225 = fma(_815, _703, _1207);
    float _1227 = fma(_821, _703, _1219);
    float _1229 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _1231 = trunc(_1203);
    int _1233 = int(_1231);
    bool _1235 = _1223 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1237 = fma(_1209, _699, _1225);
    bool _1239 = _1223 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1241 = fma(_1211, _699, _1227);
    float _1243 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1245 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1237);
    float _1247 = _1181 * 6.283185482025146484375;
    float _1249 = sin(_1247);
    float _1251 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1241);
    float _1253 = _1245 * _1185;
    int _1255 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1257 = _1215 + _1255;
    int _1259 = _1257 + 1;
    bool _1261 = !_1235;
    int _1263 = _1261 ? 0 : 1;
    float _1265 = _1251 * _1187;
    int _1267 = 2;
    int _1269 = _1259;
    if (!_1235)
    {
        _1267 = 1;
    }
    int _1271 = _1267;
    float _1273 = _1205 * 6.283185482025146484375;
    float _1275 = sin(_1273);
    int _1277 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1279 = _1233 + _1277;
    int _1281 = _1279 + 1;
    float _1283 = _1265 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1285 = _1259 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1287 = _1259 | _1281;
    int _1289 = _1271;
    if (!_1239)
    {
        _1289 = _1263;
    }
    int _1291 = _1289;
    float _1293 = _1205 * 6.283185482025146484375;
    float _1295 = cos(_1293);
    bool _1297 = _1287 < 0;
    bool _1299 = _1297 || _1285;
    float _1301 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1303 = _1291 << 6;
    bool _1305 = _1281 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1307 = _1305 || _1299;
    float _1309 = _1301 * _1229;
    int _1311 = _1303 + 104;
    uint _1314 = uint(int(uint(_1311) >> uint(2)));
    uint _1316 = uint(int(uint(int(_1314)) >> uint(2)));
    int _1318 = int(_1314) & 3;
    float _1320 = (*spvDescriptorSet0.vp_c15)._m0[int(_1316)][_1318];
    int _1322 = int(_1314) + 1;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    int _1326 = _1322 & 3;
    float _1328 = (*spvDescriptorSet0.vp_c15)._m0[int(_1324)][_1326];
    float _1330 = _1181 * 6.283185482025146484375;
    float _1332 = cos(_1330);
    float _1334 = _1249 * _1275;
    int _1336 = _1303 + 64;
    uint _1338 = uint(int(uint(_1336) >> uint(2)));
    uint _1340 = uint(int(uint(int(_1338)) >> uint(2)));
    int _1342 = int(_1338) & 3;
    float _1344 = (*spvDescriptorSet0.vp_c15)._m0[int(_1340)][_1342];
    int _1346 = int(_1338) + 1;
    uint _1348 = uint(int(uint(_1346) >> uint(2)));
    int _1350 = _1346 & 3;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[int(_1348)][_1350];
    float _1354 = _1217 * 6.283185482025146484375;
    float _1356 = cos(_1354);
    float _1358 = _1249 * _1295;
    int _1360 = as_type<int>(_1309);
    float _1362 = as_type<float>(_1291);
    if (!_1307)
    {
        int _1364 = _1281 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1366 = _1364 + _1259;
        _1269 = _1366;
    }
    int _1368 = _1269;
    float _1370 = _1217 * 6.283185482025146484375;
    float _1372 = sin(_1370);
    float _1374 = _1332 * _1295;
    float _1376 = _1332 * _1275;
    float _1378 = _1249 * _1356;
    float _1380 = _1295 * _1356;
    float _1382 = _1332 * _1356;
    float _1384 = _1275 * _1356;
    float _1386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    int _1388 = _1303 + 72;
    uint _1390 = uint(int(uint(_1388) >> uint(2)));
    uint _1392 = uint(int(uint(int(_1390)) >> uint(2)));
    int _1394 = int(_1390) & 3;
    float _1396 = (*spvDescriptorSet0.vp_c15)._m0[int(_1392)][_1394];
    int _1398 = int(_1390) + 1;
    uint _1400 = uint(int(uint(_1398) >> uint(2)));
    int _1402 = _1398 & 3;
    float _1404 = (*spvDescriptorSet0.vp_c15)._m0[int(_1400)][_1402];
    float _1406 = 0.0;
    if (!_1307)
    {
        float _1408 = floor(_1055);
        _1406 = _1408;
    }
    float _1410 = _1406;
    float _1412 = _1283 * _1386;
    float _1414 = -_1376;
    float _1416 = fma(_1372, _1358, _1414);
    float _1418 = -_1358;
    float _1420 = fma(_1372, _1376, _1418);
    float _1422 = fma(_1372, _1374, _1334);
    float _1424 = _1382 * _1412;
    int _1426 = _1303 + 96;
    uint _1428 = uint(int(uint(_1426) >> uint(2)));
    uint _1430 = uint(int(uint(int(_1428)) >> uint(2)));
    int _1432 = int(_1428) & 3;
    float _1434 = (*spvDescriptorSet0.vp_c15)._m0[int(_1430)][_1432];
    int _1436 = int(_1428) + 1;
    uint _1438 = uint(int(uint(_1436) >> uint(2)));
    int _1440 = _1436 & 3;
    float _1442 = (*spvDescriptorSet0.vp_c15)._m0[int(_1438)][_1440];
    float _1444 = fma(_1372, _1334, _1374);
    float _1446 = -_1412;
    float _1448 = _1372 * _1446;
    float _1450 = fma(_1422, _1309, _1424);
    float _1452 = _1378 * _1412;
    float _1454 = 0.0;
    float _1456 = _1410;
    if (!_1307)
    {
        float _1458 = floor(_1203);
        _1454 = _1458;
    }
    float _1460 = _1454;
    float _1462 = fma(_1380, _1309, _1448);
    float _1464 = fma(_1420, _1243, _1450);
    int _1466 = _1303 + 48;
    uint _1468 = uint(int(uint(_1466) >> uint(2)));
    uint _1470 = uint(int(uint(int(_1468)) >> uint(2)));
    int _1472 = int(_1468) & 3;
    float _1474 = (*spvDescriptorSet0.vp_c15)._m0[int(_1470)][_1472];
    int _1476 = int(_1468) + 1;
    uint _1478 = uint(int(uint(_1476) >> uint(2)));
    int _1480 = _1476 & 3;
    float _1482 = (*spvDescriptorSet0.vp_c15)._m0[int(_1478)][_1480];
    float _1484 = fma(_1416, _1309, _1452);
    float _1486 = fma(_1384, _1243, _1462);
    float _1488 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1490 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1492 = fma(_1444, _1243, _1484);
    int _1494 = as_type<int>(_1462);
    float _1496 = _1460;
    if (!_1307)
    {
        int _1498 = _1368 << 2;
        _1360 = _1498;
    }
    int _1500 = _1360;
    float _1502 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1488);
    int _1504 = _1303 + 56;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
    int _1510 = int(_1506) & 3;
    float _1512 = (*spvDescriptorSet0.vp_c15)._m0[int(_1508)][_1510];
    int _1514 = int(_1506) + 1;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    int _1518 = _1514 & 3;
    float _1520 = (*spvDescriptorSet0.vp_c15)._m0[int(_1516)][_1518];
    float _1522 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1490);
    int _1524 = _1500;
    if (!_1307)
    {
        uint _1526 = uint(int(uint(_1368) >> uint(2)));
        _1494 = int(_1526);
    }
    int _1528 = _1494;
    float _1530 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1502);
    if (!_1307)
    {
        int _1532 = 12 & _1500;
        _1524 = _1532;
    }
    int _1534 = _1524;
    float _1536 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1522);
    float _1538 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1540 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    if (!_1307)
    {
        int _1542 = _1528 << 4;
        int _1544 = _1542 + _1534;
        _1089 = as_type<float>(_1544);
    }
    float _1546 = _1089;
    float _1548 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1550 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1538);
    float _1552 = _375 + _1540;
    float _1554 = _1003 * _1352;
    float _1556 = _373 + _1548;
    float _1558 = _1546;
    float _1560 = _1556;
    float _1562 = _1552;
    if (!_1307)
    {
        int _1564 = as_type<int>(_1546) + 400;
        uint _1566 = uint(int(uint(_1564) >> uint(2)));
        uint _1568 = uint(int(uint(int(_1566)) >> uint(2)));
        int _1570 = int(_1566) & 3;
        float _1572 = (*spvDescriptorSet0.vp_c15)._m0[int(_1568)][_1570];
        _1558 = _1572;
    }
    float _1574 = _1558;
    float _1576 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1578 = _1552 + _1576;
    float _1580 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1550);
    float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1584 = _1556 + _1582;
    float _1586 = fma(_373, _1344, _1554);
    float _1588 = _1578 * _1578;
    int _1590 = _1303 + 80;
    uint _1592 = uint(int(uint(_1590) >> uint(2)));
    uint _1594 = uint(int(uint(int(_1592)) >> uint(2)));
    int _1596 = int(_1592) & 3;
    float _1598 = (*spvDescriptorSet0.vp_c15)._m0[int(_1594)][_1596];
    int _1600 = int(_1592) + 1;
    uint _1602 = uint(int(uint(_1600) >> uint(2)));
    int _1604 = _1600 & 3;
    float _1606 = (*spvDescriptorSet0.vp_c15)._m0[int(_1602)][_1604];
    float _1608 = fma(_1584, _1584, _1588);
    float _1610 = sqrt(_1608);
    int _1612 = _1303 + 88;
    uint _1614 = uint(int(uint(_1612) >> uint(2)));
    uint _1616 = uint(int(uint(int(_1614)) >> uint(2)));
    int _1618 = int(_1614) & 3;
    float _1620 = (*spvDescriptorSet0.vp_c15)._m0[int(_1616)][_1618];
    int _1622 = int(_1614) + 1;
    uint _1624 = uint(int(uint(_1622) >> uint(2)));
    int _1626 = _1622 & 3;
    float _1628 = (*spvDescriptorSet0.vp_c15)._m0[int(_1624)][_1626];
    float _1630 = _1003 * _1442;
    float _1632 = fma(_373, _1434, _1630);
    float _1634 = _1003 * _1482;
    float _1636 = fma(_375, _1320, _1632);
    float _1638 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1640 = _1610 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1642 = fma(_373, _1474, _1634);
    float _1644 = _1636 + _1328;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1648 = _1646 != 0;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1652 = _1650 != 0;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1656 = _1654 != 0;
    int _1658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1660 = _1658 != 0;
    float _1662 = fma(_375, _1512, _1642);
    float _1664 = fma(_375, _1396, _1586);
    float _1666 = _469 + _1638;
    float _1668 = _1662 + _1520;
    bool _1670 = !_1652;
    int _1672 = _1670 ? 0 : 1;
    float _1674 = 1.0 / _1644;
    float _1676 = _1664 + _1404;
    bool _1678 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1680 = isnan(0.5);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1686 = _1682 || _1684;
    bool _1688 = !_1648;
    int _1690 = _1688 ? 0 : 1;
    bool _1692 = !_1656;
    int _1694 = _1692 ? 0 : 1;
    bool _1696 = !_1660;
    int _1698 = _1696 ? 0 : 1;
    float _1700 = _1638;
    float _1702 = _1662;
    if (!_1640)
    {
        _1700 = _1666;
    }
    float _1704 = _1700;
    bool _1706 = !_1640;
    float _1708 = _1704;
    if (!_1706)
    {
        float _1710 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1712 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1714 = _1610 + _1712;
        float _1716 = _1666 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1718 = rsqrt(_1608);
        float _1720 = _1714 * _1710;
        float _1722 = _1720 * 0.15915493667125701904296875;
        float _1724 = _1722 * 6.283185482025146484375;
        float _1726 = cos(_1724);
        float _1728 = _1722 * 6.283185482025146484375;
        float _1730 = sin(_1728);
        float _1732 = _1726 + (-1.0);
        float _1734 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1736 = fma(_1730, _1716, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1738 = fma(_1666, _1726, _1734);
        float _1740 = _1718 * _1736;
        float _1742 = fma(_1584, _1740, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1744 = fma(_1578, _1740, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1560 = _1742;
        _1708 = _1738;
        _1562 = _1744;
        _1702 = _1730;
    }
    float _1746 = _1560;
    float _1748 = _1708;
    float _1750 = _1562;
    float _1752 = _1702;
    float _1754 = _1752;
    float _1756 = _1748;
    float _1758 = _1750;
    if (_1686)
    {
        _1754 = _1746;
    }
    float _1760 = _1754;
    float _1762 = _1760;
    if (!_1686)
    {
        float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1766 = _469 + _1764;
        float _1768 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1770 = _373 + _1768;
        float _1772 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1774 = -_469;
        float _1776 = _1774 + _1748;
        float _1778 = _1766 * _1766;
        float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1782 = _375 + _1780;
        float _1784 = -_375;
        float _1786 = _1784 + _1750;
        float _1788 = fma(_1770, _1770, _1778);
        float _1790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1792 = fma(_1782, _1782, _1788);
        float _1794 = sqrt(_1792);
        float _1796 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1798 = precise::min(_1794, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1800 = _1798 * _1790;
        float _1802 = _1796 * _1800;
        float _1804 = -_373;
        float _1806 = _1804 + _1746;
        float _1808 = fma(_1776, _1802, _469);
        float _1810 = fma(_1806, _1802, _373);
        float _1812 = fma(_1786, _1802, _375);
        _1756 = _1808;
        _1762 = _1810;
        _1758 = _1812;
    }
    float _1814 = _1756;
    float _1816 = _1762;
    float _1818 = _1758;
    float _1820 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1822 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1824 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1826 = _1668 * _1674;
    float _1828 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1820);
    float _1830 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1822);
    float _1832 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1824);
    if (!_1307)
    {
        float _1834 = rint(_1574);
        float _1836 = precise::max(_1834, 0.0);
        uint _1838 = uint(_1836);
        uint _1840 = clamp(_1838, 0u, 65535u);
        _771 = as_type<float>(_1840);
    }
    float _1842 = _771;
    float _1844 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1828);
    bool _1846 = _1826 >= 0.0;
    float _1848 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1850 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1832);
    float _1852 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1854 = _1676 * _1674;
    bool _1856 = _1826 <= 1.0;
    bool _1858 = _1856 && _1846;
    float _1860 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1848);
    float _1862 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1830);
    float _1864 = _1850 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1866 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1868 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1870 = _1862 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1872 = _1854 >= 0.0;
    bool _1874 = _1872 && _1858;
    float _1876 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1860);
    float _1878 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1866);
    float _1880 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1882 = _1854 <= 1.0;
    bool _1884 = _1882 && _1874;
    float _1886 = _1876 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1888 = _1003 * _1606;
    float _1890 = -_1880;
    float _1892 = fma(_1890, _1868, 1.0);
    float _1894 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1878);
    float _1896 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1898 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1900 = fma(_373, _1598, _1888);
    float _1902 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1894);
    float _1904 = log2(_1892);
    float _1906 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1896);
    float _1908 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1898);
    float _1910 = fma(_375, _1620, _1900);
    float _1912 = _1888;
    if (_1884)
    {
        float _1914 = float(_1291);
        _1362 = _1914;
    }
    float _1916 = _1362;
    float _1918 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1906);
    float _1920 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1908);
    float _1922 = _1910 + _1628;
    float _1924 = 1.0 / _1902;
    float _1926 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1918);
    float _1928 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1920);
    float _1930 = _1916;
    if (!_1307)
    {
        float _1932 = -_1460;
        float _1934 = _1203 + _1932;
        _1912 = _1934;
    }
    float _1936 = _1912;
    float _1938 = _1936;
    if (!_1307)
    {
        float _1940 = -_1410;
        float _1942 = _1055 + _1940;
        _1091 = _1942;
    }
    float _1944 = _1091;
    float _1946 = _1922 * _1674;
    float _1948 = _1896;
    if (_1884)
    {
        float _1950 = rint(_1916);
        float _1952 = precise::max(_1950, 0.0);
        uint _1954 = uint(_1952);
        uint _1956 = clamp(_1954, 0u, 65535u);
        _1948 = as_type<float>(_1956);
    }
    float _1958 = _1948;
    float _1960 = _1904 * 0.693147182464599609375;
    float _1962 = _1926 * _1924;
    float _1964 = _1928 * _1924;
    float _1966 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1968 = fma(_1962, 0.5, 0.5);
    float _1970 = fma(_1964, -0.5, 0.5);
    float _1972 = _1842;
    if (!_1307)
    {
        float3 _7123 = float3(_1944, _1936, float(as_type<int>(_1842)));
        float3 _7127 = select(_7123, float3(0.0), isnan(_7123));
        float _1974 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7127.xy, uint(rint(_7127.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7127.xy, uint(rint(_7127.z)), level(0.0)).x;
        _1972 = _1974;
    }
    float _1976 = _1972;
    float _1978 = _1854;
    if (_1884)
    {
        float3 _7142 = float3(_1826, _1854, float(as_type<int>(_1958)));
        float3 _7144 = select(_7142, float3(0.0), isnan(_7142));
        float _1980 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7144.xy, uint(rint(_7144.z)), _1946, level(0.0));
        _1978 = _1980;
    }
    float _1982 = _1978;
    float3 _7154 = float3(_1968, _1970, _1966);
    float _1984 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7154, float3(0.0), isnan(_7154)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7154, float3(0.0), isnan(_7154)), level(0.0)).x;
    float3 _7163 = float3(_1968, _1970, _1966);
    float4 _1987 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7163, float3(0.0), isnan(_7163)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7163, float3(0.0), isnan(_7163)), level(0.0)).xyzw;
    float _1989 = _1987.x;
    float _1991 = _1987.y;
    float _1993 = _1987.z;
    float _1995 = _1987.w;
    bool _1997 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1999 = isnan(0.5);
    bool _2001 = _1997 || _1999;
    bool _2003 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2005 = _2001 || _2003;
    if (_1307)
    {
        _1496 = 1.0;
    }
    float _2007 = _1496;
    float _2009 = _2007;
    if (_2005)
    {
        _1930 = 1.0;
    }
    float _2011 = _1930;
    float _2013 = _2011;
    if (_2005)
    {
        _1456 = 1.0;
    }
    float _2015 = _1456;
    float _2017 = _2015;
    if (!_2005)
    {
        float _2019 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2021 = _2019 * 0.15915493667125701904296875;
        float _2023 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2025 = _2021 * 6.283185482025146484375;
        float _2027 = cos(_2025);
        float _2029 = _2023 * 0.15915493667125701904296875;
        float _2031 = _2021 * 6.283185482025146484375;
        float _2033 = sin(_2031);
        float _2035 = 1.0 / _2027;
        float _2037 = _2029 * 6.283185482025146484375;
        float _2039 = cos(_2037);
        float _2041 = _2033 * _2035;
        float _2043 = _2029 * 6.283185482025146484375;
        float _2045 = sin(_2043);
        float _2047 = _2039 * _2041;
        float _2049 = 1.0 / _2047;
        float _2051 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2053 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2051;
        float _2055 = 1.0 / _2053;
        float _2057 = _2045 * _2049;
        float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2061 = fma(_1223, _2057, _2059);
        float _2063 = _2061 * _2055;
        float _2065 = precise::clamp(_2063, 0.0, 1.0);
        _1938 = _2029;
        _2017 = _2065;
    }
    float _2067 = _1938;
    float _2069 = _2017;
    float _2071 = _2067;
    if (!_2005)
    {
        float _2073 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2075 = _2073 * 0.15915493667125701904296875;
        float _2077 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2079 = _2075 * 6.283185482025146484375;
        float _2081 = cos(_2079);
        float _2083 = _2077 * 0.15915493667125701904296875;
        float _2085 = _2075 * 6.283185482025146484375;
        float _2087 = sin(_2085);
        float _2089 = 1.0 / _2081;
        float _2091 = _2083 * 6.283185482025146484375;
        float _2093 = cos(_2091);
        float _2095 = _2087 * _2089;
        float _2097 = _2083 * 6.283185482025146484375;
        float _2099 = sin(_2097);
        float _2101 = _2093 * _2095;
        float _2103 = 1.0 / _2101;
        float _2105 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2107 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2105;
        float _2109 = 1.0 / _2107;
        float _2111 = _2099 * _2103;
        float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2115 = fma(_1223, _2111, _2113);
        float _2117 = _2115 * _2109;
        float _2119 = precise::clamp(_2117, 0.0, 1.0);
        float _2121 = -_2119;
        float _2123 = _2121 + 1.0;
        _2071 = _2101;
        _2013 = _2123;
    }
    float _2125 = _2071;
    float _2127 = _2013;
    float _2129 = _2125;
    if (!_1307)
    {
        int _2131 = _1368 << 4;
        int _2133 = _2131 + 2048;
        uint _2135 = uint(int(uint(_2133) >> uint(2)));
        uint _2137 = uint(int(uint(int(_2135)) >> uint(2)));
        int _2139 = int(_2135) & 3;
        float _2141 = (*spvDescriptorSet0.vp_c15)._m0[int(_2137)][_2139];
        int _2143 = int(_2135) + 1;
        uint _2145 = uint(int(uint(_2143) >> uint(2)));
        int _2147 = _2143 & 3;
        float _2149 = (*spvDescriptorSet0.vp_c15)._m0[int(_2145)][_2147];
        int _2151 = _2133 + 8;
        uint _2153 = uint(int(uint(_2151) >> uint(2)));
        uint _2155 = uint(int(uint(int(_2153)) >> uint(2)));
        int _2157 = int(_2153) & 3;
        float _2159 = (*spvDescriptorSet0.vp_c15)._m0[int(_2155)][_2157];
        int _2161 = int(_2153) + 1;
        uint _2163 = uint(int(uint(_2161) >> uint(2)));
        int _2165 = _2161 & 3;
        float _2167 = (*spvDescriptorSet0.vp_c15)._m0[int(_2163)][_2165];
        float _2169 = _1003 * _2149;
        float _2171 = fma(_373, _2141, _2169);
        float _2173 = fma(_375, _2159, _2171);
        float _2175 = _2173 + _2167;
        float _2177 = precise::clamp(_2175, 0.0, 1.0);
        float _2179 = -_2177;
        float _2181 = _2179 + _1976;
        float _2183 = fma(_2181, 500.0, 1.5);
        float _2185 = exp2(_2183);
        float _2187 = 0.0 + _2185;
        float _2189 = precise::clamp(_2187, 0.0, 1.0);
        _2009 = _2189;
    }
    float _2191 = _2009;
    float _2193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2195 = _1814 + _2193;
    float _2197 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2199 = _1816 + _2197;
    float _2201 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2203 = _1818 + _2201;
    float _2205 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2207 = int(_2205);
    float _2209 = _2195 * _2195;
    int _2211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2213 = _2211 != 0;
    float _2215 = fma(_2199, _2199, _2209);
    float _2217 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2219 = int(_2217);
    float _2221 = fma(_2203, _2203, _2215);
    if (_2213)
    {
        _773 = 1.0;
    }
    float _2223 = _773;
    float _2225 = rsqrt(_2221);
    float _2227 = float(uint(_2207));
    float _2229 = _2223;
    if (!_2213)
    {
        _2229 = 7.345489978790283203125;
    }
    float _2231 = _2229;
    float _2233 = sqrt(_2221);
    float _2235 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2237 = _2199 * _2235;
    float _2239 = _2203 * _2235;
    float _2241 = _2237 * _2237;
    float _2243 = _2239 * _2239;
    float _2245 = _2241 + _2243;
    float _2247 = sqrt(_2245);
    bool _2249 = _2247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2253 = _2247 + _2251;
    float _2255 = _2203;
    float _2257 = _2253;
    float _2259 = _2239;
    float _2261 = _2241;
    float _2263 = _2243;
    if (_2249)
    {
        float _2265 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2255 = _2265;
    }
    float _2267 = _2255;
    if (_2249)
    {
        float _2269 = rsqrt(_2245);
        _2129 = _2269;
    }
    float _2271 = _2129;
    if (_2249)
    {
        float _2273 = _2253 * _2267;
        _2257 = _2273;
    }
    float _2275 = _2257;
    float _2277 = 0.0;
    if (_2249)
    {
        float _2279 = _2275 * 0.15915493667125701904296875;
        _2277 = _2279;
    }
    float _2281 = _2277;
    float _2283 = _1966;
    float _2285 = _2281;
    if (_2249)
    {
        float _2287 = _2281 * 6.283185482025146484375;
        float _2289 = sin(_2287);
        _2283 = _2289;
    }
    float _2291 = _2283;
    float _2293 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2295 = precise::max(0.0, _2293);
    float _2297 = _2267;
    float _2299 = _2295;
    if (_2249)
    {
        float _2301 = _2281 * 6.283185482025146484375;
        float _2303 = cos(_2301);
        _2297 = _2303;
    }
    float _2305 = _2297;
    float _2307 = -_2235;
    float _2309 = -_2295;
    float _2311 = fma(_2195, _2307, _2309);
    float _2313 = float(uint(_2219));
    float _2315 = _2311;
    if (_2249)
    {
        float _2317 = _2311 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2299 = _2317;
    }
    float _2319 = _2299;
    float _2321 = _2319;
    if (!_2249)
    {
        _2285 = _2237;
    }
    float _2323 = _2285;
    float _2325 = 1.0 / _2227;
    float _2327 = _2291;
    float _2329 = _2323;
    if (_2249)
    {
        float _2331 = fma(_2291, _2319, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2327 = _2331;
    }
    float _2333 = _2327;
    float _2335 = _2333;
    if (_2249)
    {
        float _2337 = _2271 * _2333;
        _2321 = _2337;
    }
    float _2339 = _2321;
    if (_2249)
    {
        float _2341 = _2305 + (-1.0);
        _2335 = _2341;
    }
    float _2343 = _2335;
    float _2345 = trunc(_917);
    int _2347 = int(_2345);
    int _2349 = ~_2219;
    int _2351 = _2349 + 1;
    float _2353 = _2343;
    if (_2249)
    {
        float _2355 = _2237 * _2339;
        _2329 = _2355;
    }
    float _2357 = _2329;
    if (_2249)
    {
        float _2359 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2353 = _2359;
    }
    float _2361 = _2353;
    if (_2249)
    {
        float _2363 = _2239 * _2339;
        _2259 = _2363;
    }
    float _2365 = _2259;
    if (_2249)
    {
        float _2367 = _2357 * _2357;
        _2261 = _2367;
    }
    float _2369 = _2261;
    if (_2249)
    {
        float _2371 = fma(_2311, _2305, _2361);
        _2315 = _2371;
    }
    float _2373 = _2315;
    if (_2249)
    {
        float _2375 = _2365 * _2365;
        _2263 = _2375;
    }
    float _2377 = _2263;
    int _2379 = as_type<int>(_2325) + (-2);
    float _2381 = 1.0 / _2313;
    float _2383 = fma(_2373, _2373, _2369);
    float _2385 = _2383 + _2377;
    float _2387 = float(uint(_2347));
    float _2389 = trunc(_1103);
    int _2391 = int(_2389);
    float _2393 = as_type<float>(_2379) * _2387;
    float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2397 = fma(_2233, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2395);
    float _2399 = precise::clamp(_2397, 0.0, 1.0);
    float _2401 = rsqrt(_2385);
    float _2403 = -_2399;
    float _2405 = _2403 + 1.0;
    int _2407 = as_type<int>(_2381) + (-2);
    float _2409 = abs(_2405);
    float _2411 = log2(_2409);
    float _2413 = float(uint(_2391));
    float _2415 = as_type<float>(_2407) * _2413;
    float _2417 = _2401 * _2357;
    float _2419 = trunc(_2393);
    float _2421 = precise::max(_2419, 0.0);
    uint _2423 = uint(_2421);
    float _2425 = _2401 * _2373;
    float _2427 = _2401 * _2365;
    float _2429 = _2417 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2431 = -_2429;
    float _2433 = fma(_2425, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2431);
    int _2435 = ~_2207;
    int _2437 = _2435 + 1;
    float _2439 = trunc(_2415);
    float _2441 = precise::max(_2439, 0.0);
    uint _2443 = uint(_2441);
    float _2445 = _2411 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2447 = -_2427;
    float _2449 = fma(_2447, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2433);
    float _2451 = fma(_2449, -0.5, 0.5);
    float _2453 = fma(_2449, 0.5, 0.5);
    int _2455 = _2437 * int(_2423);
    int _2457 = _2455 + _2347;
    float _2459 = exp2(_2445);
    float _2461 = fma(_2453, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2463 = float(uint(_2457));
    float _2465 = fma(_2453, _2461, -0.212114393711090087890625);
    int _2467 = _2351 * int(_2443);
    int _2469 = _2467 + _2391;
    float _2471 = sqrt(_2451);
    float _2473 = as_type<float>(_2379) * _2463;
    float _2475 = _2425 + 1.0;
    float _2477 = fma(_2453, _2465, 1.570728778839111328125);
    float _2479 = float(uint(_2469));
    float _2481 = trunc(_2473);
    float _2483 = precise::max(_2481, 0.0);
    uint _2485 = uint(_2483);
    float _2487 = -_2425;
    float _2489 = fma(_2459, _2475, _2487);
    float _2491 = fma(_2489, 0.5, 0.5);
    float _2493 = _2471 * 0.636619746685028076171875;
    float _2495 = -_2477;
    float _2497 = fma(_2493, _2495, 1.0);
    float _2499 = as_type<float>(_2407) * _2479;
    float2 _7899 = float2(_2497, _2491);
    float3 _2503 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7899, float2(0.0), isnan(_7899)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7899, float2(0.0), isnan(_7899)), level(0.0)).xyz;
    float _2505 = _2503.x;
    float _2507 = _2503.y;
    float _2509 = _2503.z;
    float _2511 = trunc(_2499);
    float _2513 = precise::max(_2511, 0.0);
    uint _2515 = uint(_2513);
    float _2517 = _2231 * _133;
    int _2519 = int(_2423) + int(_2485);
    float _2521 = _2411 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2523 = _2493;
    float _2525 = as_type<float>(_2485);
    if (_2213)
    {
        _2523 = _133;
    }
    float _2527 = _2523;
    float _2529 = -_393;
    float _2531 = _2529 + 1.0;
    float _2533 = _2527;
    if (_2213)
    {
        _2525 = 1.0;
    }
    float _2535 = _2525;
    out.m_74.x = _1816;
    out.m_74.y = _1814;
    out.m_74.z = _1818;
    bool _2537 = _133 > 0.5;
    float _2539 = exp2(_2521);
    float _2541 = _2535;
    if (!_2213)
    {
        _2533 = _403;
    }
    float _2543 = _2533;
    if (!_2213)
    {
        _2541 = 1.2345600128173828125;
    }
    float _2545 = _2541;
    int _2547 = ~_2207;
    int _2549 = _2547 + 1;
    float _2551 = floor(_2517);
    int _2553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2555 = _2553 != 0;
    float _2557 = _2543 * _2545;
    float _2559 = float(_2207);
    int _2561 = _2549 * _2519;
    int _2563 = _2561 + _2347;
    float _2565 = float(_2347);
    int _2567 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2569 = _2567 != 0;
    float _2571 = floor(_2557);
    bool _2573 = _2565 >= _2559;
    bool _2575 = isnan(_2565);
    bool _2577 = _2573 || _2575;
    bool _2579 = isnan(_2559);
    bool _2581 = _2577 || _2579;
    float _2583 = float(_2581);
    bool _2585 = uint(_2563) >= uint(_2207);
    int _2587 = int(_2443) + int(_2515);
    int _2589 = ~_2219;
    int _2591 = _2589 + 1;
    float _2593 = trunc(_2583);
    int _2595 = int(_2593);
    bool _2597 = _403 > 0.5;
    float _2599 = -_2551;
    float _2601 = _2517 + _2599;
    float _2603 = float(_2219);
    int _2605 = _2591 * _2587;
    int _2607 = _2605 + _2391;
    float _2609 = float(_2391);
    bool _2611 = !_2585;
    int _2613 = _2611 ? 0 : (-1);
    float _2615 = -_2571;
    float _2617 = _2557 + _2615;
    bool _2619 = _2609 >= _2603;
    bool _2621 = isnan(_2609);
    bool _2623 = _2619 || _2621;
    bool _2625 = isnan(_2603);
    bool _2627 = _2623 || _2625;
    float _2629 = float(_2627);
    int _2631 = ~_2519;
    int _2633 = _2631 + _2613;
    int _2635 = _2633 + 1;
    float _2637 = _2601 * _2559;
    bool _2639 = uint(_2607) >= uint(_2219);
    float _2641 = _2559 * _1143;
    int _2643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2645 = _2643 != 0;
    float _2647 = trunc(_2629);
    int _2649 = int(_2647);
    bool _2651 = !_2639;
    int _2653 = _2651 ? 0 : (-1);
    int _2655 = _2207 * _2635;
    int _2657 = _2655 + _2347;
    bool _2659 = !_2645;
    int _2661 = _2659 ? 0 : 1;
    float _2663 = _2617 * _2603;
    bool _2665 = _2207 == 0;
    float _2667 = _2603 * _1143;
    int _2669 = ~_2587;
    int _2671 = _2669 + _2653;
    int _2673 = _2671 + 1;
    float _2675 = trunc(_2637);
    int _2677 = int(_2675);
    int _2679 = ~_2595;
    int _2681 = _2679 + 1;
    int _2683 = _2681 + 1;
    bool _2685 = !_2665;
    int _2687 = _2685 ? _2657 : (-1);
    int _2689 = _2219 * _2673;
    int _2691 = _2689 + _2391;
    int _2693 = _2207 + (-1);
    int _2695 = abs(_909);
    float _2697 = trunc(_2641);
    int _2699 = int(_2697);
    int _2701 = _2687 * _2683;
    bool _2703 = _2219 == 0;
    int _2705 = abs(_2661);
    int _2707 = _2595 * _2693;
    int _2709 = _2707 + _2701;
    int _2711 = abs(_915);
    int _2713 = _2677 * _2705;
    int _2715 = _2713 + _2347;
    int _2717 = ~_2649;
    int _2719 = _2717 + 1;
    int _2721 = _2719 + 1;
    float _2723 = trunc(_2667);
    int _2725 = int(_2723);
    bool _2727 = !_2703;
    int _2729 = _2727 ? _2691 : (-1);
    int _2731 = _2709 * _2695;
    int _2733 = abs(_921);
    int _2735 = _2729 * _2721;
    bool _2737 = !_2555;
    int _2739 = _2737 ? 0 : 1;
    int _2741 = _2699 * _2711;
    int _2743 = _2741 + _2731;
    float _2745 = float(uint(_2715));
    float _2747 = trunc(_2663);
    int _2749 = int(_2747);
    int _2751 = abs(_2739);
    int _2753 = _2715 * _2733;
    int _2755 = _2753 + _2743;
    int _2757 = _2219 + (-1);
    float _2759 = as_type<float>(_2379) * _2745;
    int _2761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2763 = _2761 != 0;
    int _2765 = _2677 * _2751;
    int _2767 = _2765 + _2755;
    int _2769 = abs(_1690);
    int _2771 = _2649 * _2757;
    int _2773 = _2771 + _2735;
    int _2775 = abs(_1672);
    float _2777 = trunc(_2759);
    float _2779 = precise::max(_2777, 0.0);
    uint _2781 = uint(_2779);
    int _2783 = abs(_1694);
    float _2785 = float(uint(_2767));
    int _2787 = _2773 * _2775;
    bool _2789 = !_2763;
    int _2791 = _2789 ? 0 : 1;
    bool _2793 = _395 > 0.5;
    float _2795 = as_type<float>(_2379) * _2785;
    int _2797 = abs(_2791);
    float _2799 = in.m_63.w;
    int _2801 = ~_2207;
    int _2803 = _2801 + 1;
    int _2805 = _2725 * _2769;
    int _2807 = _2805 + _2787;
    int _2809 = abs(_1698);
    int _2811 = _2749 * _2797;
    int _2813 = _2811 + _2391;
    float _2815 = trunc(_2795);
    float _2817 = precise::max(_2815, 0.0);
    uint _2819 = uint(_2817);
    int _2821 = ~_2207;
    int _2823 = _2821 + 1;
    float _2825 = float(uint(_2813));
    int _2827 = _2813 * _2783;
    int _2829 = _2827 + _2807;
    float _2831 = abs(_1223);
    float _2833 = log2(_2831);
    float _2835 = as_type<float>(_2407) * _2825;
    float _2837 = -_217;
    int _2839 = _2537 ? as_type<int>(_2837) : as_type<int>(_217);
    int _2841 = _2803 * int(_2781);
    int _2843 = _2841 + _2715;
    int _2845 = _2749 * _2809;
    int _2847 = _2845 + _2829;
    bool _2849 = !_2569;
    float _2851 = _2849 ? _217 : as_type<float>(_2839);
    float _2853 = trunc(_2835);
    float _2855 = precise::max(_2853, 0.0);
    uint _2857 = uint(_2855);
    float _2859 = float(uint(_2843));
    int _2861 = _2823 * int(_2819);
    int _2863 = _2861 + _2767;
    float _2865 = float(uint(_2847));
    float _2867 = _2851 + 0.5;
    bool _2869 = _2799 > 0.5;
    float _2871 = float(uint(_2863));
    float _2873 = as_type<float>(_2407) * _2865;
    float _2875 = fma(_2867, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1141);
    float _2877 = as_type<float>(_2379) * _2859;
    int _2879 = ~_2219;
    int _2881 = _2879 + 1;
    float _2883 = as_type<float>(_2379) * _2871;
    int _2885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2887 = _2885 != 0;
    float _2889 = trunc(_2873);
    float _2891 = precise::max(_2889, 0.0);
    uint _2893 = uint(_2891);
    float _2895 = -_227;
    int _2897 = _2597 ? as_type<int>(_2895) : as_type<int>(_227);
    int _2899 = _2881 * int(_2857);
    int _2901 = _2899 + _2813;
    int _2903 = ~_2219;
    int _2905 = _2903 + 1;
    float _2907 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2909 = !_2887;
    float _2911 = _2909 ? _227 : as_type<float>(_2897);
    float _2913 = float(uint(_2901));
    float _2915 = trunc(_2883);
    float _2917 = precise::max(_2915, 0.0);
    uint _2919 = uint(_2917);
    int _2921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2923 = _2921 != 0;
    float _2925 = _2911 + (-0.5);
    float _2927 = -_217;
    int _2929 = _2793 ? as_type<int>(_2927) : as_type<int>(_217);
    int _2931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2933 = _2931 != 0;
    float _2935 = -_2925;
    float _2937 = -_551;
    float _2939 = fma(_2935, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2937);
    float _2941 = as_type<float>(_2407) * _2913;
    int _2943 = _2905 * int(_2893);
    int _2945 = _2943 + _2847;
    float _2947 = -_227;
    int _2949 = _2869 ? as_type<int>(_2947) : as_type<int>(_227);
    float _2951 = trunc(_2877);
    float _2953 = precise::max(_2951, 0.0);
    uint _2955 = uint(_2953);
    bool _2957 = !_2923;
    float _2959 = _2957 ? _217 : as_type<float>(_2929);
    float _2961 = float(uint(_2945));
    float _2963 = -_1145;
    float _2965 = _2963 + 1.0;
    bool _2967 = !_2933;
    float _2969 = _2967 ? _227 : as_type<float>(_2949);
    float _2971 = _2959 + 0.5;
    int _2973 = int(_2819) + int(_2919);
    float _2975 = as_type<float>(_2407) * _2961;
    float _2977 = -_2965;
    float _2979 = fma(_2851, _2977, _2875);
    float _2981 = -_1067;
    float _2983 = _2981 + 1.0;
    int _2985 = ~_2207;
    int _2987 = _2985 + 1;
    float _2989 = _2969 + (-0.5);
    float _2991 = fma(_2971, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1153);
    float _2993 = trunc(_2975);
    float _2995 = precise::max(_2993, 0.0);
    uint _2997 = uint(_2995);
    float _2999 = -_1147;
    float _3001 = _2999 + 1.0;
    int _3003 = _2987 * _2973;
    int _3005 = _3003 + _2767;
    float _3007 = -_2989;
    float _3009 = -_1045;
    float _3011 = fma(_3007, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3009);
    float _3013 = -_1149;
    float _3015 = _3013 + 1.0;
    float _3017 = fma(_2911, _3001, _2939);
    float _3019 = -_2983;
    float _3021 = fma(_2959, _3019, _2991);
    bool _3023 = uint(_3005) >= uint(_2207);
    float _3025 = fma(_2969, _3015, _3011);
    float _3027 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3029 = int(_2781) + int(_2955);
    float _3031 = exp2(_2907);
    bool _3033 = !_3023;
    int _3035 = _3033 ? 0 : (-1);
    out.m_76.x = _2979;
    out.m_76.y = _3017;
    out.m_76.z = _3021;
    out.m_76.w = _3025;
    int _3037 = ~_2219;
    int _3039 = _3037 + 1;
    float _3041 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3043 = int(_2893) + int(_2997);
    float _3045 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3047 = ~_2973;
    int _3049 = _3047 + _3035;
    int _3051 = _3049 + 1;
    float _3053 = trunc(_2941);
    float _3055 = precise::max(_3053, 0.0);
    uint _3057 = uint(_3055);
    int _3059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3061 = _3059 != 0;
    float _3063 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3041);
    int _3065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3067 = _3065 != 0;
    int _3069 = _2207 * _3051;
    int _3071 = _3069 + _2767;
    float _3073 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3075 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3077 = -_1372;
    float _3079 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3027);
    float _3081 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3083 = -_1372;
    float _3085 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3073);
    float _3087 = -_1372;
    float _3089 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3075);
    float _3091 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3079);
    int _3093 = _3039 * _3043;
    int _3095 = _3093 + _2847;
    float _3097 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3099 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3101 = fma(_3031, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3103 = precise::clamp(_3101, 0.0, 1.0);
    float _3105 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3085);
    bool _3107 = uint(_3095) >= uint(_2219);
    float _3109 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3081);
    bool _3111 = !_2665;
    int _3113 = _3111 ? _3071 : (-1);
    float _3115 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3089);
    bool _3117 = !_3107;
    int _3119 = _3117 ? 0 : (-1);
    float _3121 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3097);
    int _3123 = _3113 & 3;
    bool _3125 = _3123 != 0;
    float _3127 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3099);
    int _3129 = _3113 & 3;
    bool _3131 = _3129 != 0;
    float _3133 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3135 = ~_3043;
    int _3137 = _3135 + _3119;
    int _3139 = _3137 + 1;
    float _3141 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3045);
    int _3143 = _3125 ? 0 : 1;
    float _3145 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3133);
    bool _3147 = uint(_3129) > 1u;
    int _3149 = _2219 * _3139;
    int _3151 = _3149 + _2847;
    int _3153 = _3113 >> 31;
    float _3155 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3157 = ~_2207;
    int _3159 = _3157 + 1;
    float _3161 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3145);
    int _3163 = _3153 & 3;
    float _3165 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3109);
    bool _3167 = !_3131;
    int _3169 = _3167 ? 0 : 1;
    float _3171 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3127);
    int _3173 = _3113 + _3163;
    int _3175 = _3159 * _3029;
    int _3177 = _3175 + _2715;
    bool _3179 = !_2703;
    int _3181 = _3179 ? _3151 : (-1);
    float _3183 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3141);
    int _3185 = ~_3143;
    int _3187 = _3185 + 1;
    int _3189 = _3187 + 1;
    float _3191 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3193 = uint(_3129) >= 2u;
    float _3195 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3063);
    int _3197 = _3189;
    if (!_3147)
    {
        int _3199 = ~_3143;
        int _3201 = _3199 + 1;
        _3197 = _3201;
    }
    int _3203 = _3197;
    float _3205 = _3191 * _3091;
    bool _3207 = _3129 != 3;
    int _3209 = _3181 >> 31;
    float _3211 = fma(_3155, _3165, _3205);
    int _3213 = _3193 ? 0 : 1;
    int _3215 = _3173 >> 2;
    bool _3217 = uint(_3177) >= uint(_2207);
    int _3219 = _3209 & 3;
    int _3221 = _3215 << 4;
    int _3223 = _3221 + 368;
    int _3225 = _3181 + _3219;
    int _3227 = int(_2857) + int(_3057);
    uint _3229 = uint(int(uint(_3223) >> uint(2)));
    uint _3231 = uint(int(uint(int(_3229)) >> uint(2)));
    int _3233 = int(_3229) & 3;
    float _3235 = (*spvDescriptorSet0.vp_c9)._m0[int(_3231)][_3233];
    int _3237 = int(_3229) + 1;
    uint _3239 = uint(int(uint(_3237) >> uint(2)));
    int _3241 = _3237 & 3;
    float _3243 = (*spvDescriptorSet0.vp_c9)._m0[int(_3239)][_3241];
    int _3245 = ~_2219;
    int _3247 = _3245 + 1;
    int _3249 = ~_3213;
    int _3251 = _3249 + 1;
    int _3253 = _3251 + 1;
    int _3255 = _3225 >> 2;
    int _3257 = _3247 * _3227;
    int _3259 = _3257 + _2813;
    int _3261 = _3253;
    if (_3207)
    {
        int _3263 = ~_3213;
        int _3265 = _3263 + 1;
        _3261 = _3265;
    }
    int _3267 = _3261;
    int _3269 = _3181 & 3;
    bool _3271 = _3269 != 0;
    int _3273 = _3255 << 4;
    int _3275 = _3273 + 512;
    float _3277 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3121);
    bool _3279 = !_3271;
    int _3281 = _3279 ? 0 : 1;
    int _3283 = _3181 & 3;
    bool _3285 = _3283 != 0;
    int _3287 = _3275 + 8;
    uint _3289 = uint(int(uint(_3287) >> uint(2)));
    uint _3291 = uint(int(uint(int(_3289)) >> uint(2)));
    int _3293 = int(_3289) & 3;
    float _3295 = (*spvDescriptorSet0.vp_c9)._m0[int(_3291)][_3293];
    int _3297 = int(_3289) + 1;
    uint _3299 = uint(int(uint(_3297) >> uint(2)));
    int _3301 = _3297 & 3;
    float _3303 = (*spvDescriptorSet0.vp_c9)._m0[int(_3299)][_3301];
    bool _3305 = !_3217;
    int _3307 = _3305 ? 0 : (-1);
    out.m_78.x = _3165;
    out.m_78.y = _3277;
    out.m_78.z = _3171;
    bool _3309 = uint(_3259) >= uint(_2219);
    int _3311 = _3285 ? 0 : 1;
    bool _3313 = uint(_3269) >= 2u;
    uint _3315 = uint(int(uint(_3275) >> uint(2)));
    uint _3317 = uint(int(uint(int(_3315)) >> uint(2)));
    int _3319 = int(_3315) & 3;
    float _3321 = (*spvDescriptorSet0.vp_c9)._m0[int(_3317)][_3319];
    int _3323 = int(_3315) + 1;
    uint _3325 = uint(int(uint(_3323) >> uint(2)));
    int _3327 = _3323 & 3;
    float _3329 = (*spvDescriptorSet0.vp_c9)._m0[int(_3325)][_3327];
    int _3331 = ~_3029;
    int _3333 = _3331 + _3307;
    int _3335 = _3333 + 1;
    float _3337 = _3191 * _3105;
    int _3339 = _3313 ? 0 : 1;
    float _3341 = _3191 * _3115;
    bool _3343 = uint(_3269) > 1u;
    float _3345 = fma(_3155, _3277, _3337);
    bool _3347 = !_3309;
    int _3349 = _3347 ? 0 : (-1);
    int _3351 = _3223 + 8;
    uint _3353 = uint(int(uint(_3351) >> uint(2)));
    uint _3355 = uint(int(uint(int(_3353)) >> uint(2)));
    int _3357 = int(_3353) & 3;
    float _3359 = (*spvDescriptorSet0.vp_c9)._m0[int(_3355)][_3357];
    int _3361 = int(_3353) + 1;
    uint _3363 = uint(int(uint(_3361) >> uint(2)));
    int _3365 = _3361 & 3;
    float _3367 = (*spvDescriptorSet0.vp_c9)._m0[int(_3363)][_3365];
    bool _3369 = _3269 != 3;
    float _3371 = fma(_3155, _3171, _3341);
    int _3373 = ~_3311;
    int _3375 = _3373 + 1;
    int _3377 = _3375 + 1;
    int _3379 = _2207 * _3335;
    int _3381 = _3379 + _2715;
    int _3383 = ~_3227;
    int _3385 = _3383 + _3349;
    int _3387 = _3385 + 1;
    int _3389 = abs(_3203);
    int _3391 = abs(_3169);
    int _3393 = _2219 * _3387;
    int _3395 = _3393 + _2813;
    int _3397 = _3377;
    if (!_3343)
    {
        int _3399 = ~_3311;
        int _3401 = _3399 + 1;
        _3397 = _3401;
    }
    int _3403 = _3397;
    int _3405 = ~_3339;
    int _3407 = _3405 + 1;
    int _3409 = _3407 + 1;
    int _3411 = abs(_3403);
    int _3413 = ~_3389;
    int _3415 = _3413 + 1;
    int _3417 = _3415 + 1;
    int _3419 = _3409;
    if (_3369)
    {
        int _3421 = ~_3339;
        int _3423 = _3421 + 1;
        _3419 = _3423;
    }
    int _3425 = _3419;
    int _3427 = _3417 * as_type<int>(_3243);
    int _3429 = abs(_3267);
    int _3431 = abs(_3281);
    int _3433 = abs(_3425);
    int _3435 = ~_3391;
    int _3437 = _3435 + 1;
    int _3439 = _3437 + 1;
    int _3441 = ~_3411;
    int _3443 = _3441 + 1;
    int _3445 = _3443 + 1;
    int _3447 = _3439 * as_type<int>(_3235);
    int _3449 = _3447 + _3427;
    int _3451 = ~_3429;
    int _3453 = _3451 + 1;
    int _3455 = _3453 + 1;
    int _3457 = _3445 * as_type<int>(_3329);
    int _3459 = ~_3431;
    int _3461 = _3459 + 1;
    int _3463 = _3461 + 1;
    bool _3465 = _3129 != 3;
    bool _3467 = _3269 != 3;
    int _3469 = _3463 * as_type<int>(_3321);
    int _3471 = _3469 + _3457;
    int _3473 = ~_3433;
    int _3475 = _3473 + 1;
    int _3477 = _3475 + 1;
    int _3479 = _3455 * as_type<int>(_3359);
    int _3481 = _3479 + _3449;
    bool _3483 = !_3465;
    int _3485 = _3483 ? 0 : (-1);
    float _3487 = fma(_3191, _3191, 1.0);
    bool _3489 = !_3061;
    int _3491 = _3489 ? 0 : 1;
    int _3493 = _3477 * as_type<int>(_3295);
    int _3495 = _3493 + _3471;
    bool _3497 = !_3467;
    int _3499 = _3497 ? 0 : (-1);
    float _3501 = rsqrt(_3487);
    int _3503 = abs(_3485);
    bool _3505 = !_3067;
    int _3507 = _3505 ? 0 : 1;
    int _3509 = abs(_3491);
    int _3511 = abs(_3499);
    int _3513 = abs(_3507);
    float _3515 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3517 = _3191 * _3501;
    int _3519 = ~_3503;
    int _3521 = _3519 + 1;
    int _3523 = _3521 + 1;
    float _3525 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3515);
    int _3527 = ~_3511;
    int _3529 = _3527 + 1;
    int _3531 = _3529 + 1;
    float _3533 = -_3195;
    float _3535 = _3517 * _3533;
    int _3537 = ~_3509;
    int _3539 = _3537 + 1;
    int _3541 = _3539 + 1;
    int _3543 = _3523 * as_type<int>(_3367);
    int _3545 = _3543 + _3481;
    bool _3547 = !_2665;
    int _3549 = _3547 ? _3381 : (-1);
    int _3551 = _3531 * as_type<int>(_3303);
    int _3553 = _3551 + _3495;
    int _3555 = _3545 * _3541;
    bool _3557 = !_2703;
    int _3559 = _3557 ? _3395 : (-1);
    float _3561 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3525);
    int _3563 = ~_3513;
    int _3565 = _3563 + 1;
    int _3567 = _3565 + 1;
    int _3569 = _3549 * _3509;
    int _3571 = _3569 + _3555;
    float _3573 = -_3161;
    float _3575 = _3517 * _3573;
    float _3577 = _1926 + _1902;
    int _3579 = _3553 * _3567;
    float _3581 = fma(_3501, _3091, _3575);
    float _3583 = fma(_3501, _3105, _3535);
    float _3585 = _1902 * 0.5;
    int _3587 = _3559 * _3513;
    int _3589 = _3587 + _3579;
    float _3591 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3561);
    float _3593 = _3161 + _3211;
    float _3595 = fma(_1928, -0.5, _3585);
    float _3597 = float(_3571);
    float _3599 = _3591 + _1902;
    out.gl_Position.x = _1926;
    out.gl_Position.y = _1928;
    out.gl_Position.z = _3591;
    out.gl_Position.w = _1902;
    bool _3601 = _1223 <= 8000.0;
    bool _3603 = isnan(_1223);
    bool _3605 = _3601 || _3603;
    bool _3607 = isnan(8000.0);
    bool _3609 = _3605 || _3607;
    float _3611 = float(_3609);
    float _3613 = -_3183;
    float _3615 = _3517 * _3613;
    float _3617 = _3599 * 0.5;
    float _3619 = fma(_3103, -2.0, 3.0);
    float _3621 = _3103 * _3103;
    float _3623 = _3577 * 0.5;
    float _3625 = float(_3589);
    float _3627 = _3195 + _3345;
    float _3629 = _3621 * _3619;
    float _3631 = _3183 + _3371;
    out.m_80.x = _3623;
    out.m_80.y = _3595;
    out.m_80.z = _3617;
    out.m_80.w = _1902;
    float _3633 = fma(_3501, _3115, _3615);
    float _3635 = -_2539;
    float _3637 = _3635 + 1.0;
    float _3639 = -_3629;
    float _3641 = _3639 + 1.0;
    out.m_82.x = _3597;
    out.m_82.y = _3625;
    float _3643 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3645 = fma(_3641, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3629);
    float _3647 = _3641;
    float _3649 = _3643;
    float _3651 = _3581;
    if (!_1884)
    {
        _3647 = 1.0;
    }
    float _3653 = _3647;
    out.m_84.x = _3593;
    out.m_84.y = _3627;
    out.m_84.z = _3631;
    float _3655 = _3643 * _1984;
    float _3657 = _3653;
    if (_1884)
    {
        bool _3659 = _1982 >= _1946;
        bool _3661 = isnan(_1982);
        bool _3663 = _3659 || _3661;
        bool _3665 = isnan(_1946);
        bool _3667 = _3663 || _3665;
        float _3669 = float(_3667);
        _3657 = _3669;
    }
    float _3671 = _3657;
    float _3673 = -_3643;
    float _3675 = _3673 + 1.0;
    float _3677 = _3611 * _3645;
    float _3679 = _1995 * _3655;
    float _3681 = _2509 * _3655;
    bool _3683 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3685 = isnan(_2233);
    bool _3687 = _3683 || _3685;
    bool _3689 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3691 = _3687 || _3689;
    float _3693 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3695 = fma(_2505, _3679, _1989);
    float _3697 = fma(_2507, _3679, _1991);
    float _3699 = _1995 * _3675;
    float _3701 = fma(_1995, _3681, _1993);
    float _3703 = _2531 * _3693;
    float _3705 = precise::clamp(_3703, 0.0, 1.0);
    float _3707 = _3671 * _2191;
    out.m_86.x = _3581;
    out.m_86.y = _3583;
    out.m_86.z = _3633;
    float _3709 = -_3705;
    float _3711 = fma(_3709, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_88.x = _3695;
    out.m_88.y = _3697;
    out.m_88.z = _3701;
    out.m_88.w = _3699;
    float _3713 = _3675;
    float _3715 = _3693;
    if (!_3691)
    {
        _3649 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3717 = _3649;
    float _3719 = -_3707;
    float _3721 = fma(_3719, _3711, 1.0);
    float _3723 = precise::clamp(_3721, 0.0, 1.0);
    float _3725 = _3717;
    float _3727 = _3717;
    if (!_3691)
    {
        _3713 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3729 = _3713;
    float _3731 = _3729;
    float _3733 = _3729;
    if (!_3691)
    {
        _3715 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3735 = _3715;
    float _3737 = _3723 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3739 = _2069 * _2127;
    float _3741 = _3739;
    float _3743 = _3737;
    float _3745 = _3735;
    float _3747 = _3735;
    if (!_3691)
    {
        _3651 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3749 = _3651;
    out.m_90.x = _3737;
    float _3751 = _3739 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3753 = _3749;
    float _3755 = _3749;
    if (!_3691)
    {
        _3741 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3757 = _3741;
    float _3759 = _3757;
    float _3761 = _3757;
    if (!_3691)
    {
        _3743 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3763 = _3743;
    bool _3765 = !_3691;
    float _3767 = _3763;
    float _3769 = _3763;
    if (!_3765)
    {
        bool _3771 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3773 = isnan(_2233);
        bool _3775 = _3771 || _3773;
        bool _3777 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3779 = _3775 || _3777;
        if (!_3779)
        {
            float _3781 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3783 = _2233 + _3781;
            float _3785 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3787 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3785;
            float _3789 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3791 = _3789 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3793 = 1.0 / _3787;
            float _3795 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3797 = _3795 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3799 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3801 = _3799 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3803 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3805 = _3803 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3807 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3809 = _3807 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3811 = _3783 * _3793;
            float _3813 = precise::clamp(_3811, 0.0, 1.0);
            float _3815 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3817 = _3815 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3819 = fma(_3813, _3791, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3821 = fma(_3813, _3817, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3823 = fma(_3813, _3797, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3825 = fma(_3813, _3801, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3827 = fma(_3813, _3805, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3829 = fma(_3813, _3809, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3727 = _3823;
            _3769 = _3827;
            _3755 = _3819;
            _3747 = _3825;
            _3733 = _3821;
            _3761 = _3829;
            _3831 = true;
        }
        else
        {
            bool _3833 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3835 = isnan(_2233);
            bool _3837 = _3833 || _3835;
            bool _3839 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3841 = _3837 || _3839;
            if (!_3841)
            {
                _3753 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3843 = _3753;
            _3755 = _3843;
            if (!_3841)
            {
                _3725 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3845 = _3725;
            _3727 = _3845;
            if (!_3841)
            {
                _3731 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3847 = _3731;
            _3733 = _3847;
            if (!_3841)
            {
                _3745 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3849 = _3745;
            _3747 = _3849;
            if (!_3841)
            {
                _3767 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3851 = _3767;
            _3769 = _3851;
            if (!_3841)
            {
                _3759 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3853 = _3759;
            bool _3855 = !_3841;
            _3761 = _3853;
            if (!_3855)
            {
                bool _3857 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3859 = isnan(_2233);
                bool _3861 = _3857 || _3859;
                bool _3863 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3865 = _3861 || _3863;
                if (!_3865)
                {
                    float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3869 = _2233 + _3867;
                    float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3873 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3871;
                    float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3877 = _3875 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3879 = 1.0 / _3873;
                    float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3893 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3897 = _3869 * _3879;
                    float _3899 = precise::clamp(_3897, 0.0, 1.0);
                    float _3901 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3903 = _3901 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3905 = fma(_3899, _3877, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3907 = fma(_3899, _3903, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3909 = fma(_3899, _3883, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3911 = fma(_3899, _3887, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3913 = fma(_3899, _3891, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3915 = fma(_3899, _3895, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3727 = _3909;
                    _3769 = _3913;
                    _3755 = _3905;
                    _3747 = _3911;
                    _3733 = _3907;
                    _3761 = _3915;
                    _3831 = true;
                }
                else
                {
                    _3727 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3769 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3755 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3747 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3733 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3761 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3831 = false;
    float _3917 = _3727;
    float _3919 = _3769;
    float _3921 = _3755;
    float _3923 = _3747;
    float _3925 = _3733;
    float _3927 = _3761;
    float _3929 = fma(_3627, -0.5, 0.5);
    float _3931 = precise::clamp(_3929, 0.0, 1.0);
    float _3933 = -_3917;
    float _3935 = _3933 + _3919;
    float _3937 = _3751 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3939 = -_3921;
    float _3941 = _3939 + _3923;
    float _3943 = fma(_3931, _3935, _3917);
    out.m_92.x = 0.0;
    float _3945 = -_3925;
    float _3947 = _3945 + _3927;
    float _3949 = fma(_3931, _3941, _3921);
    float _3951 = _3943 * 0.586610972881317138671875;
    out.m_59.x = _3937;
    bool _3953 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3955 = fma(_3931, _3947, _3925);
    float _3957 = fma(_3949, 0.298911988735198974609375, _3951);
    bool _3959 = _2069 > 0.0;
    bool _3961 = isnan(_2069);
    bool _3963 = _3959 || _3961;
    bool _3965 = isnan(0.0);
    bool _3967 = _3963 || _3965;
    float _3969 = fma(_3955, 0.114477999508380889892578125, _3957);
    bool _3971 = _2127 <= 0.0;
    bool _3973 = !_3967;
    bool _3975 = _3971 || _3973;
    float _3977 = -_3969;
    float _3979 = _3949 + _3977;
    float _3981 = -_3969;
    float _3983 = _3943 + _3981;
    float _3985 = -_3969;
    float _3987 = _3955 + _3985;
    float _3989 = fma(_3979, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3969);
    float _3991 = fma(_3983, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3969);
    float _3993 = fma(_3987, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3969);
    bool _3995 = !_3953;
    if (!_3995)
    {
        float _3997 = -_1814;
        float _3999 = _3997 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4001 = -_1816;
        float _4003 = _4001 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4005 = -_1818;
        float _4007 = _4005 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4009 = _3999 * _3999;
        float _4011 = fma(_4003, _4003, _4009);
        float _4013 = fma(_4007, _4007, _4011);
        float _4015 = sqrt(_4013);
        float _4017 = rsqrt(_4013);
        float _4019 = -_4015;
        float _4021 = _4019 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4023 = _4021 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4025 = precise::clamp(_4023, 0.0, 1.0);
        float _4027 = _4003 * _4017;
        float _4029 = _3999 * _4017;
        float _4031 = abs(_4025);
        float _4033 = log2(_4031);
        float _4035 = _4007 * _4017;
        float _4037 = _4027 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4039 = _3627 * _4029;
        float _4041 = -_4029;
        float _4043 = -_4037;
        float _4045 = fma(_4041, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4043);
        float _4047 = fma(_3593, _4027, _4039);
        float _4049 = -_4035;
        float _4051 = fma(_4049, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4045);
        float _4053 = fma(_3631, _4035, _4047);
        float _4055 = precise::clamp(_4053, 0.0, 1.0);
        float _4057 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4059 = _4051 + _4057;
        float _4061 = _4033 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4063 = _4059 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4065 = precise::clamp(_4063, 0.0, 1.0);
        float _4067 = exp2(_4061);
        float _4069 = _4067 * _4065;
        float _4071 = _4055 * _4069;
        float _4073 = _4071 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4075 = _4071 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4077 = _4071 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _4073;
        out.m_92.y = _4075;
        out.m_92.z = _4077;
    }
    out.m_94.x = _3989;
    out.m_94.y = _3991;
    out.m_94.z = _3993;
    if (!_3975)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _4079 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4079;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3831 = false;
    bool _351 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_59.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4135 = as_type<float>(_129);
        out.gl_Position.z = _4135;
    }
    if (!_117)
    {
        return out;
    }
    float _131 = in.m_61.w;
    float _133 = in.m_63.x;
    bool _135 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_131);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_131;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_65.x = _133;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_59.x = 0.0;
    }
    int _165 = 0;
    if (_161)
    {
        float _167 = _163 * 5.0;
        _165 = as_type<int>(_167);
    }
    int _169 = _165;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4208 = as_type<float>(_169);
        out.gl_Position.z = _4208;
    }
    if (_161)
    {
        return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = in.m_70.w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_61.x;
    float _189 = in.m_61.y;
    float _191 = in.m_61.z;
    float _193 = in.m_56.x;
    float _195 = in.m_56.y;
    float _197 = in.m_56.z;
    int _199 = as_type<int>(_171) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_171) & 2;
    bool _205 = _203 != 0;
    float _207 = _171;
    if (!_185)
    {
        float _209 = _173 * _173;
        float _211 = _209 * 0.5;
        _207 = _211;
    }
    float _213 = _207;
    bool _215 = !_201;
    float _217 = _215 ? (-0.5) : 0.5;
    float _219 = _213;
    if (!_185)
    {
        float _221 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _221;
    }
    float _223 = _219;
    bool _225 = !_205;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_185;
    float _231 = _223;
    if (!_229)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = _173 * _235;
        float _245 = 1.0 / _239;
        float _247 = _241 * 0.693147182464599609375;
        float _249 = exp2(_243);
        float _251 = 1.0 / _247;
        float _253 = _249 + (-1.0);
        float _255 = -_253;
        float _257 = fma(_255, _251, _173);
        float _259 = _257 * _245;
        float _261 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _261;
    }
    float _263 = _231;
    float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _271 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _273 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _275 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _277 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[8].x, _271);
    float _279 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[8].y, _273);
    float _281 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[8].z, _275);
    float _283 = _273;
    if (!_185)
    {
        _283 = _173;
    }
    float _285 = _283;
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[10].x, _277);
    bool _289 = !_185;
    float _291 = _285;
    if (!_289)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = 1.0 / _299;
        float _303 = _173 * _295;
        float _305 = exp2(_303);
        float _307 = -_305;
        float _309 = _307 + 1.0;
        float _311 = _309 * _301;
        _291 = _311;
    }
    float _313 = _291;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _317 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[10].y, _279);
    float _319 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[10].z, _281);
    float _321 = fma(_313, _187, _287);
    float _323 = fma(_313, _189, _317);
    float _325 = fma(_313, _191, _319);
    float _327 = fma(_321, _175, _193);
    float _329 = fma(_323, _175, _195);
    float _331 = fma(_325, _175, _197);
    bool _333 = !_315;
    float _349;
    if (!_333)
    {
        float _335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _337 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _341 = _339 * _335;
        float _343 = floor(_341);
        float _345 = -_343;
        float _347 = _341 + _345;
        _349 = _347;
        _351 = true;
    }
    else
    {
        float _353 = float(_113);
        float _355 = 1.0 / _353;
        float _357 = _147 * _355;
        _349 = _357;
    }
    _351 = false;
    float _359 = _349;
    float _361 = _329 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _363 = _329 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _365 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[4].x, _361);
    float _367 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[6].x, _363);
    float _369 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[4].z, _365);
    float _371 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[6].z, _367);
    float _373 = _369 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _375 = _371 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _377 = fma(_373, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _379 = fma(_375, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _381 = floor(_377);
    float _383 = floor(_379);
    float _385 = -_381;
    float _387 = _377 + _385;
    float _389 = -_383;
    float _391 = _379 + _389;
    float2 _4576 = float2(_387, _391);
    float _393 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4576, float2(0.0), isnan(_4576)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4576, float2(0.0), isnan(_4576)), level(0.0)).x;
    float _395 = in.m_63.z;
    float _397 = _133 * 2.0;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _401 = _359 + _399;
    float _403 = in.m_63.y;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _413 = floor(_397);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _423 = 1.0 / _407;
    float _425 = _329 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _431 = _429 != 0;
    float _433 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[5].x, _425);
    float _435 = _133 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _437 = 1.0 / _411;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _443 = -_427;
    float _445 = fma(_435, 2.0, _443);
    bool _447 = _413 > 0.0;
    float _449 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[5].z, _433);
    bool _451 = _413 >= 0.0;
    bool _453 = isnan(_413);
    bool _455 = _451 || _453;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _463 = 1.0 / _421;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _467 = _359 + _465;
    float _469 = _449 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _471 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _473 = isnan(_359);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _483;
    float _487 = 1.0 / _417;
    float _489 = _467 * _437;
    float _491 = _403 * 2.0;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _497;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _503 = _359 + _501;
    float _505 = 1.0 / _441;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _507;
    float _511 = _403 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _513 = _503 * _463;
    float _515 = _133 + _395;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _519 = _359 + _517;
    float _521 = fma(_511, -2.0, _461);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _525 = _359 + _523;
    float _527 = 1.0 / _499;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _531 = _359 + _529;
    float _533 = _515 + (-1.0);
    float _535 = fma(_495, _513, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _537 = _531 * _423;
    float _539 = _395 * 2.0;
    float _541 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _543 = 1.0 / _509;
    float _545 = _401 * _505;
    float _547 = -_481;
    float _549 = _547 + 1.0;
    float _551 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _521);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _553;
    float _557 = floor(_539);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _561 = _359 + _559;
    float _563 = _519 * _527;
    float _565 = _561 * _487;
    float _567 = _133 + _403;
    float _569 = floor(_491);
    float _571 = _525 * _543;
    bool _573 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _575 = isnan(_359);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = _567 + (-1.0);
    float _587 = _395 + _403;
    float _589 = fma(_485, _565, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _591 = fma(_555, _565, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _593 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _595 = _587 + (-1.0);
    bool _597 = _557 > 0.0;
    float _599 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _601 = int(_599);
    bool _603 = _557 >= 0.0;
    bool _605 = isnan(_557);
    bool _607 = _603 || _605;
    bool _609 = isnan(0.0);
    bool _611 = _607 || _609;
    float _613 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _623;
    bool _627 = _569 > 0.0;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _633 = _569 >= 0.0;
    bool _635 = isnan(_569);
    bool _637 = _633 || _635;
    bool _639 = isnan(0.0);
    bool _641 = _637 || _639;
    float _643 = fma(_621, _537, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _645 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _647 = isnan(_359);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = fma(_625, _537, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _659 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _661 = isnan(_359);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _675 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _677 = isnan(_359);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -_655;
    float _689 = _687 + 1.0;
    float _691 = fma(_631, _489, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _693 = -_669;
    float _695 = _693 + 1.0;
    float _697 = fma(_673, _489, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _699 = _669 * _689;
    float _701 = fma(_617, _513, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _703 = _685 * _695;
    float _705 = -_685;
    float _707 = _705 + 1.0;
    bool _709 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _711 = isnan(_359);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _721;
    int _725 = _459 ? 0 : 1;
    float _727 = _583 * _707;
    float _729 = -_583;
    float _731 = _729 + 1.0;
    float _733 = -_719;
    float _735 = _733 + 1.0;
    float _737 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _739 = log2(_737);
    float _741 = _719 * _731;
    bool _743 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _745 = isnan(_359);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _755;
    float _759 = _481 * _735;
    float _761 = float(_601);
    float _763 = fma(_757, _571, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _765 = _753 * _549;
    float _767 = fma(_723, _571, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    int _769 = as_type<int>(_549);
    float _771 = _469;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_431)
    {
        _769 = 0;
    }
    int _775 = _769;
    float _777 = -_753;
    float _779 = _777 + 1.0;
    bool _781 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _783 = isnan(_359);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    int _797 = _775;
    if (!_431)
    {
        _797 = 1;
    }
    int _799 = _797;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    int _805 = _641 ? 0 : 1;
    float _807 = _791 * _779;
    bool _809 = _799 != 1;
    float _811 = -_791;
    float _813 = _811 + 1.0;
    float _815 = fma(_795, _545, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _817 = _589 * _807;
    float _819 = _591 * _807;
    float _821 = fma(_803, _545, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _823 = ~_725;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    float _829 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[143].x, _817);
    float _831 = 1.0 / _761;
    int _833 = _827;
    float _835 = _813;
    if (!_447)
    {
        int _837 = ~_725;
        int _839 = _837 + 1;
        _833 = _839;
    }
    int _841 = _833;
    float _843 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[143].y, _819);
    float _845 = _611 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _849 = _845;
    if (!_809)
    {
        _835 = _403;
    }
    float _851 = _835;
    float _853 = fma(_535, _765, _829);
    float _855 = _851;
    if (_809)
    {
        _855 = _133;
    }
    float _857 = _855;
    float _859 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _861 = int(_859);
    int _863 = ~as_type<int>(_845);
    int _865 = _863 + 1;
    int _867 = _865 + 1;
    float _869 = fma(_701, _765, _843);
    int _871 = _867;
    if (!_597)
    {
        int _873 = ~as_type<int>(_845);
        int _875 = _873 + 1;
        _871 = _875;
    }
    int _877 = _871;
    float _879 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[83].z, _847);
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _883 = _881 != 0;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _887 = _885 != 0;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _891 = _889 != 0;
    float _893 = fma(_643, _759, _853);
    float _895 = fma(_657, _759, _869);
    float _897 = _469 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _899 = ~_805;
    int _901 = _899 + 1;
    int _903 = _901 + 1;
    float _905 = _739 * _147;
    bool _907 = !_887;
    int _909 = _907 ? 0 : 1;
    float _911 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[11].x, _897);
    bool _913 = !_883;
    int _915 = _913 ? 0 : 1;
    float _917 = _831 * _147;
    bool _919 = !_891;
    int _921 = _919 ? 0 : 1;
    float _923 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[11].z, _911);
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _927 = _925 != 0;
    int _929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _931 = _929 != 0;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _935 = _933 != 0;
    float _937 = _469 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _939 = float(_861);
    float _941 = _923 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _943 = _903;
    float _945 = _923;
    if (!_627)
    {
        int _947 = ~_805;
        int _949 = _947 + 1;
        _943 = _949;
    }
    int _951 = _943;
    float _953 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[10].x, _937);
    bool _955 = !_931;
    float _957 = _955 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _959 = 1.0 / _939;
    float _961 = float(_113);
    float _963 = fma(_691, _741, _893);
    int _965 = abs(as_type<int>(_957));
    float _967 = fma(_697, _741, _895);
    float _969 = float(_841);
    float _971 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[10].z, _953);
    float _973 = float(_965);
    float _975 = 1.0 / _941;
    float _977 = _957;
    if (!_809)
    {
        _977 = _395;
    }
    float _979 = _977;
    float _981 = _971 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _983 = _979;
    if (_809)
    {
        _983 = _403;
    }
    float _985 = _983;
    float _987 = _973 * _969;
    float _989 = _981 + _941;
    float _991 = _985 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_809)
    {
        _945 = _403;
    }
    float _993 = _945;
    float _995 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _997 = _993;
    if (_809)
    {
        _997 = _133;
    }
    float _999 = _997;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1003 = _469 + _995;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1007 = 1.0 + _1005;
    float _1009 = _999 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1011 = fma(_991, -2.0, _1001);
    float _1013 = _1003 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1015 = in.m_72.x;
    float _1017 = in.m_72.y;
    float _1019 = in.m_72.z;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1023 = 1.0 / _1007;
    float _1025 = fma(_373, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1013);
    bool _1027 = !_935;
    int _1029 = _1027 ? 0 : 1;
    float _1031 = -_1021;
    float _1033 = fma(_1009, 2.0, _1031);
    float _1035 = _987 * (-2.0);
    int _1037 = abs(_1029);
    float _1039 = _989 * _975;
    float _1041 = _1039 * 0.5;
    float _1043 = exp2(_905);
    float _1045 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1011);
    float _1047 = fma(_375, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1025);
    bool _1049 = !_927;
    int _1051 = _1049 ? 0 : 1;
    float _1053 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1055 = _1047 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _1057 = abs(_1051);
    float _1059 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1053);
    float _1061 = float(_951);
    float _1063 = 1.0 / _961;
    float _1065 = float(_1057);
    float _1067 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _879);
    float _1069 = float(_877);
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1073 = fma(_613, _1035, _613);
    float _1075 = _1065 * _1069;
    bool _1077 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1079 = isnan(1.0);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1085 = _1081 || _1083;
    float _1087 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1071);
    float _1089 = _1061;
    float _1091 = _1055;
    if (!_809)
    {
        _849 = _395;
    }
    float _1093 = _849;
    float _1095 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1097 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1095);
    float _1099 = _1093;
    if (_809)
    {
        _1099 = _403;
    }
    float _1101 = _1099;
    float _1103 = _959 * _147;
    float _1105 = -_1043;
    float _1107 = _1105 + 1.0;
    float _1109 = _1075 * (-2.0);
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1113 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1115 = isnan(0.0);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1121 = _1117 || _1119;
    float _1123 = fma(_1035, _1017, _1017);
    float _1125 = float(_1037);
    float _1127 = fma(_593, _1109, _593);
    float _1129 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1111);
    float _1131 = _1121 ? _1107 : 0.0;
    float _1133 = fma(_1109, _1015, _1015);
    float _1135 = _133 + (-0.5);
    float _1137 = _1125 * _1061;
    float _1139 = -_147;
    float _1141 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[76].x, _445);
    float _1143 = _1063 * _147;
    float _1145 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1059);
    float _1147 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1087);
    float _1149 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1129);
    float _1151 = -_147;
    float _1153 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1033);
    if (_1085)
    {
        float _1155 = _1131 * _1023;
        _151 = _1155;
    }
    float _1157 = _151;
    float _1159 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1133);
    float _1161 = _1137 * (-2.0);
    float _1163 = _1003 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1165 = 1.0 / _1097;
    float _1167 = _395 + (-0.5);
    float _1169 = fma(_1127, _1157, _1159);
    float _1171 = fma(_1161, _1019, _1019);
    float _1173 = _403 + (-0.5);
    float _1175 = fma(_373, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1163);
    float _1177 = fma(_541, _1161, _541);
    float _1179 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1171);
    float _1181 = _1169 * 0.15915493667125701904296875;
    float _1183 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1123);
    float _1185 = in.m_70.x;
    float _1187 = in.m_70.y;
    float _1189 = fma(_375, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1175);
    float _1191 = fma(_1177, _1157, _1179);
    float _1193 = fma(_1073, _1157, _1183);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _1195;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _1199;
    float _1203 = _1189 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1205 = _1193 * 0.15915493667125701904296875;
    float _1207 = fma(_763, _727, _963);
    float _1209 = fma(_1197, _563, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _1211 = fma(_1201, _563, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _1213 = trunc(_1055);
    int _1215 = int(_1213);
    float _1217 = _1191 * 0.15915493667125701904296875;
    float _1219 = fma(_767, _727, _967);
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1223 = _1165 * _1221;
    float _1225 = fma(_815, _703, _1207);
    float _1227 = fma(_821, _703, _1219);
    float _1229 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _1231 = trunc(_1203);
    int _1233 = int(_1231);
    bool _1235 = _1223 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1237 = fma(_1209, _699, _1225);
    bool _1239 = _1223 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1241 = fma(_1211, _699, _1227);
    float _1243 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1245 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1237);
    float _1247 = _1181 * 6.283185482025146484375;
    float _1249 = sin(_1247);
    float _1251 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1241);
    float _1253 = _1245 * _1185;
    int _1255 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1257 = _1215 + _1255;
    int _1259 = _1257 + 1;
    bool _1261 = !_1235;
    int _1263 = _1261 ? 0 : 1;
    float _1265 = _1251 * _1187;
    int _1267 = 2;
    int _1269 = _1259;
    if (!_1235)
    {
        _1267 = 1;
    }
    int _1271 = _1267;
    float _1273 = _1205 * 6.283185482025146484375;
    float _1275 = sin(_1273);
    int _1277 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1279 = _1233 + _1277;
    int _1281 = _1279 + 1;
    float _1283 = _1265 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1285 = _1259 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1287 = _1259 | _1281;
    int _1289 = _1271;
    if (!_1239)
    {
        _1289 = _1263;
    }
    int _1291 = _1289;
    float _1293 = _1205 * 6.283185482025146484375;
    float _1295 = cos(_1293);
    bool _1297 = _1287 < 0;
    bool _1299 = _1297 || _1285;
    float _1301 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1303 = _1291 << 6;
    bool _1305 = _1281 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1307 = _1305 || _1299;
    float _1309 = _1301 * _1229;
    int _1311 = _1303 + 104;
    uint _1314 = uint(int(uint(_1311) >> uint(2)));
    uint _1316 = uint(int(uint(int(_1314)) >> uint(2)));
    int _1318 = int(_1314) & 3;
    float _1320 = (*spvDescriptorSet0.vp_c15)._m0[int(_1316)][_1318];
    int _1322 = int(_1314) + 1;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    int _1326 = _1322 & 3;
    float _1328 = (*spvDescriptorSet0.vp_c15)._m0[int(_1324)][_1326];
    float _1330 = _1181 * 6.283185482025146484375;
    float _1332 = cos(_1330);
    float _1334 = _1249 * _1275;
    int _1336 = _1303 + 64;
    uint _1338 = uint(int(uint(_1336) >> uint(2)));
    uint _1340 = uint(int(uint(int(_1338)) >> uint(2)));
    int _1342 = int(_1338) & 3;
    float _1344 = (*spvDescriptorSet0.vp_c15)._m0[int(_1340)][_1342];
    int _1346 = int(_1338) + 1;
    uint _1348 = uint(int(uint(_1346) >> uint(2)));
    int _1350 = _1346 & 3;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[int(_1348)][_1350];
    float _1354 = _1217 * 6.283185482025146484375;
    float _1356 = cos(_1354);
    float _1358 = _1249 * _1295;
    int _1360 = as_type<int>(_1309);
    float _1362 = as_type<float>(_1291);
    if (!_1307)
    {
        int _1364 = _1281 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1366 = _1364 + _1259;
        _1269 = _1366;
    }
    int _1368 = _1269;
    float _1370 = _1217 * 6.283185482025146484375;
    float _1372 = sin(_1370);
    float _1374 = _1332 * _1295;
    float _1376 = _1332 * _1275;
    float _1378 = _1249 * _1356;
    float _1380 = _1295 * _1356;
    float _1382 = _1332 * _1356;
    float _1384 = _1275 * _1356;
    float _1386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    int _1388 = _1303 + 72;
    uint _1390 = uint(int(uint(_1388) >> uint(2)));
    uint _1392 = uint(int(uint(int(_1390)) >> uint(2)));
    int _1394 = int(_1390) & 3;
    float _1396 = (*spvDescriptorSet0.vp_c15)._m0[int(_1392)][_1394];
    int _1398 = int(_1390) + 1;
    uint _1400 = uint(int(uint(_1398) >> uint(2)));
    int _1402 = _1398 & 3;
    float _1404 = (*spvDescriptorSet0.vp_c15)._m0[int(_1400)][_1402];
    float _1406 = 0.0;
    if (!_1307)
    {
        float _1408 = floor(_1055);
        _1406 = _1408;
    }
    float _1410 = _1406;
    float _1412 = _1283 * _1386;
    float _1414 = -_1376;
    float _1416 = fma(_1372, _1358, _1414);
    float _1418 = -_1358;
    float _1420 = fma(_1372, _1376, _1418);
    float _1422 = fma(_1372, _1374, _1334);
    float _1424 = _1382 * _1412;
    int _1426 = _1303 + 96;
    uint _1428 = uint(int(uint(_1426) >> uint(2)));
    uint _1430 = uint(int(uint(int(_1428)) >> uint(2)));
    int _1432 = int(_1428) & 3;
    float _1434 = (*spvDescriptorSet0.vp_c15)._m0[int(_1430)][_1432];
    int _1436 = int(_1428) + 1;
    uint _1438 = uint(int(uint(_1436) >> uint(2)));
    int _1440 = _1436 & 3;
    float _1442 = (*spvDescriptorSet0.vp_c15)._m0[int(_1438)][_1440];
    float _1444 = fma(_1372, _1334, _1374);
    float _1446 = -_1412;
    float _1448 = _1372 * _1446;
    float _1450 = fma(_1422, _1309, _1424);
    float _1452 = _1378 * _1412;
    float _1454 = 0.0;
    float _1456 = _1410;
    if (!_1307)
    {
        float _1458 = floor(_1203);
        _1454 = _1458;
    }
    float _1460 = _1454;
    float _1462 = fma(_1380, _1309, _1448);
    float _1464 = fma(_1420, _1243, _1450);
    int _1466 = _1303 + 48;
    uint _1468 = uint(int(uint(_1466) >> uint(2)));
    uint _1470 = uint(int(uint(int(_1468)) >> uint(2)));
    int _1472 = int(_1468) & 3;
    float _1474 = (*spvDescriptorSet0.vp_c15)._m0[int(_1470)][_1472];
    int _1476 = int(_1468) + 1;
    uint _1478 = uint(int(uint(_1476) >> uint(2)));
    int _1480 = _1476 & 3;
    float _1482 = (*spvDescriptorSet0.vp_c15)._m0[int(_1478)][_1480];
    float _1484 = fma(_1416, _1309, _1452);
    float _1486 = fma(_1384, _1243, _1462);
    float _1488 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1490 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1492 = fma(_1444, _1243, _1484);
    int _1494 = as_type<int>(_1462);
    float _1496 = _1460;
    if (!_1307)
    {
        int _1498 = _1368 << 2;
        _1360 = _1498;
    }
    int _1500 = _1360;
    float _1502 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1488);
    int _1504 = _1303 + 56;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
    int _1510 = int(_1506) & 3;
    float _1512 = (*spvDescriptorSet0.vp_c15)._m0[int(_1508)][_1510];
    int _1514 = int(_1506) + 1;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    int _1518 = _1514 & 3;
    float _1520 = (*spvDescriptorSet0.vp_c15)._m0[int(_1516)][_1518];
    float _1522 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1490);
    int _1524 = _1500;
    if (!_1307)
    {
        uint _1526 = uint(int(uint(_1368) >> uint(2)));
        _1494 = int(_1526);
    }
    int _1528 = _1494;
    float _1530 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1502);
    if (!_1307)
    {
        int _1532 = 12 & _1500;
        _1524 = _1532;
    }
    int _1534 = _1524;
    float _1536 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1522);
    float _1538 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1540 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    if (!_1307)
    {
        int _1542 = _1528 << 4;
        int _1544 = _1542 + _1534;
        _1089 = as_type<float>(_1544);
    }
    float _1546 = _1089;
    float _1548 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1550 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1538);
    float _1552 = _375 + _1540;
    float _1554 = _1003 * _1352;
    float _1556 = _373 + _1548;
    float _1558 = _1546;
    float _1560 = _1556;
    float _1562 = _1552;
    if (!_1307)
    {
        int _1564 = as_type<int>(_1546) + 400;
        uint _1566 = uint(int(uint(_1564) >> uint(2)));
        uint _1568 = uint(int(uint(int(_1566)) >> uint(2)));
        int _1570 = int(_1566) & 3;
        float _1572 = (*spvDescriptorSet0.vp_c15)._m0[int(_1568)][_1570];
        _1558 = _1572;
    }
    float _1574 = _1558;
    float _1576 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1578 = _1552 + _1576;
    float _1580 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1550);
    float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1584 = _1556 + _1582;
    float _1586 = fma(_373, _1344, _1554);
    float _1588 = _1578 * _1578;
    int _1590 = _1303 + 80;
    uint _1592 = uint(int(uint(_1590) >> uint(2)));
    uint _1594 = uint(int(uint(int(_1592)) >> uint(2)));
    int _1596 = int(_1592) & 3;
    float _1598 = (*spvDescriptorSet0.vp_c15)._m0[int(_1594)][_1596];
    int _1600 = int(_1592) + 1;
    uint _1602 = uint(int(uint(_1600) >> uint(2)));
    int _1604 = _1600 & 3;
    float _1606 = (*spvDescriptorSet0.vp_c15)._m0[int(_1602)][_1604];
    float _1608 = fma(_1584, _1584, _1588);
    float _1610 = sqrt(_1608);
    int _1612 = _1303 + 88;
    uint _1614 = uint(int(uint(_1612) >> uint(2)));
    uint _1616 = uint(int(uint(int(_1614)) >> uint(2)));
    int _1618 = int(_1614) & 3;
    float _1620 = (*spvDescriptorSet0.vp_c15)._m0[int(_1616)][_1618];
    int _1622 = int(_1614) + 1;
    uint _1624 = uint(int(uint(_1622) >> uint(2)));
    int _1626 = _1622 & 3;
    float _1628 = (*spvDescriptorSet0.vp_c15)._m0[int(_1624)][_1626];
    float _1630 = _1003 * _1442;
    float _1632 = fma(_373, _1434, _1630);
    float _1634 = _1003 * _1482;
    float _1636 = fma(_375, _1320, _1632);
    float _1638 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1640 = _1610 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1642 = fma(_373, _1474, _1634);
    float _1644 = _1636 + _1328;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1648 = _1646 != 0;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1652 = _1650 != 0;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1656 = _1654 != 0;
    int _1658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1660 = _1658 != 0;
    float _1662 = fma(_375, _1512, _1642);
    float _1664 = fma(_375, _1396, _1586);
    float _1666 = _469 + _1638;
    float _1668 = _1662 + _1520;
    bool _1670 = !_1652;
    int _1672 = _1670 ? 0 : 1;
    float _1674 = 1.0 / _1644;
    float _1676 = _1664 + _1404;
    bool _1678 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1680 = isnan(0.5);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1686 = _1682 || _1684;
    bool _1688 = !_1648;
    int _1690 = _1688 ? 0 : 1;
    bool _1692 = !_1656;
    int _1694 = _1692 ? 0 : 1;
    bool _1696 = !_1660;
    int _1698 = _1696 ? 0 : 1;
    float _1700 = _1638;
    float _1702 = _1662;
    if (!_1640)
    {
        _1700 = _1666;
    }
    float _1704 = _1700;
    bool _1706 = !_1640;
    float _1708 = _1704;
    if (!_1706)
    {
        float _1710 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1712 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1714 = _1610 + _1712;
        float _1716 = _1666 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1718 = rsqrt(_1608);
        float _1720 = _1714 * _1710;
        float _1722 = _1720 * 0.15915493667125701904296875;
        float _1724 = _1722 * 6.283185482025146484375;
        float _1726 = cos(_1724);
        float _1728 = _1722 * 6.283185482025146484375;
        float _1730 = sin(_1728);
        float _1732 = _1726 + (-1.0);
        float _1734 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1736 = fma(_1730, _1716, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1738 = fma(_1666, _1726, _1734);
        float _1740 = _1718 * _1736;
        float _1742 = fma(_1584, _1740, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1744 = fma(_1578, _1740, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1560 = _1742;
        _1708 = _1738;
        _1562 = _1744;
        _1702 = _1730;
    }
    float _1746 = _1560;
    float _1748 = _1708;
    float _1750 = _1562;
    float _1752 = _1702;
    float _1754 = _1752;
    float _1756 = _1748;
    float _1758 = _1750;
    if (_1686)
    {
        _1754 = _1746;
    }
    float _1760 = _1754;
    float _1762 = _1760;
    if (!_1686)
    {
        float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1766 = _469 + _1764;
        float _1768 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1770 = _373 + _1768;
        float _1772 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1774 = -_469;
        float _1776 = _1774 + _1748;
        float _1778 = _1766 * _1766;
        float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1782 = _375 + _1780;
        float _1784 = -_375;
        float _1786 = _1784 + _1750;
        float _1788 = fma(_1770, _1770, _1778);
        float _1790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1792 = fma(_1782, _1782, _1788);
        float _1794 = sqrt(_1792);
        float _1796 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1798 = precise::min(_1794, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1800 = _1798 * _1790;
        float _1802 = _1796 * _1800;
        float _1804 = -_373;
        float _1806 = _1804 + _1746;
        float _1808 = fma(_1776, _1802, _469);
        float _1810 = fma(_1806, _1802, _373);
        float _1812 = fma(_1786, _1802, _375);
        _1756 = _1808;
        _1762 = _1810;
        _1758 = _1812;
    }
    float _1814 = _1756;
    float _1816 = _1762;
    float _1818 = _1758;
    float _1820 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1822 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1824 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1826 = _1668 * _1674;
    float _1828 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1820);
    float _1830 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1822);
    float _1832 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1824);
    if (!_1307)
    {
        float _1834 = rint(_1574);
        float _1836 = precise::max(_1834, 0.0);
        uint _1838 = uint(_1836);
        uint _1840 = clamp(_1838, 0u, 65535u);
        _771 = as_type<float>(_1840);
    }
    float _1842 = _771;
    float _1844 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1828);
    bool _1846 = _1826 >= 0.0;
    float _1848 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1850 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1832);
    float _1852 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1854 = _1676 * _1674;
    bool _1856 = _1826 <= 1.0;
    bool _1858 = _1856 && _1846;
    float _1860 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1848);
    float _1862 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1830);
    float _1864 = _1850 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1866 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1868 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1870 = _1862 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1872 = _1854 >= 0.0;
    bool _1874 = _1872 && _1858;
    float _1876 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1860);
    float _1878 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1866);
    float _1880 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1882 = _1854 <= 1.0;
    bool _1884 = _1882 && _1874;
    float _1886 = _1876 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1888 = _1003 * _1606;
    float _1890 = -_1880;
    float _1892 = fma(_1890, _1868, 1.0);
    float _1894 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1878);
    float _1896 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1898 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1900 = fma(_373, _1598, _1888);
    float _1902 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1894);
    float _1904 = log2(_1892);
    float _1906 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1896);
    float _1908 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1898);
    float _1910 = fma(_375, _1620, _1900);
    float _1912 = _1888;
    if (_1884)
    {
        float _1914 = float(_1291);
        _1362 = _1914;
    }
    float _1916 = _1362;
    float _1918 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1906);
    float _1920 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1908);
    float _1922 = _1910 + _1628;
    float _1924 = 1.0 / _1902;
    float _1926 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1918);
    float _1928 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1920);
    float _1930 = _1916;
    if (!_1307)
    {
        float _1932 = -_1460;
        float _1934 = _1203 + _1932;
        _1912 = _1934;
    }
    float _1936 = _1912;
    float _1938 = _1936;
    if (!_1307)
    {
        float _1940 = -_1410;
        float _1942 = _1055 + _1940;
        _1091 = _1942;
    }
    float _1944 = _1091;
    float _1946 = _1922 * _1674;
    float _1948 = _1896;
    if (_1884)
    {
        float _1950 = rint(_1916);
        float _1952 = precise::max(_1950, 0.0);
        uint _1954 = uint(_1952);
        uint _1956 = clamp(_1954, 0u, 65535u);
        _1948 = as_type<float>(_1956);
    }
    float _1958 = _1948;
    float _1960 = _1904 * 0.693147182464599609375;
    float _1962 = _1926 * _1924;
    float _1964 = _1928 * _1924;
    float _1966 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1968 = fma(_1962, 0.5, 0.5);
    float _1970 = fma(_1964, -0.5, 0.5);
    float _1972 = _1842;
    if (!_1307)
    {
        float3 _7123 = float3(_1944, _1936, float(as_type<int>(_1842)));
        float3 _7127 = select(_7123, float3(0.0), isnan(_7123));
        float _1974 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7127.xy, uint(rint(_7127.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7127.xy, uint(rint(_7127.z)), level(0.0)).x;
        _1972 = _1974;
    }
    float _1976 = _1972;
    float _1978 = _1854;
    if (_1884)
    {
        float3 _7142 = float3(_1826, _1854, float(as_type<int>(_1958)));
        float3 _7144 = select(_7142, float3(0.0), isnan(_7142));
        float _1980 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7144.xy, uint(rint(_7144.z)), _1946, level(0.0));
        _1978 = _1980;
    }
    float _1982 = _1978;
    float3 _7154 = float3(_1968, _1970, _1966);
    float _1984 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7154, float3(0.0), isnan(_7154)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7154, float3(0.0), isnan(_7154)), level(0.0)).x;
    float3 _7163 = float3(_1968, _1970, _1966);
    float4 _1987 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7163, float3(0.0), isnan(_7163)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7163, float3(0.0), isnan(_7163)), level(0.0)).xyzw;
    float _1989 = _1987.x;
    float _1991 = _1987.y;
    float _1993 = _1987.z;
    float _1995 = _1987.w;
    bool _1997 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1999 = isnan(0.5);
    bool _2001 = _1997 || _1999;
    bool _2003 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2005 = _2001 || _2003;
    if (_1307)
    {
        _1496 = 1.0;
    }
    float _2007 = _1496;
    float _2009 = _2007;
    if (_2005)
    {
        _1930 = 1.0;
    }
    float _2011 = _1930;
    float _2013 = _2011;
    if (_2005)
    {
        _1456 = 1.0;
    }
    float _2015 = _1456;
    float _2017 = _2015;
    if (!_2005)
    {
        float _2019 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2021 = _2019 * 0.15915493667125701904296875;
        float _2023 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2025 = _2021 * 6.283185482025146484375;
        float _2027 = cos(_2025);
        float _2029 = _2023 * 0.15915493667125701904296875;
        float _2031 = _2021 * 6.283185482025146484375;
        float _2033 = sin(_2031);
        float _2035 = 1.0 / _2027;
        float _2037 = _2029 * 6.283185482025146484375;
        float _2039 = cos(_2037);
        float _2041 = _2033 * _2035;
        float _2043 = _2029 * 6.283185482025146484375;
        float _2045 = sin(_2043);
        float _2047 = _2039 * _2041;
        float _2049 = 1.0 / _2047;
        float _2051 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2053 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2051;
        float _2055 = 1.0 / _2053;
        float _2057 = _2045 * _2049;
        float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2061 = fma(_1223, _2057, _2059);
        float _2063 = _2061 * _2055;
        float _2065 = precise::clamp(_2063, 0.0, 1.0);
        _1938 = _2029;
        _2017 = _2065;
    }
    float _2067 = _1938;
    float _2069 = _2017;
    float _2071 = _2067;
    if (!_2005)
    {
        float _2073 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2075 = _2073 * 0.15915493667125701904296875;
        float _2077 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2079 = _2075 * 6.283185482025146484375;
        float _2081 = cos(_2079);
        float _2083 = _2077 * 0.15915493667125701904296875;
        float _2085 = _2075 * 6.283185482025146484375;
        float _2087 = sin(_2085);
        float _2089 = 1.0 / _2081;
        float _2091 = _2083 * 6.283185482025146484375;
        float _2093 = cos(_2091);
        float _2095 = _2087 * _2089;
        float _2097 = _2083 * 6.283185482025146484375;
        float _2099 = sin(_2097);
        float _2101 = _2093 * _2095;
        float _2103 = 1.0 / _2101;
        float _2105 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2107 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2105;
        float _2109 = 1.0 / _2107;
        float _2111 = _2099 * _2103;
        float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2115 = fma(_1223, _2111, _2113);
        float _2117 = _2115 * _2109;
        float _2119 = precise::clamp(_2117, 0.0, 1.0);
        float _2121 = -_2119;
        float _2123 = _2121 + 1.0;
        _2071 = _2101;
        _2013 = _2123;
    }
    float _2125 = _2071;
    float _2127 = _2013;
    float _2129 = _2125;
    if (!_1307)
    {
        int _2131 = _1368 << 4;
        int _2133 = _2131 + 2048;
        uint _2135 = uint(int(uint(_2133) >> uint(2)));
        uint _2137 = uint(int(uint(int(_2135)) >> uint(2)));
        int _2139 = int(_2135) & 3;
        float _2141 = (*spvDescriptorSet0.vp_c15)._m0[int(_2137)][_2139];
        int _2143 = int(_2135) + 1;
        uint _2145 = uint(int(uint(_2143) >> uint(2)));
        int _2147 = _2143 & 3;
        float _2149 = (*spvDescriptorSet0.vp_c15)._m0[int(_2145)][_2147];
        int _2151 = _2133 + 8;
        uint _2153 = uint(int(uint(_2151) >> uint(2)));
        uint _2155 = uint(int(uint(int(_2153)) >> uint(2)));
        int _2157 = int(_2153) & 3;
        float _2159 = (*spvDescriptorSet0.vp_c15)._m0[int(_2155)][_2157];
        int _2161 = int(_2153) + 1;
        uint _2163 = uint(int(uint(_2161) >> uint(2)));
        int _2165 = _2161 & 3;
        float _2167 = (*spvDescriptorSet0.vp_c15)._m0[int(_2163)][_2165];
        float _2169 = _1003 * _2149;
        float _2171 = fma(_373, _2141, _2169);
        float _2173 = fma(_375, _2159, _2171);
        float _2175 = _2173 + _2167;
        float _2177 = precise::clamp(_2175, 0.0, 1.0);
        float _2179 = -_2177;
        float _2181 = _2179 + _1976;
        float _2183 = fma(_2181, 500.0, 1.5);
        float _2185 = exp2(_2183);
        float _2187 = 0.0 + _2185;
        float _2189 = precise::clamp(_2187, 0.0, 1.0);
        _2009 = _2189;
    }
    float _2191 = _2009;
    float _2193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2195 = _1814 + _2193;
    float _2197 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2199 = _1816 + _2197;
    float _2201 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2203 = _1818 + _2201;
    float _2205 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2207 = int(_2205);
    float _2209 = _2195 * _2195;
    int _2211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2213 = _2211 != 0;
    float _2215 = fma(_2199, _2199, _2209);
    float _2217 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2219 = int(_2217);
    float _2221 = fma(_2203, _2203, _2215);
    if (_2213)
    {
        _773 = 1.0;
    }
    float _2223 = _773;
    float _2225 = rsqrt(_2221);
    float _2227 = float(uint(_2207));
    float _2229 = _2223;
    if (!_2213)
    {
        _2229 = 7.345489978790283203125;
    }
    float _2231 = _2229;
    float _2233 = sqrt(_2221);
    float _2235 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2237 = _2199 * _2235;
    float _2239 = _2203 * _2235;
    float _2241 = _2237 * _2237;
    float _2243 = _2239 * _2239;
    float _2245 = _2241 + _2243;
    float _2247 = sqrt(_2245);
    bool _2249 = _2247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2253 = _2247 + _2251;
    float _2255 = _2203;
    float _2257 = _2253;
    float _2259 = _2239;
    float _2261 = _2241;
    float _2263 = _2243;
    if (_2249)
    {
        float _2265 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2255 = _2265;
    }
    float _2267 = _2255;
    if (_2249)
    {
        float _2269 = rsqrt(_2245);
        _2129 = _2269;
    }
    float _2271 = _2129;
    if (_2249)
    {
        float _2273 = _2253 * _2267;
        _2257 = _2273;
    }
    float _2275 = _2257;
    float _2277 = 0.0;
    if (_2249)
    {
        float _2279 = _2275 * 0.15915493667125701904296875;
        _2277 = _2279;
    }
    float _2281 = _2277;
    float _2283 = _1966;
    float _2285 = _2281;
    if (_2249)
    {
        float _2287 = _2281 * 6.283185482025146484375;
        float _2289 = sin(_2287);
        _2283 = _2289;
    }
    float _2291 = _2283;
    float _2293 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2295 = precise::max(0.0, _2293);
    float _2297 = _2267;
    float _2299 = _2295;
    if (_2249)
    {
        float _2301 = _2281 * 6.283185482025146484375;
        float _2303 = cos(_2301);
        _2297 = _2303;
    }
    float _2305 = _2297;
    float _2307 = -_2235;
    float _2309 = -_2295;
    float _2311 = fma(_2195, _2307, _2309);
    float _2313 = float(uint(_2219));
    float _2315 = _2311;
    if (_2249)
    {
        float _2317 = _2311 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2299 = _2317;
    }
    float _2319 = _2299;
    float _2321 = _2319;
    if (!_2249)
    {
        _2285 = _2237;
    }
    float _2323 = _2285;
    float _2325 = 1.0 / _2227;
    float _2327 = _2291;
    float _2329 = _2323;
    if (_2249)
    {
        float _2331 = fma(_2291, _2319, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2327 = _2331;
    }
    float _2333 = _2327;
    float _2335 = _2333;
    if (_2249)
    {
        float _2337 = _2271 * _2333;
        _2321 = _2337;
    }
    float _2339 = _2321;
    if (_2249)
    {
        float _2341 = _2305 + (-1.0);
        _2335 = _2341;
    }
    float _2343 = _2335;
    float _2345 = trunc(_917);
    int _2347 = int(_2345);
    int _2349 = ~_2219;
    int _2351 = _2349 + 1;
    float _2353 = _2343;
    if (_2249)
    {
        float _2355 = _2237 * _2339;
        _2329 = _2355;
    }
    float _2357 = _2329;
    if (_2249)
    {
        float _2359 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2353 = _2359;
    }
    float _2361 = _2353;
    if (_2249)
    {
        float _2363 = _2239 * _2339;
        _2259 = _2363;
    }
    float _2365 = _2259;
    if (_2249)
    {
        float _2367 = _2357 * _2357;
        _2261 = _2367;
    }
    float _2369 = _2261;
    if (_2249)
    {
        float _2371 = fma(_2311, _2305, _2361);
        _2315 = _2371;
    }
    float _2373 = _2315;
    if (_2249)
    {
        float _2375 = _2365 * _2365;
        _2263 = _2375;
    }
    float _2377 = _2263;
    int _2379 = as_type<int>(_2325) + (-2);
    float _2381 = 1.0 / _2313;
    float _2383 = fma(_2373, _2373, _2369);
    float _2385 = _2383 + _2377;
    float _2387 = float(uint(_2347));
    float _2389 = trunc(_1103);
    int _2391 = int(_2389);
    float _2393 = as_type<float>(_2379) * _2387;
    float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2397 = fma(_2233, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2395);
    float _2399 = precise::clamp(_2397, 0.0, 1.0);
    float _2401 = rsqrt(_2385);
    float _2403 = -_2399;
    float _2405 = _2403 + 1.0;
    int _2407 = as_type<int>(_2381) + (-2);
    float _2409 = abs(_2405);
    float _2411 = log2(_2409);
    float _2413 = float(uint(_2391));
    float _2415 = as_type<float>(_2407) * _2413;
    float _2417 = _2401 * _2357;
    float _2419 = trunc(_2393);
    float _2421 = precise::max(_2419, 0.0);
    uint _2423 = uint(_2421);
    float _2425 = _2401 * _2373;
    float _2427 = _2401 * _2365;
    float _2429 = _2417 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2431 = -_2429;
    float _2433 = fma(_2425, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2431);
    int _2435 = ~_2207;
    int _2437 = _2435 + 1;
    float _2439 = trunc(_2415);
    float _2441 = precise::max(_2439, 0.0);
    uint _2443 = uint(_2441);
    float _2445 = _2411 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2447 = -_2427;
    float _2449 = fma(_2447, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2433);
    float _2451 = fma(_2449, -0.5, 0.5);
    float _2453 = fma(_2449, 0.5, 0.5);
    int _2455 = _2437 * int(_2423);
    int _2457 = _2455 + _2347;
    float _2459 = exp2(_2445);
    float _2461 = fma(_2453, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2463 = float(uint(_2457));
    float _2465 = fma(_2453, _2461, -0.212114393711090087890625);
    int _2467 = _2351 * int(_2443);
    int _2469 = _2467 + _2391;
    float _2471 = sqrt(_2451);
    float _2473 = as_type<float>(_2379) * _2463;
    float _2475 = _2425 + 1.0;
    float _2477 = fma(_2453, _2465, 1.570728778839111328125);
    float _2479 = float(uint(_2469));
    float _2481 = trunc(_2473);
    float _2483 = precise::max(_2481, 0.0);
    uint _2485 = uint(_2483);
    float _2487 = -_2425;
    float _2489 = fma(_2459, _2475, _2487);
    float _2491 = fma(_2489, 0.5, 0.5);
    float _2493 = _2471 * 0.636619746685028076171875;
    float _2495 = -_2477;
    float _2497 = fma(_2493, _2495, 1.0);
    float _2499 = as_type<float>(_2407) * _2479;
    float2 _7899 = float2(_2497, _2491);
    float3 _2503 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7899, float2(0.0), isnan(_7899)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7899, float2(0.0), isnan(_7899)), level(0.0)).xyz;
    float _2505 = _2503.x;
    float _2507 = _2503.y;
    float _2509 = _2503.z;
    float _2511 = trunc(_2499);
    float _2513 = precise::max(_2511, 0.0);
    uint _2515 = uint(_2513);
    float _2517 = _2231 * _133;
    int _2519 = int(_2423) + int(_2485);
    float _2521 = _2411 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2523 = _2493;
    float _2525 = as_type<float>(_2485);
    if (_2213)
    {
        _2523 = _133;
    }
    float _2527 = _2523;
    float _2529 = -_393;
    float _2531 = _2529 + 1.0;
    float _2533 = _2527;
    if (_2213)
    {
        _2525 = 1.0;
    }
    float _2535 = _2525;
    out.m_74.x = _1816;
    out.m_74.y = _1814;
    out.m_74.z = _1818;
    bool _2537 = _133 > 0.5;
    float _2539 = exp2(_2521);
    float _2541 = _2535;
    if (!_2213)
    {
        _2533 = _403;
    }
    float _2543 = _2533;
    if (!_2213)
    {
        _2541 = 1.2345600128173828125;
    }
    float _2545 = _2541;
    int _2547 = ~_2207;
    int _2549 = _2547 + 1;
    float _2551 = floor(_2517);
    int _2553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2555 = _2553 != 0;
    float _2557 = _2543 * _2545;
    float _2559 = float(_2207);
    int _2561 = _2549 * _2519;
    int _2563 = _2561 + _2347;
    float _2565 = float(_2347);
    int _2567 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2569 = _2567 != 0;
    float _2571 = floor(_2557);
    bool _2573 = _2565 >= _2559;
    bool _2575 = isnan(_2565);
    bool _2577 = _2573 || _2575;
    bool _2579 = isnan(_2559);
    bool _2581 = _2577 || _2579;
    float _2583 = float(_2581);
    bool _2585 = uint(_2563) >= uint(_2207);
    int _2587 = int(_2443) + int(_2515);
    int _2589 = ~_2219;
    int _2591 = _2589 + 1;
    float _2593 = trunc(_2583);
    int _2595 = int(_2593);
    bool _2597 = _403 > 0.5;
    float _2599 = -_2551;
    float _2601 = _2517 + _2599;
    float _2603 = float(_2219);
    int _2605 = _2591 * _2587;
    int _2607 = _2605 + _2391;
    float _2609 = float(_2391);
    bool _2611 = !_2585;
    int _2613 = _2611 ? 0 : (-1);
    float _2615 = -_2571;
    float _2617 = _2557 + _2615;
    bool _2619 = _2609 >= _2603;
    bool _2621 = isnan(_2609);
    bool _2623 = _2619 || _2621;
    bool _2625 = isnan(_2603);
    bool _2627 = _2623 || _2625;
    float _2629 = float(_2627);
    int _2631 = ~_2519;
    int _2633 = _2631 + _2613;
    int _2635 = _2633 + 1;
    float _2637 = _2601 * _2559;
    bool _2639 = uint(_2607) >= uint(_2219);
    float _2641 = _2559 * _1143;
    int _2643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2645 = _2643 != 0;
    float _2647 = trunc(_2629);
    int _2649 = int(_2647);
    bool _2651 = !_2639;
    int _2653 = _2651 ? 0 : (-1);
    int _2655 = _2207 * _2635;
    int _2657 = _2655 + _2347;
    bool _2659 = !_2645;
    int _2661 = _2659 ? 0 : 1;
    float _2663 = _2617 * _2603;
    bool _2665 = _2207 == 0;
    float _2667 = _2603 * _1143;
    int _2669 = ~_2587;
    int _2671 = _2669 + _2653;
    int _2673 = _2671 + 1;
    float _2675 = trunc(_2637);
    int _2677 = int(_2675);
    int _2679 = ~_2595;
    int _2681 = _2679 + 1;
    int _2683 = _2681 + 1;
    bool _2685 = !_2665;
    int _2687 = _2685 ? _2657 : (-1);
    int _2689 = _2219 * _2673;
    int _2691 = _2689 + _2391;
    int _2693 = _2207 + (-1);
    int _2695 = abs(_909);
    float _2697 = trunc(_2641);
    int _2699 = int(_2697);
    int _2701 = _2687 * _2683;
    bool _2703 = _2219 == 0;
    int _2705 = abs(_2661);
    int _2707 = _2595 * _2693;
    int _2709 = _2707 + _2701;
    int _2711 = abs(_915);
    int _2713 = _2677 * _2705;
    int _2715 = _2713 + _2347;
    int _2717 = ~_2649;
    int _2719 = _2717 + 1;
    int _2721 = _2719 + 1;
    float _2723 = trunc(_2667);
    int _2725 = int(_2723);
    bool _2727 = !_2703;
    int _2729 = _2727 ? _2691 : (-1);
    int _2731 = _2709 * _2695;
    int _2733 = abs(_921);
    int _2735 = _2729 * _2721;
    bool _2737 = !_2555;
    int _2739 = _2737 ? 0 : 1;
    int _2741 = _2699 * _2711;
    int _2743 = _2741 + _2731;
    float _2745 = float(uint(_2715));
    float _2747 = trunc(_2663);
    int _2749 = int(_2747);
    int _2751 = abs(_2739);
    int _2753 = _2715 * _2733;
    int _2755 = _2753 + _2743;
    int _2757 = _2219 + (-1);
    float _2759 = as_type<float>(_2379) * _2745;
    int _2761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2763 = _2761 != 0;
    int _2765 = _2677 * _2751;
    int _2767 = _2765 + _2755;
    int _2769 = abs(_1690);
    int _2771 = _2649 * _2757;
    int _2773 = _2771 + _2735;
    int _2775 = abs(_1672);
    float _2777 = trunc(_2759);
    float _2779 = precise::max(_2777, 0.0);
    uint _2781 = uint(_2779);
    int _2783 = abs(_1694);
    float _2785 = float(uint(_2767));
    int _2787 = _2773 * _2775;
    bool _2789 = !_2763;
    int _2791 = _2789 ? 0 : 1;
    bool _2793 = _395 > 0.5;
    float _2795 = as_type<float>(_2379) * _2785;
    int _2797 = abs(_2791);
    float _2799 = in.m_63.w;
    int _2801 = ~_2207;
    int _2803 = _2801 + 1;
    int _2805 = _2725 * _2769;
    int _2807 = _2805 + _2787;
    int _2809 = abs(_1698);
    int _2811 = _2749 * _2797;
    int _2813 = _2811 + _2391;
    float _2815 = trunc(_2795);
    float _2817 = precise::max(_2815, 0.0);
    uint _2819 = uint(_2817);
    int _2821 = ~_2207;
    int _2823 = _2821 + 1;
    float _2825 = float(uint(_2813));
    int _2827 = _2813 * _2783;
    int _2829 = _2827 + _2807;
    float _2831 = abs(_1223);
    float _2833 = log2(_2831);
    float _2835 = as_type<float>(_2407) * _2825;
    float _2837 = -_217;
    int _2839 = _2537 ? as_type<int>(_2837) : as_type<int>(_217);
    int _2841 = _2803 * int(_2781);
    int _2843 = _2841 + _2715;
    int _2845 = _2749 * _2809;
    int _2847 = _2845 + _2829;
    bool _2849 = !_2569;
    float _2851 = _2849 ? _217 : as_type<float>(_2839);
    float _2853 = trunc(_2835);
    float _2855 = precise::max(_2853, 0.0);
    uint _2857 = uint(_2855);
    float _2859 = float(uint(_2843));
    int _2861 = _2823 * int(_2819);
    int _2863 = _2861 + _2767;
    float _2865 = float(uint(_2847));
    float _2867 = _2851 + 0.5;
    bool _2869 = _2799 > 0.5;
    float _2871 = float(uint(_2863));
    float _2873 = as_type<float>(_2407) * _2865;
    float _2875 = fma(_2867, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1141);
    float _2877 = as_type<float>(_2379) * _2859;
    int _2879 = ~_2219;
    int _2881 = _2879 + 1;
    float _2883 = as_type<float>(_2379) * _2871;
    int _2885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2887 = _2885 != 0;
    float _2889 = trunc(_2873);
    float _2891 = precise::max(_2889, 0.0);
    uint _2893 = uint(_2891);
    float _2895 = -_227;
    int _2897 = _2597 ? as_type<int>(_2895) : as_type<int>(_227);
    int _2899 = _2881 * int(_2857);
    int _2901 = _2899 + _2813;
    int _2903 = ~_2219;
    int _2905 = _2903 + 1;
    float _2907 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2909 = !_2887;
    float _2911 = _2909 ? _227 : as_type<float>(_2897);
    float _2913 = float(uint(_2901));
    float _2915 = trunc(_2883);
    float _2917 = precise::max(_2915, 0.0);
    uint _2919 = uint(_2917);
    int _2921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2923 = _2921 != 0;
    float _2925 = _2911 + (-0.5);
    float _2927 = -_217;
    int _2929 = _2793 ? as_type<int>(_2927) : as_type<int>(_217);
    int _2931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2933 = _2931 != 0;
    float _2935 = -_2925;
    float _2937 = -_551;
    float _2939 = fma(_2935, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2937);
    float _2941 = as_type<float>(_2407) * _2913;
    int _2943 = _2905 * int(_2893);
    int _2945 = _2943 + _2847;
    float _2947 = -_227;
    int _2949 = _2869 ? as_type<int>(_2947) : as_type<int>(_227);
    float _2951 = trunc(_2877);
    float _2953 = precise::max(_2951, 0.0);
    uint _2955 = uint(_2953);
    bool _2957 = !_2923;
    float _2959 = _2957 ? _217 : as_type<float>(_2929);
    float _2961 = float(uint(_2945));
    float _2963 = -_1145;
    float _2965 = _2963 + 1.0;
    bool _2967 = !_2933;
    float _2969 = _2967 ? _227 : as_type<float>(_2949);
    float _2971 = _2959 + 0.5;
    int _2973 = int(_2819) + int(_2919);
    float _2975 = as_type<float>(_2407) * _2961;
    float _2977 = -_2965;
    float _2979 = fma(_2851, _2977, _2875);
    float _2981 = -_1067;
    float _2983 = _2981 + 1.0;
    int _2985 = ~_2207;
    int _2987 = _2985 + 1;
    float _2989 = _2969 + (-0.5);
    float _2991 = fma(_2971, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1153);
    float _2993 = trunc(_2975);
    float _2995 = precise::max(_2993, 0.0);
    uint _2997 = uint(_2995);
    float _2999 = -_1147;
    float _3001 = _2999 + 1.0;
    int _3003 = _2987 * _2973;
    int _3005 = _3003 + _2767;
    float _3007 = -_2989;
    float _3009 = -_1045;
    float _3011 = fma(_3007, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3009);
    float _3013 = -_1149;
    float _3015 = _3013 + 1.0;
    float _3017 = fma(_2911, _3001, _2939);
    float _3019 = -_2983;
    float _3021 = fma(_2959, _3019, _2991);
    bool _3023 = uint(_3005) >= uint(_2207);
    float _3025 = fma(_2969, _3015, _3011);
    float _3027 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3029 = int(_2781) + int(_2955);
    float _3031 = exp2(_2907);
    bool _3033 = !_3023;
    int _3035 = _3033 ? 0 : (-1);
    out.m_76.x = _2979;
    out.m_76.y = _3017;
    out.m_76.z = _3021;
    out.m_76.w = _3025;
    int _3037 = ~_2219;
    int _3039 = _3037 + 1;
    float _3041 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3043 = int(_2893) + int(_2997);
    float _3045 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3047 = ~_2973;
    int _3049 = _3047 + _3035;
    int _3051 = _3049 + 1;
    float _3053 = trunc(_2941);
    float _3055 = precise::max(_3053, 0.0);
    uint _3057 = uint(_3055);
    int _3059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3061 = _3059 != 0;
    float _3063 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3041);
    int _3065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3067 = _3065 != 0;
    int _3069 = _2207 * _3051;
    int _3071 = _3069 + _2767;
    float _3073 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3075 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3077 = -_1372;
    float _3079 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3027);
    float _3081 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3083 = -_1372;
    float _3085 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3073);
    float _3087 = -_1372;
    float _3089 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3075);
    float _3091 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3079);
    int _3093 = _3039 * _3043;
    int _3095 = _3093 + _2847;
    float _3097 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3099 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3101 = fma(_3031, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3103 = precise::clamp(_3101, 0.0, 1.0);
    float _3105 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3085);
    bool _3107 = uint(_3095) >= uint(_2219);
    float _3109 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3081);
    bool _3111 = !_2665;
    int _3113 = _3111 ? _3071 : (-1);
    float _3115 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3089);
    bool _3117 = !_3107;
    int _3119 = _3117 ? 0 : (-1);
    float _3121 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3097);
    int _3123 = _3113 & 3;
    bool _3125 = _3123 != 0;
    float _3127 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3099);
    int _3129 = _3113 & 3;
    bool _3131 = _3129 != 0;
    float _3133 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3135 = ~_3043;
    int _3137 = _3135 + _3119;
    int _3139 = _3137 + 1;
    float _3141 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3045);
    int _3143 = _3125 ? 0 : 1;
    float _3145 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3133);
    bool _3147 = uint(_3129) > 1u;
    int _3149 = _2219 * _3139;
    int _3151 = _3149 + _2847;
    int _3153 = _3113 >> 31;
    float _3155 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3157 = ~_2207;
    int _3159 = _3157 + 1;
    float _3161 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3145);
    int _3163 = _3153 & 3;
    float _3165 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3109);
    bool _3167 = !_3131;
    int _3169 = _3167 ? 0 : 1;
    float _3171 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3127);
    int _3173 = _3113 + _3163;
    int _3175 = _3159 * _3029;
    int _3177 = _3175 + _2715;
    bool _3179 = !_2703;
    int _3181 = _3179 ? _3151 : (-1);
    float _3183 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3141);
    int _3185 = ~_3143;
    int _3187 = _3185 + 1;
    int _3189 = _3187 + 1;
    float _3191 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3193 = uint(_3129) >= 2u;
    float _3195 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3063);
    int _3197 = _3189;
    if (!_3147)
    {
        int _3199 = ~_3143;
        int _3201 = _3199 + 1;
        _3197 = _3201;
    }
    int _3203 = _3197;
    float _3205 = _3191 * _3091;
    bool _3207 = _3129 != 3;
    int _3209 = _3181 >> 31;
    float _3211 = fma(_3155, _3165, _3205);
    int _3213 = _3193 ? 0 : 1;
    int _3215 = _3173 >> 2;
    bool _3217 = uint(_3177) >= uint(_2207);
    int _3219 = _3209 & 3;
    int _3221 = _3215 << 4;
    int _3223 = _3221 + 368;
    int _3225 = _3181 + _3219;
    int _3227 = int(_2857) + int(_3057);
    uint _3229 = uint(int(uint(_3223) >> uint(2)));
    uint _3231 = uint(int(uint(int(_3229)) >> uint(2)));
    int _3233 = int(_3229) & 3;
    float _3235 = (*spvDescriptorSet0.vp_c9)._m0[int(_3231)][_3233];
    int _3237 = int(_3229) + 1;
    uint _3239 = uint(int(uint(_3237) >> uint(2)));
    int _3241 = _3237 & 3;
    float _3243 = (*spvDescriptorSet0.vp_c9)._m0[int(_3239)][_3241];
    int _3245 = ~_2219;
    int _3247 = _3245 + 1;
    int _3249 = ~_3213;
    int _3251 = _3249 + 1;
    int _3253 = _3251 + 1;
    int _3255 = _3225 >> 2;
    int _3257 = _3247 * _3227;
    int _3259 = _3257 + _2813;
    int _3261 = _3253;
    if (_3207)
    {
        int _3263 = ~_3213;
        int _3265 = _3263 + 1;
        _3261 = _3265;
    }
    int _3267 = _3261;
    int _3269 = _3181 & 3;
    bool _3271 = _3269 != 0;
    int _3273 = _3255 << 4;
    int _3275 = _3273 + 512;
    float _3277 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3121);
    bool _3279 = !_3271;
    int _3281 = _3279 ? 0 : 1;
    int _3283 = _3181 & 3;
    bool _3285 = _3283 != 0;
    int _3287 = _3275 + 8;
    uint _3289 = uint(int(uint(_3287) >> uint(2)));
    uint _3291 = uint(int(uint(int(_3289)) >> uint(2)));
    int _3293 = int(_3289) & 3;
    float _3295 = (*spvDescriptorSet0.vp_c9)._m0[int(_3291)][_3293];
    int _3297 = int(_3289) + 1;
    uint _3299 = uint(int(uint(_3297) >> uint(2)));
    int _3301 = _3297 & 3;
    float _3303 = (*spvDescriptorSet0.vp_c9)._m0[int(_3299)][_3301];
    bool _3305 = !_3217;
    int _3307 = _3305 ? 0 : (-1);
    out.m_78.x = _3165;
    out.m_78.y = _3277;
    out.m_78.z = _3171;
    bool _3309 = uint(_3259) >= uint(_2219);
    int _3311 = _3285 ? 0 : 1;
    bool _3313 = uint(_3269) >= 2u;
    uint _3315 = uint(int(uint(_3275) >> uint(2)));
    uint _3317 = uint(int(uint(int(_3315)) >> uint(2)));
    int _3319 = int(_3315) & 3;
    float _3321 = (*spvDescriptorSet0.vp_c9)._m0[int(_3317)][_3319];
    int _3323 = int(_3315) + 1;
    uint _3325 = uint(int(uint(_3323) >> uint(2)));
    int _3327 = _3323 & 3;
    float _3329 = (*spvDescriptorSet0.vp_c9)._m0[int(_3325)][_3327];
    int _3331 = ~_3029;
    int _3333 = _3331 + _3307;
    int _3335 = _3333 + 1;
    float _3337 = _3191 * _3105;
    int _3339 = _3313 ? 0 : 1;
    float _3341 = _3191 * _3115;
    bool _3343 = uint(_3269) > 1u;
    float _3345 = fma(_3155, _3277, _3337);
    bool _3347 = !_3309;
    int _3349 = _3347 ? 0 : (-1);
    int _3351 = _3223 + 8;
    uint _3353 = uint(int(uint(_3351) >> uint(2)));
    uint _3355 = uint(int(uint(int(_3353)) >> uint(2)));
    int _3357 = int(_3353) & 3;
    float _3359 = (*spvDescriptorSet0.vp_c9)._m0[int(_3355)][_3357];
    int _3361 = int(_3353) + 1;
    uint _3363 = uint(int(uint(_3361) >> uint(2)));
    int _3365 = _3361 & 3;
    float _3367 = (*spvDescriptorSet0.vp_c9)._m0[int(_3363)][_3365];
    bool _3369 = _3269 != 3;
    float _3371 = fma(_3155, _3171, _3341);
    int _3373 = ~_3311;
    int _3375 = _3373 + 1;
    int _3377 = _3375 + 1;
    int _3379 = _2207 * _3335;
    int _3381 = _3379 + _2715;
    int _3383 = ~_3227;
    int _3385 = _3383 + _3349;
    int _3387 = _3385 + 1;
    int _3389 = abs(_3203);
    int _3391 = abs(_3169);
    int _3393 = _2219 * _3387;
    int _3395 = _3393 + _2813;
    int _3397 = _3377;
    if (!_3343)
    {
        int _3399 = ~_3311;
        int _3401 = _3399 + 1;
        _3397 = _3401;
    }
    int _3403 = _3397;
    int _3405 = ~_3339;
    int _3407 = _3405 + 1;
    int _3409 = _3407 + 1;
    int _3411 = abs(_3403);
    int _3413 = ~_3389;
    int _3415 = _3413 + 1;
    int _3417 = _3415 + 1;
    int _3419 = _3409;
    if (_3369)
    {
        int _3421 = ~_3339;
        int _3423 = _3421 + 1;
        _3419 = _3423;
    }
    int _3425 = _3419;
    int _3427 = _3417 * as_type<int>(_3243);
    int _3429 = abs(_3267);
    int _3431 = abs(_3281);
    int _3433 = abs(_3425);
    int _3435 = ~_3391;
    int _3437 = _3435 + 1;
    int _3439 = _3437 + 1;
    int _3441 = ~_3411;
    int _3443 = _3441 + 1;
    int _3445 = _3443 + 1;
    int _3447 = _3439 * as_type<int>(_3235);
    int _3449 = _3447 + _3427;
    int _3451 = ~_3429;
    int _3453 = _3451 + 1;
    int _3455 = _3453 + 1;
    int _3457 = _3445 * as_type<int>(_3329);
    int _3459 = ~_3431;
    int _3461 = _3459 + 1;
    int _3463 = _3461 + 1;
    bool _3465 = _3129 != 3;
    bool _3467 = _3269 != 3;
    int _3469 = _3463 * as_type<int>(_3321);
    int _3471 = _3469 + _3457;
    int _3473 = ~_3433;
    int _3475 = _3473 + 1;
    int _3477 = _3475 + 1;
    int _3479 = _3455 * as_type<int>(_3359);
    int _3481 = _3479 + _3449;
    bool _3483 = !_3465;
    int _3485 = _3483 ? 0 : (-1);
    float _3487 = fma(_3191, _3191, 1.0);
    bool _3489 = !_3061;
    int _3491 = _3489 ? 0 : 1;
    int _3493 = _3477 * as_type<int>(_3295);
    int _3495 = _3493 + _3471;
    bool _3497 = !_3467;
    int _3499 = _3497 ? 0 : (-1);
    float _3501 = rsqrt(_3487);
    int _3503 = abs(_3485);
    bool _3505 = !_3067;
    int _3507 = _3505 ? 0 : 1;
    int _3509 = abs(_3491);
    int _3511 = abs(_3499);
    int _3513 = abs(_3507);
    float _3515 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3517 = _3191 * _3501;
    int _3519 = ~_3503;
    int _3521 = _3519 + 1;
    int _3523 = _3521 + 1;
    float _3525 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3515);
    int _3527 = ~_3511;
    int _3529 = _3527 + 1;
    int _3531 = _3529 + 1;
    float _3533 = -_3195;
    float _3535 = _3517 * _3533;
    int _3537 = ~_3509;
    int _3539 = _3537 + 1;
    int _3541 = _3539 + 1;
    int _3543 = _3523 * as_type<int>(_3367);
    int _3545 = _3543 + _3481;
    bool _3547 = !_2665;
    int _3549 = _3547 ? _3381 : (-1);
    int _3551 = _3531 * as_type<int>(_3303);
    int _3553 = _3551 + _3495;
    int _3555 = _3545 * _3541;
    bool _3557 = !_2703;
    int _3559 = _3557 ? _3395 : (-1);
    float _3561 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3525);
    int _3563 = ~_3513;
    int _3565 = _3563 + 1;
    int _3567 = _3565 + 1;
    int _3569 = _3549 * _3509;
    int _3571 = _3569 + _3555;
    float _3573 = -_3161;
    float _3575 = _3517 * _3573;
    float _3577 = _1926 + _1902;
    int _3579 = _3553 * _3567;
    float _3581 = fma(_3501, _3091, _3575);
    float _3583 = fma(_3501, _3105, _3535);
    float _3585 = _1902 * 0.5;
    int _3587 = _3559 * _3513;
    int _3589 = _3587 + _3579;
    float _3591 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3561);
    float _3593 = _3161 + _3211;
    float _3595 = fma(_1928, -0.5, _3585);
    float _3597 = float(_3571);
    float _3599 = _3591 + _1902;
    out.gl_Position.x = _1926;
    out.gl_Position.y = _1928;
    out.gl_Position.z = _3591;
    out.gl_Position.w = _1902;
    bool _3601 = _1223 <= 8000.0;
    bool _3603 = isnan(_1223);
    bool _3605 = _3601 || _3603;
    bool _3607 = isnan(8000.0);
    bool _3609 = _3605 || _3607;
    float _3611 = float(_3609);
    float _3613 = -_3183;
    float _3615 = _3517 * _3613;
    float _3617 = _3599 * 0.5;
    float _3619 = fma(_3103, -2.0, 3.0);
    float _3621 = _3103 * _3103;
    float _3623 = _3577 * 0.5;
    float _3625 = float(_3589);
    float _3627 = _3195 + _3345;
    float _3629 = _3621 * _3619;
    float _3631 = _3183 + _3371;
    out.m_80.x = _3623;
    out.m_80.y = _3595;
    out.m_80.z = _3617;
    out.m_80.w = _1902;
    float _3633 = fma(_3501, _3115, _3615);
    float _3635 = -_2539;
    float _3637 = _3635 + 1.0;
    float _3639 = -_3629;
    float _3641 = _3639 + 1.0;
    out.m_82.x = _3597;
    out.m_82.y = _3625;
    float _3643 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3645 = fma(_3641, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3629);
    float _3647 = _3641;
    float _3649 = _3643;
    float _3651 = _3581;
    if (!_1884)
    {
        _3647 = 1.0;
    }
    float _3653 = _3647;
    out.m_84.x = _3593;
    out.m_84.y = _3627;
    out.m_84.z = _3631;
    float _3655 = _3643 * _1984;
    float _3657 = _3653;
    if (_1884)
    {
        bool _3659 = _1982 >= _1946;
        bool _3661 = isnan(_1982);
        bool _3663 = _3659 || _3661;
        bool _3665 = isnan(_1946);
        bool _3667 = _3663 || _3665;
        float _3669 = float(_3667);
        _3657 = _3669;
    }
    float _3671 = _3657;
    float _3673 = -_3643;
    float _3675 = _3673 + 1.0;
    float _3677 = _3611 * _3645;
    float _3679 = _1995 * _3655;
    float _3681 = _2509 * _3655;
    bool _3683 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3685 = isnan(_2233);
    bool _3687 = _3683 || _3685;
    bool _3689 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3691 = _3687 || _3689;
    float _3693 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3695 = fma(_2505, _3679, _1989);
    float _3697 = fma(_2507, _3679, _1991);
    float _3699 = _1995 * _3675;
    float _3701 = fma(_1995, _3681, _1993);
    float _3703 = _2531 * _3693;
    float _3705 = precise::clamp(_3703, 0.0, 1.0);
    float _3707 = _3671 * _2191;
    out.m_86.x = _3581;
    out.m_86.y = _3583;
    out.m_86.z = _3633;
    float _3709 = -_3705;
    float _3711 = fma(_3709, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_88.x = _3695;
    out.m_88.y = _3697;
    out.m_88.z = _3701;
    out.m_88.w = _3699;
    float _3713 = _3675;
    float _3715 = _3693;
    if (!_3691)
    {
        _3649 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3717 = _3649;
    float _3719 = -_3707;
    float _3721 = fma(_3719, _3711, 1.0);
    float _3723 = precise::clamp(_3721, 0.0, 1.0);
    float _3725 = _3717;
    float _3727 = _3717;
    if (!_3691)
    {
        _3713 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3729 = _3713;
    float _3731 = _3729;
    float _3733 = _3729;
    if (!_3691)
    {
        _3715 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3735 = _3715;
    float _3737 = _3723 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3739 = _2069 * _2127;
    float _3741 = _3739;
    float _3743 = _3737;
    float _3745 = _3735;
    float _3747 = _3735;
    if (!_3691)
    {
        _3651 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3749 = _3651;
    out.m_90.x = _3737;
    float _3751 = _3739 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3753 = _3749;
    float _3755 = _3749;
    if (!_3691)
    {
        _3741 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3757 = _3741;
    float _3759 = _3757;
    float _3761 = _3757;
    if (!_3691)
    {
        _3743 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3763 = _3743;
    bool _3765 = !_3691;
    float _3767 = _3763;
    float _3769 = _3763;
    if (!_3765)
    {
        bool _3771 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3773 = isnan(_2233);
        bool _3775 = _3771 || _3773;
        bool _3777 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3779 = _3775 || _3777;
        if (!_3779)
        {
            float _3781 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3783 = _2233 + _3781;
            float _3785 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3787 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3785;
            float _3789 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3791 = _3789 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3793 = 1.0 / _3787;
            float _3795 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3797 = _3795 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3799 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3801 = _3799 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3803 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3805 = _3803 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3807 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3809 = _3807 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3811 = _3783 * _3793;
            float _3813 = precise::clamp(_3811, 0.0, 1.0);
            float _3815 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3817 = _3815 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3819 = fma(_3813, _3791, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3821 = fma(_3813, _3817, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3823 = fma(_3813, _3797, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3825 = fma(_3813, _3801, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3827 = fma(_3813, _3805, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3829 = fma(_3813, _3809, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3727 = _3823;
            _3769 = _3827;
            _3755 = _3819;
            _3747 = _3825;
            _3733 = _3821;
            _3761 = _3829;
            _3831 = true;
        }
        else
        {
            bool _3833 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3835 = isnan(_2233);
            bool _3837 = _3833 || _3835;
            bool _3839 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3841 = _3837 || _3839;
            if (!_3841)
            {
                _3753 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3843 = _3753;
            _3755 = _3843;
            if (!_3841)
            {
                _3725 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3845 = _3725;
            _3727 = _3845;
            if (!_3841)
            {
                _3731 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3847 = _3731;
            _3733 = _3847;
            if (!_3841)
            {
                _3745 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3849 = _3745;
            _3747 = _3849;
            if (!_3841)
            {
                _3767 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3851 = _3767;
            _3769 = _3851;
            if (!_3841)
            {
                _3759 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3853 = _3759;
            bool _3855 = !_3841;
            _3761 = _3853;
            if (!_3855)
            {
                bool _3857 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3859 = isnan(_2233);
                bool _3861 = _3857 || _3859;
                bool _3863 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3865 = _3861 || _3863;
                if (!_3865)
                {
                    float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3869 = _2233 + _3867;
                    float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3873 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3871;
                    float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3877 = _3875 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3879 = 1.0 / _3873;
                    float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3893 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3897 = _3869 * _3879;
                    float _3899 = precise::clamp(_3897, 0.0, 1.0);
                    float _3901 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3903 = _3901 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3905 = fma(_3899, _3877, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3907 = fma(_3899, _3903, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3909 = fma(_3899, _3883, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3911 = fma(_3899, _3887, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3913 = fma(_3899, _3891, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3915 = fma(_3899, _3895, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3727 = _3909;
                    _3769 = _3913;
                    _3755 = _3905;
                    _3747 = _3911;
                    _3733 = _3907;
                    _3761 = _3915;
                    _3831 = true;
                }
                else
                {
                    _3727 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3769 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3755 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3747 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3733 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3761 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3831 = false;
    float _3917 = _3727;
    float _3919 = _3769;
    float _3921 = _3755;
    float _3923 = _3747;
    float _3925 = _3733;
    float _3927 = _3761;
    float _3929 = fma(_3627, -0.5, 0.5);
    float _3931 = precise::clamp(_3929, 0.0, 1.0);
    float _3933 = -_3917;
    float _3935 = _3933 + _3919;
    float _3937 = _3751 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3939 = -_3921;
    float _3941 = _3939 + _3923;
    float _3943 = fma(_3931, _3935, _3917);
    out.m_92.x = 0.0;
    float _3945 = -_3925;
    float _3947 = _3945 + _3927;
    float _3949 = fma(_3931, _3941, _3921);
    float _3951 = _3943 * 0.586610972881317138671875;
    out.m_59.x = _3937;
    bool _3953 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3955 = fma(_3931, _3947, _3925);
    float _3957 = fma(_3949, 0.298911988735198974609375, _3951);
    bool _3959 = _2069 > 0.0;
    bool _3961 = isnan(_2069);
    bool _3963 = _3959 || _3961;
    bool _3965 = isnan(0.0);
    bool _3967 = _3963 || _3965;
    float _3969 = fma(_3955, 0.114477999508380889892578125, _3957);
    bool _3971 = _2127 <= 0.0;
    bool _3973 = !_3967;
    bool _3975 = _3971 || _3973;
    float _3977 = -_3969;
    float _3979 = _3949 + _3977;
    float _3981 = -_3969;
    float _3983 = _3943 + _3981;
    float _3985 = -_3969;
    float _3987 = _3955 + _3985;
    float _3989 = fma(_3979, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3969);
    float _3991 = fma(_3983, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3969);
    float _3993 = fma(_3987, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3969);
    bool _3995 = !_3953;
    if (!_3995)
    {
        float _3997 = -_1814;
        float _3999 = _3997 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4001 = -_1816;
        float _4003 = _4001 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4005 = -_1818;
        float _4007 = _4005 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4009 = _3999 * _3999;
        float _4011 = fma(_4003, _4003, _4009);
        float _4013 = fma(_4007, _4007, _4011);
        float _4015 = sqrt(_4013);
        float _4017 = rsqrt(_4013);
        float _4019 = -_4015;
        float _4021 = _4019 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4023 = _4021 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4025 = precise::clamp(_4023, 0.0, 1.0);
        float _4027 = _4003 * _4017;
        float _4029 = _3999 * _4017;
        float _4031 = abs(_4025);
        float _4033 = log2(_4031);
        float _4035 = _4007 * _4017;
        float _4037 = _4027 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4039 = _3627 * _4029;
        float _4041 = -_4029;
        float _4043 = -_4037;
        float _4045 = fma(_4041, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4043);
        float _4047 = fma(_3593, _4027, _4039);
        float _4049 = -_4035;
        float _4051 = fma(_4049, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4045);
        float _4053 = fma(_3631, _4035, _4047);
        float _4055 = precise::clamp(_4053, 0.0, 1.0);
        float _4057 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4059 = _4051 + _4057;
        float _4061 = _4033 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4063 = _4059 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4065 = precise::clamp(_4063, 0.0, 1.0);
        float _4067 = exp2(_4061);
        float _4069 = _4067 * _4065;
        float _4071 = _4055 * _4069;
        float _4073 = _4071 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4075 = _4071 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4077 = _4071 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _4073;
        out.m_92.y = _4075;
        out.m_92.z = _4077;
    }
    out.m_94.x = _3989;
    out.m_94.y = _3991;
    out.m_94.z = _3993;
    if (!_3975)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _4079 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4079;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3831 = false;
    bool _351 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_59.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4135 = as_type<float>(_129);
        out.gl_Position.z = _4135;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_61.w;
    float _133 = in.m_63.x;
    bool _135 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_131);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_131;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_65.x = _133;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_59.x = 0.0;
    }
    int _165 = 0;
    if (_161)
    {
        float _167 = _163 * 5.0;
        _165 = as_type<int>(_167);
    }
    int _169 = _165;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4208 = as_type<float>(_169);
        out.gl_Position.z = _4208;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = in.m_70.w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_61.x;
    float _189 = in.m_61.y;
    float _191 = in.m_61.z;
    float _193 = in.m_56.x;
    float _195 = in.m_56.y;
    float _197 = in.m_56.z;
    int _199 = as_type<int>(_171) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_171) & 2;
    bool _205 = _203 != 0;
    float _207 = _171;
    if (!_185)
    {
        float _209 = _173 * _173;
        float _211 = _209 * 0.5;
        _207 = _211;
    }
    float _213 = _207;
    bool _215 = !_201;
    float _217 = _215 ? (-0.5) : 0.5;
    float _219 = _213;
    if (!_185)
    {
        float _221 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _221;
    }
    float _223 = _219;
    bool _225 = !_205;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_185;
    float _231 = _223;
    if (!_229)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = _173 * _235;
        float _245 = 1.0 / _239;
        float _247 = _241 * 0.693147182464599609375;
        float _249 = exp2(_243);
        float _251 = 1.0 / _247;
        float _253 = _249 + (-1.0);
        float _255 = -_253;
        float _257 = fma(_255, _251, _173);
        float _259 = _257 * _245;
        float _261 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _261;
    }
    float _263 = _231;
    float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _271 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _273 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _275 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _277 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[8].x, _271);
    float _279 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[8].y, _273);
    float _281 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[8].z, _275);
    float _283 = _273;
    if (!_185)
    {
        _283 = _173;
    }
    float _285 = _283;
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[10].x, _277);
    bool _289 = !_185;
    float _291 = _285;
    if (!_289)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = 1.0 / _299;
        float _303 = _173 * _295;
        float _305 = exp2(_303);
        float _307 = -_305;
        float _309 = _307 + 1.0;
        float _311 = _309 * _301;
        _291 = _311;
    }
    float _313 = _291;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _317 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[10].y, _279);
    float _319 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[10].z, _281);
    float _321 = fma(_313, _187, _287);
    float _323 = fma(_313, _189, _317);
    float _325 = fma(_313, _191, _319);
    float _327 = fma(_321, _175, _193);
    float _329 = fma(_323, _175, _195);
    float _331 = fma(_325, _175, _197);
    bool _333 = !_315;
    float _349;
    if (!_333)
    {
        float _335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _337 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _341 = _339 * _335;
        float _343 = floor(_341);
        float _345 = -_343;
        float _347 = _341 + _345;
        _349 = _347;
        _351 = true;
    }
    else
    {
        float _353 = float(_113);
        float _355 = 1.0 / _353;
        float _357 = _147 * _355;
        _349 = _357;
    }
    _351 = false;
    float _359 = _349;
    float _361 = _329 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _363 = _329 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _365 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[4].x, _361);
    float _367 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[6].x, _363);
    float _369 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[4].z, _365);
    float _371 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[6].z, _367);
    float _373 = _369 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _375 = _371 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _377 = fma(_373, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _379 = fma(_375, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _381 = floor(_377);
    float _383 = floor(_379);
    float _385 = -_381;
    float _387 = _377 + _385;
    float _389 = -_383;
    float _391 = _379 + _389;
    float2 _4576 = float2(_387, _391);
    float _393 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4576, float2(0.0), isnan(_4576)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4576, float2(0.0), isnan(_4576)), level(0.0)).x;
    float _395 = in.m_63.z;
    float _397 = _133 * 2.0;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _401 = _359 + _399;
    float _403 = in.m_63.y;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _413 = floor(_397);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _423 = 1.0 / _407;
    float _425 = _329 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _431 = _429 != 0;
    float _433 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[5].x, _425);
    float _435 = _133 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _437 = 1.0 / _411;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _443 = -_427;
    float _445 = fma(_435, 2.0, _443);
    bool _447 = _413 > 0.0;
    float _449 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[5].z, _433);
    bool _451 = _413 >= 0.0;
    bool _453 = isnan(_413);
    bool _455 = _451 || _453;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _463 = 1.0 / _421;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _467 = _359 + _465;
    float _469 = _449 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _471 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _473 = isnan(_359);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _483;
    float _487 = 1.0 / _417;
    float _489 = _467 * _437;
    float _491 = _403 * 2.0;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _497;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _503 = _359 + _501;
    float _505 = 1.0 / _441;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _507;
    float _511 = _403 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _513 = _503 * _463;
    float _515 = _133 + _395;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _519 = _359 + _517;
    float _521 = fma(_511, -2.0, _461);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _525 = _359 + _523;
    float _527 = 1.0 / _499;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _531 = _359 + _529;
    float _533 = _515 + (-1.0);
    float _535 = fma(_495, _513, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _537 = _531 * _423;
    float _539 = _395 * 2.0;
    float _541 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _543 = 1.0 / _509;
    float _545 = _401 * _505;
    float _547 = -_481;
    float _549 = _547 + 1.0;
    float _551 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _521);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _553;
    float _557 = floor(_539);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _561 = _359 + _559;
    float _563 = _519 * _527;
    float _565 = _561 * _487;
    float _567 = _133 + _403;
    float _569 = floor(_491);
    float _571 = _525 * _543;
    bool _573 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _575 = isnan(_359);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = _567 + (-1.0);
    float _587 = _395 + _403;
    float _589 = fma(_485, _565, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _591 = fma(_555, _565, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _593 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _595 = _587 + (-1.0);
    bool _597 = _557 > 0.0;
    float _599 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _601 = int(_599);
    bool _603 = _557 >= 0.0;
    bool _605 = isnan(_557);
    bool _607 = _603 || _605;
    bool _609 = isnan(0.0);
    bool _611 = _607 || _609;
    float _613 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _623;
    bool _627 = _569 > 0.0;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _633 = _569 >= 0.0;
    bool _635 = isnan(_569);
    bool _637 = _633 || _635;
    bool _639 = isnan(0.0);
    bool _641 = _637 || _639;
    float _643 = fma(_621, _537, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _645 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _647 = isnan(_359);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = fma(_625, _537, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _659 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _661 = isnan(_359);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _675 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _677 = isnan(_359);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -_655;
    float _689 = _687 + 1.0;
    float _691 = fma(_631, _489, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _693 = -_669;
    float _695 = _693 + 1.0;
    float _697 = fma(_673, _489, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _699 = _669 * _689;
    float _701 = fma(_617, _513, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _703 = _685 * _695;
    float _705 = -_685;
    float _707 = _705 + 1.0;
    bool _709 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _711 = isnan(_359);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _721;
    int _725 = _459 ? 0 : 1;
    float _727 = _583 * _707;
    float _729 = -_583;
    float _731 = _729 + 1.0;
    float _733 = -_719;
    float _735 = _733 + 1.0;
    float _737 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _739 = log2(_737);
    float _741 = _719 * _731;
    bool _743 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _745 = isnan(_359);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _755;
    float _759 = _481 * _735;
    float _761 = float(_601);
    float _763 = fma(_757, _571, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _765 = _753 * _549;
    float _767 = fma(_723, _571, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    int _769 = as_type<int>(_549);
    float _771 = _469;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_431)
    {
        _769 = 0;
    }
    int _775 = _769;
    float _777 = -_753;
    float _779 = _777 + 1.0;
    bool _781 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _783 = isnan(_359);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    int _797 = _775;
    if (!_431)
    {
        _797 = 1;
    }
    int _799 = _797;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    int _805 = _641 ? 0 : 1;
    float _807 = _791 * _779;
    bool _809 = _799 != 1;
    float _811 = -_791;
    float _813 = _811 + 1.0;
    float _815 = fma(_795, _545, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _817 = _589 * _807;
    float _819 = _591 * _807;
    float _821 = fma(_803, _545, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _823 = ~_725;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    float _829 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[143].x, _817);
    float _831 = 1.0 / _761;
    int _833 = _827;
    float _835 = _813;
    if (!_447)
    {
        int _837 = ~_725;
        int _839 = _837 + 1;
        _833 = _839;
    }
    int _841 = _833;
    float _843 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[143].y, _819);
    float _845 = _611 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _849 = _845;
    if (!_809)
    {
        _835 = _403;
    }
    float _851 = _835;
    float _853 = fma(_535, _765, _829);
    float _855 = _851;
    if (_809)
    {
        _855 = _133;
    }
    float _857 = _855;
    float _859 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _861 = int(_859);
    int _863 = ~as_type<int>(_845);
    int _865 = _863 + 1;
    int _867 = _865 + 1;
    float _869 = fma(_701, _765, _843);
    int _871 = _867;
    if (!_597)
    {
        int _873 = ~as_type<int>(_845);
        int _875 = _873 + 1;
        _871 = _875;
    }
    int _877 = _871;
    float _879 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[83].z, _847);
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _883 = _881 != 0;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _887 = _885 != 0;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _891 = _889 != 0;
    float _893 = fma(_643, _759, _853);
    float _895 = fma(_657, _759, _869);
    float _897 = _469 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _899 = ~_805;
    int _901 = _899 + 1;
    int _903 = _901 + 1;
    float _905 = _739 * _147;
    bool _907 = !_887;
    int _909 = _907 ? 0 : 1;
    float _911 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[11].x, _897);
    bool _913 = !_883;
    int _915 = _913 ? 0 : 1;
    float _917 = _831 * _147;
    bool _919 = !_891;
    int _921 = _919 ? 0 : 1;
    float _923 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[11].z, _911);
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _927 = _925 != 0;
    int _929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _931 = _929 != 0;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _935 = _933 != 0;
    float _937 = _469 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _939 = float(_861);
    float _941 = _923 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _943 = _903;
    float _945 = _923;
    if (!_627)
    {
        int _947 = ~_805;
        int _949 = _947 + 1;
        _943 = _949;
    }
    int _951 = _943;
    float _953 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[10].x, _937);
    bool _955 = !_931;
    float _957 = _955 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _959 = 1.0 / _939;
    float _961 = float(_113);
    float _963 = fma(_691, _741, _893);
    int _965 = abs(as_type<int>(_957));
    float _967 = fma(_697, _741, _895);
    float _969 = float(_841);
    float _971 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[10].z, _953);
    float _973 = float(_965);
    float _975 = 1.0 / _941;
    float _977 = _957;
    if (!_809)
    {
        _977 = _395;
    }
    float _979 = _977;
    float _981 = _971 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _983 = _979;
    if (_809)
    {
        _983 = _403;
    }
    float _985 = _983;
    float _987 = _973 * _969;
    float _989 = _981 + _941;
    float _991 = _985 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_809)
    {
        _945 = _403;
    }
    float _993 = _945;
    float _995 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _997 = _993;
    if (_809)
    {
        _997 = _133;
    }
    float _999 = _997;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1003 = _469 + _995;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1007 = 1.0 + _1005;
    float _1009 = _999 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1011 = fma(_991, -2.0, _1001);
    float _1013 = _1003 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1015 = in.m_72.x;
    float _1017 = in.m_72.y;
    float _1019 = in.m_72.z;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1023 = 1.0 / _1007;
    float _1025 = fma(_373, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1013);
    bool _1027 = !_935;
    int _1029 = _1027 ? 0 : 1;
    float _1031 = -_1021;
    float _1033 = fma(_1009, 2.0, _1031);
    float _1035 = _987 * (-2.0);
    int _1037 = abs(_1029);
    float _1039 = _989 * _975;
    float _1041 = _1039 * 0.5;
    float _1043 = exp2(_905);
    float _1045 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1011);
    float _1047 = fma(_375, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1025);
    bool _1049 = !_927;
    int _1051 = _1049 ? 0 : 1;
    float _1053 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1055 = _1047 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _1057 = abs(_1051);
    float _1059 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1053);
    float _1061 = float(_951);
    float _1063 = 1.0 / _961;
    float _1065 = float(_1057);
    float _1067 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _879);
    float _1069 = float(_877);
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1073 = fma(_613, _1035, _613);
    float _1075 = _1065 * _1069;
    bool _1077 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1079 = isnan(1.0);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1085 = _1081 || _1083;
    float _1087 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1071);
    float _1089 = _1061;
    float _1091 = _1055;
    if (!_809)
    {
        _849 = _395;
    }
    float _1093 = _849;
    float _1095 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1097 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1095);
    float _1099 = _1093;
    if (_809)
    {
        _1099 = _403;
    }
    float _1101 = _1099;
    float _1103 = _959 * _147;
    float _1105 = -_1043;
    float _1107 = _1105 + 1.0;
    float _1109 = _1075 * (-2.0);
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1113 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1115 = isnan(0.0);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1121 = _1117 || _1119;
    float _1123 = fma(_1035, _1017, _1017);
    float _1125 = float(_1037);
    float _1127 = fma(_593, _1109, _593);
    float _1129 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1111);
    float _1131 = _1121 ? _1107 : 0.0;
    float _1133 = fma(_1109, _1015, _1015);
    float _1135 = _133 + (-0.5);
    float _1137 = _1125 * _1061;
    float _1139 = -_147;
    float _1141 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[76].x, _445);
    float _1143 = _1063 * _147;
    float _1145 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1059);
    float _1147 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1087);
    float _1149 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1129);
    float _1151 = -_147;
    float _1153 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1033);
    if (_1085)
    {
        float _1155 = _1131 * _1023;
        _151 = _1155;
    }
    float _1157 = _151;
    float _1159 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1133);
    float _1161 = _1137 * (-2.0);
    float _1163 = _1003 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1165 = 1.0 / _1097;
    float _1167 = _395 + (-0.5);
    float _1169 = fma(_1127, _1157, _1159);
    float _1171 = fma(_1161, _1019, _1019);
    float _1173 = _403 + (-0.5);
    float _1175 = fma(_373, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1163);
    float _1177 = fma(_541, _1161, _541);
    float _1179 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1171);
    float _1181 = _1169 * 0.15915493667125701904296875;
    float _1183 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1123);
    float _1185 = in.m_70.x;
    float _1187 = in.m_70.y;
    float _1189 = fma(_375, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1175);
    float _1191 = fma(_1177, _1157, _1179);
    float _1193 = fma(_1073, _1157, _1183);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _1195;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _1199;
    float _1203 = _1189 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1205 = _1193 * 0.15915493667125701904296875;
    float _1207 = fma(_763, _727, _963);
    float _1209 = fma(_1197, _563, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _1211 = fma(_1201, _563, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _1213 = trunc(_1055);
    int _1215 = int(_1213);
    float _1217 = _1191 * 0.15915493667125701904296875;
    float _1219 = fma(_767, _727, _967);
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1223 = _1165 * _1221;
    float _1225 = fma(_815, _703, _1207);
    float _1227 = fma(_821, _703, _1219);
    float _1229 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _1231 = trunc(_1203);
    int _1233 = int(_1231);
    bool _1235 = _1223 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1237 = fma(_1209, _699, _1225);
    bool _1239 = _1223 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1241 = fma(_1211, _699, _1227);
    float _1243 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1245 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1237);
    float _1247 = _1181 * 6.283185482025146484375;
    float _1249 = sin(_1247);
    float _1251 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1241);
    float _1253 = _1245 * _1185;
    int _1255 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1257 = _1215 + _1255;
    int _1259 = _1257 + 1;
    bool _1261 = !_1235;
    int _1263 = _1261 ? 0 : 1;
    float _1265 = _1251 * _1187;
    int _1267 = 2;
    int _1269 = _1259;
    if (!_1235)
    {
        _1267 = 1;
    }
    int _1271 = _1267;
    float _1273 = _1205 * 6.283185482025146484375;
    float _1275 = sin(_1273);
    int _1277 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1279 = _1233 + _1277;
    int _1281 = _1279 + 1;
    float _1283 = _1265 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1285 = _1259 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1287 = _1259 | _1281;
    int _1289 = _1271;
    if (!_1239)
    {
        _1289 = _1263;
    }
    int _1291 = _1289;
    float _1293 = _1205 * 6.283185482025146484375;
    float _1295 = cos(_1293);
    bool _1297 = _1287 < 0;
    bool _1299 = _1297 || _1285;
    float _1301 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1303 = _1291 << 6;
    bool _1305 = _1281 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1307 = _1305 || _1299;
    float _1309 = _1301 * _1229;
    int _1311 = _1303 + 104;
    uint _1314 = uint(int(uint(_1311) >> uint(2)));
    uint _1316 = uint(int(uint(int(_1314)) >> uint(2)));
    int _1318 = int(_1314) & 3;
    float _1320 = (*spvDescriptorSet0.vp_c15)._m0[int(_1316)][_1318];
    int _1322 = int(_1314) + 1;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    int _1326 = _1322 & 3;
    float _1328 = (*spvDescriptorSet0.vp_c15)._m0[int(_1324)][_1326];
    float _1330 = _1181 * 6.283185482025146484375;
    float _1332 = cos(_1330);
    float _1334 = _1249 * _1275;
    int _1336 = _1303 + 64;
    uint _1338 = uint(int(uint(_1336) >> uint(2)));
    uint _1340 = uint(int(uint(int(_1338)) >> uint(2)));
    int _1342 = int(_1338) & 3;
    float _1344 = (*spvDescriptorSet0.vp_c15)._m0[int(_1340)][_1342];
    int _1346 = int(_1338) + 1;
    uint _1348 = uint(int(uint(_1346) >> uint(2)));
    int _1350 = _1346 & 3;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[int(_1348)][_1350];
    float _1354 = _1217 * 6.283185482025146484375;
    float _1356 = cos(_1354);
    float _1358 = _1249 * _1295;
    int _1360 = as_type<int>(_1309);
    float _1362 = as_type<float>(_1291);
    if (!_1307)
    {
        int _1364 = _1281 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1366 = _1364 + _1259;
        _1269 = _1366;
    }
    int _1368 = _1269;
    float _1370 = _1217 * 6.283185482025146484375;
    float _1372 = sin(_1370);
    float _1374 = _1332 * _1295;
    float _1376 = _1332 * _1275;
    float _1378 = _1249 * _1356;
    float _1380 = _1295 * _1356;
    float _1382 = _1332 * _1356;
    float _1384 = _1275 * _1356;
    float _1386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    int _1388 = _1303 + 72;
    uint _1390 = uint(int(uint(_1388) >> uint(2)));
    uint _1392 = uint(int(uint(int(_1390)) >> uint(2)));
    int _1394 = int(_1390) & 3;
    float _1396 = (*spvDescriptorSet0.vp_c15)._m0[int(_1392)][_1394];
    int _1398 = int(_1390) + 1;
    uint _1400 = uint(int(uint(_1398) >> uint(2)));
    int _1402 = _1398 & 3;
    float _1404 = (*spvDescriptorSet0.vp_c15)._m0[int(_1400)][_1402];
    float _1406 = 0.0;
    if (!_1307)
    {
        float _1408 = floor(_1055);
        _1406 = _1408;
    }
    float _1410 = _1406;
    float _1412 = _1283 * _1386;
    float _1414 = -_1376;
    float _1416 = fma(_1372, _1358, _1414);
    float _1418 = -_1358;
    float _1420 = fma(_1372, _1376, _1418);
    float _1422 = fma(_1372, _1374, _1334);
    float _1424 = _1382 * _1412;
    int _1426 = _1303 + 96;
    uint _1428 = uint(int(uint(_1426) >> uint(2)));
    uint _1430 = uint(int(uint(int(_1428)) >> uint(2)));
    int _1432 = int(_1428) & 3;
    float _1434 = (*spvDescriptorSet0.vp_c15)._m0[int(_1430)][_1432];
    int _1436 = int(_1428) + 1;
    uint _1438 = uint(int(uint(_1436) >> uint(2)));
    int _1440 = _1436 & 3;
    float _1442 = (*spvDescriptorSet0.vp_c15)._m0[int(_1438)][_1440];
    float _1444 = fma(_1372, _1334, _1374);
    float _1446 = -_1412;
    float _1448 = _1372 * _1446;
    float _1450 = fma(_1422, _1309, _1424);
    float _1452 = _1378 * _1412;
    float _1454 = 0.0;
    float _1456 = _1410;
    if (!_1307)
    {
        float _1458 = floor(_1203);
        _1454 = _1458;
    }
    float _1460 = _1454;
    float _1462 = fma(_1380, _1309, _1448);
    float _1464 = fma(_1420, _1243, _1450);
    int _1466 = _1303 + 48;
    uint _1468 = uint(int(uint(_1466) >> uint(2)));
    uint _1470 = uint(int(uint(int(_1468)) >> uint(2)));
    int _1472 = int(_1468) & 3;
    float _1474 = (*spvDescriptorSet0.vp_c15)._m0[int(_1470)][_1472];
    int _1476 = int(_1468) + 1;
    uint _1478 = uint(int(uint(_1476) >> uint(2)));
    int _1480 = _1476 & 3;
    float _1482 = (*spvDescriptorSet0.vp_c15)._m0[int(_1478)][_1480];
    float _1484 = fma(_1416, _1309, _1452);
    float _1486 = fma(_1384, _1243, _1462);
    float _1488 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1490 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1492 = fma(_1444, _1243, _1484);
    int _1494 = as_type<int>(_1462);
    float _1496 = _1460;
    if (!_1307)
    {
        int _1498 = _1368 << 2;
        _1360 = _1498;
    }
    int _1500 = _1360;
    float _1502 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1488);
    int _1504 = _1303 + 56;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
    int _1510 = int(_1506) & 3;
    float _1512 = (*spvDescriptorSet0.vp_c15)._m0[int(_1508)][_1510];
    int _1514 = int(_1506) + 1;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    int _1518 = _1514 & 3;
    float _1520 = (*spvDescriptorSet0.vp_c15)._m0[int(_1516)][_1518];
    float _1522 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1490);
    int _1524 = _1500;
    if (!_1307)
    {
        uint _1526 = uint(int(uint(_1368) >> uint(2)));
        _1494 = int(_1526);
    }
    int _1528 = _1494;
    float _1530 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1502);
    if (!_1307)
    {
        int _1532 = 12 & _1500;
        _1524 = _1532;
    }
    int _1534 = _1524;
    float _1536 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1522);
    float _1538 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1540 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    if (!_1307)
    {
        int _1542 = _1528 << 4;
        int _1544 = _1542 + _1534;
        _1089 = as_type<float>(_1544);
    }
    float _1546 = _1089;
    float _1548 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1550 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1538);
    float _1552 = _375 + _1540;
    float _1554 = _1003 * _1352;
    float _1556 = _373 + _1548;
    float _1558 = _1546;
    float _1560 = _1556;
    float _1562 = _1552;
    if (!_1307)
    {
        int _1564 = as_type<int>(_1546) + 400;
        uint _1566 = uint(int(uint(_1564) >> uint(2)));
        uint _1568 = uint(int(uint(int(_1566)) >> uint(2)));
        int _1570 = int(_1566) & 3;
        float _1572 = (*spvDescriptorSet0.vp_c15)._m0[int(_1568)][_1570];
        _1558 = _1572;
    }
    float _1574 = _1558;
    float _1576 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1578 = _1552 + _1576;
    float _1580 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1550);
    float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1584 = _1556 + _1582;
    float _1586 = fma(_373, _1344, _1554);
    float _1588 = _1578 * _1578;
    int _1590 = _1303 + 80;
    uint _1592 = uint(int(uint(_1590) >> uint(2)));
    uint _1594 = uint(int(uint(int(_1592)) >> uint(2)));
    int _1596 = int(_1592) & 3;
    float _1598 = (*spvDescriptorSet0.vp_c15)._m0[int(_1594)][_1596];
    int _1600 = int(_1592) + 1;
    uint _1602 = uint(int(uint(_1600) >> uint(2)));
    int _1604 = _1600 & 3;
    float _1606 = (*spvDescriptorSet0.vp_c15)._m0[int(_1602)][_1604];
    float _1608 = fma(_1584, _1584, _1588);
    float _1610 = sqrt(_1608);
    int _1612 = _1303 + 88;
    uint _1614 = uint(int(uint(_1612) >> uint(2)));
    uint _1616 = uint(int(uint(int(_1614)) >> uint(2)));
    int _1618 = int(_1614) & 3;
    float _1620 = (*spvDescriptorSet0.vp_c15)._m0[int(_1616)][_1618];
    int _1622 = int(_1614) + 1;
    uint _1624 = uint(int(uint(_1622) >> uint(2)));
    int _1626 = _1622 & 3;
    float _1628 = (*spvDescriptorSet0.vp_c15)._m0[int(_1624)][_1626];
    float _1630 = _1003 * _1442;
    float _1632 = fma(_373, _1434, _1630);
    float _1634 = _1003 * _1482;
    float _1636 = fma(_375, _1320, _1632);
    float _1638 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1640 = _1610 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1642 = fma(_373, _1474, _1634);
    float _1644 = _1636 + _1328;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1648 = _1646 != 0;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1652 = _1650 != 0;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1656 = _1654 != 0;
    int _1658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1660 = _1658 != 0;
    float _1662 = fma(_375, _1512, _1642);
    float _1664 = fma(_375, _1396, _1586);
    float _1666 = _469 + _1638;
    float _1668 = _1662 + _1520;
    bool _1670 = !_1652;
    int _1672 = _1670 ? 0 : 1;
    float _1674 = 1.0 / _1644;
    float _1676 = _1664 + _1404;
    bool _1678 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1680 = isnan(0.5);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1686 = _1682 || _1684;
    bool _1688 = !_1648;
    int _1690 = _1688 ? 0 : 1;
    bool _1692 = !_1656;
    int _1694 = _1692 ? 0 : 1;
    bool _1696 = !_1660;
    int _1698 = _1696 ? 0 : 1;
    float _1700 = _1638;
    float _1702 = _1662;
    if (!_1640)
    {
        _1700 = _1666;
    }
    float _1704 = _1700;
    bool _1706 = !_1640;
    float _1708 = _1704;
    if (!_1706)
    {
        float _1710 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1712 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1714 = _1610 + _1712;
        float _1716 = _1666 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1718 = rsqrt(_1608);
        float _1720 = _1714 * _1710;
        float _1722 = _1720 * 0.15915493667125701904296875;
        float _1724 = _1722 * 6.283185482025146484375;
        float _1726 = cos(_1724);
        float _1728 = _1722 * 6.283185482025146484375;
        float _1730 = sin(_1728);
        float _1732 = _1726 + (-1.0);
        float _1734 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1736 = fma(_1730, _1716, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1738 = fma(_1666, _1726, _1734);
        float _1740 = _1718 * _1736;
        float _1742 = fma(_1584, _1740, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1744 = fma(_1578, _1740, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1560 = _1742;
        _1708 = _1738;
        _1562 = _1744;
        _1702 = _1730;
    }
    float _1746 = _1560;
    float _1748 = _1708;
    float _1750 = _1562;
    float _1752 = _1702;
    float _1754 = _1752;
    float _1756 = _1748;
    float _1758 = _1750;
    if (_1686)
    {
        _1754 = _1746;
    }
    float _1760 = _1754;
    float _1762 = _1760;
    if (!_1686)
    {
        float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1766 = _469 + _1764;
        float _1768 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1770 = _373 + _1768;
        float _1772 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1774 = -_469;
        float _1776 = _1774 + _1748;
        float _1778 = _1766 * _1766;
        float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1782 = _375 + _1780;
        float _1784 = -_375;
        float _1786 = _1784 + _1750;
        float _1788 = fma(_1770, _1770, _1778);
        float _1790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1792 = fma(_1782, _1782, _1788);
        float _1794 = sqrt(_1792);
        float _1796 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1798 = precise::min(_1794, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1800 = _1798 * _1790;
        float _1802 = _1796 * _1800;
        float _1804 = -_373;
        float _1806 = _1804 + _1746;
        float _1808 = fma(_1776, _1802, _469);
        float _1810 = fma(_1806, _1802, _373);
        float _1812 = fma(_1786, _1802, _375);
        _1756 = _1808;
        _1762 = _1810;
        _1758 = _1812;
    }
    float _1814 = _1756;
    float _1816 = _1762;
    float _1818 = _1758;
    float _1820 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1822 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1824 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1826 = _1668 * _1674;
    float _1828 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1820);
    float _1830 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1822);
    float _1832 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1824);
    if (!_1307)
    {
        float _1834 = rint(_1574);
        float _1836 = precise::max(_1834, 0.0);
        uint _1838 = uint(_1836);
        uint _1840 = clamp(_1838, 0u, 65535u);
        _771 = as_type<float>(_1840);
    }
    float _1842 = _771;
    float _1844 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1828);
    bool _1846 = _1826 >= 0.0;
    float _1848 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1850 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1832);
    float _1852 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1854 = _1676 * _1674;
    bool _1856 = _1826 <= 1.0;
    bool _1858 = _1856 && _1846;
    float _1860 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1848);
    float _1862 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1830);
    float _1864 = _1850 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1866 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1868 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1870 = _1862 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1872 = _1854 >= 0.0;
    bool _1874 = _1872 && _1858;
    float _1876 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1860);
    float _1878 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1866);
    float _1880 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1882 = _1854 <= 1.0;
    bool _1884 = _1882 && _1874;
    float _1886 = _1876 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1888 = _1003 * _1606;
    float _1890 = -_1880;
    float _1892 = fma(_1890, _1868, 1.0);
    float _1894 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1878);
    float _1896 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1898 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1900 = fma(_373, _1598, _1888);
    float _1902 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1894);
    float _1904 = log2(_1892);
    float _1906 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1896);
    float _1908 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1898);
    float _1910 = fma(_375, _1620, _1900);
    float _1912 = _1888;
    if (_1884)
    {
        float _1914 = float(_1291);
        _1362 = _1914;
    }
    float _1916 = _1362;
    float _1918 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1906);
    float _1920 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1908);
    float _1922 = _1910 + _1628;
    float _1924 = 1.0 / _1902;
    float _1926 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1918);
    float _1928 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1920);
    float _1930 = _1916;
    if (!_1307)
    {
        float _1932 = -_1460;
        float _1934 = _1203 + _1932;
        _1912 = _1934;
    }
    float _1936 = _1912;
    float _1938 = _1936;
    if (!_1307)
    {
        float _1940 = -_1410;
        float _1942 = _1055 + _1940;
        _1091 = _1942;
    }
    float _1944 = _1091;
    float _1946 = _1922 * _1674;
    float _1948 = _1896;
    if (_1884)
    {
        float _1950 = rint(_1916);
        float _1952 = precise::max(_1950, 0.0);
        uint _1954 = uint(_1952);
        uint _1956 = clamp(_1954, 0u, 65535u);
        _1948 = as_type<float>(_1956);
    }
    float _1958 = _1948;
    float _1960 = _1904 * 0.693147182464599609375;
    float _1962 = _1926 * _1924;
    float _1964 = _1928 * _1924;
    float _1966 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1968 = fma(_1962, 0.5, 0.5);
    float _1970 = fma(_1964, -0.5, 0.5);
    float _1972 = _1842;
    if (!_1307)
    {
        float3 _7123 = float3(_1944, _1936, float(as_type<int>(_1842)));
        float3 _7127 = select(_7123, float3(0.0), isnan(_7123));
        float _1974 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7127.xy, uint(rint(_7127.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7127.xy, uint(rint(_7127.z)), level(0.0)).x;
        _1972 = _1974;
    }
    float _1976 = _1972;
    float _1978 = _1854;
    if (_1884)
    {
        float3 _7142 = float3(_1826, _1854, float(as_type<int>(_1958)));
        float3 _7144 = select(_7142, float3(0.0), isnan(_7142));
        float _1980 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7144.xy, uint(rint(_7144.z)), _1946, level(0.0));
        _1978 = _1980;
    }
    float _1982 = _1978;
    float3 _7154 = float3(_1968, _1970, _1966);
    float _1984 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7154, float3(0.0), isnan(_7154)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7154, float3(0.0), isnan(_7154)), level(0.0)).x;
    float3 _7163 = float3(_1968, _1970, _1966);
    float4 _1987 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7163, float3(0.0), isnan(_7163)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7163, float3(0.0), isnan(_7163)), level(0.0)).xyzw;
    float _1989 = _1987.x;
    float _1991 = _1987.y;
    float _1993 = _1987.z;
    float _1995 = _1987.w;
    bool _1997 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1999 = isnan(0.5);
    bool _2001 = _1997 || _1999;
    bool _2003 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2005 = _2001 || _2003;
    if (_1307)
    {
        _1496 = 1.0;
    }
    float _2007 = _1496;
    float _2009 = _2007;
    if (_2005)
    {
        _1930 = 1.0;
    }
    float _2011 = _1930;
    float _2013 = _2011;
    if (_2005)
    {
        _1456 = 1.0;
    }
    float _2015 = _1456;
    float _2017 = _2015;
    if (!_2005)
    {
        float _2019 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2021 = _2019 * 0.15915493667125701904296875;
        float _2023 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2025 = _2021 * 6.283185482025146484375;
        float _2027 = cos(_2025);
        float _2029 = _2023 * 0.15915493667125701904296875;
        float _2031 = _2021 * 6.283185482025146484375;
        float _2033 = sin(_2031);
        float _2035 = 1.0 / _2027;
        float _2037 = _2029 * 6.283185482025146484375;
        float _2039 = cos(_2037);
        float _2041 = _2033 * _2035;
        float _2043 = _2029 * 6.283185482025146484375;
        float _2045 = sin(_2043);
        float _2047 = _2039 * _2041;
        float _2049 = 1.0 / _2047;
        float _2051 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2053 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2051;
        float _2055 = 1.0 / _2053;
        float _2057 = _2045 * _2049;
        float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2061 = fma(_1223, _2057, _2059);
        float _2063 = _2061 * _2055;
        float _2065 = precise::clamp(_2063, 0.0, 1.0);
        _1938 = _2029;
        _2017 = _2065;
    }
    float _2067 = _1938;
    float _2069 = _2017;
    float _2071 = _2067;
    if (!_2005)
    {
        float _2073 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2075 = _2073 * 0.15915493667125701904296875;
        float _2077 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2079 = _2075 * 6.283185482025146484375;
        float _2081 = cos(_2079);
        float _2083 = _2077 * 0.15915493667125701904296875;
        float _2085 = _2075 * 6.283185482025146484375;
        float _2087 = sin(_2085);
        float _2089 = 1.0 / _2081;
        float _2091 = _2083 * 6.283185482025146484375;
        float _2093 = cos(_2091);
        float _2095 = _2087 * _2089;
        float _2097 = _2083 * 6.283185482025146484375;
        float _2099 = sin(_2097);
        float _2101 = _2093 * _2095;
        float _2103 = 1.0 / _2101;
        float _2105 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2107 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2105;
        float _2109 = 1.0 / _2107;
        float _2111 = _2099 * _2103;
        float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2115 = fma(_1223, _2111, _2113);
        float _2117 = _2115 * _2109;
        float _2119 = precise::clamp(_2117, 0.0, 1.0);
        float _2121 = -_2119;
        float _2123 = _2121 + 1.0;
        _2071 = _2101;
        _2013 = _2123;
    }
    float _2125 = _2071;
    float _2127 = _2013;
    float _2129 = _2125;
    if (!_1307)
    {
        int _2131 = _1368 << 4;
        int _2133 = _2131 + 2048;
        uint _2135 = uint(int(uint(_2133) >> uint(2)));
        uint _2137 = uint(int(uint(int(_2135)) >> uint(2)));
        int _2139 = int(_2135) & 3;
        float _2141 = (*spvDescriptorSet0.vp_c15)._m0[int(_2137)][_2139];
        int _2143 = int(_2135) + 1;
        uint _2145 = uint(int(uint(_2143) >> uint(2)));
        int _2147 = _2143 & 3;
        float _2149 = (*spvDescriptorSet0.vp_c15)._m0[int(_2145)][_2147];
        int _2151 = _2133 + 8;
        uint _2153 = uint(int(uint(_2151) >> uint(2)));
        uint _2155 = uint(int(uint(int(_2153)) >> uint(2)));
        int _2157 = int(_2153) & 3;
        float _2159 = (*spvDescriptorSet0.vp_c15)._m0[int(_2155)][_2157];
        int _2161 = int(_2153) + 1;
        uint _2163 = uint(int(uint(_2161) >> uint(2)));
        int _2165 = _2161 & 3;
        float _2167 = (*spvDescriptorSet0.vp_c15)._m0[int(_2163)][_2165];
        float _2169 = _1003 * _2149;
        float _2171 = fma(_373, _2141, _2169);
        float _2173 = fma(_375, _2159, _2171);
        float _2175 = _2173 + _2167;
        float _2177 = precise::clamp(_2175, 0.0, 1.0);
        float _2179 = -_2177;
        float _2181 = _2179 + _1976;
        float _2183 = fma(_2181, 500.0, 1.5);
        float _2185 = exp2(_2183);
        float _2187 = 0.0 + _2185;
        float _2189 = precise::clamp(_2187, 0.0, 1.0);
        _2009 = _2189;
    }
    float _2191 = _2009;
    float _2193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2195 = _1814 + _2193;
    float _2197 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2199 = _1816 + _2197;
    float _2201 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2203 = _1818 + _2201;
    float _2205 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2207 = int(_2205);
    float _2209 = _2195 * _2195;
    int _2211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2213 = _2211 != 0;
    float _2215 = fma(_2199, _2199, _2209);
    float _2217 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2219 = int(_2217);
    float _2221 = fma(_2203, _2203, _2215);
    if (_2213)
    {
        _773 = 1.0;
    }
    float _2223 = _773;
    float _2225 = rsqrt(_2221);
    float _2227 = float(uint(_2207));
    float _2229 = _2223;
    if (!_2213)
    {
        _2229 = 7.345489978790283203125;
    }
    float _2231 = _2229;
    float _2233 = sqrt(_2221);
    float _2235 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2237 = _2199 * _2235;
    float _2239 = _2203 * _2235;
    float _2241 = _2237 * _2237;
    float _2243 = _2239 * _2239;
    float _2245 = _2241 + _2243;
    float _2247 = sqrt(_2245);
    bool _2249 = _2247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2253 = _2247 + _2251;
    float _2255 = _2203;
    float _2257 = _2253;
    float _2259 = _2239;
    float _2261 = _2241;
    float _2263 = _2243;
    if (_2249)
    {
        float _2265 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2255 = _2265;
    }
    float _2267 = _2255;
    if (_2249)
    {
        float _2269 = rsqrt(_2245);
        _2129 = _2269;
    }
    float _2271 = _2129;
    if (_2249)
    {
        float _2273 = _2253 * _2267;
        _2257 = _2273;
    }
    float _2275 = _2257;
    float _2277 = 0.0;
    if (_2249)
    {
        float _2279 = _2275 * 0.15915493667125701904296875;
        _2277 = _2279;
    }
    float _2281 = _2277;
    float _2283 = _1966;
    float _2285 = _2281;
    if (_2249)
    {
        float _2287 = _2281 * 6.283185482025146484375;
        float _2289 = sin(_2287);
        _2283 = _2289;
    }
    float _2291 = _2283;
    float _2293 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2295 = precise::max(0.0, _2293);
    float _2297 = _2267;
    float _2299 = _2295;
    if (_2249)
    {
        float _2301 = _2281 * 6.283185482025146484375;
        float _2303 = cos(_2301);
        _2297 = _2303;
    }
    float _2305 = _2297;
    float _2307 = -_2235;
    float _2309 = -_2295;
    float _2311 = fma(_2195, _2307, _2309);
    float _2313 = float(uint(_2219));
    float _2315 = _2311;
    if (_2249)
    {
        float _2317 = _2311 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2299 = _2317;
    }
    float _2319 = _2299;
    float _2321 = _2319;
    if (!_2249)
    {
        _2285 = _2237;
    }
    float _2323 = _2285;
    float _2325 = 1.0 / _2227;
    float _2327 = _2291;
    float _2329 = _2323;
    if (_2249)
    {
        float _2331 = fma(_2291, _2319, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2327 = _2331;
    }
    float _2333 = _2327;
    float _2335 = _2333;
    if (_2249)
    {
        float _2337 = _2271 * _2333;
        _2321 = _2337;
    }
    float _2339 = _2321;
    if (_2249)
    {
        float _2341 = _2305 + (-1.0);
        _2335 = _2341;
    }
    float _2343 = _2335;
    float _2345 = trunc(_917);
    int _2347 = int(_2345);
    int _2349 = ~_2219;
    int _2351 = _2349 + 1;
    float _2353 = _2343;
    if (_2249)
    {
        float _2355 = _2237 * _2339;
        _2329 = _2355;
    }
    float _2357 = _2329;
    if (_2249)
    {
        float _2359 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2353 = _2359;
    }
    float _2361 = _2353;
    if (_2249)
    {
        float _2363 = _2239 * _2339;
        _2259 = _2363;
    }
    float _2365 = _2259;
    if (_2249)
    {
        float _2367 = _2357 * _2357;
        _2261 = _2367;
    }
    float _2369 = _2261;
    if (_2249)
    {
        float _2371 = fma(_2311, _2305, _2361);
        _2315 = _2371;
    }
    float _2373 = _2315;
    if (_2249)
    {
        float _2375 = _2365 * _2365;
        _2263 = _2375;
    }
    float _2377 = _2263;
    int _2379 = as_type<int>(_2325) + (-2);
    float _2381 = 1.0 / _2313;
    float _2383 = fma(_2373, _2373, _2369);
    float _2385 = _2383 + _2377;
    float _2387 = float(uint(_2347));
    float _2389 = trunc(_1103);
    int _2391 = int(_2389);
    float _2393 = as_type<float>(_2379) * _2387;
    float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2397 = fma(_2233, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2395);
    float _2399 = precise::clamp(_2397, 0.0, 1.0);
    float _2401 = rsqrt(_2385);
    float _2403 = -_2399;
    float _2405 = _2403 + 1.0;
    int _2407 = as_type<int>(_2381) + (-2);
    float _2409 = abs(_2405);
    float _2411 = log2(_2409);
    float _2413 = float(uint(_2391));
    float _2415 = as_type<float>(_2407) * _2413;
    float _2417 = _2401 * _2357;
    float _2419 = trunc(_2393);
    float _2421 = precise::max(_2419, 0.0);
    uint _2423 = uint(_2421);
    float _2425 = _2401 * _2373;
    float _2427 = _2401 * _2365;
    float _2429 = _2417 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2431 = -_2429;
    float _2433 = fma(_2425, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2431);
    int _2435 = ~_2207;
    int _2437 = _2435 + 1;
    float _2439 = trunc(_2415);
    float _2441 = precise::max(_2439, 0.0);
    uint _2443 = uint(_2441);
    float _2445 = _2411 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2447 = -_2427;
    float _2449 = fma(_2447, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2433);
    float _2451 = fma(_2449, -0.5, 0.5);
    float _2453 = fma(_2449, 0.5, 0.5);
    int _2455 = _2437 * int(_2423);
    int _2457 = _2455 + _2347;
    float _2459 = exp2(_2445);
    float _2461 = fma(_2453, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2463 = float(uint(_2457));
    float _2465 = fma(_2453, _2461, -0.212114393711090087890625);
    int _2467 = _2351 * int(_2443);
    int _2469 = _2467 + _2391;
    float _2471 = sqrt(_2451);
    float _2473 = as_type<float>(_2379) * _2463;
    float _2475 = _2425 + 1.0;
    float _2477 = fma(_2453, _2465, 1.570728778839111328125);
    float _2479 = float(uint(_2469));
    float _2481 = trunc(_2473);
    float _2483 = precise::max(_2481, 0.0);
    uint _2485 = uint(_2483);
    float _2487 = -_2425;
    float _2489 = fma(_2459, _2475, _2487);
    float _2491 = fma(_2489, 0.5, 0.5);
    float _2493 = _2471 * 0.636619746685028076171875;
    float _2495 = -_2477;
    float _2497 = fma(_2493, _2495, 1.0);
    float _2499 = as_type<float>(_2407) * _2479;
    float2 _7899 = float2(_2497, _2491);
    float3 _2503 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7899, float2(0.0), isnan(_7899)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7899, float2(0.0), isnan(_7899)), level(0.0)).xyz;
    float _2505 = _2503.x;
    float _2507 = _2503.y;
    float _2509 = _2503.z;
    float _2511 = trunc(_2499);
    float _2513 = precise::max(_2511, 0.0);
    uint _2515 = uint(_2513);
    float _2517 = _2231 * _133;
    int _2519 = int(_2423) + int(_2485);
    float _2521 = _2411 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2523 = _2493;
    float _2525 = as_type<float>(_2485);
    if (_2213)
    {
        _2523 = _133;
    }
    float _2527 = _2523;
    float _2529 = -_393;
    float _2531 = _2529 + 1.0;
    float _2533 = _2527;
    if (_2213)
    {
        _2525 = 1.0;
    }
    float _2535 = _2525;
    out.m_74.x = _1816;
    out.m_74.y = _1814;
    out.m_74.z = _1818;
    bool _2537 = _133 > 0.5;
    float _2539 = exp2(_2521);
    float _2541 = _2535;
    if (!_2213)
    {
        _2533 = _403;
    }
    float _2543 = _2533;
    if (!_2213)
    {
        _2541 = 1.2345600128173828125;
    }
    float _2545 = _2541;
    int _2547 = ~_2207;
    int _2549 = _2547 + 1;
    float _2551 = floor(_2517);
    int _2553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2555 = _2553 != 0;
    float _2557 = _2543 * _2545;
    float _2559 = float(_2207);
    int _2561 = _2549 * _2519;
    int _2563 = _2561 + _2347;
    float _2565 = float(_2347);
    int _2567 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2569 = _2567 != 0;
    float _2571 = floor(_2557);
    bool _2573 = _2565 >= _2559;
    bool _2575 = isnan(_2565);
    bool _2577 = _2573 || _2575;
    bool _2579 = isnan(_2559);
    bool _2581 = _2577 || _2579;
    float _2583 = float(_2581);
    bool _2585 = uint(_2563) >= uint(_2207);
    int _2587 = int(_2443) + int(_2515);
    int _2589 = ~_2219;
    int _2591 = _2589 + 1;
    float _2593 = trunc(_2583);
    int _2595 = int(_2593);
    bool _2597 = _403 > 0.5;
    float _2599 = -_2551;
    float _2601 = _2517 + _2599;
    float _2603 = float(_2219);
    int _2605 = _2591 * _2587;
    int _2607 = _2605 + _2391;
    float _2609 = float(_2391);
    bool _2611 = !_2585;
    int _2613 = _2611 ? 0 : (-1);
    float _2615 = -_2571;
    float _2617 = _2557 + _2615;
    bool _2619 = _2609 >= _2603;
    bool _2621 = isnan(_2609);
    bool _2623 = _2619 || _2621;
    bool _2625 = isnan(_2603);
    bool _2627 = _2623 || _2625;
    float _2629 = float(_2627);
    int _2631 = ~_2519;
    int _2633 = _2631 + _2613;
    int _2635 = _2633 + 1;
    float _2637 = _2601 * _2559;
    bool _2639 = uint(_2607) >= uint(_2219);
    float _2641 = _2559 * _1143;
    int _2643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2645 = _2643 != 0;
    float _2647 = trunc(_2629);
    int _2649 = int(_2647);
    bool _2651 = !_2639;
    int _2653 = _2651 ? 0 : (-1);
    int _2655 = _2207 * _2635;
    int _2657 = _2655 + _2347;
    bool _2659 = !_2645;
    int _2661 = _2659 ? 0 : 1;
    float _2663 = _2617 * _2603;
    bool _2665 = _2207 == 0;
    float _2667 = _2603 * _1143;
    int _2669 = ~_2587;
    int _2671 = _2669 + _2653;
    int _2673 = _2671 + 1;
    float _2675 = trunc(_2637);
    int _2677 = int(_2675);
    int _2679 = ~_2595;
    int _2681 = _2679 + 1;
    int _2683 = _2681 + 1;
    bool _2685 = !_2665;
    int _2687 = _2685 ? _2657 : (-1);
    int _2689 = _2219 * _2673;
    int _2691 = _2689 + _2391;
    int _2693 = _2207 + (-1);
    int _2695 = abs(_909);
    float _2697 = trunc(_2641);
    int _2699 = int(_2697);
    int _2701 = _2687 * _2683;
    bool _2703 = _2219 == 0;
    int _2705 = abs(_2661);
    int _2707 = _2595 * _2693;
    int _2709 = _2707 + _2701;
    int _2711 = abs(_915);
    int _2713 = _2677 * _2705;
    int _2715 = _2713 + _2347;
    int _2717 = ~_2649;
    int _2719 = _2717 + 1;
    int _2721 = _2719 + 1;
    float _2723 = trunc(_2667);
    int _2725 = int(_2723);
    bool _2727 = !_2703;
    int _2729 = _2727 ? _2691 : (-1);
    int _2731 = _2709 * _2695;
    int _2733 = abs(_921);
    int _2735 = _2729 * _2721;
    bool _2737 = !_2555;
    int _2739 = _2737 ? 0 : 1;
    int _2741 = _2699 * _2711;
    int _2743 = _2741 + _2731;
    float _2745 = float(uint(_2715));
    float _2747 = trunc(_2663);
    int _2749 = int(_2747);
    int _2751 = abs(_2739);
    int _2753 = _2715 * _2733;
    int _2755 = _2753 + _2743;
    int _2757 = _2219 + (-1);
    float _2759 = as_type<float>(_2379) * _2745;
    int _2761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2763 = _2761 != 0;
    int _2765 = _2677 * _2751;
    int _2767 = _2765 + _2755;
    int _2769 = abs(_1690);
    int _2771 = _2649 * _2757;
    int _2773 = _2771 + _2735;
    int _2775 = abs(_1672);
    float _2777 = trunc(_2759);
    float _2779 = precise::max(_2777, 0.0);
    uint _2781 = uint(_2779);
    int _2783 = abs(_1694);
    float _2785 = float(uint(_2767));
    int _2787 = _2773 * _2775;
    bool _2789 = !_2763;
    int _2791 = _2789 ? 0 : 1;
    bool _2793 = _395 > 0.5;
    float _2795 = as_type<float>(_2379) * _2785;
    int _2797 = abs(_2791);
    float _2799 = in.m_63.w;
    int _2801 = ~_2207;
    int _2803 = _2801 + 1;
    int _2805 = _2725 * _2769;
    int _2807 = _2805 + _2787;
    int _2809 = abs(_1698);
    int _2811 = _2749 * _2797;
    int _2813 = _2811 + _2391;
    float _2815 = trunc(_2795);
    float _2817 = precise::max(_2815, 0.0);
    uint _2819 = uint(_2817);
    int _2821 = ~_2207;
    int _2823 = _2821 + 1;
    float _2825 = float(uint(_2813));
    int _2827 = _2813 * _2783;
    int _2829 = _2827 + _2807;
    float _2831 = abs(_1223);
    float _2833 = log2(_2831);
    float _2835 = as_type<float>(_2407) * _2825;
    float _2837 = -_217;
    int _2839 = _2537 ? as_type<int>(_2837) : as_type<int>(_217);
    int _2841 = _2803 * int(_2781);
    int _2843 = _2841 + _2715;
    int _2845 = _2749 * _2809;
    int _2847 = _2845 + _2829;
    bool _2849 = !_2569;
    float _2851 = _2849 ? _217 : as_type<float>(_2839);
    float _2853 = trunc(_2835);
    float _2855 = precise::max(_2853, 0.0);
    uint _2857 = uint(_2855);
    float _2859 = float(uint(_2843));
    int _2861 = _2823 * int(_2819);
    int _2863 = _2861 + _2767;
    float _2865 = float(uint(_2847));
    float _2867 = _2851 + 0.5;
    bool _2869 = _2799 > 0.5;
    float _2871 = float(uint(_2863));
    float _2873 = as_type<float>(_2407) * _2865;
    float _2875 = fma(_2867, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1141);
    float _2877 = as_type<float>(_2379) * _2859;
    int _2879 = ~_2219;
    int _2881 = _2879 + 1;
    float _2883 = as_type<float>(_2379) * _2871;
    int _2885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2887 = _2885 != 0;
    float _2889 = trunc(_2873);
    float _2891 = precise::max(_2889, 0.0);
    uint _2893 = uint(_2891);
    float _2895 = -_227;
    int _2897 = _2597 ? as_type<int>(_2895) : as_type<int>(_227);
    int _2899 = _2881 * int(_2857);
    int _2901 = _2899 + _2813;
    int _2903 = ~_2219;
    int _2905 = _2903 + 1;
    float _2907 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2909 = !_2887;
    float _2911 = _2909 ? _227 : as_type<float>(_2897);
    float _2913 = float(uint(_2901));
    float _2915 = trunc(_2883);
    float _2917 = precise::max(_2915, 0.0);
    uint _2919 = uint(_2917);
    int _2921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2923 = _2921 != 0;
    float _2925 = _2911 + (-0.5);
    float _2927 = -_217;
    int _2929 = _2793 ? as_type<int>(_2927) : as_type<int>(_217);
    int _2931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2933 = _2931 != 0;
    float _2935 = -_2925;
    float _2937 = -_551;
    float _2939 = fma(_2935, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2937);
    float _2941 = as_type<float>(_2407) * _2913;
    int _2943 = _2905 * int(_2893);
    int _2945 = _2943 + _2847;
    float _2947 = -_227;
    int _2949 = _2869 ? as_type<int>(_2947) : as_type<int>(_227);
    float _2951 = trunc(_2877);
    float _2953 = precise::max(_2951, 0.0);
    uint _2955 = uint(_2953);
    bool _2957 = !_2923;
    float _2959 = _2957 ? _217 : as_type<float>(_2929);
    float _2961 = float(uint(_2945));
    float _2963 = -_1145;
    float _2965 = _2963 + 1.0;
    bool _2967 = !_2933;
    float _2969 = _2967 ? _227 : as_type<float>(_2949);
    float _2971 = _2959 + 0.5;
    int _2973 = int(_2819) + int(_2919);
    float _2975 = as_type<float>(_2407) * _2961;
    float _2977 = -_2965;
    float _2979 = fma(_2851, _2977, _2875);
    float _2981 = -_1067;
    float _2983 = _2981 + 1.0;
    int _2985 = ~_2207;
    int _2987 = _2985 + 1;
    float _2989 = _2969 + (-0.5);
    float _2991 = fma(_2971, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1153);
    float _2993 = trunc(_2975);
    float _2995 = precise::max(_2993, 0.0);
    uint _2997 = uint(_2995);
    float _2999 = -_1147;
    float _3001 = _2999 + 1.0;
    int _3003 = _2987 * _2973;
    int _3005 = _3003 + _2767;
    float _3007 = -_2989;
    float _3009 = -_1045;
    float _3011 = fma(_3007, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3009);
    float _3013 = -_1149;
    float _3015 = _3013 + 1.0;
    float _3017 = fma(_2911, _3001, _2939);
    float _3019 = -_2983;
    float _3021 = fma(_2959, _3019, _2991);
    bool _3023 = uint(_3005) >= uint(_2207);
    float _3025 = fma(_2969, _3015, _3011);
    float _3027 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3029 = int(_2781) + int(_2955);
    float _3031 = exp2(_2907);
    bool _3033 = !_3023;
    int _3035 = _3033 ? 0 : (-1);
    out.m_76.x = _2979;
    out.m_76.y = _3017;
    out.m_76.z = _3021;
    out.m_76.w = _3025;
    int _3037 = ~_2219;
    int _3039 = _3037 + 1;
    float _3041 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3043 = int(_2893) + int(_2997);
    float _3045 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3047 = ~_2973;
    int _3049 = _3047 + _3035;
    int _3051 = _3049 + 1;
    float _3053 = trunc(_2941);
    float _3055 = precise::max(_3053, 0.0);
    uint _3057 = uint(_3055);
    int _3059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3061 = _3059 != 0;
    float _3063 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3041);
    int _3065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3067 = _3065 != 0;
    int _3069 = _2207 * _3051;
    int _3071 = _3069 + _2767;
    float _3073 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3075 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3077 = -_1372;
    float _3079 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3027);
    float _3081 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3083 = -_1372;
    float _3085 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3073);
    float _3087 = -_1372;
    float _3089 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3075);
    float _3091 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3079);
    int _3093 = _3039 * _3043;
    int _3095 = _3093 + _2847;
    float _3097 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3099 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3101 = fma(_3031, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3103 = precise::clamp(_3101, 0.0, 1.0);
    float _3105 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3085);
    bool _3107 = uint(_3095) >= uint(_2219);
    float _3109 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3081);
    bool _3111 = !_2665;
    int _3113 = _3111 ? _3071 : (-1);
    float _3115 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3089);
    bool _3117 = !_3107;
    int _3119 = _3117 ? 0 : (-1);
    float _3121 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3097);
    int _3123 = _3113 & 3;
    bool _3125 = _3123 != 0;
    float _3127 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3099);
    int _3129 = _3113 & 3;
    bool _3131 = _3129 != 0;
    float _3133 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3135 = ~_3043;
    int _3137 = _3135 + _3119;
    int _3139 = _3137 + 1;
    float _3141 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3045);
    int _3143 = _3125 ? 0 : 1;
    float _3145 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3133);
    bool _3147 = uint(_3129) > 1u;
    int _3149 = _2219 * _3139;
    int _3151 = _3149 + _2847;
    int _3153 = _3113 >> 31;
    float _3155 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3157 = ~_2207;
    int _3159 = _3157 + 1;
    float _3161 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3145);
    int _3163 = _3153 & 3;
    float _3165 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3109);
    bool _3167 = !_3131;
    int _3169 = _3167 ? 0 : 1;
    float _3171 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3127);
    int _3173 = _3113 + _3163;
    int _3175 = _3159 * _3029;
    int _3177 = _3175 + _2715;
    bool _3179 = !_2703;
    int _3181 = _3179 ? _3151 : (-1);
    float _3183 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3141);
    int _3185 = ~_3143;
    int _3187 = _3185 + 1;
    int _3189 = _3187 + 1;
    float _3191 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3193 = uint(_3129) >= 2u;
    float _3195 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3063);
    int _3197 = _3189;
    if (!_3147)
    {
        int _3199 = ~_3143;
        int _3201 = _3199 + 1;
        _3197 = _3201;
    }
    int _3203 = _3197;
    float _3205 = _3191 * _3091;
    bool _3207 = _3129 != 3;
    int _3209 = _3181 >> 31;
    float _3211 = fma(_3155, _3165, _3205);
    int _3213 = _3193 ? 0 : 1;
    int _3215 = _3173 >> 2;
    bool _3217 = uint(_3177) >= uint(_2207);
    int _3219 = _3209 & 3;
    int _3221 = _3215 << 4;
    int _3223 = _3221 + 368;
    int _3225 = _3181 + _3219;
    int _3227 = int(_2857) + int(_3057);
    uint _3229 = uint(int(uint(_3223) >> uint(2)));
    uint _3231 = uint(int(uint(int(_3229)) >> uint(2)));
    int _3233 = int(_3229) & 3;
    float _3235 = (*spvDescriptorSet0.vp_c9)._m0[int(_3231)][_3233];
    int _3237 = int(_3229) + 1;
    uint _3239 = uint(int(uint(_3237) >> uint(2)));
    int _3241 = _3237 & 3;
    float _3243 = (*spvDescriptorSet0.vp_c9)._m0[int(_3239)][_3241];
    int _3245 = ~_2219;
    int _3247 = _3245 + 1;
    int _3249 = ~_3213;
    int _3251 = _3249 + 1;
    int _3253 = _3251 + 1;
    int _3255 = _3225 >> 2;
    int _3257 = _3247 * _3227;
    int _3259 = _3257 + _2813;
    int _3261 = _3253;
    if (_3207)
    {
        int _3263 = ~_3213;
        int _3265 = _3263 + 1;
        _3261 = _3265;
    }
    int _3267 = _3261;
    int _3269 = _3181 & 3;
    bool _3271 = _3269 != 0;
    int _3273 = _3255 << 4;
    int _3275 = _3273 + 512;
    float _3277 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3121);
    bool _3279 = !_3271;
    int _3281 = _3279 ? 0 : 1;
    int _3283 = _3181 & 3;
    bool _3285 = _3283 != 0;
    int _3287 = _3275 + 8;
    uint _3289 = uint(int(uint(_3287) >> uint(2)));
    uint _3291 = uint(int(uint(int(_3289)) >> uint(2)));
    int _3293 = int(_3289) & 3;
    float _3295 = (*spvDescriptorSet0.vp_c9)._m0[int(_3291)][_3293];
    int _3297 = int(_3289) + 1;
    uint _3299 = uint(int(uint(_3297) >> uint(2)));
    int _3301 = _3297 & 3;
    float _3303 = (*spvDescriptorSet0.vp_c9)._m0[int(_3299)][_3301];
    bool _3305 = !_3217;
    int _3307 = _3305 ? 0 : (-1);
    out.m_78.x = _3165;
    out.m_78.y = _3277;
    out.m_78.z = _3171;
    bool _3309 = uint(_3259) >= uint(_2219);
    int _3311 = _3285 ? 0 : 1;
    bool _3313 = uint(_3269) >= 2u;
    uint _3315 = uint(int(uint(_3275) >> uint(2)));
    uint _3317 = uint(int(uint(int(_3315)) >> uint(2)));
    int _3319 = int(_3315) & 3;
    float _3321 = (*spvDescriptorSet0.vp_c9)._m0[int(_3317)][_3319];
    int _3323 = int(_3315) + 1;
    uint _3325 = uint(int(uint(_3323) >> uint(2)));
    int _3327 = _3323 & 3;
    float _3329 = (*spvDescriptorSet0.vp_c9)._m0[int(_3325)][_3327];
    int _3331 = ~_3029;
    int _3333 = _3331 + _3307;
    int _3335 = _3333 + 1;
    float _3337 = _3191 * _3105;
    int _3339 = _3313 ? 0 : 1;
    float _3341 = _3191 * _3115;
    bool _3343 = uint(_3269) > 1u;
    float _3345 = fma(_3155, _3277, _3337);
    bool _3347 = !_3309;
    int _3349 = _3347 ? 0 : (-1);
    int _3351 = _3223 + 8;
    uint _3353 = uint(int(uint(_3351) >> uint(2)));
    uint _3355 = uint(int(uint(int(_3353)) >> uint(2)));
    int _3357 = int(_3353) & 3;
    float _3359 = (*spvDescriptorSet0.vp_c9)._m0[int(_3355)][_3357];
    int _3361 = int(_3353) + 1;
    uint _3363 = uint(int(uint(_3361) >> uint(2)));
    int _3365 = _3361 & 3;
    float _3367 = (*spvDescriptorSet0.vp_c9)._m0[int(_3363)][_3365];
    bool _3369 = _3269 != 3;
    float _3371 = fma(_3155, _3171, _3341);
    int _3373 = ~_3311;
    int _3375 = _3373 + 1;
    int _3377 = _3375 + 1;
    int _3379 = _2207 * _3335;
    int _3381 = _3379 + _2715;
    int _3383 = ~_3227;
    int _3385 = _3383 + _3349;
    int _3387 = _3385 + 1;
    int _3389 = abs(_3203);
    int _3391 = abs(_3169);
    int _3393 = _2219 * _3387;
    int _3395 = _3393 + _2813;
    int _3397 = _3377;
    if (!_3343)
    {
        int _3399 = ~_3311;
        int _3401 = _3399 + 1;
        _3397 = _3401;
    }
    int _3403 = _3397;
    int _3405 = ~_3339;
    int _3407 = _3405 + 1;
    int _3409 = _3407 + 1;
    int _3411 = abs(_3403);
    int _3413 = ~_3389;
    int _3415 = _3413 + 1;
    int _3417 = _3415 + 1;
    int _3419 = _3409;
    if (_3369)
    {
        int _3421 = ~_3339;
        int _3423 = _3421 + 1;
        _3419 = _3423;
    }
    int _3425 = _3419;
    int _3427 = _3417 * as_type<int>(_3243);
    int _3429 = abs(_3267);
    int _3431 = abs(_3281);
    int _3433 = abs(_3425);
    int _3435 = ~_3391;
    int _3437 = _3435 + 1;
    int _3439 = _3437 + 1;
    int _3441 = ~_3411;
    int _3443 = _3441 + 1;
    int _3445 = _3443 + 1;
    int _3447 = _3439 * as_type<int>(_3235);
    int _3449 = _3447 + _3427;
    int _3451 = ~_3429;
    int _3453 = _3451 + 1;
    int _3455 = _3453 + 1;
    int _3457 = _3445 * as_type<int>(_3329);
    int _3459 = ~_3431;
    int _3461 = _3459 + 1;
    int _3463 = _3461 + 1;
    bool _3465 = _3129 != 3;
    bool _3467 = _3269 != 3;
    int _3469 = _3463 * as_type<int>(_3321);
    int _3471 = _3469 + _3457;
    int _3473 = ~_3433;
    int _3475 = _3473 + 1;
    int _3477 = _3475 + 1;
    int _3479 = _3455 * as_type<int>(_3359);
    int _3481 = _3479 + _3449;
    bool _3483 = !_3465;
    int _3485 = _3483 ? 0 : (-1);
    float _3487 = fma(_3191, _3191, 1.0);
    bool _3489 = !_3061;
    int _3491 = _3489 ? 0 : 1;
    int _3493 = _3477 * as_type<int>(_3295);
    int _3495 = _3493 + _3471;
    bool _3497 = !_3467;
    int _3499 = _3497 ? 0 : (-1);
    float _3501 = rsqrt(_3487);
    int _3503 = abs(_3485);
    bool _3505 = !_3067;
    int _3507 = _3505 ? 0 : 1;
    int _3509 = abs(_3491);
    int _3511 = abs(_3499);
    int _3513 = abs(_3507);
    float _3515 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3517 = _3191 * _3501;
    int _3519 = ~_3503;
    int _3521 = _3519 + 1;
    int _3523 = _3521 + 1;
    float _3525 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3515);
    int _3527 = ~_3511;
    int _3529 = _3527 + 1;
    int _3531 = _3529 + 1;
    float _3533 = -_3195;
    float _3535 = _3517 * _3533;
    int _3537 = ~_3509;
    int _3539 = _3537 + 1;
    int _3541 = _3539 + 1;
    int _3543 = _3523 * as_type<int>(_3367);
    int _3545 = _3543 + _3481;
    bool _3547 = !_2665;
    int _3549 = _3547 ? _3381 : (-1);
    int _3551 = _3531 * as_type<int>(_3303);
    int _3553 = _3551 + _3495;
    int _3555 = _3545 * _3541;
    bool _3557 = !_2703;
    int _3559 = _3557 ? _3395 : (-1);
    float _3561 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3525);
    int _3563 = ~_3513;
    int _3565 = _3563 + 1;
    int _3567 = _3565 + 1;
    int _3569 = _3549 * _3509;
    int _3571 = _3569 + _3555;
    float _3573 = -_3161;
    float _3575 = _3517 * _3573;
    float _3577 = _1926 + _1902;
    int _3579 = _3553 * _3567;
    float _3581 = fma(_3501, _3091, _3575);
    float _3583 = fma(_3501, _3105, _3535);
    float _3585 = _1902 * 0.5;
    int _3587 = _3559 * _3513;
    int _3589 = _3587 + _3579;
    float _3591 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3561);
    float _3593 = _3161 + _3211;
    float _3595 = fma(_1928, -0.5, _3585);
    float _3597 = float(_3571);
    float _3599 = _3591 + _1902;
    out.gl_Position.x = _1926;
    out.gl_Position.y = _1928;
    out.gl_Position.z = _3591;
    out.gl_Position.w = _1902;
    bool _3601 = _1223 <= 8000.0;
    bool _3603 = isnan(_1223);
    bool _3605 = _3601 || _3603;
    bool _3607 = isnan(8000.0);
    bool _3609 = _3605 || _3607;
    float _3611 = float(_3609);
    float _3613 = -_3183;
    float _3615 = _3517 * _3613;
    float _3617 = _3599 * 0.5;
    float _3619 = fma(_3103, -2.0, 3.0);
    float _3621 = _3103 * _3103;
    float _3623 = _3577 * 0.5;
    float _3625 = float(_3589);
    float _3627 = _3195 + _3345;
    float _3629 = _3621 * _3619;
    float _3631 = _3183 + _3371;
    out.m_80.x = _3623;
    out.m_80.y = _3595;
    out.m_80.z = _3617;
    out.m_80.w = _1902;
    float _3633 = fma(_3501, _3115, _3615);
    float _3635 = -_2539;
    float _3637 = _3635 + 1.0;
    float _3639 = -_3629;
    float _3641 = _3639 + 1.0;
    out.m_82.x = _3597;
    out.m_82.y = _3625;
    float _3643 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3645 = fma(_3641, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3629);
    float _3647 = _3641;
    float _3649 = _3643;
    float _3651 = _3581;
    if (!_1884)
    {
        _3647 = 1.0;
    }
    float _3653 = _3647;
    out.m_84.x = _3593;
    out.m_84.y = _3627;
    out.m_84.z = _3631;
    float _3655 = _3643 * _1984;
    float _3657 = _3653;
    if (_1884)
    {
        bool _3659 = _1982 >= _1946;
        bool _3661 = isnan(_1982);
        bool _3663 = _3659 || _3661;
        bool _3665 = isnan(_1946);
        bool _3667 = _3663 || _3665;
        float _3669 = float(_3667);
        _3657 = _3669;
    }
    float _3671 = _3657;
    float _3673 = -_3643;
    float _3675 = _3673 + 1.0;
    float _3677 = _3611 * _3645;
    float _3679 = _1995 * _3655;
    float _3681 = _2509 * _3655;
    bool _3683 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3685 = isnan(_2233);
    bool _3687 = _3683 || _3685;
    bool _3689 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3691 = _3687 || _3689;
    float _3693 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3695 = fma(_2505, _3679, _1989);
    float _3697 = fma(_2507, _3679, _1991);
    float _3699 = _1995 * _3675;
    float _3701 = fma(_1995, _3681, _1993);
    float _3703 = _2531 * _3693;
    float _3705 = precise::clamp(_3703, 0.0, 1.0);
    float _3707 = _3671 * _2191;
    out.m_86.x = _3581;
    out.m_86.y = _3583;
    out.m_86.z = _3633;
    float _3709 = -_3705;
    float _3711 = fma(_3709, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_88.x = _3695;
    out.m_88.y = _3697;
    out.m_88.z = _3701;
    out.m_88.w = _3699;
    float _3713 = _3675;
    float _3715 = _3693;
    if (!_3691)
    {
        _3649 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3717 = _3649;
    float _3719 = -_3707;
    float _3721 = fma(_3719, _3711, 1.0);
    float _3723 = precise::clamp(_3721, 0.0, 1.0);
    float _3725 = _3717;
    float _3727 = _3717;
    if (!_3691)
    {
        _3713 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3729 = _3713;
    float _3731 = _3729;
    float _3733 = _3729;
    if (!_3691)
    {
        _3715 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3735 = _3715;
    float _3737 = _3723 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3739 = _2069 * _2127;
    float _3741 = _3739;
    float _3743 = _3737;
    float _3745 = _3735;
    float _3747 = _3735;
    if (!_3691)
    {
        _3651 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3749 = _3651;
    out.m_90.x = _3737;
    float _3751 = _3739 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3753 = _3749;
    float _3755 = _3749;
    if (!_3691)
    {
        _3741 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3757 = _3741;
    float _3759 = _3757;
    float _3761 = _3757;
    if (!_3691)
    {
        _3743 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3763 = _3743;
    bool _3765 = !_3691;
    float _3767 = _3763;
    float _3769 = _3763;
    if (!_3765)
    {
        bool _3771 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3773 = isnan(_2233);
        bool _3775 = _3771 || _3773;
        bool _3777 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3779 = _3775 || _3777;
        if (!_3779)
        {
            float _3781 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3783 = _2233 + _3781;
            float _3785 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3787 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3785;
            float _3789 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3791 = _3789 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3793 = 1.0 / _3787;
            float _3795 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3797 = _3795 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3799 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3801 = _3799 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3803 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3805 = _3803 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3807 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3809 = _3807 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3811 = _3783 * _3793;
            float _3813 = precise::clamp(_3811, 0.0, 1.0);
            float _3815 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3817 = _3815 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3819 = fma(_3813, _3791, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3821 = fma(_3813, _3817, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3823 = fma(_3813, _3797, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3825 = fma(_3813, _3801, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3827 = fma(_3813, _3805, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3829 = fma(_3813, _3809, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3727 = _3823;
            _3769 = _3827;
            _3755 = _3819;
            _3747 = _3825;
            _3733 = _3821;
            _3761 = _3829;
            _3831 = true;
        }
        else
        {
            bool _3833 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3835 = isnan(_2233);
            bool _3837 = _3833 || _3835;
            bool _3839 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3841 = _3837 || _3839;
            if (!_3841)
            {
                _3753 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3843 = _3753;
            _3755 = _3843;
            if (!_3841)
            {
                _3725 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3845 = _3725;
            _3727 = _3845;
            if (!_3841)
            {
                _3731 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3847 = _3731;
            _3733 = _3847;
            if (!_3841)
            {
                _3745 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3849 = _3745;
            _3747 = _3849;
            if (!_3841)
            {
                _3767 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3851 = _3767;
            _3769 = _3851;
            if (!_3841)
            {
                _3759 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3853 = _3759;
            bool _3855 = !_3841;
            _3761 = _3853;
            if (!_3855)
            {
                bool _3857 = _2233 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3859 = isnan(_2233);
                bool _3861 = _3857 || _3859;
                bool _3863 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3865 = _3861 || _3863;
                if (!_3865)
                {
                    float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3869 = _2233 + _3867;
                    float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3873 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3871;
                    float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3877 = _3875 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3879 = 1.0 / _3873;
                    float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3893 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3897 = _3869 * _3879;
                    float _3899 = precise::clamp(_3897, 0.0, 1.0);
                    float _3901 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3903 = _3901 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3905 = fma(_3899, _3877, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3907 = fma(_3899, _3903, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3909 = fma(_3899, _3883, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3911 = fma(_3899, _3887, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3913 = fma(_3899, _3891, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3915 = fma(_3899, _3895, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3727 = _3909;
                    _3769 = _3913;
                    _3755 = _3905;
                    _3747 = _3911;
                    _3733 = _3907;
                    _3761 = _3915;
                    _3831 = true;
                }
                else
                {
                    _3727 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3769 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3755 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3747 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3733 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3761 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3831 = false;
    float _3917 = _3727;
    float _3919 = _3769;
    float _3921 = _3755;
    float _3923 = _3747;
    float _3925 = _3733;
    float _3927 = _3761;
    float _3929 = fma(_3627, -0.5, 0.5);
    float _3931 = precise::clamp(_3929, 0.0, 1.0);
    float _3933 = -_3917;
    float _3935 = _3933 + _3919;
    float _3937 = _3751 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3939 = -_3921;
    float _3941 = _3939 + _3923;
    float _3943 = fma(_3931, _3935, _3917);
    out.m_92.x = 0.0;
    float _3945 = -_3925;
    float _3947 = _3945 + _3927;
    float _3949 = fma(_3931, _3941, _3921);
    float _3951 = _3943 * 0.586610972881317138671875;
    out.m_59.x = _3937;
    bool _3953 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3955 = fma(_3931, _3947, _3925);
    float _3957 = fma(_3949, 0.298911988735198974609375, _3951);
    bool _3959 = _2069 > 0.0;
    bool _3961 = isnan(_2069);
    bool _3963 = _3959 || _3961;
    bool _3965 = isnan(0.0);
    bool _3967 = _3963 || _3965;
    float _3969 = fma(_3955, 0.114477999508380889892578125, _3957);
    bool _3971 = _2127 <= 0.0;
    bool _3973 = !_3967;
    bool _3975 = _3971 || _3973;
    float _3977 = -_3969;
    float _3979 = _3949 + _3977;
    float _3981 = -_3969;
    float _3983 = _3943 + _3981;
    float _3985 = -_3969;
    float _3987 = _3955 + _3985;
    float _3989 = fma(_3979, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3969);
    float _3991 = fma(_3983, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3969);
    float _3993 = fma(_3987, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3969);
    bool _3995 = !_3953;
    if (!_3995)
    {
        float _3997 = -_1814;
        float _3999 = _3997 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4001 = -_1816;
        float _4003 = _4001 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4005 = -_1818;
        float _4007 = _4005 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4009 = _3999 * _3999;
        float _4011 = fma(_4003, _4003, _4009);
        float _4013 = fma(_4007, _4007, _4011);
        float _4015 = sqrt(_4013);
        float _4017 = rsqrt(_4013);
        float _4019 = -_4015;
        float _4021 = _4019 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4023 = _4021 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4025 = precise::clamp(_4023, 0.0, 1.0);
        float _4027 = _4003 * _4017;
        float _4029 = _3999 * _4017;
        float _4031 = abs(_4025);
        float _4033 = log2(_4031);
        float _4035 = _4007 * _4017;
        float _4037 = _4027 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4039 = _3627 * _4029;
        float _4041 = -_4029;
        float _4043 = -_4037;
        float _4045 = fma(_4041, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4043);
        float _4047 = fma(_3593, _4027, _4039);
        float _4049 = -_4035;
        float _4051 = fma(_4049, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4045);
        float _4053 = fma(_3631, _4035, _4047);
        float _4055 = precise::clamp(_4053, 0.0, 1.0);
        float _4057 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4059 = _4051 + _4057;
        float _4061 = _4033 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4063 = _4059 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4065 = precise::clamp(_4063, 0.0, 1.0);
        float _4067 = exp2(_4061);
        float _4069 = _4067 * _4065;
        float _4071 = _4055 * _4069;
        float _4073 = _4071 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4075 = _4071 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4077 = _4071 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _4073;
        out.m_92.y = _4075;
        out.m_92.z = _4077;
    }
    out.m_94.x = _3989;
    out.m_94.y = _3991;
    out.m_94.z = _3993;
    if (!_3975)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _4079 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4079;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

