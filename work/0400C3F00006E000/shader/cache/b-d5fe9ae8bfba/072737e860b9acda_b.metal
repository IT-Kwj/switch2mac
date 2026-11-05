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
    texture2d_array<float> vp_t_tcb_16 [[id(8)]];
    sampler vp_t_tcb_16Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d_array<float> vp_t_tcb_14 [[id(14)]];
    sampler vp_t_tcb_14Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_14Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_84 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_72 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_88 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_70 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3783 = false;
    bool _209 = false;
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
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4068 = as_type<float>(_129);
        out.gl_Position.z = _4068;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_61.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _123 = _151;
    }
    float _153 = _123;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_59.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4138 = as_type<float>(_167);
        out.gl_Position.z = _4138;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _173 = as_type<int>(_169) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_169) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _207;
    if (!_189)
    {
        float _191 = in.m_66.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_113);
        float _213 = 1.0 / _211;
        float _215 = _147 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = in.m_56.x;
    float _221 = in.m_56.y;
    float _223 = in.m_56.z;
    float _225 = _221 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _227 = _221 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _229 = fma(_219, (*spvDescriptorSet0.vp_c10)._m0[4].x, _225);
    float _231 = fma(_219, (*spvDescriptorSet0.vp_c10)._m0[6].x, _227);
    float _233 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[4].z, _229);
    float _235 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[6].z, _231);
    float _237 = _233 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _239 = _235 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _241 = fma(_237, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _243 = fma(_239, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _245 = floor(_241);
    float _247 = floor(_243);
    float _249 = -_245;
    float _251 = _241 + _249;
    float _253 = -_247;
    float _255 = _243 + _253;
    float2 _4287 = float2(_251, _255);
    float _257 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4287, float2(0.0), isnan(_4287)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4287, float2(0.0), isnan(_4287)), level(0.0)).x;
    float _259 = in.m_66.x;
    float _261 = in.m_66.y;
    float _263 = in.m_66.z;
    float _265 = in.m_66.w;
    float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _269 = log2(_267);
    float _271 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _291 = 1.0 / _275;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _295 = _293 != 0;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _299 = 1.0 / _283;
    float _301 = _259 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _303 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_217);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_289;
    float _317 = fma(_301, 2.0, _315);
    float _319 = _221 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = _217 + _321;
    float _325 = 1.0 / _279;
    float _327 = _259 * 2.0;
    float _329 = _323 * _291;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = _217 + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _337 = _217 + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _339;
    float _343 = 1.0 / _287;
    float _345 = _261 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _347 = _333 * _299;
    float _349 = _263 * 2.0;
    float _351 = _259 + _261;
    float _353 = fma(_345, -2.0, _297);
    float _355 = fma(_219, (*spvDescriptorSet0.vp_c10)._m0[5].x, _319);
    float _357 = floor(_327);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _361 = _217 + _359;
    float _363 = _261 * 2.0;
    float _365 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[5].z, _355);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _367;
    float _371 = _361 * _325;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _373;
    float _377 = floor(_349);
    float _379 = _337 * _343;
    float _381 = _263 + _259;
    float _383 = _351 + (-1.0);
    float _385 = _263 + _261;
    float _387 = fma(_369, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _389 = _381 + (-1.0);
    float _391 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _393 = _385 + (-1.0);
    bool _395 = _357 >= 0.0;
    bool _397 = isnan(_357);
    bool _399 = _395 || _397;
    bool _401 = isnan(0.0);
    bool _403 = _399 || _401;
    float _405 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _407 = as_type<int>(_389);
    if (_295)
    {
        _407 = 0;
    }
    int _409 = _407;
    float _411 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _413 = _409;
    if (!_295)
    {
        _413 = 1;
    }
    int _415 = _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _417;
    bool _421 = _357 > 0.0;
    float _423 = floor(_363);
    bool _425 = _377 > 0.0;
    float _427 = fma(_419, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _429 = _377 >= 0.0;
    bool _431 = isnan(_377);
    bool _433 = _429 || _431;
    bool _435 = isnan(0.0);
    bool _437 = _433 || _435;
    float _439 = fma(_341, _347, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _441 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _443 = isnan(_217);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = fma(_375, _347, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _455 = _403 ? 0 : 1;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _461 = _415 != 1;
    float _463 = -_451;
    float _465 = _463 + 1.0;
    bool _467 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _469 = isnan(_217);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _483 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _485 = isnan(_217);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = fma(_459, _371, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _497 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _499 = isnan(_217);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = fma(_481, _371, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _511 = _423 > 0.0;
    float _513 = _493 * _465;
    float _515 = -_493;
    float _517 = _515 + 1.0;
    float _519 = -_507;
    float _521 = _519 + 1.0;
    bool _523 = _423 >= 0.0;
    bool _525 = isnan(_423);
    bool _527 = _523 || _525;
    bool _529 = isnan(0.0);
    bool _531 = _527 || _529;
    float _533 = -_477;
    float _535 = _533 + 1.0;
    float _537 = _507 * _517;
    float _539 = _313 * _521;
    int _541 = ~_455;
    int _543 = _541 + 1;
    int _545 = _543 + 1;
    float _547 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _549 = int(_547);
    int _551 = _545;
    float _553 = _427;
    if (!_421)
    {
        int _555 = ~_455;
        int _557 = _555 + 1;
        _551 = _557;
    }
    int _559 = _551;
    float _561 = _387 * _539;
    int _563 = _437 ? 0 : 1;
    float _565 = _451 * _535;
    float _567 = _427 * _539;
    float _569 = _365 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _571 = ~_563;
    int _573 = _571 + 1;
    int _575 = _573 + 1;
    float _577 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _579 = int(_577);
    int _581 = _575;
    if (!_425)
    {
        int _583 = ~_563;
        int _585 = _583 + 1;
        _581 = _585;
    }
    int _587 = _581;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _593 = _591 != 0;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _597 = _595 != 0;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _601 = _599 != 0;
    float _603 = _569 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _605 = _531 ? 0 : 1;
    float _607 = _569 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (!_461)
    {
        _553 = _261;
    }
    float _609 = _553;
    float _611 = fma(_237, (*spvDescriptorSet0.vp_c8)._m0[11].x, _603);
    bool _613 = !_597;
    int _615 = _613 ? 0 : 1;
    float _617 = fma(_237, (*spvDescriptorSet0.vp_c8)._m0[10].x, _607);
    bool _619 = !_593;
    int _621 = _619 ? 0 : 1;
    float _623 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[11].z, _611);
    bool _625 = !_601;
    int _627 = _625 ? 0 : 1;
    float _629 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[10].z, _617);
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _633 = _631 != 0;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _637 = _635 != 0;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _641 = _639 != 0;
    float _643 = _623 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _645 = float(_113);
    float _647 = _629 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _649 = ~_605;
    int _651 = _649 + 1;
    int _653 = _651 + 1;
    float _655 = -_147;
    float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[76].x, _317);
    float _659 = _609;
    int _661 = _653;
    if (_461)
    {
        _659 = _259;
    }
    float _663 = _659;
    float _665 = _647 + _643;
    bool _667 = !_633;
    float _669 = _667 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _671 = 1.0 / _645;
    float _673 = _669;
    float _675 = _663;
    if (!_511)
    {
        int _677 = ~_605;
        int _679 = _677 + 1;
        _661 = _679;
    }
    int _681 = _661;
    float _683 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[83].z, _589);
    float _685 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _353);
    float _687 = float(_549);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _693 = abs(as_type<int>(_669));
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _697 = as_type<float>(_549);
    if (!_461)
    {
        _673 = _263;
    }
    float _699 = _673;
    float _701 = 1.0 / _687;
    float _703 = _699;
    if (!_461)
    {
        _675 = _263;
    }
    float _705 = _675;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _711 = _705;
    if (_461)
    {
        _703 = _261;
    }
    float _713 = _703;
    float _715 = fma(_691, _379, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _717 = _671 * _147;
    if (_461)
    {
        _711 = _261;
    }
    float _719 = _711;
    float _721 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[83].w, _695);
    float _723 = _269 * _147;
    if (!_461)
    {
        _697 = _261;
    }
    float _725 = _697;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _729 = _719 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _731 = _725;
    if (_461)
    {
        _731 = _259;
    }
    float _733 = _731;
    float _735 = exp2(_723);
    float _737 = float(_693);
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _741 = float(_587);
    float _743 = _733 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _745 = fma(_729, -2.0, _727);
    float _747 = float(_579);
    float _749 = _737 * _741;
    float _751 = -_739;
    float _753 = fma(_743, 2.0, _751);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _757 = 1.0 + _755;
    float _759 = in.m_68.x;
    float _761 = in.m_68.y;
    float _763 = in.m_68.z;
    float _765 = 1.0 / _747;
    float _767 = _701 * _147;
    bool _769 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _771 = isnan(1.0);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _777 = _773 || _775;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _781 = -_735;
    float _783 = _781 + 1.0;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _787 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _789 = isnan(0.0);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _795 = _791 || _793;
    float _797 = 1.0 / _757;
    float _799 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[78].z, _779);
    float _801 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[78].w, _785);
    bool _803 = !_637;
    int _805 = _803 ? 0 : 1;
    float _807 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _683);
    float _809 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _799);
    float _811 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _801);
    float _813 = _795 ? _783 : 0.0;
    float _815 = 1.0 / _643;
    float _817 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _721);
    float _819 = _765 * _147;
    float _821 = -_147;
    float _823 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[81].x, _753);
    float _825 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _745);
    float _827 = _749 * (-2.0);
    float _829 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _831 = fma(_709, _379, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    if (_777)
    {
        float _833 = _813 * _797;
        _149 = _833;
    }
    float _835 = _149;
    int _837 = abs(_805);
    float _839 = fma(_391, _827, _391);
    float _841 = fma(_827, _759, _759);
    float _843 = float(_559);
    float _845 = _259 + (-0.5);
    float _847 = float(_837);
    float _849 = _569 + _829;
    float _851 = _665 * _815;
    float _853 = _851 * 0.5;
    float _855 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[196].x, _841);
    bool _857 = !_641;
    int _859 = _857 ? 0 : 1;
    float _861 = _847 * _843;
    float _863 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _865 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[30].w, _863);
    float _867 = fma(_839, _835, _855);
    int _869 = abs(_859);
    float _871 = _861 * (-2.0);
    float _873 = float(_681);
    float _875 = _261 + (-0.5);
    float _877 = float(_869);
    float _879 = fma(_871, _761, _761);
    float _881 = -_313;
    float _883 = _881 + 1.0;
    float _885 = fma(_411, _871, _411);
    float _887 = 1.0 / _865;
    float _889 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[196].y, _879);
    float _891 = _877 * _873;
    float _893 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[143].x, _567);
    float _895 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[143].y, _561);
    float _897 = fma(_885, _835, _889);
    float _899 = _891 * (-2.0);
    float _901 = in.m_70.x;
    float _903 = in.m_70.y;
    float _905 = fma(_495, _537, _893);
    float _907 = fma(_509, _537, _895);
    float _909 = _897 * 0.15915493667125701904296875;
    float _911 = fma(_899, _763, _763);
    float _913 = _263 + (-0.5);
    float _915 = fma(_405, _899, _405);
    float _917 = _849 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _919 = fma(_439, _513, _905);
    float _921 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[196].z, _911);
    float _923 = fma(_453, _513, _907);
    float _925 = _849 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _927 = fma(_237, (*spvDescriptorSet0.vp_c15)._m0[126].x, _917);
    float _929 = fma(_915, _835, _921);
    float _931 = _867 * 0.15915493667125701904296875;
    float _933 = fma(_715, _565, _919);
    float _935 = fma(_831, _565, _923);
    float _937 = _929 * 0.15915493667125701904296875;
    float _939 = fma(_237, (*spvDescriptorSet0.vp_c15)._m0[127].x, _925);
    float _941 = fma(_239, (*spvDescriptorSet0.vp_c15)._m0[126].z, _927);
    float _943 = _931 * 6.283185482025146484375;
    float _945 = sin(_943);
    float _947 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[147].x, _933);
    float _949 = fma(_239, (*spvDescriptorSet0.vp_c15)._m0[127].z, _939);
    float _951 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[147].y, _935);
    float _953 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _955 = _887 * _953;
    float _957 = _941 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _959 = _947 * _901;
    float _961 = _951 * _903;
    float _963 = _931 * 6.283185482025146484375;
    float _965 = cos(_963);
    bool _967 = _955 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _969 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    bool _971 = _955 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _973 = _959 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _975 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _977 = _961 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _979 = _909 * 6.283185482025146484375;
    float _981 = sin(_979);
    float _983 = _973 * _969;
    float _985 = _977 * _975;
    float _987 = _949 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _989 = 2;
    if (!_967)
    {
        _989 = 1;
    }
    int _991 = _989;
    float _993 = _909 * 6.283185482025146484375;
    float _995 = cos(_993);
    float _997 = _937 * 6.283185482025146484375;
    float _999 = cos(_997);
    float _1001 = _945 * _981;
    float _1003 = _965 * _981;
    float _1005 = _937 * 6.283185482025146484375;
    float _1007 = sin(_1005);
    float _1009 = _945 * _995;
    float _1011 = _965 * _995;
    float _1013 = _945 * _999;
    float _1015 = _995 * _999;
    float _1017 = _965 * _999;
    float _1019 = _981 * _999;
    bool _1021 = !_967;
    int _1023 = _1021 ? 0 : 1;
    float _1025 = trunc(_957);
    int _1027 = int(_1025);
    float _1029 = _1017 * _985;
    float _1031 = fma(_1007, _1011, _1001);
    int _1033 = _991;
    if (!_971)
    {
        _1033 = _1023;
    }
    int _1035 = _1033;
    float _1037 = fma(_1007, _1001, _1011);
    float _1039 = -_985;
    float _1041 = _1007 * _1039;
    float _1043 = -_1003;
    float _1045 = fma(_1007, _1009, _1043);
    float _1047 = trunc(_987);
    int _1049 = int(_1047);
    int _1051 = _1035 << 6;
    float _1053 = -_1009;
    float _1055 = fma(_1007, _1003, _1053);
    float _1057 = fma(_1015, _983, _1041);
    float _1059 = _1013 * _985;
    int _1061 = _1051 + 96;
    uint _1064 = uint(int(uint(_1061) >> uint(2)));
    uint _1066 = uint(int(uint(int(_1064)) >> uint(2)));
    int _1068 = int(_1064) & 3;
    float _1070 = (*spvDescriptorSet0.vp_c15)._m0[int(_1066)][_1068];
    int _1072 = int(_1064) + 1;
    uint _1074 = uint(int(uint(_1072) >> uint(2)));
    int _1076 = _1072 & 3;
    float _1078 = (*spvDescriptorSet0.vp_c15)._m0[int(_1074)][_1076];
    float _1080 = fma(_1031, _983, _1029);
    float _1082 = fma(_1019, _271, _1057);
    float _1084 = fma(_1045, _983, _1059);
    int _1086 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1088 = _1027 + _1086;
    int _1090 = _1088 + 1;
    float _1092 = fma(_1055, _271, _1080);
    float _1094 = fma(_1037, _271, _1084);
    int _1096 = _1051 + 104;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    uint _1100 = uint(int(uint(int(_1098)) >> uint(2)));
    int _1102 = int(_1098) & 3;
    float _1104 = (*spvDescriptorSet0.vp_c15)._m0[int(_1100)][_1102];
    int _1106 = int(_1098) + 1;
    uint _1108 = uint(int(uint(_1106) >> uint(2)));
    int _1110 = _1106 & 3;
    float _1112 = (*spvDescriptorSet0.vp_c15)._m0[int(_1108)][_1110];
    bool _1114 = _1090 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1116 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1118 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1120 = _1049 + _1118;
    int _1122 = _1120 + 1;
    float _1124 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1116);
    int _1126 = _1090 | _1122;
    int _1128 = _1051 + 48;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
    int _1134 = int(_1130) & 3;
    float _1136 = (*spvDescriptorSet0.vp_c15)._m0[int(_1132)][_1134];
    int _1138 = int(_1130) + 1;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    int _1142 = _1138 & 3;
    float _1144 = (*spvDescriptorSet0.vp_c15)._m0[int(_1140)][_1142];
    float _1146 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1124);
    bool _1148 = _1126 < 0;
    bool _1150 = _1148 || _1114;
    float _1152 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1154 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1156 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1158 = _1122 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1160 = _1158 || _1150;
    int _1162 = _1051 + 64;
    uint _1164 = uint(int(uint(_1162) >> uint(2)));
    uint _1166 = uint(int(uint(int(_1164)) >> uint(2)));
    int _1168 = int(_1164) & 3;
    float _1170 = (*spvDescriptorSet0.vp_c15)._m0[int(_1166)][_1168];
    int _1172 = int(_1164) + 1;
    uint _1174 = uint(int(uint(_1172) >> uint(2)));
    int _1176 = _1172 & 3;
    float _1178 = (*spvDescriptorSet0.vp_c15)._m0[int(_1174)][_1176];
    float _1180 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1152);
    float _1182 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1154);
    float _1184 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1180);
    float _1186 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1182);
    int _1188 = _1051 + 56;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    uint _1192 = uint(int(uint(int(_1190)) >> uint(2)));
    int _1194 = int(_1190) & 3;
    float _1196 = (*spvDescriptorSet0.vp_c15)._m0[int(_1192)][_1194];
    int _1198 = int(_1190) + 1;
    uint _1200 = uint(int(uint(_1198) >> uint(2)));
    int _1202 = _1198 & 3;
    float _1204 = (*spvDescriptorSet0.vp_c15)._m0[int(_1200)][_1202];
    float _1206 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1208 = _239 + _1156;
    float _1210 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1212 = _1090;
    float _1214 = _1208;
    if (!_1160)
    {
        int _1216 = _1122 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1218 = _1216 + _1090;
        _1212 = _1218;
    }
    int _1220 = _1212;
    float _1222 = _237 + _1206;
    float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1226 = _1208 + _1224;
    int _1228 = _1051 + 72;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    float _1246 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1248 = _1222 + _1246;
    float _1250 = _1226 * _1226;
    int _1252 = 0;
    int _1254 = as_type<int>(_1250);
    float _1256 = _1222;
    float _1258 = as_type<float>(_1220);
    if (!_1160)
    {
        int _1260 = _1220 << 2;
        _1252 = _1260;
    }
    int _1262 = _1252;
    float _1264 = fma(_1248, _1248, _1250);
    int _1266 = _1262;
    if (!_1160)
    {
        uint _1268 = uint(int(uint(_1220) >> uint(2)));
        _1254 = int(_1268);
    }
    int _1270 = _1254;
    int _1272 = _1051 + 80;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    uint _1276 = uint(int(uint(int(_1274)) >> uint(2)));
    int _1278 = int(_1274) & 3;
    float _1280 = (*spvDescriptorSet0.vp_c15)._m0[int(_1276)][_1278];
    int _1282 = int(_1274) + 1;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    int _1286 = _1282 & 3;
    float _1288 = (*spvDescriptorSet0.vp_c15)._m0[int(_1284)][_1286];
    int _1290 = _1270;
    if (!_1160)
    {
        int _1292 = 12 & _1262;
        _1266 = _1292;
    }
    int _1294 = _1266;
    float _1296 = sqrt(_1264);
    if (!_1160)
    {
        int _1298 = _1270 << 4;
        int _1300 = _1298 + _1294;
        _1290 = _1300;
    }
    int _1302 = _1290;
    float _1304 = _849 * _1078;
    float _1306 = fma(_237, _1070, _1304);
    float _1308 = fma(_239, _1104, _1306);
    float _1310 = _849 * _1144;
    float _1312 = _1308 + _1112;
    bool _1314 = _1296 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1316 = fma(_237, _1136, _1310);
    float _1318 = _569 + _1210;
    float _1320 = _1136;
    float _1322 = _1296;
    if (!_1160)
    {
        float _1324 = floor(_957);
        _1320 = _1324;
    }
    float _1326 = _1320;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1330 = _1328 != 0;
    int _1332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1334 = _1332 != 0;
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1338 = _1336 != 0;
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1342 = _1340 != 0;
    float _1344 = _849 * _1178;
    float _1346 = fma(_237, _1170, _1344);
    bool _1348 = !_1334;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = 1.0 / _1312;
    bool _1354 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1356 = isnan(0.5);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1362 = _1358 || _1360;
    float _1364 = fma(_239, _1196, _1316);
    bool _1366 = !_1330;
    int _1368 = _1366 ? 0 : 1;
    bool _1370 = !_1338;
    int _1372 = _1370 ? 0 : 1;
    float _1374 = _1364 + _1204;
    bool _1376 = !_1342;
    int _1378 = _1376 ? 0 : 1;
    float _1380 = fma(_239, _1236, _1346);
    float _1382 = _1346;
    float _1384 = _1170;
    if (!_1314)
    {
        _1382 = _1318;
    }
    float _1386 = _1382;
    float _1388 = _1380 + _1244;
    bool _1390 = !_1314;
    float _1392 = _1386;
    if (!_1390)
    {
        float _1394 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1398 = _1296 + _1396;
        float _1400 = _1318 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = rsqrt(_1264);
        float _1404 = _1398 * _1394;
        float _1406 = _1404 * 0.15915493667125701904296875;
        float _1408 = _1406 * 6.283185482025146484375;
        float _1410 = cos(_1408);
        float _1412 = _1406 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        float _1416 = _1410 + (-1.0);
        float _1418 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1420 = fma(_1414, _1400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1422 = fma(_1318, _1410, _1418);
        float _1424 = _1402 * _1420;
        float _1426 = fma(_1248, _1424, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1428 = fma(_1226, _1424, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1256 = _1426;
        _1214 = _1428;
        _1392 = _1422;
        _1384 = _1418;
        _1322 = _1406;
    }
    float _1430 = _1256;
    float _1432 = _1214;
    float _1434 = _1392;
    float _1436 = _1384;
    float _1438 = _1322;
    float _1440 = _1436;
    float _1442 = _1438;
    float _1444 = _1434;
    if (_1362)
    {
        _1440 = _1430;
    }
    float _1446 = _1440;
    float _1448 = _1446;
    if (_1362)
    {
        _1442 = _1432;
    }
    float _1450 = _1442;
    float _1452 = _1450;
    if (!_1362)
    {
        float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1456 = _569 + _1454;
        float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1460 = _237 + _1458;
        float _1462 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1464 = -_239;
        float _1466 = _1464 + _1432;
        float _1468 = _1456 * _1456;
        float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1472 = _239 + _1470;
        float _1474 = fma(_1460, _1460, _1468);
        float _1476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1478 = fma(_1472, _1472, _1474);
        float _1480 = sqrt(_1478);
        float _1482 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1484 = precise::min(_1480, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1486 = _1484 * _1476;
        float _1488 = -_569;
        float _1490 = _1488 + _1434;
        float _1492 = _1482 * _1486;
        float _1494 = -_237;
        float _1496 = _1494 + _1430;
        float _1498 = fma(_1490, _1492, _569);
        float _1500 = fma(_1496, _1492, _237);
        float _1502 = fma(_1466, _1492, _239);
        _1444 = _1498;
        _1448 = _1500;
        _1452 = _1502;
    }
    float _1504 = _1444;
    float _1506 = _1448;
    float _1508 = _1452;
    int _1510 = _1051 + 88;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    uint _1514 = uint(int(uint(int(_1512)) >> uint(2)));
    int _1516 = int(_1512) & 3;
    float _1518 = (*spvDescriptorSet0.vp_c15)._m0[int(_1514)][_1516];
    int _1520 = int(_1512) + 1;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    int _1524 = _1520 & 3;
    float _1526 = (*spvDescriptorSet0.vp_c15)._m0[int(_1522)][_1524];
    float _1528 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1530 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1532 = _1374 * _1352;
    float _1534 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1536 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1528);
    float _1538 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1530);
    float _1540 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1542 = _1430;
    if (!_1160)
    {
        int _1544 = _1302 + 400;
        uint _1546 = uint(int(uint(_1544) >> uint(2)));
        uint _1548 = uint(int(uint(int(_1546)) >> uint(2)));
        int _1550 = int(_1546) & 3;
        float _1552 = (*spvDescriptorSet0.vp_c15)._m0[int(_1548)][_1550];
        _1542 = _1552;
    }
    float _1554 = _1542;
    float _1556 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1536);
    bool _1558 = _1532 >= 0.0;
    float _1560 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1534);
    float _1562 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1538);
    float _1564 = _1556 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1566 = _1388 * _1352;
    bool _1568 = _1532 <= 1.0;
    bool _1570 = _1568 && _1558;
    float _1572 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1560);
    float _1574 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1540);
    float _1576 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1578 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1580 = _1566 >= 0.0;
    bool _1582 = _1580 && _1570;
    float _1584 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1586 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1574);
    float _1588 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1578);
    bool _1590 = _1566 <= 1.0;
    bool _1592 = _1590 && _1582;
    float _1594 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1596 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1598 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1600 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1588);
    float _1602 = _849 * _1288;
    float _1604 = _1236;
    float _1606 = _1594;
    if (!_1160)
    {
        float _1608 = floor(_987);
        _1604 = _1608;
    }
    float _1610 = _1604;
    float _1612 = -_1596;
    float _1614 = fma(_1612, _1594, 1.0);
    float _1616 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1600);
    float _1618 = fma(_237, _1280, _1602);
    float _1620 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1622 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (_1592)
    {
        float _1624 = float(_1035);
        _1606 = _1624;
    }
    float _1626 = _1606;
    float _1628 = log2(_1614);
    float _1630 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1620);
    float _1632 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1622);
    float _1634 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1630);
    float _1636 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1632);
    float _1638 = 1.0 / _1616;
    float _1640 = 0.0;
    float _1642 = _1630;
    if (!_1160)
    {
        float _1644 = -_1610;
        float _1646 = _987 + _1644;
        _1640 = _1646;
    }
    float _1648 = _1640;
    float _1650 = fma(_239, _1518, _1618);
    float _1652 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1634);
    float _1654 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1636);
    float _1656 = _1650 + _1526;
    float _1658 = _1620;
    float _1660 = _1652;
    if (_1592)
    {
        float _1662 = rint(_1626);
        float _1664 = precise::max(_1662, 0.0);
        uint _1666 = uint(_1664);
        uint _1668 = clamp(_1666, 0u, 65535u);
        _1658 = as_type<float>(_1668);
    }
    float _1670 = _1658;
    float _1672 = _1628 * 0.693147182464599609375;
    float _1674 = _1656 * _1352;
    float _1676 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1678 = _1656;
    if (!_1160)
    {
        float _1680 = rint(_1554);
        float _1682 = precise::max(_1680, 0.0);
        uint _1684 = uint(_1682);
        uint _1686 = clamp(_1684, 0u, 65535u);
        _1678 = as_type<float>(_1686);
    }
    float _1688 = _1678;
    float _1690 = _1652 * _1638;
    float _1692 = _1654 * _1638;
    float _1694 = fma(_1690, 0.5, 0.5);
    float _1696 = fma(_1692, -0.5, 0.5);
    float _1698 = _1690;
    if (!_1160)
    {
        float _1700 = -_1326;
        float _1702 = _957 + _1700;
        _1698 = _1702;
    }
    float _1704 = _1698;
    float _1706 = _1326;
    if (_1592)
    {
        float3 _6618 = float3(_1532, _1566, float(as_type<int>(_1670)));
        float3 _6622 = select(_6618, float3(0.0), isnan(_6618));
        float _1708 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6622.xy, uint(rint(_6622.z)), _1674, level(0.0));
        _1706 = _1708;
    }
    float _1710 = _1706;
    float3 _6632 = float3(_1694, _1696, _1676);
    float _1712 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6632, float3(0.0), isnan(_6632)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6632, float3(0.0), isnan(_6632)), level(0.0)).x;
    float3 _6641 = float3(_1694, _1696, _1676);
    float4 _1715 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6641, float3(0.0), isnan(_6641)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6641, float3(0.0), isnan(_6641)), level(0.0)).xyzw;
    float _1717 = _1715.x;
    float _1719 = _1715.y;
    float _1721 = _1715.z;
    float _1723 = _1715.w;
    float _1725 = _1648;
    if (!_1160)
    {
        float3 _6664 = float3(_1704, _1648, float(as_type<int>(_1688)));
        float3 _6666 = select(_6664, float3(0.0), isnan(_6664));
        float _1727 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6666.xy, uint(rint(_6666.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6666.xy, uint(rint(_6666.z)), level(0.0)).x;
        _1725 = _1727;
    }
    float _1729 = _1725;
    float _1731 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1733 = int(_1731);
    int _1735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1737 = _1735 != 0;
    int _1739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1741 = _1739 != 0;
    int _1743 = abs(_615);
    int _1745 = abs(_1350);
    float _1747 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1749 = int(_1747);
    int _1751 = abs(_1368);
    int _1753 = abs(_1372);
    int _1755 = abs(_1378);
    float _1757 = as_type<float>(_1755);
    if (_1737)
    {
        float _1759 = in.m_66.x;
        _1642 = _1759;
    }
    float _1761 = _1642;
    float _1763 = float(uint(_1733));
    float _1765 = trunc(_767);
    int _1767 = int(_1765);
    float _1769 = _1761;
    if (!_1737)
    {
        float _1771 = in.m_66.y;
        _1769 = _1771;
    }
    float _1773 = _1769;
    int _1775 = ~_1733;
    int _1777 = _1775 + 1;
    float _1779 = float(uint(_1749));
    float _1781 = 1.0 / _1763;
    int _1783 = ~_1749;
    int _1785 = _1783 + 1;
    float _1787 = 1.0 / _1779;
    float _1789 = trunc(_819);
    int _1791 = int(_1789);
    int _1793 = as_type<int>(_1781) + (-2);
    float _1795 = float(uint(_1767));
    float _1797 = float(_1767);
    int _1799 = as_type<int>(_1787) + (-2);
    float _1801 = as_type<float>(_1793) * _1795;
    float _1803 = _1795;
    if (_1737)
    {
        _1803 = 1.0;
    }
    float _1805 = _1803;
    float _1807 = _1805;
    if (!_1737)
    {
        _1807 = 7.345489978790283203125;
    }
    float _1809 = _1807;
    float _1811 = trunc(_1801);
    float _1813 = precise::max(_1811, 0.0);
    uint _1815 = uint(_1813);
    float _1817 = float(uint(_1791));
    float _1819 = _1809 * _259;
    float _1821 = as_type<float>(_1799) * _1817;
    float _1823 = _1817;
    if (_1737)
    {
        _1823 = 1.0;
    }
    float _1825 = _1823;
    float _1827 = floor(_1819);
    float _1829 = _1825;
    if (!_1737)
    {
        _1829 = 1.2345600128173828125;
    }
    float _1831 = _1829;
    float _1833 = _1773 * _1831;
    float _1835 = trunc(_1821);
    float _1837 = precise::max(_1835, 0.0);
    uint _1839 = uint(_1837);
    int _1841 = _1777 * int(_1815);
    int _1843 = _1841 + _1767;
    float _1845 = float(uint(_1843));
    float _1847 = floor(_1833);
    float _1849 = float(_1733);
    float _1851 = as_type<float>(_1793) * _1845;
    int _1853 = _1785 * int(_1839);
    int _1855 = _1853 + _1791;
    float _1857 = trunc(_1851);
    float _1859 = precise::max(_1857, 0.0);
    uint _1861 = uint(_1859);
    float _1863 = float(uint(_1855));
    float _1865 = -_1847;
    float _1867 = _1833 + _1865;
    float _1869 = float(_1749);
    float _1871 = as_type<float>(_1799) * _1863;
    float _1873 = -_1827;
    float _1875 = _1819 + _1873;
    int _1877 = ~_1733;
    int _1879 = _1877 + 1;
    bool _1881 = _1797 >= _1849;
    bool _1883 = isnan(_1797);
    bool _1885 = _1881 || _1883;
    bool _1887 = isnan(_1849);
    bool _1889 = _1885 || _1887;
    float _1891 = float(_1889);
    float _1893 = _1867 * _1869;
    float _1895 = trunc(_1871);
    float _1897 = precise::max(_1895, 0.0);
    uint _1899 = uint(_1897);
    int _1901 = int(_1815) + int(_1861);
    float _1903 = _1875 * _1849;
    float _1905 = _1849 * _717;
    float _1907 = _1869 * _717;
    int _1909 = _1879 * _1901;
    int _1911 = _1909 + _1767;
    float _1913 = trunc(_1891);
    int _1915 = int(_1913);
    bool _1917 = uint(_1911) >= uint(_1733);
    bool _1919 = !_1917;
    int _1921 = _1919 ? 0 : (-1);
    float _1923 = trunc(_1903);
    int _1925 = int(_1923);
    int _1927 = int(_1839) + int(_1899);
    float _1929 = float(_1791);
    int _1931 = ~_1749;
    int _1933 = _1931 + 1;
    bool _1935 = _1929 >= _1869;
    bool _1937 = isnan(_1929);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan(_1869);
    bool _1943 = _1939 || _1941;
    float _1945 = float(_1943);
    float _1947 = trunc(_1893);
    int _1949 = int(_1947);
    int _1951 = _1933 * _1927;
    int _1953 = _1951 + _1791;
    int _1955 = ~_1901;
    int _1957 = _1955 + _1921;
    int _1959 = _1957 + 1;
    int _1961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1963 = _1961 != 0;
    int _1965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1967 = _1965 != 0;
    float _1969 = trunc(_1945);
    int _1971 = int(_1969);
    bool _1973 = uint(_1953) >= uint(_1749);
    bool _1975 = !_1963;
    int _1977 = _1975 ? 0 : 1;
    bool _1979 = !_1967;
    int _1981 = _1979 ? 0 : 1;
    int _1983 = abs(_1977);
    int _1985 = _1733 * _1959;
    int _1987 = _1985 + _1767;
    bool _1989 = !_1973;
    int _1991 = _1989 ? 0 : (-1);
    float _1993 = trunc(_1905);
    int _1995 = int(_1993);
    int _1997 = abs(_1981);
    bool _1999 = _1733 == 0;
    int _2001 = ~_1927;
    int _2003 = _2001 + _1991;
    int _2005 = _2003 + 1;
    int _2007 = _1925 * _1983;
    int _2009 = _2007 + _1767;
    float _2011 = trunc(_1907);
    int _2013 = int(_2011);
    int _2015 = ~_1915;
    int _2017 = _2015 + 1;
    int _2019 = _2017 + 1;
    int _2021 = _1749 * _2005;
    int _2023 = _2021 + _1791;
    bool _2025 = !_1999;
    int _2027 = _2025 ? _1987 : (-1);
    int _2029 = _1949 * _1997;
    int _2031 = _2029 + _1791;
    bool _2033 = _1749 == 0;
    int _2035 = ~_1971;
    int _2037 = _2035 + 1;
    int _2039 = _2037 + 1;
    int _2041 = _2027 * _2019;
    bool _2043 = !_2033;
    int _2045 = _2043 ? _2023 : (-1);
    int _2047 = _1733 + (-1);
    int _2049 = _1749 + (-1);
    int _2051 = _2045 * _2039;
    int _2053 = _1915 * _2047;
    int _2055 = _2053 + _2041;
    int _2057 = _1971 * _2049;
    int _2059 = _2057 + _2051;
    int _2061 = abs(_621);
    int _2063 = _2055 * _1743;
    bool _2065 = !_1741;
    int _2067 = _2065 ? 0 : 1;
    int _2069 = abs(_627);
    int _2071 = _1995 * _2061;
    int _2073 = _2071 + _2063;
    int _2075 = abs(_2067);
    int _2077 = _2059 * _1745;
    int _2079 = _2009 * _2069;
    int _2081 = _2079 + _2073;
    int _2083 = _2013 * _1751;
    int _2085 = _2083 + _2077;
    int _2087 = ~_1749;
    int _2089 = _2087 + 1;
    int _2091 = _1925 * _2075;
    int _2093 = _2091 + _2081;
    int _2095 = _2031 * _1753;
    int _2097 = _2095 + _2085;
    int _2099 = ~_1733;
    int _2101 = _2099 + 1;
    float _2103 = float(uint(_2093));
    int _2105 = _1949 * _1755;
    int _2107 = _2105 + _2097;
    int _2109 = ~_1733;
    int _2111 = _2109 + 1;
    int _2113 = ~_1749;
    int _2115 = _2113 + 1;
    float _2117 = as_type<float>(_1793) * _2103;
    float _2119 = float(uint(_2107));
    float _2121 = float(uint(_2009));
    float _2123 = trunc(_2117);
    float _2125 = precise::max(_2123, 0.0);
    uint _2127 = uint(_2125);
    float _2129 = as_type<float>(_1799) * _2119;
    float _2131 = as_type<float>(_1793) * _2121;
    float _2133 = trunc(_2129);
    float _2135 = precise::max(_2133, 0.0);
    uint _2137 = uint(_2135);
    int _2139 = _2101 * int(_2127);
    int _2141 = _2139 + _2093;
    float _2143 = trunc(_2131);
    float _2145 = precise::max(_2143, 0.0);
    uint _2147 = uint(_2145);
    float _2149 = float(uint(_2141));
    int _2151 = _2089 * int(_2137);
    int _2153 = _2151 + _2107;
    float _2155 = as_type<float>(_1793) * _2149;
    float _2157 = float(uint(_2153));
    int _2159 = ~_1733;
    int _2161 = _2159 + 1;
    float _2163 = trunc(_2155);
    float _2165 = precise::max(_2163, 0.0);
    uint _2167 = uint(_2165);
    float _2169 = as_type<float>(_1799) * _2157;
    float _2171 = float(uint(_2031));
    int _2173 = _2161 * int(_2147);
    int _2175 = _2173 + _2009;
    float _2177 = trunc(_2169);
    float _2179 = precise::max(_2177, 0.0);
    uint _2181 = uint(_2179);
    float _2183 = as_type<float>(_1799) * _2171;
    float _2185 = float(uint(_2175));
    int _2187 = ~_1749;
    int _2189 = _2187 + 1;
    float _2191 = as_type<float>(_1793) * _2185;
    float _2193 = trunc(_2183);
    float _2195 = precise::max(_2193, 0.0);
    uint _2197 = uint(_2195);
    int _2199 = int(_2127) + int(_2167);
    int _2201 = int(_2137) + int(_2181);
    int _2203 = _2111 * _2199;
    int _2205 = _2203 + _2093;
    float _2207 = trunc(_2191);
    float _2209 = precise::max(_2207, 0.0);
    uint _2211 = uint(_2209);
    int _2213 = _2115 * _2201;
    int _2215 = _2213 + _2107;
    bool _2217 = uint(_2205) >= uint(_1733);
    int _2219 = _2189 * int(_2197);
    int _2221 = _2219 + _2031;
    bool _2223 = !_2217;
    int _2225 = _2223 ? 0 : (-1);
    bool _2227 = uint(_2215) >= uint(_1749);
    float _2229 = float(uint(_2221));
    int _2231 = ~_2199;
    int _2233 = _2231 + _2225;
    int _2235 = _2233 + 1;
    bool _2237 = !_2227;
    int _2239 = _2237 ? 0 : (-1);
    float _2241 = as_type<float>(_1799) * _2229;
    int _2243 = int(_2147) + int(_2211);
    int _2245 = _1733 * _2235;
    int _2247 = _2245 + _2093;
    int _2249 = ~_2201;
    int _2251 = _2249 + _2239;
    int _2253 = _2251 + 1;
    float _2255 = as_type<float>(_2199);
    if (_1160)
    {
        _2255 = 1.0;
    }
    float _2257 = _2255;
    float _2259 = _2257;
    if (!_1160)
    {
        int _2261 = _1220 << 4;
        int _2263 = _2261 + 2048;
        uint _2265 = uint(int(uint(_2263) >> uint(2)));
        uint _2267 = uint(int(uint(int(_2265)) >> uint(2)));
        int _2269 = int(_2265) & 3;
        float _2271 = (*spvDescriptorSet0.vp_c15)._m0[int(_2267)][_2269];
        int _2273 = int(_2265) + 1;
        uint _2275 = uint(int(uint(_2273) >> uint(2)));
        int _2277 = _2273 & 3;
        float _2279 = (*spvDescriptorSet0.vp_c15)._m0[int(_2275)][_2277];
        int _2281 = _2263 + 8;
        uint _2283 = uint(int(uint(_2281) >> uint(2)));
        uint _2285 = uint(int(uint(int(_2283)) >> uint(2)));
        int _2287 = int(_2283) & 3;
        float _2289 = (*spvDescriptorSet0.vp_c15)._m0[int(_2285)][_2287];
        int _2291 = int(_2283) + 1;
        uint _2293 = uint(int(uint(_2291) >> uint(2)));
        int _2295 = _2291 & 3;
        float _2297 = (*spvDescriptorSet0.vp_c15)._m0[int(_2293)][_2295];
        float _2299 = _849 * _2279;
        float _2301 = fma(_237, _2271, _2299);
        float _2303 = fma(_239, _2289, _2301);
        float _2305 = _2303 + _2297;
        float _2307 = precise::clamp(_2305, 0.0, 1.0);
        float _2309 = -_2307;
        float _2311 = _2309 + _1729;
        float _2313 = fma(_2311, 500.0, 1.5);
        float _2315 = exp2(_2313);
        float _2317 = 0.0 + _2315;
        float _2319 = precise::clamp(_2317, 0.0, 1.0);
        _1258 = as_type<float>(_2263);
        _2259 = _2319;
    }
    float _2321 = _1258;
    float _2323 = _2259;
    float _2325 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2327 = _1504 + _2325;
    float _2329 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2331 = _1506 + _2329;
    float _2333 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2335 = _1508 + _2333;
    float _2337 = _2327 * _2327;
    float _2339 = fma(_2331, _2331, _2337);
    float _2341 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2343 = fma(_2335, _2335, _2339);
    float _2345 = rsqrt(_2343);
    float _2347 = sqrt(_2343);
    float _2349 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2351 = _2331 * _2349;
    float _2353 = _2335 * _2349;
    float _2355 = _2351 * _2351;
    float _2357 = _2353 * _2353;
    float _2359 = _2355 + _2357;
    float _2361 = sqrt(_2359);
    bool _2363 = _2361 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2367 = _2361 + _2365;
    float _2369 = _2321;
    float _2371 = _2359;
    float _2373 = _2367;
    float _2375 = _2341;
    float _2377 = _2351;
    float _2379 = _2353;
    float _2381 = _2355;
    float _2383 = _2357;
    if (_2363)
    {
        float _2385 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2369 = _2385;
    }
    float _2387 = _2369;
    if (_2363)
    {
        float _2389 = rsqrt(_2359);
        _2371 = _2389;
    }
    float _2391 = _2371;
    if (_2363)
    {
        float _2393 = _2367 * _2387;
        _2373 = _2393;
    }
    float _2395 = _2373;
    float _2397 = precise::max(0.0, _2341);
    float _2399 = _2397;
    if (_2363)
    {
        float _2401 = _2395 * 0.15915493667125701904296875;
        _1757 = _2401;
    }
    float _2403 = _1757;
    float _2405 = -_2349;
    float _2407 = -_2397;
    float _2409 = fma(_2327, _2405, _2407);
    float _2411 = as_type<float>(_2211);
    float _2413 = _2409;
    if (_2363)
    {
        float _2415 = _2403 * 6.283185482025146484375;
        float _2417 = sin(_2415);
        _2411 = _2417;
    }
    float _2419 = _2411;
    if (_2363)
    {
        float _2421 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2399 = _2421;
    }
    float _2423 = _2399;
    float _2425 = _2395;
    float _2427 = _2423;
    if (_2363)
    {
        float _2429 = _2403 * 6.283185482025146484375;
        float _2431 = cos(_2429);
        _2425 = _2431;
    }
    float _2433 = _2425;
    float _2435 = _2419;
    if (_2363)
    {
        float _2437 = fma(_2419, _2423, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2427 = _2437;
    }
    float _2439 = _2427;
    float _2441 = _2439;
    if (_2363)
    {
        float _2443 = _2391 * _2439;
        _2435 = _2443;
    }
    float _2445 = _2435;
    if (_2363)
    {
        float _2447 = _2433 + (-1.0);
        _2375 = _2447;
    }
    float _2449 = _2375;
    if (_2363)
    {
        float _2451 = _2351 * _2445;
        _2377 = _2451;
    }
    float _2453 = _2377;
    if (_2363)
    {
        float _2455 = _2353 * _2445;
        _2379 = _2455;
    }
    float _2457 = _2379;
    if (_2363)
    {
        float _2459 = _2449 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2441 = _2459;
    }
    float _2461 = _2441;
    if (_2363)
    {
        float _2463 = _2453 * _2453;
        _2381 = _2463;
    }
    float _2465 = _2381;
    if (_2363)
    {
        float _2467 = _2457 * _2457;
        _2383 = _2467;
    }
    float _2469 = _2383;
    int _2471 = ~_1733;
    int _2473 = _2471 + 1;
    if (_2363)
    {
        float _2475 = fma(_2409, _2433, _2461);
        _2413 = _2475;
    }
    float _2477 = _2413;
    float _2479 = fma(_2477, _2477, _2465);
    float _2481 = _2479 + _2469;
    float _2483 = rsqrt(_2481);
    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2487 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2485);
    float _2489 = precise::clamp(_2487, 0.0, 1.0);
    float _2491 = -_2489;
    float _2493 = _2491 + 1.0;
    float _2495 = abs(_2493);
    float _2497 = log2(_2495);
    float _2499 = _2483 * _2453;
    float _2501 = _2483 * _2477;
    float _2503 = _2483 * _2457;
    float _2505 = _2499 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2507 = _2501 + 1.0;
    float _2509 = -_2505;
    float _2511 = fma(_2501, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2509);
    float _2513 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2515 = -_2503;
    float _2517 = fma(_2515, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2511);
    float _2519 = exp2(_2513);
    float _2521 = fma(_2517, -0.5, 0.5);
    float _2523 = fma(_2517, 0.5, 0.5);
    float _2525 = fma(_2523, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2527 = sqrt(_2521);
    float _2529 = fma(_2523, _2525, -0.212114393711090087890625);
    float _2531 = fma(_2523, _2529, 1.570728778839111328125);
    float _2533 = -_2501;
    float _2535 = fma(_2519, _2507, _2533);
    bool _2537 = !_1999;
    int _2539 = _2537 ? _2247 : (-1);
    int _2541 = _2539 & 3;
    bool _2543 = _2541 != 0;
    float _2545 = _2527 * 0.636619746685028076171875;
    int _2547 = _2539 & 3;
    bool _2549 = _2547 != 0;
    float _2551 = -_2531;
    float _2553 = fma(_2545, _2551, 1.0);
    float _2555 = fma(_2535, 0.5, 0.5);
    int _2557 = _2473 * _2243;
    int _2559 = _2557 + _2009;
    bool _2561 = uint(_2547) > 1u;
    float2 _7832 = float2(_2553, _2555);
    float3 _2565 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7832, float2(0.0), isnan(_7832)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7832, float2(0.0), isnan(_7832)), level(0.0)).xyz;
    float _2567 = _2565.x;
    float _2569 = _2565.y;
    float _2571 = _2565.z;
    int _2573 = _1749 * _2253;
    int _2575 = _2573 + _2107;
    bool _2577 = uint(_2559) >= uint(_1733);
    float _2579 = trunc(_2241);
    float _2581 = precise::max(_2579, 0.0);
    uint _2583 = uint(_2581);
    int _2585 = _2543 ? 0 : 1;
    float _2587 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2589 = _2539 >> 31;
    float _2591 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2593 = _265 > 0.5;
    float _2595 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2587);
    bool _2597 = !_2033;
    int _2599 = _2597 ? _2575 : (-1);
    float _2601 = -_811;
    float _2603 = _2601 + 1.0;
    int _2605 = ~_2585;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    float _2611 = exp2(_2591);
    int _2613 = _2609;
    if (!_2561)
    {
        int _2615 = ~_2585;
        int _2617 = _2615 + 1;
        _2613 = _2617;
    }
    int _2619 = _2613;
    float _2621 = -_807;
    float _2623 = _2621 + 1.0;
    int _2625 = _2589 & 3;
    float _2627 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2595);
    int _2629 = _2599 >> 31;
    float _2631 = -_817;
    float _2633 = _2631 + 1.0;
    int _2635 = _2539 + _2625;
    float _2637 = -_257;
    float _2639 = _2637 + 1.0;
    int _2641 = _2629 & 3;
    float _2643 = -_809;
    float _2645 = _2643 + 1.0;
    bool _2647 = !_2577;
    int _2649 = _2647 ? 0 : (-1);
    out.m_72.x = _1506;
    out.m_72.y = _1504;
    out.m_72.z = _1508;
    bool _2651 = _2547 != 3;
    int _2653 = _2599 + _2641;
    float _2655 = -_2611;
    float _2657 = _2655 + 1.0;
    bool _2659 = uint(_2547) >= 2u;
    int _2661 = _2653 >> 2;
    int _2663 = _2635 >> 2;
    int _2665 = _2659 ? 0 : 1;
    int _2667 = _2661 << 4;
    int _2669 = _2667 + 512;
    int _2671 = _2663 << 4;
    int _2673 = _2671 + 368;
    int _2675 = ~_2665;
    int _2677 = _2675 + 1;
    int _2679 = _2677 + 1;
    int _2681 = _2679;
    if (_2651)
    {
        int _2683 = ~_2665;
        int _2685 = _2683 + 1;
        _2681 = _2685;
    }
    int _2687 = _2681;
    uint _2689 = uint(int(uint(_2673) >> uint(2)));
    uint _2691 = uint(int(uint(int(_2689)) >> uint(2)));
    int _2693 = int(_2689) & 3;
    float _2695 = (*spvDescriptorSet0.vp_c9)._m0[int(_2691)][_2693];
    int _2697 = int(_2689) + 1;
    uint _2699 = uint(int(uint(_2697) >> uint(2)));
    int _2701 = _2697 & 3;
    float _2703 = (*spvDescriptorSet0.vp_c9)._m0[int(_2699)][_2701];
    int _2705 = ~_2243;
    int _2707 = _2705 + _2649;
    int _2709 = _2707 + 1;
    int _2711 = int(_2197) + int(_2583);
    float _2713 = -_187;
    int _2715 = _2593 ? as_type<int>(_2713) : as_type<int>(_187);
    int _2717 = _1733 * _2709;
    int _2719 = _2717 + _2009;
    bool _2721 = !_2549;
    int _2723 = _2721 ? 0 : 1;
    uint _2725 = uint(int(uint(_2669) >> uint(2)));
    uint _2727 = uint(int(uint(int(_2725)) >> uint(2)));
    int _2729 = int(_2725) & 3;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[int(_2727)][_2729];
    int _2733 = int(_2725) + 1;
    uint _2735 = uint(int(uint(_2733) >> uint(2)));
    int _2737 = _2733 & 3;
    float _2739 = (*spvDescriptorSet0.vp_c9)._m0[int(_2735)][_2737];
    bool _2741 = _2547 != 3;
    int _2743 = _2599 & 3;
    bool _2745 = _2743 != 0;
    int _2747 = _2599 & 3;
    bool _2749 = _2747 != 0;
    int _2751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2753 = _2751 != 0;
    int _2755 = _2673 + 8;
    uint _2757 = uint(int(uint(_2755) >> uint(2)));
    uint _2759 = uint(int(uint(int(_2757)) >> uint(2)));
    int _2761 = int(_2757) & 3;
    float _2763 = (*spvDescriptorSet0.vp_c9)._m0[int(_2759)][_2761];
    int _2765 = int(_2757) + 1;
    uint _2767 = uint(int(uint(_2765) >> uint(2)));
    int _2769 = _2765 & 3;
    float _2771 = (*spvDescriptorSet0.vp_c9)._m0[int(_2767)][_2769];
    int _2773 = ~_1749;
    int _2775 = _2773 + 1;
    bool _2777 = !_2753;
    int _2779 = _2777 ? 0 : 1;
    bool _2781 = uint(_2747) > 1u;
    int _2783 = _2775 * _2711;
    int _2785 = _2783 + _2031;
    bool _2787 = !_1999;
    int _2789 = _2787 ? _2719 : (-1);
    int _2791 = _2669 + 8;
    uint _2793 = uint(int(uint(_2791) >> uint(2)));
    uint _2795 = uint(int(uint(int(_2793)) >> uint(2)));
    int _2797 = int(_2793) & 3;
    float _2799 = (*spvDescriptorSet0.vp_c9)._m0[int(_2795)][_2797];
    int _2801 = int(_2793) + 1;
    uint _2803 = uint(int(uint(_2801) >> uint(2)));
    int _2805 = _2801 & 3;
    float _2807 = (*spvDescriptorSet0.vp_c9)._m0[int(_2803)][_2805];
    int _2809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2811 = _2809 != 0;
    int _2813 = _2745 ? 0 : 1;
    bool _2815 = !_2811;
    int _2817 = _2815 ? 0 : 1;
    bool _2819 = uint(_2785) >= uint(_1749);
    bool _2821 = _2747 != 3;
    bool _2823 = !_2819;
    int _2825 = _2823 ? 0 : (-1);
    bool _2827 = !_2741;
    int _2829 = _2827 ? 0 : (-1);
    int _2831 = ~_2813;
    int _2833 = _2831 + 1;
    int _2835 = _2833 + 1;
    bool _2837 = !_2749;
    int _2839 = _2837 ? 0 : 1;
    bool _2841 = uint(_2747) >= 2u;
    bool _2843 = _2747 != 3;
    int _2845 = _2835;
    if (!_2781)
    {
        int _2847 = ~_2813;
        int _2849 = _2847 + 1;
        _2845 = _2849;
    }
    int _2851 = _2845;
    int _2853 = ~_2711;
    int _2855 = _2853 + _2825;
    int _2857 = _2855 + 1;
    int _2859 = _2841 ? 0 : 1;
    bool _2861 = !_2843;
    int _2863 = _2861 ? 0 : (-1);
    int _2865 = _1749 * _2857;
    int _2867 = _2865 + _2031;
    int _2869 = abs(_2851);
    int _2871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2873 = _2871 != 0;
    int _2875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2877 = _2875 != 0;
    int _2879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2881 = _2879 != 0;
    int _2883 = abs(_2619);
    bool _2885 = _259 > 0.5;
    int _2887 = ~_2859;
    int _2889 = _2887 + 1;
    int _2891 = _2889 + 1;
    int _2893 = _2891;
    if (_2821)
    {
        int _2895 = ~_2859;
        int _2897 = _2895 + 1;
        _2893 = _2897;
    }
    int _2899 = _2893;
    int _2901 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2903 = _2901 != 0;
    int _2905 = abs(_2723);
    int _2907 = ~_2869;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    int _2913 = ~_2883;
    int _2915 = _2913 + 1;
    int _2917 = _2915 + 1;
    int _2919 = abs(_2839);
    int _2921 = _2911 * as_type<int>(_2739);
    int _2923 = abs(_2899);
    int _2925 = _2917 * as_type<int>(_2703);
    int _2927 = ~_2905;
    int _2929 = _2927 + 1;
    int _2931 = _2929 + 1;
    int _2933 = ~_2919;
    int _2935 = _2933 + 1;
    int _2937 = _2935 + 1;
    int _2939 = abs(_2687);
    int _2941 = _2931 * as_type<int>(_2695);
    int _2943 = _2941 + _2925;
    int _2945 = ~_2939;
    int _2947 = _2945 + 1;
    int _2949 = _2947 + 1;
    float _2951 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2953 = int(_2951);
    int _2955 = ~_2923;
    int _2957 = _2955 + 1;
    int _2959 = _2957 + 1;
    int _2961 = _2937 * as_type<int>(_2731);
    int _2963 = _2961 + _2921;
    int _2965 = _2949 * as_type<int>(_2763);
    int _2967 = _2965 + _2943;
    int _2969 = _2959 * as_type<int>(_2799);
    int _2971 = _2969 + _2963;
    float _2973 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2975 = abs(_2829);
    float _2977 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2981 = ~_2975;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    float _2987 = _2973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2989 = _2977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2993 = _2979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2995 = _2985 * as_type<int>(_2771);
    int _2997 = _2995 + _2967;
    int _2999 = abs(_2953);
    float _3001 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3003 = int(_3001);
    int _3005 = abs(_2779);
    out.m_74.x = _2987;
    out.m_74.y = _2989;
    out.m_74.z = _2993;
    out.m_74.w = _2991;
    float _3007 = float(uint(_2953));
    int _3009 = abs(_2863);
    bool _3011 = !_2033;
    int _3013 = _3011 ? _2867 : (-1);
    float _3015 = 1.0 / _3007;
    int _3017 = ~_3009;
    int _3019 = _3017 + 1;
    int _3021 = _3019 + 1;
    float _3023 = -_183;
    int _3025 = _2885 ? as_type<int>(_3023) : as_type<int>(_183);
    bool _3027 = _261 > 0.5;
    int _3029 = _3021 * as_type<int>(_2807);
    int _3031 = _3029 + _2971;
    float _3033 = abs(_955);
    float _3035 = log2(_3033);
    int _3037 = abs(_2817);
    float _3039 = float(uint(_3003));
    int _3041 = ~_3005;
    int _3043 = _3041 + 1;
    int _3045 = _3043 + 1;
    bool _3047 = _263 > 0.5;
    float _3049 = 1.0 / _3039;
    int _3051 = _2997 * _3045;
    int _3053 = as_type<int>(_3015) + (-2);
    float _3055 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3057 = _2789 * _3005;
    int _3059 = _3057 + _3051;
    float _3061 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3063 = _3035 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3065 = -_1007;
    float _3067 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3061);
    float _3069 = float(uint(_3059));
    float _3071 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3073 = ~_3037;
    int _3075 = _3073 + 1;
    int _3077 = _3075 + 1;
    float _3079 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3081 = abs(_3003);
    float _3083 = as_type<float>(_3053) * _3069;
    float _3085 = float(uint(_2999));
    float _3087 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3089 = _3031 * _3077;
    float _3091 = float(uint(_3081));
    float _3093 = exp2(_3063);
    float _3095 = _3071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3097 = _3079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3099 = _3087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3101 = _3013 * _3037;
    int _3103 = _3101 + _3089;
    float _3105 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3107 = -_1007;
    float _3109 = fma(_3107, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3055);
    int _3111 = ~_2953;
    int _3113 = _3111 + 1;
    float _3115 = 1.0 / _3085;
    out.m_76.x = _3095;
    out.m_76.y = _3097;
    out.m_76.z = _3099;
    float _3117 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3119 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3121 = ~_3081;
    int _3123 = _3121 + 1;
    bool _3125 = !_2903;
    float _3127 = _3125 ? _183 : as_type<float>(_3025);
    float _3129 = trunc(_3083);
    float _3131 = precise::max(_3129, 0.0);
    uint _3133 = uint(_3131);
    bool _3135 = !_2873;
    float _3137 = _3135 ? _187 : as_type<float>(_2715);
    bool _3139 = _955 <= 8000.0;
    bool _3141 = isnan(_955);
    bool _3143 = _3139 || _3141;
    bool _3145 = isnan(8000.0);
    bool _3147 = _3143 || _3145;
    float _3149 = float(_3147);
    int _3151 = as_type<int>(_3049) + (-2);
    float _3153 = -_1007;
    float _3155 = fma(_3153, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3105);
    float _3157 = float(uint(_3103));
    float _3159 = 1.0 / _3091;
    float _3161 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3067);
    int _3163 = abs(_3059);
    float _3165 = as_type<float>(_3151) * _3157;
    int _3167 = as_type<int>(_3115) + (-2);
    float _3169 = fma(_3093, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3171 = precise::clamp(_3169, 0.0, 1.0);
    int _3173 = abs(_3103);
    int _3175 = _3113 * int(_3133);
    int _3177 = _3175 + _3059;
    float _3179 = float(uint(_3163));
    float _3181 = trunc(_3165);
    float _3183 = precise::max(_3181, 0.0);
    uint _3185 = uint(_3183);
    float _3187 = float(uint(_3173));
    float _3189 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3109);
    float _3191 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3155);
    float _3193 = as_type<float>(_3167) * _3179;
    float _3195 = float(uint(_3177));
    float _3197 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3117);
    int _3199 = as_type<int>(_3159) + (-2);
    float _3201 = trunc(_3193);
    float _3203 = precise::max(_3201, 0.0);
    uint _3205 = uint(_3203);
    int _3207 = ~_3003;
    int _3209 = _3207 + 1;
    float _3211 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3119);
    float _3213 = as_type<float>(_3199) * _3187;
    float _3215 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3217 = as_type<float>(_3053) * _3195;
    float _3219 = trunc(_3213);
    float _3221 = precise::max(_3219, 0.0);
    uint _3223 = uint(_3221);
    int _3225 = ~_2999;
    int _3227 = _3225 + 1;
    float _3229 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3215);
    float _3231 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3233 = _3209 * int(_3185);
    int _3235 = _3233 + _3103;
    float _3237 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3239 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3241 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3231);
    int _3243 = _3227 * int(_3205);
    int _3245 = _3243 + _3163;
    float _3247 = float(uint(_3235));
    float _3249 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3237);
    float _3251 = trunc(_3217);
    float _3253 = precise::max(_3251, 0.0);
    uint _3255 = uint(_3253);
    float _3257 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3239);
    float _3259 = float(uint(_3245));
    float _3261 = as_type<float>(_3151) * _3247;
    float _3263 = -_183;
    int _3265 = _3047 ? as_type<int>(_3263) : as_type<int>(_183);
    int _3267 = _3123 * int(_3223);
    int _3269 = _3267 + _3173;
    float _3271 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3211);
    float _3273 = as_type<float>(_3167) * _3259;
    float _3275 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3197);
    float _3277 = trunc(_3261);
    float _3279 = precise::max(_3277, 0.0);
    uint _3281 = uint(_3279);
    float _3283 = float(uint(_3269));
    float _3285 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3229);
    bool _3287 = !_2881;
    float _3289 = _3287 ? _183 : as_type<float>(_3265);
    float _3291 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3293 = -_187;
    int _3295 = _3027 ? as_type<int>(_3293) : as_type<int>(_187);
    float _3297 = as_type<float>(_3199) * _3283;
    float _3299 = trunc(_3273);
    float _3301 = precise::max(_3299, 0.0);
    uint _3303 = uint(_3301);
    bool _3305 = !_2877;
    float _3307 = _3305 ? _187 : as_type<float>(_3295);
    float _3309 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3249);
    int _3311 = ~_3003;
    int _3313 = _3311 + 1;
    float _3315 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3317 = _3291 * _3161;
    int _3319 = int(_3133) + int(_3255);
    float _3321 = fma(_3171, -2.0, 3.0);
    float _3323 = trunc(_3297);
    float _3325 = precise::max(_3323, 0.0);
    uint _3327 = uint(_3325);
    int _3329 = int(_3185) + int(_3281);
    float _3331 = _3171 * _3171;
    int _3333 = ~_2999;
    int _3335 = _3333 + 1;
    float _3337 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3241);
    float _3339 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3257);
    int _3341 = _3313 * _3329;
    int _3343 = _3341 + _3103;
    float _3345 = fma(_3315, _3271, _3317);
    out.m_78.x = _3271;
    out.m_78.y = _3275;
    out.m_78.z = _3285;
    int _3347 = ~_2953;
    int _3349 = _3347 + 1;
    float _3351 = _3331 * _3321;
    int _3353 = ~_3081;
    int _3355 = _3353 + 1;
    int _3357 = int(_3205) + int(_3303);
    int _3359 = _3349 * _3319;
    int _3361 = _3359 + _3059;
    bool _3363 = uint(_3343) >= uint(_3003);
    int _3365 = int(_3223) + int(_3327);
    bool _3367 = !_3363;
    int _3369 = _3367 ? 0 : (-1);
    bool _3371 = uint(_3361) >= uint(_2953);
    int _3373 = _3335 * _3357;
    int _3375 = _3373 + _3163;
    int _3377 = ~_3329;
    int _3379 = _3377 + _3369;
    int _3381 = _3379 + 1;
    int _3383 = _3355 * _3365;
    int _3385 = _3383 + _3173;
    int _3387 = _3059 ^ _2953;
    float _3389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3391 = uint(_3375) >= uint(_2999);
    int _3393 = _3003 * _3381;
    int _3395 = _3393 + _3103;
    bool _3397 = !_3371;
    int _3399 = _3397 ? 0 : (-1);
    bool _3401 = uint(_3385) >= uint(_3081);
    bool _3403 = !_3391;
    int _3405 = _3403 ? 0 : (-1);
    float _3407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3409 = uint(int(uint(_3387) >> uint(31)));
    int _3411 = ~_3319;
    int _3413 = _3411 + _3399;
    int _3415 = _3413 + 1;
    int _3417 = ~_3405;
    int _3419 = _3357 + _3417;
    int _3421 = _3419 + 1;
    int _3423 = ~int(_3409);
    int _3425 = _3423 + 1;
    int _3427 = _2953 * _3415;
    int _3429 = _3427 + _3059;
    int _3431 = _3103 ^ _3003;
    float _3433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3435 = _3421 ^ _3425;
    bool _3437 = _2953 == 0;
    bool _3439 = _3003 == 0;
    float _3441 = _3407 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3443 = _3003 == 0;
    int _3445 = ~_3425;
    int _3447 = _3445 + _3435;
    int _3449 = _3447 + 1;
    float _3451 = _3389 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3453 = !_3401;
    int _3455 = _3453 ? 0 : (-1);
    uint _3457 = uint(int(uint(_3431) >> uint(31)));
    float _3459 = fma(_3291, _3291, 1.0);
    bool _3461 = !_3437;
    int _3463 = _3461 ? _3429 : (-1);
    bool _3465 = _2953 == 0;
    int _3467 = ~_3455;
    int _3469 = _3365 + _3467;
    int _3471 = _3469 + 1;
    float _3473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3475 = ~int(_3457);
    int _3477 = _3475 + 1;
    bool _3479 = !_3439;
    int _3481 = _3479 ? _3395 : (-1);
    float _3483 = float(_3463);
    int _3485 = _3471 ^ _3477;
    float _3487 = rsqrt(_3459);
    float _3489 = float(_3481);
    float _3491 = fma(_3451, _3483, _657);
    float _3493 = _3127 + 0.5;
    int _3495 = ~_3477;
    int _3497 = _3495 + _3485;
    int _3499 = _3497 + 1;
    bool _3501 = !_3465;
    int _3503 = _3501 ? _3449 : (-1);
    float _3505 = fma(_3441, _3489, _823);
    float _3507 = fma(_3451, _3493, _3491);
    float _3509 = _3289 + 0.5;
    bool _3511 = !_3443;
    int _3513 = _3511 ? _3499 : (-1);
    float _3515 = _3433 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3517 = float(_3503);
    float _3519 = fma(_3441, _3509, _3505);
    float _3521 = float(_3513);
    float _3523 = _3473 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3525 = _3307 + (-0.5);
    float _3527 = -_685;
    float _3529 = fma(_3515, _3517, _3527);
    float _3531 = _3137 + (-0.5);
    float _3533 = -_825;
    float _3535 = fma(_3523, _3521, _3533);
    float _3537 = _3291 * _3487;
    float _3539 = -_3515;
    float _3541 = fma(_3539, _3525, _3529);
    float _3543 = -_2623;
    float _3545 = fma(_3289, _3543, _3519);
    float _3547 = -_3523;
    float _3549 = fma(_3547, _3531, _3535);
    float _3551 = -_3309;
    float _3553 = _3537 * _3551;
    float _3555 = fma(_3307, _2603, _3541);
    float _3557 = -_3351;
    float _3559 = _3557 + 1.0;
    float _3561 = -_3337;
    float _3563 = _3537 * _3561;
    float _3565 = fma(_3487, _3189, _3553);
    float _3567 = _3291 * _3189;
    float _3569 = fma(_3559, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3351);
    float _3571 = -_3339;
    float _3573 = _3537 * _3571;
    float _3575 = fma(_3487, _3161, _3563);
    float _3577 = fma(_3315, _3275, _3567);
    float _3579 = _3149 * _3569;
    float _3581 = fma(_3487, _3191, _3573);
    float _3583 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2627);
    float _3585 = _3579 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3587 = _3585;
    if (!_1592)
    {
        _1660 = 1.0;
    }
    float _3589 = _1660;
    float _3591 = fma(_3137, _2633, _3549);
    float _3593 = _3589;
    if (_1592)
    {
        bool _3595 = _1710 >= _1674;
        bool _3597 = isnan(_1710);
        bool _3599 = _3595 || _3597;
        bool _3601 = isnan(_1674);
        bool _3603 = _3599 || _3601;
        float _3605 = float(_3603);
        _3593 = _3605;
    }
    float _3607 = _3593;
    float _3609 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3611 = _2639 * _3585;
    float _3613 = precise::clamp(_3611, 0.0, 1.0);
    float _3615 = -_2645;
    float _3617 = fma(_3127, _3615, _3507);
    float _3619 = _3583 + _1616;
    float _3621 = _3291 * _3191;
    float _3623 = _3607 * _2323;
    float _3625 = _3609 * _1712;
    float _3627 = -_3613;
    float _3629 = fma(_3627, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3631 = _3619 * 0.5;
    float _3633 = fma(_3315, _3285, _3621);
    float _3635 = _1723 * _3625;
    float _3637 = -_3623;
    float _3639 = fma(_3637, _3629, 1.0);
    float _3641 = precise::clamp(_3639, 0.0, 1.0);
    float _3643 = _2571 * _3625;
    float _3645 = -_3609;
    float _3647 = _3645 + 1.0;
    out.m_80.z = _3631;
    out.m_80.w = _1616;
    float _3649 = _3337 + _3345;
    float _3651 = _3309 + _3577;
    float _3653 = _3339 + _3633;
    float _3655 = fma(_2567, _3635, _1717);
    float _3657 = fma(_2569, _3635, _1719);
    float _3659 = _1723 * _3647;
    float _3661 = fma(_1723, _3643, _1721);
    out.m_82.x = _3575;
    out.m_82.y = _3565;
    out.m_82.z = _3581;
    bool _3663 = _2347 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3665 = isnan(_2347);
    bool _3667 = _3663 || _3665;
    bool _3669 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3671 = _3667 || _3669;
    float _3673 = _3641 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_84.x = _3617;
    out.m_84.y = _3555;
    out.m_84.z = _3545;
    out.m_84.w = _3591;
    out.gl_Position.x = _1652;
    out.gl_Position.y = _1654;
    out.gl_Position.z = _3583;
    out.gl_Position.w = _1616;
    out.m_86.x = _3673;
    float _3675 = _3631;
    float _3677 = _3619;
    float _3679 = _3623;
    float _3681 = _3641;
    float _3683 = _3635;
    if (!_3671)
    {
        _3675 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3685 = _3675;
    out.m_88.x = _3655;
    out.m_88.y = _3657;
    out.m_88.z = _3661;
    out.m_88.w = _3659;
    float _3687 = _3685;
    float _3689 = _3685;
    if (!_3671)
    {
        _3677 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3691 = _3677;
    float _3693 = _3691;
    float _3695 = _3691;
    if (!_3671)
    {
        _3587 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3697 = _3587;
    out.m_90.x = _3649;
    out.m_90.y = _3651;
    out.m_90.z = _3653;
    float _3699 = _3697;
    float _3701 = _3697;
    if (!_3671)
    {
        _3679 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3703 = _3679;
    float _3705 = _3703;
    float _3707 = _3703;
    if (!_3671)
    {
        _3681 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3709 = _3681;
    float _3711 = _3709;
    float _3713 = _3709;
    if (!_3671)
    {
        _3683 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3715 = _3683;
    bool _3717 = !_3671;
    float _3719 = _3715;
    float _3721 = _3715;
    if (!_3717)
    {
        bool _3723 = _2347 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3725 = isnan(_2347);
        bool _3727 = _3723 || _3725;
        bool _3729 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3731 = _3727 || _3729;
        if (!_3731)
        {
            float _3733 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3735 = _2347 + _3733;
            float _3737 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3739 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3737;
            float _3741 = 1.0 / _3739;
            float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3749 = _3747 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3753 = _3751 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3757 = _3755 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3759 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3761 = _3759 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3763 = _3735 * _3741;
            float _3765 = precise::clamp(_3763, 0.0, 1.0);
            float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3771 = fma(_3765, _3745, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3773 = fma(_3765, _3769, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3775 = fma(_3765, _3749, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3777 = fma(_3765, _3753, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3779 = fma(_3765, _3757, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3781 = fma(_3765, _3761, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3695 = _3773;
            _3713 = _3779;
            _3689 = _3771;
            _3707 = _3777;
            _3701 = _3775;
            _3721 = _3781;
            _3783 = true;
        }
        else
        {
            bool _3785 = _2347 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3787 = isnan(_2347);
            bool _3789 = _3785 || _3787;
            bool _3791 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3793 = _3789 || _3791;
            if (!_3793)
            {
                _3687 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3795 = _3687;
            _3689 = _3795;
            if (!_3793)
            {
                _3693 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3797 = _3693;
            _3695 = _3797;
            if (!_3793)
            {
                _3699 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3799 = _3699;
            _3701 = _3799;
            if (!_3793)
            {
                _3705 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3801 = _3705;
            _3707 = _3801;
            if (!_3793)
            {
                _3711 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3803 = _3711;
            _3713 = _3803;
            if (!_3793)
            {
                _3719 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3805 = _3719;
            bool _3807 = !_3793;
            _3721 = _3805;
            if (!_3807)
            {
                bool _3809 = _2347 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3811 = isnan(_2347);
                bool _3813 = _3809 || _3811;
                bool _3815 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3817 = _3813 || _3815;
                if (!_3817)
                {
                    float _3819 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3821 = _2347 + _3819;
                    float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3825 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3823;
                    float _3827 = 1.0 / _3825;
                    float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3835 = _3833 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3837 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3841 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3849 = _3821 * _3827;
                    float _3851 = precise::clamp(_3849, 0.0, 1.0);
                    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3857 = fma(_3851, _3831, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3859 = fma(_3851, _3855, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3861 = fma(_3851, _3835, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3863 = fma(_3851, _3839, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3865 = fma(_3851, _3843, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3867 = fma(_3851, _3847, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3695 = _3859;
                    _3713 = _3865;
                    _3689 = _3857;
                    _3707 = _3863;
                    _3701 = _3861;
                    _3721 = _3867;
                    _3783 = true;
                }
                else
                {
                    _3695 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3713 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3689 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3707 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3701 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3721 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3783 = false;
    float _3869 = _3695;
    float _3871 = _3713;
    float _3873 = _3689;
    float _3875 = _3707;
    float _3877 = _3701;
    float _3879 = _3721;
    float _3881 = fma(_3651, -0.5, 0.5);
    float _3883 = precise::clamp(_3881, 0.0, 1.0);
    float _3885 = -_3869;
    float _3887 = _3885 + _3871;
    float _3889 = -_3873;
    float _3891 = _3889 + _3875;
    float _3893 = -_3877;
    float _3895 = _3893 + _3879;
    bool _3897 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3899 = fma(_3883, _3887, _3869);
    float _3901 = fma(_3883, _3891, _3873);
    float _3903 = fma(_3883, _3895, _3877);
    float _3905 = _3899 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _3907 = fma(_3901, 0.298911988735198974609375, _3905);
    float _3909 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3911 = fma(_3903, 0.114477999508380889892578125, _3907);
    out.m_59.x = _3909;
    float _3913 = -_3911;
    float _3915 = _3901 + _3913;
    float _3917 = -_3911;
    float _3919 = _3899 + _3917;
    float _3921 = -_3911;
    float _3923 = _3903 + _3921;
    float _3925 = fma(_3915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3911);
    float _3927 = fma(_3919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3911);
    float _3929 = fma(_3923, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3911);
    out.m_94.x = _3925;
    out.m_94.y = _3927;
    out.m_94.z = _3929;
    if (!_3897)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3931 = -_1504;
    float _3933 = _3931 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3935 = -_1506;
    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3939 = -_1508;
    float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3943 = _3933 * _3933;
    float _3945 = fma(_3937, _3937, _3943);
    float _3947 = fma(_3941, _3941, _3945);
    float _3949 = sqrt(_3947);
    float _3951 = rsqrt(_3947);
    float _3953 = -_3949;
    float _3955 = _3953 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3957 = _3955 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3959 = precise::clamp(_3957, 0.0, 1.0);
    float _3961 = _3937 * _3951;
    float _3963 = _3933 * _3951;
    float _3965 = abs(_3959);
    float _3967 = log2(_3965);
    float _3969 = _3941 * _3951;
    float _3971 = _3961 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3973 = _3651 * _3963;
    float _3975 = -_3963;
    float _3977 = -_3971;
    float _3979 = fma(_3975, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3977);
    float _3981 = fma(_3649, _3961, _3973);
    float _3983 = -_3969;
    float _3985 = fma(_3983, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3979);
    float _3987 = fma(_3653, _3969, _3981);
    float _3989 = precise::clamp(_3987, 0.0, 1.0);
    float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3993 = _3985 + _3991;
    float _3995 = _3967 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3997 = _3993 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3999 = precise::clamp(_3997, 0.0, 1.0);
    float _4001 = exp2(_3995);
    float _4003 = _4001 * _3999;
    float _4005 = _3989 * _4003;
    float _4007 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4009 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4011 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _4007;
    out.m_92.y = _4009;
    out.m_92.z = _4011;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3783 = false;
    bool _209 = false;
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
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4068 = as_type<float>(_129);
        out.gl_Position.z = _4068;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_61.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _123 = _151;
    }
    float _153 = _123;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_59.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4138 = as_type<float>(_167);
        out.gl_Position.z = _4138;
    }
    if (_159)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _173 = as_type<int>(_169) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_169) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _207;
    if (!_189)
    {
        float _191 = in.m_66.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_113);
        float _213 = 1.0 / _211;
        float _215 = _147 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = in.m_56.x;
    float _221 = in.m_56.y;
    float _223 = in.m_56.z;
    float _225 = _221 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _227 = _221 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _229 = fma(_219, (*spvDescriptorSet0.vp_c10)._m0[4].x, _225);
    float _231 = fma(_219, (*spvDescriptorSet0.vp_c10)._m0[6].x, _227);
    float _233 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[4].z, _229);
    float _235 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[6].z, _231);
    float _237 = _233 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _239 = _235 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _241 = fma(_237, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _243 = fma(_239, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _245 = floor(_241);
    float _247 = floor(_243);
    float _249 = -_245;
    float _251 = _241 + _249;
    float _253 = -_247;
    float _255 = _243 + _253;
    float2 _4287 = float2(_251, _255);
    float _257 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4287, float2(0.0), isnan(_4287)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4287, float2(0.0), isnan(_4287)), level(0.0)).x;
    float _259 = in.m_66.x;
    float _261 = in.m_66.y;
    float _263 = in.m_66.z;
    float _265 = in.m_66.w;
    float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _269 = log2(_267);
    float _271 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _291 = 1.0 / _275;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _295 = _293 != 0;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _299 = 1.0 / _283;
    float _301 = _259 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _303 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_217);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_289;
    float _317 = fma(_301, 2.0, _315);
    float _319 = _221 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = _217 + _321;
    float _325 = 1.0 / _279;
    float _327 = _259 * 2.0;
    float _329 = _323 * _291;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = _217 + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _337 = _217 + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _339;
    float _343 = 1.0 / _287;
    float _345 = _261 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _347 = _333 * _299;
    float _349 = _263 * 2.0;
    float _351 = _259 + _261;
    float _353 = fma(_345, -2.0, _297);
    float _355 = fma(_219, (*spvDescriptorSet0.vp_c10)._m0[5].x, _319);
    float _357 = floor(_327);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _361 = _217 + _359;
    float _363 = _261 * 2.0;
    float _365 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[5].z, _355);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _367;
    float _371 = _361 * _325;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _373;
    float _377 = floor(_349);
    float _379 = _337 * _343;
    float _381 = _263 + _259;
    float _383 = _351 + (-1.0);
    float _385 = _263 + _261;
    float _387 = fma(_369, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _389 = _381 + (-1.0);
    float _391 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _393 = _385 + (-1.0);
    bool _395 = _357 >= 0.0;
    bool _397 = isnan(_357);
    bool _399 = _395 || _397;
    bool _401 = isnan(0.0);
    bool _403 = _399 || _401;
    float _405 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _407 = as_type<int>(_389);
    if (_295)
    {
        _407 = 0;
    }
    int _409 = _407;
    float _411 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _413 = _409;
    if (!_295)
    {
        _413 = 1;
    }
    int _415 = _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _417;
    bool _421 = _357 > 0.0;
    float _423 = floor(_363);
    bool _425 = _377 > 0.0;
    float _427 = fma(_419, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _429 = _377 >= 0.0;
    bool _431 = isnan(_377);
    bool _433 = _429 || _431;
    bool _435 = isnan(0.0);
    bool _437 = _433 || _435;
    float _439 = fma(_341, _347, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _441 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _443 = isnan(_217);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = fma(_375, _347, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _455 = _403 ? 0 : 1;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _461 = _415 != 1;
    float _463 = -_451;
    float _465 = _463 + 1.0;
    bool _467 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _469 = isnan(_217);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _483 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _485 = isnan(_217);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = fma(_459, _371, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _497 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _499 = isnan(_217);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = fma(_481, _371, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _511 = _423 > 0.0;
    float _513 = _493 * _465;
    float _515 = -_493;
    float _517 = _515 + 1.0;
    float _519 = -_507;
    float _521 = _519 + 1.0;
    bool _523 = _423 >= 0.0;
    bool _525 = isnan(_423);
    bool _527 = _523 || _525;
    bool _529 = isnan(0.0);
    bool _531 = _527 || _529;
    float _533 = -_477;
    float _535 = _533 + 1.0;
    float _537 = _507 * _517;
    float _539 = _313 * _521;
    int _541 = ~_455;
    int _543 = _541 + 1;
    int _545 = _543 + 1;
    float _547 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _549 = int(_547);
    int _551 = _545;
    float _553 = _427;
    if (!_421)
    {
        int _555 = ~_455;
        int _557 = _555 + 1;
        _551 = _557;
    }
    int _559 = _551;
    float _561 = _387 * _539;
    int _563 = _437 ? 0 : 1;
    float _565 = _451 * _535;
    float _567 = _427 * _539;
    float _569 = _365 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _571 = ~_563;
    int _573 = _571 + 1;
    int _575 = _573 + 1;
    float _577 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _579 = int(_577);
    int _581 = _575;
    if (!_425)
    {
        int _583 = ~_563;
        int _585 = _583 + 1;
        _581 = _585;
    }
    int _587 = _581;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _593 = _591 != 0;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _597 = _595 != 0;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _601 = _599 != 0;
    float _603 = _569 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _605 = _531 ? 0 : 1;
    float _607 = _569 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (!_461)
    {
        _553 = _261;
    }
    float _609 = _553;
    float _611 = fma(_237, (*spvDescriptorSet0.vp_c8)._m0[11].x, _603);
    bool _613 = !_597;
    int _615 = _613 ? 0 : 1;
    float _617 = fma(_237, (*spvDescriptorSet0.vp_c8)._m0[10].x, _607);
    bool _619 = !_593;
    int _621 = _619 ? 0 : 1;
    float _623 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[11].z, _611);
    bool _625 = !_601;
    int _627 = _625 ? 0 : 1;
    float _629 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[10].z, _617);
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _633 = _631 != 0;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _637 = _635 != 0;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _641 = _639 != 0;
    float _643 = _623 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _645 = float(_113);
    float _647 = _629 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _649 = ~_605;
    int _651 = _649 + 1;
    int _653 = _651 + 1;
    float _655 = -_147;
    float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[76].x, _317);
    float _659 = _609;
    int _661 = _653;
    if (_461)
    {
        _659 = _259;
    }
    float _663 = _659;
    float _665 = _647 + _643;
    bool _667 = !_633;
    float _669 = _667 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _671 = 1.0 / _645;
    float _673 = _669;
    float _675 = _663;
    if (!_511)
    {
        int _677 = ~_605;
        int _679 = _677 + 1;
        _661 = _679;
    }
    int _681 = _661;
    float _683 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[83].z, _589);
    float _685 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _353);
    float _687 = float(_549);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _693 = abs(as_type<int>(_669));
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _697 = as_type<float>(_549);
    if (!_461)
    {
        _673 = _263;
    }
    float _699 = _673;
    float _701 = 1.0 / _687;
    float _703 = _699;
    if (!_461)
    {
        _675 = _263;
    }
    float _705 = _675;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _711 = _705;
    if (_461)
    {
        _703 = _261;
    }
    float _713 = _703;
    float _715 = fma(_691, _379, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _717 = _671 * _147;
    if (_461)
    {
        _711 = _261;
    }
    float _719 = _711;
    float _721 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[83].w, _695);
    float _723 = _269 * _147;
    if (!_461)
    {
        _697 = _261;
    }
    float _725 = _697;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _729 = _719 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _731 = _725;
    if (_461)
    {
        _731 = _259;
    }
    float _733 = _731;
    float _735 = exp2(_723);
    float _737 = float(_693);
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _741 = float(_587);
    float _743 = _733 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _745 = fma(_729, -2.0, _727);
    float _747 = float(_579);
    float _749 = _737 * _741;
    float _751 = -_739;
    float _753 = fma(_743, 2.0, _751);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _757 = 1.0 + _755;
    float _759 = in.m_68.x;
    float _761 = in.m_68.y;
    float _763 = in.m_68.z;
    float _765 = 1.0 / _747;
    float _767 = _701 * _147;
    bool _769 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _771 = isnan(1.0);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _777 = _773 || _775;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _781 = -_735;
    float _783 = _781 + 1.0;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _787 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _789 = isnan(0.0);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _795 = _791 || _793;
    float _797 = 1.0 / _757;
    float _799 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[78].z, _779);
    float _801 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[78].w, _785);
    bool _803 = !_637;
    int _805 = _803 ? 0 : 1;
    float _807 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _683);
    float _809 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _799);
    float _811 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _801);
    float _813 = _795 ? _783 : 0.0;
    float _815 = 1.0 / _643;
    float _817 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _721);
    float _819 = _765 * _147;
    float _821 = -_147;
    float _823 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[81].x, _753);
    float _825 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _745);
    float _827 = _749 * (-2.0);
    float _829 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _831 = fma(_709, _379, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    if (_777)
    {
        float _833 = _813 * _797;
        _149 = _833;
    }
    float _835 = _149;
    int _837 = abs(_805);
    float _839 = fma(_391, _827, _391);
    float _841 = fma(_827, _759, _759);
    float _843 = float(_559);
    float _845 = _259 + (-0.5);
    float _847 = float(_837);
    float _849 = _569 + _829;
    float _851 = _665 * _815;
    float _853 = _851 * 0.5;
    float _855 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[196].x, _841);
    bool _857 = !_641;
    int _859 = _857 ? 0 : 1;
    float _861 = _847 * _843;
    float _863 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _865 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[30].w, _863);
    float _867 = fma(_839, _835, _855);
    int _869 = abs(_859);
    float _871 = _861 * (-2.0);
    float _873 = float(_681);
    float _875 = _261 + (-0.5);
    float _877 = float(_869);
    float _879 = fma(_871, _761, _761);
    float _881 = -_313;
    float _883 = _881 + 1.0;
    float _885 = fma(_411, _871, _411);
    float _887 = 1.0 / _865;
    float _889 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[196].y, _879);
    float _891 = _877 * _873;
    float _893 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[143].x, _567);
    float _895 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[143].y, _561);
    float _897 = fma(_885, _835, _889);
    float _899 = _891 * (-2.0);
    float _901 = in.m_70.x;
    float _903 = in.m_70.y;
    float _905 = fma(_495, _537, _893);
    float _907 = fma(_509, _537, _895);
    float _909 = _897 * 0.15915493667125701904296875;
    float _911 = fma(_899, _763, _763);
    float _913 = _263 + (-0.5);
    float _915 = fma(_405, _899, _405);
    float _917 = _849 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _919 = fma(_439, _513, _905);
    float _921 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[196].z, _911);
    float _923 = fma(_453, _513, _907);
    float _925 = _849 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _927 = fma(_237, (*spvDescriptorSet0.vp_c15)._m0[126].x, _917);
    float _929 = fma(_915, _835, _921);
    float _931 = _867 * 0.15915493667125701904296875;
    float _933 = fma(_715, _565, _919);
    float _935 = fma(_831, _565, _923);
    float _937 = _929 * 0.15915493667125701904296875;
    float _939 = fma(_237, (*spvDescriptorSet0.vp_c15)._m0[127].x, _925);
    float _941 = fma(_239, (*spvDescriptorSet0.vp_c15)._m0[126].z, _927);
    float _943 = _931 * 6.283185482025146484375;
    float _945 = sin(_943);
    float _947 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[147].x, _933);
    float _949 = fma(_239, (*spvDescriptorSet0.vp_c15)._m0[127].z, _939);
    float _951 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[147].y, _935);
    float _953 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _955 = _887 * _953;
    float _957 = _941 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _959 = _947 * _901;
    float _961 = _951 * _903;
    float _963 = _931 * 6.283185482025146484375;
    float _965 = cos(_963);
    bool _967 = _955 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _969 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    bool _971 = _955 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _973 = _959 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _975 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _977 = _961 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _979 = _909 * 6.283185482025146484375;
    float _981 = sin(_979);
    float _983 = _973 * _969;
    float _985 = _977 * _975;
    float _987 = _949 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _989 = 2;
    if (!_967)
    {
        _989 = 1;
    }
    int _991 = _989;
    float _993 = _909 * 6.283185482025146484375;
    float _995 = cos(_993);
    float _997 = _937 * 6.283185482025146484375;
    float _999 = cos(_997);
    float _1001 = _945 * _981;
    float _1003 = _965 * _981;
    float _1005 = _937 * 6.283185482025146484375;
    float _1007 = sin(_1005);
    float _1009 = _945 * _995;
    float _1011 = _965 * _995;
    float _1013 = _945 * _999;
    float _1015 = _995 * _999;
    float _1017 = _965 * _999;
    float _1019 = _981 * _999;
    bool _1021 = !_967;
    int _1023 = _1021 ? 0 : 1;
    float _1025 = trunc(_957);
    int _1027 = int(_1025);
    float _1029 = _1017 * _985;
    float _1031 = fma(_1007, _1011, _1001);
    int _1033 = _991;
    if (!_971)
    {
        _1033 = _1023;
    }
    int _1035 = _1033;
    float _1037 = fma(_1007, _1001, _1011);
    float _1039 = -_985;
    float _1041 = _1007 * _1039;
    float _1043 = -_1003;
    float _1045 = fma(_1007, _1009, _1043);
    float _1047 = trunc(_987);
    int _1049 = int(_1047);
    int _1051 = _1035 << 6;
    float _1053 = -_1009;
    float _1055 = fma(_1007, _1003, _1053);
    float _1057 = fma(_1015, _983, _1041);
    float _1059 = _1013 * _985;
    int _1061 = _1051 + 96;
    uint _1064 = uint(int(uint(_1061) >> uint(2)));
    uint _1066 = uint(int(uint(int(_1064)) >> uint(2)));
    int _1068 = int(_1064) & 3;
    float _1070 = (*spvDescriptorSet0.vp_c15)._m0[int(_1066)][_1068];
    int _1072 = int(_1064) + 1;
    uint _1074 = uint(int(uint(_1072) >> uint(2)));
    int _1076 = _1072 & 3;
    float _1078 = (*spvDescriptorSet0.vp_c15)._m0[int(_1074)][_1076];
    float _1080 = fma(_1031, _983, _1029);
    float _1082 = fma(_1019, _271, _1057);
    float _1084 = fma(_1045, _983, _1059);
    int _1086 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1088 = _1027 + _1086;
    int _1090 = _1088 + 1;
    float _1092 = fma(_1055, _271, _1080);
    float _1094 = fma(_1037, _271, _1084);
    int _1096 = _1051 + 104;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    uint _1100 = uint(int(uint(int(_1098)) >> uint(2)));
    int _1102 = int(_1098) & 3;
    float _1104 = (*spvDescriptorSet0.vp_c15)._m0[int(_1100)][_1102];
    int _1106 = int(_1098) + 1;
    uint _1108 = uint(int(uint(_1106) >> uint(2)));
    int _1110 = _1106 & 3;
    float _1112 = (*spvDescriptorSet0.vp_c15)._m0[int(_1108)][_1110];
    bool _1114 = _1090 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1116 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1118 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1120 = _1049 + _1118;
    int _1122 = _1120 + 1;
    float _1124 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1116);
    int _1126 = _1090 | _1122;
    int _1128 = _1051 + 48;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
    int _1134 = int(_1130) & 3;
    float _1136 = (*spvDescriptorSet0.vp_c15)._m0[int(_1132)][_1134];
    int _1138 = int(_1130) + 1;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    int _1142 = _1138 & 3;
    float _1144 = (*spvDescriptorSet0.vp_c15)._m0[int(_1140)][_1142];
    float _1146 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1124);
    bool _1148 = _1126 < 0;
    bool _1150 = _1148 || _1114;
    float _1152 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1154 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1156 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1158 = _1122 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1160 = _1158 || _1150;
    int _1162 = _1051 + 64;
    uint _1164 = uint(int(uint(_1162) >> uint(2)));
    uint _1166 = uint(int(uint(int(_1164)) >> uint(2)));
    int _1168 = int(_1164) & 3;
    float _1170 = (*spvDescriptorSet0.vp_c15)._m0[int(_1166)][_1168];
    int _1172 = int(_1164) + 1;
    uint _1174 = uint(int(uint(_1172) >> uint(2)));
    int _1176 = _1172 & 3;
    float _1178 = (*spvDescriptorSet0.vp_c15)._m0[int(_1174)][_1176];
    float _1180 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1152);
    float _1182 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1154);
    float _1184 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1180);
    float _1186 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1182);
    int _1188 = _1051 + 56;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    uint _1192 = uint(int(uint(int(_1190)) >> uint(2)));
    int _1194 = int(_1190) & 3;
    float _1196 = (*spvDescriptorSet0.vp_c15)._m0[int(_1192)][_1194];
    int _1198 = int(_1190) + 1;
    uint _1200 = uint(int(uint(_1198) >> uint(2)));
    int _1202 = _1198 & 3;
    float _1204 = (*spvDescriptorSet0.vp_c15)._m0[int(_1200)][_1202];
    float _1206 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1208 = _239 + _1156;
    float _1210 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1212 = _1090;
    float _1214 = _1208;
    if (!_1160)
    {
        int _1216 = _1122 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1218 = _1216 + _1090;
        _1212 = _1218;
    }
    int _1220 = _1212;
    float _1222 = _237 + _1206;
    float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1226 = _1208 + _1224;
    int _1228 = _1051 + 72;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    float _1246 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1248 = _1222 + _1246;
    float _1250 = _1226 * _1226;
    int _1252 = 0;
    int _1254 = as_type<int>(_1250);
    float _1256 = _1222;
    float _1258 = as_type<float>(_1220);
    if (!_1160)
    {
        int _1260 = _1220 << 2;
        _1252 = _1260;
    }
    int _1262 = _1252;
    float _1264 = fma(_1248, _1248, _1250);
    int _1266 = _1262;
    if (!_1160)
    {
        uint _1268 = uint(int(uint(_1220) >> uint(2)));
        _1254 = int(_1268);
    }
    int _1270 = _1254;
    int _1272 = _1051 + 80;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    uint _1276 = uint(int(uint(int(_1274)) >> uint(2)));
    int _1278 = int(_1274) & 3;
    float _1280 = (*spvDescriptorSet0.vp_c15)._m0[int(_1276)][_1278];
    int _1282 = int(_1274) + 1;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    int _1286 = _1282 & 3;
    float _1288 = (*spvDescriptorSet0.vp_c15)._m0[int(_1284)][_1286];
    int _1290 = _1270;
    if (!_1160)
    {
        int _1292 = 12 & _1262;
        _1266 = _1292;
    }
    int _1294 = _1266;
    float _1296 = sqrt(_1264);
    if (!_1160)
    {
        int _1298 = _1270 << 4;
        int _1300 = _1298 + _1294;
        _1290 = _1300;
    }
    int _1302 = _1290;
    float _1304 = _849 * _1078;
    float _1306 = fma(_237, _1070, _1304);
    float _1308 = fma(_239, _1104, _1306);
    float _1310 = _849 * _1144;
    float _1312 = _1308 + _1112;
    bool _1314 = _1296 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1316 = fma(_237, _1136, _1310);
    float _1318 = _569 + _1210;
    float _1320 = _1136;
    float _1322 = _1296;
    if (!_1160)
    {
        float _1324 = floor(_957);
        _1320 = _1324;
    }
    float _1326 = _1320;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1330 = _1328 != 0;
    int _1332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1334 = _1332 != 0;
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1338 = _1336 != 0;
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1342 = _1340 != 0;
    float _1344 = _849 * _1178;
    float _1346 = fma(_237, _1170, _1344);
    bool _1348 = !_1334;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = 1.0 / _1312;
    bool _1354 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1356 = isnan(0.5);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1362 = _1358 || _1360;
    float _1364 = fma(_239, _1196, _1316);
    bool _1366 = !_1330;
    int _1368 = _1366 ? 0 : 1;
    bool _1370 = !_1338;
    int _1372 = _1370 ? 0 : 1;
    float _1374 = _1364 + _1204;
    bool _1376 = !_1342;
    int _1378 = _1376 ? 0 : 1;
    float _1380 = fma(_239, _1236, _1346);
    float _1382 = _1346;
    float _1384 = _1170;
    if (!_1314)
    {
        _1382 = _1318;
    }
    float _1386 = _1382;
    float _1388 = _1380 + _1244;
    bool _1390 = !_1314;
    float _1392 = _1386;
    if (!_1390)
    {
        float _1394 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1398 = _1296 + _1396;
        float _1400 = _1318 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = rsqrt(_1264);
        float _1404 = _1398 * _1394;
        float _1406 = _1404 * 0.15915493667125701904296875;
        float _1408 = _1406 * 6.283185482025146484375;
        float _1410 = cos(_1408);
        float _1412 = _1406 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        float _1416 = _1410 + (-1.0);
        float _1418 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1420 = fma(_1414, _1400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1422 = fma(_1318, _1410, _1418);
        float _1424 = _1402 * _1420;
        float _1426 = fma(_1248, _1424, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1428 = fma(_1226, _1424, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1256 = _1426;
        _1214 = _1428;
        _1392 = _1422;
        _1384 = _1418;
        _1322 = _1406;
    }
    float _1430 = _1256;
    float _1432 = _1214;
    float _1434 = _1392;
    float _1436 = _1384;
    float _1438 = _1322;
    float _1440 = _1436;
    float _1442 = _1438;
    float _1444 = _1434;
    if (_1362)
    {
        _1440 = _1430;
    }
    float _1446 = _1440;
    float _1448 = _1446;
    if (_1362)
    {
        _1442 = _1432;
    }
    float _1450 = _1442;
    float _1452 = _1450;
    if (!_1362)
    {
        float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1456 = _569 + _1454;
        float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1460 = _237 + _1458;
        float _1462 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1464 = -_239;
        float _1466 = _1464 + _1432;
        float _1468 = _1456 * _1456;
        float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1472 = _239 + _1470;
        float _1474 = fma(_1460, _1460, _1468);
        float _1476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1478 = fma(_1472, _1472, _1474);
        float _1480 = sqrt(_1478);
        float _1482 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1484 = precise::min(_1480, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1486 = _1484 * _1476;
        float _1488 = -_569;
        float _1490 = _1488 + _1434;
        float _1492 = _1482 * _1486;
        float _1494 = -_237;
        float _1496 = _1494 + _1430;
        float _1498 = fma(_1490, _1492, _569);
        float _1500 = fma(_1496, _1492, _237);
        float _1502 = fma(_1466, _1492, _239);
        _1444 = _1498;
        _1448 = _1500;
        _1452 = _1502;
    }
    float _1504 = _1444;
    float _1506 = _1448;
    float _1508 = _1452;
    int _1510 = _1051 + 88;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    uint _1514 = uint(int(uint(int(_1512)) >> uint(2)));
    int _1516 = int(_1512) & 3;
    float _1518 = (*spvDescriptorSet0.vp_c15)._m0[int(_1514)][_1516];
    int _1520 = int(_1512) + 1;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    int _1524 = _1520 & 3;
    float _1526 = (*spvDescriptorSet0.vp_c15)._m0[int(_1522)][_1524];
    float _1528 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1530 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1532 = _1374 * _1352;
    float _1534 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1536 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1528);
    float _1538 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1530);
    float _1540 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1542 = _1430;
    if (!_1160)
    {
        int _1544 = _1302 + 400;
        uint _1546 = uint(int(uint(_1544) >> uint(2)));
        uint _1548 = uint(int(uint(int(_1546)) >> uint(2)));
        int _1550 = int(_1546) & 3;
        float _1552 = (*spvDescriptorSet0.vp_c15)._m0[int(_1548)][_1550];
        _1542 = _1552;
    }
    float _1554 = _1542;
    float _1556 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1536);
    bool _1558 = _1532 >= 0.0;
    float _1560 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1534);
    float _1562 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1538);
    float _1564 = _1556 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1566 = _1388 * _1352;
    bool _1568 = _1532 <= 1.0;
    bool _1570 = _1568 && _1558;
    float _1572 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1560);
    float _1574 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1540);
    float _1576 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1578 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1580 = _1566 >= 0.0;
    bool _1582 = _1580 && _1570;
    float _1584 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1586 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1574);
    float _1588 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1578);
    bool _1590 = _1566 <= 1.0;
    bool _1592 = _1590 && _1582;
    float _1594 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1596 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1598 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1600 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1588);
    float _1602 = _849 * _1288;
    float _1604 = _1236;
    float _1606 = _1594;
    if (!_1160)
    {
        float _1608 = floor(_987);
        _1604 = _1608;
    }
    float _1610 = _1604;
    float _1612 = -_1596;
    float _1614 = fma(_1612, _1594, 1.0);
    float _1616 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1600);
    float _1618 = fma(_237, _1280, _1602);
    float _1620 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1622 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (_1592)
    {
        float _1624 = float(_1035);
        _1606 = _1624;
    }
    float _1626 = _1606;
    float _1628 = log2(_1614);
    float _1630 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1620);
    float _1632 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1622);
    float _1634 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1630);
    float _1636 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1632);
    float _1638 = 1.0 / _1616;
    float _1640 = 0.0;
    float _1642 = _1630;
    if (!_1160)
    {
        float _1644 = -_1610;
        float _1646 = _987 + _1644;
        _1640 = _1646;
    }
    float _1648 = _1640;
    float _1650 = fma(_239, _1518, _1618);
    float _1652 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1634);
    float _1654 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1636);
    float _1656 = _1650 + _1526;
    float _1658 = _1620;
    float _1660 = _1652;
    if (_1592)
    {
        float _1662 = rint(_1626);
        float _1664 = precise::max(_1662, 0.0);
        uint _1666 = uint(_1664);
        uint _1668 = clamp(_1666, 0u, 65535u);
        _1658 = as_type<float>(_1668);
    }
    float _1670 = _1658;
    float _1672 = _1628 * 0.693147182464599609375;
    float _1674 = _1656 * _1352;
    float _1676 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1678 = _1656;
    if (!_1160)
    {
        float _1680 = rint(_1554);
        float _1682 = precise::max(_1680, 0.0);
        uint _1684 = uint(_1682);
        uint _1686 = clamp(_1684, 0u, 65535u);
        _1678 = as_type<float>(_1686);
    }
    float _1688 = _1678;
    float _1690 = _1652 * _1638;
    float _1692 = _1654 * _1638;
    float _1694 = fma(_1690, 0.5, 0.5);
    float _1696 = fma(_1692, -0.5, 0.5);
    float _1698 = _1690;
    if (!_1160)
    {
        float _1700 = -_1326;
        float _1702 = _957 + _1700;
        _1698 = _1702;
    }
    float _1704 = _1698;
    float _1706 = _1326;
    if (_1592)
    {
        float3 _6618 = float3(_1532, _1566, float(as_type<int>(_1670)));
        float3 _6622 = select(_6618, float3(0.0), isnan(_6618));
        float _1708 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6622.xy, uint(rint(_6622.z)), _1674, level(0.0));
        _1706 = _1708;
    }
    float _1710 = _1706;
    float3 _6632 = float3(_1694, _1696, _1676);
    float _1712 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6632, float3(0.0), isnan(_6632)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6632, float3(0.0), isnan(_6632)), level(0.0)).x;
    float3 _6641 = float3(_1694, _1696, _1676);
    float4 _1715 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6641, float3(0.0), isnan(_6641)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6641, float3(0.0), isnan(_6641)), level(0.0)).xyzw;
    float _1717 = _1715.x;
    float _1719 = _1715.y;
    float _1721 = _1715.z;
    float _1723 = _1715.w;
    float _1725 = _1648;
    if (!_1160)
    {
        float3 _6664 = float3(_1704, _1648, float(as_type<int>(_1688)));
        float3 _6666 = select(_6664, float3(0.0), isnan(_6664));
        float _1727 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6666.xy, uint(rint(_6666.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6666.xy, uint(rint(_6666.z)), level(0.0)).x;
        _1725 = _1727;
    }
    float _1729 = _1725;
    float _1731 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1733 = int(_1731);
    int _1735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1737 = _1735 != 0;
    int _1739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1741 = _1739 != 0;
    int _1743 = abs(_615);
    int _1745 = abs(_1350);
    float _1747 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1749 = int(_1747);
    int _1751 = abs(_1368);
    int _1753 = abs(_1372);
    int _1755 = abs(_1378);
    float _1757 = as_type<float>(_1755);
    if (_1737)
    {
        float _1759 = in.m_66.x;
        _1642 = _1759;
    }
    float _1761 = _1642;
    float _1763 = float(uint(_1733));
    float _1765 = trunc(_767);
    int _1767 = int(_1765);
    float _1769 = _1761;
    if (!_1737)
    {
        float _1771 = in.m_66.y;
        _1769 = _1771;
    }
    float _1773 = _1769;
    int _1775 = ~_1733;
    int _1777 = _1775 + 1;
    float _1779 = float(uint(_1749));
    float _1781 = 1.0 / _1763;
    int _1783 = ~_1749;
    int _1785 = _1783 + 1;
    float _1787 = 1.0 / _1779;
    float _1789 = trunc(_819);
    int _1791 = int(_1789);
    int _1793 = as_type<int>(_1781) + (-2);
    float _1795 = float(uint(_1767));
    float _1797 = float(_1767);
    int _1799 = as_type<int>(_1787) + (-2);
    float _1801 = as_type<float>(_1793) * _1795;
    float _1803 = _1795;
    if (_1737)
    {
        _1803 = 1.0;
    }
    float _1805 = _1803;
    float _1807 = _1805;
    if (!_1737)
    {
        _1807 = 7.345489978790283203125;
    }
    float _1809 = _1807;
    float _1811 = trunc(_1801);
    float _1813 = precise::max(_1811, 0.0);
    uint _1815 = uint(_1813);
    float _1817 = float(uint(_1791));
    float _1819 = _1809 * _259;
    float _1821 = as_type<float>(_1799) * _1817;
    float _1823 = _1817;
    if (_1737)
    {
        _1823 = 1.0;
    }
    float _1825 = _1823;
    float _1827 = floor(_1819);
    float _1829 = _1825;
    if (!_1737)
    {
        _1829 = 1.2345600128173828125;
    }
    float _1831 = _1829;
    float _1833 = _1773 * _1831;
    float _1835 = trunc(_1821);
    float _1837 = precise::max(_1835, 0.0);
    uint _1839 = uint(_1837);
    int _1841 = _1777 * int(_1815);
    int _1843 = _1841 + _1767;
    float _1845 = float(uint(_1843));
    float _1847 = floor(_1833);
    float _1849 = float(_1733);
    float _1851 = as_type<float>(_1793) * _1845;
    int _1853 = _1785 * int(_1839);
    int _1855 = _1853 + _1791;
    float _1857 = trunc(_1851);
    float _1859 = precise::max(_1857, 0.0);
    uint _1861 = uint(_1859);
    float _1863 = float(uint(_1855));
    float _1865 = -_1847;
    float _1867 = _1833 + _1865;
    float _1869 = float(_1749);
    float _1871 = as_type<float>(_1799) * _1863;
    float _1873 = -_1827;
    float _1875 = _1819 + _1873;
    int _1877 = ~_1733;
    int _1879 = _1877 + 1;
    bool _1881 = _1797 >= _1849;
    bool _1883 = isnan(_1797);
    bool _1885 = _1881 || _1883;
    bool _1887 = isnan(_1849);
    bool _1889 = _1885 || _1887;
    float _1891 = float(_1889);
    float _1893 = _1867 * _1869;
    float _1895 = trunc(_1871);
    float _1897 = precise::max(_1895, 0.0);
    uint _1899 = uint(_1897);
    int _1901 = int(_1815) + int(_1861);
    float _1903 = _1875 * _1849;
    float _1905 = _1849 * _717;
    float _1907 = _1869 * _717;
    int _1909 = _1879 * _1901;
    int _1911 = _1909 + _1767;
    float _1913 = trunc(_1891);
    int _1915 = int(_1913);
    bool _1917 = uint(_1911) >= uint(_1733);
    bool _1919 = !_1917;
    int _1921 = _1919 ? 0 : (-1);
    float _1923 = trunc(_1903);
    int _1925 = int(_1923);
    int _1927 = int(_1839) + int(_1899);
    float _1929 = float(_1791);
    int _1931 = ~_1749;
    int _1933 = _1931 + 1;
    bool _1935 = _1929 >= _1869;
    bool _1937 = isnan(_1929);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan(_1869);
    bool _1943 = _1939 || _1941;
    float _1945 = float(_1943);
    float _1947 = trunc(_1893);
    int _1949 = int(_1947);
    int _1951 = _1933 * _1927;
    int _1953 = _1951 + _1791;
    int _1955 = ~_1901;
    int _1957 = _1955 + _1921;
    int _1959 = _1957 + 1;
    int _1961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1963 = _1961 != 0;
    int _1965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1967 = _1965 != 0;
    float _1969 = trunc(_1945);
    int _1971 = int(_1969);
    bool _1973 = uint(_1953) >= uint(_1749);
    bool _1975 = !_1963;
    int _1977 = _1975 ? 0 : 1;
    bool _1979 = !_1967;
    int _1981 = _1979 ? 0 : 1;
    int _1983 = abs(_1977);
    int _1985 = _1733 * _1959;
    int _1987 = _1985 + _1767;
    bool _1989 = !_1973;
    int _1991 = _1989 ? 0 : (-1);
    float _1993 = trunc(_1905);
    int _1995 = int(_1993);
    int _1997 = abs(_1981);
    bool _1999 = _1733 == 0;
    int _2001 = ~_1927;
    int _2003 = _2001 + _1991;
    int _2005 = _2003 + 1;
    int _2007 = _1925 * _1983;
    int _2009 = _2007 + _1767;
    float _2011 = trunc(_1907);
    int _2013 = int(_2011);
    int _2015 = ~_1915;
    int _2017 = _2015 + 1;
    int _2019 = _2017 + 1;
    int _2021 = _1749 * _2005;
    int _2023 = _2021 + _1791;
    bool _2025 = !_1999;
    int _2027 = _2025 ? _1987 : (-1);
    int _2029 = _1949 * _1997;
    int _2031 = _2029 + _1791;
    bool _2033 = _1749 == 0;
    int _2035 = ~_1971;
    int _2037 = _2035 + 1;
    int _2039 = _2037 + 1;
    int _2041 = _2027 * _2019;
    bool _2043 = !_2033;
    int _2045 = _2043 ? _2023 : (-1);
    int _2047 = _1733 + (-1);
    int _2049 = _1749 + (-1);
    int _2051 = _2045 * _2039;
    int _2053 = _1915 * _2047;
    int _2055 = _2053 + _2041;
    int _2057 = _1971 * _2049;
    int _2059 = _2057 + _2051;
    int _2061 = abs(_621);
    int _2063 = _2055 * _1743;
    bool _2065 = !_1741;
    int _2067 = _2065 ? 0 : 1;
    int _2069 = abs(_627);
    int _2071 = _1995 * _2061;
    int _2073 = _2071 + _2063;
    int _2075 = abs(_2067);
    int _2077 = _2059 * _1745;
    int _2079 = _2009 * _2069;
    int _2081 = _2079 + _2073;
    int _2083 = _2013 * _1751;
    int _2085 = _2083 + _2077;
    int _2087 = ~_1749;
    int _2089 = _2087 + 1;
    int _2091 = _1925 * _2075;
    int _2093 = _2091 + _2081;
    int _2095 = _2031 * _1753;
    int _2097 = _2095 + _2085;
    int _2099 = ~_1733;
    int _2101 = _2099 + 1;
    float _2103 = float(uint(_2093));
    int _2105 = _1949 * _1755;
    int _2107 = _2105 + _2097;
    int _2109 = ~_1733;
    int _2111 = _2109 + 1;
    int _2113 = ~_1749;
    int _2115 = _2113 + 1;
    float _2117 = as_type<float>(_1793) * _2103;
    float _2119 = float(uint(_2107));
    float _2121 = float(uint(_2009));
    float _2123 = trunc(_2117);
    float _2125 = precise::max(_2123, 0.0);
    uint _2127 = uint(_2125);
    float _2129 = as_type<float>(_1799) * _2119;
    float _2131 = as_type<float>(_1793) * _2121;
    float _2133 = trunc(_2129);
    float _2135 = precise::max(_2133, 0.0);
    uint _2137 = uint(_2135);
    int _2139 = _2101 * int(_2127);
    int _2141 = _2139 + _2093;
    float _2143 = trunc(_2131);
    float _2145 = precise::max(_2143, 0.0);
    uint _2147 = uint(_2145);
    float _2149 = float(uint(_2141));
    int _2151 = _2089 * int(_2137);
    int _2153 = _2151 + _2107;
    float _2155 = as_type<float>(_1793) * _2149;
    float _2157 = float(uint(_2153));
    int _2159 = ~_1733;
    int _2161 = _2159 + 1;
    float _2163 = trunc(_2155);
    float _2165 = precise::max(_2163, 0.0);
    uint _2167 = uint(_2165);
    float _2169 = as_type<float>(_1799) * _2157;
    float _2171 = float(uint(_2031));
    int _2173 = _2161 * int(_2147);
    int _2175 = _2173 + _2009;
    float _2177 = trunc(_2169);
    float _2179 = precise::max(_2177, 0.0);
    uint _2181 = uint(_2179);
    float _2183 = as_type<float>(_1799) * _2171;
    float _2185 = float(uint(_2175));
    int _2187 = ~_1749;
    int _2189 = _2187 + 1;
    float _2191 = as_type<float>(_1793) * _2185;
    float _2193 = trunc(_2183);
    float _2195 = precise::max(_2193, 0.0);
    uint _2197 = uint(_2195);
    int _2199 = int(_2127) + int(_2167);
    int _2201 = int(_2137) + int(_2181);
    int _2203 = _2111 * _2199;
    int _2205 = _2203 + _2093;
    float _2207 = trunc(_2191);
    float _2209 = precise::max(_2207, 0.0);
    uint _2211 = uint(_2209);
    int _2213 = _2115 * _2201;
    int _2215 = _2213 + _2107;
    bool _2217 = uint(_2205) >= uint(_1733);
    int _2219 = _2189 * int(_2197);
    int _2221 = _2219 + _2031;
    bool _2223 = !_2217;
    int _2225 = _2223 ? 0 : (-1);
    bool _2227 = uint(_2215) >= uint(_1749);
    float _2229 = float(uint(_2221));
    int _2231 = ~_2199;
    int _2233 = _2231 + _2225;
    int _2235 = _2233 + 1;
    bool _2237 = !_2227;
    int _2239 = _2237 ? 0 : (-1);
    float _2241 = as_type<float>(_1799) * _2229;
    int _2243 = int(_2147) + int(_2211);
    int _2245 = _1733 * _2235;
    int _2247 = _2245 + _2093;
    int _2249 = ~_2201;
    int _2251 = _2249 + _2239;
    int _2253 = _2251 + 1;
    float _2255 = as_type<float>(_2199);
    if (_1160)
    {
        _2255 = 1.0;
    }
    float _2257 = _2255;
    float _2259 = _2257;
    if (!_1160)
    {
        int _2261 = _1220 << 4;
        int _2263 = _2261 + 2048;
        uint _2265 = uint(int(uint(_2263) >> uint(2)));
        uint _2267 = uint(int(uint(int(_2265)) >> uint(2)));
        int _2269 = int(_2265) & 3;
        float _2271 = (*spvDescriptorSet0.vp_c15)._m0[int(_2267)][_2269];
        int _2273 = int(_2265) + 1;
        uint _2275 = uint(int(uint(_2273) >> uint(2)));
        int _2277 = _2273 & 3;
        float _2279 = (*spvDescriptorSet0.vp_c15)._m0[int(_2275)][_2277];
        int _2281 = _2263 + 8;
        uint _2283 = uint(int(uint(_2281) >> uint(2)));
        uint _2285 = uint(int(uint(int(_2283)) >> uint(2)));
        int _2287 = int(_2283) & 3;
        float _2289 = (*spvDescriptorSet0.vp_c15)._m0[int(_2285)][_2287];
        int _2291 = int(_2283) + 1;
        uint _2293 = uint(int(uint(_2291) >> uint(2)));
        int _2295 = _2291 & 3;
        float _2297 = (*spvDescriptorSet0.vp_c15)._m0[int(_2293)][_2295];
        float _2299 = _849 * _2279;
        float _2301 = fma(_237, _2271, _2299);
        float _2303 = fma(_239, _2289, _2301);
        float _2305 = _2303 + _2297;
        float _2307 = precise::clamp(_2305, 0.0, 1.0);
        float _2309 = -_2307;
        float _2311 = _2309 + _1729;
        float _2313 = fma(_2311, 500.0, 1.5);
        float _2315 = exp2(_2313);
        float _2317 = 0.0 + _2315;
        float _2319 = precise::clamp(_2317, 0.0, 1.0);
        _1258 = as_type<float>(_2263);
        _2259 = _2319;
    }
    float _2321 = _1258;
    float _2323 = _2259;
    float _2325 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2327 = _1504 + _2325;
    float _2329 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2331 = _1506 + _2329;
    float _2333 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2335 = _1508 + _2333;
    float _2337 = _2327 * _2327;
    float _2339 = fma(_2331, _2331, _2337);
    float _2341 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2343 = fma(_2335, _2335, _2339);
    float _2345 = rsqrt(_2343);
    float _2347 = sqrt(_2343);
    float _2349 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2351 = _2331 * _2349;
    float _2353 = _2335 * _2349;
    float _2355 = _2351 * _2351;
    float _2357 = _2353 * _2353;
    float _2359 = _2355 + _2357;
    float _2361 = sqrt(_2359);
    bool _2363 = _2361 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2367 = _2361 + _2365;
    float _2369 = _2321;
    float _2371 = _2359;
    float _2373 = _2367;
    float _2375 = _2341;
    float _2377 = _2351;
    float _2379 = _2353;
    float _2381 = _2355;
    float _2383 = _2357;
    if (_2363)
    {
        float _2385 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2369 = _2385;
    }
    float _2387 = _2369;
    if (_2363)
    {
        float _2389 = rsqrt(_2359);
        _2371 = _2389;
    }
    float _2391 = _2371;
    if (_2363)
    {
        float _2393 = _2367 * _2387;
        _2373 = _2393;
    }
    float _2395 = _2373;
    float _2397 = precise::max(0.0, _2341);
    float _2399 = _2397;
    if (_2363)
    {
        float _2401 = _2395 * 0.15915493667125701904296875;
        _1757 = _2401;
    }
    float _2403 = _1757;
    float _2405 = -_2349;
    float _2407 = -_2397;
    float _2409 = fma(_2327, _2405, _2407);
    float _2411 = as_type<float>(_2211);
    float _2413 = _2409;
    if (_2363)
    {
        float _2415 = _2403 * 6.283185482025146484375;
        float _2417 = sin(_2415);
        _2411 = _2417;
    }
    float _2419 = _2411;
    if (_2363)
    {
        float _2421 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2399 = _2421;
    }
    float _2423 = _2399;
    float _2425 = _2395;
    float _2427 = _2423;
    if (_2363)
    {
        float _2429 = _2403 * 6.283185482025146484375;
        float _2431 = cos(_2429);
        _2425 = _2431;
    }
    float _2433 = _2425;
    float _2435 = _2419;
    if (_2363)
    {
        float _2437 = fma(_2419, _2423, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2427 = _2437;
    }
    float _2439 = _2427;
    float _2441 = _2439;
    if (_2363)
    {
        float _2443 = _2391 * _2439;
        _2435 = _2443;
    }
    float _2445 = _2435;
    if (_2363)
    {
        float _2447 = _2433 + (-1.0);
        _2375 = _2447;
    }
    float _2449 = _2375;
    if (_2363)
    {
        float _2451 = _2351 * _2445;
        _2377 = _2451;
    }
    float _2453 = _2377;
    if (_2363)
    {
        float _2455 = _2353 * _2445;
        _2379 = _2455;
    }
    float _2457 = _2379;
    if (_2363)
    {
        float _2459 = _2449 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2441 = _2459;
    }
    float _2461 = _2441;
    if (_2363)
    {
        float _2463 = _2453 * _2453;
        _2381 = _2463;
    }
    float _2465 = _2381;
    if (_2363)
    {
        float _2467 = _2457 * _2457;
        _2383 = _2467;
    }
    float _2469 = _2383;
    int _2471 = ~_1733;
    int _2473 = _2471 + 1;
    if (_2363)
    {
        float _2475 = fma(_2409, _2433, _2461);
        _2413 = _2475;
    }
    float _2477 = _2413;
    float _2479 = fma(_2477, _2477, _2465);
    float _2481 = _2479 + _2469;
    float _2483 = rsqrt(_2481);
    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2487 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2485);
    float _2489 = precise::clamp(_2487, 0.0, 1.0);
    float _2491 = -_2489;
    float _2493 = _2491 + 1.0;
    float _2495 = abs(_2493);
    float _2497 = log2(_2495);
    float _2499 = _2483 * _2453;
    float _2501 = _2483 * _2477;
    float _2503 = _2483 * _2457;
    float _2505 = _2499 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2507 = _2501 + 1.0;
    float _2509 = -_2505;
    float _2511 = fma(_2501, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2509);
    float _2513 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2515 = -_2503;
    float _2517 = fma(_2515, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2511);
    float _2519 = exp2(_2513);
    float _2521 = fma(_2517, -0.5, 0.5);
    float _2523 = fma(_2517, 0.5, 0.5);
    float _2525 = fma(_2523, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2527 = sqrt(_2521);
    float _2529 = fma(_2523, _2525, -0.212114393711090087890625);
    float _2531 = fma(_2523, _2529, 1.570728778839111328125);
    float _2533 = -_2501;
    float _2535 = fma(_2519, _2507, _2533);
    bool _2537 = !_1999;
    int _2539 = _2537 ? _2247 : (-1);
    int _2541 = _2539 & 3;
    bool _2543 = _2541 != 0;
    float _2545 = _2527 * 0.636619746685028076171875;
    int _2547 = _2539 & 3;
    bool _2549 = _2547 != 0;
    float _2551 = -_2531;
    float _2553 = fma(_2545, _2551, 1.0);
    float _2555 = fma(_2535, 0.5, 0.5);
    int _2557 = _2473 * _2243;
    int _2559 = _2557 + _2009;
    bool _2561 = uint(_2547) > 1u;
    float2 _7832 = float2(_2553, _2555);
    float3 _2565 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7832, float2(0.0), isnan(_7832)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7832, float2(0.0), isnan(_7832)), level(0.0)).xyz;
    float _2567 = _2565.x;
    float _2569 = _2565.y;
    float _2571 = _2565.z;
    int _2573 = _1749 * _2253;
    int _2575 = _2573 + _2107;
    bool _2577 = uint(_2559) >= uint(_1733);
    float _2579 = trunc(_2241);
    float _2581 = precise::max(_2579, 0.0);
    uint _2583 = uint(_2581);
    int _2585 = _2543 ? 0 : 1;
    float _2587 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2589 = _2539 >> 31;
    float _2591 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2593 = _265 > 0.5;
    float _2595 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2587);
    bool _2597 = !_2033;
    int _2599 = _2597 ? _2575 : (-1);
    float _2601 = -_811;
    float _2603 = _2601 + 1.0;
    int _2605 = ~_2585;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    float _2611 = exp2(_2591);
    int _2613 = _2609;
    if (!_2561)
    {
        int _2615 = ~_2585;
        int _2617 = _2615 + 1;
        _2613 = _2617;
    }
    int _2619 = _2613;
    float _2621 = -_807;
    float _2623 = _2621 + 1.0;
    int _2625 = _2589 & 3;
    float _2627 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2595);
    int _2629 = _2599 >> 31;
    float _2631 = -_817;
    float _2633 = _2631 + 1.0;
    int _2635 = _2539 + _2625;
    float _2637 = -_257;
    float _2639 = _2637 + 1.0;
    int _2641 = _2629 & 3;
    float _2643 = -_809;
    float _2645 = _2643 + 1.0;
    bool _2647 = !_2577;
    int _2649 = _2647 ? 0 : (-1);
    out.m_72.x = _1506;
    out.m_72.y = _1504;
    out.m_72.z = _1508;
    bool _2651 = _2547 != 3;
    int _2653 = _2599 + _2641;
    float _2655 = -_2611;
    float _2657 = _2655 + 1.0;
    bool _2659 = uint(_2547) >= 2u;
    int _2661 = _2653 >> 2;
    int _2663 = _2635 >> 2;
    int _2665 = _2659 ? 0 : 1;
    int _2667 = _2661 << 4;
    int _2669 = _2667 + 512;
    int _2671 = _2663 << 4;
    int _2673 = _2671 + 368;
    int _2675 = ~_2665;
    int _2677 = _2675 + 1;
    int _2679 = _2677 + 1;
    int _2681 = _2679;
    if (_2651)
    {
        int _2683 = ~_2665;
        int _2685 = _2683 + 1;
        _2681 = _2685;
    }
    int _2687 = _2681;
    uint _2689 = uint(int(uint(_2673) >> uint(2)));
    uint _2691 = uint(int(uint(int(_2689)) >> uint(2)));
    int _2693 = int(_2689) & 3;
    float _2695 = (*spvDescriptorSet0.vp_c9)._m0[int(_2691)][_2693];
    int _2697 = int(_2689) + 1;
    uint _2699 = uint(int(uint(_2697) >> uint(2)));
    int _2701 = _2697 & 3;
    float _2703 = (*spvDescriptorSet0.vp_c9)._m0[int(_2699)][_2701];
    int _2705 = ~_2243;
    int _2707 = _2705 + _2649;
    int _2709 = _2707 + 1;
    int _2711 = int(_2197) + int(_2583);
    float _2713 = -_187;
    int _2715 = _2593 ? as_type<int>(_2713) : as_type<int>(_187);
    int _2717 = _1733 * _2709;
    int _2719 = _2717 + _2009;
    bool _2721 = !_2549;
    int _2723 = _2721 ? 0 : 1;
    uint _2725 = uint(int(uint(_2669) >> uint(2)));
    uint _2727 = uint(int(uint(int(_2725)) >> uint(2)));
    int _2729 = int(_2725) & 3;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[int(_2727)][_2729];
    int _2733 = int(_2725) + 1;
    uint _2735 = uint(int(uint(_2733) >> uint(2)));
    int _2737 = _2733 & 3;
    float _2739 = (*spvDescriptorSet0.vp_c9)._m0[int(_2735)][_2737];
    bool _2741 = _2547 != 3;
    int _2743 = _2599 & 3;
    bool _2745 = _2743 != 0;
    int _2747 = _2599 & 3;
    bool _2749 = _2747 != 0;
    int _2751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2753 = _2751 != 0;
    int _2755 = _2673 + 8;
    uint _2757 = uint(int(uint(_2755) >> uint(2)));
    uint _2759 = uint(int(uint(int(_2757)) >> uint(2)));
    int _2761 = int(_2757) & 3;
    float _2763 = (*spvDescriptorSet0.vp_c9)._m0[int(_2759)][_2761];
    int _2765 = int(_2757) + 1;
    uint _2767 = uint(int(uint(_2765) >> uint(2)));
    int _2769 = _2765 & 3;
    float _2771 = (*spvDescriptorSet0.vp_c9)._m0[int(_2767)][_2769];
    int _2773 = ~_1749;
    int _2775 = _2773 + 1;
    bool _2777 = !_2753;
    int _2779 = _2777 ? 0 : 1;
    bool _2781 = uint(_2747) > 1u;
    int _2783 = _2775 * _2711;
    int _2785 = _2783 + _2031;
    bool _2787 = !_1999;
    int _2789 = _2787 ? _2719 : (-1);
    int _2791 = _2669 + 8;
    uint _2793 = uint(int(uint(_2791) >> uint(2)));
    uint _2795 = uint(int(uint(int(_2793)) >> uint(2)));
    int _2797 = int(_2793) & 3;
    float _2799 = (*spvDescriptorSet0.vp_c9)._m0[int(_2795)][_2797];
    int _2801 = int(_2793) + 1;
    uint _2803 = uint(int(uint(_2801) >> uint(2)));
    int _2805 = _2801 & 3;
    float _2807 = (*spvDescriptorSet0.vp_c9)._m0[int(_2803)][_2805];
    int _2809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2811 = _2809 != 0;
    int _2813 = _2745 ? 0 : 1;
    bool _2815 = !_2811;
    int _2817 = _2815 ? 0 : 1;
    bool _2819 = uint(_2785) >= uint(_1749);
    bool _2821 = _2747 != 3;
    bool _2823 = !_2819;
    int _2825 = _2823 ? 0 : (-1);
    bool _2827 = !_2741;
    int _2829 = _2827 ? 0 : (-1);
    int _2831 = ~_2813;
    int _2833 = _2831 + 1;
    int _2835 = _2833 + 1;
    bool _2837 = !_2749;
    int _2839 = _2837 ? 0 : 1;
    bool _2841 = uint(_2747) >= 2u;
    bool _2843 = _2747 != 3;
    int _2845 = _2835;
    if (!_2781)
    {
        int _2847 = ~_2813;
        int _2849 = _2847 + 1;
        _2845 = _2849;
    }
    int _2851 = _2845;
    int _2853 = ~_2711;
    int _2855 = _2853 + _2825;
    int _2857 = _2855 + 1;
    int _2859 = _2841 ? 0 : 1;
    bool _2861 = !_2843;
    int _2863 = _2861 ? 0 : (-1);
    int _2865 = _1749 * _2857;
    int _2867 = _2865 + _2031;
    int _2869 = abs(_2851);
    int _2871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2873 = _2871 != 0;
    int _2875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2877 = _2875 != 0;
    int _2879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2881 = _2879 != 0;
    int _2883 = abs(_2619);
    bool _2885 = _259 > 0.5;
    int _2887 = ~_2859;
    int _2889 = _2887 + 1;
    int _2891 = _2889 + 1;
    int _2893 = _2891;
    if (_2821)
    {
        int _2895 = ~_2859;
        int _2897 = _2895 + 1;
        _2893 = _2897;
    }
    int _2899 = _2893;
    int _2901 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2903 = _2901 != 0;
    int _2905 = abs(_2723);
    int _2907 = ~_2869;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    int _2913 = ~_2883;
    int _2915 = _2913 + 1;
    int _2917 = _2915 + 1;
    int _2919 = abs(_2839);
    int _2921 = _2911 * as_type<int>(_2739);
    int _2923 = abs(_2899);
    int _2925 = _2917 * as_type<int>(_2703);
    int _2927 = ~_2905;
    int _2929 = _2927 + 1;
    int _2931 = _2929 + 1;
    int _2933 = ~_2919;
    int _2935 = _2933 + 1;
    int _2937 = _2935 + 1;
    int _2939 = abs(_2687);
    int _2941 = _2931 * as_type<int>(_2695);
    int _2943 = _2941 + _2925;
    int _2945 = ~_2939;
    int _2947 = _2945 + 1;
    int _2949 = _2947 + 1;
    float _2951 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2953 = int(_2951);
    int _2955 = ~_2923;
    int _2957 = _2955 + 1;
    int _2959 = _2957 + 1;
    int _2961 = _2937 * as_type<int>(_2731);
    int _2963 = _2961 + _2921;
    int _2965 = _2949 * as_type<int>(_2763);
    int _2967 = _2965 + _2943;
    int _2969 = _2959 * as_type<int>(_2799);
    int _2971 = _2969 + _2963;
    float _2973 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2975 = abs(_2829);
    float _2977 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2981 = ~_2975;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    float _2987 = _2973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2989 = _2977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2993 = _2979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2995 = _2985 * as_type<int>(_2771);
    int _2997 = _2995 + _2967;
    int _2999 = abs(_2953);
    float _3001 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3003 = int(_3001);
    int _3005 = abs(_2779);
    out.m_74.x = _2987;
    out.m_74.y = _2989;
    out.m_74.z = _2993;
    out.m_74.w = _2991;
    float _3007 = float(uint(_2953));
    int _3009 = abs(_2863);
    bool _3011 = !_2033;
    int _3013 = _3011 ? _2867 : (-1);
    float _3015 = 1.0 / _3007;
    int _3017 = ~_3009;
    int _3019 = _3017 + 1;
    int _3021 = _3019 + 1;
    float _3023 = -_183;
    int _3025 = _2885 ? as_type<int>(_3023) : as_type<int>(_183);
    bool _3027 = _261 > 0.5;
    int _3029 = _3021 * as_type<int>(_2807);
    int _3031 = _3029 + _2971;
    float _3033 = abs(_955);
    float _3035 = log2(_3033);
    int _3037 = abs(_2817);
    float _3039 = float(uint(_3003));
    int _3041 = ~_3005;
    int _3043 = _3041 + 1;
    int _3045 = _3043 + 1;
    bool _3047 = _263 > 0.5;
    float _3049 = 1.0 / _3039;
    int _3051 = _2997 * _3045;
    int _3053 = as_type<int>(_3015) + (-2);
    float _3055 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3057 = _2789 * _3005;
    int _3059 = _3057 + _3051;
    float _3061 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3063 = _3035 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3065 = -_1007;
    float _3067 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3061);
    float _3069 = float(uint(_3059));
    float _3071 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3073 = ~_3037;
    int _3075 = _3073 + 1;
    int _3077 = _3075 + 1;
    float _3079 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3081 = abs(_3003);
    float _3083 = as_type<float>(_3053) * _3069;
    float _3085 = float(uint(_2999));
    float _3087 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3089 = _3031 * _3077;
    float _3091 = float(uint(_3081));
    float _3093 = exp2(_3063);
    float _3095 = _3071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3097 = _3079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3099 = _3087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3101 = _3013 * _3037;
    int _3103 = _3101 + _3089;
    float _3105 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3107 = -_1007;
    float _3109 = fma(_3107, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3055);
    int _3111 = ~_2953;
    int _3113 = _3111 + 1;
    float _3115 = 1.0 / _3085;
    out.m_76.x = _3095;
    out.m_76.y = _3097;
    out.m_76.z = _3099;
    float _3117 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3119 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3121 = ~_3081;
    int _3123 = _3121 + 1;
    bool _3125 = !_2903;
    float _3127 = _3125 ? _183 : as_type<float>(_3025);
    float _3129 = trunc(_3083);
    float _3131 = precise::max(_3129, 0.0);
    uint _3133 = uint(_3131);
    bool _3135 = !_2873;
    float _3137 = _3135 ? _187 : as_type<float>(_2715);
    bool _3139 = _955 <= 8000.0;
    bool _3141 = isnan(_955);
    bool _3143 = _3139 || _3141;
    bool _3145 = isnan(8000.0);
    bool _3147 = _3143 || _3145;
    float _3149 = float(_3147);
    int _3151 = as_type<int>(_3049) + (-2);
    float _3153 = -_1007;
    float _3155 = fma(_3153, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3105);
    float _3157 = float(uint(_3103));
    float _3159 = 1.0 / _3091;
    float _3161 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3067);
    int _3163 = abs(_3059);
    float _3165 = as_type<float>(_3151) * _3157;
    int _3167 = as_type<int>(_3115) + (-2);
    float _3169 = fma(_3093, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3171 = precise::clamp(_3169, 0.0, 1.0);
    int _3173 = abs(_3103);
    int _3175 = _3113 * int(_3133);
    int _3177 = _3175 + _3059;
    float _3179 = float(uint(_3163));
    float _3181 = trunc(_3165);
    float _3183 = precise::max(_3181, 0.0);
    uint _3185 = uint(_3183);
    float _3187 = float(uint(_3173));
    float _3189 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3109);
    float _3191 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3155);
    float _3193 = as_type<float>(_3167) * _3179;
    float _3195 = float(uint(_3177));
    float _3197 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3117);
    int _3199 = as_type<int>(_3159) + (-2);
    float _3201 = trunc(_3193);
    float _3203 = precise::max(_3201, 0.0);
    uint _3205 = uint(_3203);
    int _3207 = ~_3003;
    int _3209 = _3207 + 1;
    float _3211 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3119);
    float _3213 = as_type<float>(_3199) * _3187;
    float _3215 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3217 = as_type<float>(_3053) * _3195;
    float _3219 = trunc(_3213);
    float _3221 = precise::max(_3219, 0.0);
    uint _3223 = uint(_3221);
    int _3225 = ~_2999;
    int _3227 = _3225 + 1;
    float _3229 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3215);
    float _3231 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3233 = _3209 * int(_3185);
    int _3235 = _3233 + _3103;
    float _3237 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3239 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3241 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3231);
    int _3243 = _3227 * int(_3205);
    int _3245 = _3243 + _3163;
    float _3247 = float(uint(_3235));
    float _3249 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3237);
    float _3251 = trunc(_3217);
    float _3253 = precise::max(_3251, 0.0);
    uint _3255 = uint(_3253);
    float _3257 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3239);
    float _3259 = float(uint(_3245));
    float _3261 = as_type<float>(_3151) * _3247;
    float _3263 = -_183;
    int _3265 = _3047 ? as_type<int>(_3263) : as_type<int>(_183);
    int _3267 = _3123 * int(_3223);
    int _3269 = _3267 + _3173;
    float _3271 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3211);
    float _3273 = as_type<float>(_3167) * _3259;
    float _3275 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3197);
    float _3277 = trunc(_3261);
    float _3279 = precise::max(_3277, 0.0);
    uint _3281 = uint(_3279);
    float _3283 = float(uint(_3269));
    float _3285 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3229);
    bool _3287 = !_2881;
    float _3289 = _3287 ? _183 : as_type<float>(_3265);
    float _3291 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3293 = -_187;
    int _3295 = _3027 ? as_type<int>(_3293) : as_type<int>(_187);
    float _3297 = as_type<float>(_3199) * _3283;
    float _3299 = trunc(_3273);
    float _3301 = precise::max(_3299, 0.0);
    uint _3303 = uint(_3301);
    bool _3305 = !_2877;
    float _3307 = _3305 ? _187 : as_type<float>(_3295);
    float _3309 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3249);
    int _3311 = ~_3003;
    int _3313 = _3311 + 1;
    float _3315 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3317 = _3291 * _3161;
    int _3319 = int(_3133) + int(_3255);
    float _3321 = fma(_3171, -2.0, 3.0);
    float _3323 = trunc(_3297);
    float _3325 = precise::max(_3323, 0.0);
    uint _3327 = uint(_3325);
    int _3329 = int(_3185) + int(_3281);
    float _3331 = _3171 * _3171;
    int _3333 = ~_2999;
    int _3335 = _3333 + 1;
    float _3337 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3241);
    float _3339 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3257);
    int _3341 = _3313 * _3329;
    int _3343 = _3341 + _3103;
    float _3345 = fma(_3315, _3271, _3317);
    out.m_78.x = _3271;
    out.m_78.y = _3275;
    out.m_78.z = _3285;
    int _3347 = ~_2953;
    int _3349 = _3347 + 1;
    float _3351 = _3331 * _3321;
    int _3353 = ~_3081;
    int _3355 = _3353 + 1;
    int _3357 = int(_3205) + int(_3303);
    int _3359 = _3349 * _3319;
    int _3361 = _3359 + _3059;
    bool _3363 = uint(_3343) >= uint(_3003);
    int _3365 = int(_3223) + int(_3327);
    bool _3367 = !_3363;
    int _3369 = _3367 ? 0 : (-1);
    bool _3371 = uint(_3361) >= uint(_2953);
    int _3373 = _3335 * _3357;
    int _3375 = _3373 + _3163;
    int _3377 = ~_3329;
    int _3379 = _3377 + _3369;
    int _3381 = _3379 + 1;
    int _3383 = _3355 * _3365;
    int _3385 = _3383 + _3173;
    int _3387 = _3059 ^ _2953;
    float _3389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3391 = uint(_3375) >= uint(_2999);
    int _3393 = _3003 * _3381;
    int _3395 = _3393 + _3103;
    bool _3397 = !_3371;
    int _3399 = _3397 ? 0 : (-1);
    bool _3401 = uint(_3385) >= uint(_3081);
    bool _3403 = !_3391;
    int _3405 = _3403 ? 0 : (-1);
    float _3407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3409 = uint(int(uint(_3387) >> uint(31)));
    int _3411 = ~_3319;
    int _3413 = _3411 + _3399;
    int _3415 = _3413 + 1;
    int _3417 = ~_3405;
    int _3419 = _3357 + _3417;
    int _3421 = _3419 + 1;
    int _3423 = ~int(_3409);
    int _3425 = _3423 + 1;
    int _3427 = _2953 * _3415;
    int _3429 = _3427 + _3059;
    int _3431 = _3103 ^ _3003;
    float _3433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3435 = _3421 ^ _3425;
    bool _3437 = _2953 == 0;
    bool _3439 = _3003 == 0;
    float _3441 = _3407 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3443 = _3003 == 0;
    int _3445 = ~_3425;
    int _3447 = _3445 + _3435;
    int _3449 = _3447 + 1;
    float _3451 = _3389 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3453 = !_3401;
    int _3455 = _3453 ? 0 : (-1);
    uint _3457 = uint(int(uint(_3431) >> uint(31)));
    float _3459 = fma(_3291, _3291, 1.0);
    bool _3461 = !_3437;
    int _3463 = _3461 ? _3429 : (-1);
    bool _3465 = _2953 == 0;
    int _3467 = ~_3455;
    int _3469 = _3365 + _3467;
    int _3471 = _3469 + 1;
    float _3473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3475 = ~int(_3457);
    int _3477 = _3475 + 1;
    bool _3479 = !_3439;
    int _3481 = _3479 ? _3395 : (-1);
    float _3483 = float(_3463);
    int _3485 = _3471 ^ _3477;
    float _3487 = rsqrt(_3459);
    float _3489 = float(_3481);
    float _3491 = fma(_3451, _3483, _657);
    float _3493 = _3127 + 0.5;
    int _3495 = ~_3477;
    int _3497 = _3495 + _3485;
    int _3499 = _3497 + 1;
    bool _3501 = !_3465;
    int _3503 = _3501 ? _3449 : (-1);
    float _3505 = fma(_3441, _3489, _823);
    float _3507 = fma(_3451, _3493, _3491);
    float _3509 = _3289 + 0.5;
    bool _3511 = !_3443;
    int _3513 = _3511 ? _3499 : (-1);
    float _3515 = _3433 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3517 = float(_3503);
    float _3519 = fma(_3441, _3509, _3505);
    float _3521 = float(_3513);
    float _3523 = _3473 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3525 = _3307 + (-0.5);
    float _3527 = -_685;
    float _3529 = fma(_3515, _3517, _3527);
    float _3531 = _3137 + (-0.5);
    float _3533 = -_825;
    float _3535 = fma(_3523, _3521, _3533);
    float _3537 = _3291 * _3487;
    float _3539 = -_3515;
    float _3541 = fma(_3539, _3525, _3529);
    float _3543 = -_2623;
    float _3545 = fma(_3289, _3543, _3519);
    float _3547 = -_3523;
    float _3549 = fma(_3547, _3531, _3535);
    float _3551 = -_3309;
    float _3553 = _3537 * _3551;
    float _3555 = fma(_3307, _2603, _3541);
    float _3557 = -_3351;
    float _3559 = _3557 + 1.0;
    float _3561 = -_3337;
    float _3563 = _3537 * _3561;
    float _3565 = fma(_3487, _3189, _3553);
    float _3567 = _3291 * _3189;
    float _3569 = fma(_3559, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3351);
    float _3571 = -_3339;
    float _3573 = _3537 * _3571;
    float _3575 = fma(_3487, _3161, _3563);
    float _3577 = fma(_3315, _3275, _3567);
    float _3579 = _3149 * _3569;
    float _3581 = fma(_3487, _3191, _3573);
    float _3583 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2627);
    float _3585 = _3579 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3587 = _3585;
    if (!_1592)
    {
        _1660 = 1.0;
    }
    float _3589 = _1660;
    float _3591 = fma(_3137, _2633, _3549);
    float _3593 = _3589;
    if (_1592)
    {
        bool _3595 = _1710 >= _1674;
        bool _3597 = isnan(_1710);
        bool _3599 = _3595 || _3597;
        bool _3601 = isnan(_1674);
        bool _3603 = _3599 || _3601;
        float _3605 = float(_3603);
        _3593 = _3605;
    }
    float _3607 = _3593;
    float _3609 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3611 = _2639 * _3585;
    float _3613 = precise::clamp(_3611, 0.0, 1.0);
    float _3615 = -_2645;
    float _3617 = fma(_3127, _3615, _3507);
    float _3619 = _3583 + _1616;
    float _3621 = _3291 * _3191;
    float _3623 = _3607 * _2323;
    float _3625 = _3609 * _1712;
    float _3627 = -_3613;
    float _3629 = fma(_3627, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3631 = _3619 * 0.5;
    float _3633 = fma(_3315, _3285, _3621);
    float _3635 = _1723 * _3625;
    float _3637 = -_3623;
    float _3639 = fma(_3637, _3629, 1.0);
    float _3641 = precise::clamp(_3639, 0.0, 1.0);
    float _3643 = _2571 * _3625;
    float _3645 = -_3609;
    float _3647 = _3645 + 1.0;
    out.m_80.z = _3631;
    out.m_80.w = _1616;
    float _3649 = _3337 + _3345;
    float _3651 = _3309 + _3577;
    float _3653 = _3339 + _3633;
    float _3655 = fma(_2567, _3635, _1717);
    float _3657 = fma(_2569, _3635, _1719);
    float _3659 = _1723 * _3647;
    float _3661 = fma(_1723, _3643, _1721);
    out.m_82.x = _3575;
    out.m_82.y = _3565;
    out.m_82.z = _3581;
    bool _3663 = _2347 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3665 = isnan(_2347);
    bool _3667 = _3663 || _3665;
    bool _3669 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3671 = _3667 || _3669;
    float _3673 = _3641 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_84.x = _3617;
    out.m_84.y = _3555;
    out.m_84.z = _3545;
    out.m_84.w = _3591;
    out.gl_Position.x = _1652;
    out.gl_Position.y = _1654;
    out.gl_Position.z = _3583;
    out.gl_Position.w = _1616;
    out.m_86.x = _3673;
    float _3675 = _3631;
    float _3677 = _3619;
    float _3679 = _3623;
    float _3681 = _3641;
    float _3683 = _3635;
    if (!_3671)
    {
        _3675 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3685 = _3675;
    out.m_88.x = _3655;
    out.m_88.y = _3657;
    out.m_88.z = _3661;
    out.m_88.w = _3659;
    float _3687 = _3685;
    float _3689 = _3685;
    if (!_3671)
    {
        _3677 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3691 = _3677;
    float _3693 = _3691;
    float _3695 = _3691;
    if (!_3671)
    {
        _3587 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3697 = _3587;
    out.m_90.x = _3649;
    out.m_90.y = _3651;
    out.m_90.z = _3653;
    float _3699 = _3697;
    float _3701 = _3697;
    if (!_3671)
    {
        _3679 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3703 = _3679;
    float _3705 = _3703;
    float _3707 = _3703;
    if (!_3671)
    {
        _3681 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3709 = _3681;
    float _3711 = _3709;
    float _3713 = _3709;
    if (!_3671)
    {
        _3683 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3715 = _3683;
    bool _3717 = !_3671;
    float _3719 = _3715;
    float _3721 = _3715;
    if (!_3717)
    {
        bool _3723 = _2347 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3725 = isnan(_2347);
        bool _3727 = _3723 || _3725;
        bool _3729 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3731 = _3727 || _3729;
        if (!_3731)
        {
            float _3733 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3735 = _2347 + _3733;
            float _3737 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3739 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3737;
            float _3741 = 1.0 / _3739;
            float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3749 = _3747 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3753 = _3751 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3757 = _3755 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3759 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3761 = _3759 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3763 = _3735 * _3741;
            float _3765 = precise::clamp(_3763, 0.0, 1.0);
            float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3771 = fma(_3765, _3745, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3773 = fma(_3765, _3769, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3775 = fma(_3765, _3749, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3777 = fma(_3765, _3753, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3779 = fma(_3765, _3757, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3781 = fma(_3765, _3761, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3695 = _3773;
            _3713 = _3779;
            _3689 = _3771;
            _3707 = _3777;
            _3701 = _3775;
            _3721 = _3781;
            _3783 = true;
        }
        else
        {
            bool _3785 = _2347 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3787 = isnan(_2347);
            bool _3789 = _3785 || _3787;
            bool _3791 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3793 = _3789 || _3791;
            if (!_3793)
            {
                _3687 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3795 = _3687;
            _3689 = _3795;
            if (!_3793)
            {
                _3693 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3797 = _3693;
            _3695 = _3797;
            if (!_3793)
            {
                _3699 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3799 = _3699;
            _3701 = _3799;
            if (!_3793)
            {
                _3705 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3801 = _3705;
            _3707 = _3801;
            if (!_3793)
            {
                _3711 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3803 = _3711;
            _3713 = _3803;
            if (!_3793)
            {
                _3719 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3805 = _3719;
            bool _3807 = !_3793;
            _3721 = _3805;
            if (!_3807)
            {
                bool _3809 = _2347 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3811 = isnan(_2347);
                bool _3813 = _3809 || _3811;
                bool _3815 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3817 = _3813 || _3815;
                if (!_3817)
                {
                    float _3819 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3821 = _2347 + _3819;
                    float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3825 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3823;
                    float _3827 = 1.0 / _3825;
                    float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3835 = _3833 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3837 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3841 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3849 = _3821 * _3827;
                    float _3851 = precise::clamp(_3849, 0.0, 1.0);
                    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3857 = fma(_3851, _3831, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3859 = fma(_3851, _3855, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3861 = fma(_3851, _3835, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3863 = fma(_3851, _3839, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3865 = fma(_3851, _3843, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3867 = fma(_3851, _3847, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3695 = _3859;
                    _3713 = _3865;
                    _3689 = _3857;
                    _3707 = _3863;
                    _3701 = _3861;
                    _3721 = _3867;
                    _3783 = true;
                }
                else
                {
                    _3695 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3713 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3689 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3707 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3701 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3721 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3783 = false;
    float _3869 = _3695;
    float _3871 = _3713;
    float _3873 = _3689;
    float _3875 = _3707;
    float _3877 = _3701;
    float _3879 = _3721;
    float _3881 = fma(_3651, -0.5, 0.5);
    float _3883 = precise::clamp(_3881, 0.0, 1.0);
    float _3885 = -_3869;
    float _3887 = _3885 + _3871;
    float _3889 = -_3873;
    float _3891 = _3889 + _3875;
    float _3893 = -_3877;
    float _3895 = _3893 + _3879;
    bool _3897 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3899 = fma(_3883, _3887, _3869);
    float _3901 = fma(_3883, _3891, _3873);
    float _3903 = fma(_3883, _3895, _3877);
    float _3905 = _3899 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _3907 = fma(_3901, 0.298911988735198974609375, _3905);
    float _3909 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3911 = fma(_3903, 0.114477999508380889892578125, _3907);
    out.m_59.x = _3909;
    float _3913 = -_3911;
    float _3915 = _3901 + _3913;
    float _3917 = -_3911;
    float _3919 = _3899 + _3917;
    float _3921 = -_3911;
    float _3923 = _3903 + _3921;
    float _3925 = fma(_3915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3911);
    float _3927 = fma(_3919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3911);
    float _3929 = fma(_3923, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3911);
    out.m_94.x = _3925;
    out.m_94.y = _3927;
    out.m_94.z = _3929;
    if (!_3897)
    {
        return out;
    }
    float _3931 = -_1504;
    float _3933 = _3931 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3935 = -_1506;
    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3939 = -_1508;
    float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3943 = _3933 * _3933;
    float _3945 = fma(_3937, _3937, _3943);
    float _3947 = fma(_3941, _3941, _3945);
    float _3949 = sqrt(_3947);
    float _3951 = rsqrt(_3947);
    float _3953 = -_3949;
    float _3955 = _3953 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3957 = _3955 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3959 = precise::clamp(_3957, 0.0, 1.0);
    float _3961 = _3937 * _3951;
    float _3963 = _3933 * _3951;
    float _3965 = abs(_3959);
    float _3967 = log2(_3965);
    float _3969 = _3941 * _3951;
    float _3971 = _3961 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3973 = _3651 * _3963;
    float _3975 = -_3963;
    float _3977 = -_3971;
    float _3979 = fma(_3975, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3977);
    float _3981 = fma(_3649, _3961, _3973);
    float _3983 = -_3969;
    float _3985 = fma(_3983, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3979);
    float _3987 = fma(_3653, _3969, _3981);
    float _3989 = precise::clamp(_3987, 0.0, 1.0);
    float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3993 = _3985 + _3991;
    float _3995 = _3967 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3997 = _3993 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3999 = precise::clamp(_3997, 0.0, 1.0);
    float _4001 = exp2(_3995);
    float _4003 = _4001 * _3999;
    float _4005 = _3989 * _4003;
    float _4007 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4009 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4011 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _4007;
    out.m_92.y = _4009;
    out.m_92.z = _4011;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3783 = false;
    bool _209 = false;
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
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4068 = as_type<float>(_129);
        out.gl_Position.z = _4068;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_61.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _123 = _151;
    }
    float _153 = _123;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_59.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4138 = as_type<float>(_167);
        out.gl_Position.z = _4138;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _173 = as_type<int>(_169) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_169) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _207;
    if (!_189)
    {
        float _191 = in.m_66.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_113);
        float _213 = 1.0 / _211;
        float _215 = _147 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = in.m_56.x;
    float _221 = in.m_56.y;
    float _223 = in.m_56.z;
    float _225 = _221 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _227 = _221 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _229 = fma(_219, (*spvDescriptorSet0.vp_c10)._m0[4].x, _225);
    float _231 = fma(_219, (*spvDescriptorSet0.vp_c10)._m0[6].x, _227);
    float _233 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[4].z, _229);
    float _235 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[6].z, _231);
    float _237 = _233 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _239 = _235 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _241 = fma(_237, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _243 = fma(_239, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _245 = floor(_241);
    float _247 = floor(_243);
    float _249 = -_245;
    float _251 = _241 + _249;
    float _253 = -_247;
    float _255 = _243 + _253;
    float2 _4287 = float2(_251, _255);
    float _257 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4287, float2(0.0), isnan(_4287)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4287, float2(0.0), isnan(_4287)), level(0.0)).x;
    float _259 = in.m_66.x;
    float _261 = in.m_66.y;
    float _263 = in.m_66.z;
    float _265 = in.m_66.w;
    float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _269 = log2(_267);
    float _271 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _291 = 1.0 / _275;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _295 = _293 != 0;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _299 = 1.0 / _283;
    float _301 = _259 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _303 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_217);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_289;
    float _317 = fma(_301, 2.0, _315);
    float _319 = _221 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = _217 + _321;
    float _325 = 1.0 / _279;
    float _327 = _259 * 2.0;
    float _329 = _323 * _291;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = _217 + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _337 = _217 + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _339;
    float _343 = 1.0 / _287;
    float _345 = _261 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _347 = _333 * _299;
    float _349 = _263 * 2.0;
    float _351 = _259 + _261;
    float _353 = fma(_345, -2.0, _297);
    float _355 = fma(_219, (*spvDescriptorSet0.vp_c10)._m0[5].x, _319);
    float _357 = floor(_327);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _361 = _217 + _359;
    float _363 = _261 * 2.0;
    float _365 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[5].z, _355);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _367;
    float _371 = _361 * _325;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _373;
    float _377 = floor(_349);
    float _379 = _337 * _343;
    float _381 = _263 + _259;
    float _383 = _351 + (-1.0);
    float _385 = _263 + _261;
    float _387 = fma(_369, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _389 = _381 + (-1.0);
    float _391 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _393 = _385 + (-1.0);
    bool _395 = _357 >= 0.0;
    bool _397 = isnan(_357);
    bool _399 = _395 || _397;
    bool _401 = isnan(0.0);
    bool _403 = _399 || _401;
    float _405 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _407 = as_type<int>(_389);
    if (_295)
    {
        _407 = 0;
    }
    int _409 = _407;
    float _411 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _413 = _409;
    if (!_295)
    {
        _413 = 1;
    }
    int _415 = _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _417;
    bool _421 = _357 > 0.0;
    float _423 = floor(_363);
    bool _425 = _377 > 0.0;
    float _427 = fma(_419, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _429 = _377 >= 0.0;
    bool _431 = isnan(_377);
    bool _433 = _429 || _431;
    bool _435 = isnan(0.0);
    bool _437 = _433 || _435;
    float _439 = fma(_341, _347, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _441 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _443 = isnan(_217);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = fma(_375, _347, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _455 = _403 ? 0 : 1;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _461 = _415 != 1;
    float _463 = -_451;
    float _465 = _463 + 1.0;
    bool _467 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _469 = isnan(_217);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _483 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _485 = isnan(_217);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = fma(_459, _371, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _497 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _499 = isnan(_217);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = fma(_481, _371, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _511 = _423 > 0.0;
    float _513 = _493 * _465;
    float _515 = -_493;
    float _517 = _515 + 1.0;
    float _519 = -_507;
    float _521 = _519 + 1.0;
    bool _523 = _423 >= 0.0;
    bool _525 = isnan(_423);
    bool _527 = _523 || _525;
    bool _529 = isnan(0.0);
    bool _531 = _527 || _529;
    float _533 = -_477;
    float _535 = _533 + 1.0;
    float _537 = _507 * _517;
    float _539 = _313 * _521;
    int _541 = ~_455;
    int _543 = _541 + 1;
    int _545 = _543 + 1;
    float _547 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _549 = int(_547);
    int _551 = _545;
    float _553 = _427;
    if (!_421)
    {
        int _555 = ~_455;
        int _557 = _555 + 1;
        _551 = _557;
    }
    int _559 = _551;
    float _561 = _387 * _539;
    int _563 = _437 ? 0 : 1;
    float _565 = _451 * _535;
    float _567 = _427 * _539;
    float _569 = _365 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _571 = ~_563;
    int _573 = _571 + 1;
    int _575 = _573 + 1;
    float _577 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _579 = int(_577);
    int _581 = _575;
    if (!_425)
    {
        int _583 = ~_563;
        int _585 = _583 + 1;
        _581 = _585;
    }
    int _587 = _581;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _593 = _591 != 0;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _597 = _595 != 0;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _601 = _599 != 0;
    float _603 = _569 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _605 = _531 ? 0 : 1;
    float _607 = _569 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (!_461)
    {
        _553 = _261;
    }
    float _609 = _553;
    float _611 = fma(_237, (*spvDescriptorSet0.vp_c8)._m0[11].x, _603);
    bool _613 = !_597;
    int _615 = _613 ? 0 : 1;
    float _617 = fma(_237, (*spvDescriptorSet0.vp_c8)._m0[10].x, _607);
    bool _619 = !_593;
    int _621 = _619 ? 0 : 1;
    float _623 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[11].z, _611);
    bool _625 = !_601;
    int _627 = _625 ? 0 : 1;
    float _629 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[10].z, _617);
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _633 = _631 != 0;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _637 = _635 != 0;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _641 = _639 != 0;
    float _643 = _623 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _645 = float(_113);
    float _647 = _629 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _649 = ~_605;
    int _651 = _649 + 1;
    int _653 = _651 + 1;
    float _655 = -_147;
    float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[76].x, _317);
    float _659 = _609;
    int _661 = _653;
    if (_461)
    {
        _659 = _259;
    }
    float _663 = _659;
    float _665 = _647 + _643;
    bool _667 = !_633;
    float _669 = _667 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _671 = 1.0 / _645;
    float _673 = _669;
    float _675 = _663;
    if (!_511)
    {
        int _677 = ~_605;
        int _679 = _677 + 1;
        _661 = _679;
    }
    int _681 = _661;
    float _683 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[83].z, _589);
    float _685 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _353);
    float _687 = float(_549);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _693 = abs(as_type<int>(_669));
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _697 = as_type<float>(_549);
    if (!_461)
    {
        _673 = _263;
    }
    float _699 = _673;
    float _701 = 1.0 / _687;
    float _703 = _699;
    if (!_461)
    {
        _675 = _263;
    }
    float _705 = _675;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _711 = _705;
    if (_461)
    {
        _703 = _261;
    }
    float _713 = _703;
    float _715 = fma(_691, _379, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _717 = _671 * _147;
    if (_461)
    {
        _711 = _261;
    }
    float _719 = _711;
    float _721 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[83].w, _695);
    float _723 = _269 * _147;
    if (!_461)
    {
        _697 = _261;
    }
    float _725 = _697;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _729 = _719 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _731 = _725;
    if (_461)
    {
        _731 = _259;
    }
    float _733 = _731;
    float _735 = exp2(_723);
    float _737 = float(_693);
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _741 = float(_587);
    float _743 = _733 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _745 = fma(_729, -2.0, _727);
    float _747 = float(_579);
    float _749 = _737 * _741;
    float _751 = -_739;
    float _753 = fma(_743, 2.0, _751);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _757 = 1.0 + _755;
    float _759 = in.m_68.x;
    float _761 = in.m_68.y;
    float _763 = in.m_68.z;
    float _765 = 1.0 / _747;
    float _767 = _701 * _147;
    bool _769 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _771 = isnan(1.0);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _777 = _773 || _775;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _781 = -_735;
    float _783 = _781 + 1.0;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _787 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _789 = isnan(0.0);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _795 = _791 || _793;
    float _797 = 1.0 / _757;
    float _799 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[78].z, _779);
    float _801 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[78].w, _785);
    bool _803 = !_637;
    int _805 = _803 ? 0 : 1;
    float _807 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _683);
    float _809 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _799);
    float _811 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _801);
    float _813 = _795 ? _783 : 0.0;
    float _815 = 1.0 / _643;
    float _817 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _721);
    float _819 = _765 * _147;
    float _821 = -_147;
    float _823 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[81].x, _753);
    float _825 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _745);
    float _827 = _749 * (-2.0);
    float _829 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _831 = fma(_709, _379, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    if (_777)
    {
        float _833 = _813 * _797;
        _149 = _833;
    }
    float _835 = _149;
    int _837 = abs(_805);
    float _839 = fma(_391, _827, _391);
    float _841 = fma(_827, _759, _759);
    float _843 = float(_559);
    float _845 = _259 + (-0.5);
    float _847 = float(_837);
    float _849 = _569 + _829;
    float _851 = _665 * _815;
    float _853 = _851 * 0.5;
    float _855 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[196].x, _841);
    bool _857 = !_641;
    int _859 = _857 ? 0 : 1;
    float _861 = _847 * _843;
    float _863 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _865 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[30].w, _863);
    float _867 = fma(_839, _835, _855);
    int _869 = abs(_859);
    float _871 = _861 * (-2.0);
    float _873 = float(_681);
    float _875 = _261 + (-0.5);
    float _877 = float(_869);
    float _879 = fma(_871, _761, _761);
    float _881 = -_313;
    float _883 = _881 + 1.0;
    float _885 = fma(_411, _871, _411);
    float _887 = 1.0 / _865;
    float _889 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[196].y, _879);
    float _891 = _877 * _873;
    float _893 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[143].x, _567);
    float _895 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[143].y, _561);
    float _897 = fma(_885, _835, _889);
    float _899 = _891 * (-2.0);
    float _901 = in.m_70.x;
    float _903 = in.m_70.y;
    float _905 = fma(_495, _537, _893);
    float _907 = fma(_509, _537, _895);
    float _909 = _897 * 0.15915493667125701904296875;
    float _911 = fma(_899, _763, _763);
    float _913 = _263 + (-0.5);
    float _915 = fma(_405, _899, _405);
    float _917 = _849 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _919 = fma(_439, _513, _905);
    float _921 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[196].z, _911);
    float _923 = fma(_453, _513, _907);
    float _925 = _849 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _927 = fma(_237, (*spvDescriptorSet0.vp_c15)._m0[126].x, _917);
    float _929 = fma(_915, _835, _921);
    float _931 = _867 * 0.15915493667125701904296875;
    float _933 = fma(_715, _565, _919);
    float _935 = fma(_831, _565, _923);
    float _937 = _929 * 0.15915493667125701904296875;
    float _939 = fma(_237, (*spvDescriptorSet0.vp_c15)._m0[127].x, _925);
    float _941 = fma(_239, (*spvDescriptorSet0.vp_c15)._m0[126].z, _927);
    float _943 = _931 * 6.283185482025146484375;
    float _945 = sin(_943);
    float _947 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[147].x, _933);
    float _949 = fma(_239, (*spvDescriptorSet0.vp_c15)._m0[127].z, _939);
    float _951 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[147].y, _935);
    float _953 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _955 = _887 * _953;
    float _957 = _941 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _959 = _947 * _901;
    float _961 = _951 * _903;
    float _963 = _931 * 6.283185482025146484375;
    float _965 = cos(_963);
    bool _967 = _955 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _969 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    bool _971 = _955 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _973 = _959 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _975 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _977 = _961 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _979 = _909 * 6.283185482025146484375;
    float _981 = sin(_979);
    float _983 = _973 * _969;
    float _985 = _977 * _975;
    float _987 = _949 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _989 = 2;
    if (!_967)
    {
        _989 = 1;
    }
    int _991 = _989;
    float _993 = _909 * 6.283185482025146484375;
    float _995 = cos(_993);
    float _997 = _937 * 6.283185482025146484375;
    float _999 = cos(_997);
    float _1001 = _945 * _981;
    float _1003 = _965 * _981;
    float _1005 = _937 * 6.283185482025146484375;
    float _1007 = sin(_1005);
    float _1009 = _945 * _995;
    float _1011 = _965 * _995;
    float _1013 = _945 * _999;
    float _1015 = _995 * _999;
    float _1017 = _965 * _999;
    float _1019 = _981 * _999;
    bool _1021 = !_967;
    int _1023 = _1021 ? 0 : 1;
    float _1025 = trunc(_957);
    int _1027 = int(_1025);
    float _1029 = _1017 * _985;
    float _1031 = fma(_1007, _1011, _1001);
    int _1033 = _991;
    if (!_971)
    {
        _1033 = _1023;
    }
    int _1035 = _1033;
    float _1037 = fma(_1007, _1001, _1011);
    float _1039 = -_985;
    float _1041 = _1007 * _1039;
    float _1043 = -_1003;
    float _1045 = fma(_1007, _1009, _1043);
    float _1047 = trunc(_987);
    int _1049 = int(_1047);
    int _1051 = _1035 << 6;
    float _1053 = -_1009;
    float _1055 = fma(_1007, _1003, _1053);
    float _1057 = fma(_1015, _983, _1041);
    float _1059 = _1013 * _985;
    int _1061 = _1051 + 96;
    uint _1064 = uint(int(uint(_1061) >> uint(2)));
    uint _1066 = uint(int(uint(int(_1064)) >> uint(2)));
    int _1068 = int(_1064) & 3;
    float _1070 = (*spvDescriptorSet0.vp_c15)._m0[int(_1066)][_1068];
    int _1072 = int(_1064) + 1;
    uint _1074 = uint(int(uint(_1072) >> uint(2)));
    int _1076 = _1072 & 3;
    float _1078 = (*spvDescriptorSet0.vp_c15)._m0[int(_1074)][_1076];
    float _1080 = fma(_1031, _983, _1029);
    float _1082 = fma(_1019, _271, _1057);
    float _1084 = fma(_1045, _983, _1059);
    int _1086 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1088 = _1027 + _1086;
    int _1090 = _1088 + 1;
    float _1092 = fma(_1055, _271, _1080);
    float _1094 = fma(_1037, _271, _1084);
    int _1096 = _1051 + 104;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    uint _1100 = uint(int(uint(int(_1098)) >> uint(2)));
    int _1102 = int(_1098) & 3;
    float _1104 = (*spvDescriptorSet0.vp_c15)._m0[int(_1100)][_1102];
    int _1106 = int(_1098) + 1;
    uint _1108 = uint(int(uint(_1106) >> uint(2)));
    int _1110 = _1106 & 3;
    float _1112 = (*spvDescriptorSet0.vp_c15)._m0[int(_1108)][_1110];
    bool _1114 = _1090 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1116 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1118 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1120 = _1049 + _1118;
    int _1122 = _1120 + 1;
    float _1124 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1116);
    int _1126 = _1090 | _1122;
    int _1128 = _1051 + 48;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
    int _1134 = int(_1130) & 3;
    float _1136 = (*spvDescriptorSet0.vp_c15)._m0[int(_1132)][_1134];
    int _1138 = int(_1130) + 1;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    int _1142 = _1138 & 3;
    float _1144 = (*spvDescriptorSet0.vp_c15)._m0[int(_1140)][_1142];
    float _1146 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1124);
    bool _1148 = _1126 < 0;
    bool _1150 = _1148 || _1114;
    float _1152 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1154 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1156 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1158 = _1122 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1160 = _1158 || _1150;
    int _1162 = _1051 + 64;
    uint _1164 = uint(int(uint(_1162) >> uint(2)));
    uint _1166 = uint(int(uint(int(_1164)) >> uint(2)));
    int _1168 = int(_1164) & 3;
    float _1170 = (*spvDescriptorSet0.vp_c15)._m0[int(_1166)][_1168];
    int _1172 = int(_1164) + 1;
    uint _1174 = uint(int(uint(_1172) >> uint(2)));
    int _1176 = _1172 & 3;
    float _1178 = (*spvDescriptorSet0.vp_c15)._m0[int(_1174)][_1176];
    float _1180 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1152);
    float _1182 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1154);
    float _1184 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1180);
    float _1186 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1182);
    int _1188 = _1051 + 56;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    uint _1192 = uint(int(uint(int(_1190)) >> uint(2)));
    int _1194 = int(_1190) & 3;
    float _1196 = (*spvDescriptorSet0.vp_c15)._m0[int(_1192)][_1194];
    int _1198 = int(_1190) + 1;
    uint _1200 = uint(int(uint(_1198) >> uint(2)));
    int _1202 = _1198 & 3;
    float _1204 = (*spvDescriptorSet0.vp_c15)._m0[int(_1200)][_1202];
    float _1206 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1208 = _239 + _1156;
    float _1210 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1212 = _1090;
    float _1214 = _1208;
    if (!_1160)
    {
        int _1216 = _1122 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1218 = _1216 + _1090;
        _1212 = _1218;
    }
    int _1220 = _1212;
    float _1222 = _237 + _1206;
    float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1226 = _1208 + _1224;
    int _1228 = _1051 + 72;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    float _1246 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1248 = _1222 + _1246;
    float _1250 = _1226 * _1226;
    int _1252 = 0;
    int _1254 = as_type<int>(_1250);
    float _1256 = _1222;
    float _1258 = as_type<float>(_1220);
    if (!_1160)
    {
        int _1260 = _1220 << 2;
        _1252 = _1260;
    }
    int _1262 = _1252;
    float _1264 = fma(_1248, _1248, _1250);
    int _1266 = _1262;
    if (!_1160)
    {
        uint _1268 = uint(int(uint(_1220) >> uint(2)));
        _1254 = int(_1268);
    }
    int _1270 = _1254;
    int _1272 = _1051 + 80;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    uint _1276 = uint(int(uint(int(_1274)) >> uint(2)));
    int _1278 = int(_1274) & 3;
    float _1280 = (*spvDescriptorSet0.vp_c15)._m0[int(_1276)][_1278];
    int _1282 = int(_1274) + 1;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    int _1286 = _1282 & 3;
    float _1288 = (*spvDescriptorSet0.vp_c15)._m0[int(_1284)][_1286];
    int _1290 = _1270;
    if (!_1160)
    {
        int _1292 = 12 & _1262;
        _1266 = _1292;
    }
    int _1294 = _1266;
    float _1296 = sqrt(_1264);
    if (!_1160)
    {
        int _1298 = _1270 << 4;
        int _1300 = _1298 + _1294;
        _1290 = _1300;
    }
    int _1302 = _1290;
    float _1304 = _849 * _1078;
    float _1306 = fma(_237, _1070, _1304);
    float _1308 = fma(_239, _1104, _1306);
    float _1310 = _849 * _1144;
    float _1312 = _1308 + _1112;
    bool _1314 = _1296 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1316 = fma(_237, _1136, _1310);
    float _1318 = _569 + _1210;
    float _1320 = _1136;
    float _1322 = _1296;
    if (!_1160)
    {
        float _1324 = floor(_957);
        _1320 = _1324;
    }
    float _1326 = _1320;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1330 = _1328 != 0;
    int _1332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1334 = _1332 != 0;
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1338 = _1336 != 0;
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1342 = _1340 != 0;
    float _1344 = _849 * _1178;
    float _1346 = fma(_237, _1170, _1344);
    bool _1348 = !_1334;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = 1.0 / _1312;
    bool _1354 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1356 = isnan(0.5);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1362 = _1358 || _1360;
    float _1364 = fma(_239, _1196, _1316);
    bool _1366 = !_1330;
    int _1368 = _1366 ? 0 : 1;
    bool _1370 = !_1338;
    int _1372 = _1370 ? 0 : 1;
    float _1374 = _1364 + _1204;
    bool _1376 = !_1342;
    int _1378 = _1376 ? 0 : 1;
    float _1380 = fma(_239, _1236, _1346);
    float _1382 = _1346;
    float _1384 = _1170;
    if (!_1314)
    {
        _1382 = _1318;
    }
    float _1386 = _1382;
    float _1388 = _1380 + _1244;
    bool _1390 = !_1314;
    float _1392 = _1386;
    if (!_1390)
    {
        float _1394 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1398 = _1296 + _1396;
        float _1400 = _1318 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = rsqrt(_1264);
        float _1404 = _1398 * _1394;
        float _1406 = _1404 * 0.15915493667125701904296875;
        float _1408 = _1406 * 6.283185482025146484375;
        float _1410 = cos(_1408);
        float _1412 = _1406 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        float _1416 = _1410 + (-1.0);
        float _1418 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1420 = fma(_1414, _1400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1422 = fma(_1318, _1410, _1418);
        float _1424 = _1402 * _1420;
        float _1426 = fma(_1248, _1424, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1428 = fma(_1226, _1424, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1256 = _1426;
        _1214 = _1428;
        _1392 = _1422;
        _1384 = _1418;
        _1322 = _1406;
    }
    float _1430 = _1256;
    float _1432 = _1214;
    float _1434 = _1392;
    float _1436 = _1384;
    float _1438 = _1322;
    float _1440 = _1436;
    float _1442 = _1438;
    float _1444 = _1434;
    if (_1362)
    {
        _1440 = _1430;
    }
    float _1446 = _1440;
    float _1448 = _1446;
    if (_1362)
    {
        _1442 = _1432;
    }
    float _1450 = _1442;
    float _1452 = _1450;
    if (!_1362)
    {
        float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1456 = _569 + _1454;
        float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1460 = _237 + _1458;
        float _1462 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1464 = -_239;
        float _1466 = _1464 + _1432;
        float _1468 = _1456 * _1456;
        float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1472 = _239 + _1470;
        float _1474 = fma(_1460, _1460, _1468);
        float _1476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1478 = fma(_1472, _1472, _1474);
        float _1480 = sqrt(_1478);
        float _1482 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1484 = precise::min(_1480, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1486 = _1484 * _1476;
        float _1488 = -_569;
        float _1490 = _1488 + _1434;
        float _1492 = _1482 * _1486;
        float _1494 = -_237;
        float _1496 = _1494 + _1430;
        float _1498 = fma(_1490, _1492, _569);
        float _1500 = fma(_1496, _1492, _237);
        float _1502 = fma(_1466, _1492, _239);
        _1444 = _1498;
        _1448 = _1500;
        _1452 = _1502;
    }
    float _1504 = _1444;
    float _1506 = _1448;
    float _1508 = _1452;
    int _1510 = _1051 + 88;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    uint _1514 = uint(int(uint(int(_1512)) >> uint(2)));
    int _1516 = int(_1512) & 3;
    float _1518 = (*spvDescriptorSet0.vp_c15)._m0[int(_1514)][_1516];
    int _1520 = int(_1512) + 1;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    int _1524 = _1520 & 3;
    float _1526 = (*spvDescriptorSet0.vp_c15)._m0[int(_1522)][_1524];
    float _1528 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1530 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1532 = _1374 * _1352;
    float _1534 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1536 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1528);
    float _1538 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1530);
    float _1540 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1542 = _1430;
    if (!_1160)
    {
        int _1544 = _1302 + 400;
        uint _1546 = uint(int(uint(_1544) >> uint(2)));
        uint _1548 = uint(int(uint(int(_1546)) >> uint(2)));
        int _1550 = int(_1546) & 3;
        float _1552 = (*spvDescriptorSet0.vp_c15)._m0[int(_1548)][_1550];
        _1542 = _1552;
    }
    float _1554 = _1542;
    float _1556 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1536);
    bool _1558 = _1532 >= 0.0;
    float _1560 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1534);
    float _1562 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1538);
    float _1564 = _1556 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1566 = _1388 * _1352;
    bool _1568 = _1532 <= 1.0;
    bool _1570 = _1568 && _1558;
    float _1572 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1560);
    float _1574 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1540);
    float _1576 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1578 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1580 = _1566 >= 0.0;
    bool _1582 = _1580 && _1570;
    float _1584 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1586 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1574);
    float _1588 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1578);
    bool _1590 = _1566 <= 1.0;
    bool _1592 = _1590 && _1582;
    float _1594 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1596 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1598 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1600 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1588);
    float _1602 = _849 * _1288;
    float _1604 = _1236;
    float _1606 = _1594;
    if (!_1160)
    {
        float _1608 = floor(_987);
        _1604 = _1608;
    }
    float _1610 = _1604;
    float _1612 = -_1596;
    float _1614 = fma(_1612, _1594, 1.0);
    float _1616 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1600);
    float _1618 = fma(_237, _1280, _1602);
    float _1620 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1622 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (_1592)
    {
        float _1624 = float(_1035);
        _1606 = _1624;
    }
    float _1626 = _1606;
    float _1628 = log2(_1614);
    float _1630 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1620);
    float _1632 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1622);
    float _1634 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1630);
    float _1636 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1632);
    float _1638 = 1.0 / _1616;
    float _1640 = 0.0;
    float _1642 = _1630;
    if (!_1160)
    {
        float _1644 = -_1610;
        float _1646 = _987 + _1644;
        _1640 = _1646;
    }
    float _1648 = _1640;
    float _1650 = fma(_239, _1518, _1618);
    float _1652 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1634);
    float _1654 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1636);
    float _1656 = _1650 + _1526;
    float _1658 = _1620;
    float _1660 = _1652;
    if (_1592)
    {
        float _1662 = rint(_1626);
        float _1664 = precise::max(_1662, 0.0);
        uint _1666 = uint(_1664);
        uint _1668 = clamp(_1666, 0u, 65535u);
        _1658 = as_type<float>(_1668);
    }
    float _1670 = _1658;
    float _1672 = _1628 * 0.693147182464599609375;
    float _1674 = _1656 * _1352;
    float _1676 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1678 = _1656;
    if (!_1160)
    {
        float _1680 = rint(_1554);
        float _1682 = precise::max(_1680, 0.0);
        uint _1684 = uint(_1682);
        uint _1686 = clamp(_1684, 0u, 65535u);
        _1678 = as_type<float>(_1686);
    }
    float _1688 = _1678;
    float _1690 = _1652 * _1638;
    float _1692 = _1654 * _1638;
    float _1694 = fma(_1690, 0.5, 0.5);
    float _1696 = fma(_1692, -0.5, 0.5);
    float _1698 = _1690;
    if (!_1160)
    {
        float _1700 = -_1326;
        float _1702 = _957 + _1700;
        _1698 = _1702;
    }
    float _1704 = _1698;
    float _1706 = _1326;
    if (_1592)
    {
        float3 _6618 = float3(_1532, _1566, float(as_type<int>(_1670)));
        float3 _6622 = select(_6618, float3(0.0), isnan(_6618));
        float _1708 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6622.xy, uint(rint(_6622.z)), _1674, level(0.0));
        _1706 = _1708;
    }
    float _1710 = _1706;
    float3 _6632 = float3(_1694, _1696, _1676);
    float _1712 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6632, float3(0.0), isnan(_6632)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6632, float3(0.0), isnan(_6632)), level(0.0)).x;
    float3 _6641 = float3(_1694, _1696, _1676);
    float4 _1715 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6641, float3(0.0), isnan(_6641)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6641, float3(0.0), isnan(_6641)), level(0.0)).xyzw;
    float _1717 = _1715.x;
    float _1719 = _1715.y;
    float _1721 = _1715.z;
    float _1723 = _1715.w;
    float _1725 = _1648;
    if (!_1160)
    {
        float3 _6664 = float3(_1704, _1648, float(as_type<int>(_1688)));
        float3 _6666 = select(_6664, float3(0.0), isnan(_6664));
        float _1727 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6666.xy, uint(rint(_6666.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6666.xy, uint(rint(_6666.z)), level(0.0)).x;
        _1725 = _1727;
    }
    float _1729 = _1725;
    float _1731 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1733 = int(_1731);
    int _1735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1737 = _1735 != 0;
    int _1739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1741 = _1739 != 0;
    int _1743 = abs(_615);
    int _1745 = abs(_1350);
    float _1747 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1749 = int(_1747);
    int _1751 = abs(_1368);
    int _1753 = abs(_1372);
    int _1755 = abs(_1378);
    float _1757 = as_type<float>(_1755);
    if (_1737)
    {
        float _1759 = in.m_66.x;
        _1642 = _1759;
    }
    float _1761 = _1642;
    float _1763 = float(uint(_1733));
    float _1765 = trunc(_767);
    int _1767 = int(_1765);
    float _1769 = _1761;
    if (!_1737)
    {
        float _1771 = in.m_66.y;
        _1769 = _1771;
    }
    float _1773 = _1769;
    int _1775 = ~_1733;
    int _1777 = _1775 + 1;
    float _1779 = float(uint(_1749));
    float _1781 = 1.0 / _1763;
    int _1783 = ~_1749;
    int _1785 = _1783 + 1;
    float _1787 = 1.0 / _1779;
    float _1789 = trunc(_819);
    int _1791 = int(_1789);
    int _1793 = as_type<int>(_1781) + (-2);
    float _1795 = float(uint(_1767));
    float _1797 = float(_1767);
    int _1799 = as_type<int>(_1787) + (-2);
    float _1801 = as_type<float>(_1793) * _1795;
    float _1803 = _1795;
    if (_1737)
    {
        _1803 = 1.0;
    }
    float _1805 = _1803;
    float _1807 = _1805;
    if (!_1737)
    {
        _1807 = 7.345489978790283203125;
    }
    float _1809 = _1807;
    float _1811 = trunc(_1801);
    float _1813 = precise::max(_1811, 0.0);
    uint _1815 = uint(_1813);
    float _1817 = float(uint(_1791));
    float _1819 = _1809 * _259;
    float _1821 = as_type<float>(_1799) * _1817;
    float _1823 = _1817;
    if (_1737)
    {
        _1823 = 1.0;
    }
    float _1825 = _1823;
    float _1827 = floor(_1819);
    float _1829 = _1825;
    if (!_1737)
    {
        _1829 = 1.2345600128173828125;
    }
    float _1831 = _1829;
    float _1833 = _1773 * _1831;
    float _1835 = trunc(_1821);
    float _1837 = precise::max(_1835, 0.0);
    uint _1839 = uint(_1837);
    int _1841 = _1777 * int(_1815);
    int _1843 = _1841 + _1767;
    float _1845 = float(uint(_1843));
    float _1847 = floor(_1833);
    float _1849 = float(_1733);
    float _1851 = as_type<float>(_1793) * _1845;
    int _1853 = _1785 * int(_1839);
    int _1855 = _1853 + _1791;
    float _1857 = trunc(_1851);
    float _1859 = precise::max(_1857, 0.0);
    uint _1861 = uint(_1859);
    float _1863 = float(uint(_1855));
    float _1865 = -_1847;
    float _1867 = _1833 + _1865;
    float _1869 = float(_1749);
    float _1871 = as_type<float>(_1799) * _1863;
    float _1873 = -_1827;
    float _1875 = _1819 + _1873;
    int _1877 = ~_1733;
    int _1879 = _1877 + 1;
    bool _1881 = _1797 >= _1849;
    bool _1883 = isnan(_1797);
    bool _1885 = _1881 || _1883;
    bool _1887 = isnan(_1849);
    bool _1889 = _1885 || _1887;
    float _1891 = float(_1889);
    float _1893 = _1867 * _1869;
    float _1895 = trunc(_1871);
    float _1897 = precise::max(_1895, 0.0);
    uint _1899 = uint(_1897);
    int _1901 = int(_1815) + int(_1861);
    float _1903 = _1875 * _1849;
    float _1905 = _1849 * _717;
    float _1907 = _1869 * _717;
    int _1909 = _1879 * _1901;
    int _1911 = _1909 + _1767;
    float _1913 = trunc(_1891);
    int _1915 = int(_1913);
    bool _1917 = uint(_1911) >= uint(_1733);
    bool _1919 = !_1917;
    int _1921 = _1919 ? 0 : (-1);
    float _1923 = trunc(_1903);
    int _1925 = int(_1923);
    int _1927 = int(_1839) + int(_1899);
    float _1929 = float(_1791);
    int _1931 = ~_1749;
    int _1933 = _1931 + 1;
    bool _1935 = _1929 >= _1869;
    bool _1937 = isnan(_1929);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan(_1869);
    bool _1943 = _1939 || _1941;
    float _1945 = float(_1943);
    float _1947 = trunc(_1893);
    int _1949 = int(_1947);
    int _1951 = _1933 * _1927;
    int _1953 = _1951 + _1791;
    int _1955 = ~_1901;
    int _1957 = _1955 + _1921;
    int _1959 = _1957 + 1;
    int _1961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1963 = _1961 != 0;
    int _1965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1967 = _1965 != 0;
    float _1969 = trunc(_1945);
    int _1971 = int(_1969);
    bool _1973 = uint(_1953) >= uint(_1749);
    bool _1975 = !_1963;
    int _1977 = _1975 ? 0 : 1;
    bool _1979 = !_1967;
    int _1981 = _1979 ? 0 : 1;
    int _1983 = abs(_1977);
    int _1985 = _1733 * _1959;
    int _1987 = _1985 + _1767;
    bool _1989 = !_1973;
    int _1991 = _1989 ? 0 : (-1);
    float _1993 = trunc(_1905);
    int _1995 = int(_1993);
    int _1997 = abs(_1981);
    bool _1999 = _1733 == 0;
    int _2001 = ~_1927;
    int _2003 = _2001 + _1991;
    int _2005 = _2003 + 1;
    int _2007 = _1925 * _1983;
    int _2009 = _2007 + _1767;
    float _2011 = trunc(_1907);
    int _2013 = int(_2011);
    int _2015 = ~_1915;
    int _2017 = _2015 + 1;
    int _2019 = _2017 + 1;
    int _2021 = _1749 * _2005;
    int _2023 = _2021 + _1791;
    bool _2025 = !_1999;
    int _2027 = _2025 ? _1987 : (-1);
    int _2029 = _1949 * _1997;
    int _2031 = _2029 + _1791;
    bool _2033 = _1749 == 0;
    int _2035 = ~_1971;
    int _2037 = _2035 + 1;
    int _2039 = _2037 + 1;
    int _2041 = _2027 * _2019;
    bool _2043 = !_2033;
    int _2045 = _2043 ? _2023 : (-1);
    int _2047 = _1733 + (-1);
    int _2049 = _1749 + (-1);
    int _2051 = _2045 * _2039;
    int _2053 = _1915 * _2047;
    int _2055 = _2053 + _2041;
    int _2057 = _1971 * _2049;
    int _2059 = _2057 + _2051;
    int _2061 = abs(_621);
    int _2063 = _2055 * _1743;
    bool _2065 = !_1741;
    int _2067 = _2065 ? 0 : 1;
    int _2069 = abs(_627);
    int _2071 = _1995 * _2061;
    int _2073 = _2071 + _2063;
    int _2075 = abs(_2067);
    int _2077 = _2059 * _1745;
    int _2079 = _2009 * _2069;
    int _2081 = _2079 + _2073;
    int _2083 = _2013 * _1751;
    int _2085 = _2083 + _2077;
    int _2087 = ~_1749;
    int _2089 = _2087 + 1;
    int _2091 = _1925 * _2075;
    int _2093 = _2091 + _2081;
    int _2095 = _2031 * _1753;
    int _2097 = _2095 + _2085;
    int _2099 = ~_1733;
    int _2101 = _2099 + 1;
    float _2103 = float(uint(_2093));
    int _2105 = _1949 * _1755;
    int _2107 = _2105 + _2097;
    int _2109 = ~_1733;
    int _2111 = _2109 + 1;
    int _2113 = ~_1749;
    int _2115 = _2113 + 1;
    float _2117 = as_type<float>(_1793) * _2103;
    float _2119 = float(uint(_2107));
    float _2121 = float(uint(_2009));
    float _2123 = trunc(_2117);
    float _2125 = precise::max(_2123, 0.0);
    uint _2127 = uint(_2125);
    float _2129 = as_type<float>(_1799) * _2119;
    float _2131 = as_type<float>(_1793) * _2121;
    float _2133 = trunc(_2129);
    float _2135 = precise::max(_2133, 0.0);
    uint _2137 = uint(_2135);
    int _2139 = _2101 * int(_2127);
    int _2141 = _2139 + _2093;
    float _2143 = trunc(_2131);
    float _2145 = precise::max(_2143, 0.0);
    uint _2147 = uint(_2145);
    float _2149 = float(uint(_2141));
    int _2151 = _2089 * int(_2137);
    int _2153 = _2151 + _2107;
    float _2155 = as_type<float>(_1793) * _2149;
    float _2157 = float(uint(_2153));
    int _2159 = ~_1733;
    int _2161 = _2159 + 1;
    float _2163 = trunc(_2155);
    float _2165 = precise::max(_2163, 0.0);
    uint _2167 = uint(_2165);
    float _2169 = as_type<float>(_1799) * _2157;
    float _2171 = float(uint(_2031));
    int _2173 = _2161 * int(_2147);
    int _2175 = _2173 + _2009;
    float _2177 = trunc(_2169);
    float _2179 = precise::max(_2177, 0.0);
    uint _2181 = uint(_2179);
    float _2183 = as_type<float>(_1799) * _2171;
    float _2185 = float(uint(_2175));
    int _2187 = ~_1749;
    int _2189 = _2187 + 1;
    float _2191 = as_type<float>(_1793) * _2185;
    float _2193 = trunc(_2183);
    float _2195 = precise::max(_2193, 0.0);
    uint _2197 = uint(_2195);
    int _2199 = int(_2127) + int(_2167);
    int _2201 = int(_2137) + int(_2181);
    int _2203 = _2111 * _2199;
    int _2205 = _2203 + _2093;
    float _2207 = trunc(_2191);
    float _2209 = precise::max(_2207, 0.0);
    uint _2211 = uint(_2209);
    int _2213 = _2115 * _2201;
    int _2215 = _2213 + _2107;
    bool _2217 = uint(_2205) >= uint(_1733);
    int _2219 = _2189 * int(_2197);
    int _2221 = _2219 + _2031;
    bool _2223 = !_2217;
    int _2225 = _2223 ? 0 : (-1);
    bool _2227 = uint(_2215) >= uint(_1749);
    float _2229 = float(uint(_2221));
    int _2231 = ~_2199;
    int _2233 = _2231 + _2225;
    int _2235 = _2233 + 1;
    bool _2237 = !_2227;
    int _2239 = _2237 ? 0 : (-1);
    float _2241 = as_type<float>(_1799) * _2229;
    int _2243 = int(_2147) + int(_2211);
    int _2245 = _1733 * _2235;
    int _2247 = _2245 + _2093;
    int _2249 = ~_2201;
    int _2251 = _2249 + _2239;
    int _2253 = _2251 + 1;
    float _2255 = as_type<float>(_2199);
    if (_1160)
    {
        _2255 = 1.0;
    }
    float _2257 = _2255;
    float _2259 = _2257;
    if (!_1160)
    {
        int _2261 = _1220 << 4;
        int _2263 = _2261 + 2048;
        uint _2265 = uint(int(uint(_2263) >> uint(2)));
        uint _2267 = uint(int(uint(int(_2265)) >> uint(2)));
        int _2269 = int(_2265) & 3;
        float _2271 = (*spvDescriptorSet0.vp_c15)._m0[int(_2267)][_2269];
        int _2273 = int(_2265) + 1;
        uint _2275 = uint(int(uint(_2273) >> uint(2)));
        int _2277 = _2273 & 3;
        float _2279 = (*spvDescriptorSet0.vp_c15)._m0[int(_2275)][_2277];
        int _2281 = _2263 + 8;
        uint _2283 = uint(int(uint(_2281) >> uint(2)));
        uint _2285 = uint(int(uint(int(_2283)) >> uint(2)));
        int _2287 = int(_2283) & 3;
        float _2289 = (*spvDescriptorSet0.vp_c15)._m0[int(_2285)][_2287];
        int _2291 = int(_2283) + 1;
        uint _2293 = uint(int(uint(_2291) >> uint(2)));
        int _2295 = _2291 & 3;
        float _2297 = (*spvDescriptorSet0.vp_c15)._m0[int(_2293)][_2295];
        float _2299 = _849 * _2279;
        float _2301 = fma(_237, _2271, _2299);
        float _2303 = fma(_239, _2289, _2301);
        float _2305 = _2303 + _2297;
        float _2307 = precise::clamp(_2305, 0.0, 1.0);
        float _2309 = -_2307;
        float _2311 = _2309 + _1729;
        float _2313 = fma(_2311, 500.0, 1.5);
        float _2315 = exp2(_2313);
        float _2317 = 0.0 + _2315;
        float _2319 = precise::clamp(_2317, 0.0, 1.0);
        _1258 = as_type<float>(_2263);
        _2259 = _2319;
    }
    float _2321 = _1258;
    float _2323 = _2259;
    float _2325 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2327 = _1504 + _2325;
    float _2329 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2331 = _1506 + _2329;
    float _2333 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2335 = _1508 + _2333;
    float _2337 = _2327 * _2327;
    float _2339 = fma(_2331, _2331, _2337);
    float _2341 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2343 = fma(_2335, _2335, _2339);
    float _2345 = rsqrt(_2343);
    float _2347 = sqrt(_2343);
    float _2349 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2351 = _2331 * _2349;
    float _2353 = _2335 * _2349;
    float _2355 = _2351 * _2351;
    float _2357 = _2353 * _2353;
    float _2359 = _2355 + _2357;
    float _2361 = sqrt(_2359);
    bool _2363 = _2361 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2367 = _2361 + _2365;
    float _2369 = _2321;
    float _2371 = _2359;
    float _2373 = _2367;
    float _2375 = _2341;
    float _2377 = _2351;
    float _2379 = _2353;
    float _2381 = _2355;
    float _2383 = _2357;
    if (_2363)
    {
        float _2385 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2369 = _2385;
    }
    float _2387 = _2369;
    if (_2363)
    {
        float _2389 = rsqrt(_2359);
        _2371 = _2389;
    }
    float _2391 = _2371;
    if (_2363)
    {
        float _2393 = _2367 * _2387;
        _2373 = _2393;
    }
    float _2395 = _2373;
    float _2397 = precise::max(0.0, _2341);
    float _2399 = _2397;
    if (_2363)
    {
        float _2401 = _2395 * 0.15915493667125701904296875;
        _1757 = _2401;
    }
    float _2403 = _1757;
    float _2405 = -_2349;
    float _2407 = -_2397;
    float _2409 = fma(_2327, _2405, _2407);
    float _2411 = as_type<float>(_2211);
    float _2413 = _2409;
    if (_2363)
    {
        float _2415 = _2403 * 6.283185482025146484375;
        float _2417 = sin(_2415);
        _2411 = _2417;
    }
    float _2419 = _2411;
    if (_2363)
    {
        float _2421 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2399 = _2421;
    }
    float _2423 = _2399;
    float _2425 = _2395;
    float _2427 = _2423;
    if (_2363)
    {
        float _2429 = _2403 * 6.283185482025146484375;
        float _2431 = cos(_2429);
        _2425 = _2431;
    }
    float _2433 = _2425;
    float _2435 = _2419;
    if (_2363)
    {
        float _2437 = fma(_2419, _2423, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2427 = _2437;
    }
    float _2439 = _2427;
    float _2441 = _2439;
    if (_2363)
    {
        float _2443 = _2391 * _2439;
        _2435 = _2443;
    }
    float _2445 = _2435;
    if (_2363)
    {
        float _2447 = _2433 + (-1.0);
        _2375 = _2447;
    }
    float _2449 = _2375;
    if (_2363)
    {
        float _2451 = _2351 * _2445;
        _2377 = _2451;
    }
    float _2453 = _2377;
    if (_2363)
    {
        float _2455 = _2353 * _2445;
        _2379 = _2455;
    }
    float _2457 = _2379;
    if (_2363)
    {
        float _2459 = _2449 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2441 = _2459;
    }
    float _2461 = _2441;
    if (_2363)
    {
        float _2463 = _2453 * _2453;
        _2381 = _2463;
    }
    float _2465 = _2381;
    if (_2363)
    {
        float _2467 = _2457 * _2457;
        _2383 = _2467;
    }
    float _2469 = _2383;
    int _2471 = ~_1733;
    int _2473 = _2471 + 1;
    if (_2363)
    {
        float _2475 = fma(_2409, _2433, _2461);
        _2413 = _2475;
    }
    float _2477 = _2413;
    float _2479 = fma(_2477, _2477, _2465);
    float _2481 = _2479 + _2469;
    float _2483 = rsqrt(_2481);
    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2487 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2485);
    float _2489 = precise::clamp(_2487, 0.0, 1.0);
    float _2491 = -_2489;
    float _2493 = _2491 + 1.0;
    float _2495 = abs(_2493);
    float _2497 = log2(_2495);
    float _2499 = _2483 * _2453;
    float _2501 = _2483 * _2477;
    float _2503 = _2483 * _2457;
    float _2505 = _2499 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2507 = _2501 + 1.0;
    float _2509 = -_2505;
    float _2511 = fma(_2501, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2509);
    float _2513 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2515 = -_2503;
    float _2517 = fma(_2515, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2511);
    float _2519 = exp2(_2513);
    float _2521 = fma(_2517, -0.5, 0.5);
    float _2523 = fma(_2517, 0.5, 0.5);
    float _2525 = fma(_2523, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2527 = sqrt(_2521);
    float _2529 = fma(_2523, _2525, -0.212114393711090087890625);
    float _2531 = fma(_2523, _2529, 1.570728778839111328125);
    float _2533 = -_2501;
    float _2535 = fma(_2519, _2507, _2533);
    bool _2537 = !_1999;
    int _2539 = _2537 ? _2247 : (-1);
    int _2541 = _2539 & 3;
    bool _2543 = _2541 != 0;
    float _2545 = _2527 * 0.636619746685028076171875;
    int _2547 = _2539 & 3;
    bool _2549 = _2547 != 0;
    float _2551 = -_2531;
    float _2553 = fma(_2545, _2551, 1.0);
    float _2555 = fma(_2535, 0.5, 0.5);
    int _2557 = _2473 * _2243;
    int _2559 = _2557 + _2009;
    bool _2561 = uint(_2547) > 1u;
    float2 _7832 = float2(_2553, _2555);
    float3 _2565 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7832, float2(0.0), isnan(_7832)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7832, float2(0.0), isnan(_7832)), level(0.0)).xyz;
    float _2567 = _2565.x;
    float _2569 = _2565.y;
    float _2571 = _2565.z;
    int _2573 = _1749 * _2253;
    int _2575 = _2573 + _2107;
    bool _2577 = uint(_2559) >= uint(_1733);
    float _2579 = trunc(_2241);
    float _2581 = precise::max(_2579, 0.0);
    uint _2583 = uint(_2581);
    int _2585 = _2543 ? 0 : 1;
    float _2587 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2589 = _2539 >> 31;
    float _2591 = _2497 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2593 = _265 > 0.5;
    float _2595 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2587);
    bool _2597 = !_2033;
    int _2599 = _2597 ? _2575 : (-1);
    float _2601 = -_811;
    float _2603 = _2601 + 1.0;
    int _2605 = ~_2585;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    float _2611 = exp2(_2591);
    int _2613 = _2609;
    if (!_2561)
    {
        int _2615 = ~_2585;
        int _2617 = _2615 + 1;
        _2613 = _2617;
    }
    int _2619 = _2613;
    float _2621 = -_807;
    float _2623 = _2621 + 1.0;
    int _2625 = _2589 & 3;
    float _2627 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2595);
    int _2629 = _2599 >> 31;
    float _2631 = -_817;
    float _2633 = _2631 + 1.0;
    int _2635 = _2539 + _2625;
    float _2637 = -_257;
    float _2639 = _2637 + 1.0;
    int _2641 = _2629 & 3;
    float _2643 = -_809;
    float _2645 = _2643 + 1.0;
    bool _2647 = !_2577;
    int _2649 = _2647 ? 0 : (-1);
    out.m_72.x = _1506;
    out.m_72.y = _1504;
    out.m_72.z = _1508;
    bool _2651 = _2547 != 3;
    int _2653 = _2599 + _2641;
    float _2655 = -_2611;
    float _2657 = _2655 + 1.0;
    bool _2659 = uint(_2547) >= 2u;
    int _2661 = _2653 >> 2;
    int _2663 = _2635 >> 2;
    int _2665 = _2659 ? 0 : 1;
    int _2667 = _2661 << 4;
    int _2669 = _2667 + 512;
    int _2671 = _2663 << 4;
    int _2673 = _2671 + 368;
    int _2675 = ~_2665;
    int _2677 = _2675 + 1;
    int _2679 = _2677 + 1;
    int _2681 = _2679;
    if (_2651)
    {
        int _2683 = ~_2665;
        int _2685 = _2683 + 1;
        _2681 = _2685;
    }
    int _2687 = _2681;
    uint _2689 = uint(int(uint(_2673) >> uint(2)));
    uint _2691 = uint(int(uint(int(_2689)) >> uint(2)));
    int _2693 = int(_2689) & 3;
    float _2695 = (*spvDescriptorSet0.vp_c9)._m0[int(_2691)][_2693];
    int _2697 = int(_2689) + 1;
    uint _2699 = uint(int(uint(_2697) >> uint(2)));
    int _2701 = _2697 & 3;
    float _2703 = (*spvDescriptorSet0.vp_c9)._m0[int(_2699)][_2701];
    int _2705 = ~_2243;
    int _2707 = _2705 + _2649;
    int _2709 = _2707 + 1;
    int _2711 = int(_2197) + int(_2583);
    float _2713 = -_187;
    int _2715 = _2593 ? as_type<int>(_2713) : as_type<int>(_187);
    int _2717 = _1733 * _2709;
    int _2719 = _2717 + _2009;
    bool _2721 = !_2549;
    int _2723 = _2721 ? 0 : 1;
    uint _2725 = uint(int(uint(_2669) >> uint(2)));
    uint _2727 = uint(int(uint(int(_2725)) >> uint(2)));
    int _2729 = int(_2725) & 3;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[int(_2727)][_2729];
    int _2733 = int(_2725) + 1;
    uint _2735 = uint(int(uint(_2733) >> uint(2)));
    int _2737 = _2733 & 3;
    float _2739 = (*spvDescriptorSet0.vp_c9)._m0[int(_2735)][_2737];
    bool _2741 = _2547 != 3;
    int _2743 = _2599 & 3;
    bool _2745 = _2743 != 0;
    int _2747 = _2599 & 3;
    bool _2749 = _2747 != 0;
    int _2751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2753 = _2751 != 0;
    int _2755 = _2673 + 8;
    uint _2757 = uint(int(uint(_2755) >> uint(2)));
    uint _2759 = uint(int(uint(int(_2757)) >> uint(2)));
    int _2761 = int(_2757) & 3;
    float _2763 = (*spvDescriptorSet0.vp_c9)._m0[int(_2759)][_2761];
    int _2765 = int(_2757) + 1;
    uint _2767 = uint(int(uint(_2765) >> uint(2)));
    int _2769 = _2765 & 3;
    float _2771 = (*spvDescriptorSet0.vp_c9)._m0[int(_2767)][_2769];
    int _2773 = ~_1749;
    int _2775 = _2773 + 1;
    bool _2777 = !_2753;
    int _2779 = _2777 ? 0 : 1;
    bool _2781 = uint(_2747) > 1u;
    int _2783 = _2775 * _2711;
    int _2785 = _2783 + _2031;
    bool _2787 = !_1999;
    int _2789 = _2787 ? _2719 : (-1);
    int _2791 = _2669 + 8;
    uint _2793 = uint(int(uint(_2791) >> uint(2)));
    uint _2795 = uint(int(uint(int(_2793)) >> uint(2)));
    int _2797 = int(_2793) & 3;
    float _2799 = (*spvDescriptorSet0.vp_c9)._m0[int(_2795)][_2797];
    int _2801 = int(_2793) + 1;
    uint _2803 = uint(int(uint(_2801) >> uint(2)));
    int _2805 = _2801 & 3;
    float _2807 = (*spvDescriptorSet0.vp_c9)._m0[int(_2803)][_2805];
    int _2809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2811 = _2809 != 0;
    int _2813 = _2745 ? 0 : 1;
    bool _2815 = !_2811;
    int _2817 = _2815 ? 0 : 1;
    bool _2819 = uint(_2785) >= uint(_1749);
    bool _2821 = _2747 != 3;
    bool _2823 = !_2819;
    int _2825 = _2823 ? 0 : (-1);
    bool _2827 = !_2741;
    int _2829 = _2827 ? 0 : (-1);
    int _2831 = ~_2813;
    int _2833 = _2831 + 1;
    int _2835 = _2833 + 1;
    bool _2837 = !_2749;
    int _2839 = _2837 ? 0 : 1;
    bool _2841 = uint(_2747) >= 2u;
    bool _2843 = _2747 != 3;
    int _2845 = _2835;
    if (!_2781)
    {
        int _2847 = ~_2813;
        int _2849 = _2847 + 1;
        _2845 = _2849;
    }
    int _2851 = _2845;
    int _2853 = ~_2711;
    int _2855 = _2853 + _2825;
    int _2857 = _2855 + 1;
    int _2859 = _2841 ? 0 : 1;
    bool _2861 = !_2843;
    int _2863 = _2861 ? 0 : (-1);
    int _2865 = _1749 * _2857;
    int _2867 = _2865 + _2031;
    int _2869 = abs(_2851);
    int _2871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2873 = _2871 != 0;
    int _2875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2877 = _2875 != 0;
    int _2879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2881 = _2879 != 0;
    int _2883 = abs(_2619);
    bool _2885 = _259 > 0.5;
    int _2887 = ~_2859;
    int _2889 = _2887 + 1;
    int _2891 = _2889 + 1;
    int _2893 = _2891;
    if (_2821)
    {
        int _2895 = ~_2859;
        int _2897 = _2895 + 1;
        _2893 = _2897;
    }
    int _2899 = _2893;
    int _2901 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2903 = _2901 != 0;
    int _2905 = abs(_2723);
    int _2907 = ~_2869;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    int _2913 = ~_2883;
    int _2915 = _2913 + 1;
    int _2917 = _2915 + 1;
    int _2919 = abs(_2839);
    int _2921 = _2911 * as_type<int>(_2739);
    int _2923 = abs(_2899);
    int _2925 = _2917 * as_type<int>(_2703);
    int _2927 = ~_2905;
    int _2929 = _2927 + 1;
    int _2931 = _2929 + 1;
    int _2933 = ~_2919;
    int _2935 = _2933 + 1;
    int _2937 = _2935 + 1;
    int _2939 = abs(_2687);
    int _2941 = _2931 * as_type<int>(_2695);
    int _2943 = _2941 + _2925;
    int _2945 = ~_2939;
    int _2947 = _2945 + 1;
    int _2949 = _2947 + 1;
    float _2951 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2953 = int(_2951);
    int _2955 = ~_2923;
    int _2957 = _2955 + 1;
    int _2959 = _2957 + 1;
    int _2961 = _2937 * as_type<int>(_2731);
    int _2963 = _2961 + _2921;
    int _2965 = _2949 * as_type<int>(_2763);
    int _2967 = _2965 + _2943;
    int _2969 = _2959 * as_type<int>(_2799);
    int _2971 = _2969 + _2963;
    float _2973 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2975 = abs(_2829);
    float _2977 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2981 = ~_2975;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    float _2987 = _2973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2989 = _2977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2993 = _2979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2995 = _2985 * as_type<int>(_2771);
    int _2997 = _2995 + _2967;
    int _2999 = abs(_2953);
    float _3001 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3003 = int(_3001);
    int _3005 = abs(_2779);
    out.m_74.x = _2987;
    out.m_74.y = _2989;
    out.m_74.z = _2993;
    out.m_74.w = _2991;
    float _3007 = float(uint(_2953));
    int _3009 = abs(_2863);
    bool _3011 = !_2033;
    int _3013 = _3011 ? _2867 : (-1);
    float _3015 = 1.0 / _3007;
    int _3017 = ~_3009;
    int _3019 = _3017 + 1;
    int _3021 = _3019 + 1;
    float _3023 = -_183;
    int _3025 = _2885 ? as_type<int>(_3023) : as_type<int>(_183);
    bool _3027 = _261 > 0.5;
    int _3029 = _3021 * as_type<int>(_2807);
    int _3031 = _3029 + _2971;
    float _3033 = abs(_955);
    float _3035 = log2(_3033);
    int _3037 = abs(_2817);
    float _3039 = float(uint(_3003));
    int _3041 = ~_3005;
    int _3043 = _3041 + 1;
    int _3045 = _3043 + 1;
    bool _3047 = _263 > 0.5;
    float _3049 = 1.0 / _3039;
    int _3051 = _2997 * _3045;
    int _3053 = as_type<int>(_3015) + (-2);
    float _3055 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3057 = _2789 * _3005;
    int _3059 = _3057 + _3051;
    float _3061 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3063 = _3035 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3065 = -_1007;
    float _3067 = fma(_3065, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3061);
    float _3069 = float(uint(_3059));
    float _3071 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3073 = ~_3037;
    int _3075 = _3073 + 1;
    int _3077 = _3075 + 1;
    float _3079 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3081 = abs(_3003);
    float _3083 = as_type<float>(_3053) * _3069;
    float _3085 = float(uint(_2999));
    float _3087 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3089 = _3031 * _3077;
    float _3091 = float(uint(_3081));
    float _3093 = exp2(_3063);
    float _3095 = _3071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3097 = _3079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3099 = _3087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3101 = _3013 * _3037;
    int _3103 = _3101 + _3089;
    float _3105 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3107 = -_1007;
    float _3109 = fma(_3107, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3055);
    int _3111 = ~_2953;
    int _3113 = _3111 + 1;
    float _3115 = 1.0 / _3085;
    out.m_76.x = _3095;
    out.m_76.y = _3097;
    out.m_76.z = _3099;
    float _3117 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3119 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3121 = ~_3081;
    int _3123 = _3121 + 1;
    bool _3125 = !_2903;
    float _3127 = _3125 ? _183 : as_type<float>(_3025);
    float _3129 = trunc(_3083);
    float _3131 = precise::max(_3129, 0.0);
    uint _3133 = uint(_3131);
    bool _3135 = !_2873;
    float _3137 = _3135 ? _187 : as_type<float>(_2715);
    bool _3139 = _955 <= 8000.0;
    bool _3141 = isnan(_955);
    bool _3143 = _3139 || _3141;
    bool _3145 = isnan(8000.0);
    bool _3147 = _3143 || _3145;
    float _3149 = float(_3147);
    int _3151 = as_type<int>(_3049) + (-2);
    float _3153 = -_1007;
    float _3155 = fma(_3153, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3105);
    float _3157 = float(uint(_3103));
    float _3159 = 1.0 / _3091;
    float _3161 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3067);
    int _3163 = abs(_3059);
    float _3165 = as_type<float>(_3151) * _3157;
    int _3167 = as_type<int>(_3115) + (-2);
    float _3169 = fma(_3093, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3171 = precise::clamp(_3169, 0.0, 1.0);
    int _3173 = abs(_3103);
    int _3175 = _3113 * int(_3133);
    int _3177 = _3175 + _3059;
    float _3179 = float(uint(_3163));
    float _3181 = trunc(_3165);
    float _3183 = precise::max(_3181, 0.0);
    uint _3185 = uint(_3183);
    float _3187 = float(uint(_3173));
    float _3189 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3109);
    float _3191 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3155);
    float _3193 = as_type<float>(_3167) * _3179;
    float _3195 = float(uint(_3177));
    float _3197 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3117);
    int _3199 = as_type<int>(_3159) + (-2);
    float _3201 = trunc(_3193);
    float _3203 = precise::max(_3201, 0.0);
    uint _3205 = uint(_3203);
    int _3207 = ~_3003;
    int _3209 = _3207 + 1;
    float _3211 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3119);
    float _3213 = as_type<float>(_3199) * _3187;
    float _3215 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3217 = as_type<float>(_3053) * _3195;
    float _3219 = trunc(_3213);
    float _3221 = precise::max(_3219, 0.0);
    uint _3223 = uint(_3221);
    int _3225 = ~_2999;
    int _3227 = _3225 + 1;
    float _3229 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3215);
    float _3231 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3233 = _3209 * int(_3185);
    int _3235 = _3233 + _3103;
    float _3237 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3239 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3241 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3231);
    int _3243 = _3227 * int(_3205);
    int _3245 = _3243 + _3163;
    float _3247 = float(uint(_3235));
    float _3249 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3237);
    float _3251 = trunc(_3217);
    float _3253 = precise::max(_3251, 0.0);
    uint _3255 = uint(_3253);
    float _3257 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3239);
    float _3259 = float(uint(_3245));
    float _3261 = as_type<float>(_3151) * _3247;
    float _3263 = -_183;
    int _3265 = _3047 ? as_type<int>(_3263) : as_type<int>(_183);
    int _3267 = _3123 * int(_3223);
    int _3269 = _3267 + _3173;
    float _3271 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3211);
    float _3273 = as_type<float>(_3167) * _3259;
    float _3275 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3197);
    float _3277 = trunc(_3261);
    float _3279 = precise::max(_3277, 0.0);
    uint _3281 = uint(_3279);
    float _3283 = float(uint(_3269));
    float _3285 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3229);
    bool _3287 = !_2881;
    float _3289 = _3287 ? _183 : as_type<float>(_3265);
    float _3291 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3293 = -_187;
    int _3295 = _3027 ? as_type<int>(_3293) : as_type<int>(_187);
    float _3297 = as_type<float>(_3199) * _3283;
    float _3299 = trunc(_3273);
    float _3301 = precise::max(_3299, 0.0);
    uint _3303 = uint(_3301);
    bool _3305 = !_2877;
    float _3307 = _3305 ? _187 : as_type<float>(_3295);
    float _3309 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3249);
    int _3311 = ~_3003;
    int _3313 = _3311 + 1;
    float _3315 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3317 = _3291 * _3161;
    int _3319 = int(_3133) + int(_3255);
    float _3321 = fma(_3171, -2.0, 3.0);
    float _3323 = trunc(_3297);
    float _3325 = precise::max(_3323, 0.0);
    uint _3327 = uint(_3325);
    int _3329 = int(_3185) + int(_3281);
    float _3331 = _3171 * _3171;
    int _3333 = ~_2999;
    int _3335 = _3333 + 1;
    float _3337 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3241);
    float _3339 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3257);
    int _3341 = _3313 * _3329;
    int _3343 = _3341 + _3103;
    float _3345 = fma(_3315, _3271, _3317);
    out.m_78.x = _3271;
    out.m_78.y = _3275;
    out.m_78.z = _3285;
    int _3347 = ~_2953;
    int _3349 = _3347 + 1;
    float _3351 = _3331 * _3321;
    int _3353 = ~_3081;
    int _3355 = _3353 + 1;
    int _3357 = int(_3205) + int(_3303);
    int _3359 = _3349 * _3319;
    int _3361 = _3359 + _3059;
    bool _3363 = uint(_3343) >= uint(_3003);
    int _3365 = int(_3223) + int(_3327);
    bool _3367 = !_3363;
    int _3369 = _3367 ? 0 : (-1);
    bool _3371 = uint(_3361) >= uint(_2953);
    int _3373 = _3335 * _3357;
    int _3375 = _3373 + _3163;
    int _3377 = ~_3329;
    int _3379 = _3377 + _3369;
    int _3381 = _3379 + 1;
    int _3383 = _3355 * _3365;
    int _3385 = _3383 + _3173;
    int _3387 = _3059 ^ _2953;
    float _3389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3391 = uint(_3375) >= uint(_2999);
    int _3393 = _3003 * _3381;
    int _3395 = _3393 + _3103;
    bool _3397 = !_3371;
    int _3399 = _3397 ? 0 : (-1);
    bool _3401 = uint(_3385) >= uint(_3081);
    bool _3403 = !_3391;
    int _3405 = _3403 ? 0 : (-1);
    float _3407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3409 = uint(int(uint(_3387) >> uint(31)));
    int _3411 = ~_3319;
    int _3413 = _3411 + _3399;
    int _3415 = _3413 + 1;
    int _3417 = ~_3405;
    int _3419 = _3357 + _3417;
    int _3421 = _3419 + 1;
    int _3423 = ~int(_3409);
    int _3425 = _3423 + 1;
    int _3427 = _2953 * _3415;
    int _3429 = _3427 + _3059;
    int _3431 = _3103 ^ _3003;
    float _3433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3435 = _3421 ^ _3425;
    bool _3437 = _2953 == 0;
    bool _3439 = _3003 == 0;
    float _3441 = _3407 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3443 = _3003 == 0;
    int _3445 = ~_3425;
    int _3447 = _3445 + _3435;
    int _3449 = _3447 + 1;
    float _3451 = _3389 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3453 = !_3401;
    int _3455 = _3453 ? 0 : (-1);
    uint _3457 = uint(int(uint(_3431) >> uint(31)));
    float _3459 = fma(_3291, _3291, 1.0);
    bool _3461 = !_3437;
    int _3463 = _3461 ? _3429 : (-1);
    bool _3465 = _2953 == 0;
    int _3467 = ~_3455;
    int _3469 = _3365 + _3467;
    int _3471 = _3469 + 1;
    float _3473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3475 = ~int(_3457);
    int _3477 = _3475 + 1;
    bool _3479 = !_3439;
    int _3481 = _3479 ? _3395 : (-1);
    float _3483 = float(_3463);
    int _3485 = _3471 ^ _3477;
    float _3487 = rsqrt(_3459);
    float _3489 = float(_3481);
    float _3491 = fma(_3451, _3483, _657);
    float _3493 = _3127 + 0.5;
    int _3495 = ~_3477;
    int _3497 = _3495 + _3485;
    int _3499 = _3497 + 1;
    bool _3501 = !_3465;
    int _3503 = _3501 ? _3449 : (-1);
    float _3505 = fma(_3441, _3489, _823);
    float _3507 = fma(_3451, _3493, _3491);
    float _3509 = _3289 + 0.5;
    bool _3511 = !_3443;
    int _3513 = _3511 ? _3499 : (-1);
    float _3515 = _3433 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3517 = float(_3503);
    float _3519 = fma(_3441, _3509, _3505);
    float _3521 = float(_3513);
    float _3523 = _3473 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3525 = _3307 + (-0.5);
    float _3527 = -_685;
    float _3529 = fma(_3515, _3517, _3527);
    float _3531 = _3137 + (-0.5);
    float _3533 = -_825;
    float _3535 = fma(_3523, _3521, _3533);
    float _3537 = _3291 * _3487;
    float _3539 = -_3515;
    float _3541 = fma(_3539, _3525, _3529);
    float _3543 = -_2623;
    float _3545 = fma(_3289, _3543, _3519);
    float _3547 = -_3523;
    float _3549 = fma(_3547, _3531, _3535);
    float _3551 = -_3309;
    float _3553 = _3537 * _3551;
    float _3555 = fma(_3307, _2603, _3541);
    float _3557 = -_3351;
    float _3559 = _3557 + 1.0;
    float _3561 = -_3337;
    float _3563 = _3537 * _3561;
    float _3565 = fma(_3487, _3189, _3553);
    float _3567 = _3291 * _3189;
    float _3569 = fma(_3559, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3351);
    float _3571 = -_3339;
    float _3573 = _3537 * _3571;
    float _3575 = fma(_3487, _3161, _3563);
    float _3577 = fma(_3315, _3275, _3567);
    float _3579 = _3149 * _3569;
    float _3581 = fma(_3487, _3191, _3573);
    float _3583 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2627);
    float _3585 = _3579 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3587 = _3585;
    if (!_1592)
    {
        _1660 = 1.0;
    }
    float _3589 = _1660;
    float _3591 = fma(_3137, _2633, _3549);
    float _3593 = _3589;
    if (_1592)
    {
        bool _3595 = _1710 >= _1674;
        bool _3597 = isnan(_1710);
        bool _3599 = _3595 || _3597;
        bool _3601 = isnan(_1674);
        bool _3603 = _3599 || _3601;
        float _3605 = float(_3603);
        _3593 = _3605;
    }
    float _3607 = _3593;
    float _3609 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3611 = _2639 * _3585;
    float _3613 = precise::clamp(_3611, 0.0, 1.0);
    float _3615 = -_2645;
    float _3617 = fma(_3127, _3615, _3507);
    float _3619 = _3583 + _1616;
    float _3621 = _3291 * _3191;
    float _3623 = _3607 * _2323;
    float _3625 = _3609 * _1712;
    float _3627 = -_3613;
    float _3629 = fma(_3627, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3631 = _3619 * 0.5;
    float _3633 = fma(_3315, _3285, _3621);
    float _3635 = _1723 * _3625;
    float _3637 = -_3623;
    float _3639 = fma(_3637, _3629, 1.0);
    float _3641 = precise::clamp(_3639, 0.0, 1.0);
    float _3643 = _2571 * _3625;
    float _3645 = -_3609;
    float _3647 = _3645 + 1.0;
    out.m_80.z = _3631;
    out.m_80.w = _1616;
    float _3649 = _3337 + _3345;
    float _3651 = _3309 + _3577;
    float _3653 = _3339 + _3633;
    float _3655 = fma(_2567, _3635, _1717);
    float _3657 = fma(_2569, _3635, _1719);
    float _3659 = _1723 * _3647;
    float _3661 = fma(_1723, _3643, _1721);
    out.m_82.x = _3575;
    out.m_82.y = _3565;
    out.m_82.z = _3581;
    bool _3663 = _2347 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3665 = isnan(_2347);
    bool _3667 = _3663 || _3665;
    bool _3669 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3671 = _3667 || _3669;
    float _3673 = _3641 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_84.x = _3617;
    out.m_84.y = _3555;
    out.m_84.z = _3545;
    out.m_84.w = _3591;
    out.gl_Position.x = _1652;
    out.gl_Position.y = _1654;
    out.gl_Position.z = _3583;
    out.gl_Position.w = _1616;
    out.m_86.x = _3673;
    float _3675 = _3631;
    float _3677 = _3619;
    float _3679 = _3623;
    float _3681 = _3641;
    float _3683 = _3635;
    if (!_3671)
    {
        _3675 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3685 = _3675;
    out.m_88.x = _3655;
    out.m_88.y = _3657;
    out.m_88.z = _3661;
    out.m_88.w = _3659;
    float _3687 = _3685;
    float _3689 = _3685;
    if (!_3671)
    {
        _3677 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3691 = _3677;
    float _3693 = _3691;
    float _3695 = _3691;
    if (!_3671)
    {
        _3587 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3697 = _3587;
    out.m_90.x = _3649;
    out.m_90.y = _3651;
    out.m_90.z = _3653;
    float _3699 = _3697;
    float _3701 = _3697;
    if (!_3671)
    {
        _3679 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3703 = _3679;
    float _3705 = _3703;
    float _3707 = _3703;
    if (!_3671)
    {
        _3681 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3709 = _3681;
    float _3711 = _3709;
    float _3713 = _3709;
    if (!_3671)
    {
        _3683 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3715 = _3683;
    bool _3717 = !_3671;
    float _3719 = _3715;
    float _3721 = _3715;
    if (!_3717)
    {
        bool _3723 = _2347 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3725 = isnan(_2347);
        bool _3727 = _3723 || _3725;
        bool _3729 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3731 = _3727 || _3729;
        if (!_3731)
        {
            float _3733 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3735 = _2347 + _3733;
            float _3737 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3739 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3737;
            float _3741 = 1.0 / _3739;
            float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3749 = _3747 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3753 = _3751 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3757 = _3755 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3759 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3761 = _3759 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3763 = _3735 * _3741;
            float _3765 = precise::clamp(_3763, 0.0, 1.0);
            float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3771 = fma(_3765, _3745, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3773 = fma(_3765, _3769, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3775 = fma(_3765, _3749, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3777 = fma(_3765, _3753, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3779 = fma(_3765, _3757, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3781 = fma(_3765, _3761, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3695 = _3773;
            _3713 = _3779;
            _3689 = _3771;
            _3707 = _3777;
            _3701 = _3775;
            _3721 = _3781;
            _3783 = true;
        }
        else
        {
            bool _3785 = _2347 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3787 = isnan(_2347);
            bool _3789 = _3785 || _3787;
            bool _3791 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3793 = _3789 || _3791;
            if (!_3793)
            {
                _3687 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3795 = _3687;
            _3689 = _3795;
            if (!_3793)
            {
                _3693 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3797 = _3693;
            _3695 = _3797;
            if (!_3793)
            {
                _3699 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3799 = _3699;
            _3701 = _3799;
            if (!_3793)
            {
                _3705 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3801 = _3705;
            _3707 = _3801;
            if (!_3793)
            {
                _3711 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3803 = _3711;
            _3713 = _3803;
            if (!_3793)
            {
                _3719 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3805 = _3719;
            bool _3807 = !_3793;
            _3721 = _3805;
            if (!_3807)
            {
                bool _3809 = _2347 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3811 = isnan(_2347);
                bool _3813 = _3809 || _3811;
                bool _3815 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3817 = _3813 || _3815;
                if (!_3817)
                {
                    float _3819 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3821 = _2347 + _3819;
                    float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3825 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3823;
                    float _3827 = 1.0 / _3825;
                    float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3835 = _3833 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3837 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3841 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3849 = _3821 * _3827;
                    float _3851 = precise::clamp(_3849, 0.0, 1.0);
                    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3857 = fma(_3851, _3831, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3859 = fma(_3851, _3855, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3861 = fma(_3851, _3835, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3863 = fma(_3851, _3839, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3865 = fma(_3851, _3843, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3867 = fma(_3851, _3847, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3695 = _3859;
                    _3713 = _3865;
                    _3689 = _3857;
                    _3707 = _3863;
                    _3701 = _3861;
                    _3721 = _3867;
                    _3783 = true;
                }
                else
                {
                    _3695 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3713 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3689 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3707 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3701 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3721 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3783 = false;
    float _3869 = _3695;
    float _3871 = _3713;
    float _3873 = _3689;
    float _3875 = _3707;
    float _3877 = _3701;
    float _3879 = _3721;
    float _3881 = fma(_3651, -0.5, 0.5);
    float _3883 = precise::clamp(_3881, 0.0, 1.0);
    float _3885 = -_3869;
    float _3887 = _3885 + _3871;
    float _3889 = -_3873;
    float _3891 = _3889 + _3875;
    float _3893 = -_3877;
    float _3895 = _3893 + _3879;
    bool _3897 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3899 = fma(_3883, _3887, _3869);
    float _3901 = fma(_3883, _3891, _3873);
    float _3903 = fma(_3883, _3895, _3877);
    float _3905 = _3899 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _3907 = fma(_3901, 0.298911988735198974609375, _3905);
    float _3909 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3911 = fma(_3903, 0.114477999508380889892578125, _3907);
    out.m_59.x = _3909;
    float _3913 = -_3911;
    float _3915 = _3901 + _3913;
    float _3917 = -_3911;
    float _3919 = _3899 + _3917;
    float _3921 = -_3911;
    float _3923 = _3903 + _3921;
    float _3925 = fma(_3915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3911);
    float _3927 = fma(_3919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3911);
    float _3929 = fma(_3923, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3911);
    out.m_94.x = _3925;
    out.m_94.y = _3927;
    out.m_94.z = _3929;
    if (!_3897)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3931 = -_1504;
    float _3933 = _3931 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3935 = -_1506;
    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3939 = -_1508;
    float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3943 = _3933 * _3933;
    float _3945 = fma(_3937, _3937, _3943);
    float _3947 = fma(_3941, _3941, _3945);
    float _3949 = sqrt(_3947);
    float _3951 = rsqrt(_3947);
    float _3953 = -_3949;
    float _3955 = _3953 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3957 = _3955 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3959 = precise::clamp(_3957, 0.0, 1.0);
    float _3961 = _3937 * _3951;
    float _3963 = _3933 * _3951;
    float _3965 = abs(_3959);
    float _3967 = log2(_3965);
    float _3969 = _3941 * _3951;
    float _3971 = _3961 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3973 = _3651 * _3963;
    float _3975 = -_3963;
    float _3977 = -_3971;
    float _3979 = fma(_3975, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3977);
    float _3981 = fma(_3649, _3961, _3973);
    float _3983 = -_3969;
    float _3985 = fma(_3983, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3979);
    float _3987 = fma(_3653, _3969, _3981);
    float _3989 = precise::clamp(_3987, 0.0, 1.0);
    float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3993 = _3985 + _3991;
    float _3995 = _3967 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3997 = _3993 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3999 = precise::clamp(_3997, 0.0, 1.0);
    float _4001 = exp2(_3995);
    float _4003 = _4001 * _3999;
    float _4005 = _3989 * _4003;
    float _4007 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4009 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4011 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _4007;
    out.m_92.y = _4009;
    out.m_92.z = _4011;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

