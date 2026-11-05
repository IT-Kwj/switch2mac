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
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d_array<float> vp_t_tcb_14 [[id(17)]];
    sampler vp_t_tcb_14Smplr [[id(18)]];
    texture2d<float> vp_t_tcb_1C [[id(19)]];
    sampler vp_t_tcb_1CSmplr [[id(20)]];
    sampler vp_t_tcb_20Smplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_14Smplr_w [[id(25)]];
    sampler vp_t_tcb_1CSmplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_73 [[user(locn0)]];
    float4 m_86 [[user(locn1)]];
    float4 m_80 [[user(locn2)]];
    float4 m_94 [[user(locn3)]];
    float4 m_102 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_100 [[user(locn10)]];
    float4 m_92 [[user(locn11)]];
    float4 m_96 [[user(locn12)]];
    float4 m_98 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_78 [[attribute(1)]];
    float4 m_67 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_69 [[attribute(5)]];
    float4 m_71 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2949 = false;
    bool _1655 = false;
    bool _567 = false;
    bool _417 = false;
    bool _223 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_60.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_63.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3248 = as_type<float>(_137);
        out.gl_Position.z = _3248;
    }
    if (!_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_65.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = 0.0;
    float _159 = _155;
    if (_151)
    {
        float _161 = float(_121);
        _157 = _161;
    }
    float _163 = _157;
    bool _165 = _155 >= _163;
    bool _167 = !_151;
    bool _169 = _165 || _167;
    if (_169)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _131;
    if (_169)
    {
        out.m_63.x = 0.0;
    }
    if (_169)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3317 = as_type<float>(_175);
        out.gl_Position.z = _3317;
    }
    if (_169)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _177 = in.m_67.x;
    float _179 = in.m_67.y;
    float _181 = in.m_67.z;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _187 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _191 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _185);
    float _193 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _195 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    float _197 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _199 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _201 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    bool _203 = !_183;
    float _221;
    if (!_203)
    {
        float _205 = in.m_69.x;
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _221 = _219;
        _223 = true;
    }
    else
    {
        float _225 = float(_121);
        float _227 = 1.0 / _225;
        float _229 = _155 * _227;
        _221 = _229;
    }
    _223 = false;
    float _231 = _221;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = _231 + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = _231 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _243 = _231 + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _249 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _253;
    bool _257 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _259 = isnan(_231);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = 1.0 / _247;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _273 = 1.0 / _255;
    float _275 = 1.0 / _251;
    float _277 = _235 * _269;
    bool _279 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _281 = isnan(_231);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -_267;
    float _293 = _291 + 1.0;
    float _295 = _289 * _293;
    float _297 = _239 * _273;
    bool _299 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_231);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_289;
    float _313 = _311 + 1.0;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _319 = _309 * _313;
    float _321 = -_309;
    float _323 = _321 + 1.0;
    float _325 = _243 * _275;
    bool _327 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_231);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = fma(_317, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _353 = fma(_341, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _355 = _337 * _323;
    float _357 = fma(_347, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = fma(_351, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _361 = -_337;
    float _363 = _361 + 1.0;
    float _365 = _353 * _355;
    float _367 = _357 * _355;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _369;
    float _373 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].x, _365);
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _375;
    float _379 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].y, _367);
    float _381 = fma(_371, _297, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _383 = fma(_343, _319, _373);
    float _385 = fma(_377, _297, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _387 = fma(_359, _319, _379);
    float _389 = fma(_381, _295, _383);
    float _391 = fma(_385, _295, _387);
    float _393 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[146].x, _389);
    float _395 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[146].y, _391);
    bool _397 = !_271;
    float _415;
    if (!_397)
    {
        float _399 = in.m_69.x;
        float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _403 = _399 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _405 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _407 = _405 * _401;
        float _409 = floor(_407);
        float _411 = -_409;
        float _413 = _407 + _411;
        _415 = _413;
        _417 = true;
    }
    else
    {
        float _419 = float(_121);
        float _421 = 1.0 / _419;
        float _423 = _155 * _421;
        _415 = _423;
    }
    _417 = false;
    float _425 = _415;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _429 = _425 + _427;
    float _431 = in.m_71.x;
    float _433 = in.m_71.y;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _439 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = isnan(_425);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _455 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _457 = isnan(_425);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    bool _471 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _473 = isnan(_425);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _437;
    float _485 = -_449;
    float _487 = _485 + 1.0;
    bool _489 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _491 = _465 * _487;
    float _493 = -_465;
    float _495 = _493 + 1.0;
    float _497 = 1.0 / _453;
    float _499 = _469 * _483;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _505 = _395 * _433;
    float _507 = _393 * _431;
    float _509 = fma(_499, _429, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _511 = _503 * _497;
    float _513 = _509 * _491;
    float _515 = -_481;
    float _517 = _515 + 1.0;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _521 = _425 + _519;
    float _523 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[115].x, _513);
    float _525 = _449 * _517;
    float _527 = fma(_511, _521, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _531 = fma(_527, _525, _523);
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _535 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[117].x, _531);
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _541 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _537 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _545 = _539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _535;
    out.m_73.y = _545;
    out.m_73.z = _541;
    out.m_73.w = _543;
    bool _547 = !_489;
    float _565;
    if (!_547)
    {
        float _549 = in.m_69.x;
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _553 = _549 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[11].w, _155);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _563;
        _567 = true;
    }
    else
    {
        float _569 = float(_121);
        float _571 = 1.0 / _569;
        float _573 = _155 * _571;
        _565 = _573;
    }
    _567 = false;
    float _575 = _565;
    float _577 = in.m_69.x;
    float _579 = in.m_69.y;
    float _581 = in.m_69.z;
    float _583 = in.m_69.w;
    float _585 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _587 = log2(_585);
    float _589 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _591 = as_type<float>(int(gl_VertexIndex));
    float _593 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _601 = _581 * 2.0;
    float _603 = _577 * 2.0;
    float _605 = _579 + _577;
    float _607 = _579 * 2.0;
    int _609 = as_type<int>(_591) & 1;
    bool _611 = _609 != 0;
    int _613 = as_type<int>(_591) & 2;
    bool _615 = _613 != 0;
    float _617 = _579 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _619 = floor(_601);
    float _621 = _605 + (-1.0);
    bool _623 = !_615;
    float _625 = _623 ? (-0.5) : 0.5;
    float _627 = fma(_617, -2.0, _595);
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _631 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _633 = floor(_603);
    float _635 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[78].w, _599);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _639 = 1.0 + _637;
    float _641 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _627);
    float _643 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _635);
    bool _645 = _619 > 0.0;
    float _647 = floor(_607);
    bool _649 = _619 >= 0.0;
    bool _651 = isnan(_619);
    bool _653 = _649 || _651;
    bool _655 = isnan(0.0);
    bool _657 = _653 || _655;
    float _659 = _577 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _661 = _657 ? 0 : 1;
    float _663 = -_629;
    float _665 = fma(_659, 2.0, _663);
    float _667 = _587 * _155;
    bool _669 = _581 > 0.5;
    float _671 = 1.0 / _639;
    int _673 = ~_661;
    int _675 = _673 + 1;
    int _677 = _675 + 1;
    float _679 = -_155;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[76].x, _665);
    int _683 = _677;
    float _685 = _681;
    if (!_645)
    {
        int _687 = ~_661;
        int _689 = _687 + 1;
        _683 = _689;
    }
    int _691 = _683;
    bool _693 = _579 > 0.5;
    bool _695 = !_611;
    float _697 = _695 ? (-0.5) : 0.5;
    float _699 = exp2(_667);
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _703 = _701 != 0;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _707 = _705 != 0;
    float _709 = -_697;
    int _711 = _693 ? as_type<int>(_709) : as_type<int>(_697);
    float _713 = -_625;
    int _715 = _669 ? as_type<int>(_713) : as_type<int>(_625);
    bool _717 = !_703;
    float _719 = _717 ? _697 : as_type<float>(_711);
    bool _721 = !_707;
    float _723 = _721 ? _625 : as_type<float>(_715);
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _731 = _729 != 0;
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _735 = _733 != 0;
    bool _737 = _633 >= 0.0;
    bool _739 = isnan(_633);
    bool _741 = _737 || _739;
    bool _743 = isnan(0.0);
    bool _745 = _741 || _743;
    float _747 = -_699;
    float _749 = _747 + 1.0;
    float _751 = in.m_78.x;
    float _753 = in.m_78.y;
    float _755 = in.m_78.z;
    bool _757 = !_727;
    int _759 = _757 ? 0 : 1;
    int _761 = _745 ? 0 : 1;
    bool _763 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _765 = isnan(0.0);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _771 = _767 || _769;
    int _773 = abs(_759);
    float _775 = _771 ? _749 : 0.0;
    float _777 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[78].z, _597);
    bool _779 = _647 > 0.0;
    bool _781 = _647 >= 0.0;
    bool _783 = isnan(_647);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    float _791 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _777);
    bool _793 = !_731;
    int _795 = _793 ? 0 : 1;
    bool _797 = _633 > 0.0;
    bool _799 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _801 = isnan(1.0);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _807 = _803 || _805;
    float _809 = float(_691);
    float _811 = float(_773);
    int _813 = ~_761;
    int _815 = _813 + 1;
    int _817 = _815 + 1;
    int _819 = abs(_795);
    float _821 = _811 * _809;
    int _823 = _789 ? 0 : 1;
    float _825 = _577 + (-0.5);
    int _827 = _817;
    if (!_797)
    {
        int _829 = ~_761;
        int _831 = _829 + 1;
        _827 = _831;
    }
    int _833 = _827;
    float _835 = _821 * (-2.0);
    if (_807)
    {
        float _837 = _775 * _671;
        _159 = _837;
    }
    float _839 = _159;
    bool _841 = !_735;
    int _843 = _841 ? 0 : 1;
    float _845 = fma(_835, _751, _751);
    float _847 = float(_833);
    float _849 = fma(_631, _835, _631);
    float _851 = float(_819);
    float _853 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[196].x, _845);
    int _855 = ~_823;
    int _857 = _855 + 1;
    int _859 = _857 + 1;
    int _861 = _859;
    if (!_779)
    {
        int _863 = ~_823;
        int _865 = _863 + 1;
        _861 = _865;
    }
    int _867 = _861;
    float _869 = _851 * _847;
    float _871 = _579 + _581;
    int _873 = abs(_843);
    float _875 = fma(_849, _839, _853);
    float _877 = _871 + (-1.0);
    float _879 = float(_867);
    float _881 = _869 * (-2.0);
    float _883 = float(_873);
    float _885 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _887 = _579 + (-0.5);
    float _889 = fma(_881, _753, _753);
    float _891 = _581 + _577;
    float _893 = _883 * _879;
    float _895 = fma(_885, _881, _885);
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[196].y, _889);
    float _899 = _891 + (-1.0);
    float _901 = _893 * (-2.0);
    float _903 = fma(_895, _839, _897);
    float _905 = _581 + (-0.5);
    float _907 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _909 = fma(_901, _755, _755);
    float _911 = _875 * 0.15915493667125701904296875;
    float _913 = _903 * 0.15915493667125701904296875;
    float _915 = fma(_907, _901, _907);
    float _917 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[196].z, _909);
    float _919 = _911 * 6.283185482025146484375;
    float _921 = cos(_919);
    float _923 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _625);
    float _925 = fma(_915, _839, _917);
    float _927 = _593 * _923;
    float _929 = _925 * 0.15915493667125701904296875;
    float _931 = _913 * 6.283185482025146484375;
    float _933 = sin(_931);
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _697);
    float _937 = _589 * _935;
    float _939 = in.m_60.x;
    float _941 = in.m_60.y;
    float _943 = in.m_60.z;
    float _945 = _913 * 6.283185482025146484375;
    float _947 = cos(_945);
    float _949 = _911 * 6.283185482025146484375;
    float _951 = sin(_949);
    float _953 = _921 * _933;
    float _955 = _929 * 6.283185482025146484375;
    float _957 = cos(_955);
    float _959 = _921 * _947;
    float _961 = _929 * 6.283185482025146484375;
    float _963 = sin(_961);
    float _965 = _951 * _933;
    float _967 = _951 * _947;
    float _969 = _921 * _957;
    float _971 = _951 * _957;
    float _973 = _947 * _957;
    float _975 = _933 * _957;
    float _977 = _969 * _927;
    float _979 = _971 * _927;
    float _981 = fma(_963, _959, _965);
    float _983 = fma(_963, _965, _959);
    float _985 = -_927;
    float _987 = _963 * _985;
    float _989 = -_953;
    float _991 = fma(_963, _967, _989);
    float _993 = -_967;
    float _995 = fma(_963, _953, _993);
    float _997 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _999 = fma(_981, _937, _977);
    float _1001 = fma(_973, _937, _987);
    float _1003 = fma(_991, _937, _979);
    float _1005 = _941 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1007 = fma(_995, _997, _999);
    float _1009 = fma(_975, _997, _1001);
    float _1011 = fma(_983, _997, _1003);
    float _1013 = _941 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1015 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1017 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1019 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1005);
    float _1021 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1013);
    float _1023 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1015);
    float _1025 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1017);
    float _1027 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1019);
    float _1029 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1021);
    float _1031 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1023);
    float _1033 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1025);
    float _1035 = _1027 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1037 = _1029 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1039 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1041 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1043 = _941 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1045 = _1037 + _1039;
    float _1047 = _1035 + _1041;
    float _1049 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1043);
    float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1053 = _1045 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1057 = _1047 + _1055;
    float _1059 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1049);
    float _1061 = _1053 * _1053;
    float _1063 = _1057 * _1057;
    float _1065 = _1061 + _1063;
    float _1067 = sqrt(_1065);
    bool _1069 = _1067 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1071 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1073 = _1067 + _1071;
    float _1075 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1077 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1075);
    float _1079 = _1059 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1081 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1077);
    float _1083 = 0.0;
    float _1085 = _1007;
    float _1087 = _943;
    float _1089 = _1059;
    float _1091 = _1045;
    float _1093 = _995;
    float _1095 = _1061;
    float _1097 = _975;
    if (_1069)
    {
        float _1099 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1083 = _1099;
    }
    float _1101 = _1083;
    float _1103 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    if (!_1069)
    {
        _1085 = _1047;
    }
    float _1105 = _1085;
    float _1107 = _1105;
    if (_1069)
    {
        float _1109 = rsqrt(_1065);
        _1087 = _1109;
    }
    float _1111 = _1087;
    float _1113 = _1101;
    if (_1069)
    {
        float _1115 = _1073 * _1101;
        _1113 = _1115;
    }
    float _1117 = _1113;
    float _1119 = _1079 + _1103;
    float _1121 = _1117;
    float _1123 = _1119;
    if (_1069)
    {
        float _1125 = _1117 * 0.15915493667125701904296875;
        _1121 = _1125;
    }
    float _1127 = _1121;
    if (_1069)
    {
        float _1129 = _1119 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1089 = _1129;
    }
    float _1131 = _1089;
    float _1133 = _939;
    float _1135 = _1131;
    if (_1069)
    {
        float _1137 = _1127 * 6.283185482025146484375;
        float _1139 = sin(_1137);
        _1133 = _1139;
    }
    float _1141 = _1133;
    if (_1069)
    {
        float _1143 = fma(_1141, _1131, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1135 = _1143;
    }
    float _1145 = _1135;
    float _1147 = _1145;
    if (_1069)
    {
        float _1149 = _1111 * _1145;
        _1147 = _1149;
    }
    float _1151 = _1147;
    if (_1069)
    {
        float _1153 = fma(_1053, _1151, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1091 = _1153;
    }
    float _1155 = _1091;
    if (_1069)
    {
        float _1157 = fma(_1057, _1151, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1107 = _1157;
    }
    float _1159 = _1107;
    float _1161 = fma(_1155, 6.2500002968590706586837768554688e-05, 0.5);
    float _1163 = fma(_1159, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4870 = float2(_1161, _1163);
    float3 _1167 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4870, float2(0.0), isnan(_4870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4870, float2(0.0), isnan(_4870)), level(0.0)).xyz;
    float _1169 = _1167.x;
    float _1171 = _1167.y;
    float _1173 = _1167.z;
    float _1175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1177 = -_723;
    float _1179 = _1177 + 0.5;
    bool _1181 = _577 > 0.5;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1189 = _1187 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1193 = _1191 != 0;
    float _1195 = 1.0 / _1185;
    float _1197 = -_697;
    int _1199 = _1181 ? as_type<int>(_1197) : as_type<int>(_697);
    float _1201 = -_791;
    float _1203 = _1201 + 1.0;
    bool _1205 = _583 > 0.5;
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1207;
    float _1211 = -_643;
    float _1213 = _1211 + 1.0;
    bool _1215 = !_1193;
    float _1217 = _1215 ? _697 : as_type<float>(_1199);
    float _1219 = 1.0 / _1189;
    int _1221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1223 = _1221 != 0;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1231 = _1229 != 0;
    float _1233 = _1179 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1237 = _1235 != 0;
    float _1239 = _719 + 0.5;
    bool _1241 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1243 = isnan(_575);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = _1209 * _1195;
    bool _1255 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1257 = isnan(_575);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1269 = _1267 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1271 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1273 = isnan(_575);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1279 = _1275 || _1277;
    float _1281 = float(_1279);
    float _1283 = -_1251;
    float _1285 = _1283 + 1.0;
    float _1287 = 1.0 / _1227;
    float _1289 = -_1265;
    float _1291 = _1289 + 1.0;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1295 = _575 + _1293;
    float _1297 = _1265 * _1285;
    float _1299 = -_1281;
    float _1301 = _1299 + 1.0;
    float _1303 = _1281 * _1291;
    float _1305 = _1269 * _1219;
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1309 = _575 + _1307;
    float _1311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1313 = fma(_1253, _1295, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1315 = fma(_1305, _1309, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1317 = -_625;
    int _1319 = _693 ? as_type<int>(_1317) : as_type<int>(_625);
    float _1321 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1323 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1325 = isnan(_575);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1331 = _1327 || _1329;
    float _1333 = float(_1331);
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1335;
    bool _1339 = !_1223;
    float _1341 = _1339 ? _625 : as_type<float>(_1319);
    float _1343 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1347 = _1337 * _1287;
    float _1349 = _1333 * _1301;
    float _1351 = _1341 + (-0.5);
    float _1353 = -_1333;
    float _1355 = _1353 + 1.0;
    float _1357 = -_625;
    int _1359 = _1205 ? as_type<int>(_1357) : as_type<int>(_625);
    float _1361 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1363 = -_697;
    int _1365 = _669 ? as_type<int>(_1363) : as_type<int>(_697);
    float _1367 = -_1343;
    float _1369 = -_641;
    float _1371 = fma(_1367, _1351, _1369);
    float _1373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1375 = !_1231;
    float _1377 = _1375 ? _625 : as_type<float>(_1359);
    float _1379 = _1217 + 0.5;
    bool _1381 = !_1237;
    float _1383 = _1381 ? _697 : as_type<float>(_1365);
    float _1385 = _1313 * _1349;
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1389 = _575 + _1387;
    float _1391 = -_1377;
    float _1393 = _1391 + 0.5;
    float _1395 = fma(_1361, _1379, _681);
    float _1397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1399 = _1383 + 0.5;
    float _1401 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1403 = -_1203;
    float _1405 = fma(_1217, _1403, _1395);
    float _1407 = fma(_1355, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1385);
    float _1409 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1411 = fma(_1341, _1213, _1371);
    float _1413 = fma(_1347, _1389, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1417 = _1409 * _1345;
    float _1419 = _1401 * _1373;
    float _1421 = fma(_1315, _1303, _1407);
    float _1423 = _697 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_80.x = _1405;
    out.m_80.y = _1411;
    out.m_80.z = _1417;
    out.m_80.w = _1419;
    float _1425 = _1233 * _1397;
    float _1427 = _1127;
    if (_1069)
    {
        float _1429 = _1127 * 6.283185482025146484375;
        float _1431 = cos(_1429);
        _1427 = _1431;
    }
    float _1433 = _1427;
    float _1435 = _969 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1437 = fma(_1413, _1297, _1421);
    float _1439 = -_963;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1435);
    float _1443 = _981 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1445 = _1321 * _1415;
    float _1447 = _969 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1449 = _969 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1451 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1437);
    float _1453 = _981 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1455 = _981 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1457 = _625 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1459 = -_963;
    float _1461 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1447);
    float _1463 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1453);
    float _1465 = _1453;
    float _1467 = _1455;
    if (_1069)
    {
        float _1469 = _1433 + (-1.0);
        _1465 = _1469;
    }
    float _1471 = _1465;
    float _1473 = fma(_1457, _1457, 1.0);
    float _1475 = -_963;
    float _1477 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1449);
    float _1479 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1461);
    float _1481 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1455);
    float _1483 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1441);
    if (_1069)
    {
        float _1485 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1467 = _1485;
    }
    float _1487 = _1467;
    float _1489 = rsqrt(_1473);
    out.m_82.x = _1445;
    out.m_82.y = _1425;
    float _1491 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1477);
    float _1493 = _995 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1495 = _995 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1497 = _1487;
    if (_1069)
    {
        float _1499 = fma(_1119, _1433, _1487);
        _1123 = _1499;
    }
    float _1501 = _1123;
    if (_1069)
    {
        float _1503 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1505 = _1159 + _1503;
        _1497 = _1505;
    }
    float _1507 = _1497;
    float _1509 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1443);
    float _1511 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1495);
    float _1513 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1493);
    float _1515 = _995 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (_1069)
    {
        float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1519 = _1155 + _1517;
        _1093 = _1519;
    }
    float _1521 = _1093;
    float _1523 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1513);
    float _1525 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1515);
    if (_1069)
    {
        float _1527 = _1521 * _1521;
        _1095 = _1527;
    }
    float _1529 = _1095;
    float _1531 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1533 = _1501 + _1531;
    if (!_1069)
    {
        _1097 = _1063;
    }
    float _1535 = _1097;
    float _1537 = _1535;
    if (_1069)
    {
        float _1539 = _1507 * _1507;
        _1537 = _1539;
    }
    float _1541 = _1537;
    float _1543 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1511);
    float _1545 = fma(_1533, _1533, _1529);
    float _1547 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1509);
    float _1549 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1525);
    float _1551 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1463);
    float _1553 = _1457 * _1489;
    float _1555 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1481);
    float _1557 = _1457 * _1483;
    float _1559 = _1457 * _1491;
    float _1561 = _1457 * _1479;
    float _1563 = _1545 + _1541;
    float _1565 = -_1549;
    float _1567 = _1553 * _1565;
    float _1569 = fma(_1423, _1555, _1557);
    float _1571 = fma(_1423, _1547, _1559);
    float _1573 = fma(_1489, _1479, _1567);
    float _1575 = -_1543;
    float _1577 = _1553 * _1575;
    float _1579 = sqrt(_1563);
    float _1581 = fma(_1423, _1551, _1561);
    float _1583 = -_1523;
    float _1585 = _1553 * _1583;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1589 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1593 = fma(_1489, _1491, _1577);
    float _1595 = _1549 + _1581;
    float _1597 = fma(_1489, _1483, _1585);
    float _1599 = _1587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1601 = _1589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1603 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1605 = _1451 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1607 = _1523 + _1569;
    float _1609 = _1543 + _1571;
    out.m_84.x = _1551;
    out.m_84.y = _1555;
    out.m_84.z = _1547;
    bool _1611 = _1579 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1613 = isnan(_1579);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1619 = _1615 || _1617;
    out.m_86.x = _1599;
    out.m_86.y = _1601;
    out.m_86.z = _1603;
    out.m_86.w = _1605;
    out.m_88.x = _1573;
    out.m_88.y = _1597;
    out.m_88.z = _1593;
    out.m_90.x = _1595;
    out.m_90.y = _1607;
    out.m_90.z = _1609;
    if (!_1619)
    {
        _685 = 1.0;
    }
    float _1621 = _685;
    out.m_92.x = _1169;
    out.m_92.y = _1171;
    out.m_92.z = _1173;
    bool _1623 = !_1619;
    float _1625 = _1621;
    if (!_1623)
    {
        bool _1627 = _1579 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1629 = isnan(_1579);
        bool _1631 = _1627 || _1629;
        bool _1633 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1635 = _1631 || _1633;
        if (!_1635)
        {
            float _1637 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1639 = _1579 + _1637;
            float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1643 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1641;
            float _1645 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1647 = _1645 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1649 = 1.0 / _1643;
            float _1651 = _1639 * _1649;
            float _1653 = fma(_1651, _1647, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1625 = _1653;
            _1655 = true;
        }
        else
        {
            bool _1657 = _1579 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1659 = isnan(_1579);
            bool _1661 = _1657 || _1659;
            bool _1663 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1665 = _1661 || _1663;
            if (!_1665)
            {
                float _1667 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1669 = _1579 + _1667;
                float _1671 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1673 = _1671 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1675 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1677 = _1675 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1679 = 1.0 / _1673;
                float _1681 = _1669 * _1679;
                float _1683 = fma(_1681, _1677, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1625 = _1683;
                _1655 = true;
            }
            else
            {
                _1625 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1655 = false;
    float _1685 = _1625;
    float _1687 = fma(_1037, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1689 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1691 = floor(_1687);
    float _1693 = floor(_1689);
    float _1695 = -_1691;
    float _1697 = _1687 + _1695;
    float _1699 = -_1693;
    float _1701 = _1689 + _1699;
    float2 _5825 = float2(_1697, _1701);
    float _1703 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5825, float2(0.0), isnan(_5825)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5825, float2(0.0), isnan(_5825)), level(0.0)).x;
    float _1705 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1707 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1709 = _1501 + _1707;
    float _1711 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1705);
    float _1713 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1715 = _1155 + _1713;
    float _1717 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1711);
    float _1719 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1721 = fma(_1715, _1685, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1723 = _1717 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1725 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1719);
    float _1727 = -_1037;
    float _1729 = _1727 + _1721;
    float _1731 = 1.0 / _1723;
    float _1733 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1725);
    float _1735 = _1733 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1737 = _1735 + _1723;
    float _1739 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1741 = _1079 + _1739;
    float _1743 = _1737 * _1731;
    float _1745 = _1743 * 0.5;
    float _1747 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1749 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1751 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1749);
    float _1753 = fma(_1037, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1747);
    float _1755 = 1.0 / _1751;
    float _1757 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1753);
    float _1759 = _1757 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1761 = trunc(_1759);
    int _1763 = int(_1761);
    float _1765 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1767 = _1755 * _1765;
    float _1769 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1771 = _1767 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1773 = fma(_1037, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1769);
    bool _1775 = _1767 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1777 = !_1771;
    int _1779 = _1777 ? 0 : 1;
    float _1781 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1773);
    int _1783 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1785 = _1763 + _1783;
    int _1787 = _1785 + 1;
    float _1789 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1791 = 2;
    float _1793 = _1721;
    float _1795 = _1759;
    if (!_1771)
    {
        _1791 = 1;
    }
    int _1797 = _1791;
    float _1799 = trunc(_1789);
    int _1801 = int(_1799);
    int _1803 = _1797;
    if (!_1775)
    {
        _1803 = _1779;
    }
    int _1805 = _1803;
    float _1807 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1809 = _1159 + _1807;
    float _1811 = fma(_1709, _1685, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1813 = _1787 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1815 = _1805 << 6;
    float _1817 = fma(_1809, _1685, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1819 = -_1079;
    float _1821 = _1819 + _1811;
    int _1823 = _1815 + 96;
    uint _1826 = uint(int(uint(_1823) >> uint(2)));
    uint _1828 = uint(int(uint(int(_1826)) >> uint(2)));
    int _1830 = int(_1826) & 3;
    float _1832 = (*spvDescriptorSet0.vp_c15)._m0[int(_1828)][_1830];
    int _1834 = int(_1826) + 1;
    uint _1836 = uint(int(uint(_1834) >> uint(2)));
    int _1838 = _1834 & 3;
    float _1840 = (*spvDescriptorSet0.vp_c15)._m0[int(_1836)][_1838];
    float _1842 = -_1035;
    float _1844 = _1842 + _1817;
    float _1846 = _1821 * _1821;
    int _1848 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1850 = _1801 + _1848;
    int _1852 = _1850 + 1;
    float _1854 = fma(_1729, _1729, _1846);
    int _1856 = _1815 + 104;
    uint _1858 = uint(int(uint(_1856) >> uint(2)));
    uint _1860 = uint(int(uint(int(_1858)) >> uint(2)));
    int _1862 = int(_1858) & 3;
    float _1864 = (*spvDescriptorSet0.vp_c15)._m0[int(_1860)][_1862];
    int _1866 = int(_1858) + 1;
    uint _1868 = uint(int(uint(_1866) >> uint(2)));
    int _1870 = _1866 & 3;
    float _1872 = (*spvDescriptorSet0.vp_c15)._m0[int(_1868)][_1870];
    int _1874 = _1787 | _1852;
    float _1876 = fma(_1844, _1844, _1854);
    bool _1878 = _1874 < 0;
    bool _1880 = _1878 || _1813;
    int _1882 = _1815 + 48;
    uint _1884 = uint(int(uint(_1882) >> uint(2)));
    uint _1886 = uint(int(uint(int(_1884)) >> uint(2)));
    int _1888 = int(_1884) & 3;
    float _1890 = (*spvDescriptorSet0.vp_c15)._m0[int(_1886)][_1888];
    int _1892 = int(_1884) + 1;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    int _1896 = _1892 & 3;
    float _1898 = (*spvDescriptorSet0.vp_c15)._m0[int(_1894)][_1896];
    float _1900 = sqrt(_1876);
    bool _1902 = _1852 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1904 = _1902 || _1880;
    int _1906 = _1815 + 64;
    uint _1908 = uint(int(uint(_1906) >> uint(2)));
    uint _1910 = uint(int(uint(int(_1908)) >> uint(2)));
    int _1912 = int(_1908) & 3;
    float _1914 = (*spvDescriptorSet0.vp_c15)._m0[int(_1910)][_1912];
    int _1916 = int(_1908) + 1;
    uint _1918 = uint(int(uint(_1916) >> uint(2)));
    int _1920 = _1916 & 3;
    float _1922 = (*spvDescriptorSet0.vp_c15)._m0[int(_1918)][_1920];
    int _1924 = _1815 + 56;
    uint _1926 = uint(int(uint(_1924) >> uint(2)));
    uint _1928 = uint(int(uint(int(_1926)) >> uint(2)));
    int _1930 = int(_1926) & 3;
    float _1932 = (*spvDescriptorSet0.vp_c15)._m0[int(_1928)][_1930];
    int _1934 = int(_1926) + 1;
    uint _1936 = uint(int(uint(_1934) >> uint(2)));
    int _1938 = _1934 & 3;
    float _1940 = (*spvDescriptorSet0.vp_c15)._m0[int(_1936)][_1938];
    bool _1942 = _1900 > 0.0;
    int _1944 = _1815 + 72;
    uint _1946 = uint(int(uint(_1944) >> uint(2)));
    uint _1948 = uint(int(uint(int(_1946)) >> uint(2)));
    int _1950 = int(_1946) & 3;
    float _1952 = (*spvDescriptorSet0.vp_c15)._m0[int(_1948)][_1950];
    int _1954 = int(_1946) + 1;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    int _1958 = _1954 & 3;
    float _1960 = (*spvDescriptorSet0.vp_c15)._m0[int(_1956)][_1958];
    int _1962 = _1815 + 80;
    uint _1964 = uint(int(uint(_1962) >> uint(2)));
    uint _1966 = uint(int(uint(int(_1964)) >> uint(2)));
    int _1968 = int(_1964) & 3;
    float _1970 = (*spvDescriptorSet0.vp_c15)._m0[int(_1966)][_1968];
    int _1972 = int(_1964) + 1;
    uint _1974 = uint(int(uint(_1972) >> uint(2)));
    int _1976 = _1972 & 3;
    float _1978 = (*spvDescriptorSet0.vp_c15)._m0[int(_1974)][_1976];
    float _1980 = _1741 * _1840;
    float _1982 = _1840;
    float _1984 = _1811;
    float _1986 = _1821;
    float _1988 = _1844;
    float _1990 = _1846;
    int _1992 = as_type<int>(_1817);
    if (!_1904)
    {
        float _1994 = floor(_1759);
        _1982 = _1994;
    }
    float _1996 = _1982;
    float _1998 = fma(_1037, _1832, _1980);
    float _2000 = fma(_1035, _1864, _1998);
    int _2002 = as_type<int>(_1998);
    int _2004 = as_type<int>(_1872);
    if (!_1904)
    {
        int _2006 = _1852 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2008 = _2006 + _1787;
        _2002 = _2008;
    }
    int _2010 = _2002;
    float _2012 = _1741 * _1898;
    float _2014 = _2000 + _1872;
    int _2016 = as_type<int>(_1914);
    if (!_1904)
    {
        int _2018 = _2010 << 2;
        _2004 = _2018;
    }
    int _2020 = _2004;
    float _2022 = fma(_1037, _1890, _2012);
    int _2024 = _2020;
    float _2026 = _2022;
    if (!_1904)
    {
        int _2028 = 12 & _2020;
        _2024 = _2028;
    }
    int _2030 = _2024;
    float _2032 = 1.0 / _2014;
    float _2034 = _1741 * _1922;
    float _2036 = fma(_1037, _1914, _2034);
    if (!_1904)
    {
        uint _2038 = uint(int(uint(_2010) >> uint(2)));
        _2016 = int(_2038);
    }
    int _2040 = _2016;
    float _2042 = fma(_1035, _1932, _2022);
    if (!_1942)
    {
        _2026 = _1817;
    }
    float _2044 = _2026;
    float _2046 = fma(_1035, _1952, _2036);
    bool _2048 = !_1942;
    float _2050 = _2044;
    float _2052 = _2044;
    float _2054 = _1978;
    if (!_2048)
    {
        float _2056 = _199 * _199;
        float _2058 = fma(_197, _197, _2056);
        float _2060 = fma(_201, _201, _2058);
        float _2062 = rsqrt(_1876);
        float _2064 = sqrt(_2060);
        float _2066 = _1729 * _2062;
        float _2068 = _1821 * _2062;
        float _2070 = _1844 * _2062;
        bool _2072 = _2064 > 0.0;
        _1990 = _2068;
        if (!_2072)
        {
            _2050 = _1817;
        }
        float _2074 = _2050;
        bool _2076 = !_2072;
        _2052 = _2074;
        if (!_2076)
        {
            float _2078 = rsqrt(_2060);
            float _2080 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2082 = _199 * _2078;
            float _2084 = _197 * _2078;
            float _2086 = _2068 * _2082;
            float _2088 = _201 * _2078;
            float _2090 = fma(_2066, _2084, _2086);
            float _2092 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2094 = fma(_2070, _2088, _2090);
            float _2096 = _2094 * _2092;
            float _2098 = fma(_197, _2096, _1721);
            float _2100 = fma(_199, _2096, _1811);
            float _2102 = fma(_201, _2096, _1817);
            _1984 = _2100;
            _1793 = _2098;
            _2052 = _2102;
            _1986 = _2080;
            _1988 = _2092;
        }
    }
    float _2104 = _1984;
    float _2106 = _1793;
    float _2108 = _2052;
    float _2110 = _1986;
    float _2112 = _1988;
    float _2114 = _1990;
    float _2116 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2118 = _2112;
    float _2120 = _2114;
    if (!_1904)
    {
        int _2122 = _2040 << 4;
        int _2124 = _2122 + _2030;
        _1992 = _2124;
    }
    int _2126 = _1992;
    float _2128 = _2046 + _1960;
    float _2130 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _2132 = _1815 + 88;
    uint _2134 = uint(int(uint(_2132) >> uint(2)));
    uint _2136 = uint(int(uint(int(_2134)) >> uint(2)));
    int _2138 = int(_2134) & 3;
    float _2140 = (*spvDescriptorSet0.vp_c15)._m0[int(_2136)][_2138];
    int _2142 = int(_2134) + 1;
    uint _2144 = uint(int(uint(_2142) >> uint(2)));
    int _2146 = _2142 & 3;
    float _2148 = (*spvDescriptorSet0.vp_c15)._m0[int(_2144)][_2146];
    float _2150 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2116);
    float _2152 = _2042 + _1940;
    float _2154 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2156 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2130);
    float _2158 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2160 = _2152 * _2032;
    float _2162 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2154);
    float _2164 = _2116;
    if (!_1904)
    {
        int _2166 = _2126 + 400;
        uint _2168 = uint(int(uint(_2166) >> uint(2)));
        uint _2170 = uint(int(uint(int(_2168)) >> uint(2)));
        int _2172 = int(_2168) & 3;
        float _2174 = (*spvDescriptorSet0.vp_c15)._m0[int(_2170)][_2172];
        _2164 = _2174;
    }
    float _2176 = _2164;
    float _2178 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2156);
    float _2180 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2158);
    bool _2182 = _2160 >= 0.0;
    float _2184 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2162);
    float _2186 = _2178 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2188 = _2128 * _2032;
    float _2190 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2150);
    bool _2192 = _2160 <= 1.0;
    bool _2194 = _2192 && _2182;
    float _2196 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2198 = _2186 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2200 = _2190 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2202 = _2188 >= 0.0;
    bool _2204 = _2202 && _2194;
    float _2206 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2180);
    float _2208 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2198);
    float _2210 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2212 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2214 = _2188 <= 1.0;
    bool _2216 = _2214 && _2204;
    float _2218 = _2206 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2220 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2208);
    float _2222 = -_2212;
    float _2224 = fma(_2222, _2210, 1.0);
    float _2226 = _2110;
    float _2228 = _2188;
    float _2230 = _2200;
    if (!_1904)
    {
        float _2232 = floor(_1789);
        _2226 = _2232;
    }
    float _2234 = _2226;
    float _2236 = _2186 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2238 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2220);
    float _2240 = _2186 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2242 = _1741 * _1978;
    float _2244 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2236);
    if (!_1904)
    {
        float _2246 = -_1996;
        float _2248 = _1759 + _2246;
        _2118 = _2248;
    }
    float _2250 = _2118;
    float _2252 = log2(_2224);
    if (_2216)
    {
        float _2254 = float(_1805);
        _2054 = _2254;
    }
    float _2256 = _2054;
    float _2258 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2240);
    float _2260 = fma(_1037, _1970, _2242);
    float _2262 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2244);
    float _2264 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2258);
    float _2266 = 1.0 / _2238;
    float _2268 = _2234;
    if (!_1904)
    {
        float _2270 = -_2234;
        float _2272 = _1789 + _2270;
        _2268 = _2272;
    }
    float _2274 = _2268;
    float _2276 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2262);
    float _2278 = fma(_1035, _2140, _2260);
    float _2280 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2264);
    float _2282 = _2278 + _2148;
    float _2284 = _2244;
    float _2286 = _2280;
    if (_2216)
    {
        float _2288 = rint(_2256);
        float _2290 = precise::max(_2288, 0.0);
        uint _2292 = uint(_2290);
        uint _2294 = clamp(_2292, 0u, 65535u);
        _2284 = as_type<float>(_2294);
    }
    float _2296 = _2284;
    float _2298 = _2252 * 0.693147182464599609375;
    float _2300 = _2282 * _2032;
    float _2302 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2304 = _2260;
    if (!_1904)
    {
        float _2306 = rint(_2176);
        float _2308 = precise::max(_2306, 0.0);
        uint _2310 = uint(_2308);
        uint _2312 = clamp(_2310, 0u, 65535u);
        _2304 = as_type<float>(_2312);
    }
    float _2314 = _2304;
    float _2316 = _2276 * _2266;
    float _2318 = _2280 * _2266;
    float _2320 = fma(_2316, 0.5, 0.5);
    float _2322 = fma(_2318, -0.5, 0.5);
    float _2324 = _2296;
    float _2326 = _2320;
    if (_2216)
    {
        float3 _6869 = float3(_2160, _2188, float(as_type<int>(_2296)));
        float3 _6873 = select(_6869, float3(0.0), isnan(_6869));
        float _2328 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6873.xy, uint(rint(_6873.z)), _2300, level(0.0));
        _2324 = _2328;
    }
    float _2330 = _2324;
    float3 _6883 = float3(_2320, _2322, _2302);
    float _2332 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6883, float3(0.0), isnan(_6883)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6883, float3(0.0), isnan(_6883)), level(0.0)).x;
    float3 _6892 = float3(_2320, _2322, _2302);
    float4 _2335 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6892, float3(0.0), isnan(_6892)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6892, float3(0.0), isnan(_6892)), level(0.0)).xyzw;
    float _2337 = _2335.x;
    float _2339 = _2335.y;
    float _2341 = _2335.z;
    float _2343 = _2335.w;
    float _2345 = _2250;
    if (!_1904)
    {
        float3 _6915 = float3(_2250, _2274, float(as_type<int>(_2314)));
        float3 _6917 = select(_6915, float3(0.0), isnan(_6915));
        float _2347 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6917.xy, uint(rint(_6917.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6917.xy, uint(rint(_6917.z)), level(0.0)).x;
        _2345 = _2347;
    }
    float _2349 = _2345;
    if (_1904)
    {
        _1795 = 1.0;
    }
    float _2351 = _1795;
    float _2353 = _2351;
    float _2355 = _2339;
    float _2357 = _2337;
    if (!_1904)
    {
        int _2359 = _2010 << 4;
        int _2361 = _2359 + 2048;
        uint _2363 = uint(int(uint(_2361) >> uint(2)));
        uint _2365 = uint(int(uint(int(_2363)) >> uint(2)));
        int _2367 = int(_2363) & 3;
        float _2369 = (*spvDescriptorSet0.vp_c15)._m0[int(_2365)][_2367];
        int _2371 = int(_2363) + 1;
        uint _2373 = uint(int(uint(_2371) >> uint(2)));
        int _2375 = _2371 & 3;
        float _2377 = (*spvDescriptorSet0.vp_c15)._m0[int(_2373)][_2375];
        int _2379 = _2361 + 8;
        uint _2381 = uint(int(uint(_2379) >> uint(2)));
        uint _2383 = uint(int(uint(int(_2381)) >> uint(2)));
        int _2385 = int(_2381) & 3;
        float _2387 = (*spvDescriptorSet0.vp_c15)._m0[int(_2383)][_2385];
        int _2389 = int(_2381) + 1;
        uint _2391 = uint(int(uint(_2389) >> uint(2)));
        int _2393 = _2389 & 3;
        float _2395 = (*spvDescriptorSet0.vp_c15)._m0[int(_2391)][_2393];
        float _2397 = _1741 * _2377;
        float _2399 = fma(_1037, _2369, _2397);
        float _2401 = fma(_1035, _2387, _2399);
        float _2403 = _2401 + _2395;
        float _2405 = precise::clamp(_2403, 0.0, 1.0);
        float _2407 = -_2405;
        float _2409 = _2407 + _2349;
        float _2411 = fma(_2409, 500.0, 1.5);
        float _2413 = exp2(_2411);
        float _2415 = 0.0 + _2413;
        float _2417 = precise::clamp(_2415, 0.0, 1.0);
        _2326 = _2369;
        _2353 = _2417;
    }
    float _2419 = _2326;
    float _2421 = _2353;
    float _2423 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2425 = _2104 + _2423;
    float _2427 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2429 = _2106 + _2427;
    float _2431 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2433 = _2108 + _2431;
    float _2435 = _2425 * _2425;
    float _2437 = fma(_2429, _2429, _2435);
    float _2439 = fma(_2433, _2433, _2437);
    float _2441 = rsqrt(_2439);
    float _2443 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2445 = _2429 * _2443;
    float _2447 = _2433 * _2443;
    float _2449 = _2445 * _2445;
    float _2451 = _2447 * _2447;
    float _2453 = _2449 + _2451;
    float _2455 = sqrt(_2453);
    bool _2457 = _2455 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2461 = _2455 + _2459;
    float _2463 = _2433;
    float _2465 = _2461;
    float _2467 = _2435;
    float _2469 = _2425;
    float _2471 = _2419;
    if (_2457)
    {
        float _2473 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2463 = _2473;
    }
    float _2475 = _2463;
    if (_2457)
    {
        float _2477 = rsqrt(_2453);
        _2228 = _2477;
    }
    float _2479 = _2228;
    float _2481 = _2479;
    if (_2457)
    {
        float _2483 = _2461 * _2475;
        _2465 = _2483;
    }
    float _2485 = _2465;
    if (_2457)
    {
        float _2487 = _2485 * 0.15915493667125701904296875;
        _2467 = _2487;
    }
    float _2489 = _2467;
    float _2491 = _2441;
    float _2493 = _2489;
    if (_2457)
    {
        float _2495 = _2489 * 6.283185482025146484375;
        float _2497 = sin(_2495);
        _2491 = _2497;
    }
    float _2499 = _2491;
    float _2501 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2503 = precise::max(0.0, _2501);
    float _2505 = _2475;
    float _2507 = _2503;
    if (_2457)
    {
        float _2509 = _2489 * 6.283185482025146484375;
        float _2511 = cos(_2509);
        _2505 = _2511;
    }
    float _2513 = _2505;
    float _2515 = -_2443;
    float _2517 = -_2503;
    float _2519 = fma(_2425, _2515, _2517);
    if (_2457)
    {
        float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2469 = _2521;
    }
    float _2523 = _2469;
    float _2525 = _2523;
    if (!_2457)
    {
        _2493 = _2451;
    }
    float _2527 = _2493;
    float _2529 = _2499;
    float _2531 = _2527;
    if (_2457)
    {
        float _2533 = fma(_2499, _2523, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2525 = _2533;
    }
    float _2535 = _2525;
    float _2537 = _2535;
    if (!_2457)
    {
        _2529 = _2445;
    }
    float _2539 = _2529;
    float _2541 = _2539;
    if (_2457)
    {
        float _2543 = _2513 + (-1.0);
        _2507 = _2543;
    }
    float _2545 = _2507;
    float _2547 = _2545;
    if (_2457)
    {
        float _2549 = _2479 * _2535;
        _2120 = _2549;
    }
    float _2551 = _2120;
    if (!_2457)
    {
        _2537 = _2519;
    }
    float _2553 = _2537;
    float _2555 = _2553;
    if (_2457)
    {
        float _2557 = _2545 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2471 = _2557;
    }
    float _2559 = _2471;
    if (_2457)
    {
        float _2561 = _2445 * _2551;
        _2541 = _2561;
    }
    float _2563 = _2541;
    if (!_2457)
    {
        _2547 = _2447;
    }
    float _2565 = _2547;
    float _2567 = _2565;
    if (_2457)
    {
        float _2569 = _2447 * _2551;
        _2567 = _2569;
    }
    float _2571 = _2567;
    if (!_2457)
    {
        _2481 = _2449;
    }
    float _2573 = _2481;
    float _2575 = _2573;
    if (_2457)
    {
        float _2577 = fma(_2519, _2513, _2559);
        _2555 = _2577;
    }
    float _2579 = _2555;
    if (_2457)
    {
        float _2581 = _2563 * _2563;
        _2575 = _2581;
    }
    float _2583 = _2575;
    float _2585 = sqrt(_2439);
    if (_2457)
    {
        float _2587 = _2571 * _2571;
        _2531 = _2587;
    }
    float _2589 = _2531;
    float _2591 = fma(_2579, _2579, _2583);
    float _2593 = _2591 + _2589;
    float _2595 = rsqrt(_2593);
    float _2597 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2599 = fma(_2585, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2597);
    float _2601 = precise::clamp(_2599, 0.0, 1.0);
    float _2603 = -_2601;
    float _2605 = _2603 + 1.0;
    float _2607 = abs(_2605);
    float _2609 = log2(_2607);
    float _2611 = _2595 * _2563;
    float _2613 = _2595 * _2579;
    float _2615 = _2595 * _2571;
    float _2617 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2619 = -_2617;
    float _2621 = fma(_2613, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2619);
    float _2623 = -_2615;
    float _2625 = fma(_2623, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2621);
    float _2627 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2629 = fma(_2625, -0.5, 0.5);
    float _2631 = fma(_2625, 0.5, 0.5);
    float _2633 = exp2(_2627);
    float _2635 = fma(_2631, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2637 = fma(_2631, _2635, -0.212114393711090087890625);
    float _2639 = _2613 + 1.0;
    float _2641 = sqrt(_2629);
    float _2643 = fma(_2631, _2637, 1.570728778839111328125);
    float _2645 = -_2613;
    float _2647 = fma(_2633, _2639, _2645);
    float _2649 = fma(_2647, 0.5, 0.5);
    float _2651 = _2641 * 0.636619746685028076171875;
    float _2653 = -_2643;
    float _2655 = fma(_2651, _2653, 1.0);
    float2 _7393 = float2(_2655, _2649);
    float3 _2657 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7393, float2(0.0), isnan(_7393)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7393, float2(0.0), isnan(_7393)), level(0.0)).xyz;
    float _2659 = _2657.x;
    float _2661 = _2657.y;
    float _2663 = _2657.z;
    float _2665 = abs(_1767);
    float _2667 = log2(_2665);
    float _2669 = -_1703;
    float _2671 = _2669 + 1.0;
    bool _2673 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2675 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2677 = _2673 || _2675;
    bool _2679 = isnan(0.5);
    bool _2681 = _2677 || _2679;
    float _2683 = _2667 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2685 = _2186 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2687 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2685);
    float _2689 = exp2(_2683);
    float _2691 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_2681)
    {
        _2691 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2693 = _2691;
    float _2695 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2687);
    float _2697 = _2693;
    if (_2681)
    {
        _2230 = 1.0;
    }
    float _2699 = _2230;
    float _2701 = _2699;
    if (!_2681)
    {
        float _2703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2705 = _2693 + _2703;
        _2697 = _2705;
    }
    float _2707 = _2697;
    float _2709 = _2519;
    if (!_2681)
    {
        float _2711 = 1.0 / _2707;
        _2709 = _2711;
    }
    float _2713 = _2709;
    float _2715 = fma(_2689, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2717 = precise::clamp(_2715, 0.0, 1.0);
    float _2719 = fma(_2717, -2.0, 3.0);
    float _2721 = _2717 * _2717;
    float _2723 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2725 = _2721 * _2719;
    float _2727 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2695);
    float _2729 = exp2(_2723);
    float _2731 = -_2725;
    float _2733 = _2731 + 1.0;
    float _2735 = _2727 + _2238;
    out.gl_Position.x = _2276;
    out.gl_Position.y = _2280;
    out.gl_Position.z = _2727;
    out.gl_Position.w = _2238;
    float _2737 = fma(_2733, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2725);
    float _2739 = _2733;
    float _2741 = _2735;
    float _2743 = _2276;
    if (!_2681)
    {
        float _2745 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2747 = _1767 + _2745;
        _2739 = _2747;
    }
    float _2749 = _2739;
    bool _2751 = _1767 <= 8000.0;
    bool _2753 = isnan(_1767);
    bool _2755 = _2751 || _2753;
    bool _2757 = isnan(8000.0);
    bool _2759 = _2755 || _2757;
    float _2761 = float(_2759);
    float _2763 = _2735 * 0.5;
    if (!_2216)
    {
        _2741 = 1.0;
    }
    float _2765 = _2741;
    float _2767 = _2765;
    if (!_2681)
    {
        float _2769 = _2749 * _2713;
        float _2771 = precise::clamp(_2769, 0.0, 1.0);
        _2701 = _2771;
    }
    float _2773 = _2701;
    if (_2216)
    {
        bool _2775 = _2330 >= _2300;
        bool _2777 = isnan(_2330);
        bool _2779 = _2775 || _2777;
        bool _2781 = isnan(_2300);
        bool _2783 = _2779 || _2781;
        float _2785 = float(_2783);
        _2767 = _2785;
    }
    float _2787 = _2767;
    float _2789 = _2761 * _2737;
    bool _2791 = _2585 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2793 = isnan(_2585);
    bool _2795 = _2791 || _2793;
    bool _2797 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2799 = _2795 || _2797;
    float _2801 = _2789 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2803 = -_2729;
    float _2805 = _2803 + 1.0;
    float _2807 = _2787 * _2421;
    out.m_94.z = _2763;
    out.m_94.w = _2238;
    float _2809 = _2671 * _2801;
    float _2811 = precise::clamp(_2809, 0.0, 1.0);
    float _2813 = _2805 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2815 = _2773 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2817 = -_2811;
    float _2819 = fma(_2817, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2821 = _2813 * _2332;
    float _2823 = -_2813;
    float _2825 = _2823 + 1.0;
    float _2827 = -_2807;
    float _2829 = fma(_2827, _2819, 1.0);
    float _2831 = precise::clamp(_2829, 0.0, 1.0);
    float _2833 = _2343 * _2821;
    float _2835 = _2343 * _2825;
    float _2837 = _2831;
    float _2839 = _2833;
    if (!_2799)
    {
        _2286 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2841 = _2286;
    float _2843 = _2831 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2845 = _2841;
    float _2847 = _2841;
    if (!_2799)
    {
        _2743 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2849 = _2743;
    float _2851 = _2849;
    float _2853 = _2849;
    if (!_2799)
    {
        _2837 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2855 = _2837;
    out.m_96.x = _2843;
    float _2857 = _2663 * _2821;
    float _2859 = fma(_2659, _2833, _2337);
    float _2861 = fma(_2661, _2833, _2339);
    float _2863 = _2855;
    float _2865 = _2855;
    if (!_2799)
    {
        _2839 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2867 = _2839;
    float _2869 = fma(_2343, _2857, _2341);
    float _2871 = _2867;
    float _2873 = _2867;
    if (!_2799)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2875 = _2355;
    float _2877 = _2875;
    float _2879 = _2875;
    if (!_2799)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2881 = _2357;
    out.m_98.x = _2859;
    out.m_98.y = _2861;
    out.m_98.z = _2869;
    out.m_98.w = _2835;
    bool _2883 = !_2799;
    float _2885 = _2881;
    float _2887 = _2881;
    if (!_2883)
    {
        bool _2889 = _2585 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2891 = isnan(_2585);
        bool _2893 = _2889 || _2891;
        bool _2895 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2897 = _2893 || _2895;
        if (!_2897)
        {
            float _2899 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2901 = _2585 + _2899;
            float _2903 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2905 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2903;
            float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2911 = 1.0 / _2905;
            float _2913 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2915 = _2913 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2919 = _2917 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2923 = _2921 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2929 = _2901 * _2911;
            float _2931 = precise::clamp(_2929, 0.0, 1.0);
            float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2935 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2937 = fma(_2931, _2909, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2939 = fma(_2931, _2935, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2941 = fma(_2931, _2915, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2943 = fma(_2931, _2919, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2945 = fma(_2931, _2923, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2947 = fma(_2931, _2927, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2853 = _2941;
            _2879 = _2945;
            _2847 = _2937;
            _2865 = _2943;
            _2873 = _2939;
            _2887 = _2947;
            _2949 = true;
        }
        else
        {
            bool _2951 = _2585 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2953 = isnan(_2585);
            bool _2955 = _2951 || _2953;
            bool _2957 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2959 = _2955 || _2957;
            if (!_2959)
            {
                _2845 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2961 = _2845;
            _2847 = _2961;
            if (!_2959)
            {
                _2851 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2963 = _2851;
            _2853 = _2963;
            if (!_2959)
            {
                _2871 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2965 = _2871;
            _2873 = _2965;
            if (!_2959)
            {
                _2863 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2967 = _2863;
            _2865 = _2967;
            if (!_2959)
            {
                _2877 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2969 = _2877;
            _2879 = _2969;
            if (!_2959)
            {
                _2885 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2971 = _2885;
            bool _2973 = !_2959;
            _2887 = _2971;
            if (!_2973)
            {
                bool _2975 = _2585 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2977 = isnan(_2585);
                bool _2979 = _2975 || _2977;
                bool _2981 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2983 = _2979 || _2981;
                if (!_2983)
                {
                    float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2987 = _2585 + _2985;
                    float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2991 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2989;
                    float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2997 = 1.0 / _2991;
                    float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3013 = _3011 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3015 = _2987 * _2997;
                    float _3017 = precise::clamp(_3015, 0.0, 1.0);
                    float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3023 = fma(_3017, _2995, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3025 = fma(_3017, _3021, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3027 = fma(_3017, _3001, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3029 = fma(_3017, _3005, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3031 = fma(_3017, _3009, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3033 = fma(_3017, _3013, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2853 = _3027;
                    _2879 = _3031;
                    _2847 = _3023;
                    _2865 = _3029;
                    _2873 = _3025;
                    _2887 = _3033;
                    _2949 = true;
                }
                else
                {
                    _2853 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2879 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2847 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2865 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2873 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2887 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2949 = false;
    float _3035 = _2853;
    float _3037 = _2879;
    float _3039 = _2847;
    float _3041 = _2865;
    float _3043 = _2873;
    float _3045 = _2887;
    float _3047 = _2815 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3049 = fma(_1607, -0.5, 0.5);
    float _3051 = precise::clamp(_3049, 0.0, 1.0);
    float _3053 = -_3035;
    float _3055 = _3053 + _3037;
    float _3057 = -_3039;
    float _3059 = _3057 + _3041;
    out.m_100.x = 0.0;
    float _3061 = fma(_3051, _3055, _3035);
    float _3063 = -_3043;
    float _3065 = _3063 + _3045;
    float _3067 = fma(_3051, _3059, _3039);
    float _3069 = _3061 * 0.586610972881317138671875;
    bool _3071 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3073 = fma(_3051, _3065, _3043);
    out.m_63.x = _3047;
    float _3075 = fma(_3067, 0.298911988735198974609375, _3069);
    bool _3077 = _2773 > 0.0;
    bool _3079 = isnan(_2773);
    bool _3081 = _3077 || _3079;
    bool _3083 = isnan(0.0);
    bool _3085 = _3081 || _3083;
    float _3087 = fma(_3073, 0.114477999508380889892578125, _3075);
    float _3089 = -_3087;
    float _3091 = _3067 + _3089;
    float _3093 = -_3087;
    float _3095 = _3061 + _3093;
    float _3097 = -_3087;
    float _3099 = _3073 + _3097;
    float _3101 = fma(_3091, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3087);
    float _3103 = fma(_3095, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3087);
    float _3105 = fma(_3099, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3087);
    bool _3107 = !_3071;
    if (!_3107)
    {
        float _3109 = -_2104;
        float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3113 = -_2106;
        float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3117 = -_2108;
        float _3119 = _3117 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3121 = _3111 * _3111;
        float _3123 = fma(_3115, _3115, _3121);
        float _3125 = fma(_3119, _3119, _3123);
        float _3127 = sqrt(_3125);
        float _3129 = rsqrt(_3125);
        float _3131 = -_3127;
        float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3135 = _3133 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3137 = precise::clamp(_3135, 0.0, 1.0);
        float _3139 = _3115 * _3129;
        float _3141 = _3111 * _3129;
        float _3143 = abs(_3137);
        float _3145 = log2(_3143);
        float _3147 = _3119 * _3129;
        float _3149 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3151 = _1607 * _3141;
        float _3153 = -_3141;
        float _3155 = -_3149;
        float _3157 = fma(_3153, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3155);
        float _3159 = fma(_1595, _3139, _3151);
        float _3161 = -_3147;
        float _3163 = fma(_3161, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3157);
        float _3165 = fma(_1609, _3147, _3159);
        float _3167 = precise::clamp(_3165, 0.0, 1.0);
        float _3169 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3171 = _3163 + _3169;
        float _3173 = _3145 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3175 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3177 = precise::clamp(_3175, 0.0, 1.0);
        float _3179 = exp2(_3173);
        float _3181 = _3179 * _3177;
        float _3183 = _3167 * _3181;
        float _3185 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3187 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3189 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _3185;
        out.m_100.y = _3187;
        out.m_100.z = _3189;
    }
    out.m_102.x = _3101;
    out.m_102.y = _3103;
    out.m_102.z = _3105;
    if (_3085)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_63.x = 0.0;
    float _3191 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3191;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2949 = false;
    bool _1655 = false;
    bool _567 = false;
    bool _417 = false;
    bool _223 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_60.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_63.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3248 = as_type<float>(_137);
        out.gl_Position.z = _3248;
    }
    if (!_125)
    {
        return out;
    }
    float _141 = in.m_65.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = 0.0;
    float _159 = _155;
    if (_151)
    {
        float _161 = float(_121);
        _157 = _161;
    }
    float _163 = _157;
    bool _165 = _155 >= _163;
    bool _167 = !_151;
    bool _169 = _165 || _167;
    if (_169)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _131;
    if (_169)
    {
        out.m_63.x = 0.0;
    }
    if (_169)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3317 = as_type<float>(_175);
        out.gl_Position.z = _3317;
    }
    if (_169)
    {
        return out;
    }
    float _177 = in.m_67.x;
    float _179 = in.m_67.y;
    float _181 = in.m_67.z;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _187 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _191 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _185);
    float _193 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _195 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    float _197 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _199 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _201 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    bool _203 = !_183;
    float _221;
    if (!_203)
    {
        float _205 = in.m_69.x;
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _221 = _219;
        _223 = true;
    }
    else
    {
        float _225 = float(_121);
        float _227 = 1.0 / _225;
        float _229 = _155 * _227;
        _221 = _229;
    }
    _223 = false;
    float _231 = _221;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = _231 + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = _231 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _243 = _231 + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _249 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _253;
    bool _257 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _259 = isnan(_231);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = 1.0 / _247;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _273 = 1.0 / _255;
    float _275 = 1.0 / _251;
    float _277 = _235 * _269;
    bool _279 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _281 = isnan(_231);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -_267;
    float _293 = _291 + 1.0;
    float _295 = _289 * _293;
    float _297 = _239 * _273;
    bool _299 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_231);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_289;
    float _313 = _311 + 1.0;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _319 = _309 * _313;
    float _321 = -_309;
    float _323 = _321 + 1.0;
    float _325 = _243 * _275;
    bool _327 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_231);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = fma(_317, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _353 = fma(_341, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _355 = _337 * _323;
    float _357 = fma(_347, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = fma(_351, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _361 = -_337;
    float _363 = _361 + 1.0;
    float _365 = _353 * _355;
    float _367 = _357 * _355;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _369;
    float _373 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].x, _365);
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _375;
    float _379 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].y, _367);
    float _381 = fma(_371, _297, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _383 = fma(_343, _319, _373);
    float _385 = fma(_377, _297, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _387 = fma(_359, _319, _379);
    float _389 = fma(_381, _295, _383);
    float _391 = fma(_385, _295, _387);
    float _393 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[146].x, _389);
    float _395 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[146].y, _391);
    bool _397 = !_271;
    float _415;
    if (!_397)
    {
        float _399 = in.m_69.x;
        float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _403 = _399 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _405 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _407 = _405 * _401;
        float _409 = floor(_407);
        float _411 = -_409;
        float _413 = _407 + _411;
        _415 = _413;
        _417 = true;
    }
    else
    {
        float _419 = float(_121);
        float _421 = 1.0 / _419;
        float _423 = _155 * _421;
        _415 = _423;
    }
    _417 = false;
    float _425 = _415;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _429 = _425 + _427;
    float _431 = in.m_71.x;
    float _433 = in.m_71.y;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _439 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = isnan(_425);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _455 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _457 = isnan(_425);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    bool _471 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _473 = isnan(_425);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _437;
    float _485 = -_449;
    float _487 = _485 + 1.0;
    bool _489 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _491 = _465 * _487;
    float _493 = -_465;
    float _495 = _493 + 1.0;
    float _497 = 1.0 / _453;
    float _499 = _469 * _483;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _505 = _395 * _433;
    float _507 = _393 * _431;
    float _509 = fma(_499, _429, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _511 = _503 * _497;
    float _513 = _509 * _491;
    float _515 = -_481;
    float _517 = _515 + 1.0;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _521 = _425 + _519;
    float _523 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[115].x, _513);
    float _525 = _449 * _517;
    float _527 = fma(_511, _521, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _531 = fma(_527, _525, _523);
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _535 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[117].x, _531);
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _541 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _537 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _545 = _539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _535;
    out.m_73.y = _545;
    out.m_73.z = _541;
    out.m_73.w = _543;
    bool _547 = !_489;
    float _565;
    if (!_547)
    {
        float _549 = in.m_69.x;
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _553 = _549 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[11].w, _155);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _563;
        _567 = true;
    }
    else
    {
        float _569 = float(_121);
        float _571 = 1.0 / _569;
        float _573 = _155 * _571;
        _565 = _573;
    }
    _567 = false;
    float _575 = _565;
    float _577 = in.m_69.x;
    float _579 = in.m_69.y;
    float _581 = in.m_69.z;
    float _583 = in.m_69.w;
    float _585 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _587 = log2(_585);
    float _589 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _591 = as_type<float>(int(gl_VertexIndex));
    float _593 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _601 = _581 * 2.0;
    float _603 = _577 * 2.0;
    float _605 = _579 + _577;
    float _607 = _579 * 2.0;
    int _609 = as_type<int>(_591) & 1;
    bool _611 = _609 != 0;
    int _613 = as_type<int>(_591) & 2;
    bool _615 = _613 != 0;
    float _617 = _579 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _619 = floor(_601);
    float _621 = _605 + (-1.0);
    bool _623 = !_615;
    float _625 = _623 ? (-0.5) : 0.5;
    float _627 = fma(_617, -2.0, _595);
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _631 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _633 = floor(_603);
    float _635 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[78].w, _599);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _639 = 1.0 + _637;
    float _641 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _627);
    float _643 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _635);
    bool _645 = _619 > 0.0;
    float _647 = floor(_607);
    bool _649 = _619 >= 0.0;
    bool _651 = isnan(_619);
    bool _653 = _649 || _651;
    bool _655 = isnan(0.0);
    bool _657 = _653 || _655;
    float _659 = _577 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _661 = _657 ? 0 : 1;
    float _663 = -_629;
    float _665 = fma(_659, 2.0, _663);
    float _667 = _587 * _155;
    bool _669 = _581 > 0.5;
    float _671 = 1.0 / _639;
    int _673 = ~_661;
    int _675 = _673 + 1;
    int _677 = _675 + 1;
    float _679 = -_155;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[76].x, _665);
    int _683 = _677;
    float _685 = _681;
    if (!_645)
    {
        int _687 = ~_661;
        int _689 = _687 + 1;
        _683 = _689;
    }
    int _691 = _683;
    bool _693 = _579 > 0.5;
    bool _695 = !_611;
    float _697 = _695 ? (-0.5) : 0.5;
    float _699 = exp2(_667);
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _703 = _701 != 0;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _707 = _705 != 0;
    float _709 = -_697;
    int _711 = _693 ? as_type<int>(_709) : as_type<int>(_697);
    float _713 = -_625;
    int _715 = _669 ? as_type<int>(_713) : as_type<int>(_625);
    bool _717 = !_703;
    float _719 = _717 ? _697 : as_type<float>(_711);
    bool _721 = !_707;
    float _723 = _721 ? _625 : as_type<float>(_715);
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _731 = _729 != 0;
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _735 = _733 != 0;
    bool _737 = _633 >= 0.0;
    bool _739 = isnan(_633);
    bool _741 = _737 || _739;
    bool _743 = isnan(0.0);
    bool _745 = _741 || _743;
    float _747 = -_699;
    float _749 = _747 + 1.0;
    float _751 = in.m_78.x;
    float _753 = in.m_78.y;
    float _755 = in.m_78.z;
    bool _757 = !_727;
    int _759 = _757 ? 0 : 1;
    int _761 = _745 ? 0 : 1;
    bool _763 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _765 = isnan(0.0);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _771 = _767 || _769;
    int _773 = abs(_759);
    float _775 = _771 ? _749 : 0.0;
    float _777 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[78].z, _597);
    bool _779 = _647 > 0.0;
    bool _781 = _647 >= 0.0;
    bool _783 = isnan(_647);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    float _791 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _777);
    bool _793 = !_731;
    int _795 = _793 ? 0 : 1;
    bool _797 = _633 > 0.0;
    bool _799 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _801 = isnan(1.0);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _807 = _803 || _805;
    float _809 = float(_691);
    float _811 = float(_773);
    int _813 = ~_761;
    int _815 = _813 + 1;
    int _817 = _815 + 1;
    int _819 = abs(_795);
    float _821 = _811 * _809;
    int _823 = _789 ? 0 : 1;
    float _825 = _577 + (-0.5);
    int _827 = _817;
    if (!_797)
    {
        int _829 = ~_761;
        int _831 = _829 + 1;
        _827 = _831;
    }
    int _833 = _827;
    float _835 = _821 * (-2.0);
    if (_807)
    {
        float _837 = _775 * _671;
        _159 = _837;
    }
    float _839 = _159;
    bool _841 = !_735;
    int _843 = _841 ? 0 : 1;
    float _845 = fma(_835, _751, _751);
    float _847 = float(_833);
    float _849 = fma(_631, _835, _631);
    float _851 = float(_819);
    float _853 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[196].x, _845);
    int _855 = ~_823;
    int _857 = _855 + 1;
    int _859 = _857 + 1;
    int _861 = _859;
    if (!_779)
    {
        int _863 = ~_823;
        int _865 = _863 + 1;
        _861 = _865;
    }
    int _867 = _861;
    float _869 = _851 * _847;
    float _871 = _579 + _581;
    int _873 = abs(_843);
    float _875 = fma(_849, _839, _853);
    float _877 = _871 + (-1.0);
    float _879 = float(_867);
    float _881 = _869 * (-2.0);
    float _883 = float(_873);
    float _885 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _887 = _579 + (-0.5);
    float _889 = fma(_881, _753, _753);
    float _891 = _581 + _577;
    float _893 = _883 * _879;
    float _895 = fma(_885, _881, _885);
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[196].y, _889);
    float _899 = _891 + (-1.0);
    float _901 = _893 * (-2.0);
    float _903 = fma(_895, _839, _897);
    float _905 = _581 + (-0.5);
    float _907 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _909 = fma(_901, _755, _755);
    float _911 = _875 * 0.15915493667125701904296875;
    float _913 = _903 * 0.15915493667125701904296875;
    float _915 = fma(_907, _901, _907);
    float _917 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[196].z, _909);
    float _919 = _911 * 6.283185482025146484375;
    float _921 = cos(_919);
    float _923 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _625);
    float _925 = fma(_915, _839, _917);
    float _927 = _593 * _923;
    float _929 = _925 * 0.15915493667125701904296875;
    float _931 = _913 * 6.283185482025146484375;
    float _933 = sin(_931);
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _697);
    float _937 = _589 * _935;
    float _939 = in.m_60.x;
    float _941 = in.m_60.y;
    float _943 = in.m_60.z;
    float _945 = _913 * 6.283185482025146484375;
    float _947 = cos(_945);
    float _949 = _911 * 6.283185482025146484375;
    float _951 = sin(_949);
    float _953 = _921 * _933;
    float _955 = _929 * 6.283185482025146484375;
    float _957 = cos(_955);
    float _959 = _921 * _947;
    float _961 = _929 * 6.283185482025146484375;
    float _963 = sin(_961);
    float _965 = _951 * _933;
    float _967 = _951 * _947;
    float _969 = _921 * _957;
    float _971 = _951 * _957;
    float _973 = _947 * _957;
    float _975 = _933 * _957;
    float _977 = _969 * _927;
    float _979 = _971 * _927;
    float _981 = fma(_963, _959, _965);
    float _983 = fma(_963, _965, _959);
    float _985 = -_927;
    float _987 = _963 * _985;
    float _989 = -_953;
    float _991 = fma(_963, _967, _989);
    float _993 = -_967;
    float _995 = fma(_963, _953, _993);
    float _997 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _999 = fma(_981, _937, _977);
    float _1001 = fma(_973, _937, _987);
    float _1003 = fma(_991, _937, _979);
    float _1005 = _941 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1007 = fma(_995, _997, _999);
    float _1009 = fma(_975, _997, _1001);
    float _1011 = fma(_983, _997, _1003);
    float _1013 = _941 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1015 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1017 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1019 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1005);
    float _1021 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1013);
    float _1023 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1015);
    float _1025 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1017);
    float _1027 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1019);
    float _1029 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1021);
    float _1031 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1023);
    float _1033 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1025);
    float _1035 = _1027 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1037 = _1029 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1039 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1041 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1043 = _941 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1045 = _1037 + _1039;
    float _1047 = _1035 + _1041;
    float _1049 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1043);
    float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1053 = _1045 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1057 = _1047 + _1055;
    float _1059 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1049);
    float _1061 = _1053 * _1053;
    float _1063 = _1057 * _1057;
    float _1065 = _1061 + _1063;
    float _1067 = sqrt(_1065);
    bool _1069 = _1067 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1071 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1073 = _1067 + _1071;
    float _1075 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1077 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1075);
    float _1079 = _1059 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1081 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1077);
    float _1083 = 0.0;
    float _1085 = _1007;
    float _1087 = _943;
    float _1089 = _1059;
    float _1091 = _1045;
    float _1093 = _995;
    float _1095 = _1061;
    float _1097 = _975;
    if (_1069)
    {
        float _1099 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1083 = _1099;
    }
    float _1101 = _1083;
    float _1103 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    if (!_1069)
    {
        _1085 = _1047;
    }
    float _1105 = _1085;
    float _1107 = _1105;
    if (_1069)
    {
        float _1109 = rsqrt(_1065);
        _1087 = _1109;
    }
    float _1111 = _1087;
    float _1113 = _1101;
    if (_1069)
    {
        float _1115 = _1073 * _1101;
        _1113 = _1115;
    }
    float _1117 = _1113;
    float _1119 = _1079 + _1103;
    float _1121 = _1117;
    float _1123 = _1119;
    if (_1069)
    {
        float _1125 = _1117 * 0.15915493667125701904296875;
        _1121 = _1125;
    }
    float _1127 = _1121;
    if (_1069)
    {
        float _1129 = _1119 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1089 = _1129;
    }
    float _1131 = _1089;
    float _1133 = _939;
    float _1135 = _1131;
    if (_1069)
    {
        float _1137 = _1127 * 6.283185482025146484375;
        float _1139 = sin(_1137);
        _1133 = _1139;
    }
    float _1141 = _1133;
    if (_1069)
    {
        float _1143 = fma(_1141, _1131, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1135 = _1143;
    }
    float _1145 = _1135;
    float _1147 = _1145;
    if (_1069)
    {
        float _1149 = _1111 * _1145;
        _1147 = _1149;
    }
    float _1151 = _1147;
    if (_1069)
    {
        float _1153 = fma(_1053, _1151, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1091 = _1153;
    }
    float _1155 = _1091;
    if (_1069)
    {
        float _1157 = fma(_1057, _1151, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1107 = _1157;
    }
    float _1159 = _1107;
    float _1161 = fma(_1155, 6.2500002968590706586837768554688e-05, 0.5);
    float _1163 = fma(_1159, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4870 = float2(_1161, _1163);
    float3 _1167 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4870, float2(0.0), isnan(_4870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4870, float2(0.0), isnan(_4870)), level(0.0)).xyz;
    float _1169 = _1167.x;
    float _1171 = _1167.y;
    float _1173 = _1167.z;
    float _1175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1177 = -_723;
    float _1179 = _1177 + 0.5;
    bool _1181 = _577 > 0.5;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1189 = _1187 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1193 = _1191 != 0;
    float _1195 = 1.0 / _1185;
    float _1197 = -_697;
    int _1199 = _1181 ? as_type<int>(_1197) : as_type<int>(_697);
    float _1201 = -_791;
    float _1203 = _1201 + 1.0;
    bool _1205 = _583 > 0.5;
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1207;
    float _1211 = -_643;
    float _1213 = _1211 + 1.0;
    bool _1215 = !_1193;
    float _1217 = _1215 ? _697 : as_type<float>(_1199);
    float _1219 = 1.0 / _1189;
    int _1221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1223 = _1221 != 0;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1231 = _1229 != 0;
    float _1233 = _1179 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1237 = _1235 != 0;
    float _1239 = _719 + 0.5;
    bool _1241 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1243 = isnan(_575);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = _1209 * _1195;
    bool _1255 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1257 = isnan(_575);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1269 = _1267 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1271 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1273 = isnan(_575);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1279 = _1275 || _1277;
    float _1281 = float(_1279);
    float _1283 = -_1251;
    float _1285 = _1283 + 1.0;
    float _1287 = 1.0 / _1227;
    float _1289 = -_1265;
    float _1291 = _1289 + 1.0;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1295 = _575 + _1293;
    float _1297 = _1265 * _1285;
    float _1299 = -_1281;
    float _1301 = _1299 + 1.0;
    float _1303 = _1281 * _1291;
    float _1305 = _1269 * _1219;
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1309 = _575 + _1307;
    float _1311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1313 = fma(_1253, _1295, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1315 = fma(_1305, _1309, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1317 = -_625;
    int _1319 = _693 ? as_type<int>(_1317) : as_type<int>(_625);
    float _1321 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1323 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1325 = isnan(_575);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1331 = _1327 || _1329;
    float _1333 = float(_1331);
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1335;
    bool _1339 = !_1223;
    float _1341 = _1339 ? _625 : as_type<float>(_1319);
    float _1343 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1347 = _1337 * _1287;
    float _1349 = _1333 * _1301;
    float _1351 = _1341 + (-0.5);
    float _1353 = -_1333;
    float _1355 = _1353 + 1.0;
    float _1357 = -_625;
    int _1359 = _1205 ? as_type<int>(_1357) : as_type<int>(_625);
    float _1361 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1363 = -_697;
    int _1365 = _669 ? as_type<int>(_1363) : as_type<int>(_697);
    float _1367 = -_1343;
    float _1369 = -_641;
    float _1371 = fma(_1367, _1351, _1369);
    float _1373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1375 = !_1231;
    float _1377 = _1375 ? _625 : as_type<float>(_1359);
    float _1379 = _1217 + 0.5;
    bool _1381 = !_1237;
    float _1383 = _1381 ? _697 : as_type<float>(_1365);
    float _1385 = _1313 * _1349;
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1389 = _575 + _1387;
    float _1391 = -_1377;
    float _1393 = _1391 + 0.5;
    float _1395 = fma(_1361, _1379, _681);
    float _1397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1399 = _1383 + 0.5;
    float _1401 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1403 = -_1203;
    float _1405 = fma(_1217, _1403, _1395);
    float _1407 = fma(_1355, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1385);
    float _1409 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1411 = fma(_1341, _1213, _1371);
    float _1413 = fma(_1347, _1389, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1417 = _1409 * _1345;
    float _1419 = _1401 * _1373;
    float _1421 = fma(_1315, _1303, _1407);
    float _1423 = _697 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_80.x = _1405;
    out.m_80.y = _1411;
    out.m_80.z = _1417;
    out.m_80.w = _1419;
    float _1425 = _1233 * _1397;
    float _1427 = _1127;
    if (_1069)
    {
        float _1429 = _1127 * 6.283185482025146484375;
        float _1431 = cos(_1429);
        _1427 = _1431;
    }
    float _1433 = _1427;
    float _1435 = _969 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1437 = fma(_1413, _1297, _1421);
    float _1439 = -_963;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1435);
    float _1443 = _981 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1445 = _1321 * _1415;
    float _1447 = _969 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1449 = _969 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1451 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1437);
    float _1453 = _981 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1455 = _981 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1457 = _625 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1459 = -_963;
    float _1461 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1447);
    float _1463 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1453);
    float _1465 = _1453;
    float _1467 = _1455;
    if (_1069)
    {
        float _1469 = _1433 + (-1.0);
        _1465 = _1469;
    }
    float _1471 = _1465;
    float _1473 = fma(_1457, _1457, 1.0);
    float _1475 = -_963;
    float _1477 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1449);
    float _1479 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1461);
    float _1481 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1455);
    float _1483 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1441);
    if (_1069)
    {
        float _1485 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1467 = _1485;
    }
    float _1487 = _1467;
    float _1489 = rsqrt(_1473);
    out.m_82.x = _1445;
    out.m_82.y = _1425;
    float _1491 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1477);
    float _1493 = _995 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1495 = _995 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1497 = _1487;
    if (_1069)
    {
        float _1499 = fma(_1119, _1433, _1487);
        _1123 = _1499;
    }
    float _1501 = _1123;
    if (_1069)
    {
        float _1503 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1505 = _1159 + _1503;
        _1497 = _1505;
    }
    float _1507 = _1497;
    float _1509 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1443);
    float _1511 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1495);
    float _1513 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1493);
    float _1515 = _995 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (_1069)
    {
        float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1519 = _1155 + _1517;
        _1093 = _1519;
    }
    float _1521 = _1093;
    float _1523 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1513);
    float _1525 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1515);
    if (_1069)
    {
        float _1527 = _1521 * _1521;
        _1095 = _1527;
    }
    float _1529 = _1095;
    float _1531 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1533 = _1501 + _1531;
    if (!_1069)
    {
        _1097 = _1063;
    }
    float _1535 = _1097;
    float _1537 = _1535;
    if (_1069)
    {
        float _1539 = _1507 * _1507;
        _1537 = _1539;
    }
    float _1541 = _1537;
    float _1543 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1511);
    float _1545 = fma(_1533, _1533, _1529);
    float _1547 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1509);
    float _1549 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1525);
    float _1551 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1463);
    float _1553 = _1457 * _1489;
    float _1555 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1481);
    float _1557 = _1457 * _1483;
    float _1559 = _1457 * _1491;
    float _1561 = _1457 * _1479;
    float _1563 = _1545 + _1541;
    float _1565 = -_1549;
    float _1567 = _1553 * _1565;
    float _1569 = fma(_1423, _1555, _1557);
    float _1571 = fma(_1423, _1547, _1559);
    float _1573 = fma(_1489, _1479, _1567);
    float _1575 = -_1543;
    float _1577 = _1553 * _1575;
    float _1579 = sqrt(_1563);
    float _1581 = fma(_1423, _1551, _1561);
    float _1583 = -_1523;
    float _1585 = _1553 * _1583;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1589 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1593 = fma(_1489, _1491, _1577);
    float _1595 = _1549 + _1581;
    float _1597 = fma(_1489, _1483, _1585);
    float _1599 = _1587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1601 = _1589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1603 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1605 = _1451 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1607 = _1523 + _1569;
    float _1609 = _1543 + _1571;
    out.m_84.x = _1551;
    out.m_84.y = _1555;
    out.m_84.z = _1547;
    bool _1611 = _1579 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1613 = isnan(_1579);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1619 = _1615 || _1617;
    out.m_86.x = _1599;
    out.m_86.y = _1601;
    out.m_86.z = _1603;
    out.m_86.w = _1605;
    out.m_88.x = _1573;
    out.m_88.y = _1597;
    out.m_88.z = _1593;
    out.m_90.x = _1595;
    out.m_90.y = _1607;
    out.m_90.z = _1609;
    if (!_1619)
    {
        _685 = 1.0;
    }
    float _1621 = _685;
    out.m_92.x = _1169;
    out.m_92.y = _1171;
    out.m_92.z = _1173;
    bool _1623 = !_1619;
    float _1625 = _1621;
    if (!_1623)
    {
        bool _1627 = _1579 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1629 = isnan(_1579);
        bool _1631 = _1627 || _1629;
        bool _1633 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1635 = _1631 || _1633;
        if (!_1635)
        {
            float _1637 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1639 = _1579 + _1637;
            float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1643 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1641;
            float _1645 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1647 = _1645 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1649 = 1.0 / _1643;
            float _1651 = _1639 * _1649;
            float _1653 = fma(_1651, _1647, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1625 = _1653;
            _1655 = true;
        }
        else
        {
            bool _1657 = _1579 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1659 = isnan(_1579);
            bool _1661 = _1657 || _1659;
            bool _1663 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1665 = _1661 || _1663;
            if (!_1665)
            {
                float _1667 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1669 = _1579 + _1667;
                float _1671 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1673 = _1671 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1675 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1677 = _1675 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1679 = 1.0 / _1673;
                float _1681 = _1669 * _1679;
                float _1683 = fma(_1681, _1677, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1625 = _1683;
                _1655 = true;
            }
            else
            {
                _1625 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1655 = false;
    float _1685 = _1625;
    float _1687 = fma(_1037, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1689 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1691 = floor(_1687);
    float _1693 = floor(_1689);
    float _1695 = -_1691;
    float _1697 = _1687 + _1695;
    float _1699 = -_1693;
    float _1701 = _1689 + _1699;
    float2 _5825 = float2(_1697, _1701);
    float _1703 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5825, float2(0.0), isnan(_5825)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5825, float2(0.0), isnan(_5825)), level(0.0)).x;
    float _1705 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1707 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1709 = _1501 + _1707;
    float _1711 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1705);
    float _1713 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1715 = _1155 + _1713;
    float _1717 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1711);
    float _1719 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1721 = fma(_1715, _1685, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1723 = _1717 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1725 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1719);
    float _1727 = -_1037;
    float _1729 = _1727 + _1721;
    float _1731 = 1.0 / _1723;
    float _1733 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1725);
    float _1735 = _1733 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1737 = _1735 + _1723;
    float _1739 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1741 = _1079 + _1739;
    float _1743 = _1737 * _1731;
    float _1745 = _1743 * 0.5;
    float _1747 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1749 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1751 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1749);
    float _1753 = fma(_1037, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1747);
    float _1755 = 1.0 / _1751;
    float _1757 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1753);
    float _1759 = _1757 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1761 = trunc(_1759);
    int _1763 = int(_1761);
    float _1765 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1767 = _1755 * _1765;
    float _1769 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1771 = _1767 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1773 = fma(_1037, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1769);
    bool _1775 = _1767 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1777 = !_1771;
    int _1779 = _1777 ? 0 : 1;
    float _1781 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1773);
    int _1783 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1785 = _1763 + _1783;
    int _1787 = _1785 + 1;
    float _1789 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1791 = 2;
    float _1793 = _1721;
    float _1795 = _1759;
    if (!_1771)
    {
        _1791 = 1;
    }
    int _1797 = _1791;
    float _1799 = trunc(_1789);
    int _1801 = int(_1799);
    int _1803 = _1797;
    if (!_1775)
    {
        _1803 = _1779;
    }
    int _1805 = _1803;
    float _1807 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1809 = _1159 + _1807;
    float _1811 = fma(_1709, _1685, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1813 = _1787 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1815 = _1805 << 6;
    float _1817 = fma(_1809, _1685, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1819 = -_1079;
    float _1821 = _1819 + _1811;
    int _1823 = _1815 + 96;
    uint _1826 = uint(int(uint(_1823) >> uint(2)));
    uint _1828 = uint(int(uint(int(_1826)) >> uint(2)));
    int _1830 = int(_1826) & 3;
    float _1832 = (*spvDescriptorSet0.vp_c15)._m0[int(_1828)][_1830];
    int _1834 = int(_1826) + 1;
    uint _1836 = uint(int(uint(_1834) >> uint(2)));
    int _1838 = _1834 & 3;
    float _1840 = (*spvDescriptorSet0.vp_c15)._m0[int(_1836)][_1838];
    float _1842 = -_1035;
    float _1844 = _1842 + _1817;
    float _1846 = _1821 * _1821;
    int _1848 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1850 = _1801 + _1848;
    int _1852 = _1850 + 1;
    float _1854 = fma(_1729, _1729, _1846);
    int _1856 = _1815 + 104;
    uint _1858 = uint(int(uint(_1856) >> uint(2)));
    uint _1860 = uint(int(uint(int(_1858)) >> uint(2)));
    int _1862 = int(_1858) & 3;
    float _1864 = (*spvDescriptorSet0.vp_c15)._m0[int(_1860)][_1862];
    int _1866 = int(_1858) + 1;
    uint _1868 = uint(int(uint(_1866) >> uint(2)));
    int _1870 = _1866 & 3;
    float _1872 = (*spvDescriptorSet0.vp_c15)._m0[int(_1868)][_1870];
    int _1874 = _1787 | _1852;
    float _1876 = fma(_1844, _1844, _1854);
    bool _1878 = _1874 < 0;
    bool _1880 = _1878 || _1813;
    int _1882 = _1815 + 48;
    uint _1884 = uint(int(uint(_1882) >> uint(2)));
    uint _1886 = uint(int(uint(int(_1884)) >> uint(2)));
    int _1888 = int(_1884) & 3;
    float _1890 = (*spvDescriptorSet0.vp_c15)._m0[int(_1886)][_1888];
    int _1892 = int(_1884) + 1;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    int _1896 = _1892 & 3;
    float _1898 = (*spvDescriptorSet0.vp_c15)._m0[int(_1894)][_1896];
    float _1900 = sqrt(_1876);
    bool _1902 = _1852 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1904 = _1902 || _1880;
    int _1906 = _1815 + 64;
    uint _1908 = uint(int(uint(_1906) >> uint(2)));
    uint _1910 = uint(int(uint(int(_1908)) >> uint(2)));
    int _1912 = int(_1908) & 3;
    float _1914 = (*spvDescriptorSet0.vp_c15)._m0[int(_1910)][_1912];
    int _1916 = int(_1908) + 1;
    uint _1918 = uint(int(uint(_1916) >> uint(2)));
    int _1920 = _1916 & 3;
    float _1922 = (*spvDescriptorSet0.vp_c15)._m0[int(_1918)][_1920];
    int _1924 = _1815 + 56;
    uint _1926 = uint(int(uint(_1924) >> uint(2)));
    uint _1928 = uint(int(uint(int(_1926)) >> uint(2)));
    int _1930 = int(_1926) & 3;
    float _1932 = (*spvDescriptorSet0.vp_c15)._m0[int(_1928)][_1930];
    int _1934 = int(_1926) + 1;
    uint _1936 = uint(int(uint(_1934) >> uint(2)));
    int _1938 = _1934 & 3;
    float _1940 = (*spvDescriptorSet0.vp_c15)._m0[int(_1936)][_1938];
    bool _1942 = _1900 > 0.0;
    int _1944 = _1815 + 72;
    uint _1946 = uint(int(uint(_1944) >> uint(2)));
    uint _1948 = uint(int(uint(int(_1946)) >> uint(2)));
    int _1950 = int(_1946) & 3;
    float _1952 = (*spvDescriptorSet0.vp_c15)._m0[int(_1948)][_1950];
    int _1954 = int(_1946) + 1;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    int _1958 = _1954 & 3;
    float _1960 = (*spvDescriptorSet0.vp_c15)._m0[int(_1956)][_1958];
    int _1962 = _1815 + 80;
    uint _1964 = uint(int(uint(_1962) >> uint(2)));
    uint _1966 = uint(int(uint(int(_1964)) >> uint(2)));
    int _1968 = int(_1964) & 3;
    float _1970 = (*spvDescriptorSet0.vp_c15)._m0[int(_1966)][_1968];
    int _1972 = int(_1964) + 1;
    uint _1974 = uint(int(uint(_1972) >> uint(2)));
    int _1976 = _1972 & 3;
    float _1978 = (*spvDescriptorSet0.vp_c15)._m0[int(_1974)][_1976];
    float _1980 = _1741 * _1840;
    float _1982 = _1840;
    float _1984 = _1811;
    float _1986 = _1821;
    float _1988 = _1844;
    float _1990 = _1846;
    int _1992 = as_type<int>(_1817);
    if (!_1904)
    {
        float _1994 = floor(_1759);
        _1982 = _1994;
    }
    float _1996 = _1982;
    float _1998 = fma(_1037, _1832, _1980);
    float _2000 = fma(_1035, _1864, _1998);
    int _2002 = as_type<int>(_1998);
    int _2004 = as_type<int>(_1872);
    if (!_1904)
    {
        int _2006 = _1852 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2008 = _2006 + _1787;
        _2002 = _2008;
    }
    int _2010 = _2002;
    float _2012 = _1741 * _1898;
    float _2014 = _2000 + _1872;
    int _2016 = as_type<int>(_1914);
    if (!_1904)
    {
        int _2018 = _2010 << 2;
        _2004 = _2018;
    }
    int _2020 = _2004;
    float _2022 = fma(_1037, _1890, _2012);
    int _2024 = _2020;
    float _2026 = _2022;
    if (!_1904)
    {
        int _2028 = 12 & _2020;
        _2024 = _2028;
    }
    int _2030 = _2024;
    float _2032 = 1.0 / _2014;
    float _2034 = _1741 * _1922;
    float _2036 = fma(_1037, _1914, _2034);
    if (!_1904)
    {
        uint _2038 = uint(int(uint(_2010) >> uint(2)));
        _2016 = int(_2038);
    }
    int _2040 = _2016;
    float _2042 = fma(_1035, _1932, _2022);
    if (!_1942)
    {
        _2026 = _1817;
    }
    float _2044 = _2026;
    float _2046 = fma(_1035, _1952, _2036);
    bool _2048 = !_1942;
    float _2050 = _2044;
    float _2052 = _2044;
    float _2054 = _1978;
    if (!_2048)
    {
        float _2056 = _199 * _199;
        float _2058 = fma(_197, _197, _2056);
        float _2060 = fma(_201, _201, _2058);
        float _2062 = rsqrt(_1876);
        float _2064 = sqrt(_2060);
        float _2066 = _1729 * _2062;
        float _2068 = _1821 * _2062;
        float _2070 = _1844 * _2062;
        bool _2072 = _2064 > 0.0;
        _1990 = _2068;
        if (!_2072)
        {
            _2050 = _1817;
        }
        float _2074 = _2050;
        bool _2076 = !_2072;
        _2052 = _2074;
        if (!_2076)
        {
            float _2078 = rsqrt(_2060);
            float _2080 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2082 = _199 * _2078;
            float _2084 = _197 * _2078;
            float _2086 = _2068 * _2082;
            float _2088 = _201 * _2078;
            float _2090 = fma(_2066, _2084, _2086);
            float _2092 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2094 = fma(_2070, _2088, _2090);
            float _2096 = _2094 * _2092;
            float _2098 = fma(_197, _2096, _1721);
            float _2100 = fma(_199, _2096, _1811);
            float _2102 = fma(_201, _2096, _1817);
            _1984 = _2100;
            _1793 = _2098;
            _2052 = _2102;
            _1986 = _2080;
            _1988 = _2092;
        }
    }
    float _2104 = _1984;
    float _2106 = _1793;
    float _2108 = _2052;
    float _2110 = _1986;
    float _2112 = _1988;
    float _2114 = _1990;
    float _2116 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2118 = _2112;
    float _2120 = _2114;
    if (!_1904)
    {
        int _2122 = _2040 << 4;
        int _2124 = _2122 + _2030;
        _1992 = _2124;
    }
    int _2126 = _1992;
    float _2128 = _2046 + _1960;
    float _2130 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _2132 = _1815 + 88;
    uint _2134 = uint(int(uint(_2132) >> uint(2)));
    uint _2136 = uint(int(uint(int(_2134)) >> uint(2)));
    int _2138 = int(_2134) & 3;
    float _2140 = (*spvDescriptorSet0.vp_c15)._m0[int(_2136)][_2138];
    int _2142 = int(_2134) + 1;
    uint _2144 = uint(int(uint(_2142) >> uint(2)));
    int _2146 = _2142 & 3;
    float _2148 = (*spvDescriptorSet0.vp_c15)._m0[int(_2144)][_2146];
    float _2150 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2116);
    float _2152 = _2042 + _1940;
    float _2154 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2156 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2130);
    float _2158 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2160 = _2152 * _2032;
    float _2162 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2154);
    float _2164 = _2116;
    if (!_1904)
    {
        int _2166 = _2126 + 400;
        uint _2168 = uint(int(uint(_2166) >> uint(2)));
        uint _2170 = uint(int(uint(int(_2168)) >> uint(2)));
        int _2172 = int(_2168) & 3;
        float _2174 = (*spvDescriptorSet0.vp_c15)._m0[int(_2170)][_2172];
        _2164 = _2174;
    }
    float _2176 = _2164;
    float _2178 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2156);
    float _2180 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2158);
    bool _2182 = _2160 >= 0.0;
    float _2184 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2162);
    float _2186 = _2178 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2188 = _2128 * _2032;
    float _2190 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2150);
    bool _2192 = _2160 <= 1.0;
    bool _2194 = _2192 && _2182;
    float _2196 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2198 = _2186 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2200 = _2190 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2202 = _2188 >= 0.0;
    bool _2204 = _2202 && _2194;
    float _2206 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2180);
    float _2208 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2198);
    float _2210 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2212 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2214 = _2188 <= 1.0;
    bool _2216 = _2214 && _2204;
    float _2218 = _2206 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2220 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2208);
    float _2222 = -_2212;
    float _2224 = fma(_2222, _2210, 1.0);
    float _2226 = _2110;
    float _2228 = _2188;
    float _2230 = _2200;
    if (!_1904)
    {
        float _2232 = floor(_1789);
        _2226 = _2232;
    }
    float _2234 = _2226;
    float _2236 = _2186 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2238 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2220);
    float _2240 = _2186 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2242 = _1741 * _1978;
    float _2244 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2236);
    if (!_1904)
    {
        float _2246 = -_1996;
        float _2248 = _1759 + _2246;
        _2118 = _2248;
    }
    float _2250 = _2118;
    float _2252 = log2(_2224);
    if (_2216)
    {
        float _2254 = float(_1805);
        _2054 = _2254;
    }
    float _2256 = _2054;
    float _2258 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2240);
    float _2260 = fma(_1037, _1970, _2242);
    float _2262 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2244);
    float _2264 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2258);
    float _2266 = 1.0 / _2238;
    float _2268 = _2234;
    if (!_1904)
    {
        float _2270 = -_2234;
        float _2272 = _1789 + _2270;
        _2268 = _2272;
    }
    float _2274 = _2268;
    float _2276 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2262);
    float _2278 = fma(_1035, _2140, _2260);
    float _2280 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2264);
    float _2282 = _2278 + _2148;
    float _2284 = _2244;
    float _2286 = _2280;
    if (_2216)
    {
        float _2288 = rint(_2256);
        float _2290 = precise::max(_2288, 0.0);
        uint _2292 = uint(_2290);
        uint _2294 = clamp(_2292, 0u, 65535u);
        _2284 = as_type<float>(_2294);
    }
    float _2296 = _2284;
    float _2298 = _2252 * 0.693147182464599609375;
    float _2300 = _2282 * _2032;
    float _2302 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2304 = _2260;
    if (!_1904)
    {
        float _2306 = rint(_2176);
        float _2308 = precise::max(_2306, 0.0);
        uint _2310 = uint(_2308);
        uint _2312 = clamp(_2310, 0u, 65535u);
        _2304 = as_type<float>(_2312);
    }
    float _2314 = _2304;
    float _2316 = _2276 * _2266;
    float _2318 = _2280 * _2266;
    float _2320 = fma(_2316, 0.5, 0.5);
    float _2322 = fma(_2318, -0.5, 0.5);
    float _2324 = _2296;
    float _2326 = _2320;
    if (_2216)
    {
        float3 _6869 = float3(_2160, _2188, float(as_type<int>(_2296)));
        float3 _6873 = select(_6869, float3(0.0), isnan(_6869));
        float _2328 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6873.xy, uint(rint(_6873.z)), _2300, level(0.0));
        _2324 = _2328;
    }
    float _2330 = _2324;
    float3 _6883 = float3(_2320, _2322, _2302);
    float _2332 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6883, float3(0.0), isnan(_6883)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6883, float3(0.0), isnan(_6883)), level(0.0)).x;
    float3 _6892 = float3(_2320, _2322, _2302);
    float4 _2335 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6892, float3(0.0), isnan(_6892)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6892, float3(0.0), isnan(_6892)), level(0.0)).xyzw;
    float _2337 = _2335.x;
    float _2339 = _2335.y;
    float _2341 = _2335.z;
    float _2343 = _2335.w;
    float _2345 = _2250;
    if (!_1904)
    {
        float3 _6915 = float3(_2250, _2274, float(as_type<int>(_2314)));
        float3 _6917 = select(_6915, float3(0.0), isnan(_6915));
        float _2347 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6917.xy, uint(rint(_6917.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6917.xy, uint(rint(_6917.z)), level(0.0)).x;
        _2345 = _2347;
    }
    float _2349 = _2345;
    if (_1904)
    {
        _1795 = 1.0;
    }
    float _2351 = _1795;
    float _2353 = _2351;
    float _2355 = _2339;
    float _2357 = _2337;
    if (!_1904)
    {
        int _2359 = _2010 << 4;
        int _2361 = _2359 + 2048;
        uint _2363 = uint(int(uint(_2361) >> uint(2)));
        uint _2365 = uint(int(uint(int(_2363)) >> uint(2)));
        int _2367 = int(_2363) & 3;
        float _2369 = (*spvDescriptorSet0.vp_c15)._m0[int(_2365)][_2367];
        int _2371 = int(_2363) + 1;
        uint _2373 = uint(int(uint(_2371) >> uint(2)));
        int _2375 = _2371 & 3;
        float _2377 = (*spvDescriptorSet0.vp_c15)._m0[int(_2373)][_2375];
        int _2379 = _2361 + 8;
        uint _2381 = uint(int(uint(_2379) >> uint(2)));
        uint _2383 = uint(int(uint(int(_2381)) >> uint(2)));
        int _2385 = int(_2381) & 3;
        float _2387 = (*spvDescriptorSet0.vp_c15)._m0[int(_2383)][_2385];
        int _2389 = int(_2381) + 1;
        uint _2391 = uint(int(uint(_2389) >> uint(2)));
        int _2393 = _2389 & 3;
        float _2395 = (*spvDescriptorSet0.vp_c15)._m0[int(_2391)][_2393];
        float _2397 = _1741 * _2377;
        float _2399 = fma(_1037, _2369, _2397);
        float _2401 = fma(_1035, _2387, _2399);
        float _2403 = _2401 + _2395;
        float _2405 = precise::clamp(_2403, 0.0, 1.0);
        float _2407 = -_2405;
        float _2409 = _2407 + _2349;
        float _2411 = fma(_2409, 500.0, 1.5);
        float _2413 = exp2(_2411);
        float _2415 = 0.0 + _2413;
        float _2417 = precise::clamp(_2415, 0.0, 1.0);
        _2326 = _2369;
        _2353 = _2417;
    }
    float _2419 = _2326;
    float _2421 = _2353;
    float _2423 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2425 = _2104 + _2423;
    float _2427 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2429 = _2106 + _2427;
    float _2431 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2433 = _2108 + _2431;
    float _2435 = _2425 * _2425;
    float _2437 = fma(_2429, _2429, _2435);
    float _2439 = fma(_2433, _2433, _2437);
    float _2441 = rsqrt(_2439);
    float _2443 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2445 = _2429 * _2443;
    float _2447 = _2433 * _2443;
    float _2449 = _2445 * _2445;
    float _2451 = _2447 * _2447;
    float _2453 = _2449 + _2451;
    float _2455 = sqrt(_2453);
    bool _2457 = _2455 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2461 = _2455 + _2459;
    float _2463 = _2433;
    float _2465 = _2461;
    float _2467 = _2435;
    float _2469 = _2425;
    float _2471 = _2419;
    if (_2457)
    {
        float _2473 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2463 = _2473;
    }
    float _2475 = _2463;
    if (_2457)
    {
        float _2477 = rsqrt(_2453);
        _2228 = _2477;
    }
    float _2479 = _2228;
    float _2481 = _2479;
    if (_2457)
    {
        float _2483 = _2461 * _2475;
        _2465 = _2483;
    }
    float _2485 = _2465;
    if (_2457)
    {
        float _2487 = _2485 * 0.15915493667125701904296875;
        _2467 = _2487;
    }
    float _2489 = _2467;
    float _2491 = _2441;
    float _2493 = _2489;
    if (_2457)
    {
        float _2495 = _2489 * 6.283185482025146484375;
        float _2497 = sin(_2495);
        _2491 = _2497;
    }
    float _2499 = _2491;
    float _2501 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2503 = precise::max(0.0, _2501);
    float _2505 = _2475;
    float _2507 = _2503;
    if (_2457)
    {
        float _2509 = _2489 * 6.283185482025146484375;
        float _2511 = cos(_2509);
        _2505 = _2511;
    }
    float _2513 = _2505;
    float _2515 = -_2443;
    float _2517 = -_2503;
    float _2519 = fma(_2425, _2515, _2517);
    if (_2457)
    {
        float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2469 = _2521;
    }
    float _2523 = _2469;
    float _2525 = _2523;
    if (!_2457)
    {
        _2493 = _2451;
    }
    float _2527 = _2493;
    float _2529 = _2499;
    float _2531 = _2527;
    if (_2457)
    {
        float _2533 = fma(_2499, _2523, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2525 = _2533;
    }
    float _2535 = _2525;
    float _2537 = _2535;
    if (!_2457)
    {
        _2529 = _2445;
    }
    float _2539 = _2529;
    float _2541 = _2539;
    if (_2457)
    {
        float _2543 = _2513 + (-1.0);
        _2507 = _2543;
    }
    float _2545 = _2507;
    float _2547 = _2545;
    if (_2457)
    {
        float _2549 = _2479 * _2535;
        _2120 = _2549;
    }
    float _2551 = _2120;
    if (!_2457)
    {
        _2537 = _2519;
    }
    float _2553 = _2537;
    float _2555 = _2553;
    if (_2457)
    {
        float _2557 = _2545 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2471 = _2557;
    }
    float _2559 = _2471;
    if (_2457)
    {
        float _2561 = _2445 * _2551;
        _2541 = _2561;
    }
    float _2563 = _2541;
    if (!_2457)
    {
        _2547 = _2447;
    }
    float _2565 = _2547;
    float _2567 = _2565;
    if (_2457)
    {
        float _2569 = _2447 * _2551;
        _2567 = _2569;
    }
    float _2571 = _2567;
    if (!_2457)
    {
        _2481 = _2449;
    }
    float _2573 = _2481;
    float _2575 = _2573;
    if (_2457)
    {
        float _2577 = fma(_2519, _2513, _2559);
        _2555 = _2577;
    }
    float _2579 = _2555;
    if (_2457)
    {
        float _2581 = _2563 * _2563;
        _2575 = _2581;
    }
    float _2583 = _2575;
    float _2585 = sqrt(_2439);
    if (_2457)
    {
        float _2587 = _2571 * _2571;
        _2531 = _2587;
    }
    float _2589 = _2531;
    float _2591 = fma(_2579, _2579, _2583);
    float _2593 = _2591 + _2589;
    float _2595 = rsqrt(_2593);
    float _2597 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2599 = fma(_2585, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2597);
    float _2601 = precise::clamp(_2599, 0.0, 1.0);
    float _2603 = -_2601;
    float _2605 = _2603 + 1.0;
    float _2607 = abs(_2605);
    float _2609 = log2(_2607);
    float _2611 = _2595 * _2563;
    float _2613 = _2595 * _2579;
    float _2615 = _2595 * _2571;
    float _2617 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2619 = -_2617;
    float _2621 = fma(_2613, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2619);
    float _2623 = -_2615;
    float _2625 = fma(_2623, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2621);
    float _2627 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2629 = fma(_2625, -0.5, 0.5);
    float _2631 = fma(_2625, 0.5, 0.5);
    float _2633 = exp2(_2627);
    float _2635 = fma(_2631, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2637 = fma(_2631, _2635, -0.212114393711090087890625);
    float _2639 = _2613 + 1.0;
    float _2641 = sqrt(_2629);
    float _2643 = fma(_2631, _2637, 1.570728778839111328125);
    float _2645 = -_2613;
    float _2647 = fma(_2633, _2639, _2645);
    float _2649 = fma(_2647, 0.5, 0.5);
    float _2651 = _2641 * 0.636619746685028076171875;
    float _2653 = -_2643;
    float _2655 = fma(_2651, _2653, 1.0);
    float2 _7393 = float2(_2655, _2649);
    float3 _2657 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7393, float2(0.0), isnan(_7393)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7393, float2(0.0), isnan(_7393)), level(0.0)).xyz;
    float _2659 = _2657.x;
    float _2661 = _2657.y;
    float _2663 = _2657.z;
    float _2665 = abs(_1767);
    float _2667 = log2(_2665);
    float _2669 = -_1703;
    float _2671 = _2669 + 1.0;
    bool _2673 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2675 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2677 = _2673 || _2675;
    bool _2679 = isnan(0.5);
    bool _2681 = _2677 || _2679;
    float _2683 = _2667 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2685 = _2186 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2687 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2685);
    float _2689 = exp2(_2683);
    float _2691 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_2681)
    {
        _2691 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2693 = _2691;
    float _2695 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2687);
    float _2697 = _2693;
    if (_2681)
    {
        _2230 = 1.0;
    }
    float _2699 = _2230;
    float _2701 = _2699;
    if (!_2681)
    {
        float _2703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2705 = _2693 + _2703;
        _2697 = _2705;
    }
    float _2707 = _2697;
    float _2709 = _2519;
    if (!_2681)
    {
        float _2711 = 1.0 / _2707;
        _2709 = _2711;
    }
    float _2713 = _2709;
    float _2715 = fma(_2689, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2717 = precise::clamp(_2715, 0.0, 1.0);
    float _2719 = fma(_2717, -2.0, 3.0);
    float _2721 = _2717 * _2717;
    float _2723 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2725 = _2721 * _2719;
    float _2727 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2695);
    float _2729 = exp2(_2723);
    float _2731 = -_2725;
    float _2733 = _2731 + 1.0;
    float _2735 = _2727 + _2238;
    out.gl_Position.x = _2276;
    out.gl_Position.y = _2280;
    out.gl_Position.z = _2727;
    out.gl_Position.w = _2238;
    float _2737 = fma(_2733, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2725);
    float _2739 = _2733;
    float _2741 = _2735;
    float _2743 = _2276;
    if (!_2681)
    {
        float _2745 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2747 = _1767 + _2745;
        _2739 = _2747;
    }
    float _2749 = _2739;
    bool _2751 = _1767 <= 8000.0;
    bool _2753 = isnan(_1767);
    bool _2755 = _2751 || _2753;
    bool _2757 = isnan(8000.0);
    bool _2759 = _2755 || _2757;
    float _2761 = float(_2759);
    float _2763 = _2735 * 0.5;
    if (!_2216)
    {
        _2741 = 1.0;
    }
    float _2765 = _2741;
    float _2767 = _2765;
    if (!_2681)
    {
        float _2769 = _2749 * _2713;
        float _2771 = precise::clamp(_2769, 0.0, 1.0);
        _2701 = _2771;
    }
    float _2773 = _2701;
    if (_2216)
    {
        bool _2775 = _2330 >= _2300;
        bool _2777 = isnan(_2330);
        bool _2779 = _2775 || _2777;
        bool _2781 = isnan(_2300);
        bool _2783 = _2779 || _2781;
        float _2785 = float(_2783);
        _2767 = _2785;
    }
    float _2787 = _2767;
    float _2789 = _2761 * _2737;
    bool _2791 = _2585 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2793 = isnan(_2585);
    bool _2795 = _2791 || _2793;
    bool _2797 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2799 = _2795 || _2797;
    float _2801 = _2789 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2803 = -_2729;
    float _2805 = _2803 + 1.0;
    float _2807 = _2787 * _2421;
    out.m_94.z = _2763;
    out.m_94.w = _2238;
    float _2809 = _2671 * _2801;
    float _2811 = precise::clamp(_2809, 0.0, 1.0);
    float _2813 = _2805 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2815 = _2773 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2817 = -_2811;
    float _2819 = fma(_2817, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2821 = _2813 * _2332;
    float _2823 = -_2813;
    float _2825 = _2823 + 1.0;
    float _2827 = -_2807;
    float _2829 = fma(_2827, _2819, 1.0);
    float _2831 = precise::clamp(_2829, 0.0, 1.0);
    float _2833 = _2343 * _2821;
    float _2835 = _2343 * _2825;
    float _2837 = _2831;
    float _2839 = _2833;
    if (!_2799)
    {
        _2286 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2841 = _2286;
    float _2843 = _2831 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2845 = _2841;
    float _2847 = _2841;
    if (!_2799)
    {
        _2743 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2849 = _2743;
    float _2851 = _2849;
    float _2853 = _2849;
    if (!_2799)
    {
        _2837 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2855 = _2837;
    out.m_96.x = _2843;
    float _2857 = _2663 * _2821;
    float _2859 = fma(_2659, _2833, _2337);
    float _2861 = fma(_2661, _2833, _2339);
    float _2863 = _2855;
    float _2865 = _2855;
    if (!_2799)
    {
        _2839 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2867 = _2839;
    float _2869 = fma(_2343, _2857, _2341);
    float _2871 = _2867;
    float _2873 = _2867;
    if (!_2799)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2875 = _2355;
    float _2877 = _2875;
    float _2879 = _2875;
    if (!_2799)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2881 = _2357;
    out.m_98.x = _2859;
    out.m_98.y = _2861;
    out.m_98.z = _2869;
    out.m_98.w = _2835;
    bool _2883 = !_2799;
    float _2885 = _2881;
    float _2887 = _2881;
    if (!_2883)
    {
        bool _2889 = _2585 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2891 = isnan(_2585);
        bool _2893 = _2889 || _2891;
        bool _2895 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2897 = _2893 || _2895;
        if (!_2897)
        {
            float _2899 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2901 = _2585 + _2899;
            float _2903 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2905 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2903;
            float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2911 = 1.0 / _2905;
            float _2913 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2915 = _2913 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2919 = _2917 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2923 = _2921 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2929 = _2901 * _2911;
            float _2931 = precise::clamp(_2929, 0.0, 1.0);
            float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2935 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2937 = fma(_2931, _2909, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2939 = fma(_2931, _2935, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2941 = fma(_2931, _2915, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2943 = fma(_2931, _2919, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2945 = fma(_2931, _2923, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2947 = fma(_2931, _2927, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2853 = _2941;
            _2879 = _2945;
            _2847 = _2937;
            _2865 = _2943;
            _2873 = _2939;
            _2887 = _2947;
            _2949 = true;
        }
        else
        {
            bool _2951 = _2585 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2953 = isnan(_2585);
            bool _2955 = _2951 || _2953;
            bool _2957 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2959 = _2955 || _2957;
            if (!_2959)
            {
                _2845 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2961 = _2845;
            _2847 = _2961;
            if (!_2959)
            {
                _2851 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2963 = _2851;
            _2853 = _2963;
            if (!_2959)
            {
                _2871 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2965 = _2871;
            _2873 = _2965;
            if (!_2959)
            {
                _2863 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2967 = _2863;
            _2865 = _2967;
            if (!_2959)
            {
                _2877 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2969 = _2877;
            _2879 = _2969;
            if (!_2959)
            {
                _2885 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2971 = _2885;
            bool _2973 = !_2959;
            _2887 = _2971;
            if (!_2973)
            {
                bool _2975 = _2585 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2977 = isnan(_2585);
                bool _2979 = _2975 || _2977;
                bool _2981 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2983 = _2979 || _2981;
                if (!_2983)
                {
                    float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2987 = _2585 + _2985;
                    float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2991 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2989;
                    float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2997 = 1.0 / _2991;
                    float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3013 = _3011 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3015 = _2987 * _2997;
                    float _3017 = precise::clamp(_3015, 0.0, 1.0);
                    float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3023 = fma(_3017, _2995, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3025 = fma(_3017, _3021, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3027 = fma(_3017, _3001, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3029 = fma(_3017, _3005, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3031 = fma(_3017, _3009, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3033 = fma(_3017, _3013, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2853 = _3027;
                    _2879 = _3031;
                    _2847 = _3023;
                    _2865 = _3029;
                    _2873 = _3025;
                    _2887 = _3033;
                    _2949 = true;
                }
                else
                {
                    _2853 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2879 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2847 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2865 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2873 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2887 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2949 = false;
    float _3035 = _2853;
    float _3037 = _2879;
    float _3039 = _2847;
    float _3041 = _2865;
    float _3043 = _2873;
    float _3045 = _2887;
    float _3047 = _2815 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3049 = fma(_1607, -0.5, 0.5);
    float _3051 = precise::clamp(_3049, 0.0, 1.0);
    float _3053 = -_3035;
    float _3055 = _3053 + _3037;
    float _3057 = -_3039;
    float _3059 = _3057 + _3041;
    out.m_100.x = 0.0;
    float _3061 = fma(_3051, _3055, _3035);
    float _3063 = -_3043;
    float _3065 = _3063 + _3045;
    float _3067 = fma(_3051, _3059, _3039);
    float _3069 = _3061 * 0.586610972881317138671875;
    bool _3071 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3073 = fma(_3051, _3065, _3043);
    out.m_63.x = _3047;
    float _3075 = fma(_3067, 0.298911988735198974609375, _3069);
    bool _3077 = _2773 > 0.0;
    bool _3079 = isnan(_2773);
    bool _3081 = _3077 || _3079;
    bool _3083 = isnan(0.0);
    bool _3085 = _3081 || _3083;
    float _3087 = fma(_3073, 0.114477999508380889892578125, _3075);
    float _3089 = -_3087;
    float _3091 = _3067 + _3089;
    float _3093 = -_3087;
    float _3095 = _3061 + _3093;
    float _3097 = -_3087;
    float _3099 = _3073 + _3097;
    float _3101 = fma(_3091, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3087);
    float _3103 = fma(_3095, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3087);
    float _3105 = fma(_3099, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3087);
    bool _3107 = !_3071;
    if (!_3107)
    {
        float _3109 = -_2104;
        float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3113 = -_2106;
        float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3117 = -_2108;
        float _3119 = _3117 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3121 = _3111 * _3111;
        float _3123 = fma(_3115, _3115, _3121);
        float _3125 = fma(_3119, _3119, _3123);
        float _3127 = sqrt(_3125);
        float _3129 = rsqrt(_3125);
        float _3131 = -_3127;
        float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3135 = _3133 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3137 = precise::clamp(_3135, 0.0, 1.0);
        float _3139 = _3115 * _3129;
        float _3141 = _3111 * _3129;
        float _3143 = abs(_3137);
        float _3145 = log2(_3143);
        float _3147 = _3119 * _3129;
        float _3149 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3151 = _1607 * _3141;
        float _3153 = -_3141;
        float _3155 = -_3149;
        float _3157 = fma(_3153, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3155);
        float _3159 = fma(_1595, _3139, _3151);
        float _3161 = -_3147;
        float _3163 = fma(_3161, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3157);
        float _3165 = fma(_1609, _3147, _3159);
        float _3167 = precise::clamp(_3165, 0.0, 1.0);
        float _3169 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3171 = _3163 + _3169;
        float _3173 = _3145 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3175 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3177 = precise::clamp(_3175, 0.0, 1.0);
        float _3179 = exp2(_3173);
        float _3181 = _3179 * _3177;
        float _3183 = _3167 * _3181;
        float _3185 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3187 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3189 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _3185;
        out.m_100.y = _3187;
        out.m_100.z = _3189;
    }
    out.m_102.x = _3101;
    out.m_102.y = _3103;
    out.m_102.z = _3105;
    if (_3085)
    {
        return out;
    }
    out.m_63.x = 0.0;
    float _3191 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3191;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2949 = false;
    bool _1655 = false;
    bool _567 = false;
    bool _417 = false;
    bool _223 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_60.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_63.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3248 = as_type<float>(_137);
        out.gl_Position.z = _3248;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_65.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = 0.0;
    float _159 = _155;
    if (_151)
    {
        float _161 = float(_121);
        _157 = _161;
    }
    float _163 = _157;
    bool _165 = _155 >= _163;
    bool _167 = !_151;
    bool _169 = _165 || _167;
    if (_169)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _131;
    if (_169)
    {
        out.m_63.x = 0.0;
    }
    if (_169)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3317 = as_type<float>(_175);
        out.gl_Position.z = _3317;
    }
    if (_169)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _177 = in.m_67.x;
    float _179 = in.m_67.y;
    float _181 = in.m_67.z;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _187 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _191 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _185);
    float _193 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _195 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    float _197 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _199 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _201 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    bool _203 = !_183;
    float _221;
    if (!_203)
    {
        float _205 = in.m_69.x;
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _221 = _219;
        _223 = true;
    }
    else
    {
        float _225 = float(_121);
        float _227 = 1.0 / _225;
        float _229 = _155 * _227;
        _221 = _229;
    }
    _223 = false;
    float _231 = _221;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = _231 + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = _231 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _243 = _231 + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _249 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _253;
    bool _257 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _259 = isnan(_231);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = 1.0 / _247;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _273 = 1.0 / _255;
    float _275 = 1.0 / _251;
    float _277 = _235 * _269;
    bool _279 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _281 = isnan(_231);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -_267;
    float _293 = _291 + 1.0;
    float _295 = _289 * _293;
    float _297 = _239 * _273;
    bool _299 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_231);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_289;
    float _313 = _311 + 1.0;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _319 = _309 * _313;
    float _321 = -_309;
    float _323 = _321 + 1.0;
    float _325 = _243 * _275;
    bool _327 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_231);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = fma(_317, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _353 = fma(_341, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _355 = _337 * _323;
    float _357 = fma(_347, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = fma(_351, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _361 = -_337;
    float _363 = _361 + 1.0;
    float _365 = _353 * _355;
    float _367 = _357 * _355;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _369;
    float _373 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].x, _365);
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _375;
    float _379 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].y, _367);
    float _381 = fma(_371, _297, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _383 = fma(_343, _319, _373);
    float _385 = fma(_377, _297, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _387 = fma(_359, _319, _379);
    float _389 = fma(_381, _295, _383);
    float _391 = fma(_385, _295, _387);
    float _393 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[146].x, _389);
    float _395 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[146].y, _391);
    bool _397 = !_271;
    float _415;
    if (!_397)
    {
        float _399 = in.m_69.x;
        float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _403 = _399 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _405 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _407 = _405 * _401;
        float _409 = floor(_407);
        float _411 = -_409;
        float _413 = _407 + _411;
        _415 = _413;
        _417 = true;
    }
    else
    {
        float _419 = float(_121);
        float _421 = 1.0 / _419;
        float _423 = _155 * _421;
        _415 = _423;
    }
    _417 = false;
    float _425 = _415;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _429 = _425 + _427;
    float _431 = in.m_71.x;
    float _433 = in.m_71.y;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _439 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = isnan(_425);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _455 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _457 = isnan(_425);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    bool _471 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _473 = isnan(_425);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _437;
    float _485 = -_449;
    float _487 = _485 + 1.0;
    bool _489 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _491 = _465 * _487;
    float _493 = -_465;
    float _495 = _493 + 1.0;
    float _497 = 1.0 / _453;
    float _499 = _469 * _483;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _505 = _395 * _433;
    float _507 = _393 * _431;
    float _509 = fma(_499, _429, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _511 = _503 * _497;
    float _513 = _509 * _491;
    float _515 = -_481;
    float _517 = _515 + 1.0;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _521 = _425 + _519;
    float _523 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[115].x, _513);
    float _525 = _449 * _517;
    float _527 = fma(_511, _521, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _531 = fma(_527, _525, _523);
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _535 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[117].x, _531);
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _541 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _537 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _545 = _539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _535;
    out.m_73.y = _545;
    out.m_73.z = _541;
    out.m_73.w = _543;
    bool _547 = !_489;
    float _565;
    if (!_547)
    {
        float _549 = in.m_69.x;
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _553 = _549 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[11].w, _155);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _563;
        _567 = true;
    }
    else
    {
        float _569 = float(_121);
        float _571 = 1.0 / _569;
        float _573 = _155 * _571;
        _565 = _573;
    }
    _567 = false;
    float _575 = _565;
    float _577 = in.m_69.x;
    float _579 = in.m_69.y;
    float _581 = in.m_69.z;
    float _583 = in.m_69.w;
    float _585 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _587 = log2(_585);
    float _589 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _591 = as_type<float>(int(gl_VertexIndex));
    float _593 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _601 = _581 * 2.0;
    float _603 = _577 * 2.0;
    float _605 = _579 + _577;
    float _607 = _579 * 2.0;
    int _609 = as_type<int>(_591) & 1;
    bool _611 = _609 != 0;
    int _613 = as_type<int>(_591) & 2;
    bool _615 = _613 != 0;
    float _617 = _579 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _619 = floor(_601);
    float _621 = _605 + (-1.0);
    bool _623 = !_615;
    float _625 = _623 ? (-0.5) : 0.5;
    float _627 = fma(_617, -2.0, _595);
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _631 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _633 = floor(_603);
    float _635 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[78].w, _599);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _639 = 1.0 + _637;
    float _641 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _627);
    float _643 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _635);
    bool _645 = _619 > 0.0;
    float _647 = floor(_607);
    bool _649 = _619 >= 0.0;
    bool _651 = isnan(_619);
    bool _653 = _649 || _651;
    bool _655 = isnan(0.0);
    bool _657 = _653 || _655;
    float _659 = _577 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _661 = _657 ? 0 : 1;
    float _663 = -_629;
    float _665 = fma(_659, 2.0, _663);
    float _667 = _587 * _155;
    bool _669 = _581 > 0.5;
    float _671 = 1.0 / _639;
    int _673 = ~_661;
    int _675 = _673 + 1;
    int _677 = _675 + 1;
    float _679 = -_155;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[76].x, _665);
    int _683 = _677;
    float _685 = _681;
    if (!_645)
    {
        int _687 = ~_661;
        int _689 = _687 + 1;
        _683 = _689;
    }
    int _691 = _683;
    bool _693 = _579 > 0.5;
    bool _695 = !_611;
    float _697 = _695 ? (-0.5) : 0.5;
    float _699 = exp2(_667);
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _703 = _701 != 0;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _707 = _705 != 0;
    float _709 = -_697;
    int _711 = _693 ? as_type<int>(_709) : as_type<int>(_697);
    float _713 = -_625;
    int _715 = _669 ? as_type<int>(_713) : as_type<int>(_625);
    bool _717 = !_703;
    float _719 = _717 ? _697 : as_type<float>(_711);
    bool _721 = !_707;
    float _723 = _721 ? _625 : as_type<float>(_715);
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _731 = _729 != 0;
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _735 = _733 != 0;
    bool _737 = _633 >= 0.0;
    bool _739 = isnan(_633);
    bool _741 = _737 || _739;
    bool _743 = isnan(0.0);
    bool _745 = _741 || _743;
    float _747 = -_699;
    float _749 = _747 + 1.0;
    float _751 = in.m_78.x;
    float _753 = in.m_78.y;
    float _755 = in.m_78.z;
    bool _757 = !_727;
    int _759 = _757 ? 0 : 1;
    int _761 = _745 ? 0 : 1;
    bool _763 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _765 = isnan(0.0);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _771 = _767 || _769;
    int _773 = abs(_759);
    float _775 = _771 ? _749 : 0.0;
    float _777 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[78].z, _597);
    bool _779 = _647 > 0.0;
    bool _781 = _647 >= 0.0;
    bool _783 = isnan(_647);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    float _791 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _777);
    bool _793 = !_731;
    int _795 = _793 ? 0 : 1;
    bool _797 = _633 > 0.0;
    bool _799 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _801 = isnan(1.0);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _807 = _803 || _805;
    float _809 = float(_691);
    float _811 = float(_773);
    int _813 = ~_761;
    int _815 = _813 + 1;
    int _817 = _815 + 1;
    int _819 = abs(_795);
    float _821 = _811 * _809;
    int _823 = _789 ? 0 : 1;
    float _825 = _577 + (-0.5);
    int _827 = _817;
    if (!_797)
    {
        int _829 = ~_761;
        int _831 = _829 + 1;
        _827 = _831;
    }
    int _833 = _827;
    float _835 = _821 * (-2.0);
    if (_807)
    {
        float _837 = _775 * _671;
        _159 = _837;
    }
    float _839 = _159;
    bool _841 = !_735;
    int _843 = _841 ? 0 : 1;
    float _845 = fma(_835, _751, _751);
    float _847 = float(_833);
    float _849 = fma(_631, _835, _631);
    float _851 = float(_819);
    float _853 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[196].x, _845);
    int _855 = ~_823;
    int _857 = _855 + 1;
    int _859 = _857 + 1;
    int _861 = _859;
    if (!_779)
    {
        int _863 = ~_823;
        int _865 = _863 + 1;
        _861 = _865;
    }
    int _867 = _861;
    float _869 = _851 * _847;
    float _871 = _579 + _581;
    int _873 = abs(_843);
    float _875 = fma(_849, _839, _853);
    float _877 = _871 + (-1.0);
    float _879 = float(_867);
    float _881 = _869 * (-2.0);
    float _883 = float(_873);
    float _885 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _887 = _579 + (-0.5);
    float _889 = fma(_881, _753, _753);
    float _891 = _581 + _577;
    float _893 = _883 * _879;
    float _895 = fma(_885, _881, _885);
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[196].y, _889);
    float _899 = _891 + (-1.0);
    float _901 = _893 * (-2.0);
    float _903 = fma(_895, _839, _897);
    float _905 = _581 + (-0.5);
    float _907 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _909 = fma(_901, _755, _755);
    float _911 = _875 * 0.15915493667125701904296875;
    float _913 = _903 * 0.15915493667125701904296875;
    float _915 = fma(_907, _901, _907);
    float _917 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[196].z, _909);
    float _919 = _911 * 6.283185482025146484375;
    float _921 = cos(_919);
    float _923 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _625);
    float _925 = fma(_915, _839, _917);
    float _927 = _593 * _923;
    float _929 = _925 * 0.15915493667125701904296875;
    float _931 = _913 * 6.283185482025146484375;
    float _933 = sin(_931);
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _697);
    float _937 = _589 * _935;
    float _939 = in.m_60.x;
    float _941 = in.m_60.y;
    float _943 = in.m_60.z;
    float _945 = _913 * 6.283185482025146484375;
    float _947 = cos(_945);
    float _949 = _911 * 6.283185482025146484375;
    float _951 = sin(_949);
    float _953 = _921 * _933;
    float _955 = _929 * 6.283185482025146484375;
    float _957 = cos(_955);
    float _959 = _921 * _947;
    float _961 = _929 * 6.283185482025146484375;
    float _963 = sin(_961);
    float _965 = _951 * _933;
    float _967 = _951 * _947;
    float _969 = _921 * _957;
    float _971 = _951 * _957;
    float _973 = _947 * _957;
    float _975 = _933 * _957;
    float _977 = _969 * _927;
    float _979 = _971 * _927;
    float _981 = fma(_963, _959, _965);
    float _983 = fma(_963, _965, _959);
    float _985 = -_927;
    float _987 = _963 * _985;
    float _989 = -_953;
    float _991 = fma(_963, _967, _989);
    float _993 = -_967;
    float _995 = fma(_963, _953, _993);
    float _997 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _999 = fma(_981, _937, _977);
    float _1001 = fma(_973, _937, _987);
    float _1003 = fma(_991, _937, _979);
    float _1005 = _941 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1007 = fma(_995, _997, _999);
    float _1009 = fma(_975, _997, _1001);
    float _1011 = fma(_983, _997, _1003);
    float _1013 = _941 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1015 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1017 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1019 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1005);
    float _1021 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1013);
    float _1023 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1015);
    float _1025 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1017);
    float _1027 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1019);
    float _1029 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1021);
    float _1031 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1023);
    float _1033 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1025);
    float _1035 = _1027 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1037 = _1029 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1039 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1041 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1043 = _941 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1045 = _1037 + _1039;
    float _1047 = _1035 + _1041;
    float _1049 = fma(_939, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1043);
    float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1053 = _1045 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1057 = _1047 + _1055;
    float _1059 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1049);
    float _1061 = _1053 * _1053;
    float _1063 = _1057 * _1057;
    float _1065 = _1061 + _1063;
    float _1067 = sqrt(_1065);
    bool _1069 = _1067 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1071 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1073 = _1067 + _1071;
    float _1075 = _1007 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1077 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1075);
    float _1079 = _1059 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1081 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1077);
    float _1083 = 0.0;
    float _1085 = _1007;
    float _1087 = _943;
    float _1089 = _1059;
    float _1091 = _1045;
    float _1093 = _995;
    float _1095 = _1061;
    float _1097 = _975;
    if (_1069)
    {
        float _1099 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1083 = _1099;
    }
    float _1101 = _1083;
    float _1103 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    if (!_1069)
    {
        _1085 = _1047;
    }
    float _1105 = _1085;
    float _1107 = _1105;
    if (_1069)
    {
        float _1109 = rsqrt(_1065);
        _1087 = _1109;
    }
    float _1111 = _1087;
    float _1113 = _1101;
    if (_1069)
    {
        float _1115 = _1073 * _1101;
        _1113 = _1115;
    }
    float _1117 = _1113;
    float _1119 = _1079 + _1103;
    float _1121 = _1117;
    float _1123 = _1119;
    if (_1069)
    {
        float _1125 = _1117 * 0.15915493667125701904296875;
        _1121 = _1125;
    }
    float _1127 = _1121;
    if (_1069)
    {
        float _1129 = _1119 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1089 = _1129;
    }
    float _1131 = _1089;
    float _1133 = _939;
    float _1135 = _1131;
    if (_1069)
    {
        float _1137 = _1127 * 6.283185482025146484375;
        float _1139 = sin(_1137);
        _1133 = _1139;
    }
    float _1141 = _1133;
    if (_1069)
    {
        float _1143 = fma(_1141, _1131, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1135 = _1143;
    }
    float _1145 = _1135;
    float _1147 = _1145;
    if (_1069)
    {
        float _1149 = _1111 * _1145;
        _1147 = _1149;
    }
    float _1151 = _1147;
    if (_1069)
    {
        float _1153 = fma(_1053, _1151, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1091 = _1153;
    }
    float _1155 = _1091;
    if (_1069)
    {
        float _1157 = fma(_1057, _1151, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1107 = _1157;
    }
    float _1159 = _1107;
    float _1161 = fma(_1155, 6.2500002968590706586837768554688e-05, 0.5);
    float _1163 = fma(_1159, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4870 = float2(_1161, _1163);
    float3 _1167 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4870, float2(0.0), isnan(_4870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4870, float2(0.0), isnan(_4870)), level(0.0)).xyz;
    float _1169 = _1167.x;
    float _1171 = _1167.y;
    float _1173 = _1167.z;
    float _1175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1177 = -_723;
    float _1179 = _1177 + 0.5;
    bool _1181 = _577 > 0.5;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1189 = _1187 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1193 = _1191 != 0;
    float _1195 = 1.0 / _1185;
    float _1197 = -_697;
    int _1199 = _1181 ? as_type<int>(_1197) : as_type<int>(_697);
    float _1201 = -_791;
    float _1203 = _1201 + 1.0;
    bool _1205 = _583 > 0.5;
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1207;
    float _1211 = -_643;
    float _1213 = _1211 + 1.0;
    bool _1215 = !_1193;
    float _1217 = _1215 ? _697 : as_type<float>(_1199);
    float _1219 = 1.0 / _1189;
    int _1221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1223 = _1221 != 0;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1231 = _1229 != 0;
    float _1233 = _1179 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1237 = _1235 != 0;
    float _1239 = _719 + 0.5;
    bool _1241 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1243 = isnan(_575);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = _1209 * _1195;
    bool _1255 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1257 = isnan(_575);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1269 = _1267 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1271 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1273 = isnan(_575);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1279 = _1275 || _1277;
    float _1281 = float(_1279);
    float _1283 = -_1251;
    float _1285 = _1283 + 1.0;
    float _1287 = 1.0 / _1227;
    float _1289 = -_1265;
    float _1291 = _1289 + 1.0;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1295 = _575 + _1293;
    float _1297 = _1265 * _1285;
    float _1299 = -_1281;
    float _1301 = _1299 + 1.0;
    float _1303 = _1281 * _1291;
    float _1305 = _1269 * _1219;
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1309 = _575 + _1307;
    float _1311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1313 = fma(_1253, _1295, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1315 = fma(_1305, _1309, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1317 = -_625;
    int _1319 = _693 ? as_type<int>(_1317) : as_type<int>(_625);
    float _1321 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1323 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1325 = isnan(_575);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1331 = _1327 || _1329;
    float _1333 = float(_1331);
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1335;
    bool _1339 = !_1223;
    float _1341 = _1339 ? _625 : as_type<float>(_1319);
    float _1343 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1347 = _1337 * _1287;
    float _1349 = _1333 * _1301;
    float _1351 = _1341 + (-0.5);
    float _1353 = -_1333;
    float _1355 = _1353 + 1.0;
    float _1357 = -_625;
    int _1359 = _1205 ? as_type<int>(_1357) : as_type<int>(_625);
    float _1361 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1363 = -_697;
    int _1365 = _669 ? as_type<int>(_1363) : as_type<int>(_697);
    float _1367 = -_1343;
    float _1369 = -_641;
    float _1371 = fma(_1367, _1351, _1369);
    float _1373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1375 = !_1231;
    float _1377 = _1375 ? _625 : as_type<float>(_1359);
    float _1379 = _1217 + 0.5;
    bool _1381 = !_1237;
    float _1383 = _1381 ? _697 : as_type<float>(_1365);
    float _1385 = _1313 * _1349;
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1389 = _575 + _1387;
    float _1391 = -_1377;
    float _1393 = _1391 + 0.5;
    float _1395 = fma(_1361, _1379, _681);
    float _1397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1399 = _1383 + 0.5;
    float _1401 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1403 = -_1203;
    float _1405 = fma(_1217, _1403, _1395);
    float _1407 = fma(_1355, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1385);
    float _1409 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1411 = fma(_1341, _1213, _1371);
    float _1413 = fma(_1347, _1389, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1417 = _1409 * _1345;
    float _1419 = _1401 * _1373;
    float _1421 = fma(_1315, _1303, _1407);
    float _1423 = _697 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_80.x = _1405;
    out.m_80.y = _1411;
    out.m_80.z = _1417;
    out.m_80.w = _1419;
    float _1425 = _1233 * _1397;
    float _1427 = _1127;
    if (_1069)
    {
        float _1429 = _1127 * 6.283185482025146484375;
        float _1431 = cos(_1429);
        _1427 = _1431;
    }
    float _1433 = _1427;
    float _1435 = _969 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1437 = fma(_1413, _1297, _1421);
    float _1439 = -_963;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1435);
    float _1443 = _981 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1445 = _1321 * _1415;
    float _1447 = _969 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1449 = _969 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1451 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1437);
    float _1453 = _981 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1455 = _981 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1457 = _625 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1459 = -_963;
    float _1461 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1447);
    float _1463 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1453);
    float _1465 = _1453;
    float _1467 = _1455;
    if (_1069)
    {
        float _1469 = _1433 + (-1.0);
        _1465 = _1469;
    }
    float _1471 = _1465;
    float _1473 = fma(_1457, _1457, 1.0);
    float _1475 = -_963;
    float _1477 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1449);
    float _1479 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1461);
    float _1481 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1455);
    float _1483 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1441);
    if (_1069)
    {
        float _1485 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1467 = _1485;
    }
    float _1487 = _1467;
    float _1489 = rsqrt(_1473);
    out.m_82.x = _1445;
    out.m_82.y = _1425;
    float _1491 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1477);
    float _1493 = _995 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1495 = _995 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1497 = _1487;
    if (_1069)
    {
        float _1499 = fma(_1119, _1433, _1487);
        _1123 = _1499;
    }
    float _1501 = _1123;
    if (_1069)
    {
        float _1503 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1505 = _1159 + _1503;
        _1497 = _1505;
    }
    float _1507 = _1497;
    float _1509 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1443);
    float _1511 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1495);
    float _1513 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1493);
    float _1515 = _995 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (_1069)
    {
        float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1519 = _1155 + _1517;
        _1093 = _1519;
    }
    float _1521 = _1093;
    float _1523 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1513);
    float _1525 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1515);
    if (_1069)
    {
        float _1527 = _1521 * _1521;
        _1095 = _1527;
    }
    float _1529 = _1095;
    float _1531 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1533 = _1501 + _1531;
    if (!_1069)
    {
        _1097 = _1063;
    }
    float _1535 = _1097;
    float _1537 = _1535;
    if (_1069)
    {
        float _1539 = _1507 * _1507;
        _1537 = _1539;
    }
    float _1541 = _1537;
    float _1543 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1511);
    float _1545 = fma(_1533, _1533, _1529);
    float _1547 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1509);
    float _1549 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1525);
    float _1551 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1463);
    float _1553 = _1457 * _1489;
    float _1555 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1481);
    float _1557 = _1457 * _1483;
    float _1559 = _1457 * _1491;
    float _1561 = _1457 * _1479;
    float _1563 = _1545 + _1541;
    float _1565 = -_1549;
    float _1567 = _1553 * _1565;
    float _1569 = fma(_1423, _1555, _1557);
    float _1571 = fma(_1423, _1547, _1559);
    float _1573 = fma(_1489, _1479, _1567);
    float _1575 = -_1543;
    float _1577 = _1553 * _1575;
    float _1579 = sqrt(_1563);
    float _1581 = fma(_1423, _1551, _1561);
    float _1583 = -_1523;
    float _1585 = _1553 * _1583;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1589 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1593 = fma(_1489, _1491, _1577);
    float _1595 = _1549 + _1581;
    float _1597 = fma(_1489, _1483, _1585);
    float _1599 = _1587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1601 = _1589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1603 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1605 = _1451 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1607 = _1523 + _1569;
    float _1609 = _1543 + _1571;
    out.m_84.x = _1551;
    out.m_84.y = _1555;
    out.m_84.z = _1547;
    bool _1611 = _1579 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1613 = isnan(_1579);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1619 = _1615 || _1617;
    out.m_86.x = _1599;
    out.m_86.y = _1601;
    out.m_86.z = _1603;
    out.m_86.w = _1605;
    out.m_88.x = _1573;
    out.m_88.y = _1597;
    out.m_88.z = _1593;
    out.m_90.x = _1595;
    out.m_90.y = _1607;
    out.m_90.z = _1609;
    if (!_1619)
    {
        _685 = 1.0;
    }
    float _1621 = _685;
    out.m_92.x = _1169;
    out.m_92.y = _1171;
    out.m_92.z = _1173;
    bool _1623 = !_1619;
    float _1625 = _1621;
    if (!_1623)
    {
        bool _1627 = _1579 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1629 = isnan(_1579);
        bool _1631 = _1627 || _1629;
        bool _1633 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1635 = _1631 || _1633;
        if (!_1635)
        {
            float _1637 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1639 = _1579 + _1637;
            float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1643 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1641;
            float _1645 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1647 = _1645 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1649 = 1.0 / _1643;
            float _1651 = _1639 * _1649;
            float _1653 = fma(_1651, _1647, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1625 = _1653;
            _1655 = true;
        }
        else
        {
            bool _1657 = _1579 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1659 = isnan(_1579);
            bool _1661 = _1657 || _1659;
            bool _1663 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1665 = _1661 || _1663;
            if (!_1665)
            {
                float _1667 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1669 = _1579 + _1667;
                float _1671 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1673 = _1671 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1675 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1677 = _1675 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1679 = 1.0 / _1673;
                float _1681 = _1669 * _1679;
                float _1683 = fma(_1681, _1677, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1625 = _1683;
                _1655 = true;
            }
            else
            {
                _1625 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1655 = false;
    float _1685 = _1625;
    float _1687 = fma(_1037, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1689 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1691 = floor(_1687);
    float _1693 = floor(_1689);
    float _1695 = -_1691;
    float _1697 = _1687 + _1695;
    float _1699 = -_1693;
    float _1701 = _1689 + _1699;
    float2 _5825 = float2(_1697, _1701);
    float _1703 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5825, float2(0.0), isnan(_5825)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5825, float2(0.0), isnan(_5825)), level(0.0)).x;
    float _1705 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1707 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1709 = _1501 + _1707;
    float _1711 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1705);
    float _1713 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1715 = _1155 + _1713;
    float _1717 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1711);
    float _1719 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1721 = fma(_1715, _1685, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1723 = _1717 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1725 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1719);
    float _1727 = -_1037;
    float _1729 = _1727 + _1721;
    float _1731 = 1.0 / _1723;
    float _1733 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1725);
    float _1735 = _1733 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1737 = _1735 + _1723;
    float _1739 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1741 = _1079 + _1739;
    float _1743 = _1737 * _1731;
    float _1745 = _1743 * 0.5;
    float _1747 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1749 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1751 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1749);
    float _1753 = fma(_1037, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1747);
    float _1755 = 1.0 / _1751;
    float _1757 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1753);
    float _1759 = _1757 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1761 = trunc(_1759);
    int _1763 = int(_1761);
    float _1765 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1767 = _1755 * _1765;
    float _1769 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1771 = _1767 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1773 = fma(_1037, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1769);
    bool _1775 = _1767 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1777 = !_1771;
    int _1779 = _1777 ? 0 : 1;
    float _1781 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1773);
    int _1783 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1785 = _1763 + _1783;
    int _1787 = _1785 + 1;
    float _1789 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1791 = 2;
    float _1793 = _1721;
    float _1795 = _1759;
    if (!_1771)
    {
        _1791 = 1;
    }
    int _1797 = _1791;
    float _1799 = trunc(_1789);
    int _1801 = int(_1799);
    int _1803 = _1797;
    if (!_1775)
    {
        _1803 = _1779;
    }
    int _1805 = _1803;
    float _1807 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1809 = _1159 + _1807;
    float _1811 = fma(_1709, _1685, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1813 = _1787 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1815 = _1805 << 6;
    float _1817 = fma(_1809, _1685, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1819 = -_1079;
    float _1821 = _1819 + _1811;
    int _1823 = _1815 + 96;
    uint _1826 = uint(int(uint(_1823) >> uint(2)));
    uint _1828 = uint(int(uint(int(_1826)) >> uint(2)));
    int _1830 = int(_1826) & 3;
    float _1832 = (*spvDescriptorSet0.vp_c15)._m0[int(_1828)][_1830];
    int _1834 = int(_1826) + 1;
    uint _1836 = uint(int(uint(_1834) >> uint(2)));
    int _1838 = _1834 & 3;
    float _1840 = (*spvDescriptorSet0.vp_c15)._m0[int(_1836)][_1838];
    float _1842 = -_1035;
    float _1844 = _1842 + _1817;
    float _1846 = _1821 * _1821;
    int _1848 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1850 = _1801 + _1848;
    int _1852 = _1850 + 1;
    float _1854 = fma(_1729, _1729, _1846);
    int _1856 = _1815 + 104;
    uint _1858 = uint(int(uint(_1856) >> uint(2)));
    uint _1860 = uint(int(uint(int(_1858)) >> uint(2)));
    int _1862 = int(_1858) & 3;
    float _1864 = (*spvDescriptorSet0.vp_c15)._m0[int(_1860)][_1862];
    int _1866 = int(_1858) + 1;
    uint _1868 = uint(int(uint(_1866) >> uint(2)));
    int _1870 = _1866 & 3;
    float _1872 = (*spvDescriptorSet0.vp_c15)._m0[int(_1868)][_1870];
    int _1874 = _1787 | _1852;
    float _1876 = fma(_1844, _1844, _1854);
    bool _1878 = _1874 < 0;
    bool _1880 = _1878 || _1813;
    int _1882 = _1815 + 48;
    uint _1884 = uint(int(uint(_1882) >> uint(2)));
    uint _1886 = uint(int(uint(int(_1884)) >> uint(2)));
    int _1888 = int(_1884) & 3;
    float _1890 = (*spvDescriptorSet0.vp_c15)._m0[int(_1886)][_1888];
    int _1892 = int(_1884) + 1;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    int _1896 = _1892 & 3;
    float _1898 = (*spvDescriptorSet0.vp_c15)._m0[int(_1894)][_1896];
    float _1900 = sqrt(_1876);
    bool _1902 = _1852 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1904 = _1902 || _1880;
    int _1906 = _1815 + 64;
    uint _1908 = uint(int(uint(_1906) >> uint(2)));
    uint _1910 = uint(int(uint(int(_1908)) >> uint(2)));
    int _1912 = int(_1908) & 3;
    float _1914 = (*spvDescriptorSet0.vp_c15)._m0[int(_1910)][_1912];
    int _1916 = int(_1908) + 1;
    uint _1918 = uint(int(uint(_1916) >> uint(2)));
    int _1920 = _1916 & 3;
    float _1922 = (*spvDescriptorSet0.vp_c15)._m0[int(_1918)][_1920];
    int _1924 = _1815 + 56;
    uint _1926 = uint(int(uint(_1924) >> uint(2)));
    uint _1928 = uint(int(uint(int(_1926)) >> uint(2)));
    int _1930 = int(_1926) & 3;
    float _1932 = (*spvDescriptorSet0.vp_c15)._m0[int(_1928)][_1930];
    int _1934 = int(_1926) + 1;
    uint _1936 = uint(int(uint(_1934) >> uint(2)));
    int _1938 = _1934 & 3;
    float _1940 = (*spvDescriptorSet0.vp_c15)._m0[int(_1936)][_1938];
    bool _1942 = _1900 > 0.0;
    int _1944 = _1815 + 72;
    uint _1946 = uint(int(uint(_1944) >> uint(2)));
    uint _1948 = uint(int(uint(int(_1946)) >> uint(2)));
    int _1950 = int(_1946) & 3;
    float _1952 = (*spvDescriptorSet0.vp_c15)._m0[int(_1948)][_1950];
    int _1954 = int(_1946) + 1;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    int _1958 = _1954 & 3;
    float _1960 = (*spvDescriptorSet0.vp_c15)._m0[int(_1956)][_1958];
    int _1962 = _1815 + 80;
    uint _1964 = uint(int(uint(_1962) >> uint(2)));
    uint _1966 = uint(int(uint(int(_1964)) >> uint(2)));
    int _1968 = int(_1964) & 3;
    float _1970 = (*spvDescriptorSet0.vp_c15)._m0[int(_1966)][_1968];
    int _1972 = int(_1964) + 1;
    uint _1974 = uint(int(uint(_1972) >> uint(2)));
    int _1976 = _1972 & 3;
    float _1978 = (*spvDescriptorSet0.vp_c15)._m0[int(_1974)][_1976];
    float _1980 = _1741 * _1840;
    float _1982 = _1840;
    float _1984 = _1811;
    float _1986 = _1821;
    float _1988 = _1844;
    float _1990 = _1846;
    int _1992 = as_type<int>(_1817);
    if (!_1904)
    {
        float _1994 = floor(_1759);
        _1982 = _1994;
    }
    float _1996 = _1982;
    float _1998 = fma(_1037, _1832, _1980);
    float _2000 = fma(_1035, _1864, _1998);
    int _2002 = as_type<int>(_1998);
    int _2004 = as_type<int>(_1872);
    if (!_1904)
    {
        int _2006 = _1852 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2008 = _2006 + _1787;
        _2002 = _2008;
    }
    int _2010 = _2002;
    float _2012 = _1741 * _1898;
    float _2014 = _2000 + _1872;
    int _2016 = as_type<int>(_1914);
    if (!_1904)
    {
        int _2018 = _2010 << 2;
        _2004 = _2018;
    }
    int _2020 = _2004;
    float _2022 = fma(_1037, _1890, _2012);
    int _2024 = _2020;
    float _2026 = _2022;
    if (!_1904)
    {
        int _2028 = 12 & _2020;
        _2024 = _2028;
    }
    int _2030 = _2024;
    float _2032 = 1.0 / _2014;
    float _2034 = _1741 * _1922;
    float _2036 = fma(_1037, _1914, _2034);
    if (!_1904)
    {
        uint _2038 = uint(int(uint(_2010) >> uint(2)));
        _2016 = int(_2038);
    }
    int _2040 = _2016;
    float _2042 = fma(_1035, _1932, _2022);
    if (!_1942)
    {
        _2026 = _1817;
    }
    float _2044 = _2026;
    float _2046 = fma(_1035, _1952, _2036);
    bool _2048 = !_1942;
    float _2050 = _2044;
    float _2052 = _2044;
    float _2054 = _1978;
    if (!_2048)
    {
        float _2056 = _199 * _199;
        float _2058 = fma(_197, _197, _2056);
        float _2060 = fma(_201, _201, _2058);
        float _2062 = rsqrt(_1876);
        float _2064 = sqrt(_2060);
        float _2066 = _1729 * _2062;
        float _2068 = _1821 * _2062;
        float _2070 = _1844 * _2062;
        bool _2072 = _2064 > 0.0;
        _1990 = _2068;
        if (!_2072)
        {
            _2050 = _1817;
        }
        float _2074 = _2050;
        bool _2076 = !_2072;
        _2052 = _2074;
        if (!_2076)
        {
            float _2078 = rsqrt(_2060);
            float _2080 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2082 = _199 * _2078;
            float _2084 = _197 * _2078;
            float _2086 = _2068 * _2082;
            float _2088 = _201 * _2078;
            float _2090 = fma(_2066, _2084, _2086);
            float _2092 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2094 = fma(_2070, _2088, _2090);
            float _2096 = _2094 * _2092;
            float _2098 = fma(_197, _2096, _1721);
            float _2100 = fma(_199, _2096, _1811);
            float _2102 = fma(_201, _2096, _1817);
            _1984 = _2100;
            _1793 = _2098;
            _2052 = _2102;
            _1986 = _2080;
            _1988 = _2092;
        }
    }
    float _2104 = _1984;
    float _2106 = _1793;
    float _2108 = _2052;
    float _2110 = _1986;
    float _2112 = _1988;
    float _2114 = _1990;
    float _2116 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2118 = _2112;
    float _2120 = _2114;
    if (!_1904)
    {
        int _2122 = _2040 << 4;
        int _2124 = _2122 + _2030;
        _1992 = _2124;
    }
    int _2126 = _1992;
    float _2128 = _2046 + _1960;
    float _2130 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _2132 = _1815 + 88;
    uint _2134 = uint(int(uint(_2132) >> uint(2)));
    uint _2136 = uint(int(uint(int(_2134)) >> uint(2)));
    int _2138 = int(_2134) & 3;
    float _2140 = (*spvDescriptorSet0.vp_c15)._m0[int(_2136)][_2138];
    int _2142 = int(_2134) + 1;
    uint _2144 = uint(int(uint(_2142) >> uint(2)));
    int _2146 = _2142 & 3;
    float _2148 = (*spvDescriptorSet0.vp_c15)._m0[int(_2144)][_2146];
    float _2150 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2116);
    float _2152 = _2042 + _1940;
    float _2154 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2156 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2130);
    float _2158 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2160 = _2152 * _2032;
    float _2162 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2154);
    float _2164 = _2116;
    if (!_1904)
    {
        int _2166 = _2126 + 400;
        uint _2168 = uint(int(uint(_2166) >> uint(2)));
        uint _2170 = uint(int(uint(int(_2168)) >> uint(2)));
        int _2172 = int(_2168) & 3;
        float _2174 = (*spvDescriptorSet0.vp_c15)._m0[int(_2170)][_2172];
        _2164 = _2174;
    }
    float _2176 = _2164;
    float _2178 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2156);
    float _2180 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2158);
    bool _2182 = _2160 >= 0.0;
    float _2184 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2162);
    float _2186 = _2178 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2188 = _2128 * _2032;
    float _2190 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2150);
    bool _2192 = _2160 <= 1.0;
    bool _2194 = _2192 && _2182;
    float _2196 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2198 = _2186 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2200 = _2190 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2202 = _2188 >= 0.0;
    bool _2204 = _2202 && _2194;
    float _2206 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2180);
    float _2208 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2198);
    float _2210 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2212 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2214 = _2188 <= 1.0;
    bool _2216 = _2214 && _2204;
    float _2218 = _2206 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2220 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2208);
    float _2222 = -_2212;
    float _2224 = fma(_2222, _2210, 1.0);
    float _2226 = _2110;
    float _2228 = _2188;
    float _2230 = _2200;
    if (!_1904)
    {
        float _2232 = floor(_1789);
        _2226 = _2232;
    }
    float _2234 = _2226;
    float _2236 = _2186 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2238 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2220);
    float _2240 = _2186 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2242 = _1741 * _1978;
    float _2244 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2236);
    if (!_1904)
    {
        float _2246 = -_1996;
        float _2248 = _1759 + _2246;
        _2118 = _2248;
    }
    float _2250 = _2118;
    float _2252 = log2(_2224);
    if (_2216)
    {
        float _2254 = float(_1805);
        _2054 = _2254;
    }
    float _2256 = _2054;
    float _2258 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2240);
    float _2260 = fma(_1037, _1970, _2242);
    float _2262 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2244);
    float _2264 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2258);
    float _2266 = 1.0 / _2238;
    float _2268 = _2234;
    if (!_1904)
    {
        float _2270 = -_2234;
        float _2272 = _1789 + _2270;
        _2268 = _2272;
    }
    float _2274 = _2268;
    float _2276 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2262);
    float _2278 = fma(_1035, _2140, _2260);
    float _2280 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2264);
    float _2282 = _2278 + _2148;
    float _2284 = _2244;
    float _2286 = _2280;
    if (_2216)
    {
        float _2288 = rint(_2256);
        float _2290 = precise::max(_2288, 0.0);
        uint _2292 = uint(_2290);
        uint _2294 = clamp(_2292, 0u, 65535u);
        _2284 = as_type<float>(_2294);
    }
    float _2296 = _2284;
    float _2298 = _2252 * 0.693147182464599609375;
    float _2300 = _2282 * _2032;
    float _2302 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2304 = _2260;
    if (!_1904)
    {
        float _2306 = rint(_2176);
        float _2308 = precise::max(_2306, 0.0);
        uint _2310 = uint(_2308);
        uint _2312 = clamp(_2310, 0u, 65535u);
        _2304 = as_type<float>(_2312);
    }
    float _2314 = _2304;
    float _2316 = _2276 * _2266;
    float _2318 = _2280 * _2266;
    float _2320 = fma(_2316, 0.5, 0.5);
    float _2322 = fma(_2318, -0.5, 0.5);
    float _2324 = _2296;
    float _2326 = _2320;
    if (_2216)
    {
        float3 _6869 = float3(_2160, _2188, float(as_type<int>(_2296)));
        float3 _6873 = select(_6869, float3(0.0), isnan(_6869));
        float _2328 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6873.xy, uint(rint(_6873.z)), _2300, level(0.0));
        _2324 = _2328;
    }
    float _2330 = _2324;
    float3 _6883 = float3(_2320, _2322, _2302);
    float _2332 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6883, float3(0.0), isnan(_6883)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6883, float3(0.0), isnan(_6883)), level(0.0)).x;
    float3 _6892 = float3(_2320, _2322, _2302);
    float4 _2335 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6892, float3(0.0), isnan(_6892)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6892, float3(0.0), isnan(_6892)), level(0.0)).xyzw;
    float _2337 = _2335.x;
    float _2339 = _2335.y;
    float _2341 = _2335.z;
    float _2343 = _2335.w;
    float _2345 = _2250;
    if (!_1904)
    {
        float3 _6915 = float3(_2250, _2274, float(as_type<int>(_2314)));
        float3 _6917 = select(_6915, float3(0.0), isnan(_6915));
        float _2347 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6917.xy, uint(rint(_6917.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6917.xy, uint(rint(_6917.z)), level(0.0)).x;
        _2345 = _2347;
    }
    float _2349 = _2345;
    if (_1904)
    {
        _1795 = 1.0;
    }
    float _2351 = _1795;
    float _2353 = _2351;
    float _2355 = _2339;
    float _2357 = _2337;
    if (!_1904)
    {
        int _2359 = _2010 << 4;
        int _2361 = _2359 + 2048;
        uint _2363 = uint(int(uint(_2361) >> uint(2)));
        uint _2365 = uint(int(uint(int(_2363)) >> uint(2)));
        int _2367 = int(_2363) & 3;
        float _2369 = (*spvDescriptorSet0.vp_c15)._m0[int(_2365)][_2367];
        int _2371 = int(_2363) + 1;
        uint _2373 = uint(int(uint(_2371) >> uint(2)));
        int _2375 = _2371 & 3;
        float _2377 = (*spvDescriptorSet0.vp_c15)._m0[int(_2373)][_2375];
        int _2379 = _2361 + 8;
        uint _2381 = uint(int(uint(_2379) >> uint(2)));
        uint _2383 = uint(int(uint(int(_2381)) >> uint(2)));
        int _2385 = int(_2381) & 3;
        float _2387 = (*spvDescriptorSet0.vp_c15)._m0[int(_2383)][_2385];
        int _2389 = int(_2381) + 1;
        uint _2391 = uint(int(uint(_2389) >> uint(2)));
        int _2393 = _2389 & 3;
        float _2395 = (*spvDescriptorSet0.vp_c15)._m0[int(_2391)][_2393];
        float _2397 = _1741 * _2377;
        float _2399 = fma(_1037, _2369, _2397);
        float _2401 = fma(_1035, _2387, _2399);
        float _2403 = _2401 + _2395;
        float _2405 = precise::clamp(_2403, 0.0, 1.0);
        float _2407 = -_2405;
        float _2409 = _2407 + _2349;
        float _2411 = fma(_2409, 500.0, 1.5);
        float _2413 = exp2(_2411);
        float _2415 = 0.0 + _2413;
        float _2417 = precise::clamp(_2415, 0.0, 1.0);
        _2326 = _2369;
        _2353 = _2417;
    }
    float _2419 = _2326;
    float _2421 = _2353;
    float _2423 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2425 = _2104 + _2423;
    float _2427 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2429 = _2106 + _2427;
    float _2431 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2433 = _2108 + _2431;
    float _2435 = _2425 * _2425;
    float _2437 = fma(_2429, _2429, _2435);
    float _2439 = fma(_2433, _2433, _2437);
    float _2441 = rsqrt(_2439);
    float _2443 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2445 = _2429 * _2443;
    float _2447 = _2433 * _2443;
    float _2449 = _2445 * _2445;
    float _2451 = _2447 * _2447;
    float _2453 = _2449 + _2451;
    float _2455 = sqrt(_2453);
    bool _2457 = _2455 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2461 = _2455 + _2459;
    float _2463 = _2433;
    float _2465 = _2461;
    float _2467 = _2435;
    float _2469 = _2425;
    float _2471 = _2419;
    if (_2457)
    {
        float _2473 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2463 = _2473;
    }
    float _2475 = _2463;
    if (_2457)
    {
        float _2477 = rsqrt(_2453);
        _2228 = _2477;
    }
    float _2479 = _2228;
    float _2481 = _2479;
    if (_2457)
    {
        float _2483 = _2461 * _2475;
        _2465 = _2483;
    }
    float _2485 = _2465;
    if (_2457)
    {
        float _2487 = _2485 * 0.15915493667125701904296875;
        _2467 = _2487;
    }
    float _2489 = _2467;
    float _2491 = _2441;
    float _2493 = _2489;
    if (_2457)
    {
        float _2495 = _2489 * 6.283185482025146484375;
        float _2497 = sin(_2495);
        _2491 = _2497;
    }
    float _2499 = _2491;
    float _2501 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2503 = precise::max(0.0, _2501);
    float _2505 = _2475;
    float _2507 = _2503;
    if (_2457)
    {
        float _2509 = _2489 * 6.283185482025146484375;
        float _2511 = cos(_2509);
        _2505 = _2511;
    }
    float _2513 = _2505;
    float _2515 = -_2443;
    float _2517 = -_2503;
    float _2519 = fma(_2425, _2515, _2517);
    if (_2457)
    {
        float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2469 = _2521;
    }
    float _2523 = _2469;
    float _2525 = _2523;
    if (!_2457)
    {
        _2493 = _2451;
    }
    float _2527 = _2493;
    float _2529 = _2499;
    float _2531 = _2527;
    if (_2457)
    {
        float _2533 = fma(_2499, _2523, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2525 = _2533;
    }
    float _2535 = _2525;
    float _2537 = _2535;
    if (!_2457)
    {
        _2529 = _2445;
    }
    float _2539 = _2529;
    float _2541 = _2539;
    if (_2457)
    {
        float _2543 = _2513 + (-1.0);
        _2507 = _2543;
    }
    float _2545 = _2507;
    float _2547 = _2545;
    if (_2457)
    {
        float _2549 = _2479 * _2535;
        _2120 = _2549;
    }
    float _2551 = _2120;
    if (!_2457)
    {
        _2537 = _2519;
    }
    float _2553 = _2537;
    float _2555 = _2553;
    if (_2457)
    {
        float _2557 = _2545 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2471 = _2557;
    }
    float _2559 = _2471;
    if (_2457)
    {
        float _2561 = _2445 * _2551;
        _2541 = _2561;
    }
    float _2563 = _2541;
    if (!_2457)
    {
        _2547 = _2447;
    }
    float _2565 = _2547;
    float _2567 = _2565;
    if (_2457)
    {
        float _2569 = _2447 * _2551;
        _2567 = _2569;
    }
    float _2571 = _2567;
    if (!_2457)
    {
        _2481 = _2449;
    }
    float _2573 = _2481;
    float _2575 = _2573;
    if (_2457)
    {
        float _2577 = fma(_2519, _2513, _2559);
        _2555 = _2577;
    }
    float _2579 = _2555;
    if (_2457)
    {
        float _2581 = _2563 * _2563;
        _2575 = _2581;
    }
    float _2583 = _2575;
    float _2585 = sqrt(_2439);
    if (_2457)
    {
        float _2587 = _2571 * _2571;
        _2531 = _2587;
    }
    float _2589 = _2531;
    float _2591 = fma(_2579, _2579, _2583);
    float _2593 = _2591 + _2589;
    float _2595 = rsqrt(_2593);
    float _2597 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2599 = fma(_2585, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2597);
    float _2601 = precise::clamp(_2599, 0.0, 1.0);
    float _2603 = -_2601;
    float _2605 = _2603 + 1.0;
    float _2607 = abs(_2605);
    float _2609 = log2(_2607);
    float _2611 = _2595 * _2563;
    float _2613 = _2595 * _2579;
    float _2615 = _2595 * _2571;
    float _2617 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2619 = -_2617;
    float _2621 = fma(_2613, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2619);
    float _2623 = -_2615;
    float _2625 = fma(_2623, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2621);
    float _2627 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2629 = fma(_2625, -0.5, 0.5);
    float _2631 = fma(_2625, 0.5, 0.5);
    float _2633 = exp2(_2627);
    float _2635 = fma(_2631, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2637 = fma(_2631, _2635, -0.212114393711090087890625);
    float _2639 = _2613 + 1.0;
    float _2641 = sqrt(_2629);
    float _2643 = fma(_2631, _2637, 1.570728778839111328125);
    float _2645 = -_2613;
    float _2647 = fma(_2633, _2639, _2645);
    float _2649 = fma(_2647, 0.5, 0.5);
    float _2651 = _2641 * 0.636619746685028076171875;
    float _2653 = -_2643;
    float _2655 = fma(_2651, _2653, 1.0);
    float2 _7393 = float2(_2655, _2649);
    float3 _2657 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7393, float2(0.0), isnan(_7393)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7393, float2(0.0), isnan(_7393)), level(0.0)).xyz;
    float _2659 = _2657.x;
    float _2661 = _2657.y;
    float _2663 = _2657.z;
    float _2665 = abs(_1767);
    float _2667 = log2(_2665);
    float _2669 = -_1703;
    float _2671 = _2669 + 1.0;
    bool _2673 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2675 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2677 = _2673 || _2675;
    bool _2679 = isnan(0.5);
    bool _2681 = _2677 || _2679;
    float _2683 = _2667 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2685 = _2186 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2687 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2685);
    float _2689 = exp2(_2683);
    float _2691 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_2681)
    {
        _2691 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2693 = _2691;
    float _2695 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2687);
    float _2697 = _2693;
    if (_2681)
    {
        _2230 = 1.0;
    }
    float _2699 = _2230;
    float _2701 = _2699;
    if (!_2681)
    {
        float _2703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2705 = _2693 + _2703;
        _2697 = _2705;
    }
    float _2707 = _2697;
    float _2709 = _2519;
    if (!_2681)
    {
        float _2711 = 1.0 / _2707;
        _2709 = _2711;
    }
    float _2713 = _2709;
    float _2715 = fma(_2689, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2717 = precise::clamp(_2715, 0.0, 1.0);
    float _2719 = fma(_2717, -2.0, 3.0);
    float _2721 = _2717 * _2717;
    float _2723 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2725 = _2721 * _2719;
    float _2727 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2695);
    float _2729 = exp2(_2723);
    float _2731 = -_2725;
    float _2733 = _2731 + 1.0;
    float _2735 = _2727 + _2238;
    out.gl_Position.x = _2276;
    out.gl_Position.y = _2280;
    out.gl_Position.z = _2727;
    out.gl_Position.w = _2238;
    float _2737 = fma(_2733, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2725);
    float _2739 = _2733;
    float _2741 = _2735;
    float _2743 = _2276;
    if (!_2681)
    {
        float _2745 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2747 = _1767 + _2745;
        _2739 = _2747;
    }
    float _2749 = _2739;
    bool _2751 = _1767 <= 8000.0;
    bool _2753 = isnan(_1767);
    bool _2755 = _2751 || _2753;
    bool _2757 = isnan(8000.0);
    bool _2759 = _2755 || _2757;
    float _2761 = float(_2759);
    float _2763 = _2735 * 0.5;
    if (!_2216)
    {
        _2741 = 1.0;
    }
    float _2765 = _2741;
    float _2767 = _2765;
    if (!_2681)
    {
        float _2769 = _2749 * _2713;
        float _2771 = precise::clamp(_2769, 0.0, 1.0);
        _2701 = _2771;
    }
    float _2773 = _2701;
    if (_2216)
    {
        bool _2775 = _2330 >= _2300;
        bool _2777 = isnan(_2330);
        bool _2779 = _2775 || _2777;
        bool _2781 = isnan(_2300);
        bool _2783 = _2779 || _2781;
        float _2785 = float(_2783);
        _2767 = _2785;
    }
    float _2787 = _2767;
    float _2789 = _2761 * _2737;
    bool _2791 = _2585 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2793 = isnan(_2585);
    bool _2795 = _2791 || _2793;
    bool _2797 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2799 = _2795 || _2797;
    float _2801 = _2789 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2803 = -_2729;
    float _2805 = _2803 + 1.0;
    float _2807 = _2787 * _2421;
    out.m_94.z = _2763;
    out.m_94.w = _2238;
    float _2809 = _2671 * _2801;
    float _2811 = precise::clamp(_2809, 0.0, 1.0);
    float _2813 = _2805 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2815 = _2773 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2817 = -_2811;
    float _2819 = fma(_2817, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2821 = _2813 * _2332;
    float _2823 = -_2813;
    float _2825 = _2823 + 1.0;
    float _2827 = -_2807;
    float _2829 = fma(_2827, _2819, 1.0);
    float _2831 = precise::clamp(_2829, 0.0, 1.0);
    float _2833 = _2343 * _2821;
    float _2835 = _2343 * _2825;
    float _2837 = _2831;
    float _2839 = _2833;
    if (!_2799)
    {
        _2286 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2841 = _2286;
    float _2843 = _2831 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2845 = _2841;
    float _2847 = _2841;
    if (!_2799)
    {
        _2743 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2849 = _2743;
    float _2851 = _2849;
    float _2853 = _2849;
    if (!_2799)
    {
        _2837 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2855 = _2837;
    out.m_96.x = _2843;
    float _2857 = _2663 * _2821;
    float _2859 = fma(_2659, _2833, _2337);
    float _2861 = fma(_2661, _2833, _2339);
    float _2863 = _2855;
    float _2865 = _2855;
    if (!_2799)
    {
        _2839 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2867 = _2839;
    float _2869 = fma(_2343, _2857, _2341);
    float _2871 = _2867;
    float _2873 = _2867;
    if (!_2799)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2875 = _2355;
    float _2877 = _2875;
    float _2879 = _2875;
    if (!_2799)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2881 = _2357;
    out.m_98.x = _2859;
    out.m_98.y = _2861;
    out.m_98.z = _2869;
    out.m_98.w = _2835;
    bool _2883 = !_2799;
    float _2885 = _2881;
    float _2887 = _2881;
    if (!_2883)
    {
        bool _2889 = _2585 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2891 = isnan(_2585);
        bool _2893 = _2889 || _2891;
        bool _2895 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2897 = _2893 || _2895;
        if (!_2897)
        {
            float _2899 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2901 = _2585 + _2899;
            float _2903 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2905 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2903;
            float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2911 = 1.0 / _2905;
            float _2913 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2915 = _2913 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2919 = _2917 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2923 = _2921 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2929 = _2901 * _2911;
            float _2931 = precise::clamp(_2929, 0.0, 1.0);
            float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2935 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2937 = fma(_2931, _2909, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2939 = fma(_2931, _2935, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2941 = fma(_2931, _2915, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2943 = fma(_2931, _2919, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2945 = fma(_2931, _2923, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2947 = fma(_2931, _2927, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2853 = _2941;
            _2879 = _2945;
            _2847 = _2937;
            _2865 = _2943;
            _2873 = _2939;
            _2887 = _2947;
            _2949 = true;
        }
        else
        {
            bool _2951 = _2585 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2953 = isnan(_2585);
            bool _2955 = _2951 || _2953;
            bool _2957 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2959 = _2955 || _2957;
            if (!_2959)
            {
                _2845 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2961 = _2845;
            _2847 = _2961;
            if (!_2959)
            {
                _2851 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2963 = _2851;
            _2853 = _2963;
            if (!_2959)
            {
                _2871 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2965 = _2871;
            _2873 = _2965;
            if (!_2959)
            {
                _2863 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2967 = _2863;
            _2865 = _2967;
            if (!_2959)
            {
                _2877 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2969 = _2877;
            _2879 = _2969;
            if (!_2959)
            {
                _2885 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2971 = _2885;
            bool _2973 = !_2959;
            _2887 = _2971;
            if (!_2973)
            {
                bool _2975 = _2585 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2977 = isnan(_2585);
                bool _2979 = _2975 || _2977;
                bool _2981 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2983 = _2979 || _2981;
                if (!_2983)
                {
                    float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2987 = _2585 + _2985;
                    float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2991 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2989;
                    float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2997 = 1.0 / _2991;
                    float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3013 = _3011 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3015 = _2987 * _2997;
                    float _3017 = precise::clamp(_3015, 0.0, 1.0);
                    float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3023 = fma(_3017, _2995, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3025 = fma(_3017, _3021, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3027 = fma(_3017, _3001, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3029 = fma(_3017, _3005, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3031 = fma(_3017, _3009, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3033 = fma(_3017, _3013, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2853 = _3027;
                    _2879 = _3031;
                    _2847 = _3023;
                    _2865 = _3029;
                    _2873 = _3025;
                    _2887 = _3033;
                    _2949 = true;
                }
                else
                {
                    _2853 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2879 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2847 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2865 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2873 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2887 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2949 = false;
    float _3035 = _2853;
    float _3037 = _2879;
    float _3039 = _2847;
    float _3041 = _2865;
    float _3043 = _2873;
    float _3045 = _2887;
    float _3047 = _2815 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3049 = fma(_1607, -0.5, 0.5);
    float _3051 = precise::clamp(_3049, 0.0, 1.0);
    float _3053 = -_3035;
    float _3055 = _3053 + _3037;
    float _3057 = -_3039;
    float _3059 = _3057 + _3041;
    out.m_100.x = 0.0;
    float _3061 = fma(_3051, _3055, _3035);
    float _3063 = -_3043;
    float _3065 = _3063 + _3045;
    float _3067 = fma(_3051, _3059, _3039);
    float _3069 = _3061 * 0.586610972881317138671875;
    bool _3071 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3073 = fma(_3051, _3065, _3043);
    out.m_63.x = _3047;
    float _3075 = fma(_3067, 0.298911988735198974609375, _3069);
    bool _3077 = _2773 > 0.0;
    bool _3079 = isnan(_2773);
    bool _3081 = _3077 || _3079;
    bool _3083 = isnan(0.0);
    bool _3085 = _3081 || _3083;
    float _3087 = fma(_3073, 0.114477999508380889892578125, _3075);
    float _3089 = -_3087;
    float _3091 = _3067 + _3089;
    float _3093 = -_3087;
    float _3095 = _3061 + _3093;
    float _3097 = -_3087;
    float _3099 = _3073 + _3097;
    float _3101 = fma(_3091, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3087);
    float _3103 = fma(_3095, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3087);
    float _3105 = fma(_3099, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3087);
    bool _3107 = !_3071;
    if (!_3107)
    {
        float _3109 = -_2104;
        float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3113 = -_2106;
        float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3117 = -_2108;
        float _3119 = _3117 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3121 = _3111 * _3111;
        float _3123 = fma(_3115, _3115, _3121);
        float _3125 = fma(_3119, _3119, _3123);
        float _3127 = sqrt(_3125);
        float _3129 = rsqrt(_3125);
        float _3131 = -_3127;
        float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3135 = _3133 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3137 = precise::clamp(_3135, 0.0, 1.0);
        float _3139 = _3115 * _3129;
        float _3141 = _3111 * _3129;
        float _3143 = abs(_3137);
        float _3145 = log2(_3143);
        float _3147 = _3119 * _3129;
        float _3149 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3151 = _1607 * _3141;
        float _3153 = -_3141;
        float _3155 = -_3149;
        float _3157 = fma(_3153, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3155);
        float _3159 = fma(_1595, _3139, _3151);
        float _3161 = -_3147;
        float _3163 = fma(_3161, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3157);
        float _3165 = fma(_1609, _3147, _3159);
        float _3167 = precise::clamp(_3165, 0.0, 1.0);
        float _3169 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3171 = _3163 + _3169;
        float _3173 = _3145 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3175 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3177 = precise::clamp(_3175, 0.0, 1.0);
        float _3179 = exp2(_3173);
        float _3181 = _3179 * _3177;
        float _3183 = _3167 * _3181;
        float _3185 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3187 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3189 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _3185;
        out.m_100.y = _3187;
        out.m_100.z = _3189;
    }
    out.m_102.x = _3101;
    out.m_102.y = _3103;
    out.m_102.z = _3105;
    if (_3085)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_63.x = 0.0;
    float _3191 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3191;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

