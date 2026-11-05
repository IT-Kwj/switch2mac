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
    bool _3699 = false;
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
        float _3984 = as_type<float>(_129);
        out.gl_Position.z = _3984;
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
        float _4054 = as_type<float>(_167);
        out.gl_Position.z = _4054;
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
    float2 _4203 = float2(_251, _255);
    float _257 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4203, float2(0.0), isnan(_4203)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4203, float2(0.0), isnan(_4203)), level(0.0)).x;
    float _259 = in.m_66.x;
    float _261 = in.m_66.y;
    float _263 = in.m_66.z;
    float _265 = in.m_66.w;
    float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _269 = log2(_267);
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _281 = _279 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _283 = 1.0 / _273;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _289 = _287 != 0;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _297 = 1.0 / _281;
    float _299 = _269 * _147;
    float _301 = _259 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _303 = 1.0 / _293;
    float _305 = -_285;
    float _307 = fma(_301, 2.0, _305);
    float _309 = _261 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _311 = _261 * 2.0;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _321 = fma(_309, -2.0, _295);
    float _323 = 1.0 / _277;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _327 = _217 + _325;
    float _329 = _259 * 2.0;
    float _331 = -_147;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[76].x, _307);
    float _335 = _327 * _297;
    float _337 = _263 * 2.0;
    float _339 = floor(_329);
    float _341 = _221 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _345 = _217 + _343;
    float _347 = fma(_319, _335, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _351 = fma(_219, (*spvDescriptorSet0.vp_c10)._m0[5].x, _341);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _217 + _353;
    float _357 = _345 * _283;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _361 = _217 + _359;
    float _363 = floor(_337);
    float _365 = _355 * _303;
    float _367 = _259 + _261;
    float _369 = _361 * _323;
    float _371 = _263 + _259;
    float _373 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[5].z, _351);
    float _375 = _367 + (-1.0);
    float _377 = _263 + _261;
    float _379 = _371 + (-1.0);
    float _381 = floor(_311);
    bool _383 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _385 = isnan(_217);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = fma(_315, _369, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _397 = _339 > 0.0;
    float _399 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _321);
    bool _401 = _339 >= 0.0;
    bool _403 = isnan(_339);
    bool _405 = _401 || _403;
    bool _407 = isnan(0.0);
    bool _409 = _405 || _407;
    float _411 = _373 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _413 = _363 > 0.0;
    float _415 = exp2(_299);
    float _417 = _377 + (-1.0);
    float _419 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _421 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _423 = isnan(_217);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _433;
    bool _437 = _363 >= 0.0;
    bool _439 = isnan(_363);
    bool _441 = _437 || _439;
    bool _443 = isnan(0.0);
    bool _445 = _441 || _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = -_431;
    float _461 = _459 + 1.0;
    bool _463 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _465 = isnan(_217);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = fma(_453, _365, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _477 = fma(_457, _365, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _479 = _393 * _461;
    float _481 = -_393;
    float _483 = _481 + 1.0;
    bool _485 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _487 = isnan(_217);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -_473;
    float _499 = _497 + 1.0;
    bool _501 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _503 = isnan(_217);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = fma(_435, _357, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _515 = fma(_449, _357, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _517 = _495 * _499;
    float _519 = -_495;
    float _521 = _519 + 1.0;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _523;
    bool _527 = _381 > 0.0;
    float _529 = _511 * _521;
    bool _531 = _381 >= 0.0;
    bool _533 = isnan(_381);
    bool _535 = _531 || _533;
    bool _537 = isnan(0.0);
    bool _539 = _535 || _537;
    float _541 = fma(_525, _369, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _543 = as_type<int>(_381);
    float _545 = _513;
    if (_289)
    {
        _543 = 0;
    }
    int _547 = _543;
    float _549 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _551 = _547;
    if (!_289)
    {
        _551 = 1;
    }
    int _553 = _551;
    float _555 = _513 * _529;
    float _557 = _515 * _529;
    int _559 = _409 ? 0 : 1;
    float _561 = _473 * _483;
    int _563 = _445 ? 0 : 1;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _569 = _553 != 1;
    float _571 = -_415;
    float _573 = _571 + 1.0;
    float _575 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _577 = int(_575);
    int _579 = ~_563;
    int _581 = _579 + 1;
    int _583 = _581 + 1;
    float _585 = fma(_567, _335, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _587 = _583;
    if (!_413)
    {
        int _589 = ~_563;
        int _591 = _589 + 1;
        _587 = _591;
    }
    int _593 = _587;
    float _595 = _411 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _599 = _597 != 0;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _607 = _605 != 0;
    float _609 = _411 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _611 = fma(_237, (*spvDescriptorSet0.vp_c8)._m0[11].x, _595);
    float _613 = fma(_237, (*spvDescriptorSet0.vp_c8)._m0[10].x, _609);
    bool _615 = !_603;
    int _617 = _615 ? 0 : 1;
    float _619 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _621 = !_599;
    int _623 = _621 ? 0 : 1;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _627 = !_607;
    int _629 = _627 ? 0 : 1;
    float _631 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[11].z, _611);
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _635 = _633 != 0;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _639 = _637 != 0;
    int _641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _643 = _641 != 0;
    float _645 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[10].z, _613);
    int _647 = ~_559;
    int _649 = _647 + 1;
    int _651 = _649 + 1;
    int _653 = _651;
    if (!_569)
    {
        _545 = _261;
    }
    float _655 = _545;
    float _657 = _645 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _659 = _655;
    if (!_397)
    {
        int _661 = ~_559;
        int _663 = _661 + 1;
        _653 = _663;
    }
    int _665 = _653;
    if (_569)
    {
        _659 = _259;
    }
    float _667 = _659;
    float _669 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _671 = int(_669);
    float _673 = float(_113);
    bool _675 = !_639;
    float _677 = _675 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _679 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[83].z, _625);
    float _681 = float(_577);
    float _683 = 1.0 / _673;
    float _685 = _539 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _689 = _667;
    float _691 = _677;
    float _693 = _685;
    if (!_569)
    {
        _689 = _263;
    }
    float _695 = _689;
    int _697 = abs(as_type<int>(_677));
    float _699 = _695;
    if (!_569)
    {
        _691 = _263;
    }
    float _701 = _691;
    float _703 = 1.0 / _681;
    float _705 = _701;
    if (_569)
    {
        _699 = _261;
    }
    float _707 = _699;
    if (_569)
    {
        _705 = _261;
    }
    float _709 = _705;
    int _711 = ~as_type<int>(_685);
    int _713 = _711 + 1;
    int _715 = _713 + 1;
    float _717 = _707 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _719 = _715;
    if (!_527)
    {
        int _721 = ~as_type<int>(_685);
        int _723 = _721 + 1;
        _719 = _723;
    }
    int _725 = _719;
    float _727 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[83].w, _687);
    if (!_569)
    {
        _693 = _261;
    }
    float _729 = _693;
    float _731 = fma(_717, -2.0, _349);
    float _733 = float(_665);
    float _735 = _683 * _147;
    float _737 = float(_697);
    float _739 = _703 * _147;
    float _741 = _729;
    if (_569)
    {
        _741 = _259;
    }
    float _743 = _741;
    float _745 = _737 * _733;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _749 = float(_671);
    float _751 = _743 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _753 = in.m_68.x;
    float _755 = in.m_68.y;
    float _757 = in.m_68.z;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _761 = 1.0 + _759;
    float _763 = -_747;
    float _765 = fma(_751, 2.0, _763);
    float _767 = 1.0 / _749;
    bool _769 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _771 = isnan(1.0);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _777 = _773 || _775;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _781 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _783 = isnan(0.0);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _789 = _785 || _787;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _793 = _631 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _795 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[78].w, _779);
    float _797 = _789 ? _573 : 0.0;
    float _799 = 1.0 / _761;
    float _801 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[78].z, _791);
    float _803 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _679);
    float _805 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _727);
    float _807 = -_147;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[81].x, _765);
    float _811 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _801);
    float _813 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _795);
    float _815 = _745 * (-2.0);
    float _817 = _767 * _147;
    float _819 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _731);
    bool _821 = !_643;
    int _823 = _821 ? 0 : 1;
    float _825 = _657 + _793;
    float _827 = float(_725);
    float _829 = 1.0 / _793;
    if (_777)
    {
        float _831 = _797 * _799;
        _149 = _831;
    }
    float _833 = _149;
    float _835 = fma(_815, _755, _755);
    bool _837 = !_635;
    int _839 = _837 ? 0 : 1;
    float _841 = fma(_549, _815, _549);
    float _843 = _261 + (-0.5);
    int _845 = abs(_823);
    int _847 = abs(_839);
    float _849 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[196].y, _835);
    float _851 = -_511;
    float _853 = _851 + 1.0;
    float _855 = float(_845);
    float _857 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].x, _555);
    float _859 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].y, _557);
    float _861 = _855 * _827;
    float _863 = float(_847);
    float _865 = _259 + (-0.5);
    float _867 = float(_593);
    float _869 = fma(_475, _517, _857);
    float _871 = _825 * _829;
    float _873 = _871 * 0.5;
    float _875 = fma(_477, _517, _859);
    float _877 = fma(_841, _833, _849);
    float _879 = _863 * _867;
    float _881 = fma(_541, _561, _869);
    float _883 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _885 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[30].w, _883);
    float _887 = fma(_395, _561, _875);
    float _889 = _879 * (-2.0);
    float _891 = fma(_585, _479, _881);
    float _893 = in.m_70.x;
    float _895 = in.m_70.y;
    float _897 = _877 * 0.15915493667125701904296875;
    float _899 = fma(_889, _753, _753);
    float _901 = fma(_619, _889, _619);
    float _903 = _861 * (-2.0);
    float _905 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[147].x, _891);
    float _907 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[196].x, _899);
    float _909 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _911 = fma(_903, _757, _757);
    float _913 = fma(_419, _903, _419);
    float _915 = fma(_901, _833, _907);
    float _917 = _263 + (-0.5);
    float _919 = 1.0 / _885;
    float _921 = _411 + _909;
    float _923 = _915 * 0.15915493667125701904296875;
    float _925 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[196].z, _911);
    float _927 = fma(_347, _479, _887);
    float _929 = _921 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _931 = fma(_913, _833, _925);
    float _933 = _897 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[147].y, _927);
    float _939 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _941 = _931 * 0.15915493667125701904296875;
    float _943 = _905 * _893;
    float _945 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _947 = _937 * _895;
    float _949 = _921 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _951 = _943 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _953 = _897 * 6.283185482025146484375;
    float _955 = cos(_953);
    float _957 = fma(_237, (*spvDescriptorSet0.vp_c15)._m0[127].x, _949);
    float _959 = _951 * _945;
    float _961 = fma(_237, (*spvDescriptorSet0.vp_c15)._m0[126].x, _929);
    float _963 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _965 = _947 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _967 = _923 * 6.283185482025146484375;
    float _969 = sin(_967);
    float _971 = fma(_239, (*spvDescriptorSet0.vp_c15)._m0[126].z, _961);
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _975 = _919 * _973;
    float _977 = _965 * _963;
    float _979 = fma(_239, (*spvDescriptorSet0.vp_c15)._m0[127].z, _957);
    float _981 = _971 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _983 = _975 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _985 = _923 * 6.283185482025146484375;
    float _987 = cos(_985);
    bool _989 = _975 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _991 = _979 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _993 = _941 * 6.283185482025146484375;
    float _995 = cos(_993);
    float _997 = _969 * _935;
    float _999 = _969 * _955;
    int _1001 = 2;
    if (!_983)
    {
        _1001 = 1;
    }
    int _1003 = _1001;
    float _1005 = _941 * 6.283185482025146484375;
    float _1007 = sin(_1005);
    float _1009 = _987 * _955;
    float _1011 = _987 * _935;
    float _1013 = _969 * _995;
    float _1015 = _955 * _995;
    float _1017 = _987 * _995;
    float _1019 = _935 * _995;
    bool _1021 = !_983;
    int _1023 = _1021 ? 0 : 1;
    float _1025 = trunc(_981);
    int _1027 = int(_1025);
    float _1029 = _1017 * _977;
    float _1031 = fma(_1007, _1009, _997);
    int _1033 = _1003;
    if (!_989)
    {
        _1033 = _1023;
    }
    int _1035 = _1033;
    float _1037 = fma(_1007, _997, _1009);
    float _1039 = -_977;
    float _1041 = _1007 * _1039;
    float _1043 = _1013 * _977;
    float _1045 = -_1011;
    float _1047 = fma(_1007, _999, _1045);
    float _1049 = trunc(_991);
    int _1051 = int(_1049);
    int _1053 = _1035 << 6;
    float _1055 = fma(_1015, _959, _1041);
    float _1057 = fma(_1047, _959, _1043);
    float _1059 = -_999;
    float _1061 = fma(_1007, _1011, _1059);
    int _1063 = _1053 + 96;
    uint _1066 = uint(int(uint(_1063) >> uint(2)));
    uint _1068 = uint(int(uint(int(_1066)) >> uint(2)));
    int _1070 = int(_1066) & 3;
    float _1072 = (*spvDescriptorSet0.vp_c15)._m0[int(_1068)][_1070];
    int _1074 = int(_1066) + 1;
    uint _1076 = uint(int(uint(_1074) >> uint(2)));
    int _1078 = _1074 & 3;
    float _1080 = (*spvDescriptorSet0.vp_c15)._m0[int(_1076)][_1078];
    float _1082 = fma(_1031, _959, _1029);
    float _1084 = fma(_1037, _939, _1057);
    int _1086 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1088 = _1027 + _1086;
    int _1090 = _1088 + 1;
    float _1092 = fma(_1019, _939, _1055);
    float _1094 = fma(_1061, _939, _1082);
    bool _1096 = _1090 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1098 = _1053 + 104;
    uint _1100 = uint(int(uint(_1098) >> uint(2)));
    uint _1102 = uint(int(uint(int(_1100)) >> uint(2)));
    int _1104 = int(_1100) & 3;
    float _1106 = (*spvDescriptorSet0.vp_c15)._m0[int(_1102)][_1104];
    int _1108 = int(_1100) + 1;
    uint _1110 = uint(int(uint(_1108) >> uint(2)));
    int _1112 = _1108 & 3;
    float _1114 = (*spvDescriptorSet0.vp_c15)._m0[int(_1110)][_1112];
    float _1116 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1118 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1120 = _1051 + _1118;
    int _1122 = _1120 + 1;
    float _1124 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1126 = _1090 | _1122;
    int _1128 = _1053 + 48;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
    int _1134 = int(_1130) & 3;
    float _1136 = (*spvDescriptorSet0.vp_c15)._m0[int(_1132)][_1134];
    int _1138 = int(_1130) + 1;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    int _1142 = _1138 & 3;
    float _1144 = (*spvDescriptorSet0.vp_c15)._m0[int(_1140)][_1142];
    float _1146 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1124);
    bool _1148 = _1126 < 0;
    bool _1150 = _1148 || _1096;
    float _1152 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1116);
    float _1154 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1146);
    bool _1156 = _1122 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1158 = _1156 || _1150;
    int _1160 = _1053 + 64;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    uint _1164 = uint(int(uint(int(_1162)) >> uint(2)));
    int _1166 = int(_1162) & 3;
    float _1168 = (*spvDescriptorSet0.vp_c15)._m0[int(_1164)][_1166];
    int _1170 = int(_1162) + 1;
    uint _1172 = uint(int(uint(_1170) >> uint(2)));
    int _1174 = _1170 & 3;
    float _1176 = (*spvDescriptorSet0.vp_c15)._m0[int(_1172)][_1174];
    float _1178 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1152);
    float _1180 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1182 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1184 = _239 + _1180;
    int _1186 = _1053 + 56;
    uint _1188 = uint(int(uint(_1186) >> uint(2)));
    uint _1190 = uint(int(uint(int(_1188)) >> uint(2)));
    int _1192 = int(_1188) & 3;
    float _1194 = (*spvDescriptorSet0.vp_c15)._m0[int(_1190)][_1192];
    int _1196 = int(_1188) + 1;
    uint _1198 = uint(int(uint(_1196) >> uint(2)));
    int _1200 = _1196 & 3;
    float _1202 = (*spvDescriptorSet0.vp_c15)._m0[int(_1198)][_1200];
    float _1204 = _237 + _1182;
    float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1208 = _1184 + _1206;
    int _1210 = _1090;
    int _1212 = as_type<int>(_1178);
    float _1214 = _1184;
    if (!_1158)
    {
        int _1216 = _1122 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1218 = _1216 + _1090;
        _1210 = _1218;
    }
    int _1220 = _1210;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1224 = _1204 + _1222;
    float _1226 = _1208 * _1208;
    int _1228 = _1053 + 72;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    int _1246 = 0;
    float _1248 = as_type<float>(_1220);
    if (!_1158)
    {
        int _1250 = _1220 << 2;
        _1246 = _1250;
    }
    int _1252 = _1246;
    float _1254 = fma(_1224, _1224, _1226);
    int _1256 = _1252;
    if (!_1158)
    {
        uint _1258 = uint(int(uint(_1220) >> uint(2)));
        _1212 = int(_1258);
    }
    int _1260 = _1212;
    int _1262 = _1260;
    if (!_1158)
    {
        int _1264 = 12 & _1252;
        _1256 = _1264;
    }
    int _1266 = _1256;
    float _1268 = sqrt(_1254);
    int _1270 = _1053 + 80;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
    int _1276 = int(_1272) & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    int _1280 = int(_1272) + 1;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    int _1284 = _1280 & 3;
    float _1286 = (*spvDescriptorSet0.vp_c15)._m0[int(_1282)][_1284];
    float _1288 = _921 * _1080;
    if (!_1158)
    {
        int _1290 = _1260 << 4;
        int _1292 = _1290 + _1266;
        _1262 = _1292;
    }
    int _1294 = _1262;
    float _1296 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1298 = fma(_237, _1072, _1288);
    float _1300 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1296);
    float _1302 = fma(_239, _1106, _1298);
    float _1304 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1300);
    float _1306 = _1302 + _1114;
    bool _1308 = _1268 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1310 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1312 = _921 * _1144;
    float _1314 = 1.0 / _1306;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1322 = _1320 != 0;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1326 = _1324 != 0;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1330 = _1328 != 0;
    float _1332 = fma(_237, _1136, _1312);
    bool _1334 = !_1322;
    int _1336 = _1334 ? 0 : 1;
    float _1338 = _921 * _1176;
    float _1340 = _1136;
    float _1342 = _1168;
    if (!_1158)
    {
        float _1344 = floor(_981);
        _1340 = _1344;
    }
    float _1346 = _1340;
    bool _1348 = !_1318;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = fma(_237, _1168, _1338);
    bool _1354 = !_1326;
    int _1356 = _1354 ? 0 : 1;
    bool _1358 = !_1330;
    int _1360 = _1358 ? 0 : 1;
    float _1362 = fma(_239, _1194, _1332);
    float _1364 = _1352;
    if (!_1308)
    {
        _1342 = _1204;
    }
    float _1366 = _1342;
    float _1368 = fma(_239, _1236, _1352);
    float _1370 = _1362 + _1202;
    float _1372 = _411 + _1310;
    float _1374 = _1368 + _1244;
    float _1376 = _1366;
    if (!_1308)
    {
        _1364 = _1372;
    }
    float _1378 = _1364;
    bool _1380 = !_1308;
    float _1382 = _1378;
    if (!_1380)
    {
        float _1384 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1388 = _1268 + _1386;
        float _1390 = _1372 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1392 = rsqrt(_1254);
        float _1394 = _1388 * _1384;
        float _1396 = _1394 * 0.15915493667125701904296875;
        float _1398 = _1396 * 6.283185482025146484375;
        float _1400 = cos(_1398);
        float _1402 = _1396 * 6.283185482025146484375;
        float _1404 = sin(_1402);
        float _1406 = _1400 + (-1.0);
        float _1408 = fma(_1404, _1390, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1410 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1412 = _1392 * _1408;
        float _1414 = fma(_1372, _1400, _1410);
        float _1416 = fma(_1224, _1412, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1418 = fma(_1208, _1412, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1382 = _1414;
        _1376 = _1416;
        _1214 = _1418;
    }
    float _1420 = _1382;
    float _1422 = _1376;
    float _1424 = _1214;
    int _1426 = _1053 + 88;
    uint _1428 = uint(int(uint(_1426) >> uint(2)));
    uint _1430 = uint(int(uint(int(_1428)) >> uint(2)));
    int _1432 = int(_1428) & 3;
    float _1434 = (*spvDescriptorSet0.vp_c15)._m0[int(_1430)][_1432];
    int _1436 = int(_1428) + 1;
    uint _1438 = uint(int(uint(_1436) >> uint(2)));
    int _1440 = _1436 & 3;
    float _1442 = (*spvDescriptorSet0.vp_c15)._m0[int(_1438)][_1440];
    float _1444 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1446 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1448 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1450 = _1370 * _1314;
    float _1452 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1444);
    float _1454 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1446);
    float _1456 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1448);
    float _1458 = _1224;
    if (!_1158)
    {
        int _1460 = _1294 + 400;
        uint _1462 = uint(int(uint(_1460) >> uint(2)));
        uint _1464 = uint(int(uint(int(_1462)) >> uint(2)));
        int _1466 = int(_1462) & 3;
        float _1468 = (*spvDescriptorSet0.vp_c15)._m0[int(_1464)][_1466];
        _1458 = _1468;
    }
    float _1470 = _1458;
    float _1472 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1452);
    bool _1474 = _1450 >= 0.0;
    float _1476 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1454);
    float _1478 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1480 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1456);
    float _1482 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1484 = _1374 * _1314;
    bool _1486 = _1450 <= 1.0;
    bool _1488 = _1486 && _1474;
    float _1490 = _1476 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1492 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1478);
    float _1494 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1496 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1498 = _1484 >= 0.0;
    bool _1500 = _1498 && _1488;
    float _1502 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1504 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1506 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1492);
    float _1508 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1496);
    bool _1510 = _1484 <= 1.0;
    bool _1512 = _1510 && _1500;
    float _1514 = -_1504;
    float _1516 = fma(_1514, _1502, 1.0);
    float _1518 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1520 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1508);
    float _1522 = _921 * _1286;
    float _1524 = _1362;
    float _1526 = _1476;
    if (!_1158)
    {
        float _1528 = floor(_991);
        _1524 = _1528;
    }
    float _1530 = _1524;
    float _1532 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1534 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1520);
    float _1536 = fma(_237, _1278, _1522);
    float _1538 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1540 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1532);
    float _1542 = log2(_1516);
    if (_1512)
    {
        float _1544 = float(_1035);
        _1526 = _1544;
    }
    float _1546 = _1526;
    float _1548 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1538);
    float _1550 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1540);
    float _1552 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1548);
    float _1554 = 1.0 / _1534;
    float _1556 = fma(_239, _1434, _1536);
    float _1558 = 0.0;
    float _1560 = _1548;
    if (!_1158)
    {
        float _1562 = -_1530;
        float _1564 = _991 + _1562;
        _1558 = _1564;
    }
    float _1566 = _1558;
    float _1568 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1550);
    float _1570 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1552);
    float _1572 = _1556 + _1442;
    float _1574 = _1532;
    float _1576 = _1568;
    if (_1512)
    {
        float _1578 = rint(_1546);
        float _1580 = precise::max(_1578, 0.0);
        uint _1582 = uint(_1580);
        uint _1584 = clamp(_1582, 0u, 65535u);
        _1574 = as_type<float>(_1584);
    }
    float _1586 = _1574;
    float _1588 = _1572 * _1314;
    float _1590 = _1542 * 0.693147182464599609375;
    float _1592 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1594 = _1590;
    if (!_1158)
    {
        float _1596 = -_1346;
        float _1598 = _981 + _1596;
        _1594 = _1598;
    }
    float _1600 = _1594;
    float _1602 = _1572;
    if (!_1158)
    {
        float _1604 = rint(_1470);
        float _1606 = precise::max(_1604, 0.0);
        uint _1608 = uint(_1606);
        uint _1610 = clamp(_1608, 0u, 65535u);
        _1602 = as_type<float>(_1610);
    }
    float _1612 = _1602;
    float _1614 = _1568 * _1554;
    float _1616 = _1570 * _1554;
    float _1618 = fma(_1614, 0.5, 0.5);
    float _1620 = fma(_1616, -0.5, 0.5);
    float _1622 = _1346;
    if (_1512)
    {
        float3 _6417 = float3(_1450, _1484, float(as_type<int>(_1586)));
        float3 _6421 = select(_6417, float3(0.0), isnan(_6417));
        float _1624 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6421.xy, uint(rint(_6421.z)), _1588, level(0.0));
        _1622 = _1624;
    }
    float _1626 = _1622;
    float3 _6431 = float3(_1618, _1620, _1592);
    float _1628 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6431, float3(0.0), isnan(_6431)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6431, float3(0.0), isnan(_6431)), level(0.0)).x;
    float3 _6440 = float3(_1618, _1620, _1592);
    float4 _1631 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6440, float3(0.0), isnan(_6440)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6440, float3(0.0), isnan(_6440)), level(0.0)).xyzw;
    float _1633 = _1631.x;
    float _1635 = _1631.y;
    float _1637 = _1631.z;
    float _1639 = _1631.w;
    float _1641 = _1566;
    if (!_1158)
    {
        float3 _6463 = float3(_1600, _1566, float(as_type<int>(_1612)));
        float3 _6465 = select(_6463, float3(0.0), isnan(_6463));
        float _1643 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6465.xy, uint(rint(_6465.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6465.xy, uint(rint(_6465.z)), level(0.0)).x;
        _1641 = _1643;
    }
    float _1645 = _1641;
    float _1647 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1649 = int(_1647);
    int _1651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1653 = _1651 != 0;
    int _1655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1657 = _1655 != 0;
    int _1659 = abs(_617);
    int _1661 = abs(_1336);
    float _1663 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1665 = int(_1663);
    int _1667 = abs(_1350);
    int _1669 = abs(_1356);
    int _1671 = abs(_1360);
    float _1673 = as_type<float>(_1661);
    if (_1653)
    {
        float _1675 = in.m_66.x;
        _1560 = _1675;
    }
    float _1677 = _1560;
    float _1679 = float(uint(_1649));
    float _1681 = trunc(_739);
    int _1683 = int(_1681);
    float _1685 = _1677;
    if (!_1653)
    {
        float _1687 = in.m_66.y;
        _1685 = _1687;
    }
    float _1689 = _1685;
    int _1691 = ~_1649;
    int _1693 = _1691 + 1;
    float _1695 = float(uint(_1665));
    float _1697 = 1.0 / _1679;
    int _1699 = ~_1665;
    int _1701 = _1699 + 1;
    float _1703 = 1.0 / _1695;
    float _1705 = trunc(_817);
    int _1707 = int(_1705);
    int _1709 = as_type<int>(_1697) + (-2);
    float _1711 = float(uint(_1683));
    float _1713 = float(_1683);
    int _1715 = as_type<int>(_1703) + (-2);
    float _1717 = as_type<float>(_1709) * _1711;
    float _1719 = _1711;
    if (_1653)
    {
        _1719 = 1.0;
    }
    float _1721 = _1719;
    float _1723 = _1721;
    if (!_1653)
    {
        _1723 = 7.345489978790283203125;
    }
    float _1725 = _1723;
    float _1727 = trunc(_1717);
    float _1729 = precise::max(_1727, 0.0);
    uint _1731 = uint(_1729);
    float _1733 = float(uint(_1707));
    float _1735 = _1725 * _259;
    float _1737 = as_type<float>(_1715) * _1733;
    float _1739 = _1733;
    if (_1653)
    {
        _1739 = 1.0;
    }
    float _1741 = _1739;
    float _1743 = floor(_1735);
    float _1745 = _1741;
    if (!_1653)
    {
        _1745 = 1.2345600128173828125;
    }
    float _1747 = _1745;
    float _1749 = _1689 * _1747;
    float _1751 = trunc(_1737);
    float _1753 = precise::max(_1751, 0.0);
    uint _1755 = uint(_1753);
    int _1757 = _1693 * int(_1731);
    int _1759 = _1757 + _1683;
    float _1761 = float(uint(_1759));
    float _1763 = floor(_1749);
    float _1765 = float(_1649);
    float _1767 = as_type<float>(_1709) * _1761;
    int _1769 = _1701 * int(_1755);
    int _1771 = _1769 + _1707;
    float _1773 = trunc(_1767);
    float _1775 = precise::max(_1773, 0.0);
    uint _1777 = uint(_1775);
    float _1779 = float(uint(_1771));
    float _1781 = -_1763;
    float _1783 = _1749 + _1781;
    float _1785 = float(_1665);
    float _1787 = as_type<float>(_1715) * _1779;
    float _1789 = -_1743;
    float _1791 = _1735 + _1789;
    int _1793 = ~_1649;
    int _1795 = _1793 + 1;
    bool _1797 = _1713 >= _1765;
    bool _1799 = isnan(_1713);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(_1765);
    bool _1805 = _1801 || _1803;
    float _1807 = float(_1805);
    float _1809 = _1783 * _1785;
    float _1811 = trunc(_1787);
    float _1813 = precise::max(_1811, 0.0);
    uint _1815 = uint(_1813);
    int _1817 = int(_1731) + int(_1777);
    float _1819 = _1791 * _1765;
    float _1821 = _1765 * _735;
    float _1823 = _1785 * _735;
    int _1825 = _1795 * _1817;
    int _1827 = _1825 + _1683;
    float _1829 = trunc(_1807);
    int _1831 = int(_1829);
    bool _1833 = uint(_1827) >= uint(_1649);
    bool _1835 = !_1833;
    int _1837 = _1835 ? 0 : (-1);
    float _1839 = trunc(_1819);
    int _1841 = int(_1839);
    int _1843 = int(_1755) + int(_1815);
    float _1845 = float(_1707);
    int _1847 = ~_1665;
    int _1849 = _1847 + 1;
    bool _1851 = _1845 >= _1785;
    bool _1853 = isnan(_1845);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan(_1785);
    bool _1859 = _1855 || _1857;
    float _1861 = float(_1859);
    float _1863 = trunc(_1809);
    int _1865 = int(_1863);
    int _1867 = _1849 * _1843;
    int _1869 = _1867 + _1707;
    int _1871 = ~_1817;
    int _1873 = _1871 + _1837;
    int _1875 = _1873 + 1;
    int _1877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1879 = _1877 != 0;
    int _1881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1883 = _1881 != 0;
    float _1885 = trunc(_1861);
    int _1887 = int(_1885);
    bool _1889 = uint(_1869) >= uint(_1665);
    bool _1891 = !_1879;
    int _1893 = _1891 ? 0 : 1;
    bool _1895 = !_1883;
    int _1897 = _1895 ? 0 : 1;
    int _1899 = abs(_1893);
    int _1901 = _1649 * _1875;
    int _1903 = _1901 + _1683;
    bool _1905 = !_1889;
    int _1907 = _1905 ? 0 : (-1);
    float _1909 = trunc(_1821);
    int _1911 = int(_1909);
    int _1913 = abs(_1897);
    bool _1915 = _1649 == 0;
    int _1917 = ~_1843;
    int _1919 = _1917 + _1907;
    int _1921 = _1919 + 1;
    int _1923 = _1841 * _1899;
    int _1925 = _1923 + _1683;
    float _1927 = trunc(_1823);
    int _1929 = int(_1927);
    int _1931 = ~_1831;
    int _1933 = _1931 + 1;
    int _1935 = _1933 + 1;
    int _1937 = _1665 * _1921;
    int _1939 = _1937 + _1707;
    bool _1941 = !_1915;
    int _1943 = _1941 ? _1903 : (-1);
    int _1945 = _1865 * _1913;
    int _1947 = _1945 + _1707;
    bool _1949 = _1665 == 0;
    int _1951 = ~_1887;
    int _1953 = _1951 + 1;
    int _1955 = _1953 + 1;
    int _1957 = _1943 * _1935;
    bool _1959 = !_1949;
    int _1961 = _1959 ? _1939 : (-1);
    int _1963 = _1649 + (-1);
    int _1965 = _1665 + (-1);
    int _1967 = _1961 * _1955;
    int _1969 = _1831 * _1963;
    int _1971 = _1969 + _1957;
    int _1973 = _1887 * _1965;
    int _1975 = _1973 + _1967;
    int _1977 = abs(_623);
    int _1979 = _1971 * _1659;
    bool _1981 = !_1657;
    int _1983 = _1981 ? 0 : 1;
    int _1985 = abs(_629);
    int _1987 = _1911 * _1977;
    int _1989 = _1987 + _1979;
    int _1991 = abs(_1983);
    int _1993 = _1975 * _1661;
    int _1995 = _1925 * _1985;
    int _1997 = _1995 + _1989;
    int _1999 = _1929 * _1667;
    int _2001 = _1999 + _1993;
    int _2003 = ~_1665;
    int _2005 = _2003 + 1;
    int _2007 = _1841 * _1991;
    int _2009 = _2007 + _1997;
    int _2011 = _1947 * _1669;
    int _2013 = _2011 + _2001;
    int _2015 = ~_1649;
    int _2017 = _2015 + 1;
    float _2019 = float(uint(_2009));
    int _2021 = _1865 * _1671;
    int _2023 = _2021 + _2013;
    int _2025 = ~_1649;
    int _2027 = _2025 + 1;
    int _2029 = ~_1665;
    int _2031 = _2029 + 1;
    float _2033 = as_type<float>(_1709) * _2019;
    float _2035 = float(uint(_2023));
    float _2037 = float(uint(_1925));
    float _2039 = trunc(_2033);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    float _2045 = as_type<float>(_1715) * _2035;
    float _2047 = as_type<float>(_1709) * _2037;
    float _2049 = trunc(_2045);
    float _2051 = precise::max(_2049, 0.0);
    uint _2053 = uint(_2051);
    int _2055 = _2017 * int(_2043);
    int _2057 = _2055 + _2009;
    float _2059 = trunc(_2047);
    float _2061 = precise::max(_2059, 0.0);
    uint _2063 = uint(_2061);
    float _2065 = float(uint(_2057));
    int _2067 = _2005 * int(_2053);
    int _2069 = _2067 + _2023;
    float _2071 = as_type<float>(_1709) * _2065;
    float _2073 = float(uint(_2069));
    int _2075 = ~_1649;
    int _2077 = _2075 + 1;
    float _2079 = trunc(_2071);
    float _2081 = precise::max(_2079, 0.0);
    uint _2083 = uint(_2081);
    float _2085 = as_type<float>(_1715) * _2073;
    float _2087 = float(uint(_1947));
    int _2089 = _2077 * int(_2063);
    int _2091 = _2089 + _1925;
    float _2093 = trunc(_2085);
    float _2095 = precise::max(_2093, 0.0);
    uint _2097 = uint(_2095);
    float _2099 = as_type<float>(_1715) * _2087;
    float _2101 = float(uint(_2091));
    int _2103 = ~_1665;
    int _2105 = _2103 + 1;
    float _2107 = as_type<float>(_1709) * _2101;
    float _2109 = trunc(_2099);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = int(_2043) + int(_2083);
    int _2117 = int(_2053) + int(_2097);
    int _2119 = _2027 * _2115;
    int _2121 = _2119 + _2009;
    float _2123 = trunc(_2107);
    float _2125 = precise::max(_2123, 0.0);
    uint _2127 = uint(_2125);
    int _2129 = _2031 * _2117;
    int _2131 = _2129 + _2023;
    bool _2133 = uint(_2121) >= uint(_1649);
    int _2135 = _2105 * int(_2113);
    int _2137 = _2135 + _1947;
    bool _2139 = !_2133;
    int _2141 = _2139 ? 0 : (-1);
    bool _2143 = uint(_2131) >= uint(_1665);
    float _2145 = float(uint(_2137));
    int _2147 = ~_2115;
    int _2149 = _2147 + _2141;
    int _2151 = _2149 + 1;
    bool _2153 = !_2143;
    int _2155 = _2153 ? 0 : (-1);
    float _2157 = as_type<float>(_1715) * _2145;
    int _2159 = int(_2063) + int(_2127);
    int _2161 = _1649 * _2151;
    int _2163 = _2161 + _2009;
    int _2165 = ~_2117;
    int _2167 = _2165 + _2155;
    int _2169 = _2167 + 1;
    float _2171 = as_type<float>(_2115);
    if (_1158)
    {
        _2171 = 1.0;
    }
    float _2173 = _2171;
    float _2175 = _2173;
    if (!_1158)
    {
        int _2177 = _1220 << 4;
        int _2179 = _2177 + 2048;
        uint _2181 = uint(int(uint(_2179) >> uint(2)));
        uint _2183 = uint(int(uint(int(_2181)) >> uint(2)));
        int _2185 = int(_2181) & 3;
        float _2187 = (*spvDescriptorSet0.vp_c15)._m0[int(_2183)][_2185];
        int _2189 = int(_2181) + 1;
        uint _2191 = uint(int(uint(_2189) >> uint(2)));
        int _2193 = _2189 & 3;
        float _2195 = (*spvDescriptorSet0.vp_c15)._m0[int(_2191)][_2193];
        int _2197 = _2179 + 8;
        uint _2199 = uint(int(uint(_2197) >> uint(2)));
        uint _2201 = uint(int(uint(int(_2199)) >> uint(2)));
        int _2203 = int(_2199) & 3;
        float _2205 = (*spvDescriptorSet0.vp_c15)._m0[int(_2201)][_2203];
        int _2207 = int(_2199) + 1;
        uint _2209 = uint(int(uint(_2207) >> uint(2)));
        int _2211 = _2207 & 3;
        float _2213 = (*spvDescriptorSet0.vp_c15)._m0[int(_2209)][_2211];
        float _2215 = _921 * _2195;
        float _2217 = fma(_237, _2187, _2215);
        float _2219 = fma(_239, _2205, _2217);
        float _2221 = _2219 + _2213;
        float _2223 = precise::clamp(_2221, 0.0, 1.0);
        float _2225 = -_2223;
        float _2227 = _2225 + _1645;
        float _2229 = fma(_2227, 500.0, 1.5);
        float _2231 = exp2(_2229);
        float _2233 = 0.0 + _2231;
        float _2235 = precise::clamp(_2233, 0.0, 1.0);
        _1248 = as_type<float>(_2179);
        _2175 = _2235;
    }
    float _2237 = _1248;
    float _2239 = _2175;
    float _2241 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2243 = _1420 + _2241;
    float _2245 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2247 = _1422 + _2245;
    float _2249 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2251 = _1424 + _2249;
    float _2253 = _2243 * _2243;
    float _2255 = fma(_2247, _2247, _2253);
    float _2257 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2259 = fma(_2251, _2251, _2255);
    float _2261 = rsqrt(_2259);
    float _2263 = sqrt(_2259);
    float _2265 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2267 = _2247 * _2265;
    float _2269 = _2251 * _2265;
    float _2271 = _2267 * _2267;
    float _2273 = _2269 * _2269;
    float _2275 = _2271 + _2273;
    float _2277 = sqrt(_2275);
    bool _2279 = _2277 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2283 = _2277 + _2281;
    float _2285 = _2237;
    float _2287 = _2275;
    float _2289 = _2283;
    float _2291 = _2257;
    float _2293 = _2267;
    float _2295 = _2269;
    float _2297 = _2271;
    float _2299 = _2273;
    if (_2279)
    {
        float _2301 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2285 = _2301;
    }
    float _2303 = _2285;
    if (_2279)
    {
        float _2305 = rsqrt(_2275);
        _2287 = _2305;
    }
    float _2307 = _2287;
    if (_2279)
    {
        float _2309 = _2283 * _2303;
        _2289 = _2309;
    }
    float _2311 = _2289;
    float _2313 = precise::max(0.0, _2257);
    float _2315 = _2313;
    if (_2279)
    {
        float _2317 = _2311 * 0.15915493667125701904296875;
        _1673 = _2317;
    }
    float _2319 = _1673;
    float _2321 = -_2265;
    float _2323 = -_2313;
    float _2325 = fma(_2243, _2321, _2323);
    float _2327 = as_type<float>(_2127);
    float _2329 = _2325;
    if (_2279)
    {
        float _2331 = _2319 * 6.283185482025146484375;
        float _2333 = sin(_2331);
        _2327 = _2333;
    }
    float _2335 = _2327;
    if (_2279)
    {
        float _2337 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2315 = _2337;
    }
    float _2339 = _2315;
    float _2341 = _2311;
    float _2343 = _2339;
    if (_2279)
    {
        float _2345 = _2319 * 6.283185482025146484375;
        float _2347 = cos(_2345);
        _2341 = _2347;
    }
    float _2349 = _2341;
    float _2351 = _2335;
    if (_2279)
    {
        float _2353 = fma(_2335, _2339, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2343 = _2353;
    }
    float _2355 = _2343;
    float _2357 = _2355;
    if (_2279)
    {
        float _2359 = _2307 * _2355;
        _2351 = _2359;
    }
    float _2361 = _2351;
    if (_2279)
    {
        float _2363 = _2349 + (-1.0);
        _2291 = _2363;
    }
    float _2365 = _2291;
    if (_2279)
    {
        float _2367 = _2267 * _2361;
        _2293 = _2367;
    }
    float _2369 = _2293;
    if (_2279)
    {
        float _2371 = _2269 * _2361;
        _2295 = _2371;
    }
    float _2373 = _2295;
    if (_2279)
    {
        float _2375 = _2365 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2357 = _2375;
    }
    float _2377 = _2357;
    if (_2279)
    {
        float _2379 = _2369 * _2369;
        _2297 = _2379;
    }
    float _2381 = _2297;
    if (_2279)
    {
        float _2383 = _2373 * _2373;
        _2299 = _2383;
    }
    float _2385 = _2299;
    int _2387 = ~_1649;
    int _2389 = _2387 + 1;
    if (_2279)
    {
        float _2391 = fma(_2325, _2349, _2377);
        _2329 = _2391;
    }
    float _2393 = _2329;
    float _2395 = fma(_2393, _2393, _2381);
    float _2397 = _2395 + _2385;
    float _2399 = rsqrt(_2397);
    float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2403 = fma(_2263, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2401);
    float _2405 = precise::clamp(_2403, 0.0, 1.0);
    float _2407 = -_2405;
    float _2409 = _2407 + 1.0;
    float _2411 = abs(_2409);
    float _2413 = log2(_2411);
    float _2415 = _2399 * _2369;
    float _2417 = _2399 * _2393;
    float _2419 = _2399 * _2373;
    float _2421 = _2415 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2423 = _2417 + 1.0;
    float _2425 = -_2421;
    float _2427 = fma(_2417, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2425);
    float _2429 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2431 = -_2419;
    float _2433 = fma(_2431, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2427);
    float _2435 = exp2(_2429);
    float _2437 = fma(_2433, -0.5, 0.5);
    float _2439 = fma(_2433, 0.5, 0.5);
    float _2441 = fma(_2439, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2443 = sqrt(_2437);
    float _2445 = fma(_2439, _2441, -0.212114393711090087890625);
    float _2447 = fma(_2439, _2445, 1.570728778839111328125);
    float _2449 = -_2417;
    float _2451 = fma(_2435, _2423, _2449);
    bool _2453 = !_1915;
    int _2455 = _2453 ? _2163 : (-1);
    int _2457 = _2455 & 3;
    bool _2459 = _2457 != 0;
    float _2461 = _2443 * 0.636619746685028076171875;
    int _2463 = _2455 & 3;
    bool _2465 = _2463 != 0;
    float _2467 = -_2447;
    float _2469 = fma(_2461, _2467, 1.0);
    float _2471 = fma(_2451, 0.5, 0.5);
    int _2473 = _2389 * _2159;
    int _2475 = _2473 + _1925;
    bool _2477 = uint(_2463) > 1u;
    float2 _7632 = float2(_2469, _2471);
    float3 _2481 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7632, float2(0.0), isnan(_7632)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7632, float2(0.0), isnan(_7632)), level(0.0)).xyz;
    float _2483 = _2481.x;
    float _2485 = _2481.y;
    float _2487 = _2481.z;
    bool _2489 = uint(_2475) >= uint(_1649);
    int _2491 = _1665 * _2169;
    int _2493 = _2491 + _2023;
    int _2495 = _2459 ? 0 : 1;
    float _2497 = trunc(_2157);
    float _2499 = precise::max(_2497, 0.0);
    uint _2501 = uint(_2499);
    int _2503 = _2455 >> 31;
    float _2505 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2507 = _265 > 0.5;
    float _2509 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2511 = ~_2495;
    int _2513 = _2511 + 1;
    int _2515 = _2513 + 1;
    float _2517 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2505);
    bool _2519 = !_1949;
    int _2521 = _2519 ? _2493 : (-1);
    float _2523 = -_813;
    float _2525 = _2523 + 1.0;
    int _2527 = _2515;
    if (!_2477)
    {
        int _2529 = ~_2495;
        int _2531 = _2529 + 1;
        _2527 = _2531;
    }
    int _2533 = _2527;
    float _2535 = exp2(_2509);
    int _2537 = _2503 & 3;
    float _2539 = -_803;
    float _2541 = _2539 + 1.0;
    int _2543 = _2521 >> 31;
    float _2545 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2517);
    int _2547 = _2455 + _2537;
    float _2549 = -_805;
    float _2551 = _2549 + 1.0;
    int _2553 = _2543 & 3;
    float _2555 = -_257;
    float _2557 = _2555 + 1.0;
    bool _2559 = !_2489;
    int _2561 = _2559 ? 0 : (-1);
    float _2563 = -_811;
    float _2565 = _2563 + 1.0;
    bool _2567 = _2463 != 3;
    out.m_72.x = _1422;
    out.m_72.y = _1420;
    out.m_72.z = _1424;
    int _2569 = _2547 >> 2;
    int _2571 = _2521 + _2553;
    float _2573 = -_2535;
    float _2575 = _2573 + 1.0;
    bool _2577 = uint(_2463) >= 2u;
    int _2579 = _2569 << 4;
    int _2581 = _2579 + 368;
    int _2583 = _2571 >> 2;
    int _2585 = _2577 ? 0 : 1;
    uint _2587 = uint(int(uint(_2581) >> uint(2)));
    uint _2589 = uint(int(uint(int(_2587)) >> uint(2)));
    int _2591 = int(_2587) & 3;
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[int(_2589)][_2591];
    int _2595 = int(_2587) + 1;
    uint _2597 = uint(int(uint(_2595) >> uint(2)));
    int _2599 = _2595 & 3;
    float _2601 = (*spvDescriptorSet0.vp_c9)._m0[int(_2597)][_2599];
    int _2603 = _2583 << 4;
    int _2605 = _2603 + 512;
    int _2607 = ~_2585;
    int _2609 = _2607 + 1;
    int _2611 = _2609 + 1;
    int _2613 = _2611;
    if (_2567)
    {
        int _2615 = ~_2585;
        int _2617 = _2615 + 1;
        _2613 = _2617;
    }
    int _2619 = _2613;
    int _2621 = ~_2159;
    int _2623 = _2621 + _2561;
    int _2625 = _2623 + 1;
    uint _2627 = uint(int(uint(_2605) >> uint(2)));
    uint _2629 = uint(int(uint(int(_2627)) >> uint(2)));
    int _2631 = int(_2627) & 3;
    float _2633 = (*spvDescriptorSet0.vp_c9)._m0[int(_2629)][_2631];
    int _2635 = int(_2627) + 1;
    uint _2637 = uint(int(uint(_2635) >> uint(2)));
    int _2639 = _2635 & 3;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[int(_2637)][_2639];
    int _2643 = int(_2113) + int(_2501);
    float _2645 = -_187;
    int _2647 = _2507 ? as_type<int>(_2645) : as_type<int>(_187);
    int _2649 = _1649 * _2625;
    int _2651 = _2649 + _1925;
    bool _2653 = !_2465;
    int _2655 = _2653 ? 0 : 1;
    int _2657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2659 = _2657 != 0;
    int _2661 = _2521 & 3;
    bool _2663 = _2661 != 0;
    int _2665 = _2521 & 3;
    bool _2667 = _2665 != 0;
    int _2669 = _2581 + 8;
    uint _2671 = uint(int(uint(_2669) >> uint(2)));
    uint _2673 = uint(int(uint(int(_2671)) >> uint(2)));
    int _2675 = int(_2671) & 3;
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[int(_2673)][_2675];
    int _2679 = int(_2671) + 1;
    uint _2681 = uint(int(uint(_2679) >> uint(2)));
    int _2683 = _2679 & 3;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[int(_2681)][_2683];
    int _2687 = ~_1665;
    int _2689 = _2687 + 1;
    bool _2691 = !_2659;
    int _2693 = _2691 ? 0 : 1;
    bool _2695 = uint(_2665) > 1u;
    int _2697 = _2689 * _2643;
    int _2699 = _2697 + _1947;
    bool _2701 = !_1915;
    int _2703 = _2701 ? _2651 : (-1);
    int _2705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2707 = _2705 != 0;
    bool _2709 = _2463 != 3;
    bool _2711 = !_2707;
    int _2713 = _2711 ? 0 : 1;
    int _2715 = _2605 + 8;
    uint _2717 = uint(int(uint(_2715) >> uint(2)));
    uint _2719 = uint(int(uint(int(_2717)) >> uint(2)));
    int _2721 = int(_2717) & 3;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[int(_2719)][_2721];
    int _2725 = int(_2717) + 1;
    uint _2727 = uint(int(uint(_2725) >> uint(2)));
    int _2729 = _2725 & 3;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[int(_2727)][_2729];
    int _2733 = _2663 ? 0 : 1;
    bool _2735 = uint(_2699) >= uint(_1665);
    bool _2737 = _2665 != 3;
    bool _2739 = !_2709;
    int _2741 = _2739 ? 0 : (-1);
    bool _2743 = !_2667;
    int _2745 = _2743 ? 0 : 1;
    bool _2747 = uint(_2665) >= 2u;
    bool _2749 = _2665 != 3;
    int _2751 = ~_2733;
    int _2753 = _2751 + 1;
    int _2755 = _2753 + 1;
    int _2757 = _2755;
    if (!_2695)
    {
        int _2759 = ~_2733;
        int _2761 = _2759 + 1;
        _2757 = _2761;
    }
    int _2763 = _2757;
    int _2765 = _2747 ? 0 : 1;
    bool _2767 = !_2749;
    int _2769 = _2767 ? 0 : (-1);
    int _2771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2773 = _2771 != 0;
    int _2775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2777 = _2775 != 0;
    int _2779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2781 = _2779 != 0;
    bool _2783 = !_2735;
    int _2785 = _2783 ? 0 : (-1);
    int _2787 = abs(_2533);
    bool _2789 = _259 > 0.5;
    int _2791 = ~_2643;
    int _2793 = _2791 + _2785;
    int _2795 = _2793 + 1;
    int _2797 = ~_2765;
    int _2799 = _2797 + 1;
    int _2801 = _2799 + 1;
    int _2803 = _1665 * _2795;
    int _2805 = _2803 + _1947;
    int _2807 = _2801;
    if (_2737)
    {
        int _2809 = ~_2765;
        int _2811 = _2809 + 1;
        _2807 = _2811;
    }
    int _2813 = _2807;
    int _2815 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2817 = _2815 != 0;
    int _2819 = abs(_2763);
    int _2821 = abs(_2655);
    int _2823 = ~_2787;
    int _2825 = _2823 + 1;
    int _2827 = _2825 + 1;
    int _2829 = abs(_2745);
    int _2831 = _2827 * as_type<int>(_2601);
    int _2833 = ~_2819;
    int _2835 = _2833 + 1;
    int _2837 = _2835 + 1;
    int _2839 = ~_2821;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    int _2845 = _2837 * as_type<int>(_2641);
    int _2847 = abs(_2813);
    int _2849 = abs(_2619);
    int _2851 = ~_2829;
    int _2853 = _2851 + 1;
    int _2855 = _2853 + 1;
    int _2857 = _2843 * as_type<int>(_2593);
    int _2859 = _2857 + _2831;
    int _2861 = ~_2849;
    int _2863 = _2861 + 1;
    int _2865 = _2863 + 1;
    float _2867 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2869 = int(_2867);
    int _2871 = _2855 * as_type<int>(_2633);
    int _2873 = _2871 + _2845;
    int _2875 = _2865 * as_type<int>(_2677);
    int _2877 = _2875 + _2859;
    float _2879 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2881 = abs(_2741);
    float _2883 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2885 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2887 = ~_2881;
    int _2889 = _2887 + 1;
    int _2891 = _2889 + 1;
    float _2893 = _2879 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2895 = _2883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2897 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2899 = _2885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2901 = _2891 * as_type<int>(_2685);
    int _2903 = _2901 + _2877;
    int _2905 = abs(_2869);
    float _2907 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2909 = int(_2907);
    int _2911 = abs(_2693);
    out.m_74.x = _2893;
    out.m_74.y = _2895;
    out.m_74.z = _2899;
    out.m_74.w = _2897;
    bool _2913 = !_1949;
    int _2915 = _2913 ? _2805 : (-1);
    float _2917 = float(uint(_2869));
    bool _2919 = _261 > 0.5;
    int _2921 = abs(_2769);
    int _2923 = ~_2847;
    int _2925 = _2923 + 1;
    int _2927 = _2925 + 1;
    float _2929 = 1.0 / _2917;
    int _2931 = ~_2921;
    int _2933 = _2931 + 1;
    int _2935 = _2933 + 1;
    int _2937 = _2927 * as_type<int>(_2723);
    int _2939 = _2937 + _2873;
    int _2941 = abs(_2713);
    float _2943 = abs(_975);
    float _2945 = log2(_2943);
    int _2947 = _2935 * as_type<int>(_2731);
    int _2949 = _2947 + _2939;
    float _2951 = float(uint(_2909));
    float _2953 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2955 = ~_2911;
    int _2957 = _2955 + 1;
    int _2959 = _2957 + 1;
    float _2961 = -_183;
    int _2963 = _2789 ? as_type<int>(_2961) : as_type<int>(_183);
    float _2965 = _2953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2967 = _263 > 0.5;
    int _2969 = _2903 * _2959;
    float _2971 = 1.0 / _2951;
    int _2973 = as_type<int>(_2929) + (-2);
    float _2975 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2977 = _2703 * _2911;
    int _2979 = _2977 + _2969;
    float _2981 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2983 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2985 = -_1007;
    float _2987 = fma(_2985, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2981);
    float _2989 = float(uint(_2979));
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2993 = ~_2941;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    float _2999 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3001 = abs(_2909);
    float _3003 = as_type<float>(_2973) * _2989;
    float _3005 = float(uint(_2905));
    int _3007 = _2949 * _2997;
    float _3009 = float(uint(_3001));
    float _3011 = exp2(_2983);
    float _3013 = _2991 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3015 = _2999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3017 = _2915 * _2941;
    int _3019 = _3017 + _3007;
    float _3021 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3023 = -_1007;
    float _3025 = fma(_3023, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2975);
    int _3027 = ~_2869;
    int _3029 = _3027 + 1;
    out.m_76.x = _2965;
    out.m_76.y = _3013;
    out.m_76.z = _3015;
    float _3031 = 1.0 / _3005;
    float _3033 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3035 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3037 = ~_3001;
    int _3039 = _3037 + 1;
    bool _3041 = !_2817;
    float _3043 = _3041 ? _183 : as_type<float>(_2963);
    bool _3045 = !_2773;
    float _3047 = _3045 ? _187 : as_type<float>(_2647);
    float _3049 = trunc(_3003);
    float _3051 = precise::max(_3049, 0.0);
    uint _3053 = uint(_3051);
    bool _3055 = _975 <= 8000.0;
    bool _3057 = isnan(_975);
    bool _3059 = _3055 || _3057;
    bool _3061 = isnan(8000.0);
    bool _3063 = _3059 || _3061;
    float _3065 = float(_3063);
    int _3067 = as_type<int>(_2971) + (-2);
    float _3069 = -_1007;
    float _3071 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3021);
    float _3073 = float(uint(_3019));
    float _3075 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2987);
    float _3077 = 1.0 / _3009;
    int _3079 = abs(_2979);
    float _3081 = as_type<float>(_3067) * _3073;
    int _3083 = as_type<int>(_3031) + (-2);
    float _3085 = fma(_3011, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3087 = precise::clamp(_3085, 0.0, 1.0);
    int _3089 = abs(_3019);
    float _3091 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3025);
    float _3093 = float(uint(_3079));
    float _3095 = trunc(_3081);
    float _3097 = precise::max(_3095, 0.0);
    uint _3099 = uint(_3097);
    int _3101 = _3029 * int(_3053);
    int _3103 = _3101 + _2979;
    float _3105 = float(uint(_3089));
    float _3107 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3071);
    float _3109 = as_type<float>(_3083) * _3093;
    float _3111 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3033);
    float _3113 = float(uint(_3103));
    float _3115 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3035);
    int _3117 = as_type<int>(_3077) + (-2);
    float _3119 = trunc(_3109);
    float _3121 = precise::max(_3119, 0.0);
    uint _3123 = uint(_3121);
    int _3125 = ~_2909;
    int _3127 = _3125 + 1;
    float _3129 = as_type<float>(_3117) * _3105;
    float _3131 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3133 = as_type<float>(_2973) * _3113;
    float _3135 = trunc(_3129);
    float _3137 = precise::max(_3135, 0.0);
    uint _3139 = uint(_3137);
    int _3141 = ~_2905;
    int _3143 = _3141 + 1;
    float _3145 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3131);
    float _3147 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3149 = _3127 * int(_3099);
    int _3151 = _3149 + _3019;
    float _3153 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3155 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3157 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3147);
    int _3159 = _3143 * int(_3123);
    int _3161 = _3159 + _3079;
    float _3163 = float(uint(_3151));
    float _3165 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3153);
    float _3167 = trunc(_3133);
    float _3169 = precise::max(_3167, 0.0);
    uint _3171 = uint(_3169);
    float _3173 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3155);
    float _3175 = float(uint(_3161));
    float _3177 = as_type<float>(_3067) * _3163;
    float _3179 = -_183;
    int _3181 = _2967 ? as_type<int>(_3179) : as_type<int>(_183);
    int _3183 = _3039 * int(_3139);
    int _3185 = _3183 + _3089;
    float _3187 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3115);
    float _3189 = as_type<float>(_3083) * _3175;
    float _3191 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3111);
    float _3193 = trunc(_3177);
    float _3195 = precise::max(_3193, 0.0);
    uint _3197 = uint(_3195);
    float _3199 = float(uint(_3185));
    float _3201 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3145);
    bool _3203 = !_2781;
    float _3205 = _3203 ? _183 : as_type<float>(_3181);
    float _3207 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3209 = -_187;
    int _3211 = _2919 ? as_type<int>(_3209) : as_type<int>(_187);
    float _3213 = as_type<float>(_3117) * _3199;
    float _3215 = trunc(_3189);
    float _3217 = precise::max(_3215, 0.0);
    uint _3219 = uint(_3217);
    bool _3221 = !_2777;
    float _3223 = _3221 ? _187 : as_type<float>(_3211);
    float _3225 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3165);
    int _3227 = ~_2909;
    int _3229 = _3227 + 1;
    float _3231 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3233 = _3207 * _3075;
    int _3235 = int(_3053) + int(_3171);
    float _3237 = fma(_3087, -2.0, 3.0);
    float _3239 = trunc(_3213);
    float _3241 = precise::max(_3239, 0.0);
    uint _3243 = uint(_3241);
    int _3245 = int(_3099) + int(_3197);
    float _3247 = _3087 * _3087;
    int _3249 = ~_2905;
    int _3251 = _3249 + 1;
    float _3253 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3157);
    float _3255 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3173);
    int _3257 = _3229 * _3245;
    int _3259 = _3257 + _3019;
    float _3261 = fma(_3231, _3187, _3233);
    out.m_78.x = _3187;
    out.m_78.y = _3191;
    out.m_78.z = _3201;
    int _3263 = ~_2869;
    int _3265 = _3263 + 1;
    float _3267 = _3247 * _3237;
    int _3269 = ~_3001;
    int _3271 = _3269 + 1;
    int _3273 = int(_3123) + int(_3219);
    int _3275 = _3265 * _3235;
    int _3277 = _3275 + _2979;
    bool _3279 = uint(_3259) >= uint(_2909);
    int _3281 = int(_3139) + int(_3243);
    bool _3283 = !_3279;
    int _3285 = _3283 ? 0 : (-1);
    bool _3287 = uint(_3277) >= uint(_2869);
    int _3289 = _3251 * _3273;
    int _3291 = _3289 + _3079;
    int _3293 = ~_3245;
    int _3295 = _3293 + _3285;
    int _3297 = _3295 + 1;
    int _3299 = _3271 * _3281;
    int _3301 = _3299 + _3089;
    int _3303 = _2979 ^ _2869;
    float _3305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3307 = uint(_3291) >= uint(_2905);
    int _3309 = _2909 * _3297;
    int _3311 = _3309 + _3019;
    bool _3313 = !_3287;
    int _3315 = _3313 ? 0 : (-1);
    bool _3317 = uint(_3301) >= uint(_3001);
    bool _3319 = !_3307;
    int _3321 = _3319 ? 0 : (-1);
    float _3323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3325 = uint(int(uint(_3303) >> uint(31)));
    int _3327 = ~_3235;
    int _3329 = _3327 + _3315;
    int _3331 = _3329 + 1;
    int _3333 = ~_3321;
    int _3335 = _3273 + _3333;
    int _3337 = _3335 + 1;
    int _3339 = ~int(_3325);
    int _3341 = _3339 + 1;
    int _3343 = _2869 * _3331;
    int _3345 = _3343 + _2979;
    int _3347 = _3019 ^ _2909;
    float _3349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3351 = _3337 ^ _3341;
    bool _3353 = _2869 == 0;
    bool _3355 = _2909 == 0;
    float _3357 = _3323 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3359 = _2909 == 0;
    int _3361 = ~_3341;
    int _3363 = _3361 + _3351;
    int _3365 = _3363 + 1;
    float _3367 = _3305 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3369 = !_3317;
    int _3371 = _3369 ? 0 : (-1);
    uint _3373 = uint(int(uint(_3347) >> uint(31)));
    float _3375 = fma(_3207, _3207, 1.0);
    bool _3377 = !_3353;
    int _3379 = _3377 ? _3345 : (-1);
    bool _3381 = _2869 == 0;
    int _3383 = ~_3371;
    int _3385 = _3281 + _3383;
    int _3387 = _3385 + 1;
    float _3389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3391 = ~int(_3373);
    int _3393 = _3391 + 1;
    bool _3395 = !_3355;
    int _3397 = _3395 ? _3311 : (-1);
    float _3399 = float(_3379);
    int _3401 = _3387 ^ _3393;
    float _3403 = rsqrt(_3375);
    float _3405 = float(_3397);
    float _3407 = fma(_3367, _3399, _333);
    float _3409 = _3043 + 0.5;
    int _3411 = ~_3393;
    int _3413 = _3411 + _3401;
    int _3415 = _3413 + 1;
    bool _3417 = !_3381;
    int _3419 = _3417 ? _3365 : (-1);
    float _3421 = fma(_3357, _3405, _809);
    float _3423 = fma(_3367, _3409, _3407);
    float _3425 = _3205 + 0.5;
    bool _3427 = !_3359;
    int _3429 = _3427 ? _3415 : (-1);
    float _3431 = _3349 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3433 = float(_3419);
    float _3435 = fma(_3357, _3425, _3421);
    float _3437 = float(_3429);
    float _3439 = _3389 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3441 = _3223 + (-0.5);
    float _3443 = -_399;
    float _3445 = fma(_3431, _3433, _3443);
    float _3447 = _3047 + (-0.5);
    float _3449 = -_819;
    float _3451 = fma(_3439, _3437, _3449);
    float _3453 = _3207 * _3403;
    float _3455 = -_3431;
    float _3457 = fma(_3455, _3441, _3445);
    float _3459 = -_2541;
    float _3461 = fma(_3205, _3459, _3435);
    float _3463 = -_3439;
    float _3465 = fma(_3463, _3447, _3451);
    float _3467 = -_3225;
    float _3469 = _3453 * _3467;
    float _3471 = fma(_3223, _2525, _3457);
    float _3473 = -_3267;
    float _3475 = _3473 + 1.0;
    float _3477 = -_3253;
    float _3479 = _3453 * _3477;
    float _3481 = fma(_3403, _3091, _3469);
    float _3483 = _3207 * _3091;
    float _3485 = fma(_3475, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3267);
    float _3487 = -_3255;
    float _3489 = _3453 * _3487;
    float _3491 = fma(_3403, _3075, _3479);
    float _3493 = fma(_3231, _3191, _3483);
    float _3495 = _3065 * _3485;
    float _3497 = fma(_3403, _3107, _3489);
    float _3499 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2545);
    float _3501 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3503 = _3501;
    if (!_1512)
    {
        _1576 = 1.0;
    }
    float _3505 = _1576;
    float _3507 = fma(_3047, _2551, _3465);
    float _3509 = _3505;
    if (_1512)
    {
        bool _3511 = _1626 >= _1588;
        bool _3513 = isnan(_1626);
        bool _3515 = _3511 || _3513;
        bool _3517 = isnan(_1588);
        bool _3519 = _3515 || _3517;
        float _3521 = float(_3519);
        _3509 = _3521;
    }
    float _3523 = _3509;
    float _3525 = _2575 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3527 = _2557 * _3501;
    float _3529 = precise::clamp(_3527, 0.0, 1.0);
    float _3531 = -_2565;
    float _3533 = fma(_3043, _3531, _3423);
    float _3535 = _3499 + _1534;
    float _3537 = _3207 * _3107;
    float _3539 = _3523 * _2239;
    float _3541 = _3525 * _1628;
    float _3543 = -_3529;
    float _3545 = fma(_3543, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3547 = _3535 * 0.5;
    float _3549 = fma(_3231, _3201, _3537);
    float _3551 = _1639 * _3541;
    float _3553 = -_3539;
    float _3555 = fma(_3553, _3545, 1.0);
    float _3557 = precise::clamp(_3555, 0.0, 1.0);
    float _3559 = _2487 * _3541;
    float _3561 = -_3525;
    float _3563 = _3561 + 1.0;
    out.m_80.z = _3547;
    out.m_80.w = _1534;
    float _3565 = _3253 + _3261;
    float _3567 = _3225 + _3493;
    float _3569 = _3255 + _3549;
    float _3571 = fma(_2483, _3551, _1633);
    float _3573 = fma(_2485, _3551, _1635);
    float _3575 = _1639 * _3563;
    float _3577 = fma(_1639, _3559, _1637);
    out.m_82.x = _3491;
    out.m_82.y = _3481;
    out.m_82.z = _3497;
    bool _3579 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3581 = isnan(_2263);
    bool _3583 = _3579 || _3581;
    bool _3585 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3587 = _3583 || _3585;
    float _3589 = _3557 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_84.x = _3533;
    out.m_84.y = _3471;
    out.m_84.z = _3461;
    out.m_84.w = _3507;
    out.gl_Position.x = _1568;
    out.gl_Position.y = _1570;
    out.gl_Position.z = _3499;
    out.gl_Position.w = _1534;
    out.m_86.x = _3589;
    float _3591 = _3547;
    float _3593 = _3535;
    float _3595 = _3539;
    float _3597 = _3557;
    float _3599 = _3551;
    if (!_3587)
    {
        _3591 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3601 = _3591;
    out.m_88.x = _3571;
    out.m_88.y = _3573;
    out.m_88.z = _3577;
    out.m_88.w = _3575;
    float _3603 = _3601;
    float _3605 = _3601;
    if (!_3587)
    {
        _3593 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3607 = _3593;
    float _3609 = _3607;
    float _3611 = _3607;
    if (!_3587)
    {
        _3503 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3613 = _3503;
    out.m_90.x = _3565;
    out.m_90.y = _3567;
    out.m_90.z = _3569;
    float _3615 = _3613;
    float _3617 = _3613;
    if (!_3587)
    {
        _3595 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3619 = _3595;
    float _3621 = _3619;
    float _3623 = _3619;
    if (!_3587)
    {
        _3597 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3625 = _3597;
    float _3627 = _3625;
    float _3629 = _3625;
    if (!_3587)
    {
        _3599 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3631 = _3599;
    bool _3633 = !_3587;
    float _3635 = _3631;
    float _3637 = _3631;
    if (!_3633)
    {
        bool _3639 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3641 = isnan(_2263);
        bool _3643 = _3639 || _3641;
        bool _3645 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3647 = _3643 || _3645;
        if (!_3647)
        {
            float _3649 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3651 = _2263 + _3649;
            float _3653 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3655 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3653;
            float _3657 = 1.0 / _3655;
            float _3659 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3661 = _3659 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3663 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3665 = _3663 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3667 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3669 = _3667 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3671 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3673 = _3671 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3675 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3677 = _3675 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3679 = _3651 * _3657;
            float _3681 = precise::clamp(_3679, 0.0, 1.0);
            float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3685 = _3683 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3687 = fma(_3681, _3661, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3689 = fma(_3681, _3685, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3691 = fma(_3681, _3665, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3693 = fma(_3681, _3669, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3695 = fma(_3681, _3673, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3697 = fma(_3681, _3677, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3611 = _3689;
            _3629 = _3695;
            _3605 = _3687;
            _3623 = _3693;
            _3617 = _3691;
            _3637 = _3697;
            _3699 = true;
        }
        else
        {
            bool _3701 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3703 = isnan(_2263);
            bool _3705 = _3701 || _3703;
            bool _3707 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3709 = _3705 || _3707;
            if (!_3709)
            {
                _3603 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3711 = _3603;
            _3605 = _3711;
            if (!_3709)
            {
                _3609 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3713 = _3609;
            _3611 = _3713;
            if (!_3709)
            {
                _3615 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3715 = _3615;
            _3617 = _3715;
            if (!_3709)
            {
                _3621 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3717 = _3621;
            _3623 = _3717;
            if (!_3709)
            {
                _3627 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3719 = _3627;
            _3629 = _3719;
            if (!_3709)
            {
                _3635 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3721 = _3635;
            bool _3723 = !_3709;
            _3637 = _3721;
            if (!_3723)
            {
                bool _3725 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3727 = isnan(_2263);
                bool _3729 = _3725 || _3727;
                bool _3731 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3733 = _3729 || _3731;
                if (!_3733)
                {
                    float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3737 = _2263 + _3735;
                    float _3739 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3741 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3739;
                    float _3743 = 1.0 / _3741;
                    float _3745 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3747 = _3745 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3749 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3751 = _3749 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3753 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3755 = _3753 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3757 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3759 = _3757 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3761 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3763 = _3761 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3765 = _3737 * _3743;
                    float _3767 = precise::clamp(_3765, 0.0, 1.0);
                    float _3769 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3771 = _3769 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3773 = fma(_3767, _3747, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3775 = fma(_3767, _3771, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3777 = fma(_3767, _3751, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3779 = fma(_3767, _3755, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3781 = fma(_3767, _3759, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3783 = fma(_3767, _3763, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3611 = _3775;
                    _3629 = _3781;
                    _3605 = _3773;
                    _3623 = _3779;
                    _3617 = _3777;
                    _3637 = _3783;
                    _3699 = true;
                }
                else
                {
                    _3611 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3629 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3605 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3623 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3617 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3637 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3699 = false;
    float _3785 = _3611;
    float _3787 = _3629;
    float _3789 = _3605;
    float _3791 = _3623;
    float _3793 = _3617;
    float _3795 = _3637;
    float _3797 = fma(_3567, -0.5, 0.5);
    float _3799 = precise::clamp(_3797, 0.0, 1.0);
    float _3801 = -_3785;
    float _3803 = _3801 + _3787;
    float _3805 = -_3789;
    float _3807 = _3805 + _3791;
    float _3809 = -_3793;
    float _3811 = _3809 + _3795;
    bool _3813 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3815 = fma(_3799, _3803, _3785);
    float _3817 = fma(_3799, _3807, _3789);
    float _3819 = fma(_3799, _3811, _3793);
    float _3821 = _3815 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _3823 = fma(_3817, 0.298911988735198974609375, _3821);
    float _3825 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3827 = fma(_3819, 0.114477999508380889892578125, _3823);
    out.m_59.x = _3825;
    float _3829 = -_3827;
    float _3831 = _3817 + _3829;
    float _3833 = -_3827;
    float _3835 = _3815 + _3833;
    float _3837 = -_3827;
    float _3839 = _3819 + _3837;
    float _3841 = fma(_3831, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3827);
    float _3843 = fma(_3835, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3827);
    float _3845 = fma(_3839, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3827);
    out.m_94.x = _3841;
    out.m_94.y = _3843;
    out.m_94.z = _3845;
    if (!_3813)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3847 = -_1420;
    float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3851 = -_1422;
    float _3853 = _3851 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3855 = -_1424;
    float _3857 = _3855 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3859 = _3849 * _3849;
    float _3861 = fma(_3853, _3853, _3859);
    float _3863 = fma(_3857, _3857, _3861);
    float _3865 = sqrt(_3863);
    float _3867 = rsqrt(_3863);
    float _3869 = -_3865;
    float _3871 = _3869 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3873 = _3871 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3875 = precise::clamp(_3873, 0.0, 1.0);
    float _3877 = _3853 * _3867;
    float _3879 = _3849 * _3867;
    float _3881 = abs(_3875);
    float _3883 = log2(_3881);
    float _3885 = _3857 * _3867;
    float _3887 = _3877 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3889 = _3567 * _3879;
    float _3891 = -_3879;
    float _3893 = -_3887;
    float _3895 = fma(_3891, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3893);
    float _3897 = fma(_3565, _3877, _3889);
    float _3899 = -_3885;
    float _3901 = fma(_3899, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3895);
    float _3903 = fma(_3569, _3885, _3897);
    float _3905 = precise::clamp(_3903, 0.0, 1.0);
    float _3907 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3909 = _3901 + _3907;
    float _3911 = _3883 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3913 = _3909 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3915 = precise::clamp(_3913, 0.0, 1.0);
    float _3917 = exp2(_3911);
    float _3919 = _3917 * _3915;
    float _3921 = _3905 * _3919;
    float _3923 = _3921 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3925 = _3921 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3927 = _3921 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _3923;
    out.m_92.y = _3925;
    out.m_92.z = _3927;
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
    bool _3699 = false;
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
        float _3984 = as_type<float>(_129);
        out.gl_Position.z = _3984;
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
        float _4054 = as_type<float>(_167);
        out.gl_Position.z = _4054;
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
    float2 _4203 = float2(_251, _255);
    float _257 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4203, float2(0.0), isnan(_4203)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4203, float2(0.0), isnan(_4203)), level(0.0)).x;
    float _259 = in.m_66.x;
    float _261 = in.m_66.y;
    float _263 = in.m_66.z;
    float _265 = in.m_66.w;
    float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _269 = log2(_267);
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _281 = _279 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _283 = 1.0 / _273;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _289 = _287 != 0;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _297 = 1.0 / _281;
    float _299 = _269 * _147;
    float _301 = _259 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _303 = 1.0 / _293;
    float _305 = -_285;
    float _307 = fma(_301, 2.0, _305);
    float _309 = _261 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _311 = _261 * 2.0;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _321 = fma(_309, -2.0, _295);
    float _323 = 1.0 / _277;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _327 = _217 + _325;
    float _329 = _259 * 2.0;
    float _331 = -_147;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[76].x, _307);
    float _335 = _327 * _297;
    float _337 = _263 * 2.0;
    float _339 = floor(_329);
    float _341 = _221 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _345 = _217 + _343;
    float _347 = fma(_319, _335, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _351 = fma(_219, (*spvDescriptorSet0.vp_c10)._m0[5].x, _341);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _217 + _353;
    float _357 = _345 * _283;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _361 = _217 + _359;
    float _363 = floor(_337);
    float _365 = _355 * _303;
    float _367 = _259 + _261;
    float _369 = _361 * _323;
    float _371 = _263 + _259;
    float _373 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[5].z, _351);
    float _375 = _367 + (-1.0);
    float _377 = _263 + _261;
    float _379 = _371 + (-1.0);
    float _381 = floor(_311);
    bool _383 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _385 = isnan(_217);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = fma(_315, _369, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _397 = _339 > 0.0;
    float _399 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _321);
    bool _401 = _339 >= 0.0;
    bool _403 = isnan(_339);
    bool _405 = _401 || _403;
    bool _407 = isnan(0.0);
    bool _409 = _405 || _407;
    float _411 = _373 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _413 = _363 > 0.0;
    float _415 = exp2(_299);
    float _417 = _377 + (-1.0);
    float _419 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _421 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _423 = isnan(_217);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _433;
    bool _437 = _363 >= 0.0;
    bool _439 = isnan(_363);
    bool _441 = _437 || _439;
    bool _443 = isnan(0.0);
    bool _445 = _441 || _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = -_431;
    float _461 = _459 + 1.0;
    bool _463 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _465 = isnan(_217);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = fma(_453, _365, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _477 = fma(_457, _365, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _479 = _393 * _461;
    float _481 = -_393;
    float _483 = _481 + 1.0;
    bool _485 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _487 = isnan(_217);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -_473;
    float _499 = _497 + 1.0;
    bool _501 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _503 = isnan(_217);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = fma(_435, _357, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _515 = fma(_449, _357, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _517 = _495 * _499;
    float _519 = -_495;
    float _521 = _519 + 1.0;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _523;
    bool _527 = _381 > 0.0;
    float _529 = _511 * _521;
    bool _531 = _381 >= 0.0;
    bool _533 = isnan(_381);
    bool _535 = _531 || _533;
    bool _537 = isnan(0.0);
    bool _539 = _535 || _537;
    float _541 = fma(_525, _369, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _543 = as_type<int>(_381);
    float _545 = _513;
    if (_289)
    {
        _543 = 0;
    }
    int _547 = _543;
    float _549 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _551 = _547;
    if (!_289)
    {
        _551 = 1;
    }
    int _553 = _551;
    float _555 = _513 * _529;
    float _557 = _515 * _529;
    int _559 = _409 ? 0 : 1;
    float _561 = _473 * _483;
    int _563 = _445 ? 0 : 1;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _569 = _553 != 1;
    float _571 = -_415;
    float _573 = _571 + 1.0;
    float _575 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _577 = int(_575);
    int _579 = ~_563;
    int _581 = _579 + 1;
    int _583 = _581 + 1;
    float _585 = fma(_567, _335, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _587 = _583;
    if (!_413)
    {
        int _589 = ~_563;
        int _591 = _589 + 1;
        _587 = _591;
    }
    int _593 = _587;
    float _595 = _411 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _599 = _597 != 0;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _607 = _605 != 0;
    float _609 = _411 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _611 = fma(_237, (*spvDescriptorSet0.vp_c8)._m0[11].x, _595);
    float _613 = fma(_237, (*spvDescriptorSet0.vp_c8)._m0[10].x, _609);
    bool _615 = !_603;
    int _617 = _615 ? 0 : 1;
    float _619 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _621 = !_599;
    int _623 = _621 ? 0 : 1;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _627 = !_607;
    int _629 = _627 ? 0 : 1;
    float _631 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[11].z, _611);
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _635 = _633 != 0;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _639 = _637 != 0;
    int _641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _643 = _641 != 0;
    float _645 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[10].z, _613);
    int _647 = ~_559;
    int _649 = _647 + 1;
    int _651 = _649 + 1;
    int _653 = _651;
    if (!_569)
    {
        _545 = _261;
    }
    float _655 = _545;
    float _657 = _645 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _659 = _655;
    if (!_397)
    {
        int _661 = ~_559;
        int _663 = _661 + 1;
        _653 = _663;
    }
    int _665 = _653;
    if (_569)
    {
        _659 = _259;
    }
    float _667 = _659;
    float _669 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _671 = int(_669);
    float _673 = float(_113);
    bool _675 = !_639;
    float _677 = _675 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _679 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[83].z, _625);
    float _681 = float(_577);
    float _683 = 1.0 / _673;
    float _685 = _539 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _689 = _667;
    float _691 = _677;
    float _693 = _685;
    if (!_569)
    {
        _689 = _263;
    }
    float _695 = _689;
    int _697 = abs(as_type<int>(_677));
    float _699 = _695;
    if (!_569)
    {
        _691 = _263;
    }
    float _701 = _691;
    float _703 = 1.0 / _681;
    float _705 = _701;
    if (_569)
    {
        _699 = _261;
    }
    float _707 = _699;
    if (_569)
    {
        _705 = _261;
    }
    float _709 = _705;
    int _711 = ~as_type<int>(_685);
    int _713 = _711 + 1;
    int _715 = _713 + 1;
    float _717 = _707 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _719 = _715;
    if (!_527)
    {
        int _721 = ~as_type<int>(_685);
        int _723 = _721 + 1;
        _719 = _723;
    }
    int _725 = _719;
    float _727 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[83].w, _687);
    if (!_569)
    {
        _693 = _261;
    }
    float _729 = _693;
    float _731 = fma(_717, -2.0, _349);
    float _733 = float(_665);
    float _735 = _683 * _147;
    float _737 = float(_697);
    float _739 = _703 * _147;
    float _741 = _729;
    if (_569)
    {
        _741 = _259;
    }
    float _743 = _741;
    float _745 = _737 * _733;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _749 = float(_671);
    float _751 = _743 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _753 = in.m_68.x;
    float _755 = in.m_68.y;
    float _757 = in.m_68.z;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _761 = 1.0 + _759;
    float _763 = -_747;
    float _765 = fma(_751, 2.0, _763);
    float _767 = 1.0 / _749;
    bool _769 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _771 = isnan(1.0);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _777 = _773 || _775;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _781 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _783 = isnan(0.0);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _789 = _785 || _787;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _793 = _631 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _795 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[78].w, _779);
    float _797 = _789 ? _573 : 0.0;
    float _799 = 1.0 / _761;
    float _801 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[78].z, _791);
    float _803 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _679);
    float _805 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _727);
    float _807 = -_147;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[81].x, _765);
    float _811 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _801);
    float _813 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _795);
    float _815 = _745 * (-2.0);
    float _817 = _767 * _147;
    float _819 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _731);
    bool _821 = !_643;
    int _823 = _821 ? 0 : 1;
    float _825 = _657 + _793;
    float _827 = float(_725);
    float _829 = 1.0 / _793;
    if (_777)
    {
        float _831 = _797 * _799;
        _149 = _831;
    }
    float _833 = _149;
    float _835 = fma(_815, _755, _755);
    bool _837 = !_635;
    int _839 = _837 ? 0 : 1;
    float _841 = fma(_549, _815, _549);
    float _843 = _261 + (-0.5);
    int _845 = abs(_823);
    int _847 = abs(_839);
    float _849 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[196].y, _835);
    float _851 = -_511;
    float _853 = _851 + 1.0;
    float _855 = float(_845);
    float _857 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].x, _555);
    float _859 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].y, _557);
    float _861 = _855 * _827;
    float _863 = float(_847);
    float _865 = _259 + (-0.5);
    float _867 = float(_593);
    float _869 = fma(_475, _517, _857);
    float _871 = _825 * _829;
    float _873 = _871 * 0.5;
    float _875 = fma(_477, _517, _859);
    float _877 = fma(_841, _833, _849);
    float _879 = _863 * _867;
    float _881 = fma(_541, _561, _869);
    float _883 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _885 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[30].w, _883);
    float _887 = fma(_395, _561, _875);
    float _889 = _879 * (-2.0);
    float _891 = fma(_585, _479, _881);
    float _893 = in.m_70.x;
    float _895 = in.m_70.y;
    float _897 = _877 * 0.15915493667125701904296875;
    float _899 = fma(_889, _753, _753);
    float _901 = fma(_619, _889, _619);
    float _903 = _861 * (-2.0);
    float _905 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[147].x, _891);
    float _907 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[196].x, _899);
    float _909 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _911 = fma(_903, _757, _757);
    float _913 = fma(_419, _903, _419);
    float _915 = fma(_901, _833, _907);
    float _917 = _263 + (-0.5);
    float _919 = 1.0 / _885;
    float _921 = _411 + _909;
    float _923 = _915 * 0.15915493667125701904296875;
    float _925 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[196].z, _911);
    float _927 = fma(_347, _479, _887);
    float _929 = _921 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _931 = fma(_913, _833, _925);
    float _933 = _897 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[147].y, _927);
    float _939 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _941 = _931 * 0.15915493667125701904296875;
    float _943 = _905 * _893;
    float _945 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _947 = _937 * _895;
    float _949 = _921 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _951 = _943 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _953 = _897 * 6.283185482025146484375;
    float _955 = cos(_953);
    float _957 = fma(_237, (*spvDescriptorSet0.vp_c15)._m0[127].x, _949);
    float _959 = _951 * _945;
    float _961 = fma(_237, (*spvDescriptorSet0.vp_c15)._m0[126].x, _929);
    float _963 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _965 = _947 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _967 = _923 * 6.283185482025146484375;
    float _969 = sin(_967);
    float _971 = fma(_239, (*spvDescriptorSet0.vp_c15)._m0[126].z, _961);
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _975 = _919 * _973;
    float _977 = _965 * _963;
    float _979 = fma(_239, (*spvDescriptorSet0.vp_c15)._m0[127].z, _957);
    float _981 = _971 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _983 = _975 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _985 = _923 * 6.283185482025146484375;
    float _987 = cos(_985);
    bool _989 = _975 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _991 = _979 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _993 = _941 * 6.283185482025146484375;
    float _995 = cos(_993);
    float _997 = _969 * _935;
    float _999 = _969 * _955;
    int _1001 = 2;
    if (!_983)
    {
        _1001 = 1;
    }
    int _1003 = _1001;
    float _1005 = _941 * 6.283185482025146484375;
    float _1007 = sin(_1005);
    float _1009 = _987 * _955;
    float _1011 = _987 * _935;
    float _1013 = _969 * _995;
    float _1015 = _955 * _995;
    float _1017 = _987 * _995;
    float _1019 = _935 * _995;
    bool _1021 = !_983;
    int _1023 = _1021 ? 0 : 1;
    float _1025 = trunc(_981);
    int _1027 = int(_1025);
    float _1029 = _1017 * _977;
    float _1031 = fma(_1007, _1009, _997);
    int _1033 = _1003;
    if (!_989)
    {
        _1033 = _1023;
    }
    int _1035 = _1033;
    float _1037 = fma(_1007, _997, _1009);
    float _1039 = -_977;
    float _1041 = _1007 * _1039;
    float _1043 = _1013 * _977;
    float _1045 = -_1011;
    float _1047 = fma(_1007, _999, _1045);
    float _1049 = trunc(_991);
    int _1051 = int(_1049);
    int _1053 = _1035 << 6;
    float _1055 = fma(_1015, _959, _1041);
    float _1057 = fma(_1047, _959, _1043);
    float _1059 = -_999;
    float _1061 = fma(_1007, _1011, _1059);
    int _1063 = _1053 + 96;
    uint _1066 = uint(int(uint(_1063) >> uint(2)));
    uint _1068 = uint(int(uint(int(_1066)) >> uint(2)));
    int _1070 = int(_1066) & 3;
    float _1072 = (*spvDescriptorSet0.vp_c15)._m0[int(_1068)][_1070];
    int _1074 = int(_1066) + 1;
    uint _1076 = uint(int(uint(_1074) >> uint(2)));
    int _1078 = _1074 & 3;
    float _1080 = (*spvDescriptorSet0.vp_c15)._m0[int(_1076)][_1078];
    float _1082 = fma(_1031, _959, _1029);
    float _1084 = fma(_1037, _939, _1057);
    int _1086 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1088 = _1027 + _1086;
    int _1090 = _1088 + 1;
    float _1092 = fma(_1019, _939, _1055);
    float _1094 = fma(_1061, _939, _1082);
    bool _1096 = _1090 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1098 = _1053 + 104;
    uint _1100 = uint(int(uint(_1098) >> uint(2)));
    uint _1102 = uint(int(uint(int(_1100)) >> uint(2)));
    int _1104 = int(_1100) & 3;
    float _1106 = (*spvDescriptorSet0.vp_c15)._m0[int(_1102)][_1104];
    int _1108 = int(_1100) + 1;
    uint _1110 = uint(int(uint(_1108) >> uint(2)));
    int _1112 = _1108 & 3;
    float _1114 = (*spvDescriptorSet0.vp_c15)._m0[int(_1110)][_1112];
    float _1116 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1118 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1120 = _1051 + _1118;
    int _1122 = _1120 + 1;
    float _1124 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1126 = _1090 | _1122;
    int _1128 = _1053 + 48;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
    int _1134 = int(_1130) & 3;
    float _1136 = (*spvDescriptorSet0.vp_c15)._m0[int(_1132)][_1134];
    int _1138 = int(_1130) + 1;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    int _1142 = _1138 & 3;
    float _1144 = (*spvDescriptorSet0.vp_c15)._m0[int(_1140)][_1142];
    float _1146 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1124);
    bool _1148 = _1126 < 0;
    bool _1150 = _1148 || _1096;
    float _1152 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1116);
    float _1154 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1146);
    bool _1156 = _1122 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1158 = _1156 || _1150;
    int _1160 = _1053 + 64;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    uint _1164 = uint(int(uint(int(_1162)) >> uint(2)));
    int _1166 = int(_1162) & 3;
    float _1168 = (*spvDescriptorSet0.vp_c15)._m0[int(_1164)][_1166];
    int _1170 = int(_1162) + 1;
    uint _1172 = uint(int(uint(_1170) >> uint(2)));
    int _1174 = _1170 & 3;
    float _1176 = (*spvDescriptorSet0.vp_c15)._m0[int(_1172)][_1174];
    float _1178 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1152);
    float _1180 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1182 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1184 = _239 + _1180;
    int _1186 = _1053 + 56;
    uint _1188 = uint(int(uint(_1186) >> uint(2)));
    uint _1190 = uint(int(uint(int(_1188)) >> uint(2)));
    int _1192 = int(_1188) & 3;
    float _1194 = (*spvDescriptorSet0.vp_c15)._m0[int(_1190)][_1192];
    int _1196 = int(_1188) + 1;
    uint _1198 = uint(int(uint(_1196) >> uint(2)));
    int _1200 = _1196 & 3;
    float _1202 = (*spvDescriptorSet0.vp_c15)._m0[int(_1198)][_1200];
    float _1204 = _237 + _1182;
    float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1208 = _1184 + _1206;
    int _1210 = _1090;
    int _1212 = as_type<int>(_1178);
    float _1214 = _1184;
    if (!_1158)
    {
        int _1216 = _1122 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1218 = _1216 + _1090;
        _1210 = _1218;
    }
    int _1220 = _1210;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1224 = _1204 + _1222;
    float _1226 = _1208 * _1208;
    int _1228 = _1053 + 72;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    int _1246 = 0;
    float _1248 = as_type<float>(_1220);
    if (!_1158)
    {
        int _1250 = _1220 << 2;
        _1246 = _1250;
    }
    int _1252 = _1246;
    float _1254 = fma(_1224, _1224, _1226);
    int _1256 = _1252;
    if (!_1158)
    {
        uint _1258 = uint(int(uint(_1220) >> uint(2)));
        _1212 = int(_1258);
    }
    int _1260 = _1212;
    int _1262 = _1260;
    if (!_1158)
    {
        int _1264 = 12 & _1252;
        _1256 = _1264;
    }
    int _1266 = _1256;
    float _1268 = sqrt(_1254);
    int _1270 = _1053 + 80;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
    int _1276 = int(_1272) & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    int _1280 = int(_1272) + 1;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    int _1284 = _1280 & 3;
    float _1286 = (*spvDescriptorSet0.vp_c15)._m0[int(_1282)][_1284];
    float _1288 = _921 * _1080;
    if (!_1158)
    {
        int _1290 = _1260 << 4;
        int _1292 = _1290 + _1266;
        _1262 = _1292;
    }
    int _1294 = _1262;
    float _1296 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1298 = fma(_237, _1072, _1288);
    float _1300 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1296);
    float _1302 = fma(_239, _1106, _1298);
    float _1304 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1300);
    float _1306 = _1302 + _1114;
    bool _1308 = _1268 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1310 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1312 = _921 * _1144;
    float _1314 = 1.0 / _1306;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1322 = _1320 != 0;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1326 = _1324 != 0;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1330 = _1328 != 0;
    float _1332 = fma(_237, _1136, _1312);
    bool _1334 = !_1322;
    int _1336 = _1334 ? 0 : 1;
    float _1338 = _921 * _1176;
    float _1340 = _1136;
    float _1342 = _1168;
    if (!_1158)
    {
        float _1344 = floor(_981);
        _1340 = _1344;
    }
    float _1346 = _1340;
    bool _1348 = !_1318;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = fma(_237, _1168, _1338);
    bool _1354 = !_1326;
    int _1356 = _1354 ? 0 : 1;
    bool _1358 = !_1330;
    int _1360 = _1358 ? 0 : 1;
    float _1362 = fma(_239, _1194, _1332);
    float _1364 = _1352;
    if (!_1308)
    {
        _1342 = _1204;
    }
    float _1366 = _1342;
    float _1368 = fma(_239, _1236, _1352);
    float _1370 = _1362 + _1202;
    float _1372 = _411 + _1310;
    float _1374 = _1368 + _1244;
    float _1376 = _1366;
    if (!_1308)
    {
        _1364 = _1372;
    }
    float _1378 = _1364;
    bool _1380 = !_1308;
    float _1382 = _1378;
    if (!_1380)
    {
        float _1384 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1388 = _1268 + _1386;
        float _1390 = _1372 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1392 = rsqrt(_1254);
        float _1394 = _1388 * _1384;
        float _1396 = _1394 * 0.15915493667125701904296875;
        float _1398 = _1396 * 6.283185482025146484375;
        float _1400 = cos(_1398);
        float _1402 = _1396 * 6.283185482025146484375;
        float _1404 = sin(_1402);
        float _1406 = _1400 + (-1.0);
        float _1408 = fma(_1404, _1390, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1410 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1412 = _1392 * _1408;
        float _1414 = fma(_1372, _1400, _1410);
        float _1416 = fma(_1224, _1412, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1418 = fma(_1208, _1412, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1382 = _1414;
        _1376 = _1416;
        _1214 = _1418;
    }
    float _1420 = _1382;
    float _1422 = _1376;
    float _1424 = _1214;
    int _1426 = _1053 + 88;
    uint _1428 = uint(int(uint(_1426) >> uint(2)));
    uint _1430 = uint(int(uint(int(_1428)) >> uint(2)));
    int _1432 = int(_1428) & 3;
    float _1434 = (*spvDescriptorSet0.vp_c15)._m0[int(_1430)][_1432];
    int _1436 = int(_1428) + 1;
    uint _1438 = uint(int(uint(_1436) >> uint(2)));
    int _1440 = _1436 & 3;
    float _1442 = (*spvDescriptorSet0.vp_c15)._m0[int(_1438)][_1440];
    float _1444 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1446 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1448 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1450 = _1370 * _1314;
    float _1452 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1444);
    float _1454 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1446);
    float _1456 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1448);
    float _1458 = _1224;
    if (!_1158)
    {
        int _1460 = _1294 + 400;
        uint _1462 = uint(int(uint(_1460) >> uint(2)));
        uint _1464 = uint(int(uint(int(_1462)) >> uint(2)));
        int _1466 = int(_1462) & 3;
        float _1468 = (*spvDescriptorSet0.vp_c15)._m0[int(_1464)][_1466];
        _1458 = _1468;
    }
    float _1470 = _1458;
    float _1472 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1452);
    bool _1474 = _1450 >= 0.0;
    float _1476 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1454);
    float _1478 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1480 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1456);
    float _1482 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1484 = _1374 * _1314;
    bool _1486 = _1450 <= 1.0;
    bool _1488 = _1486 && _1474;
    float _1490 = _1476 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1492 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1478);
    float _1494 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1496 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1498 = _1484 >= 0.0;
    bool _1500 = _1498 && _1488;
    float _1502 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1504 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1506 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1492);
    float _1508 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1496);
    bool _1510 = _1484 <= 1.0;
    bool _1512 = _1510 && _1500;
    float _1514 = -_1504;
    float _1516 = fma(_1514, _1502, 1.0);
    float _1518 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1520 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1508);
    float _1522 = _921 * _1286;
    float _1524 = _1362;
    float _1526 = _1476;
    if (!_1158)
    {
        float _1528 = floor(_991);
        _1524 = _1528;
    }
    float _1530 = _1524;
    float _1532 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1534 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1520);
    float _1536 = fma(_237, _1278, _1522);
    float _1538 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1540 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1532);
    float _1542 = log2(_1516);
    if (_1512)
    {
        float _1544 = float(_1035);
        _1526 = _1544;
    }
    float _1546 = _1526;
    float _1548 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1538);
    float _1550 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1540);
    float _1552 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1548);
    float _1554 = 1.0 / _1534;
    float _1556 = fma(_239, _1434, _1536);
    float _1558 = 0.0;
    float _1560 = _1548;
    if (!_1158)
    {
        float _1562 = -_1530;
        float _1564 = _991 + _1562;
        _1558 = _1564;
    }
    float _1566 = _1558;
    float _1568 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1550);
    float _1570 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1552);
    float _1572 = _1556 + _1442;
    float _1574 = _1532;
    float _1576 = _1568;
    if (_1512)
    {
        float _1578 = rint(_1546);
        float _1580 = precise::max(_1578, 0.0);
        uint _1582 = uint(_1580);
        uint _1584 = clamp(_1582, 0u, 65535u);
        _1574 = as_type<float>(_1584);
    }
    float _1586 = _1574;
    float _1588 = _1572 * _1314;
    float _1590 = _1542 * 0.693147182464599609375;
    float _1592 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1594 = _1590;
    if (!_1158)
    {
        float _1596 = -_1346;
        float _1598 = _981 + _1596;
        _1594 = _1598;
    }
    float _1600 = _1594;
    float _1602 = _1572;
    if (!_1158)
    {
        float _1604 = rint(_1470);
        float _1606 = precise::max(_1604, 0.0);
        uint _1608 = uint(_1606);
        uint _1610 = clamp(_1608, 0u, 65535u);
        _1602 = as_type<float>(_1610);
    }
    float _1612 = _1602;
    float _1614 = _1568 * _1554;
    float _1616 = _1570 * _1554;
    float _1618 = fma(_1614, 0.5, 0.5);
    float _1620 = fma(_1616, -0.5, 0.5);
    float _1622 = _1346;
    if (_1512)
    {
        float3 _6417 = float3(_1450, _1484, float(as_type<int>(_1586)));
        float3 _6421 = select(_6417, float3(0.0), isnan(_6417));
        float _1624 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6421.xy, uint(rint(_6421.z)), _1588, level(0.0));
        _1622 = _1624;
    }
    float _1626 = _1622;
    float3 _6431 = float3(_1618, _1620, _1592);
    float _1628 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6431, float3(0.0), isnan(_6431)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6431, float3(0.0), isnan(_6431)), level(0.0)).x;
    float3 _6440 = float3(_1618, _1620, _1592);
    float4 _1631 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6440, float3(0.0), isnan(_6440)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6440, float3(0.0), isnan(_6440)), level(0.0)).xyzw;
    float _1633 = _1631.x;
    float _1635 = _1631.y;
    float _1637 = _1631.z;
    float _1639 = _1631.w;
    float _1641 = _1566;
    if (!_1158)
    {
        float3 _6463 = float3(_1600, _1566, float(as_type<int>(_1612)));
        float3 _6465 = select(_6463, float3(0.0), isnan(_6463));
        float _1643 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6465.xy, uint(rint(_6465.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6465.xy, uint(rint(_6465.z)), level(0.0)).x;
        _1641 = _1643;
    }
    float _1645 = _1641;
    float _1647 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1649 = int(_1647);
    int _1651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1653 = _1651 != 0;
    int _1655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1657 = _1655 != 0;
    int _1659 = abs(_617);
    int _1661 = abs(_1336);
    float _1663 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1665 = int(_1663);
    int _1667 = abs(_1350);
    int _1669 = abs(_1356);
    int _1671 = abs(_1360);
    float _1673 = as_type<float>(_1661);
    if (_1653)
    {
        float _1675 = in.m_66.x;
        _1560 = _1675;
    }
    float _1677 = _1560;
    float _1679 = float(uint(_1649));
    float _1681 = trunc(_739);
    int _1683 = int(_1681);
    float _1685 = _1677;
    if (!_1653)
    {
        float _1687 = in.m_66.y;
        _1685 = _1687;
    }
    float _1689 = _1685;
    int _1691 = ~_1649;
    int _1693 = _1691 + 1;
    float _1695 = float(uint(_1665));
    float _1697 = 1.0 / _1679;
    int _1699 = ~_1665;
    int _1701 = _1699 + 1;
    float _1703 = 1.0 / _1695;
    float _1705 = trunc(_817);
    int _1707 = int(_1705);
    int _1709 = as_type<int>(_1697) + (-2);
    float _1711 = float(uint(_1683));
    float _1713 = float(_1683);
    int _1715 = as_type<int>(_1703) + (-2);
    float _1717 = as_type<float>(_1709) * _1711;
    float _1719 = _1711;
    if (_1653)
    {
        _1719 = 1.0;
    }
    float _1721 = _1719;
    float _1723 = _1721;
    if (!_1653)
    {
        _1723 = 7.345489978790283203125;
    }
    float _1725 = _1723;
    float _1727 = trunc(_1717);
    float _1729 = precise::max(_1727, 0.0);
    uint _1731 = uint(_1729);
    float _1733 = float(uint(_1707));
    float _1735 = _1725 * _259;
    float _1737 = as_type<float>(_1715) * _1733;
    float _1739 = _1733;
    if (_1653)
    {
        _1739 = 1.0;
    }
    float _1741 = _1739;
    float _1743 = floor(_1735);
    float _1745 = _1741;
    if (!_1653)
    {
        _1745 = 1.2345600128173828125;
    }
    float _1747 = _1745;
    float _1749 = _1689 * _1747;
    float _1751 = trunc(_1737);
    float _1753 = precise::max(_1751, 0.0);
    uint _1755 = uint(_1753);
    int _1757 = _1693 * int(_1731);
    int _1759 = _1757 + _1683;
    float _1761 = float(uint(_1759));
    float _1763 = floor(_1749);
    float _1765 = float(_1649);
    float _1767 = as_type<float>(_1709) * _1761;
    int _1769 = _1701 * int(_1755);
    int _1771 = _1769 + _1707;
    float _1773 = trunc(_1767);
    float _1775 = precise::max(_1773, 0.0);
    uint _1777 = uint(_1775);
    float _1779 = float(uint(_1771));
    float _1781 = -_1763;
    float _1783 = _1749 + _1781;
    float _1785 = float(_1665);
    float _1787 = as_type<float>(_1715) * _1779;
    float _1789 = -_1743;
    float _1791 = _1735 + _1789;
    int _1793 = ~_1649;
    int _1795 = _1793 + 1;
    bool _1797 = _1713 >= _1765;
    bool _1799 = isnan(_1713);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(_1765);
    bool _1805 = _1801 || _1803;
    float _1807 = float(_1805);
    float _1809 = _1783 * _1785;
    float _1811 = trunc(_1787);
    float _1813 = precise::max(_1811, 0.0);
    uint _1815 = uint(_1813);
    int _1817 = int(_1731) + int(_1777);
    float _1819 = _1791 * _1765;
    float _1821 = _1765 * _735;
    float _1823 = _1785 * _735;
    int _1825 = _1795 * _1817;
    int _1827 = _1825 + _1683;
    float _1829 = trunc(_1807);
    int _1831 = int(_1829);
    bool _1833 = uint(_1827) >= uint(_1649);
    bool _1835 = !_1833;
    int _1837 = _1835 ? 0 : (-1);
    float _1839 = trunc(_1819);
    int _1841 = int(_1839);
    int _1843 = int(_1755) + int(_1815);
    float _1845 = float(_1707);
    int _1847 = ~_1665;
    int _1849 = _1847 + 1;
    bool _1851 = _1845 >= _1785;
    bool _1853 = isnan(_1845);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan(_1785);
    bool _1859 = _1855 || _1857;
    float _1861 = float(_1859);
    float _1863 = trunc(_1809);
    int _1865 = int(_1863);
    int _1867 = _1849 * _1843;
    int _1869 = _1867 + _1707;
    int _1871 = ~_1817;
    int _1873 = _1871 + _1837;
    int _1875 = _1873 + 1;
    int _1877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1879 = _1877 != 0;
    int _1881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1883 = _1881 != 0;
    float _1885 = trunc(_1861);
    int _1887 = int(_1885);
    bool _1889 = uint(_1869) >= uint(_1665);
    bool _1891 = !_1879;
    int _1893 = _1891 ? 0 : 1;
    bool _1895 = !_1883;
    int _1897 = _1895 ? 0 : 1;
    int _1899 = abs(_1893);
    int _1901 = _1649 * _1875;
    int _1903 = _1901 + _1683;
    bool _1905 = !_1889;
    int _1907 = _1905 ? 0 : (-1);
    float _1909 = trunc(_1821);
    int _1911 = int(_1909);
    int _1913 = abs(_1897);
    bool _1915 = _1649 == 0;
    int _1917 = ~_1843;
    int _1919 = _1917 + _1907;
    int _1921 = _1919 + 1;
    int _1923 = _1841 * _1899;
    int _1925 = _1923 + _1683;
    float _1927 = trunc(_1823);
    int _1929 = int(_1927);
    int _1931 = ~_1831;
    int _1933 = _1931 + 1;
    int _1935 = _1933 + 1;
    int _1937 = _1665 * _1921;
    int _1939 = _1937 + _1707;
    bool _1941 = !_1915;
    int _1943 = _1941 ? _1903 : (-1);
    int _1945 = _1865 * _1913;
    int _1947 = _1945 + _1707;
    bool _1949 = _1665 == 0;
    int _1951 = ~_1887;
    int _1953 = _1951 + 1;
    int _1955 = _1953 + 1;
    int _1957 = _1943 * _1935;
    bool _1959 = !_1949;
    int _1961 = _1959 ? _1939 : (-1);
    int _1963 = _1649 + (-1);
    int _1965 = _1665 + (-1);
    int _1967 = _1961 * _1955;
    int _1969 = _1831 * _1963;
    int _1971 = _1969 + _1957;
    int _1973 = _1887 * _1965;
    int _1975 = _1973 + _1967;
    int _1977 = abs(_623);
    int _1979 = _1971 * _1659;
    bool _1981 = !_1657;
    int _1983 = _1981 ? 0 : 1;
    int _1985 = abs(_629);
    int _1987 = _1911 * _1977;
    int _1989 = _1987 + _1979;
    int _1991 = abs(_1983);
    int _1993 = _1975 * _1661;
    int _1995 = _1925 * _1985;
    int _1997 = _1995 + _1989;
    int _1999 = _1929 * _1667;
    int _2001 = _1999 + _1993;
    int _2003 = ~_1665;
    int _2005 = _2003 + 1;
    int _2007 = _1841 * _1991;
    int _2009 = _2007 + _1997;
    int _2011 = _1947 * _1669;
    int _2013 = _2011 + _2001;
    int _2015 = ~_1649;
    int _2017 = _2015 + 1;
    float _2019 = float(uint(_2009));
    int _2021 = _1865 * _1671;
    int _2023 = _2021 + _2013;
    int _2025 = ~_1649;
    int _2027 = _2025 + 1;
    int _2029 = ~_1665;
    int _2031 = _2029 + 1;
    float _2033 = as_type<float>(_1709) * _2019;
    float _2035 = float(uint(_2023));
    float _2037 = float(uint(_1925));
    float _2039 = trunc(_2033);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    float _2045 = as_type<float>(_1715) * _2035;
    float _2047 = as_type<float>(_1709) * _2037;
    float _2049 = trunc(_2045);
    float _2051 = precise::max(_2049, 0.0);
    uint _2053 = uint(_2051);
    int _2055 = _2017 * int(_2043);
    int _2057 = _2055 + _2009;
    float _2059 = trunc(_2047);
    float _2061 = precise::max(_2059, 0.0);
    uint _2063 = uint(_2061);
    float _2065 = float(uint(_2057));
    int _2067 = _2005 * int(_2053);
    int _2069 = _2067 + _2023;
    float _2071 = as_type<float>(_1709) * _2065;
    float _2073 = float(uint(_2069));
    int _2075 = ~_1649;
    int _2077 = _2075 + 1;
    float _2079 = trunc(_2071);
    float _2081 = precise::max(_2079, 0.0);
    uint _2083 = uint(_2081);
    float _2085 = as_type<float>(_1715) * _2073;
    float _2087 = float(uint(_1947));
    int _2089 = _2077 * int(_2063);
    int _2091 = _2089 + _1925;
    float _2093 = trunc(_2085);
    float _2095 = precise::max(_2093, 0.0);
    uint _2097 = uint(_2095);
    float _2099 = as_type<float>(_1715) * _2087;
    float _2101 = float(uint(_2091));
    int _2103 = ~_1665;
    int _2105 = _2103 + 1;
    float _2107 = as_type<float>(_1709) * _2101;
    float _2109 = trunc(_2099);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = int(_2043) + int(_2083);
    int _2117 = int(_2053) + int(_2097);
    int _2119 = _2027 * _2115;
    int _2121 = _2119 + _2009;
    float _2123 = trunc(_2107);
    float _2125 = precise::max(_2123, 0.0);
    uint _2127 = uint(_2125);
    int _2129 = _2031 * _2117;
    int _2131 = _2129 + _2023;
    bool _2133 = uint(_2121) >= uint(_1649);
    int _2135 = _2105 * int(_2113);
    int _2137 = _2135 + _1947;
    bool _2139 = !_2133;
    int _2141 = _2139 ? 0 : (-1);
    bool _2143 = uint(_2131) >= uint(_1665);
    float _2145 = float(uint(_2137));
    int _2147 = ~_2115;
    int _2149 = _2147 + _2141;
    int _2151 = _2149 + 1;
    bool _2153 = !_2143;
    int _2155 = _2153 ? 0 : (-1);
    float _2157 = as_type<float>(_1715) * _2145;
    int _2159 = int(_2063) + int(_2127);
    int _2161 = _1649 * _2151;
    int _2163 = _2161 + _2009;
    int _2165 = ~_2117;
    int _2167 = _2165 + _2155;
    int _2169 = _2167 + 1;
    float _2171 = as_type<float>(_2115);
    if (_1158)
    {
        _2171 = 1.0;
    }
    float _2173 = _2171;
    float _2175 = _2173;
    if (!_1158)
    {
        int _2177 = _1220 << 4;
        int _2179 = _2177 + 2048;
        uint _2181 = uint(int(uint(_2179) >> uint(2)));
        uint _2183 = uint(int(uint(int(_2181)) >> uint(2)));
        int _2185 = int(_2181) & 3;
        float _2187 = (*spvDescriptorSet0.vp_c15)._m0[int(_2183)][_2185];
        int _2189 = int(_2181) + 1;
        uint _2191 = uint(int(uint(_2189) >> uint(2)));
        int _2193 = _2189 & 3;
        float _2195 = (*spvDescriptorSet0.vp_c15)._m0[int(_2191)][_2193];
        int _2197 = _2179 + 8;
        uint _2199 = uint(int(uint(_2197) >> uint(2)));
        uint _2201 = uint(int(uint(int(_2199)) >> uint(2)));
        int _2203 = int(_2199) & 3;
        float _2205 = (*spvDescriptorSet0.vp_c15)._m0[int(_2201)][_2203];
        int _2207 = int(_2199) + 1;
        uint _2209 = uint(int(uint(_2207) >> uint(2)));
        int _2211 = _2207 & 3;
        float _2213 = (*spvDescriptorSet0.vp_c15)._m0[int(_2209)][_2211];
        float _2215 = _921 * _2195;
        float _2217 = fma(_237, _2187, _2215);
        float _2219 = fma(_239, _2205, _2217);
        float _2221 = _2219 + _2213;
        float _2223 = precise::clamp(_2221, 0.0, 1.0);
        float _2225 = -_2223;
        float _2227 = _2225 + _1645;
        float _2229 = fma(_2227, 500.0, 1.5);
        float _2231 = exp2(_2229);
        float _2233 = 0.0 + _2231;
        float _2235 = precise::clamp(_2233, 0.0, 1.0);
        _1248 = as_type<float>(_2179);
        _2175 = _2235;
    }
    float _2237 = _1248;
    float _2239 = _2175;
    float _2241 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2243 = _1420 + _2241;
    float _2245 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2247 = _1422 + _2245;
    float _2249 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2251 = _1424 + _2249;
    float _2253 = _2243 * _2243;
    float _2255 = fma(_2247, _2247, _2253);
    float _2257 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2259 = fma(_2251, _2251, _2255);
    float _2261 = rsqrt(_2259);
    float _2263 = sqrt(_2259);
    float _2265 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2267 = _2247 * _2265;
    float _2269 = _2251 * _2265;
    float _2271 = _2267 * _2267;
    float _2273 = _2269 * _2269;
    float _2275 = _2271 + _2273;
    float _2277 = sqrt(_2275);
    bool _2279 = _2277 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2283 = _2277 + _2281;
    float _2285 = _2237;
    float _2287 = _2275;
    float _2289 = _2283;
    float _2291 = _2257;
    float _2293 = _2267;
    float _2295 = _2269;
    float _2297 = _2271;
    float _2299 = _2273;
    if (_2279)
    {
        float _2301 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2285 = _2301;
    }
    float _2303 = _2285;
    if (_2279)
    {
        float _2305 = rsqrt(_2275);
        _2287 = _2305;
    }
    float _2307 = _2287;
    if (_2279)
    {
        float _2309 = _2283 * _2303;
        _2289 = _2309;
    }
    float _2311 = _2289;
    float _2313 = precise::max(0.0, _2257);
    float _2315 = _2313;
    if (_2279)
    {
        float _2317 = _2311 * 0.15915493667125701904296875;
        _1673 = _2317;
    }
    float _2319 = _1673;
    float _2321 = -_2265;
    float _2323 = -_2313;
    float _2325 = fma(_2243, _2321, _2323);
    float _2327 = as_type<float>(_2127);
    float _2329 = _2325;
    if (_2279)
    {
        float _2331 = _2319 * 6.283185482025146484375;
        float _2333 = sin(_2331);
        _2327 = _2333;
    }
    float _2335 = _2327;
    if (_2279)
    {
        float _2337 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2315 = _2337;
    }
    float _2339 = _2315;
    float _2341 = _2311;
    float _2343 = _2339;
    if (_2279)
    {
        float _2345 = _2319 * 6.283185482025146484375;
        float _2347 = cos(_2345);
        _2341 = _2347;
    }
    float _2349 = _2341;
    float _2351 = _2335;
    if (_2279)
    {
        float _2353 = fma(_2335, _2339, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2343 = _2353;
    }
    float _2355 = _2343;
    float _2357 = _2355;
    if (_2279)
    {
        float _2359 = _2307 * _2355;
        _2351 = _2359;
    }
    float _2361 = _2351;
    if (_2279)
    {
        float _2363 = _2349 + (-1.0);
        _2291 = _2363;
    }
    float _2365 = _2291;
    if (_2279)
    {
        float _2367 = _2267 * _2361;
        _2293 = _2367;
    }
    float _2369 = _2293;
    if (_2279)
    {
        float _2371 = _2269 * _2361;
        _2295 = _2371;
    }
    float _2373 = _2295;
    if (_2279)
    {
        float _2375 = _2365 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2357 = _2375;
    }
    float _2377 = _2357;
    if (_2279)
    {
        float _2379 = _2369 * _2369;
        _2297 = _2379;
    }
    float _2381 = _2297;
    if (_2279)
    {
        float _2383 = _2373 * _2373;
        _2299 = _2383;
    }
    float _2385 = _2299;
    int _2387 = ~_1649;
    int _2389 = _2387 + 1;
    if (_2279)
    {
        float _2391 = fma(_2325, _2349, _2377);
        _2329 = _2391;
    }
    float _2393 = _2329;
    float _2395 = fma(_2393, _2393, _2381);
    float _2397 = _2395 + _2385;
    float _2399 = rsqrt(_2397);
    float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2403 = fma(_2263, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2401);
    float _2405 = precise::clamp(_2403, 0.0, 1.0);
    float _2407 = -_2405;
    float _2409 = _2407 + 1.0;
    float _2411 = abs(_2409);
    float _2413 = log2(_2411);
    float _2415 = _2399 * _2369;
    float _2417 = _2399 * _2393;
    float _2419 = _2399 * _2373;
    float _2421 = _2415 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2423 = _2417 + 1.0;
    float _2425 = -_2421;
    float _2427 = fma(_2417, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2425);
    float _2429 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2431 = -_2419;
    float _2433 = fma(_2431, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2427);
    float _2435 = exp2(_2429);
    float _2437 = fma(_2433, -0.5, 0.5);
    float _2439 = fma(_2433, 0.5, 0.5);
    float _2441 = fma(_2439, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2443 = sqrt(_2437);
    float _2445 = fma(_2439, _2441, -0.212114393711090087890625);
    float _2447 = fma(_2439, _2445, 1.570728778839111328125);
    float _2449 = -_2417;
    float _2451 = fma(_2435, _2423, _2449);
    bool _2453 = !_1915;
    int _2455 = _2453 ? _2163 : (-1);
    int _2457 = _2455 & 3;
    bool _2459 = _2457 != 0;
    float _2461 = _2443 * 0.636619746685028076171875;
    int _2463 = _2455 & 3;
    bool _2465 = _2463 != 0;
    float _2467 = -_2447;
    float _2469 = fma(_2461, _2467, 1.0);
    float _2471 = fma(_2451, 0.5, 0.5);
    int _2473 = _2389 * _2159;
    int _2475 = _2473 + _1925;
    bool _2477 = uint(_2463) > 1u;
    float2 _7632 = float2(_2469, _2471);
    float3 _2481 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7632, float2(0.0), isnan(_7632)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7632, float2(0.0), isnan(_7632)), level(0.0)).xyz;
    float _2483 = _2481.x;
    float _2485 = _2481.y;
    float _2487 = _2481.z;
    bool _2489 = uint(_2475) >= uint(_1649);
    int _2491 = _1665 * _2169;
    int _2493 = _2491 + _2023;
    int _2495 = _2459 ? 0 : 1;
    float _2497 = trunc(_2157);
    float _2499 = precise::max(_2497, 0.0);
    uint _2501 = uint(_2499);
    int _2503 = _2455 >> 31;
    float _2505 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2507 = _265 > 0.5;
    float _2509 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2511 = ~_2495;
    int _2513 = _2511 + 1;
    int _2515 = _2513 + 1;
    float _2517 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2505);
    bool _2519 = !_1949;
    int _2521 = _2519 ? _2493 : (-1);
    float _2523 = -_813;
    float _2525 = _2523 + 1.0;
    int _2527 = _2515;
    if (!_2477)
    {
        int _2529 = ~_2495;
        int _2531 = _2529 + 1;
        _2527 = _2531;
    }
    int _2533 = _2527;
    float _2535 = exp2(_2509);
    int _2537 = _2503 & 3;
    float _2539 = -_803;
    float _2541 = _2539 + 1.0;
    int _2543 = _2521 >> 31;
    float _2545 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2517);
    int _2547 = _2455 + _2537;
    float _2549 = -_805;
    float _2551 = _2549 + 1.0;
    int _2553 = _2543 & 3;
    float _2555 = -_257;
    float _2557 = _2555 + 1.0;
    bool _2559 = !_2489;
    int _2561 = _2559 ? 0 : (-1);
    float _2563 = -_811;
    float _2565 = _2563 + 1.0;
    bool _2567 = _2463 != 3;
    out.m_72.x = _1422;
    out.m_72.y = _1420;
    out.m_72.z = _1424;
    int _2569 = _2547 >> 2;
    int _2571 = _2521 + _2553;
    float _2573 = -_2535;
    float _2575 = _2573 + 1.0;
    bool _2577 = uint(_2463) >= 2u;
    int _2579 = _2569 << 4;
    int _2581 = _2579 + 368;
    int _2583 = _2571 >> 2;
    int _2585 = _2577 ? 0 : 1;
    uint _2587 = uint(int(uint(_2581) >> uint(2)));
    uint _2589 = uint(int(uint(int(_2587)) >> uint(2)));
    int _2591 = int(_2587) & 3;
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[int(_2589)][_2591];
    int _2595 = int(_2587) + 1;
    uint _2597 = uint(int(uint(_2595) >> uint(2)));
    int _2599 = _2595 & 3;
    float _2601 = (*spvDescriptorSet0.vp_c9)._m0[int(_2597)][_2599];
    int _2603 = _2583 << 4;
    int _2605 = _2603 + 512;
    int _2607 = ~_2585;
    int _2609 = _2607 + 1;
    int _2611 = _2609 + 1;
    int _2613 = _2611;
    if (_2567)
    {
        int _2615 = ~_2585;
        int _2617 = _2615 + 1;
        _2613 = _2617;
    }
    int _2619 = _2613;
    int _2621 = ~_2159;
    int _2623 = _2621 + _2561;
    int _2625 = _2623 + 1;
    uint _2627 = uint(int(uint(_2605) >> uint(2)));
    uint _2629 = uint(int(uint(int(_2627)) >> uint(2)));
    int _2631 = int(_2627) & 3;
    float _2633 = (*spvDescriptorSet0.vp_c9)._m0[int(_2629)][_2631];
    int _2635 = int(_2627) + 1;
    uint _2637 = uint(int(uint(_2635) >> uint(2)));
    int _2639 = _2635 & 3;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[int(_2637)][_2639];
    int _2643 = int(_2113) + int(_2501);
    float _2645 = -_187;
    int _2647 = _2507 ? as_type<int>(_2645) : as_type<int>(_187);
    int _2649 = _1649 * _2625;
    int _2651 = _2649 + _1925;
    bool _2653 = !_2465;
    int _2655 = _2653 ? 0 : 1;
    int _2657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2659 = _2657 != 0;
    int _2661 = _2521 & 3;
    bool _2663 = _2661 != 0;
    int _2665 = _2521 & 3;
    bool _2667 = _2665 != 0;
    int _2669 = _2581 + 8;
    uint _2671 = uint(int(uint(_2669) >> uint(2)));
    uint _2673 = uint(int(uint(int(_2671)) >> uint(2)));
    int _2675 = int(_2671) & 3;
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[int(_2673)][_2675];
    int _2679 = int(_2671) + 1;
    uint _2681 = uint(int(uint(_2679) >> uint(2)));
    int _2683 = _2679 & 3;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[int(_2681)][_2683];
    int _2687 = ~_1665;
    int _2689 = _2687 + 1;
    bool _2691 = !_2659;
    int _2693 = _2691 ? 0 : 1;
    bool _2695 = uint(_2665) > 1u;
    int _2697 = _2689 * _2643;
    int _2699 = _2697 + _1947;
    bool _2701 = !_1915;
    int _2703 = _2701 ? _2651 : (-1);
    int _2705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2707 = _2705 != 0;
    bool _2709 = _2463 != 3;
    bool _2711 = !_2707;
    int _2713 = _2711 ? 0 : 1;
    int _2715 = _2605 + 8;
    uint _2717 = uint(int(uint(_2715) >> uint(2)));
    uint _2719 = uint(int(uint(int(_2717)) >> uint(2)));
    int _2721 = int(_2717) & 3;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[int(_2719)][_2721];
    int _2725 = int(_2717) + 1;
    uint _2727 = uint(int(uint(_2725) >> uint(2)));
    int _2729 = _2725 & 3;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[int(_2727)][_2729];
    int _2733 = _2663 ? 0 : 1;
    bool _2735 = uint(_2699) >= uint(_1665);
    bool _2737 = _2665 != 3;
    bool _2739 = !_2709;
    int _2741 = _2739 ? 0 : (-1);
    bool _2743 = !_2667;
    int _2745 = _2743 ? 0 : 1;
    bool _2747 = uint(_2665) >= 2u;
    bool _2749 = _2665 != 3;
    int _2751 = ~_2733;
    int _2753 = _2751 + 1;
    int _2755 = _2753 + 1;
    int _2757 = _2755;
    if (!_2695)
    {
        int _2759 = ~_2733;
        int _2761 = _2759 + 1;
        _2757 = _2761;
    }
    int _2763 = _2757;
    int _2765 = _2747 ? 0 : 1;
    bool _2767 = !_2749;
    int _2769 = _2767 ? 0 : (-1);
    int _2771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2773 = _2771 != 0;
    int _2775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2777 = _2775 != 0;
    int _2779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2781 = _2779 != 0;
    bool _2783 = !_2735;
    int _2785 = _2783 ? 0 : (-1);
    int _2787 = abs(_2533);
    bool _2789 = _259 > 0.5;
    int _2791 = ~_2643;
    int _2793 = _2791 + _2785;
    int _2795 = _2793 + 1;
    int _2797 = ~_2765;
    int _2799 = _2797 + 1;
    int _2801 = _2799 + 1;
    int _2803 = _1665 * _2795;
    int _2805 = _2803 + _1947;
    int _2807 = _2801;
    if (_2737)
    {
        int _2809 = ~_2765;
        int _2811 = _2809 + 1;
        _2807 = _2811;
    }
    int _2813 = _2807;
    int _2815 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2817 = _2815 != 0;
    int _2819 = abs(_2763);
    int _2821 = abs(_2655);
    int _2823 = ~_2787;
    int _2825 = _2823 + 1;
    int _2827 = _2825 + 1;
    int _2829 = abs(_2745);
    int _2831 = _2827 * as_type<int>(_2601);
    int _2833 = ~_2819;
    int _2835 = _2833 + 1;
    int _2837 = _2835 + 1;
    int _2839 = ~_2821;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    int _2845 = _2837 * as_type<int>(_2641);
    int _2847 = abs(_2813);
    int _2849 = abs(_2619);
    int _2851 = ~_2829;
    int _2853 = _2851 + 1;
    int _2855 = _2853 + 1;
    int _2857 = _2843 * as_type<int>(_2593);
    int _2859 = _2857 + _2831;
    int _2861 = ~_2849;
    int _2863 = _2861 + 1;
    int _2865 = _2863 + 1;
    float _2867 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2869 = int(_2867);
    int _2871 = _2855 * as_type<int>(_2633);
    int _2873 = _2871 + _2845;
    int _2875 = _2865 * as_type<int>(_2677);
    int _2877 = _2875 + _2859;
    float _2879 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2881 = abs(_2741);
    float _2883 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2885 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2887 = ~_2881;
    int _2889 = _2887 + 1;
    int _2891 = _2889 + 1;
    float _2893 = _2879 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2895 = _2883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2897 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2899 = _2885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2901 = _2891 * as_type<int>(_2685);
    int _2903 = _2901 + _2877;
    int _2905 = abs(_2869);
    float _2907 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2909 = int(_2907);
    int _2911 = abs(_2693);
    out.m_74.x = _2893;
    out.m_74.y = _2895;
    out.m_74.z = _2899;
    out.m_74.w = _2897;
    bool _2913 = !_1949;
    int _2915 = _2913 ? _2805 : (-1);
    float _2917 = float(uint(_2869));
    bool _2919 = _261 > 0.5;
    int _2921 = abs(_2769);
    int _2923 = ~_2847;
    int _2925 = _2923 + 1;
    int _2927 = _2925 + 1;
    float _2929 = 1.0 / _2917;
    int _2931 = ~_2921;
    int _2933 = _2931 + 1;
    int _2935 = _2933 + 1;
    int _2937 = _2927 * as_type<int>(_2723);
    int _2939 = _2937 + _2873;
    int _2941 = abs(_2713);
    float _2943 = abs(_975);
    float _2945 = log2(_2943);
    int _2947 = _2935 * as_type<int>(_2731);
    int _2949 = _2947 + _2939;
    float _2951 = float(uint(_2909));
    float _2953 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2955 = ~_2911;
    int _2957 = _2955 + 1;
    int _2959 = _2957 + 1;
    float _2961 = -_183;
    int _2963 = _2789 ? as_type<int>(_2961) : as_type<int>(_183);
    float _2965 = _2953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2967 = _263 > 0.5;
    int _2969 = _2903 * _2959;
    float _2971 = 1.0 / _2951;
    int _2973 = as_type<int>(_2929) + (-2);
    float _2975 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2977 = _2703 * _2911;
    int _2979 = _2977 + _2969;
    float _2981 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2983 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2985 = -_1007;
    float _2987 = fma(_2985, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2981);
    float _2989 = float(uint(_2979));
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2993 = ~_2941;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    float _2999 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3001 = abs(_2909);
    float _3003 = as_type<float>(_2973) * _2989;
    float _3005 = float(uint(_2905));
    int _3007 = _2949 * _2997;
    float _3009 = float(uint(_3001));
    float _3011 = exp2(_2983);
    float _3013 = _2991 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3015 = _2999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3017 = _2915 * _2941;
    int _3019 = _3017 + _3007;
    float _3021 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3023 = -_1007;
    float _3025 = fma(_3023, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2975);
    int _3027 = ~_2869;
    int _3029 = _3027 + 1;
    out.m_76.x = _2965;
    out.m_76.y = _3013;
    out.m_76.z = _3015;
    float _3031 = 1.0 / _3005;
    float _3033 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3035 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3037 = ~_3001;
    int _3039 = _3037 + 1;
    bool _3041 = !_2817;
    float _3043 = _3041 ? _183 : as_type<float>(_2963);
    bool _3045 = !_2773;
    float _3047 = _3045 ? _187 : as_type<float>(_2647);
    float _3049 = trunc(_3003);
    float _3051 = precise::max(_3049, 0.0);
    uint _3053 = uint(_3051);
    bool _3055 = _975 <= 8000.0;
    bool _3057 = isnan(_975);
    bool _3059 = _3055 || _3057;
    bool _3061 = isnan(8000.0);
    bool _3063 = _3059 || _3061;
    float _3065 = float(_3063);
    int _3067 = as_type<int>(_2971) + (-2);
    float _3069 = -_1007;
    float _3071 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3021);
    float _3073 = float(uint(_3019));
    float _3075 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2987);
    float _3077 = 1.0 / _3009;
    int _3079 = abs(_2979);
    float _3081 = as_type<float>(_3067) * _3073;
    int _3083 = as_type<int>(_3031) + (-2);
    float _3085 = fma(_3011, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3087 = precise::clamp(_3085, 0.0, 1.0);
    int _3089 = abs(_3019);
    float _3091 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3025);
    float _3093 = float(uint(_3079));
    float _3095 = trunc(_3081);
    float _3097 = precise::max(_3095, 0.0);
    uint _3099 = uint(_3097);
    int _3101 = _3029 * int(_3053);
    int _3103 = _3101 + _2979;
    float _3105 = float(uint(_3089));
    float _3107 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3071);
    float _3109 = as_type<float>(_3083) * _3093;
    float _3111 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3033);
    float _3113 = float(uint(_3103));
    float _3115 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3035);
    int _3117 = as_type<int>(_3077) + (-2);
    float _3119 = trunc(_3109);
    float _3121 = precise::max(_3119, 0.0);
    uint _3123 = uint(_3121);
    int _3125 = ~_2909;
    int _3127 = _3125 + 1;
    float _3129 = as_type<float>(_3117) * _3105;
    float _3131 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3133 = as_type<float>(_2973) * _3113;
    float _3135 = trunc(_3129);
    float _3137 = precise::max(_3135, 0.0);
    uint _3139 = uint(_3137);
    int _3141 = ~_2905;
    int _3143 = _3141 + 1;
    float _3145 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3131);
    float _3147 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3149 = _3127 * int(_3099);
    int _3151 = _3149 + _3019;
    float _3153 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3155 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3157 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3147);
    int _3159 = _3143 * int(_3123);
    int _3161 = _3159 + _3079;
    float _3163 = float(uint(_3151));
    float _3165 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3153);
    float _3167 = trunc(_3133);
    float _3169 = precise::max(_3167, 0.0);
    uint _3171 = uint(_3169);
    float _3173 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3155);
    float _3175 = float(uint(_3161));
    float _3177 = as_type<float>(_3067) * _3163;
    float _3179 = -_183;
    int _3181 = _2967 ? as_type<int>(_3179) : as_type<int>(_183);
    int _3183 = _3039 * int(_3139);
    int _3185 = _3183 + _3089;
    float _3187 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3115);
    float _3189 = as_type<float>(_3083) * _3175;
    float _3191 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3111);
    float _3193 = trunc(_3177);
    float _3195 = precise::max(_3193, 0.0);
    uint _3197 = uint(_3195);
    float _3199 = float(uint(_3185));
    float _3201 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3145);
    bool _3203 = !_2781;
    float _3205 = _3203 ? _183 : as_type<float>(_3181);
    float _3207 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3209 = -_187;
    int _3211 = _2919 ? as_type<int>(_3209) : as_type<int>(_187);
    float _3213 = as_type<float>(_3117) * _3199;
    float _3215 = trunc(_3189);
    float _3217 = precise::max(_3215, 0.0);
    uint _3219 = uint(_3217);
    bool _3221 = !_2777;
    float _3223 = _3221 ? _187 : as_type<float>(_3211);
    float _3225 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3165);
    int _3227 = ~_2909;
    int _3229 = _3227 + 1;
    float _3231 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3233 = _3207 * _3075;
    int _3235 = int(_3053) + int(_3171);
    float _3237 = fma(_3087, -2.0, 3.0);
    float _3239 = trunc(_3213);
    float _3241 = precise::max(_3239, 0.0);
    uint _3243 = uint(_3241);
    int _3245 = int(_3099) + int(_3197);
    float _3247 = _3087 * _3087;
    int _3249 = ~_2905;
    int _3251 = _3249 + 1;
    float _3253 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3157);
    float _3255 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3173);
    int _3257 = _3229 * _3245;
    int _3259 = _3257 + _3019;
    float _3261 = fma(_3231, _3187, _3233);
    out.m_78.x = _3187;
    out.m_78.y = _3191;
    out.m_78.z = _3201;
    int _3263 = ~_2869;
    int _3265 = _3263 + 1;
    float _3267 = _3247 * _3237;
    int _3269 = ~_3001;
    int _3271 = _3269 + 1;
    int _3273 = int(_3123) + int(_3219);
    int _3275 = _3265 * _3235;
    int _3277 = _3275 + _2979;
    bool _3279 = uint(_3259) >= uint(_2909);
    int _3281 = int(_3139) + int(_3243);
    bool _3283 = !_3279;
    int _3285 = _3283 ? 0 : (-1);
    bool _3287 = uint(_3277) >= uint(_2869);
    int _3289 = _3251 * _3273;
    int _3291 = _3289 + _3079;
    int _3293 = ~_3245;
    int _3295 = _3293 + _3285;
    int _3297 = _3295 + 1;
    int _3299 = _3271 * _3281;
    int _3301 = _3299 + _3089;
    int _3303 = _2979 ^ _2869;
    float _3305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3307 = uint(_3291) >= uint(_2905);
    int _3309 = _2909 * _3297;
    int _3311 = _3309 + _3019;
    bool _3313 = !_3287;
    int _3315 = _3313 ? 0 : (-1);
    bool _3317 = uint(_3301) >= uint(_3001);
    bool _3319 = !_3307;
    int _3321 = _3319 ? 0 : (-1);
    float _3323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3325 = uint(int(uint(_3303) >> uint(31)));
    int _3327 = ~_3235;
    int _3329 = _3327 + _3315;
    int _3331 = _3329 + 1;
    int _3333 = ~_3321;
    int _3335 = _3273 + _3333;
    int _3337 = _3335 + 1;
    int _3339 = ~int(_3325);
    int _3341 = _3339 + 1;
    int _3343 = _2869 * _3331;
    int _3345 = _3343 + _2979;
    int _3347 = _3019 ^ _2909;
    float _3349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3351 = _3337 ^ _3341;
    bool _3353 = _2869 == 0;
    bool _3355 = _2909 == 0;
    float _3357 = _3323 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3359 = _2909 == 0;
    int _3361 = ~_3341;
    int _3363 = _3361 + _3351;
    int _3365 = _3363 + 1;
    float _3367 = _3305 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3369 = !_3317;
    int _3371 = _3369 ? 0 : (-1);
    uint _3373 = uint(int(uint(_3347) >> uint(31)));
    float _3375 = fma(_3207, _3207, 1.0);
    bool _3377 = !_3353;
    int _3379 = _3377 ? _3345 : (-1);
    bool _3381 = _2869 == 0;
    int _3383 = ~_3371;
    int _3385 = _3281 + _3383;
    int _3387 = _3385 + 1;
    float _3389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3391 = ~int(_3373);
    int _3393 = _3391 + 1;
    bool _3395 = !_3355;
    int _3397 = _3395 ? _3311 : (-1);
    float _3399 = float(_3379);
    int _3401 = _3387 ^ _3393;
    float _3403 = rsqrt(_3375);
    float _3405 = float(_3397);
    float _3407 = fma(_3367, _3399, _333);
    float _3409 = _3043 + 0.5;
    int _3411 = ~_3393;
    int _3413 = _3411 + _3401;
    int _3415 = _3413 + 1;
    bool _3417 = !_3381;
    int _3419 = _3417 ? _3365 : (-1);
    float _3421 = fma(_3357, _3405, _809);
    float _3423 = fma(_3367, _3409, _3407);
    float _3425 = _3205 + 0.5;
    bool _3427 = !_3359;
    int _3429 = _3427 ? _3415 : (-1);
    float _3431 = _3349 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3433 = float(_3419);
    float _3435 = fma(_3357, _3425, _3421);
    float _3437 = float(_3429);
    float _3439 = _3389 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3441 = _3223 + (-0.5);
    float _3443 = -_399;
    float _3445 = fma(_3431, _3433, _3443);
    float _3447 = _3047 + (-0.5);
    float _3449 = -_819;
    float _3451 = fma(_3439, _3437, _3449);
    float _3453 = _3207 * _3403;
    float _3455 = -_3431;
    float _3457 = fma(_3455, _3441, _3445);
    float _3459 = -_2541;
    float _3461 = fma(_3205, _3459, _3435);
    float _3463 = -_3439;
    float _3465 = fma(_3463, _3447, _3451);
    float _3467 = -_3225;
    float _3469 = _3453 * _3467;
    float _3471 = fma(_3223, _2525, _3457);
    float _3473 = -_3267;
    float _3475 = _3473 + 1.0;
    float _3477 = -_3253;
    float _3479 = _3453 * _3477;
    float _3481 = fma(_3403, _3091, _3469);
    float _3483 = _3207 * _3091;
    float _3485 = fma(_3475, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3267);
    float _3487 = -_3255;
    float _3489 = _3453 * _3487;
    float _3491 = fma(_3403, _3075, _3479);
    float _3493 = fma(_3231, _3191, _3483);
    float _3495 = _3065 * _3485;
    float _3497 = fma(_3403, _3107, _3489);
    float _3499 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2545);
    float _3501 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3503 = _3501;
    if (!_1512)
    {
        _1576 = 1.0;
    }
    float _3505 = _1576;
    float _3507 = fma(_3047, _2551, _3465);
    float _3509 = _3505;
    if (_1512)
    {
        bool _3511 = _1626 >= _1588;
        bool _3513 = isnan(_1626);
        bool _3515 = _3511 || _3513;
        bool _3517 = isnan(_1588);
        bool _3519 = _3515 || _3517;
        float _3521 = float(_3519);
        _3509 = _3521;
    }
    float _3523 = _3509;
    float _3525 = _2575 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3527 = _2557 * _3501;
    float _3529 = precise::clamp(_3527, 0.0, 1.0);
    float _3531 = -_2565;
    float _3533 = fma(_3043, _3531, _3423);
    float _3535 = _3499 + _1534;
    float _3537 = _3207 * _3107;
    float _3539 = _3523 * _2239;
    float _3541 = _3525 * _1628;
    float _3543 = -_3529;
    float _3545 = fma(_3543, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3547 = _3535 * 0.5;
    float _3549 = fma(_3231, _3201, _3537);
    float _3551 = _1639 * _3541;
    float _3553 = -_3539;
    float _3555 = fma(_3553, _3545, 1.0);
    float _3557 = precise::clamp(_3555, 0.0, 1.0);
    float _3559 = _2487 * _3541;
    float _3561 = -_3525;
    float _3563 = _3561 + 1.0;
    out.m_80.z = _3547;
    out.m_80.w = _1534;
    float _3565 = _3253 + _3261;
    float _3567 = _3225 + _3493;
    float _3569 = _3255 + _3549;
    float _3571 = fma(_2483, _3551, _1633);
    float _3573 = fma(_2485, _3551, _1635);
    float _3575 = _1639 * _3563;
    float _3577 = fma(_1639, _3559, _1637);
    out.m_82.x = _3491;
    out.m_82.y = _3481;
    out.m_82.z = _3497;
    bool _3579 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3581 = isnan(_2263);
    bool _3583 = _3579 || _3581;
    bool _3585 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3587 = _3583 || _3585;
    float _3589 = _3557 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_84.x = _3533;
    out.m_84.y = _3471;
    out.m_84.z = _3461;
    out.m_84.w = _3507;
    out.gl_Position.x = _1568;
    out.gl_Position.y = _1570;
    out.gl_Position.z = _3499;
    out.gl_Position.w = _1534;
    out.m_86.x = _3589;
    float _3591 = _3547;
    float _3593 = _3535;
    float _3595 = _3539;
    float _3597 = _3557;
    float _3599 = _3551;
    if (!_3587)
    {
        _3591 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3601 = _3591;
    out.m_88.x = _3571;
    out.m_88.y = _3573;
    out.m_88.z = _3577;
    out.m_88.w = _3575;
    float _3603 = _3601;
    float _3605 = _3601;
    if (!_3587)
    {
        _3593 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3607 = _3593;
    float _3609 = _3607;
    float _3611 = _3607;
    if (!_3587)
    {
        _3503 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3613 = _3503;
    out.m_90.x = _3565;
    out.m_90.y = _3567;
    out.m_90.z = _3569;
    float _3615 = _3613;
    float _3617 = _3613;
    if (!_3587)
    {
        _3595 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3619 = _3595;
    float _3621 = _3619;
    float _3623 = _3619;
    if (!_3587)
    {
        _3597 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3625 = _3597;
    float _3627 = _3625;
    float _3629 = _3625;
    if (!_3587)
    {
        _3599 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3631 = _3599;
    bool _3633 = !_3587;
    float _3635 = _3631;
    float _3637 = _3631;
    if (!_3633)
    {
        bool _3639 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3641 = isnan(_2263);
        bool _3643 = _3639 || _3641;
        bool _3645 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3647 = _3643 || _3645;
        if (!_3647)
        {
            float _3649 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3651 = _2263 + _3649;
            float _3653 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3655 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3653;
            float _3657 = 1.0 / _3655;
            float _3659 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3661 = _3659 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3663 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3665 = _3663 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3667 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3669 = _3667 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3671 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3673 = _3671 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3675 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3677 = _3675 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3679 = _3651 * _3657;
            float _3681 = precise::clamp(_3679, 0.0, 1.0);
            float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3685 = _3683 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3687 = fma(_3681, _3661, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3689 = fma(_3681, _3685, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3691 = fma(_3681, _3665, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3693 = fma(_3681, _3669, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3695 = fma(_3681, _3673, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3697 = fma(_3681, _3677, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3611 = _3689;
            _3629 = _3695;
            _3605 = _3687;
            _3623 = _3693;
            _3617 = _3691;
            _3637 = _3697;
            _3699 = true;
        }
        else
        {
            bool _3701 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3703 = isnan(_2263);
            bool _3705 = _3701 || _3703;
            bool _3707 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3709 = _3705 || _3707;
            if (!_3709)
            {
                _3603 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3711 = _3603;
            _3605 = _3711;
            if (!_3709)
            {
                _3609 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3713 = _3609;
            _3611 = _3713;
            if (!_3709)
            {
                _3615 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3715 = _3615;
            _3617 = _3715;
            if (!_3709)
            {
                _3621 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3717 = _3621;
            _3623 = _3717;
            if (!_3709)
            {
                _3627 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3719 = _3627;
            _3629 = _3719;
            if (!_3709)
            {
                _3635 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3721 = _3635;
            bool _3723 = !_3709;
            _3637 = _3721;
            if (!_3723)
            {
                bool _3725 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3727 = isnan(_2263);
                bool _3729 = _3725 || _3727;
                bool _3731 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3733 = _3729 || _3731;
                if (!_3733)
                {
                    float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3737 = _2263 + _3735;
                    float _3739 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3741 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3739;
                    float _3743 = 1.0 / _3741;
                    float _3745 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3747 = _3745 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3749 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3751 = _3749 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3753 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3755 = _3753 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3757 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3759 = _3757 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3761 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3763 = _3761 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3765 = _3737 * _3743;
                    float _3767 = precise::clamp(_3765, 0.0, 1.0);
                    float _3769 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3771 = _3769 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3773 = fma(_3767, _3747, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3775 = fma(_3767, _3771, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3777 = fma(_3767, _3751, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3779 = fma(_3767, _3755, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3781 = fma(_3767, _3759, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3783 = fma(_3767, _3763, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3611 = _3775;
                    _3629 = _3781;
                    _3605 = _3773;
                    _3623 = _3779;
                    _3617 = _3777;
                    _3637 = _3783;
                    _3699 = true;
                }
                else
                {
                    _3611 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3629 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3605 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3623 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3617 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3637 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3699 = false;
    float _3785 = _3611;
    float _3787 = _3629;
    float _3789 = _3605;
    float _3791 = _3623;
    float _3793 = _3617;
    float _3795 = _3637;
    float _3797 = fma(_3567, -0.5, 0.5);
    float _3799 = precise::clamp(_3797, 0.0, 1.0);
    float _3801 = -_3785;
    float _3803 = _3801 + _3787;
    float _3805 = -_3789;
    float _3807 = _3805 + _3791;
    float _3809 = -_3793;
    float _3811 = _3809 + _3795;
    bool _3813 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3815 = fma(_3799, _3803, _3785);
    float _3817 = fma(_3799, _3807, _3789);
    float _3819 = fma(_3799, _3811, _3793);
    float _3821 = _3815 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _3823 = fma(_3817, 0.298911988735198974609375, _3821);
    float _3825 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3827 = fma(_3819, 0.114477999508380889892578125, _3823);
    out.m_59.x = _3825;
    float _3829 = -_3827;
    float _3831 = _3817 + _3829;
    float _3833 = -_3827;
    float _3835 = _3815 + _3833;
    float _3837 = -_3827;
    float _3839 = _3819 + _3837;
    float _3841 = fma(_3831, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3827);
    float _3843 = fma(_3835, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3827);
    float _3845 = fma(_3839, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3827);
    out.m_94.x = _3841;
    out.m_94.y = _3843;
    out.m_94.z = _3845;
    if (!_3813)
    {
        return out;
    }
    float _3847 = -_1420;
    float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3851 = -_1422;
    float _3853 = _3851 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3855 = -_1424;
    float _3857 = _3855 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3859 = _3849 * _3849;
    float _3861 = fma(_3853, _3853, _3859);
    float _3863 = fma(_3857, _3857, _3861);
    float _3865 = sqrt(_3863);
    float _3867 = rsqrt(_3863);
    float _3869 = -_3865;
    float _3871 = _3869 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3873 = _3871 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3875 = precise::clamp(_3873, 0.0, 1.0);
    float _3877 = _3853 * _3867;
    float _3879 = _3849 * _3867;
    float _3881 = abs(_3875);
    float _3883 = log2(_3881);
    float _3885 = _3857 * _3867;
    float _3887 = _3877 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3889 = _3567 * _3879;
    float _3891 = -_3879;
    float _3893 = -_3887;
    float _3895 = fma(_3891, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3893);
    float _3897 = fma(_3565, _3877, _3889);
    float _3899 = -_3885;
    float _3901 = fma(_3899, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3895);
    float _3903 = fma(_3569, _3885, _3897);
    float _3905 = precise::clamp(_3903, 0.0, 1.0);
    float _3907 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3909 = _3901 + _3907;
    float _3911 = _3883 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3913 = _3909 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3915 = precise::clamp(_3913, 0.0, 1.0);
    float _3917 = exp2(_3911);
    float _3919 = _3917 * _3915;
    float _3921 = _3905 * _3919;
    float _3923 = _3921 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3925 = _3921 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3927 = _3921 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _3923;
    out.m_92.y = _3925;
    out.m_92.z = _3927;
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
    bool _3699 = false;
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
        float _3984 = as_type<float>(_129);
        out.gl_Position.z = _3984;
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
        float _4054 = as_type<float>(_167);
        out.gl_Position.z = _4054;
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
    float2 _4203 = float2(_251, _255);
    float _257 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4203, float2(0.0), isnan(_4203)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4203, float2(0.0), isnan(_4203)), level(0.0)).x;
    float _259 = in.m_66.x;
    float _261 = in.m_66.y;
    float _263 = in.m_66.z;
    float _265 = in.m_66.w;
    float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _269 = log2(_267);
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _281 = _279 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _283 = 1.0 / _273;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _289 = _287 != 0;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _297 = 1.0 / _281;
    float _299 = _269 * _147;
    float _301 = _259 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _303 = 1.0 / _293;
    float _305 = -_285;
    float _307 = fma(_301, 2.0, _305);
    float _309 = _261 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _311 = _261 * 2.0;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _321 = fma(_309, -2.0, _295);
    float _323 = 1.0 / _277;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _327 = _217 + _325;
    float _329 = _259 * 2.0;
    float _331 = -_147;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[76].x, _307);
    float _335 = _327 * _297;
    float _337 = _263 * 2.0;
    float _339 = floor(_329);
    float _341 = _221 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _345 = _217 + _343;
    float _347 = fma(_319, _335, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _351 = fma(_219, (*spvDescriptorSet0.vp_c10)._m0[5].x, _341);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _217 + _353;
    float _357 = _345 * _283;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _361 = _217 + _359;
    float _363 = floor(_337);
    float _365 = _355 * _303;
    float _367 = _259 + _261;
    float _369 = _361 * _323;
    float _371 = _263 + _259;
    float _373 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[5].z, _351);
    float _375 = _367 + (-1.0);
    float _377 = _263 + _261;
    float _379 = _371 + (-1.0);
    float _381 = floor(_311);
    bool _383 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _385 = isnan(_217);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = fma(_315, _369, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _397 = _339 > 0.0;
    float _399 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _321);
    bool _401 = _339 >= 0.0;
    bool _403 = isnan(_339);
    bool _405 = _401 || _403;
    bool _407 = isnan(0.0);
    bool _409 = _405 || _407;
    float _411 = _373 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _413 = _363 > 0.0;
    float _415 = exp2(_299);
    float _417 = _377 + (-1.0);
    float _419 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _421 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _423 = isnan(_217);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _433;
    bool _437 = _363 >= 0.0;
    bool _439 = isnan(_363);
    bool _441 = _437 || _439;
    bool _443 = isnan(0.0);
    bool _445 = _441 || _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = -_431;
    float _461 = _459 + 1.0;
    bool _463 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _465 = isnan(_217);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = fma(_453, _365, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _477 = fma(_457, _365, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _479 = _393 * _461;
    float _481 = -_393;
    float _483 = _481 + 1.0;
    bool _485 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _487 = isnan(_217);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -_473;
    float _499 = _497 + 1.0;
    bool _501 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _503 = isnan(_217);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = fma(_435, _357, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _515 = fma(_449, _357, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _517 = _495 * _499;
    float _519 = -_495;
    float _521 = _519 + 1.0;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _523;
    bool _527 = _381 > 0.0;
    float _529 = _511 * _521;
    bool _531 = _381 >= 0.0;
    bool _533 = isnan(_381);
    bool _535 = _531 || _533;
    bool _537 = isnan(0.0);
    bool _539 = _535 || _537;
    float _541 = fma(_525, _369, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _543 = as_type<int>(_381);
    float _545 = _513;
    if (_289)
    {
        _543 = 0;
    }
    int _547 = _543;
    float _549 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _551 = _547;
    if (!_289)
    {
        _551 = 1;
    }
    int _553 = _551;
    float _555 = _513 * _529;
    float _557 = _515 * _529;
    int _559 = _409 ? 0 : 1;
    float _561 = _473 * _483;
    int _563 = _445 ? 0 : 1;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _569 = _553 != 1;
    float _571 = -_415;
    float _573 = _571 + 1.0;
    float _575 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _577 = int(_575);
    int _579 = ~_563;
    int _581 = _579 + 1;
    int _583 = _581 + 1;
    float _585 = fma(_567, _335, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _587 = _583;
    if (!_413)
    {
        int _589 = ~_563;
        int _591 = _589 + 1;
        _587 = _591;
    }
    int _593 = _587;
    float _595 = _411 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _599 = _597 != 0;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _607 = _605 != 0;
    float _609 = _411 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _611 = fma(_237, (*spvDescriptorSet0.vp_c8)._m0[11].x, _595);
    float _613 = fma(_237, (*spvDescriptorSet0.vp_c8)._m0[10].x, _609);
    bool _615 = !_603;
    int _617 = _615 ? 0 : 1;
    float _619 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _621 = !_599;
    int _623 = _621 ? 0 : 1;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _627 = !_607;
    int _629 = _627 ? 0 : 1;
    float _631 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[11].z, _611);
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _635 = _633 != 0;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _639 = _637 != 0;
    int _641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _643 = _641 != 0;
    float _645 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[10].z, _613);
    int _647 = ~_559;
    int _649 = _647 + 1;
    int _651 = _649 + 1;
    int _653 = _651;
    if (!_569)
    {
        _545 = _261;
    }
    float _655 = _545;
    float _657 = _645 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _659 = _655;
    if (!_397)
    {
        int _661 = ~_559;
        int _663 = _661 + 1;
        _653 = _663;
    }
    int _665 = _653;
    if (_569)
    {
        _659 = _259;
    }
    float _667 = _659;
    float _669 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _671 = int(_669);
    float _673 = float(_113);
    bool _675 = !_639;
    float _677 = _675 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _679 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[83].z, _625);
    float _681 = float(_577);
    float _683 = 1.0 / _673;
    float _685 = _539 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _689 = _667;
    float _691 = _677;
    float _693 = _685;
    if (!_569)
    {
        _689 = _263;
    }
    float _695 = _689;
    int _697 = abs(as_type<int>(_677));
    float _699 = _695;
    if (!_569)
    {
        _691 = _263;
    }
    float _701 = _691;
    float _703 = 1.0 / _681;
    float _705 = _701;
    if (_569)
    {
        _699 = _261;
    }
    float _707 = _699;
    if (_569)
    {
        _705 = _261;
    }
    float _709 = _705;
    int _711 = ~as_type<int>(_685);
    int _713 = _711 + 1;
    int _715 = _713 + 1;
    float _717 = _707 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _719 = _715;
    if (!_527)
    {
        int _721 = ~as_type<int>(_685);
        int _723 = _721 + 1;
        _719 = _723;
    }
    int _725 = _719;
    float _727 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[83].w, _687);
    if (!_569)
    {
        _693 = _261;
    }
    float _729 = _693;
    float _731 = fma(_717, -2.0, _349);
    float _733 = float(_665);
    float _735 = _683 * _147;
    float _737 = float(_697);
    float _739 = _703 * _147;
    float _741 = _729;
    if (_569)
    {
        _741 = _259;
    }
    float _743 = _741;
    float _745 = _737 * _733;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _749 = float(_671);
    float _751 = _743 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _753 = in.m_68.x;
    float _755 = in.m_68.y;
    float _757 = in.m_68.z;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _761 = 1.0 + _759;
    float _763 = -_747;
    float _765 = fma(_751, 2.0, _763);
    float _767 = 1.0 / _749;
    bool _769 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _771 = isnan(1.0);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _777 = _773 || _775;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _781 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _783 = isnan(0.0);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _789 = _785 || _787;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _793 = _631 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _795 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[78].w, _779);
    float _797 = _789 ? _573 : 0.0;
    float _799 = 1.0 / _761;
    float _801 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[78].z, _791);
    float _803 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _679);
    float _805 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _727);
    float _807 = -_147;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[81].x, _765);
    float _811 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _801);
    float _813 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _795);
    float _815 = _745 * (-2.0);
    float _817 = _767 * _147;
    float _819 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _731);
    bool _821 = !_643;
    int _823 = _821 ? 0 : 1;
    float _825 = _657 + _793;
    float _827 = float(_725);
    float _829 = 1.0 / _793;
    if (_777)
    {
        float _831 = _797 * _799;
        _149 = _831;
    }
    float _833 = _149;
    float _835 = fma(_815, _755, _755);
    bool _837 = !_635;
    int _839 = _837 ? 0 : 1;
    float _841 = fma(_549, _815, _549);
    float _843 = _261 + (-0.5);
    int _845 = abs(_823);
    int _847 = abs(_839);
    float _849 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[196].y, _835);
    float _851 = -_511;
    float _853 = _851 + 1.0;
    float _855 = float(_845);
    float _857 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].x, _555);
    float _859 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].y, _557);
    float _861 = _855 * _827;
    float _863 = float(_847);
    float _865 = _259 + (-0.5);
    float _867 = float(_593);
    float _869 = fma(_475, _517, _857);
    float _871 = _825 * _829;
    float _873 = _871 * 0.5;
    float _875 = fma(_477, _517, _859);
    float _877 = fma(_841, _833, _849);
    float _879 = _863 * _867;
    float _881 = fma(_541, _561, _869);
    float _883 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _885 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[30].w, _883);
    float _887 = fma(_395, _561, _875);
    float _889 = _879 * (-2.0);
    float _891 = fma(_585, _479, _881);
    float _893 = in.m_70.x;
    float _895 = in.m_70.y;
    float _897 = _877 * 0.15915493667125701904296875;
    float _899 = fma(_889, _753, _753);
    float _901 = fma(_619, _889, _619);
    float _903 = _861 * (-2.0);
    float _905 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[147].x, _891);
    float _907 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[196].x, _899);
    float _909 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _911 = fma(_903, _757, _757);
    float _913 = fma(_419, _903, _419);
    float _915 = fma(_901, _833, _907);
    float _917 = _263 + (-0.5);
    float _919 = 1.0 / _885;
    float _921 = _411 + _909;
    float _923 = _915 * 0.15915493667125701904296875;
    float _925 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[196].z, _911);
    float _927 = fma(_347, _479, _887);
    float _929 = _921 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _931 = fma(_913, _833, _925);
    float _933 = _897 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[147].y, _927);
    float _939 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _941 = _931 * 0.15915493667125701904296875;
    float _943 = _905 * _893;
    float _945 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _947 = _937 * _895;
    float _949 = _921 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _951 = _943 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _953 = _897 * 6.283185482025146484375;
    float _955 = cos(_953);
    float _957 = fma(_237, (*spvDescriptorSet0.vp_c15)._m0[127].x, _949);
    float _959 = _951 * _945;
    float _961 = fma(_237, (*spvDescriptorSet0.vp_c15)._m0[126].x, _929);
    float _963 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _965 = _947 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _967 = _923 * 6.283185482025146484375;
    float _969 = sin(_967);
    float _971 = fma(_239, (*spvDescriptorSet0.vp_c15)._m0[126].z, _961);
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _975 = _919 * _973;
    float _977 = _965 * _963;
    float _979 = fma(_239, (*spvDescriptorSet0.vp_c15)._m0[127].z, _957);
    float _981 = _971 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _983 = _975 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _985 = _923 * 6.283185482025146484375;
    float _987 = cos(_985);
    bool _989 = _975 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _991 = _979 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _993 = _941 * 6.283185482025146484375;
    float _995 = cos(_993);
    float _997 = _969 * _935;
    float _999 = _969 * _955;
    int _1001 = 2;
    if (!_983)
    {
        _1001 = 1;
    }
    int _1003 = _1001;
    float _1005 = _941 * 6.283185482025146484375;
    float _1007 = sin(_1005);
    float _1009 = _987 * _955;
    float _1011 = _987 * _935;
    float _1013 = _969 * _995;
    float _1015 = _955 * _995;
    float _1017 = _987 * _995;
    float _1019 = _935 * _995;
    bool _1021 = !_983;
    int _1023 = _1021 ? 0 : 1;
    float _1025 = trunc(_981);
    int _1027 = int(_1025);
    float _1029 = _1017 * _977;
    float _1031 = fma(_1007, _1009, _997);
    int _1033 = _1003;
    if (!_989)
    {
        _1033 = _1023;
    }
    int _1035 = _1033;
    float _1037 = fma(_1007, _997, _1009);
    float _1039 = -_977;
    float _1041 = _1007 * _1039;
    float _1043 = _1013 * _977;
    float _1045 = -_1011;
    float _1047 = fma(_1007, _999, _1045);
    float _1049 = trunc(_991);
    int _1051 = int(_1049);
    int _1053 = _1035 << 6;
    float _1055 = fma(_1015, _959, _1041);
    float _1057 = fma(_1047, _959, _1043);
    float _1059 = -_999;
    float _1061 = fma(_1007, _1011, _1059);
    int _1063 = _1053 + 96;
    uint _1066 = uint(int(uint(_1063) >> uint(2)));
    uint _1068 = uint(int(uint(int(_1066)) >> uint(2)));
    int _1070 = int(_1066) & 3;
    float _1072 = (*spvDescriptorSet0.vp_c15)._m0[int(_1068)][_1070];
    int _1074 = int(_1066) + 1;
    uint _1076 = uint(int(uint(_1074) >> uint(2)));
    int _1078 = _1074 & 3;
    float _1080 = (*spvDescriptorSet0.vp_c15)._m0[int(_1076)][_1078];
    float _1082 = fma(_1031, _959, _1029);
    float _1084 = fma(_1037, _939, _1057);
    int _1086 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1088 = _1027 + _1086;
    int _1090 = _1088 + 1;
    float _1092 = fma(_1019, _939, _1055);
    float _1094 = fma(_1061, _939, _1082);
    bool _1096 = _1090 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1098 = _1053 + 104;
    uint _1100 = uint(int(uint(_1098) >> uint(2)));
    uint _1102 = uint(int(uint(int(_1100)) >> uint(2)));
    int _1104 = int(_1100) & 3;
    float _1106 = (*spvDescriptorSet0.vp_c15)._m0[int(_1102)][_1104];
    int _1108 = int(_1100) + 1;
    uint _1110 = uint(int(uint(_1108) >> uint(2)));
    int _1112 = _1108 & 3;
    float _1114 = (*spvDescriptorSet0.vp_c15)._m0[int(_1110)][_1112];
    float _1116 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1118 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1120 = _1051 + _1118;
    int _1122 = _1120 + 1;
    float _1124 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1126 = _1090 | _1122;
    int _1128 = _1053 + 48;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
    int _1134 = int(_1130) & 3;
    float _1136 = (*spvDescriptorSet0.vp_c15)._m0[int(_1132)][_1134];
    int _1138 = int(_1130) + 1;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    int _1142 = _1138 & 3;
    float _1144 = (*spvDescriptorSet0.vp_c15)._m0[int(_1140)][_1142];
    float _1146 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1124);
    bool _1148 = _1126 < 0;
    bool _1150 = _1148 || _1096;
    float _1152 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1116);
    float _1154 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1146);
    bool _1156 = _1122 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1158 = _1156 || _1150;
    int _1160 = _1053 + 64;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    uint _1164 = uint(int(uint(int(_1162)) >> uint(2)));
    int _1166 = int(_1162) & 3;
    float _1168 = (*spvDescriptorSet0.vp_c15)._m0[int(_1164)][_1166];
    int _1170 = int(_1162) + 1;
    uint _1172 = uint(int(uint(_1170) >> uint(2)));
    int _1174 = _1170 & 3;
    float _1176 = (*spvDescriptorSet0.vp_c15)._m0[int(_1172)][_1174];
    float _1178 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1152);
    float _1180 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1182 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1184 = _239 + _1180;
    int _1186 = _1053 + 56;
    uint _1188 = uint(int(uint(_1186) >> uint(2)));
    uint _1190 = uint(int(uint(int(_1188)) >> uint(2)));
    int _1192 = int(_1188) & 3;
    float _1194 = (*spvDescriptorSet0.vp_c15)._m0[int(_1190)][_1192];
    int _1196 = int(_1188) + 1;
    uint _1198 = uint(int(uint(_1196) >> uint(2)));
    int _1200 = _1196 & 3;
    float _1202 = (*spvDescriptorSet0.vp_c15)._m0[int(_1198)][_1200];
    float _1204 = _237 + _1182;
    float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1208 = _1184 + _1206;
    int _1210 = _1090;
    int _1212 = as_type<int>(_1178);
    float _1214 = _1184;
    if (!_1158)
    {
        int _1216 = _1122 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1218 = _1216 + _1090;
        _1210 = _1218;
    }
    int _1220 = _1210;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1224 = _1204 + _1222;
    float _1226 = _1208 * _1208;
    int _1228 = _1053 + 72;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    int _1246 = 0;
    float _1248 = as_type<float>(_1220);
    if (!_1158)
    {
        int _1250 = _1220 << 2;
        _1246 = _1250;
    }
    int _1252 = _1246;
    float _1254 = fma(_1224, _1224, _1226);
    int _1256 = _1252;
    if (!_1158)
    {
        uint _1258 = uint(int(uint(_1220) >> uint(2)));
        _1212 = int(_1258);
    }
    int _1260 = _1212;
    int _1262 = _1260;
    if (!_1158)
    {
        int _1264 = 12 & _1252;
        _1256 = _1264;
    }
    int _1266 = _1256;
    float _1268 = sqrt(_1254);
    int _1270 = _1053 + 80;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
    int _1276 = int(_1272) & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    int _1280 = int(_1272) + 1;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    int _1284 = _1280 & 3;
    float _1286 = (*spvDescriptorSet0.vp_c15)._m0[int(_1282)][_1284];
    float _1288 = _921 * _1080;
    if (!_1158)
    {
        int _1290 = _1260 << 4;
        int _1292 = _1290 + _1266;
        _1262 = _1292;
    }
    int _1294 = _1262;
    float _1296 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1298 = fma(_237, _1072, _1288);
    float _1300 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1296);
    float _1302 = fma(_239, _1106, _1298);
    float _1304 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1300);
    float _1306 = _1302 + _1114;
    bool _1308 = _1268 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1310 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1312 = _921 * _1144;
    float _1314 = 1.0 / _1306;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1322 = _1320 != 0;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1326 = _1324 != 0;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1330 = _1328 != 0;
    float _1332 = fma(_237, _1136, _1312);
    bool _1334 = !_1322;
    int _1336 = _1334 ? 0 : 1;
    float _1338 = _921 * _1176;
    float _1340 = _1136;
    float _1342 = _1168;
    if (!_1158)
    {
        float _1344 = floor(_981);
        _1340 = _1344;
    }
    float _1346 = _1340;
    bool _1348 = !_1318;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = fma(_237, _1168, _1338);
    bool _1354 = !_1326;
    int _1356 = _1354 ? 0 : 1;
    bool _1358 = !_1330;
    int _1360 = _1358 ? 0 : 1;
    float _1362 = fma(_239, _1194, _1332);
    float _1364 = _1352;
    if (!_1308)
    {
        _1342 = _1204;
    }
    float _1366 = _1342;
    float _1368 = fma(_239, _1236, _1352);
    float _1370 = _1362 + _1202;
    float _1372 = _411 + _1310;
    float _1374 = _1368 + _1244;
    float _1376 = _1366;
    if (!_1308)
    {
        _1364 = _1372;
    }
    float _1378 = _1364;
    bool _1380 = !_1308;
    float _1382 = _1378;
    if (!_1380)
    {
        float _1384 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1388 = _1268 + _1386;
        float _1390 = _1372 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1392 = rsqrt(_1254);
        float _1394 = _1388 * _1384;
        float _1396 = _1394 * 0.15915493667125701904296875;
        float _1398 = _1396 * 6.283185482025146484375;
        float _1400 = cos(_1398);
        float _1402 = _1396 * 6.283185482025146484375;
        float _1404 = sin(_1402);
        float _1406 = _1400 + (-1.0);
        float _1408 = fma(_1404, _1390, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1410 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1412 = _1392 * _1408;
        float _1414 = fma(_1372, _1400, _1410);
        float _1416 = fma(_1224, _1412, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1418 = fma(_1208, _1412, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1382 = _1414;
        _1376 = _1416;
        _1214 = _1418;
    }
    float _1420 = _1382;
    float _1422 = _1376;
    float _1424 = _1214;
    int _1426 = _1053 + 88;
    uint _1428 = uint(int(uint(_1426) >> uint(2)));
    uint _1430 = uint(int(uint(int(_1428)) >> uint(2)));
    int _1432 = int(_1428) & 3;
    float _1434 = (*spvDescriptorSet0.vp_c15)._m0[int(_1430)][_1432];
    int _1436 = int(_1428) + 1;
    uint _1438 = uint(int(uint(_1436) >> uint(2)));
    int _1440 = _1436 & 3;
    float _1442 = (*spvDescriptorSet0.vp_c15)._m0[int(_1438)][_1440];
    float _1444 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1446 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1448 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1450 = _1370 * _1314;
    float _1452 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1444);
    float _1454 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1446);
    float _1456 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1448);
    float _1458 = _1224;
    if (!_1158)
    {
        int _1460 = _1294 + 400;
        uint _1462 = uint(int(uint(_1460) >> uint(2)));
        uint _1464 = uint(int(uint(int(_1462)) >> uint(2)));
        int _1466 = int(_1462) & 3;
        float _1468 = (*spvDescriptorSet0.vp_c15)._m0[int(_1464)][_1466];
        _1458 = _1468;
    }
    float _1470 = _1458;
    float _1472 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1452);
    bool _1474 = _1450 >= 0.0;
    float _1476 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1454);
    float _1478 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1480 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1456);
    float _1482 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1484 = _1374 * _1314;
    bool _1486 = _1450 <= 1.0;
    bool _1488 = _1486 && _1474;
    float _1490 = _1476 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1492 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1478);
    float _1494 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1496 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1498 = _1484 >= 0.0;
    bool _1500 = _1498 && _1488;
    float _1502 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1504 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1506 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1492);
    float _1508 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1496);
    bool _1510 = _1484 <= 1.0;
    bool _1512 = _1510 && _1500;
    float _1514 = -_1504;
    float _1516 = fma(_1514, _1502, 1.0);
    float _1518 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1520 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1508);
    float _1522 = _921 * _1286;
    float _1524 = _1362;
    float _1526 = _1476;
    if (!_1158)
    {
        float _1528 = floor(_991);
        _1524 = _1528;
    }
    float _1530 = _1524;
    float _1532 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1534 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1520);
    float _1536 = fma(_237, _1278, _1522);
    float _1538 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1540 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1532);
    float _1542 = log2(_1516);
    if (_1512)
    {
        float _1544 = float(_1035);
        _1526 = _1544;
    }
    float _1546 = _1526;
    float _1548 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1538);
    float _1550 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1540);
    float _1552 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1548);
    float _1554 = 1.0 / _1534;
    float _1556 = fma(_239, _1434, _1536);
    float _1558 = 0.0;
    float _1560 = _1548;
    if (!_1158)
    {
        float _1562 = -_1530;
        float _1564 = _991 + _1562;
        _1558 = _1564;
    }
    float _1566 = _1558;
    float _1568 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1550);
    float _1570 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1552);
    float _1572 = _1556 + _1442;
    float _1574 = _1532;
    float _1576 = _1568;
    if (_1512)
    {
        float _1578 = rint(_1546);
        float _1580 = precise::max(_1578, 0.0);
        uint _1582 = uint(_1580);
        uint _1584 = clamp(_1582, 0u, 65535u);
        _1574 = as_type<float>(_1584);
    }
    float _1586 = _1574;
    float _1588 = _1572 * _1314;
    float _1590 = _1542 * 0.693147182464599609375;
    float _1592 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1594 = _1590;
    if (!_1158)
    {
        float _1596 = -_1346;
        float _1598 = _981 + _1596;
        _1594 = _1598;
    }
    float _1600 = _1594;
    float _1602 = _1572;
    if (!_1158)
    {
        float _1604 = rint(_1470);
        float _1606 = precise::max(_1604, 0.0);
        uint _1608 = uint(_1606);
        uint _1610 = clamp(_1608, 0u, 65535u);
        _1602 = as_type<float>(_1610);
    }
    float _1612 = _1602;
    float _1614 = _1568 * _1554;
    float _1616 = _1570 * _1554;
    float _1618 = fma(_1614, 0.5, 0.5);
    float _1620 = fma(_1616, -0.5, 0.5);
    float _1622 = _1346;
    if (_1512)
    {
        float3 _6417 = float3(_1450, _1484, float(as_type<int>(_1586)));
        float3 _6421 = select(_6417, float3(0.0), isnan(_6417));
        float _1624 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6421.xy, uint(rint(_6421.z)), _1588, level(0.0));
        _1622 = _1624;
    }
    float _1626 = _1622;
    float3 _6431 = float3(_1618, _1620, _1592);
    float _1628 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6431, float3(0.0), isnan(_6431)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6431, float3(0.0), isnan(_6431)), level(0.0)).x;
    float3 _6440 = float3(_1618, _1620, _1592);
    float4 _1631 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6440, float3(0.0), isnan(_6440)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6440, float3(0.0), isnan(_6440)), level(0.0)).xyzw;
    float _1633 = _1631.x;
    float _1635 = _1631.y;
    float _1637 = _1631.z;
    float _1639 = _1631.w;
    float _1641 = _1566;
    if (!_1158)
    {
        float3 _6463 = float3(_1600, _1566, float(as_type<int>(_1612)));
        float3 _6465 = select(_6463, float3(0.0), isnan(_6463));
        float _1643 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6465.xy, uint(rint(_6465.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6465.xy, uint(rint(_6465.z)), level(0.0)).x;
        _1641 = _1643;
    }
    float _1645 = _1641;
    float _1647 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1649 = int(_1647);
    int _1651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1653 = _1651 != 0;
    int _1655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1657 = _1655 != 0;
    int _1659 = abs(_617);
    int _1661 = abs(_1336);
    float _1663 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1665 = int(_1663);
    int _1667 = abs(_1350);
    int _1669 = abs(_1356);
    int _1671 = abs(_1360);
    float _1673 = as_type<float>(_1661);
    if (_1653)
    {
        float _1675 = in.m_66.x;
        _1560 = _1675;
    }
    float _1677 = _1560;
    float _1679 = float(uint(_1649));
    float _1681 = trunc(_739);
    int _1683 = int(_1681);
    float _1685 = _1677;
    if (!_1653)
    {
        float _1687 = in.m_66.y;
        _1685 = _1687;
    }
    float _1689 = _1685;
    int _1691 = ~_1649;
    int _1693 = _1691 + 1;
    float _1695 = float(uint(_1665));
    float _1697 = 1.0 / _1679;
    int _1699 = ~_1665;
    int _1701 = _1699 + 1;
    float _1703 = 1.0 / _1695;
    float _1705 = trunc(_817);
    int _1707 = int(_1705);
    int _1709 = as_type<int>(_1697) + (-2);
    float _1711 = float(uint(_1683));
    float _1713 = float(_1683);
    int _1715 = as_type<int>(_1703) + (-2);
    float _1717 = as_type<float>(_1709) * _1711;
    float _1719 = _1711;
    if (_1653)
    {
        _1719 = 1.0;
    }
    float _1721 = _1719;
    float _1723 = _1721;
    if (!_1653)
    {
        _1723 = 7.345489978790283203125;
    }
    float _1725 = _1723;
    float _1727 = trunc(_1717);
    float _1729 = precise::max(_1727, 0.0);
    uint _1731 = uint(_1729);
    float _1733 = float(uint(_1707));
    float _1735 = _1725 * _259;
    float _1737 = as_type<float>(_1715) * _1733;
    float _1739 = _1733;
    if (_1653)
    {
        _1739 = 1.0;
    }
    float _1741 = _1739;
    float _1743 = floor(_1735);
    float _1745 = _1741;
    if (!_1653)
    {
        _1745 = 1.2345600128173828125;
    }
    float _1747 = _1745;
    float _1749 = _1689 * _1747;
    float _1751 = trunc(_1737);
    float _1753 = precise::max(_1751, 0.0);
    uint _1755 = uint(_1753);
    int _1757 = _1693 * int(_1731);
    int _1759 = _1757 + _1683;
    float _1761 = float(uint(_1759));
    float _1763 = floor(_1749);
    float _1765 = float(_1649);
    float _1767 = as_type<float>(_1709) * _1761;
    int _1769 = _1701 * int(_1755);
    int _1771 = _1769 + _1707;
    float _1773 = trunc(_1767);
    float _1775 = precise::max(_1773, 0.0);
    uint _1777 = uint(_1775);
    float _1779 = float(uint(_1771));
    float _1781 = -_1763;
    float _1783 = _1749 + _1781;
    float _1785 = float(_1665);
    float _1787 = as_type<float>(_1715) * _1779;
    float _1789 = -_1743;
    float _1791 = _1735 + _1789;
    int _1793 = ~_1649;
    int _1795 = _1793 + 1;
    bool _1797 = _1713 >= _1765;
    bool _1799 = isnan(_1713);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(_1765);
    bool _1805 = _1801 || _1803;
    float _1807 = float(_1805);
    float _1809 = _1783 * _1785;
    float _1811 = trunc(_1787);
    float _1813 = precise::max(_1811, 0.0);
    uint _1815 = uint(_1813);
    int _1817 = int(_1731) + int(_1777);
    float _1819 = _1791 * _1765;
    float _1821 = _1765 * _735;
    float _1823 = _1785 * _735;
    int _1825 = _1795 * _1817;
    int _1827 = _1825 + _1683;
    float _1829 = trunc(_1807);
    int _1831 = int(_1829);
    bool _1833 = uint(_1827) >= uint(_1649);
    bool _1835 = !_1833;
    int _1837 = _1835 ? 0 : (-1);
    float _1839 = trunc(_1819);
    int _1841 = int(_1839);
    int _1843 = int(_1755) + int(_1815);
    float _1845 = float(_1707);
    int _1847 = ~_1665;
    int _1849 = _1847 + 1;
    bool _1851 = _1845 >= _1785;
    bool _1853 = isnan(_1845);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan(_1785);
    bool _1859 = _1855 || _1857;
    float _1861 = float(_1859);
    float _1863 = trunc(_1809);
    int _1865 = int(_1863);
    int _1867 = _1849 * _1843;
    int _1869 = _1867 + _1707;
    int _1871 = ~_1817;
    int _1873 = _1871 + _1837;
    int _1875 = _1873 + 1;
    int _1877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1879 = _1877 != 0;
    int _1881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1883 = _1881 != 0;
    float _1885 = trunc(_1861);
    int _1887 = int(_1885);
    bool _1889 = uint(_1869) >= uint(_1665);
    bool _1891 = !_1879;
    int _1893 = _1891 ? 0 : 1;
    bool _1895 = !_1883;
    int _1897 = _1895 ? 0 : 1;
    int _1899 = abs(_1893);
    int _1901 = _1649 * _1875;
    int _1903 = _1901 + _1683;
    bool _1905 = !_1889;
    int _1907 = _1905 ? 0 : (-1);
    float _1909 = trunc(_1821);
    int _1911 = int(_1909);
    int _1913 = abs(_1897);
    bool _1915 = _1649 == 0;
    int _1917 = ~_1843;
    int _1919 = _1917 + _1907;
    int _1921 = _1919 + 1;
    int _1923 = _1841 * _1899;
    int _1925 = _1923 + _1683;
    float _1927 = trunc(_1823);
    int _1929 = int(_1927);
    int _1931 = ~_1831;
    int _1933 = _1931 + 1;
    int _1935 = _1933 + 1;
    int _1937 = _1665 * _1921;
    int _1939 = _1937 + _1707;
    bool _1941 = !_1915;
    int _1943 = _1941 ? _1903 : (-1);
    int _1945 = _1865 * _1913;
    int _1947 = _1945 + _1707;
    bool _1949 = _1665 == 0;
    int _1951 = ~_1887;
    int _1953 = _1951 + 1;
    int _1955 = _1953 + 1;
    int _1957 = _1943 * _1935;
    bool _1959 = !_1949;
    int _1961 = _1959 ? _1939 : (-1);
    int _1963 = _1649 + (-1);
    int _1965 = _1665 + (-1);
    int _1967 = _1961 * _1955;
    int _1969 = _1831 * _1963;
    int _1971 = _1969 + _1957;
    int _1973 = _1887 * _1965;
    int _1975 = _1973 + _1967;
    int _1977 = abs(_623);
    int _1979 = _1971 * _1659;
    bool _1981 = !_1657;
    int _1983 = _1981 ? 0 : 1;
    int _1985 = abs(_629);
    int _1987 = _1911 * _1977;
    int _1989 = _1987 + _1979;
    int _1991 = abs(_1983);
    int _1993 = _1975 * _1661;
    int _1995 = _1925 * _1985;
    int _1997 = _1995 + _1989;
    int _1999 = _1929 * _1667;
    int _2001 = _1999 + _1993;
    int _2003 = ~_1665;
    int _2005 = _2003 + 1;
    int _2007 = _1841 * _1991;
    int _2009 = _2007 + _1997;
    int _2011 = _1947 * _1669;
    int _2013 = _2011 + _2001;
    int _2015 = ~_1649;
    int _2017 = _2015 + 1;
    float _2019 = float(uint(_2009));
    int _2021 = _1865 * _1671;
    int _2023 = _2021 + _2013;
    int _2025 = ~_1649;
    int _2027 = _2025 + 1;
    int _2029 = ~_1665;
    int _2031 = _2029 + 1;
    float _2033 = as_type<float>(_1709) * _2019;
    float _2035 = float(uint(_2023));
    float _2037 = float(uint(_1925));
    float _2039 = trunc(_2033);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    float _2045 = as_type<float>(_1715) * _2035;
    float _2047 = as_type<float>(_1709) * _2037;
    float _2049 = trunc(_2045);
    float _2051 = precise::max(_2049, 0.0);
    uint _2053 = uint(_2051);
    int _2055 = _2017 * int(_2043);
    int _2057 = _2055 + _2009;
    float _2059 = trunc(_2047);
    float _2061 = precise::max(_2059, 0.0);
    uint _2063 = uint(_2061);
    float _2065 = float(uint(_2057));
    int _2067 = _2005 * int(_2053);
    int _2069 = _2067 + _2023;
    float _2071 = as_type<float>(_1709) * _2065;
    float _2073 = float(uint(_2069));
    int _2075 = ~_1649;
    int _2077 = _2075 + 1;
    float _2079 = trunc(_2071);
    float _2081 = precise::max(_2079, 0.0);
    uint _2083 = uint(_2081);
    float _2085 = as_type<float>(_1715) * _2073;
    float _2087 = float(uint(_1947));
    int _2089 = _2077 * int(_2063);
    int _2091 = _2089 + _1925;
    float _2093 = trunc(_2085);
    float _2095 = precise::max(_2093, 0.0);
    uint _2097 = uint(_2095);
    float _2099 = as_type<float>(_1715) * _2087;
    float _2101 = float(uint(_2091));
    int _2103 = ~_1665;
    int _2105 = _2103 + 1;
    float _2107 = as_type<float>(_1709) * _2101;
    float _2109 = trunc(_2099);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = int(_2043) + int(_2083);
    int _2117 = int(_2053) + int(_2097);
    int _2119 = _2027 * _2115;
    int _2121 = _2119 + _2009;
    float _2123 = trunc(_2107);
    float _2125 = precise::max(_2123, 0.0);
    uint _2127 = uint(_2125);
    int _2129 = _2031 * _2117;
    int _2131 = _2129 + _2023;
    bool _2133 = uint(_2121) >= uint(_1649);
    int _2135 = _2105 * int(_2113);
    int _2137 = _2135 + _1947;
    bool _2139 = !_2133;
    int _2141 = _2139 ? 0 : (-1);
    bool _2143 = uint(_2131) >= uint(_1665);
    float _2145 = float(uint(_2137));
    int _2147 = ~_2115;
    int _2149 = _2147 + _2141;
    int _2151 = _2149 + 1;
    bool _2153 = !_2143;
    int _2155 = _2153 ? 0 : (-1);
    float _2157 = as_type<float>(_1715) * _2145;
    int _2159 = int(_2063) + int(_2127);
    int _2161 = _1649 * _2151;
    int _2163 = _2161 + _2009;
    int _2165 = ~_2117;
    int _2167 = _2165 + _2155;
    int _2169 = _2167 + 1;
    float _2171 = as_type<float>(_2115);
    if (_1158)
    {
        _2171 = 1.0;
    }
    float _2173 = _2171;
    float _2175 = _2173;
    if (!_1158)
    {
        int _2177 = _1220 << 4;
        int _2179 = _2177 + 2048;
        uint _2181 = uint(int(uint(_2179) >> uint(2)));
        uint _2183 = uint(int(uint(int(_2181)) >> uint(2)));
        int _2185 = int(_2181) & 3;
        float _2187 = (*spvDescriptorSet0.vp_c15)._m0[int(_2183)][_2185];
        int _2189 = int(_2181) + 1;
        uint _2191 = uint(int(uint(_2189) >> uint(2)));
        int _2193 = _2189 & 3;
        float _2195 = (*spvDescriptorSet0.vp_c15)._m0[int(_2191)][_2193];
        int _2197 = _2179 + 8;
        uint _2199 = uint(int(uint(_2197) >> uint(2)));
        uint _2201 = uint(int(uint(int(_2199)) >> uint(2)));
        int _2203 = int(_2199) & 3;
        float _2205 = (*spvDescriptorSet0.vp_c15)._m0[int(_2201)][_2203];
        int _2207 = int(_2199) + 1;
        uint _2209 = uint(int(uint(_2207) >> uint(2)));
        int _2211 = _2207 & 3;
        float _2213 = (*spvDescriptorSet0.vp_c15)._m0[int(_2209)][_2211];
        float _2215 = _921 * _2195;
        float _2217 = fma(_237, _2187, _2215);
        float _2219 = fma(_239, _2205, _2217);
        float _2221 = _2219 + _2213;
        float _2223 = precise::clamp(_2221, 0.0, 1.0);
        float _2225 = -_2223;
        float _2227 = _2225 + _1645;
        float _2229 = fma(_2227, 500.0, 1.5);
        float _2231 = exp2(_2229);
        float _2233 = 0.0 + _2231;
        float _2235 = precise::clamp(_2233, 0.0, 1.0);
        _1248 = as_type<float>(_2179);
        _2175 = _2235;
    }
    float _2237 = _1248;
    float _2239 = _2175;
    float _2241 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2243 = _1420 + _2241;
    float _2245 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2247 = _1422 + _2245;
    float _2249 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2251 = _1424 + _2249;
    float _2253 = _2243 * _2243;
    float _2255 = fma(_2247, _2247, _2253);
    float _2257 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2259 = fma(_2251, _2251, _2255);
    float _2261 = rsqrt(_2259);
    float _2263 = sqrt(_2259);
    float _2265 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2267 = _2247 * _2265;
    float _2269 = _2251 * _2265;
    float _2271 = _2267 * _2267;
    float _2273 = _2269 * _2269;
    float _2275 = _2271 + _2273;
    float _2277 = sqrt(_2275);
    bool _2279 = _2277 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2283 = _2277 + _2281;
    float _2285 = _2237;
    float _2287 = _2275;
    float _2289 = _2283;
    float _2291 = _2257;
    float _2293 = _2267;
    float _2295 = _2269;
    float _2297 = _2271;
    float _2299 = _2273;
    if (_2279)
    {
        float _2301 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2285 = _2301;
    }
    float _2303 = _2285;
    if (_2279)
    {
        float _2305 = rsqrt(_2275);
        _2287 = _2305;
    }
    float _2307 = _2287;
    if (_2279)
    {
        float _2309 = _2283 * _2303;
        _2289 = _2309;
    }
    float _2311 = _2289;
    float _2313 = precise::max(0.0, _2257);
    float _2315 = _2313;
    if (_2279)
    {
        float _2317 = _2311 * 0.15915493667125701904296875;
        _1673 = _2317;
    }
    float _2319 = _1673;
    float _2321 = -_2265;
    float _2323 = -_2313;
    float _2325 = fma(_2243, _2321, _2323);
    float _2327 = as_type<float>(_2127);
    float _2329 = _2325;
    if (_2279)
    {
        float _2331 = _2319 * 6.283185482025146484375;
        float _2333 = sin(_2331);
        _2327 = _2333;
    }
    float _2335 = _2327;
    if (_2279)
    {
        float _2337 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2315 = _2337;
    }
    float _2339 = _2315;
    float _2341 = _2311;
    float _2343 = _2339;
    if (_2279)
    {
        float _2345 = _2319 * 6.283185482025146484375;
        float _2347 = cos(_2345);
        _2341 = _2347;
    }
    float _2349 = _2341;
    float _2351 = _2335;
    if (_2279)
    {
        float _2353 = fma(_2335, _2339, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2343 = _2353;
    }
    float _2355 = _2343;
    float _2357 = _2355;
    if (_2279)
    {
        float _2359 = _2307 * _2355;
        _2351 = _2359;
    }
    float _2361 = _2351;
    if (_2279)
    {
        float _2363 = _2349 + (-1.0);
        _2291 = _2363;
    }
    float _2365 = _2291;
    if (_2279)
    {
        float _2367 = _2267 * _2361;
        _2293 = _2367;
    }
    float _2369 = _2293;
    if (_2279)
    {
        float _2371 = _2269 * _2361;
        _2295 = _2371;
    }
    float _2373 = _2295;
    if (_2279)
    {
        float _2375 = _2365 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2357 = _2375;
    }
    float _2377 = _2357;
    if (_2279)
    {
        float _2379 = _2369 * _2369;
        _2297 = _2379;
    }
    float _2381 = _2297;
    if (_2279)
    {
        float _2383 = _2373 * _2373;
        _2299 = _2383;
    }
    float _2385 = _2299;
    int _2387 = ~_1649;
    int _2389 = _2387 + 1;
    if (_2279)
    {
        float _2391 = fma(_2325, _2349, _2377);
        _2329 = _2391;
    }
    float _2393 = _2329;
    float _2395 = fma(_2393, _2393, _2381);
    float _2397 = _2395 + _2385;
    float _2399 = rsqrt(_2397);
    float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2403 = fma(_2263, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2401);
    float _2405 = precise::clamp(_2403, 0.0, 1.0);
    float _2407 = -_2405;
    float _2409 = _2407 + 1.0;
    float _2411 = abs(_2409);
    float _2413 = log2(_2411);
    float _2415 = _2399 * _2369;
    float _2417 = _2399 * _2393;
    float _2419 = _2399 * _2373;
    float _2421 = _2415 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2423 = _2417 + 1.0;
    float _2425 = -_2421;
    float _2427 = fma(_2417, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2425);
    float _2429 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2431 = -_2419;
    float _2433 = fma(_2431, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2427);
    float _2435 = exp2(_2429);
    float _2437 = fma(_2433, -0.5, 0.5);
    float _2439 = fma(_2433, 0.5, 0.5);
    float _2441 = fma(_2439, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2443 = sqrt(_2437);
    float _2445 = fma(_2439, _2441, -0.212114393711090087890625);
    float _2447 = fma(_2439, _2445, 1.570728778839111328125);
    float _2449 = -_2417;
    float _2451 = fma(_2435, _2423, _2449);
    bool _2453 = !_1915;
    int _2455 = _2453 ? _2163 : (-1);
    int _2457 = _2455 & 3;
    bool _2459 = _2457 != 0;
    float _2461 = _2443 * 0.636619746685028076171875;
    int _2463 = _2455 & 3;
    bool _2465 = _2463 != 0;
    float _2467 = -_2447;
    float _2469 = fma(_2461, _2467, 1.0);
    float _2471 = fma(_2451, 0.5, 0.5);
    int _2473 = _2389 * _2159;
    int _2475 = _2473 + _1925;
    bool _2477 = uint(_2463) > 1u;
    float2 _7632 = float2(_2469, _2471);
    float3 _2481 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7632, float2(0.0), isnan(_7632)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7632, float2(0.0), isnan(_7632)), level(0.0)).xyz;
    float _2483 = _2481.x;
    float _2485 = _2481.y;
    float _2487 = _2481.z;
    bool _2489 = uint(_2475) >= uint(_1649);
    int _2491 = _1665 * _2169;
    int _2493 = _2491 + _2023;
    int _2495 = _2459 ? 0 : 1;
    float _2497 = trunc(_2157);
    float _2499 = precise::max(_2497, 0.0);
    uint _2501 = uint(_2499);
    int _2503 = _2455 >> 31;
    float _2505 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2507 = _265 > 0.5;
    float _2509 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2511 = ~_2495;
    int _2513 = _2511 + 1;
    int _2515 = _2513 + 1;
    float _2517 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2505);
    bool _2519 = !_1949;
    int _2521 = _2519 ? _2493 : (-1);
    float _2523 = -_813;
    float _2525 = _2523 + 1.0;
    int _2527 = _2515;
    if (!_2477)
    {
        int _2529 = ~_2495;
        int _2531 = _2529 + 1;
        _2527 = _2531;
    }
    int _2533 = _2527;
    float _2535 = exp2(_2509);
    int _2537 = _2503 & 3;
    float _2539 = -_803;
    float _2541 = _2539 + 1.0;
    int _2543 = _2521 >> 31;
    float _2545 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2517);
    int _2547 = _2455 + _2537;
    float _2549 = -_805;
    float _2551 = _2549 + 1.0;
    int _2553 = _2543 & 3;
    float _2555 = -_257;
    float _2557 = _2555 + 1.0;
    bool _2559 = !_2489;
    int _2561 = _2559 ? 0 : (-1);
    float _2563 = -_811;
    float _2565 = _2563 + 1.0;
    bool _2567 = _2463 != 3;
    out.m_72.x = _1422;
    out.m_72.y = _1420;
    out.m_72.z = _1424;
    int _2569 = _2547 >> 2;
    int _2571 = _2521 + _2553;
    float _2573 = -_2535;
    float _2575 = _2573 + 1.0;
    bool _2577 = uint(_2463) >= 2u;
    int _2579 = _2569 << 4;
    int _2581 = _2579 + 368;
    int _2583 = _2571 >> 2;
    int _2585 = _2577 ? 0 : 1;
    uint _2587 = uint(int(uint(_2581) >> uint(2)));
    uint _2589 = uint(int(uint(int(_2587)) >> uint(2)));
    int _2591 = int(_2587) & 3;
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[int(_2589)][_2591];
    int _2595 = int(_2587) + 1;
    uint _2597 = uint(int(uint(_2595) >> uint(2)));
    int _2599 = _2595 & 3;
    float _2601 = (*spvDescriptorSet0.vp_c9)._m0[int(_2597)][_2599];
    int _2603 = _2583 << 4;
    int _2605 = _2603 + 512;
    int _2607 = ~_2585;
    int _2609 = _2607 + 1;
    int _2611 = _2609 + 1;
    int _2613 = _2611;
    if (_2567)
    {
        int _2615 = ~_2585;
        int _2617 = _2615 + 1;
        _2613 = _2617;
    }
    int _2619 = _2613;
    int _2621 = ~_2159;
    int _2623 = _2621 + _2561;
    int _2625 = _2623 + 1;
    uint _2627 = uint(int(uint(_2605) >> uint(2)));
    uint _2629 = uint(int(uint(int(_2627)) >> uint(2)));
    int _2631 = int(_2627) & 3;
    float _2633 = (*spvDescriptorSet0.vp_c9)._m0[int(_2629)][_2631];
    int _2635 = int(_2627) + 1;
    uint _2637 = uint(int(uint(_2635) >> uint(2)));
    int _2639 = _2635 & 3;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[int(_2637)][_2639];
    int _2643 = int(_2113) + int(_2501);
    float _2645 = -_187;
    int _2647 = _2507 ? as_type<int>(_2645) : as_type<int>(_187);
    int _2649 = _1649 * _2625;
    int _2651 = _2649 + _1925;
    bool _2653 = !_2465;
    int _2655 = _2653 ? 0 : 1;
    int _2657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2659 = _2657 != 0;
    int _2661 = _2521 & 3;
    bool _2663 = _2661 != 0;
    int _2665 = _2521 & 3;
    bool _2667 = _2665 != 0;
    int _2669 = _2581 + 8;
    uint _2671 = uint(int(uint(_2669) >> uint(2)));
    uint _2673 = uint(int(uint(int(_2671)) >> uint(2)));
    int _2675 = int(_2671) & 3;
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[int(_2673)][_2675];
    int _2679 = int(_2671) + 1;
    uint _2681 = uint(int(uint(_2679) >> uint(2)));
    int _2683 = _2679 & 3;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[int(_2681)][_2683];
    int _2687 = ~_1665;
    int _2689 = _2687 + 1;
    bool _2691 = !_2659;
    int _2693 = _2691 ? 0 : 1;
    bool _2695 = uint(_2665) > 1u;
    int _2697 = _2689 * _2643;
    int _2699 = _2697 + _1947;
    bool _2701 = !_1915;
    int _2703 = _2701 ? _2651 : (-1);
    int _2705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2707 = _2705 != 0;
    bool _2709 = _2463 != 3;
    bool _2711 = !_2707;
    int _2713 = _2711 ? 0 : 1;
    int _2715 = _2605 + 8;
    uint _2717 = uint(int(uint(_2715) >> uint(2)));
    uint _2719 = uint(int(uint(int(_2717)) >> uint(2)));
    int _2721 = int(_2717) & 3;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[int(_2719)][_2721];
    int _2725 = int(_2717) + 1;
    uint _2727 = uint(int(uint(_2725) >> uint(2)));
    int _2729 = _2725 & 3;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[int(_2727)][_2729];
    int _2733 = _2663 ? 0 : 1;
    bool _2735 = uint(_2699) >= uint(_1665);
    bool _2737 = _2665 != 3;
    bool _2739 = !_2709;
    int _2741 = _2739 ? 0 : (-1);
    bool _2743 = !_2667;
    int _2745 = _2743 ? 0 : 1;
    bool _2747 = uint(_2665) >= 2u;
    bool _2749 = _2665 != 3;
    int _2751 = ~_2733;
    int _2753 = _2751 + 1;
    int _2755 = _2753 + 1;
    int _2757 = _2755;
    if (!_2695)
    {
        int _2759 = ~_2733;
        int _2761 = _2759 + 1;
        _2757 = _2761;
    }
    int _2763 = _2757;
    int _2765 = _2747 ? 0 : 1;
    bool _2767 = !_2749;
    int _2769 = _2767 ? 0 : (-1);
    int _2771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2773 = _2771 != 0;
    int _2775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2777 = _2775 != 0;
    int _2779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2781 = _2779 != 0;
    bool _2783 = !_2735;
    int _2785 = _2783 ? 0 : (-1);
    int _2787 = abs(_2533);
    bool _2789 = _259 > 0.5;
    int _2791 = ~_2643;
    int _2793 = _2791 + _2785;
    int _2795 = _2793 + 1;
    int _2797 = ~_2765;
    int _2799 = _2797 + 1;
    int _2801 = _2799 + 1;
    int _2803 = _1665 * _2795;
    int _2805 = _2803 + _1947;
    int _2807 = _2801;
    if (_2737)
    {
        int _2809 = ~_2765;
        int _2811 = _2809 + 1;
        _2807 = _2811;
    }
    int _2813 = _2807;
    int _2815 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2817 = _2815 != 0;
    int _2819 = abs(_2763);
    int _2821 = abs(_2655);
    int _2823 = ~_2787;
    int _2825 = _2823 + 1;
    int _2827 = _2825 + 1;
    int _2829 = abs(_2745);
    int _2831 = _2827 * as_type<int>(_2601);
    int _2833 = ~_2819;
    int _2835 = _2833 + 1;
    int _2837 = _2835 + 1;
    int _2839 = ~_2821;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    int _2845 = _2837 * as_type<int>(_2641);
    int _2847 = abs(_2813);
    int _2849 = abs(_2619);
    int _2851 = ~_2829;
    int _2853 = _2851 + 1;
    int _2855 = _2853 + 1;
    int _2857 = _2843 * as_type<int>(_2593);
    int _2859 = _2857 + _2831;
    int _2861 = ~_2849;
    int _2863 = _2861 + 1;
    int _2865 = _2863 + 1;
    float _2867 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2869 = int(_2867);
    int _2871 = _2855 * as_type<int>(_2633);
    int _2873 = _2871 + _2845;
    int _2875 = _2865 * as_type<int>(_2677);
    int _2877 = _2875 + _2859;
    float _2879 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2881 = abs(_2741);
    float _2883 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2885 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2887 = ~_2881;
    int _2889 = _2887 + 1;
    int _2891 = _2889 + 1;
    float _2893 = _2879 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2895 = _2883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2897 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2899 = _2885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2901 = _2891 * as_type<int>(_2685);
    int _2903 = _2901 + _2877;
    int _2905 = abs(_2869);
    float _2907 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2909 = int(_2907);
    int _2911 = abs(_2693);
    out.m_74.x = _2893;
    out.m_74.y = _2895;
    out.m_74.z = _2899;
    out.m_74.w = _2897;
    bool _2913 = !_1949;
    int _2915 = _2913 ? _2805 : (-1);
    float _2917 = float(uint(_2869));
    bool _2919 = _261 > 0.5;
    int _2921 = abs(_2769);
    int _2923 = ~_2847;
    int _2925 = _2923 + 1;
    int _2927 = _2925 + 1;
    float _2929 = 1.0 / _2917;
    int _2931 = ~_2921;
    int _2933 = _2931 + 1;
    int _2935 = _2933 + 1;
    int _2937 = _2927 * as_type<int>(_2723);
    int _2939 = _2937 + _2873;
    int _2941 = abs(_2713);
    float _2943 = abs(_975);
    float _2945 = log2(_2943);
    int _2947 = _2935 * as_type<int>(_2731);
    int _2949 = _2947 + _2939;
    float _2951 = float(uint(_2909));
    float _2953 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2955 = ~_2911;
    int _2957 = _2955 + 1;
    int _2959 = _2957 + 1;
    float _2961 = -_183;
    int _2963 = _2789 ? as_type<int>(_2961) : as_type<int>(_183);
    float _2965 = _2953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2967 = _263 > 0.5;
    int _2969 = _2903 * _2959;
    float _2971 = 1.0 / _2951;
    int _2973 = as_type<int>(_2929) + (-2);
    float _2975 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2977 = _2703 * _2911;
    int _2979 = _2977 + _2969;
    float _2981 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2983 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2985 = -_1007;
    float _2987 = fma(_2985, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2981);
    float _2989 = float(uint(_2979));
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2993 = ~_2941;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    float _2999 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3001 = abs(_2909);
    float _3003 = as_type<float>(_2973) * _2989;
    float _3005 = float(uint(_2905));
    int _3007 = _2949 * _2997;
    float _3009 = float(uint(_3001));
    float _3011 = exp2(_2983);
    float _3013 = _2991 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3015 = _2999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3017 = _2915 * _2941;
    int _3019 = _3017 + _3007;
    float _3021 = _1017 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3023 = -_1007;
    float _3025 = fma(_3023, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2975);
    int _3027 = ~_2869;
    int _3029 = _3027 + 1;
    out.m_76.x = _2965;
    out.m_76.y = _3013;
    out.m_76.z = _3015;
    float _3031 = 1.0 / _3005;
    float _3033 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3035 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3037 = ~_3001;
    int _3039 = _3037 + 1;
    bool _3041 = !_2817;
    float _3043 = _3041 ? _183 : as_type<float>(_2963);
    bool _3045 = !_2773;
    float _3047 = _3045 ? _187 : as_type<float>(_2647);
    float _3049 = trunc(_3003);
    float _3051 = precise::max(_3049, 0.0);
    uint _3053 = uint(_3051);
    bool _3055 = _975 <= 8000.0;
    bool _3057 = isnan(_975);
    bool _3059 = _3055 || _3057;
    bool _3061 = isnan(8000.0);
    bool _3063 = _3059 || _3061;
    float _3065 = float(_3063);
    int _3067 = as_type<int>(_2971) + (-2);
    float _3069 = -_1007;
    float _3071 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3021);
    float _3073 = float(uint(_3019));
    float _3075 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2987);
    float _3077 = 1.0 / _3009;
    int _3079 = abs(_2979);
    float _3081 = as_type<float>(_3067) * _3073;
    int _3083 = as_type<int>(_3031) + (-2);
    float _3085 = fma(_3011, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3087 = precise::clamp(_3085, 0.0, 1.0);
    int _3089 = abs(_3019);
    float _3091 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3025);
    float _3093 = float(uint(_3079));
    float _3095 = trunc(_3081);
    float _3097 = precise::max(_3095, 0.0);
    uint _3099 = uint(_3097);
    int _3101 = _3029 * int(_3053);
    int _3103 = _3101 + _2979;
    float _3105 = float(uint(_3089));
    float _3107 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3071);
    float _3109 = as_type<float>(_3083) * _3093;
    float _3111 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3033);
    float _3113 = float(uint(_3103));
    float _3115 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3035);
    int _3117 = as_type<int>(_3077) + (-2);
    float _3119 = trunc(_3109);
    float _3121 = precise::max(_3119, 0.0);
    uint _3123 = uint(_3121);
    int _3125 = ~_2909;
    int _3127 = _3125 + 1;
    float _3129 = as_type<float>(_3117) * _3105;
    float _3131 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3133 = as_type<float>(_2973) * _3113;
    float _3135 = trunc(_3129);
    float _3137 = precise::max(_3135, 0.0);
    uint _3139 = uint(_3137);
    int _3141 = ~_2905;
    int _3143 = _3141 + 1;
    float _3145 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3131);
    float _3147 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3149 = _3127 * int(_3099);
    int _3151 = _3149 + _3019;
    float _3153 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3155 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3157 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3147);
    int _3159 = _3143 * int(_3123);
    int _3161 = _3159 + _3079;
    float _3163 = float(uint(_3151));
    float _3165 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3153);
    float _3167 = trunc(_3133);
    float _3169 = precise::max(_3167, 0.0);
    uint _3171 = uint(_3169);
    float _3173 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3155);
    float _3175 = float(uint(_3161));
    float _3177 = as_type<float>(_3067) * _3163;
    float _3179 = -_183;
    int _3181 = _2967 ? as_type<int>(_3179) : as_type<int>(_183);
    int _3183 = _3039 * int(_3139);
    int _3185 = _3183 + _3089;
    float _3187 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3115);
    float _3189 = as_type<float>(_3083) * _3175;
    float _3191 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3111);
    float _3193 = trunc(_3177);
    float _3195 = precise::max(_3193, 0.0);
    uint _3197 = uint(_3195);
    float _3199 = float(uint(_3185));
    float _3201 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3145);
    bool _3203 = !_2781;
    float _3205 = _3203 ? _183 : as_type<float>(_3181);
    float _3207 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3209 = -_187;
    int _3211 = _2919 ? as_type<int>(_3209) : as_type<int>(_187);
    float _3213 = as_type<float>(_3117) * _3199;
    float _3215 = trunc(_3189);
    float _3217 = precise::max(_3215, 0.0);
    uint _3219 = uint(_3217);
    bool _3221 = !_2777;
    float _3223 = _3221 ? _187 : as_type<float>(_3211);
    float _3225 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3165);
    int _3227 = ~_2909;
    int _3229 = _3227 + 1;
    float _3231 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3233 = _3207 * _3075;
    int _3235 = int(_3053) + int(_3171);
    float _3237 = fma(_3087, -2.0, 3.0);
    float _3239 = trunc(_3213);
    float _3241 = precise::max(_3239, 0.0);
    uint _3243 = uint(_3241);
    int _3245 = int(_3099) + int(_3197);
    float _3247 = _3087 * _3087;
    int _3249 = ~_2905;
    int _3251 = _3249 + 1;
    float _3253 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3157);
    float _3255 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3173);
    int _3257 = _3229 * _3245;
    int _3259 = _3257 + _3019;
    float _3261 = fma(_3231, _3187, _3233);
    out.m_78.x = _3187;
    out.m_78.y = _3191;
    out.m_78.z = _3201;
    int _3263 = ~_2869;
    int _3265 = _3263 + 1;
    float _3267 = _3247 * _3237;
    int _3269 = ~_3001;
    int _3271 = _3269 + 1;
    int _3273 = int(_3123) + int(_3219);
    int _3275 = _3265 * _3235;
    int _3277 = _3275 + _2979;
    bool _3279 = uint(_3259) >= uint(_2909);
    int _3281 = int(_3139) + int(_3243);
    bool _3283 = !_3279;
    int _3285 = _3283 ? 0 : (-1);
    bool _3287 = uint(_3277) >= uint(_2869);
    int _3289 = _3251 * _3273;
    int _3291 = _3289 + _3079;
    int _3293 = ~_3245;
    int _3295 = _3293 + _3285;
    int _3297 = _3295 + 1;
    int _3299 = _3271 * _3281;
    int _3301 = _3299 + _3089;
    int _3303 = _2979 ^ _2869;
    float _3305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3307 = uint(_3291) >= uint(_2905);
    int _3309 = _2909 * _3297;
    int _3311 = _3309 + _3019;
    bool _3313 = !_3287;
    int _3315 = _3313 ? 0 : (-1);
    bool _3317 = uint(_3301) >= uint(_3001);
    bool _3319 = !_3307;
    int _3321 = _3319 ? 0 : (-1);
    float _3323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3325 = uint(int(uint(_3303) >> uint(31)));
    int _3327 = ~_3235;
    int _3329 = _3327 + _3315;
    int _3331 = _3329 + 1;
    int _3333 = ~_3321;
    int _3335 = _3273 + _3333;
    int _3337 = _3335 + 1;
    int _3339 = ~int(_3325);
    int _3341 = _3339 + 1;
    int _3343 = _2869 * _3331;
    int _3345 = _3343 + _2979;
    int _3347 = _3019 ^ _2909;
    float _3349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3351 = _3337 ^ _3341;
    bool _3353 = _2869 == 0;
    bool _3355 = _2909 == 0;
    float _3357 = _3323 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3359 = _2909 == 0;
    int _3361 = ~_3341;
    int _3363 = _3361 + _3351;
    int _3365 = _3363 + 1;
    float _3367 = _3305 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3369 = !_3317;
    int _3371 = _3369 ? 0 : (-1);
    uint _3373 = uint(int(uint(_3347) >> uint(31)));
    float _3375 = fma(_3207, _3207, 1.0);
    bool _3377 = !_3353;
    int _3379 = _3377 ? _3345 : (-1);
    bool _3381 = _2869 == 0;
    int _3383 = ~_3371;
    int _3385 = _3281 + _3383;
    int _3387 = _3385 + 1;
    float _3389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3391 = ~int(_3373);
    int _3393 = _3391 + 1;
    bool _3395 = !_3355;
    int _3397 = _3395 ? _3311 : (-1);
    float _3399 = float(_3379);
    int _3401 = _3387 ^ _3393;
    float _3403 = rsqrt(_3375);
    float _3405 = float(_3397);
    float _3407 = fma(_3367, _3399, _333);
    float _3409 = _3043 + 0.5;
    int _3411 = ~_3393;
    int _3413 = _3411 + _3401;
    int _3415 = _3413 + 1;
    bool _3417 = !_3381;
    int _3419 = _3417 ? _3365 : (-1);
    float _3421 = fma(_3357, _3405, _809);
    float _3423 = fma(_3367, _3409, _3407);
    float _3425 = _3205 + 0.5;
    bool _3427 = !_3359;
    int _3429 = _3427 ? _3415 : (-1);
    float _3431 = _3349 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3433 = float(_3419);
    float _3435 = fma(_3357, _3425, _3421);
    float _3437 = float(_3429);
    float _3439 = _3389 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3441 = _3223 + (-0.5);
    float _3443 = -_399;
    float _3445 = fma(_3431, _3433, _3443);
    float _3447 = _3047 + (-0.5);
    float _3449 = -_819;
    float _3451 = fma(_3439, _3437, _3449);
    float _3453 = _3207 * _3403;
    float _3455 = -_3431;
    float _3457 = fma(_3455, _3441, _3445);
    float _3459 = -_2541;
    float _3461 = fma(_3205, _3459, _3435);
    float _3463 = -_3439;
    float _3465 = fma(_3463, _3447, _3451);
    float _3467 = -_3225;
    float _3469 = _3453 * _3467;
    float _3471 = fma(_3223, _2525, _3457);
    float _3473 = -_3267;
    float _3475 = _3473 + 1.0;
    float _3477 = -_3253;
    float _3479 = _3453 * _3477;
    float _3481 = fma(_3403, _3091, _3469);
    float _3483 = _3207 * _3091;
    float _3485 = fma(_3475, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3267);
    float _3487 = -_3255;
    float _3489 = _3453 * _3487;
    float _3491 = fma(_3403, _3075, _3479);
    float _3493 = fma(_3231, _3191, _3483);
    float _3495 = _3065 * _3485;
    float _3497 = fma(_3403, _3107, _3489);
    float _3499 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2545);
    float _3501 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3503 = _3501;
    if (!_1512)
    {
        _1576 = 1.0;
    }
    float _3505 = _1576;
    float _3507 = fma(_3047, _2551, _3465);
    float _3509 = _3505;
    if (_1512)
    {
        bool _3511 = _1626 >= _1588;
        bool _3513 = isnan(_1626);
        bool _3515 = _3511 || _3513;
        bool _3517 = isnan(_1588);
        bool _3519 = _3515 || _3517;
        float _3521 = float(_3519);
        _3509 = _3521;
    }
    float _3523 = _3509;
    float _3525 = _2575 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3527 = _2557 * _3501;
    float _3529 = precise::clamp(_3527, 0.0, 1.0);
    float _3531 = -_2565;
    float _3533 = fma(_3043, _3531, _3423);
    float _3535 = _3499 + _1534;
    float _3537 = _3207 * _3107;
    float _3539 = _3523 * _2239;
    float _3541 = _3525 * _1628;
    float _3543 = -_3529;
    float _3545 = fma(_3543, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3547 = _3535 * 0.5;
    float _3549 = fma(_3231, _3201, _3537);
    float _3551 = _1639 * _3541;
    float _3553 = -_3539;
    float _3555 = fma(_3553, _3545, 1.0);
    float _3557 = precise::clamp(_3555, 0.0, 1.0);
    float _3559 = _2487 * _3541;
    float _3561 = -_3525;
    float _3563 = _3561 + 1.0;
    out.m_80.z = _3547;
    out.m_80.w = _1534;
    float _3565 = _3253 + _3261;
    float _3567 = _3225 + _3493;
    float _3569 = _3255 + _3549;
    float _3571 = fma(_2483, _3551, _1633);
    float _3573 = fma(_2485, _3551, _1635);
    float _3575 = _1639 * _3563;
    float _3577 = fma(_1639, _3559, _1637);
    out.m_82.x = _3491;
    out.m_82.y = _3481;
    out.m_82.z = _3497;
    bool _3579 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3581 = isnan(_2263);
    bool _3583 = _3579 || _3581;
    bool _3585 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3587 = _3583 || _3585;
    float _3589 = _3557 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_84.x = _3533;
    out.m_84.y = _3471;
    out.m_84.z = _3461;
    out.m_84.w = _3507;
    out.gl_Position.x = _1568;
    out.gl_Position.y = _1570;
    out.gl_Position.z = _3499;
    out.gl_Position.w = _1534;
    out.m_86.x = _3589;
    float _3591 = _3547;
    float _3593 = _3535;
    float _3595 = _3539;
    float _3597 = _3557;
    float _3599 = _3551;
    if (!_3587)
    {
        _3591 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3601 = _3591;
    out.m_88.x = _3571;
    out.m_88.y = _3573;
    out.m_88.z = _3577;
    out.m_88.w = _3575;
    float _3603 = _3601;
    float _3605 = _3601;
    if (!_3587)
    {
        _3593 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3607 = _3593;
    float _3609 = _3607;
    float _3611 = _3607;
    if (!_3587)
    {
        _3503 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3613 = _3503;
    out.m_90.x = _3565;
    out.m_90.y = _3567;
    out.m_90.z = _3569;
    float _3615 = _3613;
    float _3617 = _3613;
    if (!_3587)
    {
        _3595 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3619 = _3595;
    float _3621 = _3619;
    float _3623 = _3619;
    if (!_3587)
    {
        _3597 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3625 = _3597;
    float _3627 = _3625;
    float _3629 = _3625;
    if (!_3587)
    {
        _3599 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3631 = _3599;
    bool _3633 = !_3587;
    float _3635 = _3631;
    float _3637 = _3631;
    if (!_3633)
    {
        bool _3639 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3641 = isnan(_2263);
        bool _3643 = _3639 || _3641;
        bool _3645 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3647 = _3643 || _3645;
        if (!_3647)
        {
            float _3649 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3651 = _2263 + _3649;
            float _3653 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3655 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3653;
            float _3657 = 1.0 / _3655;
            float _3659 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3661 = _3659 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3663 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3665 = _3663 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3667 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3669 = _3667 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3671 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3673 = _3671 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3675 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3677 = _3675 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3679 = _3651 * _3657;
            float _3681 = precise::clamp(_3679, 0.0, 1.0);
            float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3685 = _3683 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3687 = fma(_3681, _3661, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3689 = fma(_3681, _3685, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3691 = fma(_3681, _3665, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3693 = fma(_3681, _3669, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3695 = fma(_3681, _3673, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3697 = fma(_3681, _3677, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3611 = _3689;
            _3629 = _3695;
            _3605 = _3687;
            _3623 = _3693;
            _3617 = _3691;
            _3637 = _3697;
            _3699 = true;
        }
        else
        {
            bool _3701 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3703 = isnan(_2263);
            bool _3705 = _3701 || _3703;
            bool _3707 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3709 = _3705 || _3707;
            if (!_3709)
            {
                _3603 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3711 = _3603;
            _3605 = _3711;
            if (!_3709)
            {
                _3609 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3713 = _3609;
            _3611 = _3713;
            if (!_3709)
            {
                _3615 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3715 = _3615;
            _3617 = _3715;
            if (!_3709)
            {
                _3621 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3717 = _3621;
            _3623 = _3717;
            if (!_3709)
            {
                _3627 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3719 = _3627;
            _3629 = _3719;
            if (!_3709)
            {
                _3635 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3721 = _3635;
            bool _3723 = !_3709;
            _3637 = _3721;
            if (!_3723)
            {
                bool _3725 = _2263 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3727 = isnan(_2263);
                bool _3729 = _3725 || _3727;
                bool _3731 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3733 = _3729 || _3731;
                if (!_3733)
                {
                    float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3737 = _2263 + _3735;
                    float _3739 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3741 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3739;
                    float _3743 = 1.0 / _3741;
                    float _3745 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3747 = _3745 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3749 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3751 = _3749 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3753 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3755 = _3753 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3757 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3759 = _3757 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3761 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3763 = _3761 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3765 = _3737 * _3743;
                    float _3767 = precise::clamp(_3765, 0.0, 1.0);
                    float _3769 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3771 = _3769 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3773 = fma(_3767, _3747, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3775 = fma(_3767, _3771, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3777 = fma(_3767, _3751, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3779 = fma(_3767, _3755, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3781 = fma(_3767, _3759, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3783 = fma(_3767, _3763, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3611 = _3775;
                    _3629 = _3781;
                    _3605 = _3773;
                    _3623 = _3779;
                    _3617 = _3777;
                    _3637 = _3783;
                    _3699 = true;
                }
                else
                {
                    _3611 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3629 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3605 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3623 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3617 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3637 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3699 = false;
    float _3785 = _3611;
    float _3787 = _3629;
    float _3789 = _3605;
    float _3791 = _3623;
    float _3793 = _3617;
    float _3795 = _3637;
    float _3797 = fma(_3567, -0.5, 0.5);
    float _3799 = precise::clamp(_3797, 0.0, 1.0);
    float _3801 = -_3785;
    float _3803 = _3801 + _3787;
    float _3805 = -_3789;
    float _3807 = _3805 + _3791;
    float _3809 = -_3793;
    float _3811 = _3809 + _3795;
    bool _3813 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3815 = fma(_3799, _3803, _3785);
    float _3817 = fma(_3799, _3807, _3789);
    float _3819 = fma(_3799, _3811, _3793);
    float _3821 = _3815 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _3823 = fma(_3817, 0.298911988735198974609375, _3821);
    float _3825 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3827 = fma(_3819, 0.114477999508380889892578125, _3823);
    out.m_59.x = _3825;
    float _3829 = -_3827;
    float _3831 = _3817 + _3829;
    float _3833 = -_3827;
    float _3835 = _3815 + _3833;
    float _3837 = -_3827;
    float _3839 = _3819 + _3837;
    float _3841 = fma(_3831, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3827);
    float _3843 = fma(_3835, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3827);
    float _3845 = fma(_3839, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3827);
    out.m_94.x = _3841;
    out.m_94.y = _3843;
    out.m_94.z = _3845;
    if (!_3813)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3847 = -_1420;
    float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3851 = -_1422;
    float _3853 = _3851 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3855 = -_1424;
    float _3857 = _3855 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3859 = _3849 * _3849;
    float _3861 = fma(_3853, _3853, _3859);
    float _3863 = fma(_3857, _3857, _3861);
    float _3865 = sqrt(_3863);
    float _3867 = rsqrt(_3863);
    float _3869 = -_3865;
    float _3871 = _3869 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3873 = _3871 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3875 = precise::clamp(_3873, 0.0, 1.0);
    float _3877 = _3853 * _3867;
    float _3879 = _3849 * _3867;
    float _3881 = abs(_3875);
    float _3883 = log2(_3881);
    float _3885 = _3857 * _3867;
    float _3887 = _3877 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3889 = _3567 * _3879;
    float _3891 = -_3879;
    float _3893 = -_3887;
    float _3895 = fma(_3891, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3893);
    float _3897 = fma(_3565, _3877, _3889);
    float _3899 = -_3885;
    float _3901 = fma(_3899, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3895);
    float _3903 = fma(_3569, _3885, _3897);
    float _3905 = precise::clamp(_3903, 0.0, 1.0);
    float _3907 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3909 = _3901 + _3907;
    float _3911 = _3883 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3913 = _3909 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3915 = precise::clamp(_3913, 0.0, 1.0);
    float _3917 = exp2(_3911);
    float _3919 = _3917 * _3915;
    float _3921 = _3905 * _3919;
    float _3923 = _3921 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3925 = _3921 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3927 = _3921 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _3923;
    out.m_92.y = _3925;
    out.m_92.z = _3927;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

