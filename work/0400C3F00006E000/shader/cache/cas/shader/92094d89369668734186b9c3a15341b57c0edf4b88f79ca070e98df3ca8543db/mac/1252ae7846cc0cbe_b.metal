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
    float4 m_74 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_72 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_94 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_70 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2529 = false;
    bool _221 = false;
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
        float _2888 = as_type<float>(_129);
        out.gl_Position.z = _2888;
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
    float _149 = 0.0;
    if (_143)
    {
        float _151 = float(_113);
        _149 = _151;
    }
    float _153 = _149;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    if (_159)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _123;
    if (_159)
    {
        out.m_59.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _131 = as_type<int>(_163);
    }
    int _165 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2956 = as_type<float>(_165);
        out.gl_Position.z = _2956;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_63.x;
    float _169 = in.m_63.y;
    float _171 = in.m_63.z;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _175 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _177 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _179 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _187 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _189 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _191 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _185);
    bool _193 = !_173;
    float _195 = _191;
    float _197 = _187;
    float _217;
    float _219;
    if (!_193)
    {
        float _199 = in.m_65.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = float(_113);
        float _205 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _209 = _207 * _201;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = _203;
        _221 = true;
    }
    else
    {
        float _223 = float(_113);
        float _225 = 1.0 / _223;
        float _227 = _147 * _225;
        _217 = _227;
        _219 = _223;
    }
    _221 = false;
    float _229 = _217;
    float _231 = _219;
    float _233 = in.m_56.x;
    float _235 = in.m_56.y;
    float _237 = in.m_56.z;
    float _239 = _235 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _241 = _235 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _243 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[4].x, _239);
    float _245 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[6].x, _241);
    float _247 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[4].z, _243);
    float _249 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[6].z, _245);
    float _251 = _247 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _253 = _249 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _255 = fma(_251, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _257 = fma(_253, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _259 = floor(_255);
    float _261 = floor(_257);
    float _263 = -_259;
    float _265 = _255 + _263;
    float _267 = -_261;
    float _269 = _257 + _267;
    float2 _3139 = float2(_265, _269);
    float _271 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3139, float2(0.0), isnan(_3139)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3139, float2(0.0), isnan(_3139)), level(0.0)).x;
    float _273 = _235 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = _229 + _275;
    float _279 = as_type<float>(int(gl_VertexIndex));
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _289;
    float _293 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[5].x, _273);
    float _295 = 1.0 / _283;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _229 + _297;
    float _301 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[5].z, _293);
    float _303 = _301 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _305 = 1.0 / _287;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = _229 + _307;
    float _311 = _303 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _313 = fma(_251, (*spvDescriptorSet0.vp_c8)._m0[10].x, _311);
    float _315 = 1.0 / _291;
    float _317 = _277 * _295;
    float _319 = fma(_253, (*spvDescriptorSet0.vp_c8)._m0[10].z, _313);
    int _321 = as_type<int>(_279) & 1;
    bool _323 = _321 != 0;
    int _325 = as_type<int>(_279) & 2;
    bool _327 = _325 != 0;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _333 = _299 * _305;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _343 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _345 = isnan(_229);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = fma(_331, _333, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _357 = fma(_337, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = fma(_341, _333, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _361 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _363 = isnan(_229);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _309 * _315;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    bool _379 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_229);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = _319 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _393 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _395 = isnan(_229);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = fma(_377, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = _303 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _409 = -_389;
    float _411 = _409 + 1.0;
    float _413 = -_371;
    float _415 = _413 + 1.0;
    float _417 = -_403;
    float _419 = _417 + 1.0;
    float _421 = fma(_251, (*spvDescriptorSet0.vp_c8)._m0[11].x, _407);
    float _423 = _353 * _411;
    float _425 = _403 * _415;
    float _427 = -_353;
    float _429 = _427 + 1.0;
    float _431 = fma(_253, (*spvDescriptorSet0.vp_c8)._m0[11].z, _421);
    float _433 = in.m_70.x;
    float _435 = in.m_70.y;
    float _437 = _405 * _423;
    float _439 = _357 * _423;
    float _441 = _431 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _443 = _389 * _419;
    float _445 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[143].x, _437);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _447;
    float _451 = 1.0 / _441;
    float _453 = _391 + _441;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[143].y, _439);
    float _461 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _463 = fma(_449, _373, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_457, _373, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = fma(_359, _443, _459);
    float _469 = _303 + _461;
    float _471 = fma(_355, _443, _445);
    float _473 = fma(_465, _425, _467);
    float _475 = _469 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _477 = _469 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _479 = fma(_463, _425, _471);
    float _481 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[146].y, _473);
    float _483 = _453 * _451;
    float _485 = _483 * 0.5;
    float _487 = fma(_251, (*spvDescriptorSet0.vp_c15)._m0[126].x, _475);
    float _489 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[146].x, _479);
    bool _491 = !_327;
    float _493 = _491 ? (-0.5) : 0.5;
    float _495 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _497 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[30].w, _495);
    float _499 = fma(_253, (*spvDescriptorSet0.vp_c15)._m0[126].z, _487);
    float _501 = _481 * _435;
    bool _503 = !_323;
    float _505 = _503 ? (-0.5) : 0.5;
    float _507 = fma(_251, (*spvDescriptorSet0.vp_c15)._m0[127].x, _477);
    float _509 = _489 * _433;
    float _511 = 1.0 / _497;
    float _513 = _499 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _515 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _493);
    float _517 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _519 = fma(_253, (*spvDescriptorSet0.vp_c15)._m0[127].z, _507);
    float _521 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _505);
    float _523 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _525 = _517 * _515;
    float _527 = _519 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _529 = trunc(_513);
    int _531 = int(_529);
    float _533 = _523 * _521;
    float _535 = _525 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _537 = _525 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _539 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _541 = _525 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _543 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[26].x, _535);
    float _545 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _547 = _511 * _545;
    float _549 = trunc(_527);
    int _551 = int(_549);
    float _553 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[24].x, _537);
    float _555 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[26].z, _543);
    bool _557 = _547 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _559 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[24].z, _553);
    bool _561 = _547 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _563 = _555 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _565 = !_557;
    int _567 = _565 ? 0 : 1;
    float _569 = _559 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _571 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _573 = _531 + _571;
    int _575 = _573 + 1;
    float _577 = _253 + _563;
    float _579 = _251 + _569;
    float _581 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _583 = _577 + _581;
    int _585 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _587 = _551 + _585;
    int _589 = _587 + 1;
    float _591 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _593 = _579 + _591;
    int _595 = 2;
    int _597 = _575;
    int _599 = as_type<int>(_541);
    float _601 = _579;
    float _603 = _577;
    float _605 = _513;
    if (!_557)
    {
        _595 = 1;
    }
    int _607 = _595;
    float _609 = _583 * _583;
    int _611 = _607;
    if (!_561)
    {
        _611 = _567;
    }
    int _613 = _611;
    bool _615 = _575 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _617 = _613 << 6;
    int _619 = _575 | _589;
    int _621 = _617 + 48;
    uint _624 = uint(int(uint(_621) >> uint(2)));
    uint _626 = uint(int(uint(int(_624)) >> uint(2)));
    int _628 = int(_624) & 3;
    float _630 = (*spvDescriptorSet0.vp_c15)._m0[int(_626)][_628];
    int _632 = int(_624) + 1;
    uint _634 = uint(int(uint(_632) >> uint(2)));
    int _636 = _632 & 3;
    float _638 = (*spvDescriptorSet0.vp_c15)._m0[int(_634)][_636];
    bool _640 = _619 < 0;
    bool _642 = _640 || _615;
    float _644 = fma(_593, _593, _609);
    bool _646 = _589 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _648 = _646 || _642;
    float _650 = sqrt(_644);
    int _652 = _617 + 56;
    uint _654 = uint(int(uint(_652) >> uint(2)));
    uint _656 = uint(int(uint(int(_654)) >> uint(2)));
    int _658 = int(_654) & 3;
    float _660 = (*spvDescriptorSet0.vp_c15)._m0[int(_656)][_658];
    int _662 = int(_654) + 1;
    uint _664 = uint(int(uint(_662) >> uint(2)));
    int _666 = _662 & 3;
    float _668 = (*spvDescriptorSet0.vp_c15)._m0[int(_664)][_666];
    int _670 = _617 + 64;
    uint _672 = uint(int(uint(_670) >> uint(2)));
    uint _674 = uint(int(uint(int(_672)) >> uint(2)));
    int _676 = int(_672) & 3;
    float _678 = (*spvDescriptorSet0.vp_c15)._m0[int(_674)][_676];
    int _680 = int(_672) + 1;
    uint _682 = uint(int(uint(_680) >> uint(2)));
    int _684 = _680 & 3;
    float _686 = (*spvDescriptorSet0.vp_c15)._m0[int(_682)][_684];
    float _688 = as_type<float>(_613);
    if (!_648)
    {
        int _690 = _589 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _692 = _690 + _575;
        _597 = _692;
    }
    int _694 = _597;
    float _696 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[25].x, _541);
    bool _698 = _650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _700 = _617 + 72;
    uint _702 = uint(int(uint(_700) >> uint(2)));
    uint _704 = uint(int(uint(int(_702)) >> uint(2)));
    int _706 = int(_702) & 3;
    float _708 = (*spvDescriptorSet0.vp_c15)._m0[int(_704)][_706];
    int _710 = int(_702) + 1;
    uint _712 = uint(int(uint(_710) >> uint(2)));
    int _714 = _710 & 3;
    float _716 = (*spvDescriptorSet0.vp_c15)._m0[int(_712)][_714];
    float _718 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[25].z, _696);
    if (!_648)
    {
        int _720 = _694 << 2;
        _599 = _720;
    }
    int _722 = _599;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _734 = _732 != 0;
    float _736 = _718 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _738 = 0;
    int _740 = _722;
    if (!_648)
    {
        uint _742 = uint(int(uint(_694) >> uint(2)));
        _738 = int(_742);
    }
    int _744 = _738;
    int _746 = _617 + 96;
    uint _748 = uint(int(uint(_746) >> uint(2)));
    uint _750 = uint(int(uint(int(_748)) >> uint(2)));
    int _752 = int(_748) & 3;
    float _754 = (*spvDescriptorSet0.vp_c15)._m0[int(_750)][_752];
    int _756 = int(_748) + 1;
    uint _758 = uint(int(uint(_756) >> uint(2)));
    int _760 = _756 & 3;
    float _762 = (*spvDescriptorSet0.vp_c15)._m0[int(_758)][_760];
    float _764 = as_type<float>(_744);
    if (!_648)
    {
        int _766 = 12 & _722;
        _740 = _766;
    }
    int _768 = _740;
    float _770 = _303 + _736;
    bool _772 = !_726;
    int _774 = _772 ? 0 : 1;
    if (!_648)
    {
        int _776 = _744 << 4;
        int _778 = _776 + _768;
        _764 = as_type<float>(_778);
    }
    float _780 = _764;
    bool _782 = !_730;
    int _784 = _782 ? 0 : 1;
    int _786 = _617 + 104;
    uint _788 = uint(int(uint(_786) >> uint(2)));
    uint _790 = uint(int(uint(int(_788)) >> uint(2)));
    int _792 = int(_788) & 3;
    float _794 = (*spvDescriptorSet0.vp_c15)._m0[int(_790)][_792];
    int _796 = int(_788) + 1;
    uint _798 = uint(int(uint(_796) >> uint(2)));
    int _800 = _796 & 3;
    float _802 = (*spvDescriptorSet0.vp_c15)._m0[int(_798)][_800];
    bool _804 = !_734;
    int _806 = _804 ? 0 : 1;
    float _808 = 0.0;
    if (!_698)
    {
        _808 = _770;
    }
    float _810 = _808;
    bool _812 = !_698;
    float _814 = _810;
    float _816 = _762;
    float _818 = _638;
    if (!_812)
    {
        float _820 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _822 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _824 = _650 + _822;
        float _826 = rsqrt(_644);
        float _828 = _824 * _820;
        float _830 = _770 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _832 = _828 * 0.15915493667125701904296875;
        float _834 = _832 * 6.283185482025146484375;
        float _836 = cos(_834);
        float _838 = _832 * 6.283185482025146484375;
        float _840 = sin(_838);
        float _842 = _836 + (-1.0);
        float _844 = _842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _846 = fma(_840, _830, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _848 = fma(_770, _836, _844);
        float _850 = _826 * _846;
        float _852 = fma(_593, _850, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _854 = fma(_583, _850, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _814 = _848;
        _601 = _852;
        _603 = _854;
    }
    float _856 = _814;
    float _858 = _601;
    float _860 = _603;
    float _862 = -_303;
    float _864 = _862 + _856;
    int _866 = _617 + 80;
    uint _868 = uint(int(uint(_866) >> uint(2)));
    uint _870 = uint(int(uint(int(_868)) >> uint(2)));
    int _872 = int(_868) & 3;
    float _874 = (*spvDescriptorSet0.vp_c15)._m0[int(_870)][_872];
    int _876 = int(_868) + 1;
    uint _878 = uint(int(uint(_876) >> uint(2)));
    int _880 = _876 & 3;
    float _882 = (*spvDescriptorSet0.vp_c15)._m0[int(_878)][_880];
    float _884 = -_251;
    float _886 = _884 + _858;
    float _888 = -_253;
    float _890 = _888 + _860;
    float _892 = _864 * _864;
    float _894 = _469 * _762;
    float _896 = _469 * _686;
    float _898 = _858;
    float _900 = _856;
    float _902 = _860;
    if (!_648)
    {
        float _904 = floor(_527);
        _816 = _904;
    }
    float _906 = _816;
    float _908 = fma(_886, _886, _892);
    int _910 = _617 + 88;
    uint _912 = uint(int(uint(_910) >> uint(2)));
    uint _914 = uint(int(uint(int(_912)) >> uint(2)));
    int _916 = int(_912) & 3;
    float _918 = (*spvDescriptorSet0.vp_c15)._m0[int(_914)][_916];
    int _920 = int(_912) + 1;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    int _924 = _920 & 3;
    float _926 = (*spvDescriptorSet0.vp_c15)._m0[int(_922)][_924];
    float _928 = fma(_251, _754, _894);
    float _930 = fma(_251, _678, _896);
    float _932 = fma(_890, _890, _908);
    float _934 = fma(_253, _794, _928);
    float _936 = _469 * _638;
    float _938 = sqrt(_932);
    float _940 = _780;
    if (!_648)
    {
        int _942 = as_type<int>(_780) + 400;
        uint _944 = uint(int(uint(_942) >> uint(2)));
        uint _946 = uint(int(uint(int(_944)) >> uint(2)));
        int _948 = int(_944) & 3;
        float _950 = (*spvDescriptorSet0.vp_c15)._m0[int(_946)][_948];
        _940 = _950;
    }
    float _952 = _940;
    float _954 = _934 + _802;
    float _956 = fma(_251, _630, _936);
    float _958 = fma(_253, _708, _930);
    bool _960 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _962 = isnan(0.5);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _968 = _964 || _966;
    float _970 = fma(_253, _660, _956);
    float _972 = _892;
    float _974 = _970;
    if (!_648)
    {
        float _976 = floor(_513);
        _972 = _976;
    }
    float _978 = _972;
    float _980 = _958 + _716;
    float _982 = _970 + _668;
    bool _984 = _938 > 0.0;
    float _986 = 1.0 / _954;
    bool _988 = !_984;
    if (!_988)
    {
        float _990 = _189 * _189;
        float _992 = rsqrt(_932);
        float _994 = fma(_187, _187, _990);
        float _996 = fma(_191, _191, _994);
        float _998 = sqrt(_996);
        float _1000 = _886 * _992;
        float _1002 = _864 * _992;
        float _1004 = _890 * _992;
        bool _1006 = _998 > 0.0;
        bool _1008 = !_1006;
        _818 = _996;
        _974 = _998;
        if (!_1008)
        {
            float _1010 = rsqrt(_996);
            float _1012 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1014 = _189 * _1010;
            float _1016 = _187 * _1010;
            float _1018 = _1002 * _1014;
            float _1020 = _191 * _1010;
            float _1022 = fma(_1000, _1016, _1018);
            float _1024 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1026 = fma(_1004, _1020, _1022);
            float _1028 = _1026 * _1024;
            float _1030 = fma(_187, _1028, _858);
            float _1032 = fma(_189, _1028, _856);
            float _1034 = fma(_191, _1028, _860);
            _898 = _1030;
            _900 = _1032;
            _902 = _1034;
            _818 = _1010;
            _974 = _1016;
        }
    }
    float _1036 = _898;
    float _1038 = _900;
    float _1040 = _902;
    float _1042 = _818;
    float _1044 = _974;
    float _1046 = _1044;
    float _1048 = _1042;
    if (_968)
    {
        _1046 = _1036;
    }
    float _1050 = _1046;
    float _1052 = _1050;
    if (_968)
    {
        _1048 = _1038;
    }
    float _1054 = _1048;
    float _1056 = _1054;
    if (_968)
    {
        _195 = _1040;
    }
    float _1058 = _195;
    float _1060 = _1058;
    if (!_968)
    {
        float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1064 = _303 + _1062;
        float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1068 = _251 + _1066;
        float _1070 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1072 = _1064 * _1064;
        float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1076 = _253 + _1074;
        float _1078 = fma(_1068, _1068, _1072);
        float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1082 = fma(_1076, _1076, _1078);
        float _1084 = sqrt(_1082);
        float _1086 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1088 = -_253;
        float _1090 = _1088 + _1040;
        float _1092 = precise::min(_1084, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1094 = _1092 * _1080;
        float _1096 = -_303;
        float _1098 = _1096 + _1038;
        float _1100 = _1086 * _1094;
        float _1102 = -_251;
        float _1104 = _1102 + _1036;
        float _1106 = fma(_1098, _1100, _303);
        float _1108 = fma(_1104, _1100, _251);
        float _1110 = fma(_1090, _1100, _253);
        _1056 = _1106;
        _1052 = _1108;
        _1060 = _1110;
    }
    float _1112 = _1056;
    float _1114 = _1052;
    float _1116 = _1060;
    float _1118 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1120 = _982 * _986;
    float _1122 = _980 * _986;
    float _1124 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1126 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1118);
    float _1128 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1130 = _1120 >= 0.0;
    float _1132 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1124);
    float _1134 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1126);
    float _1136 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1128);
    float _1138 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1140 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1132);
    float _1142 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1144 = _1120 <= 1.0;
    bool _1146 = _1144 && _1130;
    float _1148 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1136);
    float _1150 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1138);
    float _1152 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1154 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1156 = _1148 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1158 = _1122 >= 0.0;
    bool _1160 = _1158 && _1146;
    float _1162 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1150);
    float _1164 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1154);
    float _1166 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1170 = _1122 <= 1.0;
    bool _1172 = _1170 && _1160;
    float _1174 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1176 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1164);
    float _1178 = -_1168;
    float _1180 = fma(_1178, _1166, 1.0);
    float _1182 = _469 * _882;
    float _1184 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1186 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1176);
    float _1188 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1190 = fma(_251, _874, _1182);
    float _1192 = log2(_1180);
    float _1194 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1184);
    float _1196 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1188);
    float _1198 = fma(_253, _918, _1190);
    float _1200 = _1120;
    float _1202 = _1186;
    if (_1172)
    {
        float _1204 = float(_613);
        _197 = _1204;
    }
    float _1206 = _197;
    float _1208 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1194);
    float _1210 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1196);
    if (!_648)
    {
        float _1212 = -_906;
        float _1214 = _527 + _1212;
        _688 = _1214;
    }
    float _1216 = _688;
    float _1218 = 1.0 / _1186;
    float _1220 = _1198 + _926;
    float _1222 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1210);
    float _1224 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1208);
    if (!_648)
    {
        float _1226 = -_978;
        float _1228 = _513 + _1226;
        _605 = _1228;
    }
    float _1230 = _605;
    float _1232 = _1038;
    if (!_648)
    {
        float _1234 = rint(_952);
        float _1236 = precise::max(_1234, 0.0);
        uint _1238 = uint(_1236);
        uint _1240 = clamp(_1238, 0u, 65535u);
        _1232 = as_type<float>(_1240);
    }
    float _1242 = _1232;
    float _1244 = _1192 * 0.693147182464599609375;
    float _1246 = _1220 * _986;
    float _1248 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1250 = _1206;
    if (_1172)
    {
        float _1252 = rint(_1206);
        float _1254 = precise::max(_1252, 0.0);
        uint _1256 = uint(_1254);
        uint _1258 = clamp(_1256, 0u, 65535u);
        _1250 = as_type<float>(_1258);
    }
    float _1260 = _1250;
    float _1262 = _1222 * _1218;
    float _1264 = _1224 * _1218;
    float _1266 = fma(_1262, 0.5, 0.5);
    float _1268 = fma(_1264, -0.5, 0.5);
    float _1270 = _1242;
    if (!_648)
    {
        float3 _4804 = float3(_1230, _1216, float(as_type<int>(_1242)));
        float3 _4808 = select(_4804, float3(0.0), isnan(_4804));
        float _1272 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4808.xy, uint(rint(_4808.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4808.xy, uint(rint(_4808.z)), level(0.0)).x;
        _1270 = _1272;
    }
    float _1274 = _1270;
    float _1276 = _1260;
    if (_1172)
    {
        float3 _4823 = float3(_1120, _1122, float(as_type<int>(_1260)));
        float3 _4825 = select(_4823, float3(0.0), isnan(_4823));
        float _1278 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4825.xy, uint(rint(_4825.z)), _1246, level(0.0));
        _1276 = _1278;
    }
    float _1280 = _1276;
    float3 _4835 = float3(_1266, _1268, _1248);
    float _1282 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4835, float3(0.0), isnan(_4835)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4835, float3(0.0), isnan(_4835)), level(0.0)).x;
    float3 _4844 = float3(_1266, _1268, _1248);
    float4 _1285 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4844, float3(0.0), isnan(_4844)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4844, float3(0.0), isnan(_4844)), level(0.0)).xyzw;
    float _1287 = _1285.x;
    float _1289 = _1285.y;
    float _1291 = _1285.z;
    float _1293 = _1285.w;
    float _1295 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1297 = int(_1295);
    bool _1299 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1301 = isnan(0.5);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1307 = _1303 || _1305;
    float _1309 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1311 = int(_1309);
    float _1313 = float(_1297);
    float _1315 = 1.0 / _1313;
    float _1317 = float(uint(_1311));
    float _1319 = 1.0 / _1317;
    float _1321 = _147 * _1315;
    float _1323 = trunc(_1321);
    int _1325 = int(_1323);
    int _1327 = as_type<int>(_1319) + (-2);
    if (_648)
    {
        _1200 = 1.0;
    }
    float _1329 = _1200;
    float _1331 = float(uint(_1325));
    float _1333 = as_type<float>(_1327) * _1331;
    float _1335 = trunc(_1333);
    float _1337 = precise::max(_1335, 0.0);
    uint _1339 = uint(_1337);
    int _1341 = ~_1311;
    int _1343 = _1341 + 1;
    float _1345 = _1333;
    float _1347 = _1329;
    if (_1307)
    {
        _1345 = 1.0;
    }
    float _1349 = _1345;
    int _1351 = _1343 * int(_1339);
    int _1353 = _1351 + _1325;
    float _1355 = float(uint(_1353));
    float _1357 = as_type<float>(_1327) * _1355;
    int _1359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1361 = _1359 != 0;
    float _1363 = trunc(_1357);
    float _1365 = precise::max(_1363, 0.0);
    uint _1367 = uint(_1365);
    int _1369 = int(_1339) + int(_1367);
    float _1371 = _1349;
    float _1373 = _1287;
    if (!_1307)
    {
        float _1375 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1377 = _1375 * 0.15915493667125701904296875;
        float _1379 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1381 = _1377 * 6.283185482025146484375;
        float _1383 = cos(_1381);
        float _1385 = _1379 * 0.15915493667125701904296875;
        float _1387 = _1377 * 6.283185482025146484375;
        float _1389 = sin(_1387);
        float _1391 = 1.0 / _1383;
        float _1393 = _1385 * 6.283185482025146484375;
        float _1395 = cos(_1393);
        float _1397 = _1389 * _1391;
        float _1399 = _1385 * 6.283185482025146484375;
        float _1401 = sin(_1399);
        float _1403 = _1395 * _1397;
        float _1405 = 1.0 / _1403;
        float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1409 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1407;
        float _1411 = 1.0 / _1409;
        float _1413 = _1401 * _1405;
        float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1417 = fma(_547, _1413, _1415);
        float _1419 = _1417 * _1411;
        float _1421 = precise::clamp(_1419, 0.0, 1.0);
        _1371 = _1421;
    }
    float _1423 = _1371;
    if (!_648)
    {
        int _1425 = _694 << 4;
        int _1427 = _1425 + 2048;
        uint _1429 = uint(int(uint(_1427) >> uint(2)));
        uint _1431 = uint(int(uint(int(_1429)) >> uint(2)));
        int _1433 = int(_1429) & 3;
        float _1435 = (*spvDescriptorSet0.vp_c15)._m0[int(_1431)][_1433];
        int _1437 = int(_1429) + 1;
        uint _1439 = uint(int(uint(_1437) >> uint(2)));
        int _1441 = _1437 & 3;
        float _1443 = (*spvDescriptorSet0.vp_c15)._m0[int(_1439)][_1441];
        int _1445 = _1427 + 8;
        uint _1447 = uint(int(uint(_1445) >> uint(2)));
        uint _1449 = uint(int(uint(int(_1447)) >> uint(2)));
        int _1451 = int(_1447) & 3;
        float _1453 = (*spvDescriptorSet0.vp_c15)._m0[int(_1449)][_1451];
        int _1455 = int(_1447) + 1;
        uint _1457 = uint(int(uint(_1455) >> uint(2)));
        int _1459 = _1455 & 3;
        float _1461 = (*spvDescriptorSet0.vp_c15)._m0[int(_1457)][_1459];
        float _1463 = _469 * _1443;
        float _1465 = fma(_251, _1435, _1463);
        float _1467 = fma(_253, _1453, _1465);
        float _1469 = _1467 + _1461;
        float _1471 = precise::clamp(_1469, 0.0, 1.0);
        float _1473 = -_1471;
        float _1475 = _1473 + _1274;
        float _1477 = fma(_1475, 500.0, 1.5);
        float _1479 = exp2(_1477);
        float _1481 = 0.0 + _1479;
        float _1483 = precise::clamp(_1481, 0.0, 1.0);
        _1347 = _1483;
    }
    float _1485 = _1347;
    float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1489 = _1112 + _1487;
    float _1491 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1493 = _1114 + _1491;
    float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1497 = _1116 + _1495;
    float _1499 = _1489 * _1489;
    float _1501 = fma(_1493, _1493, _1499);
    float _1503 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1505 = fma(_1497, _1497, _1501);
    float _1507 = rsqrt(_1505);
    float _1509 = sqrt(_1505);
    float _1511 = _1493 * _1507;
    float _1513 = _1497 * _1507;
    float _1515 = _1489 * _1507;
    float _1517 = precise::max(0.0, _1503);
    float _1519 = _1511 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1521 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1523 = _1519 * _1519;
    float _1525 = _1521 * _1521;
    float _1527 = -_1515;
    float _1529 = -_1517;
    float _1531 = fma(_1527, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1529);
    float _1533 = _1523 + _1525;
    float _1535 = sqrt(_1533);
    bool _1537 = _1535 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1541 = _1535 + _1539;
    float _1543 = as_type<float>(_617);
    float _1545 = _1517;
    float _1547 = _1533;
    float _1549 = _1541;
    float _1551 = _1503;
    float _1553 = _1519;
    float _1555 = _1523;
    float _1557 = _1525;
    if (_1537)
    {
        float _1559 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1543 = _1559;
    }
    float _1561 = _1543;
    if (_1537)
    {
        float _1563 = _1531 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1545 = _1563;
    }
    float _1565 = _1545;
    float _1567 = _1565;
    if (_1537)
    {
        float _1569 = rsqrt(_1533);
        _1547 = _1569;
    }
    float _1571 = _1547;
    float _1573 = _1561;
    if (_1537)
    {
        float _1575 = _1541 * _1561;
        _1549 = _1575;
    }
    float _1577 = _1549;
    if (_1537)
    {
        float _1579 = _1577 * 0.15915493667125701904296875;
        _1573 = _1579;
    }
    float _1581 = _1573;
    float _1583 = _251;
    if (_1537)
    {
        float _1585 = _1581 * 6.283185482025146484375;
        float _1587 = sin(_1585);
        _1583 = _1587;
    }
    float _1589 = _1583;
    float _1591 = _1577;
    if (_1537)
    {
        float _1593 = _1581 * 6.283185482025146484375;
        float _1595 = cos(_1593);
        _1591 = _1595;
    }
    float _1597 = _1591;
    float _1599 = _1589;
    if (_1537)
    {
        float _1601 = fma(_1589, _1565, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1567 = _1601;
    }
    float _1603 = _1567;
    float _1605 = _1603;
    if (!_1537)
    {
        _1599 = _1531;
    }
    float _1607 = _1599;
    float _1609 = 0.0;
    float _1611 = _1607;
    if (_1537)
    {
        float _1613 = _1571 * _1603;
        _1609 = _1613;
    }
    float _1615 = _1609;
    if (_1537)
    {
        float _1617 = _1597 + (-1.0);
        _1551 = _1617;
    }
    float _1619 = _1551;
    float _1621 = _1619;
    if (_1537)
    {
        float _1623 = _1519 * _1615;
        _1553 = _1623;
    }
    float _1625 = _1553;
    if (_1537)
    {
        float _1627 = _1619 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1605 = _1627;
    }
    float _1629 = _1605;
    if (!_1537)
    {
        _1621 = _1521;
    }
    float _1631 = _1621;
    float _1633 = _1631;
    if (_1537)
    {
        float _1635 = _1521 * _1615;
        _1633 = _1635;
    }
    float _1637 = _1633;
    if (_1537)
    {
        float _1639 = _1625 * _1625;
        _1555 = _1639;
    }
    float _1641 = _1555;
    if (_1537)
    {
        float _1643 = fma(_1531, _1597, _1629);
        _1611 = _1643;
    }
    float _1645 = _1611;
    if (_1537)
    {
        float _1647 = _1637 * _1637;
        _1557 = _1647;
    }
    float _1649 = _1557;
    int _1651 = ~_1311;
    int _1653 = _1651 + 1;
    float _1655 = fma(_1645, _1645, _1641);
    float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1659 = fma(_1509, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1657);
    float _1661 = precise::clamp(_1659, 0.0, 1.0);
    float _1663 = _1655 + _1649;
    int _1665 = _1653 * _1369;
    int _1667 = _1665 + _1325;
    float _1669 = -_1661;
    float _1671 = _1669 + 1.0;
    float _1673 = rsqrt(_1663);
    float _1675 = abs(_1671);
    float _1677 = log2(_1675);
    float _1679 = _1673 * _1625;
    float _1681 = _1673 * _1645;
    float _1683 = _1673 * _1637;
    float _1685 = _1679 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1687 = in.m_65.x;
    float _1689 = in.m_65.y;
    float _1691 = -_1685;
    float _1693 = fma(_1681, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1691);
    float _1695 = -_1683;
    float _1697 = fma(_1695, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1693);
    float _1699 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _1701 = !_1361;
    float _1703 = _1701 ? 7.345489978790283203125 : 1.0;
    float _1705 = fma(_1697, -0.5, 0.5);
    float _1707 = fma(_1697, 0.5, 0.5);
    float _1709 = exp2(_1699);
    float _1711 = fma(_1707, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1713 = fma(_1707, _1711, -0.212114393711090087890625);
    float _1715 = sqrt(_1705);
    float _1717 = float(_1325);
    float _1719 = fma(_1707, _1713, 1.570728778839111328125);
    float _1721 = _1703 * _1687;
    float _1723 = 1.0 / _231;
    float _1725 = _1681 + 1.0;
    float _1727 = -_1681;
    float _1729 = fma(_1709, _1725, _1727);
    float _1731 = _1715 * 0.636619746685028076171875;
    float _1733 = fma(_1729, 0.5, 0.5);
    float _1735 = floor(_1721);
    float _1737 = -_1719;
    float _1739 = fma(_1731, _1737, 1.0);
    float _1741 = float(_1311);
    float2 _5509 = float2(_1739, _1733);
    float3 _1745 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5509, float2(0.0), isnan(_5509)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5509, float2(0.0), isnan(_5509)), level(0.0)).xyz;
    float _1747 = _1745.x;
    float _1749 = _1745.y;
    float _1751 = _1745.z;
    bool _1753 = _1717 >= _1741;
    bool _1755 = isnan(_1717);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan(_1741);
    bool _1761 = _1757 || _1759;
    float _1763 = float(_1761);
    float _1765 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1767 = uint(_1667) >= uint(_1311);
    float _1769 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1771 = abs(_774);
    float _1773 = -_271;
    float _1775 = _1773 + 1.0;
    float _1777 = trunc(_1763);
    int _1779 = int(_1777);
    bool _1781 = !_1767;
    int _1783 = _1781 ? 0 : (-1);
    out.m_72.x = _1114;
    out.m_72.y = _1112;
    out.m_72.z = _1116;
    float _1785 = -_1735;
    float _1787 = _1721 + _1785;
    bool _1789 = _1311 == 0;
    int _1791 = ~_1369;
    int _1793 = _1791 + _1783;
    int _1795 = _1793 + 1;
    float _1797 = _1787 * _1741;
    float _1799 = _147 * _1741;
    float _1801 = exp2(_1769);
    int _1803 = _1311 * _1795;
    int _1805 = _1803 + _1325;
    float _1807 = _1799 * _1723;
    int _1809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1811 = _1809 != 0;
    int _1813 = _1311 + (-1);
    int _1815 = ~_1779;
    int _1817 = _1815 + 1;
    int _1819 = _1817 + 1;
    float _1821 = trunc(_1797);
    int _1823 = int(_1821);
    bool _1825 = !_1789;
    int _1827 = _1825 ? _1805 : (-1);
    bool _1829 = !_1811;
    int _1831 = _1829 ? 0 : 1;
    int _1833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1835 = _1833 != 0;
    int _1837 = _1827 * _1819;
    int _1839 = abs(_784);
    float _1841 = trunc(_1807);
    int _1843 = int(_1841);
    int _1845 = abs(_1831);
    int _1847 = _1779 * _1813;
    int _1849 = _1847 + _1837;
    bool _1851 = !_1835;
    int _1853 = _1851 ? 0 : 1;
    int _1855 = abs(_806);
    int _1857 = _1849 * _1839;
    int _1859 = abs(_1853);
    int _1861 = _1823 * _1845;
    int _1863 = _1861 + _1325;
    float _1865 = float(uint(_1863));
    int _1867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1869 = _1867 != 0;
    int _1871 = _1843 * _1771;
    int _1873 = _1871 + _1857;
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1877 = as_type<float>(_1327) * _1865;
    int _1879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1881 = _1879 != 0;
    int _1883 = _1863 * _1855;
    int _1885 = _1883 + _1873;
    int _1887 = ~_1311;
    int _1889 = _1887 + 1;
    float _1891 = trunc(_1877);
    float _1893 = precise::max(_1891, 0.0);
    uint _1895 = uint(_1893);
    int _1897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1899 = _1897 != 0;
    int _1901 = _1823 * _1859;
    int _1903 = _1901 + _1885;
    float _1905 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1907 = _1687 > 0.5;
    float _1909 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1875);
    float _1911 = float(uint(_1903));
    float _1913 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1909);
    float _1915 = as_type<float>(_1327) * _1911;
    float _1917 = -_1913;
    float _1919 = _1917 + 1.0;
    float _1921 = trunc(_1915);
    float _1923 = precise::max(_1921, 0.0);
    uint _1925 = uint(_1923);
    float _1927 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1929 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1931 = -_1927;
    float _1933 = fma(_1905, 2.0, _1931);
    float _1935 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1937 = ~_1311;
    int _1939 = _1937 + 1;
    float _1941 = fma(_1935, -2.0, _1929);
    int _1943 = _1889 * int(_1925);
    int _1945 = _1943 + _1903;
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1949 = float(uint(_1945));
    float _1951 = _1947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1953 = ~_1311;
    int _1955 = _1953 + 1;
    float _1957 = as_type<float>(_1327) * _1949;
    int _1959 = _1955 * int(_1895);
    int _1961 = _1959 + _1863;
    float _1963 = trunc(_1957);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    int _1969 = int(_1925) + int(_1967);
    float _1971 = float(uint(_1961));
    int _1973 = _1939 * _1969;
    int _1975 = _1973 + _1903;
    float _1977 = as_type<float>(_1327) * _1971;
    bool _1979 = uint(_1975) >= uint(_1311);
    float _1981 = trunc(_1977);
    float _1983 = precise::max(_1981, 0.0);
    uint _1985 = uint(_1983);
    bool _1987 = !_1979;
    int _1989 = _1987 ? 0 : (-1);
    bool _1991 = _1689 > 0.5;
    int _1993 = ~_1969;
    int _1995 = _1993 + _1989;
    int _1997 = _1995 + 1;
    float _1999 = -_493;
    int _2001 = _1991 ? as_type<int>(_1999) : as_type<int>(_493);
    int _2003 = _1311 * _1997;
    int _2005 = _2003 + _1903;
    bool _2007 = !_1789;
    int _2009 = _2007 ? _2005 : (-1);
    int _2011 = int(_1895) + int(_1985);
    int _2013 = _2009 >> 31;
    int _2015 = _2013 & 3;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2019 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2021 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2023 = _2009 + _2015;
    float _2025 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2029 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2031 = _2023 >> 2;
    float _2033 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2035 = _2017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2037 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2029);
    int _2039 = _2031 << 4;
    int _2041 = _2039 + 368;
    float _2043 = _2019 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2045 = -_505;
    int _2047 = _1907 ? as_type<int>(_2045) : as_type<int>(_505);
    float _2049 = _2021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _2051 = uint(int(uint(_2041) >> uint(2)));
    uint _2053 = uint(int(uint(int(_2051)) >> uint(2)));
    int _2055 = int(_2051) & 3;
    float _2057 = (*spvDescriptorSet0.vp_c9)._m0[int(_2053)][_2055];
    int _2059 = int(_2051) + 1;
    uint _2061 = uint(int(uint(_2059) >> uint(2)));
    int _2063 = _2059 & 3;
    float _2065 = (*spvDescriptorSet0.vp_c9)._m0[int(_2061)][_2063];
    int _2067 = ~_1311;
    int _2069 = _2067 + 1;
    float _2071 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2073 = !_1881;
    float _2075 = _2073 ? _505 : as_type<float>(_2047);
    float _2077 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2079 = _2009 & 3;
    bool _2081 = _2079 != 0;
    out.m_74.x = _1951;
    out.m_74.y = _2035;
    out.m_74.z = _2043;
    out.m_74.w = _2033;
    int _2083 = _2009 & 3;
    bool _2085 = _2083 != 0;
    out.m_76.x = _2049;
    out.m_76.y = _2071;
    out.m_76.z = _2077;
    bool _2087 = uint(_2083) > 1u;
    int _2089 = _2041 + 8;
    uint _2091 = uint(int(uint(_2089) >> uint(2)));
    uint _2093 = uint(int(uint(int(_2091)) >> uint(2)));
    int _2095 = int(_2091) & 3;
    float _2097 = (*spvDescriptorSet0.vp_c9)._m0[int(_2093)][_2095];
    int _2099 = int(_2091) + 1;
    uint _2101 = uint(int(uint(_2099) >> uint(2)));
    int _2103 = _2099 & 3;
    float _2105 = (*spvDescriptorSet0.vp_c9)._m0[int(_2101)][_2103];
    float _2107 = -_147;
    float _2109 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1933);
    bool _2111 = !_1899;
    float _2113 = _2111 ? _493 : as_type<float>(_2001);
    float _2115 = _2075 + 0.5;
    int _2117 = _2081 ? 0 : 1;
    float _2119 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1941);
    int _2121 = _2069 * _2011;
    int _2123 = _2121 + _1863;
    float _2125 = fma(_2115, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2109);
    float _2127 = _2113 + (-0.5);
    int _2129 = ~_2117;
    int _2131 = _2129 + 1;
    int _2133 = _2131 + 1;
    float _2135 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2037);
    int _2137 = _2133;
    if (!_2087)
    {
        int _2139 = ~_2117;
        int _2141 = _2139 + 1;
        _2137 = _2141;
    }
    int _2143 = _2137;
    float _2145 = -_2127;
    float _2147 = -_2119;
    float _2149 = fma(_2145, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2147);
    bool _2151 = !_2085;
    int _2153 = _2151 ? 0 : 1;
    float _2155 = -_2135;
    float _2157 = _2155 + 1.0;
    int _2159 = abs(_2143);
    float _2161 = _493 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2163 = _2083 != 3;
    float _2165 = fma(_2113, _2157, _2149);
    bool _2167 = uint(_2083) >= 2u;
    bool _2169 = _2083 != 3;
    bool _2171 = uint(_2123) >= uint(_1311);
    int _2173 = abs(_2153);
    bool _2175 = !_2171;
    int _2177 = _2175 ? 0 : (-1);
    int _2179 = ~_2159;
    int _2181 = _2179 + 1;
    int _2183 = _2181 + 1;
    int _2185 = ~_2011;
    int _2187 = _2185 + _2177;
    int _2189 = _2187 + 1;
    int _2191 = ~_2173;
    int _2193 = _2191 + 1;
    int _2195 = _2193 + 1;
    int _2197 = _2183 * as_type<int>(_2065);
    int _2199 = _2167 ? 0 : 1;
    int _2201 = _1311 * _2189;
    int _2203 = _2201 + _1863;
    bool _2205 = !_1869;
    int _2207 = _2205 ? 0 : 1;
    int _2209 = _2195 * as_type<int>(_2057);
    int _2211 = _2209 + _2197;
    int _2213 = ~_2199;
    int _2215 = _2213 + 1;
    int _2217 = _2215 + 1;
    float _2219 = abs(_547);
    float _2221 = log2(_2219);
    int _2223 = _2217;
    if (_2163)
    {
        int _2225 = ~_2199;
        int _2227 = _2225 + 1;
        _2223 = _2227;
    }
    int _2229 = _2223;
    bool _2231 = !_2169;
    int _2233 = _2231 ? 0 : (-1);
    int _2235 = abs(_2229);
    int _2237 = abs(_2233);
    int _2239 = abs(_2207);
    int _2241 = ~_2235;
    int _2243 = _2241 + 1;
    int _2245 = _2243 + 1;
    int _2247 = ~_2237;
    int _2249 = _2247 + 1;
    int _2251 = _2249 + 1;
    int _2253 = _2245 * as_type<int>(_2097);
    int _2255 = _2253 + _2211;
    float _2257 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1765);
    float _2259 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2261 = ~_2239;
    int _2263 = _2261 + 1;
    int _2265 = _2263 + 1;
    int _2267 = _2251 * as_type<int>(_2105);
    int _2269 = _2267 + _2255;
    float _2271 = _505 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2273 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2257);
    float _2275 = exp2(_2259);
    int _2277 = _2269 * _2265;
    float _2279 = -_1919;
    float _2281 = fma(_2075, _2279, _2125);
    bool _2283 = !_1789;
    int _2285 = _2283 ? _2203 : (-1);
    float _2287 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2273);
    float _2289 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_78.x = _2281;
    out.m_78.y = _2165;
    int _2291 = _2285 * _2239;
    int _2293 = _2291 + _2277;
    float _2295 = _2287 + _1186;
    bool _2297 = _547 <= 8000.0;
    bool _2299 = isnan(_547);
    bool _2301 = _2297 || _2299;
    bool _2303 = isnan(8000.0);
    bool _2305 = _2301 || _2303;
    float _2307 = float(_2305);
    float _2309 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2311 = _2295 * 0.5;
    float _2313 = fma(_2275, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2315 = precise::clamp(_2313, 0.0, 1.0);
    float _2317 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.gl_Position.x = _1222;
    out.gl_Position.y = _1224;
    out.gl_Position.z = _2287;
    out.gl_Position.w = _1186;
    float _2319 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2289);
    float _2321 = fma(_2315, -2.0, 3.0);
    float _2323 = _2315 * _2315;
    float _2325 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2309);
    out.m_80.z = _2311;
    out.m_80.w = _1186;
    float _2327 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2317);
    float _2329 = _2323 * _2321;
    float _2331 = float(_2293);
    bool _2333 = _1509 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2335 = isnan(_1509);
    bool _2337 = _2333 || _2335;
    bool _2339 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2341 = _2337 || _2339;
    float _2343 = -_2329;
    float _2345 = _2343 + 1.0;
    out.m_82.x = _2331;
    float _2347 = -_1801;
    float _2349 = _2347 + 1.0;
    float _2351 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2329);
    float _2353 = _1222;
    float _2355 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    float _2357 = _2325;
    float _2359 = _2319;
    if (!_1172)
    {
        _2353 = 1.0;
    }
    float _2361 = _2353;
    float _2363 = _2327 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2365 = _2361;
    if (_1172)
    {
        bool _2367 = _1280 >= _1246;
        bool _2369 = isnan(_1280);
        bool _2371 = _2367 || _2369;
        bool _2373 = isnan(_1246);
        bool _2375 = _2371 || _2373;
        float _2377 = float(_2375);
        _2365 = _2377;
    }
    float _2379 = _2365;
    float _2381 = _2307 * _2351;
    float _2383 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2385 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2387 = _2381 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2389 = _2379 * _1485;
    float _2391 = _2383 * _1282;
    if (!_2341)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2393 = _2355;
    float _2395 = _1775 * _2387;
    float _2397 = precise::clamp(_2395, 0.0, 1.0);
    float _2399 = _2393;
    float _2401 = _2393;
    if (!_2341)
    {
        _1202 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2403 = _1202;
    float _2405 = _1293 * _2391;
    float _2407 = _1751 * _2391;
    float _2409 = -_2397;
    float _2411 = fma(_2409, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2413 = fma(_1747, _2405, _1287);
    float _2415 = fma(_1749, _2405, _1289);
    float _2417 = -_2389;
    float _2419 = fma(_2417, _2411, 1.0);
    float _2421 = precise::clamp(_2419, 0.0, 1.0);
    float _2423 = -_2383;
    float _2425 = _2423 + 1.0;
    float _2427 = fma(_1293, _2407, _1291);
    float _2429 = _2325 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2431 = _2421 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2433 = _1293 * _2425;
    float _2435 = _2319 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2437 = _2431;
    float _2439 = _2403;
    float _2441 = _2403;
    if (!_2341)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2443 = _2357;
    out.m_84.x = _2431;
    float _2445 = _2443;
    float _2447 = _2443;
    if (!_2341)
    {
        _1373 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2449 = _1373;
    float _2451 = _2449;
    float _2453 = _2449;
    if (!_2341)
    {
        _2359 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2455 = _2359;
    out.m_86.x = _2413;
    out.m_86.y = _2415;
    out.m_86.z = _2427;
    out.m_86.w = _2433;
    out.m_88.x = _2435;
    out.m_88.y = _2429;
    out.m_88.z = _2363;
    float _2457 = _2455;
    float _2459 = _2455;
    if (!_2341)
    {
        _2437 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2461 = _2437;
    bool _2463 = !_2341;
    float _2465 = _2461;
    float _2467 = _2461;
    if (!_2463)
    {
        bool _2469 = _1509 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2471 = isnan(_1509);
        bool _2473 = _2469 || _2471;
        bool _2475 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2477 = _2473 || _2475;
        if (!_2477)
        {
            float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2481 = _1509 + _2479;
            float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2485 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2483;
            float _2487 = 1.0 / _2485;
            float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2501 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2503 = _2501 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2505 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2507 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2509 = _2481 * _2487;
            float _2511 = precise::clamp(_2509, 0.0, 1.0);
            float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2515 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2517 = fma(_2511, _2491, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2519 = fma(_2511, _2515, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2521 = fma(_2511, _2495, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2523 = fma(_2511, _2499, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2525 = fma(_2511, _2503, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2527 = fma(_2511, _2507, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2453 = _2517;
            _2441 = _2525;
            _2447 = _2519;
            _2401 = _2523;
            _2459 = _2521;
            _2467 = _2527;
            _2529 = true;
        }
        else
        {
            bool _2531 = _1509 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2533 = isnan(_1509);
            bool _2535 = _2531 || _2533;
            bool _2537 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2539 = _2535 || _2537;
            if (!_2539)
            {
                _2445 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2541 = _2445;
            _2447 = _2541;
            if (!_2539)
            {
                _2451 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2543 = _2451;
            _2453 = _2543;
            if (!_2539)
            {
                _2457 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2545 = _2457;
            _2459 = _2545;
            if (!_2539)
            {
                _2399 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2547 = _2399;
            _2401 = _2547;
            if (!_2539)
            {
                _2439 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2549 = _2439;
            _2441 = _2549;
            if (!_2539)
            {
                _2465 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2551 = _2465;
            bool _2553 = !_2539;
            _2467 = _2551;
            if (!_2553)
            {
                bool _2555 = _1509 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2557 = isnan(_1509);
                bool _2559 = _2555 || _2557;
                bool _2561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2563 = _2559 || _2561;
                if (!_2563)
                {
                    float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2567 = _1509 + _2565;
                    float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2571 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2569;
                    float _2573 = 1.0 / _2571;
                    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2579 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2581 = _2579 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2583 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2585 = _2583 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2587 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2589 = _2587 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2595 = _2567 * _2573;
                    float _2597 = precise::clamp(_2595, 0.0, 1.0);
                    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2603 = fma(_2597, _2577, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2605 = fma(_2597, _2601, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2607 = fma(_2597, _2581, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2609 = fma(_2597, _2585, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2611 = fma(_2597, _2589, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2613 = fma(_2597, _2593, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2453 = _2603;
                    _2441 = _2611;
                    _2447 = _2605;
                    _2401 = _2609;
                    _2459 = _2607;
                    _2467 = _2613;
                    _2529 = true;
                }
                else
                {
                    _2453 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2441 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2447 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2401 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2459 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2467 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2529 = false;
    float _2615 = _2453;
    float _2617 = _2441;
    float _2619 = _2447;
    float _2621 = _2401;
    float _2623 = _2459;
    float _2625 = _2467;
    float _2627 = fma(_2429, -0.5, 0.5);
    float _2629 = precise::clamp(_2627, 0.0, 1.0);
    float _2631 = -_2615;
    float _2633 = _2631 + _2617;
    float _2635 = _2385 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2637 = -_2619;
    float _2639 = _2637 + _2621;
    out.m_90.x = 0.0;
    float _2641 = fma(_2629, _2633, _2615);
    float _2643 = fma(_2629, _2639, _2619);
    out.m_59.x = _2635;
    float _2645 = -_2623;
    float _2647 = _2645 + _2625;
    float _2649 = _2641 * 0.586610972881317138671875;
    bool _2651 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2653 = fma(_2629, _2647, _2623);
    float _2655 = fma(_2643, 0.298911988735198974609375, _2649);
    bool _2657 = _1423 > 0.0;
    bool _2659 = isnan(_1423);
    bool _2661 = _2657 || _2659;
    bool _2663 = isnan(0.0);
    bool _2665 = _2661 || _2663;
    out.m_92.x = 0.0;
    float _2667 = fma(_2653, 0.114477999508380889892578125, _2655);
    float _2669 = -_2667;
    float _2671 = _2643 + _2669;
    float _2673 = -_2667;
    float _2675 = _2641 + _2673;
    float _2677 = -_2667;
    float _2679 = _2653 + _2677;
    float _2681 = fma(_2671, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2667);
    float _2683 = fma(_2675, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2667);
    float _2685 = fma(_2679, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2667);
    bool _2687 = !_2651;
    if (!_2687)
    {
        float _2689 = -_1112;
        float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2693 = -_1114;
        float _2695 = _2693 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2697 = -_1116;
        float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2701 = _2691 * _2691;
        float _2703 = fma(_2695, _2695, _2701);
        float _2705 = fma(_2699, _2699, _2703);
        float _2707 = rsqrt(_2705);
        float _2709 = _2691 * _2707;
        float _2711 = _2695 * _2707;
        float _2713 = _2699 * _2707;
        float _2715 = sqrt(_2705);
        float _2717 = -_1515;
        float _2719 = _2717 + _2709;
        float _2721 = -_1511;
        float _2723 = _2721 + _2711;
        float _2725 = -_1513;
        float _2727 = _2725 + _2713;
        float _2729 = _2719 * _2719;
        float _2731 = fma(_2723, _2723, _2729);
        float _2733 = fma(_2727, _2727, _2731);
        float _2735 = -_2715;
        float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2739 = rsqrt(_2733);
        float _2741 = _2737 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = abs(_2743);
        float _2747 = log2(_2745);
        float _2749 = _2719 * _2739;
        float _2751 = _2723 * _2739;
        float _2753 = _2727 * _2739;
        float _2755 = _2429 * _2749;
        float _2757 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2759 = precise::clamp(_2757, 0.0, 1.0);
        float _2761 = _2429 * _2709;
        float _2763 = fma(_2435, _2751, _2755);
        float _2765 = _2759 * _2759;
        float _2767 = _2747 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2769 = fma(_2435, _2711, _2761);
        float _2771 = fma(_2363, _2753, _2763);
        float _2773 = precise::clamp(_2771, 0.0, 1.0);
        float _2775 = _2765 + (-1.0);
        float _2777 = fma(_2363, _2713, _2769);
        float _2779 = precise::clamp(_2777, 0.0, 1.0);
        float _2781 = _2773 * _2773;
        float _2783 = _2711 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2785 = exp2(_2767);
        float _2787 = fma(_2781, _2775, 1.0);
        float _2789 = -_2709;
        float _2791 = -_2783;
        float _2793 = fma(_2789, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2791);
        float _2795 = _2787 * _2787;
        float _2797 = -_2713;
        float _2799 = fma(_2797, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2793);
        float _2801 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2803 = _2799 + _2801;
        float _2805 = 1.0 / _2795;
        float _2807 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2809 = precise::clamp(_2807, 0.0, 1.0);
        float _2811 = _2785 * _2809;
        float _2813 = _2779 * _2811;
        float _2815 = _2813 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2817 = _2765 * _2805;
        float _2819 = _2813 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2821 = _2813 * _2817;
        float _2823 = _2813 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2825 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2827 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2829 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2815;
        out.m_90.y = _2819;
        out.m_90.z = _2823;
        out.m_92.x = _2825;
        out.m_92.y = _2827;
        out.m_92.z = _2829;
    }
    out.m_94.x = _2681;
    out.m_94.y = _2683;
    out.m_94.z = _2685;
    if (_2665)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _2831 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2831;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2529 = false;
    bool _221 = false;
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
        float _2888 = as_type<float>(_129);
        out.gl_Position.z = _2888;
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
    float _149 = 0.0;
    if (_143)
    {
        float _151 = float(_113);
        _149 = _151;
    }
    float _153 = _149;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    if (_159)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _123;
    if (_159)
    {
        out.m_59.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _131 = as_type<int>(_163);
    }
    int _165 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2956 = as_type<float>(_165);
        out.gl_Position.z = _2956;
    }
    if (_159)
    {
        return out;
    }
    float _167 = in.m_63.x;
    float _169 = in.m_63.y;
    float _171 = in.m_63.z;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _175 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _177 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _179 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _187 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _189 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _191 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _185);
    bool _193 = !_173;
    float _195 = _191;
    float _197 = _187;
    float _217;
    float _219;
    if (!_193)
    {
        float _199 = in.m_65.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = float(_113);
        float _205 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _209 = _207 * _201;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = _203;
        _221 = true;
    }
    else
    {
        float _223 = float(_113);
        float _225 = 1.0 / _223;
        float _227 = _147 * _225;
        _217 = _227;
        _219 = _223;
    }
    _221 = false;
    float _229 = _217;
    float _231 = _219;
    float _233 = in.m_56.x;
    float _235 = in.m_56.y;
    float _237 = in.m_56.z;
    float _239 = _235 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _241 = _235 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _243 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[4].x, _239);
    float _245 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[6].x, _241);
    float _247 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[4].z, _243);
    float _249 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[6].z, _245);
    float _251 = _247 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _253 = _249 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _255 = fma(_251, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _257 = fma(_253, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _259 = floor(_255);
    float _261 = floor(_257);
    float _263 = -_259;
    float _265 = _255 + _263;
    float _267 = -_261;
    float _269 = _257 + _267;
    float2 _3139 = float2(_265, _269);
    float _271 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3139, float2(0.0), isnan(_3139)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3139, float2(0.0), isnan(_3139)), level(0.0)).x;
    float _273 = _235 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = _229 + _275;
    float _279 = as_type<float>(int(gl_VertexIndex));
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _289;
    float _293 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[5].x, _273);
    float _295 = 1.0 / _283;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _229 + _297;
    float _301 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[5].z, _293);
    float _303 = _301 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _305 = 1.0 / _287;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = _229 + _307;
    float _311 = _303 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _313 = fma(_251, (*spvDescriptorSet0.vp_c8)._m0[10].x, _311);
    float _315 = 1.0 / _291;
    float _317 = _277 * _295;
    float _319 = fma(_253, (*spvDescriptorSet0.vp_c8)._m0[10].z, _313);
    int _321 = as_type<int>(_279) & 1;
    bool _323 = _321 != 0;
    int _325 = as_type<int>(_279) & 2;
    bool _327 = _325 != 0;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _333 = _299 * _305;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _343 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _345 = isnan(_229);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = fma(_331, _333, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _357 = fma(_337, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = fma(_341, _333, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _361 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _363 = isnan(_229);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _309 * _315;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    bool _379 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_229);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = _319 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _393 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _395 = isnan(_229);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = fma(_377, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = _303 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _409 = -_389;
    float _411 = _409 + 1.0;
    float _413 = -_371;
    float _415 = _413 + 1.0;
    float _417 = -_403;
    float _419 = _417 + 1.0;
    float _421 = fma(_251, (*spvDescriptorSet0.vp_c8)._m0[11].x, _407);
    float _423 = _353 * _411;
    float _425 = _403 * _415;
    float _427 = -_353;
    float _429 = _427 + 1.0;
    float _431 = fma(_253, (*spvDescriptorSet0.vp_c8)._m0[11].z, _421);
    float _433 = in.m_70.x;
    float _435 = in.m_70.y;
    float _437 = _405 * _423;
    float _439 = _357 * _423;
    float _441 = _431 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _443 = _389 * _419;
    float _445 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[143].x, _437);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _447;
    float _451 = 1.0 / _441;
    float _453 = _391 + _441;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[143].y, _439);
    float _461 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _463 = fma(_449, _373, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_457, _373, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = fma(_359, _443, _459);
    float _469 = _303 + _461;
    float _471 = fma(_355, _443, _445);
    float _473 = fma(_465, _425, _467);
    float _475 = _469 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _477 = _469 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _479 = fma(_463, _425, _471);
    float _481 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[146].y, _473);
    float _483 = _453 * _451;
    float _485 = _483 * 0.5;
    float _487 = fma(_251, (*spvDescriptorSet0.vp_c15)._m0[126].x, _475);
    float _489 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[146].x, _479);
    bool _491 = !_327;
    float _493 = _491 ? (-0.5) : 0.5;
    float _495 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _497 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[30].w, _495);
    float _499 = fma(_253, (*spvDescriptorSet0.vp_c15)._m0[126].z, _487);
    float _501 = _481 * _435;
    bool _503 = !_323;
    float _505 = _503 ? (-0.5) : 0.5;
    float _507 = fma(_251, (*spvDescriptorSet0.vp_c15)._m0[127].x, _477);
    float _509 = _489 * _433;
    float _511 = 1.0 / _497;
    float _513 = _499 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _515 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _493);
    float _517 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _519 = fma(_253, (*spvDescriptorSet0.vp_c15)._m0[127].z, _507);
    float _521 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _505);
    float _523 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _525 = _517 * _515;
    float _527 = _519 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _529 = trunc(_513);
    int _531 = int(_529);
    float _533 = _523 * _521;
    float _535 = _525 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _537 = _525 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _539 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _541 = _525 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _543 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[26].x, _535);
    float _545 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _547 = _511 * _545;
    float _549 = trunc(_527);
    int _551 = int(_549);
    float _553 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[24].x, _537);
    float _555 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[26].z, _543);
    bool _557 = _547 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _559 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[24].z, _553);
    bool _561 = _547 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _563 = _555 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _565 = !_557;
    int _567 = _565 ? 0 : 1;
    float _569 = _559 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _571 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _573 = _531 + _571;
    int _575 = _573 + 1;
    float _577 = _253 + _563;
    float _579 = _251 + _569;
    float _581 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _583 = _577 + _581;
    int _585 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _587 = _551 + _585;
    int _589 = _587 + 1;
    float _591 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _593 = _579 + _591;
    int _595 = 2;
    int _597 = _575;
    int _599 = as_type<int>(_541);
    float _601 = _579;
    float _603 = _577;
    float _605 = _513;
    if (!_557)
    {
        _595 = 1;
    }
    int _607 = _595;
    float _609 = _583 * _583;
    int _611 = _607;
    if (!_561)
    {
        _611 = _567;
    }
    int _613 = _611;
    bool _615 = _575 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _617 = _613 << 6;
    int _619 = _575 | _589;
    int _621 = _617 + 48;
    uint _624 = uint(int(uint(_621) >> uint(2)));
    uint _626 = uint(int(uint(int(_624)) >> uint(2)));
    int _628 = int(_624) & 3;
    float _630 = (*spvDescriptorSet0.vp_c15)._m0[int(_626)][_628];
    int _632 = int(_624) + 1;
    uint _634 = uint(int(uint(_632) >> uint(2)));
    int _636 = _632 & 3;
    float _638 = (*spvDescriptorSet0.vp_c15)._m0[int(_634)][_636];
    bool _640 = _619 < 0;
    bool _642 = _640 || _615;
    float _644 = fma(_593, _593, _609);
    bool _646 = _589 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _648 = _646 || _642;
    float _650 = sqrt(_644);
    int _652 = _617 + 56;
    uint _654 = uint(int(uint(_652) >> uint(2)));
    uint _656 = uint(int(uint(int(_654)) >> uint(2)));
    int _658 = int(_654) & 3;
    float _660 = (*spvDescriptorSet0.vp_c15)._m0[int(_656)][_658];
    int _662 = int(_654) + 1;
    uint _664 = uint(int(uint(_662) >> uint(2)));
    int _666 = _662 & 3;
    float _668 = (*spvDescriptorSet0.vp_c15)._m0[int(_664)][_666];
    int _670 = _617 + 64;
    uint _672 = uint(int(uint(_670) >> uint(2)));
    uint _674 = uint(int(uint(int(_672)) >> uint(2)));
    int _676 = int(_672) & 3;
    float _678 = (*spvDescriptorSet0.vp_c15)._m0[int(_674)][_676];
    int _680 = int(_672) + 1;
    uint _682 = uint(int(uint(_680) >> uint(2)));
    int _684 = _680 & 3;
    float _686 = (*spvDescriptorSet0.vp_c15)._m0[int(_682)][_684];
    float _688 = as_type<float>(_613);
    if (!_648)
    {
        int _690 = _589 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _692 = _690 + _575;
        _597 = _692;
    }
    int _694 = _597;
    float _696 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[25].x, _541);
    bool _698 = _650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _700 = _617 + 72;
    uint _702 = uint(int(uint(_700) >> uint(2)));
    uint _704 = uint(int(uint(int(_702)) >> uint(2)));
    int _706 = int(_702) & 3;
    float _708 = (*spvDescriptorSet0.vp_c15)._m0[int(_704)][_706];
    int _710 = int(_702) + 1;
    uint _712 = uint(int(uint(_710) >> uint(2)));
    int _714 = _710 & 3;
    float _716 = (*spvDescriptorSet0.vp_c15)._m0[int(_712)][_714];
    float _718 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[25].z, _696);
    if (!_648)
    {
        int _720 = _694 << 2;
        _599 = _720;
    }
    int _722 = _599;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _734 = _732 != 0;
    float _736 = _718 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _738 = 0;
    int _740 = _722;
    if (!_648)
    {
        uint _742 = uint(int(uint(_694) >> uint(2)));
        _738 = int(_742);
    }
    int _744 = _738;
    int _746 = _617 + 96;
    uint _748 = uint(int(uint(_746) >> uint(2)));
    uint _750 = uint(int(uint(int(_748)) >> uint(2)));
    int _752 = int(_748) & 3;
    float _754 = (*spvDescriptorSet0.vp_c15)._m0[int(_750)][_752];
    int _756 = int(_748) + 1;
    uint _758 = uint(int(uint(_756) >> uint(2)));
    int _760 = _756 & 3;
    float _762 = (*spvDescriptorSet0.vp_c15)._m0[int(_758)][_760];
    float _764 = as_type<float>(_744);
    if (!_648)
    {
        int _766 = 12 & _722;
        _740 = _766;
    }
    int _768 = _740;
    float _770 = _303 + _736;
    bool _772 = !_726;
    int _774 = _772 ? 0 : 1;
    if (!_648)
    {
        int _776 = _744 << 4;
        int _778 = _776 + _768;
        _764 = as_type<float>(_778);
    }
    float _780 = _764;
    bool _782 = !_730;
    int _784 = _782 ? 0 : 1;
    int _786 = _617 + 104;
    uint _788 = uint(int(uint(_786) >> uint(2)));
    uint _790 = uint(int(uint(int(_788)) >> uint(2)));
    int _792 = int(_788) & 3;
    float _794 = (*spvDescriptorSet0.vp_c15)._m0[int(_790)][_792];
    int _796 = int(_788) + 1;
    uint _798 = uint(int(uint(_796) >> uint(2)));
    int _800 = _796 & 3;
    float _802 = (*spvDescriptorSet0.vp_c15)._m0[int(_798)][_800];
    bool _804 = !_734;
    int _806 = _804 ? 0 : 1;
    float _808 = 0.0;
    if (!_698)
    {
        _808 = _770;
    }
    float _810 = _808;
    bool _812 = !_698;
    float _814 = _810;
    float _816 = _762;
    float _818 = _638;
    if (!_812)
    {
        float _820 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _822 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _824 = _650 + _822;
        float _826 = rsqrt(_644);
        float _828 = _824 * _820;
        float _830 = _770 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _832 = _828 * 0.15915493667125701904296875;
        float _834 = _832 * 6.283185482025146484375;
        float _836 = cos(_834);
        float _838 = _832 * 6.283185482025146484375;
        float _840 = sin(_838);
        float _842 = _836 + (-1.0);
        float _844 = _842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _846 = fma(_840, _830, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _848 = fma(_770, _836, _844);
        float _850 = _826 * _846;
        float _852 = fma(_593, _850, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _854 = fma(_583, _850, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _814 = _848;
        _601 = _852;
        _603 = _854;
    }
    float _856 = _814;
    float _858 = _601;
    float _860 = _603;
    float _862 = -_303;
    float _864 = _862 + _856;
    int _866 = _617 + 80;
    uint _868 = uint(int(uint(_866) >> uint(2)));
    uint _870 = uint(int(uint(int(_868)) >> uint(2)));
    int _872 = int(_868) & 3;
    float _874 = (*spvDescriptorSet0.vp_c15)._m0[int(_870)][_872];
    int _876 = int(_868) + 1;
    uint _878 = uint(int(uint(_876) >> uint(2)));
    int _880 = _876 & 3;
    float _882 = (*spvDescriptorSet0.vp_c15)._m0[int(_878)][_880];
    float _884 = -_251;
    float _886 = _884 + _858;
    float _888 = -_253;
    float _890 = _888 + _860;
    float _892 = _864 * _864;
    float _894 = _469 * _762;
    float _896 = _469 * _686;
    float _898 = _858;
    float _900 = _856;
    float _902 = _860;
    if (!_648)
    {
        float _904 = floor(_527);
        _816 = _904;
    }
    float _906 = _816;
    float _908 = fma(_886, _886, _892);
    int _910 = _617 + 88;
    uint _912 = uint(int(uint(_910) >> uint(2)));
    uint _914 = uint(int(uint(int(_912)) >> uint(2)));
    int _916 = int(_912) & 3;
    float _918 = (*spvDescriptorSet0.vp_c15)._m0[int(_914)][_916];
    int _920 = int(_912) + 1;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    int _924 = _920 & 3;
    float _926 = (*spvDescriptorSet0.vp_c15)._m0[int(_922)][_924];
    float _928 = fma(_251, _754, _894);
    float _930 = fma(_251, _678, _896);
    float _932 = fma(_890, _890, _908);
    float _934 = fma(_253, _794, _928);
    float _936 = _469 * _638;
    float _938 = sqrt(_932);
    float _940 = _780;
    if (!_648)
    {
        int _942 = as_type<int>(_780) + 400;
        uint _944 = uint(int(uint(_942) >> uint(2)));
        uint _946 = uint(int(uint(int(_944)) >> uint(2)));
        int _948 = int(_944) & 3;
        float _950 = (*spvDescriptorSet0.vp_c15)._m0[int(_946)][_948];
        _940 = _950;
    }
    float _952 = _940;
    float _954 = _934 + _802;
    float _956 = fma(_251, _630, _936);
    float _958 = fma(_253, _708, _930);
    bool _960 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _962 = isnan(0.5);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _968 = _964 || _966;
    float _970 = fma(_253, _660, _956);
    float _972 = _892;
    float _974 = _970;
    if (!_648)
    {
        float _976 = floor(_513);
        _972 = _976;
    }
    float _978 = _972;
    float _980 = _958 + _716;
    float _982 = _970 + _668;
    bool _984 = _938 > 0.0;
    float _986 = 1.0 / _954;
    bool _988 = !_984;
    if (!_988)
    {
        float _990 = _189 * _189;
        float _992 = rsqrt(_932);
        float _994 = fma(_187, _187, _990);
        float _996 = fma(_191, _191, _994);
        float _998 = sqrt(_996);
        float _1000 = _886 * _992;
        float _1002 = _864 * _992;
        float _1004 = _890 * _992;
        bool _1006 = _998 > 0.0;
        bool _1008 = !_1006;
        _818 = _996;
        _974 = _998;
        if (!_1008)
        {
            float _1010 = rsqrt(_996);
            float _1012 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1014 = _189 * _1010;
            float _1016 = _187 * _1010;
            float _1018 = _1002 * _1014;
            float _1020 = _191 * _1010;
            float _1022 = fma(_1000, _1016, _1018);
            float _1024 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1026 = fma(_1004, _1020, _1022);
            float _1028 = _1026 * _1024;
            float _1030 = fma(_187, _1028, _858);
            float _1032 = fma(_189, _1028, _856);
            float _1034 = fma(_191, _1028, _860);
            _898 = _1030;
            _900 = _1032;
            _902 = _1034;
            _818 = _1010;
            _974 = _1016;
        }
    }
    float _1036 = _898;
    float _1038 = _900;
    float _1040 = _902;
    float _1042 = _818;
    float _1044 = _974;
    float _1046 = _1044;
    float _1048 = _1042;
    if (_968)
    {
        _1046 = _1036;
    }
    float _1050 = _1046;
    float _1052 = _1050;
    if (_968)
    {
        _1048 = _1038;
    }
    float _1054 = _1048;
    float _1056 = _1054;
    if (_968)
    {
        _195 = _1040;
    }
    float _1058 = _195;
    float _1060 = _1058;
    if (!_968)
    {
        float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1064 = _303 + _1062;
        float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1068 = _251 + _1066;
        float _1070 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1072 = _1064 * _1064;
        float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1076 = _253 + _1074;
        float _1078 = fma(_1068, _1068, _1072);
        float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1082 = fma(_1076, _1076, _1078);
        float _1084 = sqrt(_1082);
        float _1086 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1088 = -_253;
        float _1090 = _1088 + _1040;
        float _1092 = precise::min(_1084, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1094 = _1092 * _1080;
        float _1096 = -_303;
        float _1098 = _1096 + _1038;
        float _1100 = _1086 * _1094;
        float _1102 = -_251;
        float _1104 = _1102 + _1036;
        float _1106 = fma(_1098, _1100, _303);
        float _1108 = fma(_1104, _1100, _251);
        float _1110 = fma(_1090, _1100, _253);
        _1056 = _1106;
        _1052 = _1108;
        _1060 = _1110;
    }
    float _1112 = _1056;
    float _1114 = _1052;
    float _1116 = _1060;
    float _1118 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1120 = _982 * _986;
    float _1122 = _980 * _986;
    float _1124 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1126 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1118);
    float _1128 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1130 = _1120 >= 0.0;
    float _1132 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1124);
    float _1134 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1126);
    float _1136 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1128);
    float _1138 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1140 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1132);
    float _1142 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1144 = _1120 <= 1.0;
    bool _1146 = _1144 && _1130;
    float _1148 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1136);
    float _1150 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1138);
    float _1152 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1154 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1156 = _1148 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1158 = _1122 >= 0.0;
    bool _1160 = _1158 && _1146;
    float _1162 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1150);
    float _1164 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1154);
    float _1166 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1170 = _1122 <= 1.0;
    bool _1172 = _1170 && _1160;
    float _1174 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1176 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1164);
    float _1178 = -_1168;
    float _1180 = fma(_1178, _1166, 1.0);
    float _1182 = _469 * _882;
    float _1184 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1186 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1176);
    float _1188 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1190 = fma(_251, _874, _1182);
    float _1192 = log2(_1180);
    float _1194 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1184);
    float _1196 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1188);
    float _1198 = fma(_253, _918, _1190);
    float _1200 = _1120;
    float _1202 = _1186;
    if (_1172)
    {
        float _1204 = float(_613);
        _197 = _1204;
    }
    float _1206 = _197;
    float _1208 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1194);
    float _1210 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1196);
    if (!_648)
    {
        float _1212 = -_906;
        float _1214 = _527 + _1212;
        _688 = _1214;
    }
    float _1216 = _688;
    float _1218 = 1.0 / _1186;
    float _1220 = _1198 + _926;
    float _1222 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1210);
    float _1224 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1208);
    if (!_648)
    {
        float _1226 = -_978;
        float _1228 = _513 + _1226;
        _605 = _1228;
    }
    float _1230 = _605;
    float _1232 = _1038;
    if (!_648)
    {
        float _1234 = rint(_952);
        float _1236 = precise::max(_1234, 0.0);
        uint _1238 = uint(_1236);
        uint _1240 = clamp(_1238, 0u, 65535u);
        _1232 = as_type<float>(_1240);
    }
    float _1242 = _1232;
    float _1244 = _1192 * 0.693147182464599609375;
    float _1246 = _1220 * _986;
    float _1248 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1250 = _1206;
    if (_1172)
    {
        float _1252 = rint(_1206);
        float _1254 = precise::max(_1252, 0.0);
        uint _1256 = uint(_1254);
        uint _1258 = clamp(_1256, 0u, 65535u);
        _1250 = as_type<float>(_1258);
    }
    float _1260 = _1250;
    float _1262 = _1222 * _1218;
    float _1264 = _1224 * _1218;
    float _1266 = fma(_1262, 0.5, 0.5);
    float _1268 = fma(_1264, -0.5, 0.5);
    float _1270 = _1242;
    if (!_648)
    {
        float3 _4804 = float3(_1230, _1216, float(as_type<int>(_1242)));
        float3 _4808 = select(_4804, float3(0.0), isnan(_4804));
        float _1272 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4808.xy, uint(rint(_4808.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4808.xy, uint(rint(_4808.z)), level(0.0)).x;
        _1270 = _1272;
    }
    float _1274 = _1270;
    float _1276 = _1260;
    if (_1172)
    {
        float3 _4823 = float3(_1120, _1122, float(as_type<int>(_1260)));
        float3 _4825 = select(_4823, float3(0.0), isnan(_4823));
        float _1278 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4825.xy, uint(rint(_4825.z)), _1246, level(0.0));
        _1276 = _1278;
    }
    float _1280 = _1276;
    float3 _4835 = float3(_1266, _1268, _1248);
    float _1282 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4835, float3(0.0), isnan(_4835)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4835, float3(0.0), isnan(_4835)), level(0.0)).x;
    float3 _4844 = float3(_1266, _1268, _1248);
    float4 _1285 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4844, float3(0.0), isnan(_4844)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4844, float3(0.0), isnan(_4844)), level(0.0)).xyzw;
    float _1287 = _1285.x;
    float _1289 = _1285.y;
    float _1291 = _1285.z;
    float _1293 = _1285.w;
    float _1295 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1297 = int(_1295);
    bool _1299 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1301 = isnan(0.5);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1307 = _1303 || _1305;
    float _1309 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1311 = int(_1309);
    float _1313 = float(_1297);
    float _1315 = 1.0 / _1313;
    float _1317 = float(uint(_1311));
    float _1319 = 1.0 / _1317;
    float _1321 = _147 * _1315;
    float _1323 = trunc(_1321);
    int _1325 = int(_1323);
    int _1327 = as_type<int>(_1319) + (-2);
    if (_648)
    {
        _1200 = 1.0;
    }
    float _1329 = _1200;
    float _1331 = float(uint(_1325));
    float _1333 = as_type<float>(_1327) * _1331;
    float _1335 = trunc(_1333);
    float _1337 = precise::max(_1335, 0.0);
    uint _1339 = uint(_1337);
    int _1341 = ~_1311;
    int _1343 = _1341 + 1;
    float _1345 = _1333;
    float _1347 = _1329;
    if (_1307)
    {
        _1345 = 1.0;
    }
    float _1349 = _1345;
    int _1351 = _1343 * int(_1339);
    int _1353 = _1351 + _1325;
    float _1355 = float(uint(_1353));
    float _1357 = as_type<float>(_1327) * _1355;
    int _1359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1361 = _1359 != 0;
    float _1363 = trunc(_1357);
    float _1365 = precise::max(_1363, 0.0);
    uint _1367 = uint(_1365);
    int _1369 = int(_1339) + int(_1367);
    float _1371 = _1349;
    float _1373 = _1287;
    if (!_1307)
    {
        float _1375 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1377 = _1375 * 0.15915493667125701904296875;
        float _1379 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1381 = _1377 * 6.283185482025146484375;
        float _1383 = cos(_1381);
        float _1385 = _1379 * 0.15915493667125701904296875;
        float _1387 = _1377 * 6.283185482025146484375;
        float _1389 = sin(_1387);
        float _1391 = 1.0 / _1383;
        float _1393 = _1385 * 6.283185482025146484375;
        float _1395 = cos(_1393);
        float _1397 = _1389 * _1391;
        float _1399 = _1385 * 6.283185482025146484375;
        float _1401 = sin(_1399);
        float _1403 = _1395 * _1397;
        float _1405 = 1.0 / _1403;
        float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1409 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1407;
        float _1411 = 1.0 / _1409;
        float _1413 = _1401 * _1405;
        float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1417 = fma(_547, _1413, _1415);
        float _1419 = _1417 * _1411;
        float _1421 = precise::clamp(_1419, 0.0, 1.0);
        _1371 = _1421;
    }
    float _1423 = _1371;
    if (!_648)
    {
        int _1425 = _694 << 4;
        int _1427 = _1425 + 2048;
        uint _1429 = uint(int(uint(_1427) >> uint(2)));
        uint _1431 = uint(int(uint(int(_1429)) >> uint(2)));
        int _1433 = int(_1429) & 3;
        float _1435 = (*spvDescriptorSet0.vp_c15)._m0[int(_1431)][_1433];
        int _1437 = int(_1429) + 1;
        uint _1439 = uint(int(uint(_1437) >> uint(2)));
        int _1441 = _1437 & 3;
        float _1443 = (*spvDescriptorSet0.vp_c15)._m0[int(_1439)][_1441];
        int _1445 = _1427 + 8;
        uint _1447 = uint(int(uint(_1445) >> uint(2)));
        uint _1449 = uint(int(uint(int(_1447)) >> uint(2)));
        int _1451 = int(_1447) & 3;
        float _1453 = (*spvDescriptorSet0.vp_c15)._m0[int(_1449)][_1451];
        int _1455 = int(_1447) + 1;
        uint _1457 = uint(int(uint(_1455) >> uint(2)));
        int _1459 = _1455 & 3;
        float _1461 = (*spvDescriptorSet0.vp_c15)._m0[int(_1457)][_1459];
        float _1463 = _469 * _1443;
        float _1465 = fma(_251, _1435, _1463);
        float _1467 = fma(_253, _1453, _1465);
        float _1469 = _1467 + _1461;
        float _1471 = precise::clamp(_1469, 0.0, 1.0);
        float _1473 = -_1471;
        float _1475 = _1473 + _1274;
        float _1477 = fma(_1475, 500.0, 1.5);
        float _1479 = exp2(_1477);
        float _1481 = 0.0 + _1479;
        float _1483 = precise::clamp(_1481, 0.0, 1.0);
        _1347 = _1483;
    }
    float _1485 = _1347;
    float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1489 = _1112 + _1487;
    float _1491 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1493 = _1114 + _1491;
    float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1497 = _1116 + _1495;
    float _1499 = _1489 * _1489;
    float _1501 = fma(_1493, _1493, _1499);
    float _1503 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1505 = fma(_1497, _1497, _1501);
    float _1507 = rsqrt(_1505);
    float _1509 = sqrt(_1505);
    float _1511 = _1493 * _1507;
    float _1513 = _1497 * _1507;
    float _1515 = _1489 * _1507;
    float _1517 = precise::max(0.0, _1503);
    float _1519 = _1511 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1521 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1523 = _1519 * _1519;
    float _1525 = _1521 * _1521;
    float _1527 = -_1515;
    float _1529 = -_1517;
    float _1531 = fma(_1527, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1529);
    float _1533 = _1523 + _1525;
    float _1535 = sqrt(_1533);
    bool _1537 = _1535 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1541 = _1535 + _1539;
    float _1543 = as_type<float>(_617);
    float _1545 = _1517;
    float _1547 = _1533;
    float _1549 = _1541;
    float _1551 = _1503;
    float _1553 = _1519;
    float _1555 = _1523;
    float _1557 = _1525;
    if (_1537)
    {
        float _1559 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1543 = _1559;
    }
    float _1561 = _1543;
    if (_1537)
    {
        float _1563 = _1531 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1545 = _1563;
    }
    float _1565 = _1545;
    float _1567 = _1565;
    if (_1537)
    {
        float _1569 = rsqrt(_1533);
        _1547 = _1569;
    }
    float _1571 = _1547;
    float _1573 = _1561;
    if (_1537)
    {
        float _1575 = _1541 * _1561;
        _1549 = _1575;
    }
    float _1577 = _1549;
    if (_1537)
    {
        float _1579 = _1577 * 0.15915493667125701904296875;
        _1573 = _1579;
    }
    float _1581 = _1573;
    float _1583 = _251;
    if (_1537)
    {
        float _1585 = _1581 * 6.283185482025146484375;
        float _1587 = sin(_1585);
        _1583 = _1587;
    }
    float _1589 = _1583;
    float _1591 = _1577;
    if (_1537)
    {
        float _1593 = _1581 * 6.283185482025146484375;
        float _1595 = cos(_1593);
        _1591 = _1595;
    }
    float _1597 = _1591;
    float _1599 = _1589;
    if (_1537)
    {
        float _1601 = fma(_1589, _1565, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1567 = _1601;
    }
    float _1603 = _1567;
    float _1605 = _1603;
    if (!_1537)
    {
        _1599 = _1531;
    }
    float _1607 = _1599;
    float _1609 = 0.0;
    float _1611 = _1607;
    if (_1537)
    {
        float _1613 = _1571 * _1603;
        _1609 = _1613;
    }
    float _1615 = _1609;
    if (_1537)
    {
        float _1617 = _1597 + (-1.0);
        _1551 = _1617;
    }
    float _1619 = _1551;
    float _1621 = _1619;
    if (_1537)
    {
        float _1623 = _1519 * _1615;
        _1553 = _1623;
    }
    float _1625 = _1553;
    if (_1537)
    {
        float _1627 = _1619 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1605 = _1627;
    }
    float _1629 = _1605;
    if (!_1537)
    {
        _1621 = _1521;
    }
    float _1631 = _1621;
    float _1633 = _1631;
    if (_1537)
    {
        float _1635 = _1521 * _1615;
        _1633 = _1635;
    }
    float _1637 = _1633;
    if (_1537)
    {
        float _1639 = _1625 * _1625;
        _1555 = _1639;
    }
    float _1641 = _1555;
    if (_1537)
    {
        float _1643 = fma(_1531, _1597, _1629);
        _1611 = _1643;
    }
    float _1645 = _1611;
    if (_1537)
    {
        float _1647 = _1637 * _1637;
        _1557 = _1647;
    }
    float _1649 = _1557;
    int _1651 = ~_1311;
    int _1653 = _1651 + 1;
    float _1655 = fma(_1645, _1645, _1641);
    float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1659 = fma(_1509, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1657);
    float _1661 = precise::clamp(_1659, 0.0, 1.0);
    float _1663 = _1655 + _1649;
    int _1665 = _1653 * _1369;
    int _1667 = _1665 + _1325;
    float _1669 = -_1661;
    float _1671 = _1669 + 1.0;
    float _1673 = rsqrt(_1663);
    float _1675 = abs(_1671);
    float _1677 = log2(_1675);
    float _1679 = _1673 * _1625;
    float _1681 = _1673 * _1645;
    float _1683 = _1673 * _1637;
    float _1685 = _1679 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1687 = in.m_65.x;
    float _1689 = in.m_65.y;
    float _1691 = -_1685;
    float _1693 = fma(_1681, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1691);
    float _1695 = -_1683;
    float _1697 = fma(_1695, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1693);
    float _1699 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _1701 = !_1361;
    float _1703 = _1701 ? 7.345489978790283203125 : 1.0;
    float _1705 = fma(_1697, -0.5, 0.5);
    float _1707 = fma(_1697, 0.5, 0.5);
    float _1709 = exp2(_1699);
    float _1711 = fma(_1707, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1713 = fma(_1707, _1711, -0.212114393711090087890625);
    float _1715 = sqrt(_1705);
    float _1717 = float(_1325);
    float _1719 = fma(_1707, _1713, 1.570728778839111328125);
    float _1721 = _1703 * _1687;
    float _1723 = 1.0 / _231;
    float _1725 = _1681 + 1.0;
    float _1727 = -_1681;
    float _1729 = fma(_1709, _1725, _1727);
    float _1731 = _1715 * 0.636619746685028076171875;
    float _1733 = fma(_1729, 0.5, 0.5);
    float _1735 = floor(_1721);
    float _1737 = -_1719;
    float _1739 = fma(_1731, _1737, 1.0);
    float _1741 = float(_1311);
    float2 _5509 = float2(_1739, _1733);
    float3 _1745 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5509, float2(0.0), isnan(_5509)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5509, float2(0.0), isnan(_5509)), level(0.0)).xyz;
    float _1747 = _1745.x;
    float _1749 = _1745.y;
    float _1751 = _1745.z;
    bool _1753 = _1717 >= _1741;
    bool _1755 = isnan(_1717);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan(_1741);
    bool _1761 = _1757 || _1759;
    float _1763 = float(_1761);
    float _1765 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1767 = uint(_1667) >= uint(_1311);
    float _1769 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1771 = abs(_774);
    float _1773 = -_271;
    float _1775 = _1773 + 1.0;
    float _1777 = trunc(_1763);
    int _1779 = int(_1777);
    bool _1781 = !_1767;
    int _1783 = _1781 ? 0 : (-1);
    out.m_72.x = _1114;
    out.m_72.y = _1112;
    out.m_72.z = _1116;
    float _1785 = -_1735;
    float _1787 = _1721 + _1785;
    bool _1789 = _1311 == 0;
    int _1791 = ~_1369;
    int _1793 = _1791 + _1783;
    int _1795 = _1793 + 1;
    float _1797 = _1787 * _1741;
    float _1799 = _147 * _1741;
    float _1801 = exp2(_1769);
    int _1803 = _1311 * _1795;
    int _1805 = _1803 + _1325;
    float _1807 = _1799 * _1723;
    int _1809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1811 = _1809 != 0;
    int _1813 = _1311 + (-1);
    int _1815 = ~_1779;
    int _1817 = _1815 + 1;
    int _1819 = _1817 + 1;
    float _1821 = trunc(_1797);
    int _1823 = int(_1821);
    bool _1825 = !_1789;
    int _1827 = _1825 ? _1805 : (-1);
    bool _1829 = !_1811;
    int _1831 = _1829 ? 0 : 1;
    int _1833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1835 = _1833 != 0;
    int _1837 = _1827 * _1819;
    int _1839 = abs(_784);
    float _1841 = trunc(_1807);
    int _1843 = int(_1841);
    int _1845 = abs(_1831);
    int _1847 = _1779 * _1813;
    int _1849 = _1847 + _1837;
    bool _1851 = !_1835;
    int _1853 = _1851 ? 0 : 1;
    int _1855 = abs(_806);
    int _1857 = _1849 * _1839;
    int _1859 = abs(_1853);
    int _1861 = _1823 * _1845;
    int _1863 = _1861 + _1325;
    float _1865 = float(uint(_1863));
    int _1867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1869 = _1867 != 0;
    int _1871 = _1843 * _1771;
    int _1873 = _1871 + _1857;
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1877 = as_type<float>(_1327) * _1865;
    int _1879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1881 = _1879 != 0;
    int _1883 = _1863 * _1855;
    int _1885 = _1883 + _1873;
    int _1887 = ~_1311;
    int _1889 = _1887 + 1;
    float _1891 = trunc(_1877);
    float _1893 = precise::max(_1891, 0.0);
    uint _1895 = uint(_1893);
    int _1897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1899 = _1897 != 0;
    int _1901 = _1823 * _1859;
    int _1903 = _1901 + _1885;
    float _1905 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1907 = _1687 > 0.5;
    float _1909 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1875);
    float _1911 = float(uint(_1903));
    float _1913 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1909);
    float _1915 = as_type<float>(_1327) * _1911;
    float _1917 = -_1913;
    float _1919 = _1917 + 1.0;
    float _1921 = trunc(_1915);
    float _1923 = precise::max(_1921, 0.0);
    uint _1925 = uint(_1923);
    float _1927 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1929 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1931 = -_1927;
    float _1933 = fma(_1905, 2.0, _1931);
    float _1935 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1937 = ~_1311;
    int _1939 = _1937 + 1;
    float _1941 = fma(_1935, -2.0, _1929);
    int _1943 = _1889 * int(_1925);
    int _1945 = _1943 + _1903;
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1949 = float(uint(_1945));
    float _1951 = _1947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1953 = ~_1311;
    int _1955 = _1953 + 1;
    float _1957 = as_type<float>(_1327) * _1949;
    int _1959 = _1955 * int(_1895);
    int _1961 = _1959 + _1863;
    float _1963 = trunc(_1957);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    int _1969 = int(_1925) + int(_1967);
    float _1971 = float(uint(_1961));
    int _1973 = _1939 * _1969;
    int _1975 = _1973 + _1903;
    float _1977 = as_type<float>(_1327) * _1971;
    bool _1979 = uint(_1975) >= uint(_1311);
    float _1981 = trunc(_1977);
    float _1983 = precise::max(_1981, 0.0);
    uint _1985 = uint(_1983);
    bool _1987 = !_1979;
    int _1989 = _1987 ? 0 : (-1);
    bool _1991 = _1689 > 0.5;
    int _1993 = ~_1969;
    int _1995 = _1993 + _1989;
    int _1997 = _1995 + 1;
    float _1999 = -_493;
    int _2001 = _1991 ? as_type<int>(_1999) : as_type<int>(_493);
    int _2003 = _1311 * _1997;
    int _2005 = _2003 + _1903;
    bool _2007 = !_1789;
    int _2009 = _2007 ? _2005 : (-1);
    int _2011 = int(_1895) + int(_1985);
    int _2013 = _2009 >> 31;
    int _2015 = _2013 & 3;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2019 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2021 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2023 = _2009 + _2015;
    float _2025 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2029 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2031 = _2023 >> 2;
    float _2033 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2035 = _2017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2037 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2029);
    int _2039 = _2031 << 4;
    int _2041 = _2039 + 368;
    float _2043 = _2019 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2045 = -_505;
    int _2047 = _1907 ? as_type<int>(_2045) : as_type<int>(_505);
    float _2049 = _2021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _2051 = uint(int(uint(_2041) >> uint(2)));
    uint _2053 = uint(int(uint(int(_2051)) >> uint(2)));
    int _2055 = int(_2051) & 3;
    float _2057 = (*spvDescriptorSet0.vp_c9)._m0[int(_2053)][_2055];
    int _2059 = int(_2051) + 1;
    uint _2061 = uint(int(uint(_2059) >> uint(2)));
    int _2063 = _2059 & 3;
    float _2065 = (*spvDescriptorSet0.vp_c9)._m0[int(_2061)][_2063];
    int _2067 = ~_1311;
    int _2069 = _2067 + 1;
    float _2071 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2073 = !_1881;
    float _2075 = _2073 ? _505 : as_type<float>(_2047);
    float _2077 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2079 = _2009 & 3;
    bool _2081 = _2079 != 0;
    out.m_74.x = _1951;
    out.m_74.y = _2035;
    out.m_74.z = _2043;
    out.m_74.w = _2033;
    int _2083 = _2009 & 3;
    bool _2085 = _2083 != 0;
    out.m_76.x = _2049;
    out.m_76.y = _2071;
    out.m_76.z = _2077;
    bool _2087 = uint(_2083) > 1u;
    int _2089 = _2041 + 8;
    uint _2091 = uint(int(uint(_2089) >> uint(2)));
    uint _2093 = uint(int(uint(int(_2091)) >> uint(2)));
    int _2095 = int(_2091) & 3;
    float _2097 = (*spvDescriptorSet0.vp_c9)._m0[int(_2093)][_2095];
    int _2099 = int(_2091) + 1;
    uint _2101 = uint(int(uint(_2099) >> uint(2)));
    int _2103 = _2099 & 3;
    float _2105 = (*spvDescriptorSet0.vp_c9)._m0[int(_2101)][_2103];
    float _2107 = -_147;
    float _2109 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1933);
    bool _2111 = !_1899;
    float _2113 = _2111 ? _493 : as_type<float>(_2001);
    float _2115 = _2075 + 0.5;
    int _2117 = _2081 ? 0 : 1;
    float _2119 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1941);
    int _2121 = _2069 * _2011;
    int _2123 = _2121 + _1863;
    float _2125 = fma(_2115, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2109);
    float _2127 = _2113 + (-0.5);
    int _2129 = ~_2117;
    int _2131 = _2129 + 1;
    int _2133 = _2131 + 1;
    float _2135 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2037);
    int _2137 = _2133;
    if (!_2087)
    {
        int _2139 = ~_2117;
        int _2141 = _2139 + 1;
        _2137 = _2141;
    }
    int _2143 = _2137;
    float _2145 = -_2127;
    float _2147 = -_2119;
    float _2149 = fma(_2145, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2147);
    bool _2151 = !_2085;
    int _2153 = _2151 ? 0 : 1;
    float _2155 = -_2135;
    float _2157 = _2155 + 1.0;
    int _2159 = abs(_2143);
    float _2161 = _493 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2163 = _2083 != 3;
    float _2165 = fma(_2113, _2157, _2149);
    bool _2167 = uint(_2083) >= 2u;
    bool _2169 = _2083 != 3;
    bool _2171 = uint(_2123) >= uint(_1311);
    int _2173 = abs(_2153);
    bool _2175 = !_2171;
    int _2177 = _2175 ? 0 : (-1);
    int _2179 = ~_2159;
    int _2181 = _2179 + 1;
    int _2183 = _2181 + 1;
    int _2185 = ~_2011;
    int _2187 = _2185 + _2177;
    int _2189 = _2187 + 1;
    int _2191 = ~_2173;
    int _2193 = _2191 + 1;
    int _2195 = _2193 + 1;
    int _2197 = _2183 * as_type<int>(_2065);
    int _2199 = _2167 ? 0 : 1;
    int _2201 = _1311 * _2189;
    int _2203 = _2201 + _1863;
    bool _2205 = !_1869;
    int _2207 = _2205 ? 0 : 1;
    int _2209 = _2195 * as_type<int>(_2057);
    int _2211 = _2209 + _2197;
    int _2213 = ~_2199;
    int _2215 = _2213 + 1;
    int _2217 = _2215 + 1;
    float _2219 = abs(_547);
    float _2221 = log2(_2219);
    int _2223 = _2217;
    if (_2163)
    {
        int _2225 = ~_2199;
        int _2227 = _2225 + 1;
        _2223 = _2227;
    }
    int _2229 = _2223;
    bool _2231 = !_2169;
    int _2233 = _2231 ? 0 : (-1);
    int _2235 = abs(_2229);
    int _2237 = abs(_2233);
    int _2239 = abs(_2207);
    int _2241 = ~_2235;
    int _2243 = _2241 + 1;
    int _2245 = _2243 + 1;
    int _2247 = ~_2237;
    int _2249 = _2247 + 1;
    int _2251 = _2249 + 1;
    int _2253 = _2245 * as_type<int>(_2097);
    int _2255 = _2253 + _2211;
    float _2257 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1765);
    float _2259 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2261 = ~_2239;
    int _2263 = _2261 + 1;
    int _2265 = _2263 + 1;
    int _2267 = _2251 * as_type<int>(_2105);
    int _2269 = _2267 + _2255;
    float _2271 = _505 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2273 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2257);
    float _2275 = exp2(_2259);
    int _2277 = _2269 * _2265;
    float _2279 = -_1919;
    float _2281 = fma(_2075, _2279, _2125);
    bool _2283 = !_1789;
    int _2285 = _2283 ? _2203 : (-1);
    float _2287 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2273);
    float _2289 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_78.x = _2281;
    out.m_78.y = _2165;
    int _2291 = _2285 * _2239;
    int _2293 = _2291 + _2277;
    float _2295 = _2287 + _1186;
    bool _2297 = _547 <= 8000.0;
    bool _2299 = isnan(_547);
    bool _2301 = _2297 || _2299;
    bool _2303 = isnan(8000.0);
    bool _2305 = _2301 || _2303;
    float _2307 = float(_2305);
    float _2309 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2311 = _2295 * 0.5;
    float _2313 = fma(_2275, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2315 = precise::clamp(_2313, 0.0, 1.0);
    float _2317 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.gl_Position.x = _1222;
    out.gl_Position.y = _1224;
    out.gl_Position.z = _2287;
    out.gl_Position.w = _1186;
    float _2319 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2289);
    float _2321 = fma(_2315, -2.0, 3.0);
    float _2323 = _2315 * _2315;
    float _2325 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2309);
    out.m_80.z = _2311;
    out.m_80.w = _1186;
    float _2327 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2317);
    float _2329 = _2323 * _2321;
    float _2331 = float(_2293);
    bool _2333 = _1509 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2335 = isnan(_1509);
    bool _2337 = _2333 || _2335;
    bool _2339 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2341 = _2337 || _2339;
    float _2343 = -_2329;
    float _2345 = _2343 + 1.0;
    out.m_82.x = _2331;
    float _2347 = -_1801;
    float _2349 = _2347 + 1.0;
    float _2351 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2329);
    float _2353 = _1222;
    float _2355 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    float _2357 = _2325;
    float _2359 = _2319;
    if (!_1172)
    {
        _2353 = 1.0;
    }
    float _2361 = _2353;
    float _2363 = _2327 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2365 = _2361;
    if (_1172)
    {
        bool _2367 = _1280 >= _1246;
        bool _2369 = isnan(_1280);
        bool _2371 = _2367 || _2369;
        bool _2373 = isnan(_1246);
        bool _2375 = _2371 || _2373;
        float _2377 = float(_2375);
        _2365 = _2377;
    }
    float _2379 = _2365;
    float _2381 = _2307 * _2351;
    float _2383 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2385 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2387 = _2381 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2389 = _2379 * _1485;
    float _2391 = _2383 * _1282;
    if (!_2341)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2393 = _2355;
    float _2395 = _1775 * _2387;
    float _2397 = precise::clamp(_2395, 0.0, 1.0);
    float _2399 = _2393;
    float _2401 = _2393;
    if (!_2341)
    {
        _1202 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2403 = _1202;
    float _2405 = _1293 * _2391;
    float _2407 = _1751 * _2391;
    float _2409 = -_2397;
    float _2411 = fma(_2409, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2413 = fma(_1747, _2405, _1287);
    float _2415 = fma(_1749, _2405, _1289);
    float _2417 = -_2389;
    float _2419 = fma(_2417, _2411, 1.0);
    float _2421 = precise::clamp(_2419, 0.0, 1.0);
    float _2423 = -_2383;
    float _2425 = _2423 + 1.0;
    float _2427 = fma(_1293, _2407, _1291);
    float _2429 = _2325 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2431 = _2421 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2433 = _1293 * _2425;
    float _2435 = _2319 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2437 = _2431;
    float _2439 = _2403;
    float _2441 = _2403;
    if (!_2341)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2443 = _2357;
    out.m_84.x = _2431;
    float _2445 = _2443;
    float _2447 = _2443;
    if (!_2341)
    {
        _1373 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2449 = _1373;
    float _2451 = _2449;
    float _2453 = _2449;
    if (!_2341)
    {
        _2359 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2455 = _2359;
    out.m_86.x = _2413;
    out.m_86.y = _2415;
    out.m_86.z = _2427;
    out.m_86.w = _2433;
    out.m_88.x = _2435;
    out.m_88.y = _2429;
    out.m_88.z = _2363;
    float _2457 = _2455;
    float _2459 = _2455;
    if (!_2341)
    {
        _2437 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2461 = _2437;
    bool _2463 = !_2341;
    float _2465 = _2461;
    float _2467 = _2461;
    if (!_2463)
    {
        bool _2469 = _1509 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2471 = isnan(_1509);
        bool _2473 = _2469 || _2471;
        bool _2475 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2477 = _2473 || _2475;
        if (!_2477)
        {
            float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2481 = _1509 + _2479;
            float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2485 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2483;
            float _2487 = 1.0 / _2485;
            float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2501 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2503 = _2501 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2505 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2507 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2509 = _2481 * _2487;
            float _2511 = precise::clamp(_2509, 0.0, 1.0);
            float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2515 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2517 = fma(_2511, _2491, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2519 = fma(_2511, _2515, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2521 = fma(_2511, _2495, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2523 = fma(_2511, _2499, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2525 = fma(_2511, _2503, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2527 = fma(_2511, _2507, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2453 = _2517;
            _2441 = _2525;
            _2447 = _2519;
            _2401 = _2523;
            _2459 = _2521;
            _2467 = _2527;
            _2529 = true;
        }
        else
        {
            bool _2531 = _1509 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2533 = isnan(_1509);
            bool _2535 = _2531 || _2533;
            bool _2537 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2539 = _2535 || _2537;
            if (!_2539)
            {
                _2445 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2541 = _2445;
            _2447 = _2541;
            if (!_2539)
            {
                _2451 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2543 = _2451;
            _2453 = _2543;
            if (!_2539)
            {
                _2457 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2545 = _2457;
            _2459 = _2545;
            if (!_2539)
            {
                _2399 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2547 = _2399;
            _2401 = _2547;
            if (!_2539)
            {
                _2439 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2549 = _2439;
            _2441 = _2549;
            if (!_2539)
            {
                _2465 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2551 = _2465;
            bool _2553 = !_2539;
            _2467 = _2551;
            if (!_2553)
            {
                bool _2555 = _1509 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2557 = isnan(_1509);
                bool _2559 = _2555 || _2557;
                bool _2561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2563 = _2559 || _2561;
                if (!_2563)
                {
                    float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2567 = _1509 + _2565;
                    float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2571 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2569;
                    float _2573 = 1.0 / _2571;
                    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2579 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2581 = _2579 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2583 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2585 = _2583 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2587 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2589 = _2587 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2595 = _2567 * _2573;
                    float _2597 = precise::clamp(_2595, 0.0, 1.0);
                    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2603 = fma(_2597, _2577, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2605 = fma(_2597, _2601, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2607 = fma(_2597, _2581, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2609 = fma(_2597, _2585, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2611 = fma(_2597, _2589, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2613 = fma(_2597, _2593, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2453 = _2603;
                    _2441 = _2611;
                    _2447 = _2605;
                    _2401 = _2609;
                    _2459 = _2607;
                    _2467 = _2613;
                    _2529 = true;
                }
                else
                {
                    _2453 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2441 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2447 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2401 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2459 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2467 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2529 = false;
    float _2615 = _2453;
    float _2617 = _2441;
    float _2619 = _2447;
    float _2621 = _2401;
    float _2623 = _2459;
    float _2625 = _2467;
    float _2627 = fma(_2429, -0.5, 0.5);
    float _2629 = precise::clamp(_2627, 0.0, 1.0);
    float _2631 = -_2615;
    float _2633 = _2631 + _2617;
    float _2635 = _2385 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2637 = -_2619;
    float _2639 = _2637 + _2621;
    out.m_90.x = 0.0;
    float _2641 = fma(_2629, _2633, _2615);
    float _2643 = fma(_2629, _2639, _2619);
    out.m_59.x = _2635;
    float _2645 = -_2623;
    float _2647 = _2645 + _2625;
    float _2649 = _2641 * 0.586610972881317138671875;
    bool _2651 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2653 = fma(_2629, _2647, _2623);
    float _2655 = fma(_2643, 0.298911988735198974609375, _2649);
    bool _2657 = _1423 > 0.0;
    bool _2659 = isnan(_1423);
    bool _2661 = _2657 || _2659;
    bool _2663 = isnan(0.0);
    bool _2665 = _2661 || _2663;
    out.m_92.x = 0.0;
    float _2667 = fma(_2653, 0.114477999508380889892578125, _2655);
    float _2669 = -_2667;
    float _2671 = _2643 + _2669;
    float _2673 = -_2667;
    float _2675 = _2641 + _2673;
    float _2677 = -_2667;
    float _2679 = _2653 + _2677;
    float _2681 = fma(_2671, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2667);
    float _2683 = fma(_2675, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2667);
    float _2685 = fma(_2679, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2667);
    bool _2687 = !_2651;
    if (!_2687)
    {
        float _2689 = -_1112;
        float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2693 = -_1114;
        float _2695 = _2693 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2697 = -_1116;
        float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2701 = _2691 * _2691;
        float _2703 = fma(_2695, _2695, _2701);
        float _2705 = fma(_2699, _2699, _2703);
        float _2707 = rsqrt(_2705);
        float _2709 = _2691 * _2707;
        float _2711 = _2695 * _2707;
        float _2713 = _2699 * _2707;
        float _2715 = sqrt(_2705);
        float _2717 = -_1515;
        float _2719 = _2717 + _2709;
        float _2721 = -_1511;
        float _2723 = _2721 + _2711;
        float _2725 = -_1513;
        float _2727 = _2725 + _2713;
        float _2729 = _2719 * _2719;
        float _2731 = fma(_2723, _2723, _2729);
        float _2733 = fma(_2727, _2727, _2731);
        float _2735 = -_2715;
        float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2739 = rsqrt(_2733);
        float _2741 = _2737 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = abs(_2743);
        float _2747 = log2(_2745);
        float _2749 = _2719 * _2739;
        float _2751 = _2723 * _2739;
        float _2753 = _2727 * _2739;
        float _2755 = _2429 * _2749;
        float _2757 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2759 = precise::clamp(_2757, 0.0, 1.0);
        float _2761 = _2429 * _2709;
        float _2763 = fma(_2435, _2751, _2755);
        float _2765 = _2759 * _2759;
        float _2767 = _2747 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2769 = fma(_2435, _2711, _2761);
        float _2771 = fma(_2363, _2753, _2763);
        float _2773 = precise::clamp(_2771, 0.0, 1.0);
        float _2775 = _2765 + (-1.0);
        float _2777 = fma(_2363, _2713, _2769);
        float _2779 = precise::clamp(_2777, 0.0, 1.0);
        float _2781 = _2773 * _2773;
        float _2783 = _2711 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2785 = exp2(_2767);
        float _2787 = fma(_2781, _2775, 1.0);
        float _2789 = -_2709;
        float _2791 = -_2783;
        float _2793 = fma(_2789, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2791);
        float _2795 = _2787 * _2787;
        float _2797 = -_2713;
        float _2799 = fma(_2797, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2793);
        float _2801 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2803 = _2799 + _2801;
        float _2805 = 1.0 / _2795;
        float _2807 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2809 = precise::clamp(_2807, 0.0, 1.0);
        float _2811 = _2785 * _2809;
        float _2813 = _2779 * _2811;
        float _2815 = _2813 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2817 = _2765 * _2805;
        float _2819 = _2813 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2821 = _2813 * _2817;
        float _2823 = _2813 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2825 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2827 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2829 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2815;
        out.m_90.y = _2819;
        out.m_90.z = _2823;
        out.m_92.x = _2825;
        out.m_92.y = _2827;
        out.m_92.z = _2829;
    }
    out.m_94.x = _2681;
    out.m_94.y = _2683;
    out.m_94.z = _2685;
    if (_2665)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _2831 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2831;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2529 = false;
    bool _221 = false;
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
        float _2888 = as_type<float>(_129);
        out.gl_Position.z = _2888;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_61.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    if (_143)
    {
        float _151 = float(_113);
        _149 = _151;
    }
    float _153 = _149;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    if (_159)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _123;
    if (_159)
    {
        out.m_59.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _131 = as_type<int>(_163);
    }
    int _165 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2956 = as_type<float>(_165);
        out.gl_Position.z = _2956;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_63.x;
    float _169 = in.m_63.y;
    float _171 = in.m_63.z;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _175 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _177 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _179 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _187 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _189 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _191 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _185);
    bool _193 = !_173;
    float _195 = _191;
    float _197 = _187;
    float _217;
    float _219;
    if (!_193)
    {
        float _199 = in.m_65.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = float(_113);
        float _205 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _209 = _207 * _201;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = _203;
        _221 = true;
    }
    else
    {
        float _223 = float(_113);
        float _225 = 1.0 / _223;
        float _227 = _147 * _225;
        _217 = _227;
        _219 = _223;
    }
    _221 = false;
    float _229 = _217;
    float _231 = _219;
    float _233 = in.m_56.x;
    float _235 = in.m_56.y;
    float _237 = in.m_56.z;
    float _239 = _235 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _241 = _235 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _243 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[4].x, _239);
    float _245 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[6].x, _241);
    float _247 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[4].z, _243);
    float _249 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[6].z, _245);
    float _251 = _247 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _253 = _249 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _255 = fma(_251, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _257 = fma(_253, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _259 = floor(_255);
    float _261 = floor(_257);
    float _263 = -_259;
    float _265 = _255 + _263;
    float _267 = -_261;
    float _269 = _257 + _267;
    float2 _3139 = float2(_265, _269);
    float _271 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3139, float2(0.0), isnan(_3139)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3139, float2(0.0), isnan(_3139)), level(0.0)).x;
    float _273 = _235 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = _229 + _275;
    float _279 = as_type<float>(int(gl_VertexIndex));
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _289;
    float _293 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[5].x, _273);
    float _295 = 1.0 / _283;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _229 + _297;
    float _301 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[5].z, _293);
    float _303 = _301 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _305 = 1.0 / _287;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = _229 + _307;
    float _311 = _303 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _313 = fma(_251, (*spvDescriptorSet0.vp_c8)._m0[10].x, _311);
    float _315 = 1.0 / _291;
    float _317 = _277 * _295;
    float _319 = fma(_253, (*spvDescriptorSet0.vp_c8)._m0[10].z, _313);
    int _321 = as_type<int>(_279) & 1;
    bool _323 = _321 != 0;
    int _325 = as_type<int>(_279) & 2;
    bool _327 = _325 != 0;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _333 = _299 * _305;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _343 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _345 = isnan(_229);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = fma(_331, _333, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _357 = fma(_337, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = fma(_341, _333, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _361 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _363 = isnan(_229);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _309 * _315;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    bool _379 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_229);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = _319 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _393 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _395 = isnan(_229);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = fma(_377, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = _303 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _409 = -_389;
    float _411 = _409 + 1.0;
    float _413 = -_371;
    float _415 = _413 + 1.0;
    float _417 = -_403;
    float _419 = _417 + 1.0;
    float _421 = fma(_251, (*spvDescriptorSet0.vp_c8)._m0[11].x, _407);
    float _423 = _353 * _411;
    float _425 = _403 * _415;
    float _427 = -_353;
    float _429 = _427 + 1.0;
    float _431 = fma(_253, (*spvDescriptorSet0.vp_c8)._m0[11].z, _421);
    float _433 = in.m_70.x;
    float _435 = in.m_70.y;
    float _437 = _405 * _423;
    float _439 = _357 * _423;
    float _441 = _431 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _443 = _389 * _419;
    float _445 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[143].x, _437);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _447;
    float _451 = 1.0 / _441;
    float _453 = _391 + _441;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[143].y, _439);
    float _461 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _463 = fma(_449, _373, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_457, _373, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = fma(_359, _443, _459);
    float _469 = _303 + _461;
    float _471 = fma(_355, _443, _445);
    float _473 = fma(_465, _425, _467);
    float _475 = _469 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _477 = _469 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _479 = fma(_463, _425, _471);
    float _481 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[146].y, _473);
    float _483 = _453 * _451;
    float _485 = _483 * 0.5;
    float _487 = fma(_251, (*spvDescriptorSet0.vp_c15)._m0[126].x, _475);
    float _489 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[146].x, _479);
    bool _491 = !_327;
    float _493 = _491 ? (-0.5) : 0.5;
    float _495 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _497 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[30].w, _495);
    float _499 = fma(_253, (*spvDescriptorSet0.vp_c15)._m0[126].z, _487);
    float _501 = _481 * _435;
    bool _503 = !_323;
    float _505 = _503 ? (-0.5) : 0.5;
    float _507 = fma(_251, (*spvDescriptorSet0.vp_c15)._m0[127].x, _477);
    float _509 = _489 * _433;
    float _511 = 1.0 / _497;
    float _513 = _499 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _515 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _493);
    float _517 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _519 = fma(_253, (*spvDescriptorSet0.vp_c15)._m0[127].z, _507);
    float _521 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _505);
    float _523 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _525 = _517 * _515;
    float _527 = _519 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _529 = trunc(_513);
    int _531 = int(_529);
    float _533 = _523 * _521;
    float _535 = _525 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _537 = _525 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _539 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _541 = _525 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _543 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[26].x, _535);
    float _545 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _547 = _511 * _545;
    float _549 = trunc(_527);
    int _551 = int(_549);
    float _553 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[24].x, _537);
    float _555 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[26].z, _543);
    bool _557 = _547 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _559 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[24].z, _553);
    bool _561 = _547 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _563 = _555 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _565 = !_557;
    int _567 = _565 ? 0 : 1;
    float _569 = _559 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _571 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _573 = _531 + _571;
    int _575 = _573 + 1;
    float _577 = _253 + _563;
    float _579 = _251 + _569;
    float _581 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _583 = _577 + _581;
    int _585 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _587 = _551 + _585;
    int _589 = _587 + 1;
    float _591 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _593 = _579 + _591;
    int _595 = 2;
    int _597 = _575;
    int _599 = as_type<int>(_541);
    float _601 = _579;
    float _603 = _577;
    float _605 = _513;
    if (!_557)
    {
        _595 = 1;
    }
    int _607 = _595;
    float _609 = _583 * _583;
    int _611 = _607;
    if (!_561)
    {
        _611 = _567;
    }
    int _613 = _611;
    bool _615 = _575 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _617 = _613 << 6;
    int _619 = _575 | _589;
    int _621 = _617 + 48;
    uint _624 = uint(int(uint(_621) >> uint(2)));
    uint _626 = uint(int(uint(int(_624)) >> uint(2)));
    int _628 = int(_624) & 3;
    float _630 = (*spvDescriptorSet0.vp_c15)._m0[int(_626)][_628];
    int _632 = int(_624) + 1;
    uint _634 = uint(int(uint(_632) >> uint(2)));
    int _636 = _632 & 3;
    float _638 = (*spvDescriptorSet0.vp_c15)._m0[int(_634)][_636];
    bool _640 = _619 < 0;
    bool _642 = _640 || _615;
    float _644 = fma(_593, _593, _609);
    bool _646 = _589 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _648 = _646 || _642;
    float _650 = sqrt(_644);
    int _652 = _617 + 56;
    uint _654 = uint(int(uint(_652) >> uint(2)));
    uint _656 = uint(int(uint(int(_654)) >> uint(2)));
    int _658 = int(_654) & 3;
    float _660 = (*spvDescriptorSet0.vp_c15)._m0[int(_656)][_658];
    int _662 = int(_654) + 1;
    uint _664 = uint(int(uint(_662) >> uint(2)));
    int _666 = _662 & 3;
    float _668 = (*spvDescriptorSet0.vp_c15)._m0[int(_664)][_666];
    int _670 = _617 + 64;
    uint _672 = uint(int(uint(_670) >> uint(2)));
    uint _674 = uint(int(uint(int(_672)) >> uint(2)));
    int _676 = int(_672) & 3;
    float _678 = (*spvDescriptorSet0.vp_c15)._m0[int(_674)][_676];
    int _680 = int(_672) + 1;
    uint _682 = uint(int(uint(_680) >> uint(2)));
    int _684 = _680 & 3;
    float _686 = (*spvDescriptorSet0.vp_c15)._m0[int(_682)][_684];
    float _688 = as_type<float>(_613);
    if (!_648)
    {
        int _690 = _589 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _692 = _690 + _575;
        _597 = _692;
    }
    int _694 = _597;
    float _696 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[25].x, _541);
    bool _698 = _650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _700 = _617 + 72;
    uint _702 = uint(int(uint(_700) >> uint(2)));
    uint _704 = uint(int(uint(int(_702)) >> uint(2)));
    int _706 = int(_702) & 3;
    float _708 = (*spvDescriptorSet0.vp_c15)._m0[int(_704)][_706];
    int _710 = int(_702) + 1;
    uint _712 = uint(int(uint(_710) >> uint(2)));
    int _714 = _710 & 3;
    float _716 = (*spvDescriptorSet0.vp_c15)._m0[int(_712)][_714];
    float _718 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[25].z, _696);
    if (!_648)
    {
        int _720 = _694 << 2;
        _599 = _720;
    }
    int _722 = _599;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _734 = _732 != 0;
    float _736 = _718 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _738 = 0;
    int _740 = _722;
    if (!_648)
    {
        uint _742 = uint(int(uint(_694) >> uint(2)));
        _738 = int(_742);
    }
    int _744 = _738;
    int _746 = _617 + 96;
    uint _748 = uint(int(uint(_746) >> uint(2)));
    uint _750 = uint(int(uint(int(_748)) >> uint(2)));
    int _752 = int(_748) & 3;
    float _754 = (*spvDescriptorSet0.vp_c15)._m0[int(_750)][_752];
    int _756 = int(_748) + 1;
    uint _758 = uint(int(uint(_756) >> uint(2)));
    int _760 = _756 & 3;
    float _762 = (*spvDescriptorSet0.vp_c15)._m0[int(_758)][_760];
    float _764 = as_type<float>(_744);
    if (!_648)
    {
        int _766 = 12 & _722;
        _740 = _766;
    }
    int _768 = _740;
    float _770 = _303 + _736;
    bool _772 = !_726;
    int _774 = _772 ? 0 : 1;
    if (!_648)
    {
        int _776 = _744 << 4;
        int _778 = _776 + _768;
        _764 = as_type<float>(_778);
    }
    float _780 = _764;
    bool _782 = !_730;
    int _784 = _782 ? 0 : 1;
    int _786 = _617 + 104;
    uint _788 = uint(int(uint(_786) >> uint(2)));
    uint _790 = uint(int(uint(int(_788)) >> uint(2)));
    int _792 = int(_788) & 3;
    float _794 = (*spvDescriptorSet0.vp_c15)._m0[int(_790)][_792];
    int _796 = int(_788) + 1;
    uint _798 = uint(int(uint(_796) >> uint(2)));
    int _800 = _796 & 3;
    float _802 = (*spvDescriptorSet0.vp_c15)._m0[int(_798)][_800];
    bool _804 = !_734;
    int _806 = _804 ? 0 : 1;
    float _808 = 0.0;
    if (!_698)
    {
        _808 = _770;
    }
    float _810 = _808;
    bool _812 = !_698;
    float _814 = _810;
    float _816 = _762;
    float _818 = _638;
    if (!_812)
    {
        float _820 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _822 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _824 = _650 + _822;
        float _826 = rsqrt(_644);
        float _828 = _824 * _820;
        float _830 = _770 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _832 = _828 * 0.15915493667125701904296875;
        float _834 = _832 * 6.283185482025146484375;
        float _836 = cos(_834);
        float _838 = _832 * 6.283185482025146484375;
        float _840 = sin(_838);
        float _842 = _836 + (-1.0);
        float _844 = _842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _846 = fma(_840, _830, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _848 = fma(_770, _836, _844);
        float _850 = _826 * _846;
        float _852 = fma(_593, _850, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _854 = fma(_583, _850, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _814 = _848;
        _601 = _852;
        _603 = _854;
    }
    float _856 = _814;
    float _858 = _601;
    float _860 = _603;
    float _862 = -_303;
    float _864 = _862 + _856;
    int _866 = _617 + 80;
    uint _868 = uint(int(uint(_866) >> uint(2)));
    uint _870 = uint(int(uint(int(_868)) >> uint(2)));
    int _872 = int(_868) & 3;
    float _874 = (*spvDescriptorSet0.vp_c15)._m0[int(_870)][_872];
    int _876 = int(_868) + 1;
    uint _878 = uint(int(uint(_876) >> uint(2)));
    int _880 = _876 & 3;
    float _882 = (*spvDescriptorSet0.vp_c15)._m0[int(_878)][_880];
    float _884 = -_251;
    float _886 = _884 + _858;
    float _888 = -_253;
    float _890 = _888 + _860;
    float _892 = _864 * _864;
    float _894 = _469 * _762;
    float _896 = _469 * _686;
    float _898 = _858;
    float _900 = _856;
    float _902 = _860;
    if (!_648)
    {
        float _904 = floor(_527);
        _816 = _904;
    }
    float _906 = _816;
    float _908 = fma(_886, _886, _892);
    int _910 = _617 + 88;
    uint _912 = uint(int(uint(_910) >> uint(2)));
    uint _914 = uint(int(uint(int(_912)) >> uint(2)));
    int _916 = int(_912) & 3;
    float _918 = (*spvDescriptorSet0.vp_c15)._m0[int(_914)][_916];
    int _920 = int(_912) + 1;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    int _924 = _920 & 3;
    float _926 = (*spvDescriptorSet0.vp_c15)._m0[int(_922)][_924];
    float _928 = fma(_251, _754, _894);
    float _930 = fma(_251, _678, _896);
    float _932 = fma(_890, _890, _908);
    float _934 = fma(_253, _794, _928);
    float _936 = _469 * _638;
    float _938 = sqrt(_932);
    float _940 = _780;
    if (!_648)
    {
        int _942 = as_type<int>(_780) + 400;
        uint _944 = uint(int(uint(_942) >> uint(2)));
        uint _946 = uint(int(uint(int(_944)) >> uint(2)));
        int _948 = int(_944) & 3;
        float _950 = (*spvDescriptorSet0.vp_c15)._m0[int(_946)][_948];
        _940 = _950;
    }
    float _952 = _940;
    float _954 = _934 + _802;
    float _956 = fma(_251, _630, _936);
    float _958 = fma(_253, _708, _930);
    bool _960 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _962 = isnan(0.5);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _968 = _964 || _966;
    float _970 = fma(_253, _660, _956);
    float _972 = _892;
    float _974 = _970;
    if (!_648)
    {
        float _976 = floor(_513);
        _972 = _976;
    }
    float _978 = _972;
    float _980 = _958 + _716;
    float _982 = _970 + _668;
    bool _984 = _938 > 0.0;
    float _986 = 1.0 / _954;
    bool _988 = !_984;
    if (!_988)
    {
        float _990 = _189 * _189;
        float _992 = rsqrt(_932);
        float _994 = fma(_187, _187, _990);
        float _996 = fma(_191, _191, _994);
        float _998 = sqrt(_996);
        float _1000 = _886 * _992;
        float _1002 = _864 * _992;
        float _1004 = _890 * _992;
        bool _1006 = _998 > 0.0;
        bool _1008 = !_1006;
        _818 = _996;
        _974 = _998;
        if (!_1008)
        {
            float _1010 = rsqrt(_996);
            float _1012 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1014 = _189 * _1010;
            float _1016 = _187 * _1010;
            float _1018 = _1002 * _1014;
            float _1020 = _191 * _1010;
            float _1022 = fma(_1000, _1016, _1018);
            float _1024 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1026 = fma(_1004, _1020, _1022);
            float _1028 = _1026 * _1024;
            float _1030 = fma(_187, _1028, _858);
            float _1032 = fma(_189, _1028, _856);
            float _1034 = fma(_191, _1028, _860);
            _898 = _1030;
            _900 = _1032;
            _902 = _1034;
            _818 = _1010;
            _974 = _1016;
        }
    }
    float _1036 = _898;
    float _1038 = _900;
    float _1040 = _902;
    float _1042 = _818;
    float _1044 = _974;
    float _1046 = _1044;
    float _1048 = _1042;
    if (_968)
    {
        _1046 = _1036;
    }
    float _1050 = _1046;
    float _1052 = _1050;
    if (_968)
    {
        _1048 = _1038;
    }
    float _1054 = _1048;
    float _1056 = _1054;
    if (_968)
    {
        _195 = _1040;
    }
    float _1058 = _195;
    float _1060 = _1058;
    if (!_968)
    {
        float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1064 = _303 + _1062;
        float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1068 = _251 + _1066;
        float _1070 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1072 = _1064 * _1064;
        float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1076 = _253 + _1074;
        float _1078 = fma(_1068, _1068, _1072);
        float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1082 = fma(_1076, _1076, _1078);
        float _1084 = sqrt(_1082);
        float _1086 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1088 = -_253;
        float _1090 = _1088 + _1040;
        float _1092 = precise::min(_1084, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1094 = _1092 * _1080;
        float _1096 = -_303;
        float _1098 = _1096 + _1038;
        float _1100 = _1086 * _1094;
        float _1102 = -_251;
        float _1104 = _1102 + _1036;
        float _1106 = fma(_1098, _1100, _303);
        float _1108 = fma(_1104, _1100, _251);
        float _1110 = fma(_1090, _1100, _253);
        _1056 = _1106;
        _1052 = _1108;
        _1060 = _1110;
    }
    float _1112 = _1056;
    float _1114 = _1052;
    float _1116 = _1060;
    float _1118 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1120 = _982 * _986;
    float _1122 = _980 * _986;
    float _1124 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1126 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1118);
    float _1128 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1130 = _1120 >= 0.0;
    float _1132 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1124);
    float _1134 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1126);
    float _1136 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1128);
    float _1138 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1140 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1132);
    float _1142 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1144 = _1120 <= 1.0;
    bool _1146 = _1144 && _1130;
    float _1148 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1136);
    float _1150 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1138);
    float _1152 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1154 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1156 = _1148 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1158 = _1122 >= 0.0;
    bool _1160 = _1158 && _1146;
    float _1162 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1150);
    float _1164 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1154);
    float _1166 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1170 = _1122 <= 1.0;
    bool _1172 = _1170 && _1160;
    float _1174 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1176 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1164);
    float _1178 = -_1168;
    float _1180 = fma(_1178, _1166, 1.0);
    float _1182 = _469 * _882;
    float _1184 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1186 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1176);
    float _1188 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1190 = fma(_251, _874, _1182);
    float _1192 = log2(_1180);
    float _1194 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1184);
    float _1196 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1188);
    float _1198 = fma(_253, _918, _1190);
    float _1200 = _1120;
    float _1202 = _1186;
    if (_1172)
    {
        float _1204 = float(_613);
        _197 = _1204;
    }
    float _1206 = _197;
    float _1208 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1194);
    float _1210 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1196);
    if (!_648)
    {
        float _1212 = -_906;
        float _1214 = _527 + _1212;
        _688 = _1214;
    }
    float _1216 = _688;
    float _1218 = 1.0 / _1186;
    float _1220 = _1198 + _926;
    float _1222 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1210);
    float _1224 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1208);
    if (!_648)
    {
        float _1226 = -_978;
        float _1228 = _513 + _1226;
        _605 = _1228;
    }
    float _1230 = _605;
    float _1232 = _1038;
    if (!_648)
    {
        float _1234 = rint(_952);
        float _1236 = precise::max(_1234, 0.0);
        uint _1238 = uint(_1236);
        uint _1240 = clamp(_1238, 0u, 65535u);
        _1232 = as_type<float>(_1240);
    }
    float _1242 = _1232;
    float _1244 = _1192 * 0.693147182464599609375;
    float _1246 = _1220 * _986;
    float _1248 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1250 = _1206;
    if (_1172)
    {
        float _1252 = rint(_1206);
        float _1254 = precise::max(_1252, 0.0);
        uint _1256 = uint(_1254);
        uint _1258 = clamp(_1256, 0u, 65535u);
        _1250 = as_type<float>(_1258);
    }
    float _1260 = _1250;
    float _1262 = _1222 * _1218;
    float _1264 = _1224 * _1218;
    float _1266 = fma(_1262, 0.5, 0.5);
    float _1268 = fma(_1264, -0.5, 0.5);
    float _1270 = _1242;
    if (!_648)
    {
        float3 _4804 = float3(_1230, _1216, float(as_type<int>(_1242)));
        float3 _4808 = select(_4804, float3(0.0), isnan(_4804));
        float _1272 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4808.xy, uint(rint(_4808.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4808.xy, uint(rint(_4808.z)), level(0.0)).x;
        _1270 = _1272;
    }
    float _1274 = _1270;
    float _1276 = _1260;
    if (_1172)
    {
        float3 _4823 = float3(_1120, _1122, float(as_type<int>(_1260)));
        float3 _4825 = select(_4823, float3(0.0), isnan(_4823));
        float _1278 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4825.xy, uint(rint(_4825.z)), _1246, level(0.0));
        _1276 = _1278;
    }
    float _1280 = _1276;
    float3 _4835 = float3(_1266, _1268, _1248);
    float _1282 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4835, float3(0.0), isnan(_4835)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4835, float3(0.0), isnan(_4835)), level(0.0)).x;
    float3 _4844 = float3(_1266, _1268, _1248);
    float4 _1285 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4844, float3(0.0), isnan(_4844)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4844, float3(0.0), isnan(_4844)), level(0.0)).xyzw;
    float _1287 = _1285.x;
    float _1289 = _1285.y;
    float _1291 = _1285.z;
    float _1293 = _1285.w;
    float _1295 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1297 = int(_1295);
    bool _1299 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1301 = isnan(0.5);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1307 = _1303 || _1305;
    float _1309 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1311 = int(_1309);
    float _1313 = float(_1297);
    float _1315 = 1.0 / _1313;
    float _1317 = float(uint(_1311));
    float _1319 = 1.0 / _1317;
    float _1321 = _147 * _1315;
    float _1323 = trunc(_1321);
    int _1325 = int(_1323);
    int _1327 = as_type<int>(_1319) + (-2);
    if (_648)
    {
        _1200 = 1.0;
    }
    float _1329 = _1200;
    float _1331 = float(uint(_1325));
    float _1333 = as_type<float>(_1327) * _1331;
    float _1335 = trunc(_1333);
    float _1337 = precise::max(_1335, 0.0);
    uint _1339 = uint(_1337);
    int _1341 = ~_1311;
    int _1343 = _1341 + 1;
    float _1345 = _1333;
    float _1347 = _1329;
    if (_1307)
    {
        _1345 = 1.0;
    }
    float _1349 = _1345;
    int _1351 = _1343 * int(_1339);
    int _1353 = _1351 + _1325;
    float _1355 = float(uint(_1353));
    float _1357 = as_type<float>(_1327) * _1355;
    int _1359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1361 = _1359 != 0;
    float _1363 = trunc(_1357);
    float _1365 = precise::max(_1363, 0.0);
    uint _1367 = uint(_1365);
    int _1369 = int(_1339) + int(_1367);
    float _1371 = _1349;
    float _1373 = _1287;
    if (!_1307)
    {
        float _1375 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1377 = _1375 * 0.15915493667125701904296875;
        float _1379 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1381 = _1377 * 6.283185482025146484375;
        float _1383 = cos(_1381);
        float _1385 = _1379 * 0.15915493667125701904296875;
        float _1387 = _1377 * 6.283185482025146484375;
        float _1389 = sin(_1387);
        float _1391 = 1.0 / _1383;
        float _1393 = _1385 * 6.283185482025146484375;
        float _1395 = cos(_1393);
        float _1397 = _1389 * _1391;
        float _1399 = _1385 * 6.283185482025146484375;
        float _1401 = sin(_1399);
        float _1403 = _1395 * _1397;
        float _1405 = 1.0 / _1403;
        float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1409 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1407;
        float _1411 = 1.0 / _1409;
        float _1413 = _1401 * _1405;
        float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1417 = fma(_547, _1413, _1415);
        float _1419 = _1417 * _1411;
        float _1421 = precise::clamp(_1419, 0.0, 1.0);
        _1371 = _1421;
    }
    float _1423 = _1371;
    if (!_648)
    {
        int _1425 = _694 << 4;
        int _1427 = _1425 + 2048;
        uint _1429 = uint(int(uint(_1427) >> uint(2)));
        uint _1431 = uint(int(uint(int(_1429)) >> uint(2)));
        int _1433 = int(_1429) & 3;
        float _1435 = (*spvDescriptorSet0.vp_c15)._m0[int(_1431)][_1433];
        int _1437 = int(_1429) + 1;
        uint _1439 = uint(int(uint(_1437) >> uint(2)));
        int _1441 = _1437 & 3;
        float _1443 = (*spvDescriptorSet0.vp_c15)._m0[int(_1439)][_1441];
        int _1445 = _1427 + 8;
        uint _1447 = uint(int(uint(_1445) >> uint(2)));
        uint _1449 = uint(int(uint(int(_1447)) >> uint(2)));
        int _1451 = int(_1447) & 3;
        float _1453 = (*spvDescriptorSet0.vp_c15)._m0[int(_1449)][_1451];
        int _1455 = int(_1447) + 1;
        uint _1457 = uint(int(uint(_1455) >> uint(2)));
        int _1459 = _1455 & 3;
        float _1461 = (*spvDescriptorSet0.vp_c15)._m0[int(_1457)][_1459];
        float _1463 = _469 * _1443;
        float _1465 = fma(_251, _1435, _1463);
        float _1467 = fma(_253, _1453, _1465);
        float _1469 = _1467 + _1461;
        float _1471 = precise::clamp(_1469, 0.0, 1.0);
        float _1473 = -_1471;
        float _1475 = _1473 + _1274;
        float _1477 = fma(_1475, 500.0, 1.5);
        float _1479 = exp2(_1477);
        float _1481 = 0.0 + _1479;
        float _1483 = precise::clamp(_1481, 0.0, 1.0);
        _1347 = _1483;
    }
    float _1485 = _1347;
    float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1489 = _1112 + _1487;
    float _1491 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1493 = _1114 + _1491;
    float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1497 = _1116 + _1495;
    float _1499 = _1489 * _1489;
    float _1501 = fma(_1493, _1493, _1499);
    float _1503 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1505 = fma(_1497, _1497, _1501);
    float _1507 = rsqrt(_1505);
    float _1509 = sqrt(_1505);
    float _1511 = _1493 * _1507;
    float _1513 = _1497 * _1507;
    float _1515 = _1489 * _1507;
    float _1517 = precise::max(0.0, _1503);
    float _1519 = _1511 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1521 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1523 = _1519 * _1519;
    float _1525 = _1521 * _1521;
    float _1527 = -_1515;
    float _1529 = -_1517;
    float _1531 = fma(_1527, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1529);
    float _1533 = _1523 + _1525;
    float _1535 = sqrt(_1533);
    bool _1537 = _1535 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1541 = _1535 + _1539;
    float _1543 = as_type<float>(_617);
    float _1545 = _1517;
    float _1547 = _1533;
    float _1549 = _1541;
    float _1551 = _1503;
    float _1553 = _1519;
    float _1555 = _1523;
    float _1557 = _1525;
    if (_1537)
    {
        float _1559 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1543 = _1559;
    }
    float _1561 = _1543;
    if (_1537)
    {
        float _1563 = _1531 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1545 = _1563;
    }
    float _1565 = _1545;
    float _1567 = _1565;
    if (_1537)
    {
        float _1569 = rsqrt(_1533);
        _1547 = _1569;
    }
    float _1571 = _1547;
    float _1573 = _1561;
    if (_1537)
    {
        float _1575 = _1541 * _1561;
        _1549 = _1575;
    }
    float _1577 = _1549;
    if (_1537)
    {
        float _1579 = _1577 * 0.15915493667125701904296875;
        _1573 = _1579;
    }
    float _1581 = _1573;
    float _1583 = _251;
    if (_1537)
    {
        float _1585 = _1581 * 6.283185482025146484375;
        float _1587 = sin(_1585);
        _1583 = _1587;
    }
    float _1589 = _1583;
    float _1591 = _1577;
    if (_1537)
    {
        float _1593 = _1581 * 6.283185482025146484375;
        float _1595 = cos(_1593);
        _1591 = _1595;
    }
    float _1597 = _1591;
    float _1599 = _1589;
    if (_1537)
    {
        float _1601 = fma(_1589, _1565, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1567 = _1601;
    }
    float _1603 = _1567;
    float _1605 = _1603;
    if (!_1537)
    {
        _1599 = _1531;
    }
    float _1607 = _1599;
    float _1609 = 0.0;
    float _1611 = _1607;
    if (_1537)
    {
        float _1613 = _1571 * _1603;
        _1609 = _1613;
    }
    float _1615 = _1609;
    if (_1537)
    {
        float _1617 = _1597 + (-1.0);
        _1551 = _1617;
    }
    float _1619 = _1551;
    float _1621 = _1619;
    if (_1537)
    {
        float _1623 = _1519 * _1615;
        _1553 = _1623;
    }
    float _1625 = _1553;
    if (_1537)
    {
        float _1627 = _1619 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1605 = _1627;
    }
    float _1629 = _1605;
    if (!_1537)
    {
        _1621 = _1521;
    }
    float _1631 = _1621;
    float _1633 = _1631;
    if (_1537)
    {
        float _1635 = _1521 * _1615;
        _1633 = _1635;
    }
    float _1637 = _1633;
    if (_1537)
    {
        float _1639 = _1625 * _1625;
        _1555 = _1639;
    }
    float _1641 = _1555;
    if (_1537)
    {
        float _1643 = fma(_1531, _1597, _1629);
        _1611 = _1643;
    }
    float _1645 = _1611;
    if (_1537)
    {
        float _1647 = _1637 * _1637;
        _1557 = _1647;
    }
    float _1649 = _1557;
    int _1651 = ~_1311;
    int _1653 = _1651 + 1;
    float _1655 = fma(_1645, _1645, _1641);
    float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1659 = fma(_1509, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1657);
    float _1661 = precise::clamp(_1659, 0.0, 1.0);
    float _1663 = _1655 + _1649;
    int _1665 = _1653 * _1369;
    int _1667 = _1665 + _1325;
    float _1669 = -_1661;
    float _1671 = _1669 + 1.0;
    float _1673 = rsqrt(_1663);
    float _1675 = abs(_1671);
    float _1677 = log2(_1675);
    float _1679 = _1673 * _1625;
    float _1681 = _1673 * _1645;
    float _1683 = _1673 * _1637;
    float _1685 = _1679 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1687 = in.m_65.x;
    float _1689 = in.m_65.y;
    float _1691 = -_1685;
    float _1693 = fma(_1681, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1691);
    float _1695 = -_1683;
    float _1697 = fma(_1695, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1693);
    float _1699 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _1701 = !_1361;
    float _1703 = _1701 ? 7.345489978790283203125 : 1.0;
    float _1705 = fma(_1697, -0.5, 0.5);
    float _1707 = fma(_1697, 0.5, 0.5);
    float _1709 = exp2(_1699);
    float _1711 = fma(_1707, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1713 = fma(_1707, _1711, -0.212114393711090087890625);
    float _1715 = sqrt(_1705);
    float _1717 = float(_1325);
    float _1719 = fma(_1707, _1713, 1.570728778839111328125);
    float _1721 = _1703 * _1687;
    float _1723 = 1.0 / _231;
    float _1725 = _1681 + 1.0;
    float _1727 = -_1681;
    float _1729 = fma(_1709, _1725, _1727);
    float _1731 = _1715 * 0.636619746685028076171875;
    float _1733 = fma(_1729, 0.5, 0.5);
    float _1735 = floor(_1721);
    float _1737 = -_1719;
    float _1739 = fma(_1731, _1737, 1.0);
    float _1741 = float(_1311);
    float2 _5509 = float2(_1739, _1733);
    float3 _1745 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5509, float2(0.0), isnan(_5509)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5509, float2(0.0), isnan(_5509)), level(0.0)).xyz;
    float _1747 = _1745.x;
    float _1749 = _1745.y;
    float _1751 = _1745.z;
    bool _1753 = _1717 >= _1741;
    bool _1755 = isnan(_1717);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan(_1741);
    bool _1761 = _1757 || _1759;
    float _1763 = float(_1761);
    float _1765 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1767 = uint(_1667) >= uint(_1311);
    float _1769 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1771 = abs(_774);
    float _1773 = -_271;
    float _1775 = _1773 + 1.0;
    float _1777 = trunc(_1763);
    int _1779 = int(_1777);
    bool _1781 = !_1767;
    int _1783 = _1781 ? 0 : (-1);
    out.m_72.x = _1114;
    out.m_72.y = _1112;
    out.m_72.z = _1116;
    float _1785 = -_1735;
    float _1787 = _1721 + _1785;
    bool _1789 = _1311 == 0;
    int _1791 = ~_1369;
    int _1793 = _1791 + _1783;
    int _1795 = _1793 + 1;
    float _1797 = _1787 * _1741;
    float _1799 = _147 * _1741;
    float _1801 = exp2(_1769);
    int _1803 = _1311 * _1795;
    int _1805 = _1803 + _1325;
    float _1807 = _1799 * _1723;
    int _1809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1811 = _1809 != 0;
    int _1813 = _1311 + (-1);
    int _1815 = ~_1779;
    int _1817 = _1815 + 1;
    int _1819 = _1817 + 1;
    float _1821 = trunc(_1797);
    int _1823 = int(_1821);
    bool _1825 = !_1789;
    int _1827 = _1825 ? _1805 : (-1);
    bool _1829 = !_1811;
    int _1831 = _1829 ? 0 : 1;
    int _1833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1835 = _1833 != 0;
    int _1837 = _1827 * _1819;
    int _1839 = abs(_784);
    float _1841 = trunc(_1807);
    int _1843 = int(_1841);
    int _1845 = abs(_1831);
    int _1847 = _1779 * _1813;
    int _1849 = _1847 + _1837;
    bool _1851 = !_1835;
    int _1853 = _1851 ? 0 : 1;
    int _1855 = abs(_806);
    int _1857 = _1849 * _1839;
    int _1859 = abs(_1853);
    int _1861 = _1823 * _1845;
    int _1863 = _1861 + _1325;
    float _1865 = float(uint(_1863));
    int _1867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1869 = _1867 != 0;
    int _1871 = _1843 * _1771;
    int _1873 = _1871 + _1857;
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1877 = as_type<float>(_1327) * _1865;
    int _1879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1881 = _1879 != 0;
    int _1883 = _1863 * _1855;
    int _1885 = _1883 + _1873;
    int _1887 = ~_1311;
    int _1889 = _1887 + 1;
    float _1891 = trunc(_1877);
    float _1893 = precise::max(_1891, 0.0);
    uint _1895 = uint(_1893);
    int _1897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1899 = _1897 != 0;
    int _1901 = _1823 * _1859;
    int _1903 = _1901 + _1885;
    float _1905 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1907 = _1687 > 0.5;
    float _1909 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1875);
    float _1911 = float(uint(_1903));
    float _1913 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1909);
    float _1915 = as_type<float>(_1327) * _1911;
    float _1917 = -_1913;
    float _1919 = _1917 + 1.0;
    float _1921 = trunc(_1915);
    float _1923 = precise::max(_1921, 0.0);
    uint _1925 = uint(_1923);
    float _1927 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1929 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1931 = -_1927;
    float _1933 = fma(_1905, 2.0, _1931);
    float _1935 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1937 = ~_1311;
    int _1939 = _1937 + 1;
    float _1941 = fma(_1935, -2.0, _1929);
    int _1943 = _1889 * int(_1925);
    int _1945 = _1943 + _1903;
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1949 = float(uint(_1945));
    float _1951 = _1947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1953 = ~_1311;
    int _1955 = _1953 + 1;
    float _1957 = as_type<float>(_1327) * _1949;
    int _1959 = _1955 * int(_1895);
    int _1961 = _1959 + _1863;
    float _1963 = trunc(_1957);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    int _1969 = int(_1925) + int(_1967);
    float _1971 = float(uint(_1961));
    int _1973 = _1939 * _1969;
    int _1975 = _1973 + _1903;
    float _1977 = as_type<float>(_1327) * _1971;
    bool _1979 = uint(_1975) >= uint(_1311);
    float _1981 = trunc(_1977);
    float _1983 = precise::max(_1981, 0.0);
    uint _1985 = uint(_1983);
    bool _1987 = !_1979;
    int _1989 = _1987 ? 0 : (-1);
    bool _1991 = _1689 > 0.5;
    int _1993 = ~_1969;
    int _1995 = _1993 + _1989;
    int _1997 = _1995 + 1;
    float _1999 = -_493;
    int _2001 = _1991 ? as_type<int>(_1999) : as_type<int>(_493);
    int _2003 = _1311 * _1997;
    int _2005 = _2003 + _1903;
    bool _2007 = !_1789;
    int _2009 = _2007 ? _2005 : (-1);
    int _2011 = int(_1895) + int(_1985);
    int _2013 = _2009 >> 31;
    int _2015 = _2013 & 3;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2019 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2021 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2023 = _2009 + _2015;
    float _2025 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2029 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2031 = _2023 >> 2;
    float _2033 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2035 = _2017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2037 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2029);
    int _2039 = _2031 << 4;
    int _2041 = _2039 + 368;
    float _2043 = _2019 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2045 = -_505;
    int _2047 = _1907 ? as_type<int>(_2045) : as_type<int>(_505);
    float _2049 = _2021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _2051 = uint(int(uint(_2041) >> uint(2)));
    uint _2053 = uint(int(uint(int(_2051)) >> uint(2)));
    int _2055 = int(_2051) & 3;
    float _2057 = (*spvDescriptorSet0.vp_c9)._m0[int(_2053)][_2055];
    int _2059 = int(_2051) + 1;
    uint _2061 = uint(int(uint(_2059) >> uint(2)));
    int _2063 = _2059 & 3;
    float _2065 = (*spvDescriptorSet0.vp_c9)._m0[int(_2061)][_2063];
    int _2067 = ~_1311;
    int _2069 = _2067 + 1;
    float _2071 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2073 = !_1881;
    float _2075 = _2073 ? _505 : as_type<float>(_2047);
    float _2077 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2079 = _2009 & 3;
    bool _2081 = _2079 != 0;
    out.m_74.x = _1951;
    out.m_74.y = _2035;
    out.m_74.z = _2043;
    out.m_74.w = _2033;
    int _2083 = _2009 & 3;
    bool _2085 = _2083 != 0;
    out.m_76.x = _2049;
    out.m_76.y = _2071;
    out.m_76.z = _2077;
    bool _2087 = uint(_2083) > 1u;
    int _2089 = _2041 + 8;
    uint _2091 = uint(int(uint(_2089) >> uint(2)));
    uint _2093 = uint(int(uint(int(_2091)) >> uint(2)));
    int _2095 = int(_2091) & 3;
    float _2097 = (*spvDescriptorSet0.vp_c9)._m0[int(_2093)][_2095];
    int _2099 = int(_2091) + 1;
    uint _2101 = uint(int(uint(_2099) >> uint(2)));
    int _2103 = _2099 & 3;
    float _2105 = (*spvDescriptorSet0.vp_c9)._m0[int(_2101)][_2103];
    float _2107 = -_147;
    float _2109 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1933);
    bool _2111 = !_1899;
    float _2113 = _2111 ? _493 : as_type<float>(_2001);
    float _2115 = _2075 + 0.5;
    int _2117 = _2081 ? 0 : 1;
    float _2119 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1941);
    int _2121 = _2069 * _2011;
    int _2123 = _2121 + _1863;
    float _2125 = fma(_2115, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2109);
    float _2127 = _2113 + (-0.5);
    int _2129 = ~_2117;
    int _2131 = _2129 + 1;
    int _2133 = _2131 + 1;
    float _2135 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2037);
    int _2137 = _2133;
    if (!_2087)
    {
        int _2139 = ~_2117;
        int _2141 = _2139 + 1;
        _2137 = _2141;
    }
    int _2143 = _2137;
    float _2145 = -_2127;
    float _2147 = -_2119;
    float _2149 = fma(_2145, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2147);
    bool _2151 = !_2085;
    int _2153 = _2151 ? 0 : 1;
    float _2155 = -_2135;
    float _2157 = _2155 + 1.0;
    int _2159 = abs(_2143);
    float _2161 = _493 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2163 = _2083 != 3;
    float _2165 = fma(_2113, _2157, _2149);
    bool _2167 = uint(_2083) >= 2u;
    bool _2169 = _2083 != 3;
    bool _2171 = uint(_2123) >= uint(_1311);
    int _2173 = abs(_2153);
    bool _2175 = !_2171;
    int _2177 = _2175 ? 0 : (-1);
    int _2179 = ~_2159;
    int _2181 = _2179 + 1;
    int _2183 = _2181 + 1;
    int _2185 = ~_2011;
    int _2187 = _2185 + _2177;
    int _2189 = _2187 + 1;
    int _2191 = ~_2173;
    int _2193 = _2191 + 1;
    int _2195 = _2193 + 1;
    int _2197 = _2183 * as_type<int>(_2065);
    int _2199 = _2167 ? 0 : 1;
    int _2201 = _1311 * _2189;
    int _2203 = _2201 + _1863;
    bool _2205 = !_1869;
    int _2207 = _2205 ? 0 : 1;
    int _2209 = _2195 * as_type<int>(_2057);
    int _2211 = _2209 + _2197;
    int _2213 = ~_2199;
    int _2215 = _2213 + 1;
    int _2217 = _2215 + 1;
    float _2219 = abs(_547);
    float _2221 = log2(_2219);
    int _2223 = _2217;
    if (_2163)
    {
        int _2225 = ~_2199;
        int _2227 = _2225 + 1;
        _2223 = _2227;
    }
    int _2229 = _2223;
    bool _2231 = !_2169;
    int _2233 = _2231 ? 0 : (-1);
    int _2235 = abs(_2229);
    int _2237 = abs(_2233);
    int _2239 = abs(_2207);
    int _2241 = ~_2235;
    int _2243 = _2241 + 1;
    int _2245 = _2243 + 1;
    int _2247 = ~_2237;
    int _2249 = _2247 + 1;
    int _2251 = _2249 + 1;
    int _2253 = _2245 * as_type<int>(_2097);
    int _2255 = _2253 + _2211;
    float _2257 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1765);
    float _2259 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2261 = ~_2239;
    int _2263 = _2261 + 1;
    int _2265 = _2263 + 1;
    int _2267 = _2251 * as_type<int>(_2105);
    int _2269 = _2267 + _2255;
    float _2271 = _505 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2273 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2257);
    float _2275 = exp2(_2259);
    int _2277 = _2269 * _2265;
    float _2279 = -_1919;
    float _2281 = fma(_2075, _2279, _2125);
    bool _2283 = !_1789;
    int _2285 = _2283 ? _2203 : (-1);
    float _2287 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2273);
    float _2289 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_78.x = _2281;
    out.m_78.y = _2165;
    int _2291 = _2285 * _2239;
    int _2293 = _2291 + _2277;
    float _2295 = _2287 + _1186;
    bool _2297 = _547 <= 8000.0;
    bool _2299 = isnan(_547);
    bool _2301 = _2297 || _2299;
    bool _2303 = isnan(8000.0);
    bool _2305 = _2301 || _2303;
    float _2307 = float(_2305);
    float _2309 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2311 = _2295 * 0.5;
    float _2313 = fma(_2275, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2315 = precise::clamp(_2313, 0.0, 1.0);
    float _2317 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.gl_Position.x = _1222;
    out.gl_Position.y = _1224;
    out.gl_Position.z = _2287;
    out.gl_Position.w = _1186;
    float _2319 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2289);
    float _2321 = fma(_2315, -2.0, 3.0);
    float _2323 = _2315 * _2315;
    float _2325 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2309);
    out.m_80.z = _2311;
    out.m_80.w = _1186;
    float _2327 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2317);
    float _2329 = _2323 * _2321;
    float _2331 = float(_2293);
    bool _2333 = _1509 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2335 = isnan(_1509);
    bool _2337 = _2333 || _2335;
    bool _2339 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2341 = _2337 || _2339;
    float _2343 = -_2329;
    float _2345 = _2343 + 1.0;
    out.m_82.x = _2331;
    float _2347 = -_1801;
    float _2349 = _2347 + 1.0;
    float _2351 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2329);
    float _2353 = _1222;
    float _2355 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    float _2357 = _2325;
    float _2359 = _2319;
    if (!_1172)
    {
        _2353 = 1.0;
    }
    float _2361 = _2353;
    float _2363 = _2327 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2365 = _2361;
    if (_1172)
    {
        bool _2367 = _1280 >= _1246;
        bool _2369 = isnan(_1280);
        bool _2371 = _2367 || _2369;
        bool _2373 = isnan(_1246);
        bool _2375 = _2371 || _2373;
        float _2377 = float(_2375);
        _2365 = _2377;
    }
    float _2379 = _2365;
    float _2381 = _2307 * _2351;
    float _2383 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2385 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2387 = _2381 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2389 = _2379 * _1485;
    float _2391 = _2383 * _1282;
    if (!_2341)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2393 = _2355;
    float _2395 = _1775 * _2387;
    float _2397 = precise::clamp(_2395, 0.0, 1.0);
    float _2399 = _2393;
    float _2401 = _2393;
    if (!_2341)
    {
        _1202 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2403 = _1202;
    float _2405 = _1293 * _2391;
    float _2407 = _1751 * _2391;
    float _2409 = -_2397;
    float _2411 = fma(_2409, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2413 = fma(_1747, _2405, _1287);
    float _2415 = fma(_1749, _2405, _1289);
    float _2417 = -_2389;
    float _2419 = fma(_2417, _2411, 1.0);
    float _2421 = precise::clamp(_2419, 0.0, 1.0);
    float _2423 = -_2383;
    float _2425 = _2423 + 1.0;
    float _2427 = fma(_1293, _2407, _1291);
    float _2429 = _2325 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2431 = _2421 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2433 = _1293 * _2425;
    float _2435 = _2319 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2437 = _2431;
    float _2439 = _2403;
    float _2441 = _2403;
    if (!_2341)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2443 = _2357;
    out.m_84.x = _2431;
    float _2445 = _2443;
    float _2447 = _2443;
    if (!_2341)
    {
        _1373 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2449 = _1373;
    float _2451 = _2449;
    float _2453 = _2449;
    if (!_2341)
    {
        _2359 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2455 = _2359;
    out.m_86.x = _2413;
    out.m_86.y = _2415;
    out.m_86.z = _2427;
    out.m_86.w = _2433;
    out.m_88.x = _2435;
    out.m_88.y = _2429;
    out.m_88.z = _2363;
    float _2457 = _2455;
    float _2459 = _2455;
    if (!_2341)
    {
        _2437 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2461 = _2437;
    bool _2463 = !_2341;
    float _2465 = _2461;
    float _2467 = _2461;
    if (!_2463)
    {
        bool _2469 = _1509 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2471 = isnan(_1509);
        bool _2473 = _2469 || _2471;
        bool _2475 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2477 = _2473 || _2475;
        if (!_2477)
        {
            float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2481 = _1509 + _2479;
            float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2485 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2483;
            float _2487 = 1.0 / _2485;
            float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2501 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2503 = _2501 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2505 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2507 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2509 = _2481 * _2487;
            float _2511 = precise::clamp(_2509, 0.0, 1.0);
            float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2515 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2517 = fma(_2511, _2491, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2519 = fma(_2511, _2515, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2521 = fma(_2511, _2495, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2523 = fma(_2511, _2499, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2525 = fma(_2511, _2503, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2527 = fma(_2511, _2507, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2453 = _2517;
            _2441 = _2525;
            _2447 = _2519;
            _2401 = _2523;
            _2459 = _2521;
            _2467 = _2527;
            _2529 = true;
        }
        else
        {
            bool _2531 = _1509 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2533 = isnan(_1509);
            bool _2535 = _2531 || _2533;
            bool _2537 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2539 = _2535 || _2537;
            if (!_2539)
            {
                _2445 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2541 = _2445;
            _2447 = _2541;
            if (!_2539)
            {
                _2451 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2543 = _2451;
            _2453 = _2543;
            if (!_2539)
            {
                _2457 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2545 = _2457;
            _2459 = _2545;
            if (!_2539)
            {
                _2399 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2547 = _2399;
            _2401 = _2547;
            if (!_2539)
            {
                _2439 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2549 = _2439;
            _2441 = _2549;
            if (!_2539)
            {
                _2465 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2551 = _2465;
            bool _2553 = !_2539;
            _2467 = _2551;
            if (!_2553)
            {
                bool _2555 = _1509 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2557 = isnan(_1509);
                bool _2559 = _2555 || _2557;
                bool _2561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2563 = _2559 || _2561;
                if (!_2563)
                {
                    float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2567 = _1509 + _2565;
                    float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2571 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2569;
                    float _2573 = 1.0 / _2571;
                    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2579 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2581 = _2579 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2583 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2585 = _2583 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2587 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2589 = _2587 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2595 = _2567 * _2573;
                    float _2597 = precise::clamp(_2595, 0.0, 1.0);
                    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2603 = fma(_2597, _2577, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2605 = fma(_2597, _2601, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2607 = fma(_2597, _2581, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2609 = fma(_2597, _2585, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2611 = fma(_2597, _2589, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2613 = fma(_2597, _2593, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2453 = _2603;
                    _2441 = _2611;
                    _2447 = _2605;
                    _2401 = _2609;
                    _2459 = _2607;
                    _2467 = _2613;
                    _2529 = true;
                }
                else
                {
                    _2453 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2441 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2447 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2401 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2459 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2467 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2529 = false;
    float _2615 = _2453;
    float _2617 = _2441;
    float _2619 = _2447;
    float _2621 = _2401;
    float _2623 = _2459;
    float _2625 = _2467;
    float _2627 = fma(_2429, -0.5, 0.5);
    float _2629 = precise::clamp(_2627, 0.0, 1.0);
    float _2631 = -_2615;
    float _2633 = _2631 + _2617;
    float _2635 = _2385 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2637 = -_2619;
    float _2639 = _2637 + _2621;
    out.m_90.x = 0.0;
    float _2641 = fma(_2629, _2633, _2615);
    float _2643 = fma(_2629, _2639, _2619);
    out.m_59.x = _2635;
    float _2645 = -_2623;
    float _2647 = _2645 + _2625;
    float _2649 = _2641 * 0.586610972881317138671875;
    bool _2651 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2653 = fma(_2629, _2647, _2623);
    float _2655 = fma(_2643, 0.298911988735198974609375, _2649);
    bool _2657 = _1423 > 0.0;
    bool _2659 = isnan(_1423);
    bool _2661 = _2657 || _2659;
    bool _2663 = isnan(0.0);
    bool _2665 = _2661 || _2663;
    out.m_92.x = 0.0;
    float _2667 = fma(_2653, 0.114477999508380889892578125, _2655);
    float _2669 = -_2667;
    float _2671 = _2643 + _2669;
    float _2673 = -_2667;
    float _2675 = _2641 + _2673;
    float _2677 = -_2667;
    float _2679 = _2653 + _2677;
    float _2681 = fma(_2671, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2667);
    float _2683 = fma(_2675, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2667);
    float _2685 = fma(_2679, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2667);
    bool _2687 = !_2651;
    if (!_2687)
    {
        float _2689 = -_1112;
        float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2693 = -_1114;
        float _2695 = _2693 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2697 = -_1116;
        float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2701 = _2691 * _2691;
        float _2703 = fma(_2695, _2695, _2701);
        float _2705 = fma(_2699, _2699, _2703);
        float _2707 = rsqrt(_2705);
        float _2709 = _2691 * _2707;
        float _2711 = _2695 * _2707;
        float _2713 = _2699 * _2707;
        float _2715 = sqrt(_2705);
        float _2717 = -_1515;
        float _2719 = _2717 + _2709;
        float _2721 = -_1511;
        float _2723 = _2721 + _2711;
        float _2725 = -_1513;
        float _2727 = _2725 + _2713;
        float _2729 = _2719 * _2719;
        float _2731 = fma(_2723, _2723, _2729);
        float _2733 = fma(_2727, _2727, _2731);
        float _2735 = -_2715;
        float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2739 = rsqrt(_2733);
        float _2741 = _2737 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = abs(_2743);
        float _2747 = log2(_2745);
        float _2749 = _2719 * _2739;
        float _2751 = _2723 * _2739;
        float _2753 = _2727 * _2739;
        float _2755 = _2429 * _2749;
        float _2757 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2759 = precise::clamp(_2757, 0.0, 1.0);
        float _2761 = _2429 * _2709;
        float _2763 = fma(_2435, _2751, _2755);
        float _2765 = _2759 * _2759;
        float _2767 = _2747 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2769 = fma(_2435, _2711, _2761);
        float _2771 = fma(_2363, _2753, _2763);
        float _2773 = precise::clamp(_2771, 0.0, 1.0);
        float _2775 = _2765 + (-1.0);
        float _2777 = fma(_2363, _2713, _2769);
        float _2779 = precise::clamp(_2777, 0.0, 1.0);
        float _2781 = _2773 * _2773;
        float _2783 = _2711 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2785 = exp2(_2767);
        float _2787 = fma(_2781, _2775, 1.0);
        float _2789 = -_2709;
        float _2791 = -_2783;
        float _2793 = fma(_2789, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2791);
        float _2795 = _2787 * _2787;
        float _2797 = -_2713;
        float _2799 = fma(_2797, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2793);
        float _2801 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2803 = _2799 + _2801;
        float _2805 = 1.0 / _2795;
        float _2807 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2809 = precise::clamp(_2807, 0.0, 1.0);
        float _2811 = _2785 * _2809;
        float _2813 = _2779 * _2811;
        float _2815 = _2813 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2817 = _2765 * _2805;
        float _2819 = _2813 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2821 = _2813 * _2817;
        float _2823 = _2813 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2825 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2827 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2829 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2815;
        out.m_90.y = _2819;
        out.m_90.z = _2823;
        out.m_92.x = _2825;
        out.m_92.y = _2827;
        out.m_92.z = _2829;
    }
    out.m_94.x = _2681;
    out.m_94.y = _2683;
    out.m_94.z = _2685;
    if (_2665)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _2831 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2831;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

