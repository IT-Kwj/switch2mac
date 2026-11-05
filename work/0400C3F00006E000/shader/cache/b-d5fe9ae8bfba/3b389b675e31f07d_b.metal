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
    float4 m_72 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_88 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_98 [[user(locn6)]];
    float4 m_100 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_106 [[user(locn9)]];
    float4 m_104 [[user(locn10)]];
    float4 m_102 [[user(locn11)]];
    float4 m_59 [[user(locn12)]];
    float4 m_96 [[user(locn13)]];
    float4 m_112 [[user(locn14)]];
    float4 m_108 [[user(locn15)]];
    float4 m_110 [[user(locn16)]];
    float4 m_84 [[user(locn17)]];
    float4 m_90 [[user(locn18)]];
    float4 m_86 [[user(locn19)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(1)]];
    float4 m_78 [[attribute(2)]];
    float4 m_80 [[attribute(3)]];
    float4 m_94 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_68 [[attribute(7)]];
    float4 m_70 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_112 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3997 = false;
    bool _1263 = false;
    bool _939 = false;
    bool _803 = false;
    bool _425 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _126 = in.m_56.w;
    float _128 = trunc(_126);
    int _131 = int(_128);
    bool _135 = _131 >= 1;
    float _137 = 0.0;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (!_135)
    {
        out.m_59.x = 0.0;
    }
    int _141 = 0;
    if (!_135)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4295 = as_type<float>(_145);
        out.gl_Position.z = _4295;
    }
    if (!_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _149 = in.m_61.w;
    float _151 = float(_131);
    float _153 = 1.0 / _151;
    float _155 = -_149;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _159 = _149 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _161 = isnan(_149);
    bool _163 = _159 || _161;
    bool _165 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _167 = _163 || _165;
    float _169 = _157 * _153;
    bool _171 = _157 >= _151;
    bool _173 = !_167;
    bool _175 = _171 || _173;
    out.m_63.x = _169;
    float _177 = 0.0;
    float _179 = _169;
    float _181 = _157;
    if (_175)
    {
        _177 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _183 = _177;
    if (_175)
    {
        out.m_59.x = 0.0;
    }
    if (_175)
    {
        float _185 = _183 * 5.0;
        _147 = as_type<int>(_185);
    }
    int _187 = _147;
    if (_175)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4367 = as_type<float>(_187);
        out.gl_Position.z = _4367;
    }
    if (_175)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _189 = as_type<float>(int(gl_VertexIndex));
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _193 = as_type<int>(_189) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_189) & 2;
    bool _199 = _197 != 0;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_199;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_191;
    float _227;
    if (!_209)
    {
        float _211 = in.m_68.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        _227 = _169;
    }
    _229 = false;
    float _231 = _227;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = _231 + _233;
    bool _237 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _239 = isnan(_231);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _253 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _257;
    float _261 = 1.0 / _251;
    float _263 = -_247;
    float _265 = _263 + 1.0;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _269 = 1.0 / _259;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _271;
    float _275 = 1.0 / _255;
    float _277 = _235 * _261;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = _231 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _231 + _283;
    float _287 = fma(_273, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _289 = _281 * _269;
    bool _291 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _293 = isnan(_231);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = _301 * _265;
    bool _305 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _307 = isnan(_231);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = _285 * _275;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _319;
    bool _323 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_231);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _339 = -_301;
    float _341 = _339 + 1.0;
    float _343 = fma(_321, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = -_333;
    float _351 = _349 + 1.0;
    float _353 = _333 * _341;
    float _355 = fma(_347, _317, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _357 = _315 * _351;
    float _359 = in.m_70.x;
    float _361 = in.m_70.y;
    float _363 = -_315;
    float _365 = _363 + 1.0;
    float _367 = fma(_337, _317, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = _287 * _357;
    float _371 = _343 * _357;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _377;
    float _381 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _383 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _385 = fma(_375, _289, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _387 = fma(_379, _289, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _389 = fma(_367, _353, _381);
    float _391 = fma(_355, _353, _383);
    float _393 = fma(_385, _303, _389);
    float _395 = fma(_387, _303, _391);
    float _397 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].x, _393);
    float _399 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].y, _395);
    float _401 = _397 * _359;
    float _403 = _399 * _361;
    bool _405 = !_267;
    float _423;
    if (!_405)
    {
        float _407 = in.m_68.x;
        float _409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _411 = _407 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[11].x, _157);
        float _415 = _413 * _409;
        float _417 = floor(_415);
        float _419 = -_417;
        float _421 = _415 + _419;
        _423 = _421;
        _425 = true;
    }
    else
    {
        _423 = _169;
    }
    _425 = false;
    float _427 = _423;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _445 = 1.0 / _431;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _455 = 1.0 / _435;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _459 = _427 + _457;
    bool _461 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _463 = isnan(_427);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    bool _473 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _475 = isnan(_427);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -_471;
    float _487 = _485 + 1.0;
    float _489 = 1.0 / _439;
    float _491 = _459 * _445;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _495 = _427 + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _499 = _427 + _497;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _503 = _427 + _501;
    bool _505 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _507 = 1.0 / _449;
    float _509 = _495 * _455;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _513 = _427 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _517 = _427 + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _519;
    float _523 = 1.0 / _453;
    float _525 = _499 * _489;
    bool _527 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _529 = isnan(_427);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = fma(_521, _491, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _541 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _543 = isnan(_427);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = 1.0 / _443;
    float _555 = _513 * _507;
    float _557 = -_537;
    float _559 = _557 + 1.0;
    float _561 = -_551;
    float _563 = _561 + 1.0;
    float _565 = _551 * _559;
    float _567 = _517 * _523;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _569;
    float _573 = fma(_571, _491, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _575 = _483 * _487;
    bool _577 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _579 = isnan(_427);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = _503 * _553;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _591;
    float _595 = -_483;
    float _597 = _595 + 1.0;
    float _599 = fma(_593, _491, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _601 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _603 = isnan(_427);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = _471 * _563;
    bool _615 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _617 = isnan(_427);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _639 = _611 * _597;
    float _641 = -_625;
    float _643 = _641 + 1.0;
    float _645 = -_611;
    float _647 = _645 + 1.0;
    float _649 = fma(_633, _509, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _651 = _587 * _643;
    float _653 = -_587;
    float _655 = _653 + 1.0;
    float _657 = fma(_629, _509, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _659 = fma(_637, _509, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _661 = _573 * _651;
    float _663 = _599 * _651;
    float _665 = _625 * _647;
    float _667 = _539 * _651;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _669;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _685 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[107].y, _661);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _691 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[107].x, _663);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _693;
    float _697 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[107].z, _667);
    float _699 = fma(_675, _589, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _701 = fma(_683, _589, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _703 = fma(_657, _665, _685);
    float _705 = fma(_671, _525, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _707 = fma(_689, _589, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _709 = fma(_649, _665, _691);
    float _711 = fma(_679, _525, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _713 = fma(_695, _525, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _715 = fma(_659, _665, _697);
    float _717 = fma(_705, _639, _709);
    float _719 = fma(_711, _639, _703);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _721;
    float _725 = fma(_713, _639, _715);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _731;
    float _735 = fma(_723, _555, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _737 = fma(_699, _575, _717);
    float _739 = fma(_701, _575, _719);
    float _741 = fma(_707, _575, _725);
    float _743 = fma(_729, _555, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _753 = fma(_733, _555, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _759 = fma(_747, _567, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _761 = fma(_751, _567, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _763 = fma(_735, _613, _737);
    float _765 = fma(_757, _567, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _767 = fma(_743, _613, _739);
    float _769 = fma(_753, _613, _741);
    float _771 = fma(_759, _565, _763);
    float _773 = fma(_761, _565, _767);
    float _775 = fma(_765, _565, _769);
    float _777 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[113].x, _771);
    float _779 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[113].y, _773);
    float _781 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[113].z, _775);
    bool _783 = !_505;
    float _801;
    if (!_783)
    {
        float _785 = in.m_68.x;
        float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _789 = _785 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _791 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[11].y, _157);
        float _793 = _791 * _787;
        float _795 = floor(_793);
        float _797 = -_795;
        float _799 = _793 + _797;
        _801 = _799;
        _803 = true;
    }
    else
    {
        _801 = _169;
    }
    _803 = false;
    float _805 = _801;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _809 = _805 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _815 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _817 = isnan(_805);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _831 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _833 = isnan(_805);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _843;
    bool _847 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _849 = isnan(_805);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = 1.0 / _813;
    float _861 = -_825;
    float _863 = _861 + 1.0;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _867 = _805 + _865;
    bool _869 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _871 = _841 * _863;
    float _873 = -_841;
    float _875 = _873 + 1.0;
    float _877 = 1.0 / _829;
    float _879 = _845 * _859;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _885 = fma(_879, _809, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _887 = _883 * _877;
    float _889 = -_857;
    float _891 = _889 + 1.0;
    float _893 = _885 * _871;
    float _895 = _779 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _897 = fma(_887, _867, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _899 = _825 * _891;
    float _901 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[115].x, _893);
    float _903 = _781 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _905 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = fma(_897, _899, _901);
    float _909 = _777 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _911 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[117].x, _907);
    float _913 = _909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _915 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _917 = _911 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _913;
    out.m_72.y = _905;
    out.m_72.z = _915;
    out.m_72.w = _917;
    bool _919 = !_869;
    float _937;
    if (!_919)
    {
        float _921 = in.m_68.x;
        float _923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _925 = _921 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[11].z, _157);
        float _929 = _927 * _923;
        float _931 = floor(_929);
        float _933 = -_931;
        float _935 = _929 + _933;
        _937 = _935;
        _939 = true;
    }
    else
    {
        _937 = _169;
    }
    _939 = false;
    float _941 = _937;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _945 = _941 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _947;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _953 = _951 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _955;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _963 = 1.0 / _949;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _965;
    float _969 = 1.0 / _957;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _973 = _941 + _971;
    bool _975 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _977 = isnan(_941);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    float _987 = 1.0 / _953;
    float _989 = _973 * _963;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _993 = _941 + _991;
    bool _995 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _997 = isnan(_941);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1007;
    bool _1011 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1013 = 1.0 / _967;
    float _1015 = _993 * _969;
    bool _1017 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1019 = isnan(_941);
    bool _1021 = _1017 || _1019;
    bool _1023 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1025 = _1021 || _1023;
    float _1027 = float(_1025);
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1031 = _941 + _1029;
    bool _1033 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1035 = isnan(_941);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    float _1045 = -_1005;
    float _1047 = _1045 + 1.0;
    float _1049 = fma(_1009, _989, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1051 = 1.0 / _961;
    float _1053 = _945 * _987;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1057 = _941 + _1055;
    float _1059 = -_1027;
    float _1061 = _1059 + 1.0;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1063;
    float _1067 = -_1043;
    float _1069 = _1067 + 1.0;
    float _1071 = _1057 * _1013;
    bool _1073 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1075 = isnan(_941);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = fma(_1065, _989, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1087 = _985 * _1069;
    float _1089 = -_985;
    float _1091 = _1089 + 1.0;
    float _1093 = _1031 * _1051;
    float _1095 = _1005 * _1061;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1097;
    float _1101 = _1083 * _1047;
    float _1103 = -_1083;
    float _1105 = _1103 + 1.0;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1109 = _1107 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1111 = fma(_1099, _989, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1113 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1115 = isnan(_941);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1121 = _1117 || _1119;
    float _1123 = float(_1121);
    float _1125 = _1043 * _1105;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1135 = fma(_1109, _1053, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1137 = _1123 * _1091;
    float _1139 = fma(_1129, _1053, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1141 = fma(_1133, _1053, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1143 = _1111 * _1137;
    float _1145 = -_1123;
    float _1147 = _1145 + 1.0;
    float _1149 = _1085 * _1137;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1151;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1155;
    float _1159 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1143);
    float _1161 = _1049 * _1137;
    float _1163 = fma(_1153, _1015, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1165 = fma(_1157, _1015, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1169 = _1167 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1171 = fma(_1139, _1087, _1159);
    float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1173;
    float _1177 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1149);
    float _1179 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1161);
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1185 = fma(_1169, _1093, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1187 = fma(_1165, _1125, _1171);
    float _1189 = fma(_1175, _1015, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1191 = fma(_1141, _1087, _1177);
    float _1193 = fma(_1135, _1087, _1179);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1197 = _1195 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1199 = fma(_1183, _1093, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1201 = fma(_1163, _1125, _1191);
    float _1203 = fma(_1189, _1125, _1193);
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1209;
    float _1213 = fma(_1197, _1093, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1215;
    float _1219 = fma(_1207, _1071, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1221 = fma(_1211, _1071, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1223 = fma(_1185, _1101, _1187);
    float _1225 = fma(_1217, _1071, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1227 = fma(_1199, _1101, _1201);
    float _1229 = fma(_1213, _1101, _1203);
    float _1231 = fma(_1219, _1095, _1223);
    float _1233 = fma(_1221, _1095, _1227);
    float _1235 = fma(_1225, _1095, _1229);
    float _1237 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1231);
    float _1239 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1233);
    float _1241 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1235);
    bool _1243 = !_1011;
    float _1261;
    if (!_1243)
    {
        float _1245 = in.m_68.x;
        float _1247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1249 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[11].w, _157);
        float _1253 = _1251 * _1247;
        float _1255 = floor(_1253);
        float _1257 = -_1255;
        float _1259 = _1253 + _1257;
        _1261 = _1259;
        _1263 = true;
    }
    else
    {
        _1261 = _169;
    }
    _1263 = false;
    float _1265 = _1261;
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1269 = _1265 + _1267;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1277 = _1275 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1279 = _1265 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1281 = isnan(_1265);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1287 = _1283 || _1285;
    float _1289 = float(_1287);
    float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1293 = _1291 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1295 = _1265 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1297 = isnan(_1265);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1303 = _1299 || _1301;
    float _1305 = float(_1303);
    float _1307 = 1.0 / _1273;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1309;
    float _1313 = -_1289;
    float _1315 = _1313 + 1.0;
    bool _1317 = _1265 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1319 = isnan(_1265);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1325 = _1321 || _1323;
    float _1327 = float(_1325);
    bool _1329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1331 = 1.0 / _1277;
    float _1333 = 1.0 / _1293;
    float _1335 = _1311 * _1307;
    float _1337 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1339 = _1337 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1341 = _1305 * _1315;
    float _1343 = -_1305;
    float _1345 = _1343 + 1.0;
    float _1347 = fma(_1335, _1269, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1349;
    float _1353 = _1327 * _1345;
    float _1355 = _1339 * _1331;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1359 = _1265 + _1357;
    bool _1361 = _1265 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1363 = isnan(_1265);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1369 = _1365 || _1367;
    float _1371 = float(_1369);
    float _1373 = _1347 * _1353;
    float _1375 = -_1327;
    float _1377 = _1375 + 1.0;
    float _1379 = fma(_1355, _1359, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1383 = _1265 + _1381;
    float _1385 = _1351 * _1333;
    float _1387 = -_1371;
    float _1389 = _1387 + 1.0;
    float _1391 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1373);
    float _1393 = fma(_1385, _1383, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1395 = _1289 * _1389;
    float _1397 = fma(_1379, _1341, _1391);
    float _1399 = _1239 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1401 = fma(_1393, _1395, _1397);
    float _1403 = _1237 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1405 = _1241 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1407 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1409 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1401);
    float _1411 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1413 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1415 = _1409 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _1411;
    out.m_74.y = _1407;
    out.m_74.z = _1413;
    out.m_74.w = _1415;
    bool _1417 = !_1329;
    if (!_1417)
    {
        float _1419 = in.m_68.x;
        float _1421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1423 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1425 = fma(_1423, (*spvDescriptorSet0.vp_c9)._m0[14].x, _157);
        float _1427 = _1425 * _1421;
        float _1429 = floor(_1427);
        float _1431 = -_1429;
        float _1433 = _1427 + _1431;
        _179 = _1433;
    }
    float _1435 = _179;
    float _1437 = in.m_68.x;
    float _1439 = in.m_68.y;
    float _1441 = in.m_68.z;
    float _1443 = in.m_68.w;
    float _1445 = in.m_56.x;
    float _1447 = in.m_56.y;
    float _1449 = in.m_56.z;
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1455 = in.m_76.x;
    float _1457 = in.m_76.y;
    float _1459 = in.m_76.z;
    float _1461 = in.m_76.w;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1465 = _1463 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1467 = 1.0 / _1453;
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1473 = in.m_78.x;
    float _1475 = in.m_78.y;
    float _1477 = in.m_78.z;
    float _1479 = in.m_78.w;
    float _1481 = in.m_80.x;
    float _1483 = in.m_80.y;
    float _1485 = in.m_80.z;
    float _1487 = in.m_80.w;
    float _1489 = 1.0 / _1471;
    float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1493 = _1491 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1495 = _1443 > 0.5;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1499 = _1497 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1501 = 1.0 / _1465;
    float _1503 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1505 = _1503 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1507 = _1437 > 0.5;
    bool _1509 = _1439 > 0.5;
    float _1511 = _1447 * _1457;
    float _1513 = -_207;
    int _1515 = _1495 ? as_type<int>(_1513) : as_type<int>(_207);
    float _1517 = 1.0 / _1505;
    float _1519 = _1447 * _1475;
    float _1521 = fma(_1445, _1455, _1511);
    bool _1523 = _1441 > 0.5;
    float _1525 = _1447 * _1483;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1529 = _1527 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1531 = fma(_1445, _1473, _1519);
    float _1533 = fma(_1445, _1481, _1525);
    float _1535 = fma(_1449, _1459, _1521);
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1537;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1543 = _1541 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1545 = fma(_1449, _1477, _1531);
    float _1547 = fma(_1449, _1485, _1533);
    float _1549 = 1.0 / _1529;
    float _1551 = _1543 * _1467;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1553;
    float _1557 = _1539 * _1489;
    float _1559 = _1545 + _1479;
    float _1561 = _1535 + _1461;
    float _1563 = _1555 * _1501;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1567 = _1435 + _1565;
    float _1569 = 1.0 / _1499;
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1573 = _1559 + _1571;
    float _1575 = fma(_1557, _1567, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1577 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1579 = isnan(_1435);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1585 = _1581 || _1583;
    float _1587 = float(_1585);
    float _1589 = _1547 + _1487;
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1591;
    bool _1595 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1597 = isnan(_1435);
    bool _1599 = _1595 || _1597;
    bool _1601 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1603 = _1599 || _1601;
    float _1605 = float(_1603);
    float _1607 = 1.0 / _1493;
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1611 = _1435 + _1609;
    float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1615 = _1435 + _1613;
    float _1617 = -_1587;
    float _1619 = _1617 + 1.0;
    float _1621 = fma(_1551, _1611, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1623 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1625 = isnan(_1435);
    bool _1627 = _1623 || _1625;
    bool _1629 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1631 = _1627 || _1629;
    float _1633 = float(_1631);
    float _1635 = _1573 * _1573;
    float _1637 = _1593 * _1569;
    float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1641 = _1561 + _1639;
    float _1643 = -_1605;
    float _1645 = _1643 + 1.0;
    float _1647 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1647;
    float _1651 = fma(_1563, _1615, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1655 = _1653 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1657 = _1605 * _1619;
    bool _1659 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1661 = isnan(_1435);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1667 = _1663 || _1665;
    float _1669 = float(_1667);
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1673 = _1589 + _1671;
    float _1675 = fma(_1641, _1641, _1635);
    float _1677 = _1633 * _1645;
    float _1679 = _1649 * _1517;
    float _1681 = -_1633;
    float _1683 = _1681 + 1.0;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1687 = _1435 + _1685;
    float _1689 = _1655 * _1607;
    bool _1691 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1693 = isnan(_1435);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1699 = _1695 || _1697;
    float _1701 = float(_1699);
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1705 = _1435 + _1703;
    float _1707 = fma(_1673, _1673, _1675);
    float _1709 = -_1669;
    float _1711 = _1709 + 1.0;
    float _1713 = fma(_1679, _1687, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1715 = _1669 * _1683;
    float _1717 = fma(_1689, _1705, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1719 = _1701 * _1711;
    bool _1721 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1723 = isnan(_1435);
    bool _1725 = _1721 || _1723;
    bool _1727 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1729 = _1725 || _1727;
    float _1731 = float(_1729);
    float _1733 = sqrt(_1707);
    float _1735 = -_1701;
    float _1737 = _1735 + 1.0;
    int _1739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1741 = _1739 != 0;
    float _1743 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1745 = _1743 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _1747 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1749 = isnan(_1435);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1755 = _1751 || _1753;
    float _1757 = float(_1755);
    float _1759 = _1731 * _1737;
    float _1761 = -_1731;
    float _1763 = _1761 + 1.0;
    float _1765 = _1745 * _1549;
    float _1767 = rsqrt(_1707);
    bool _1769 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1771 = isnan(_1435);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1777 = _1773 || _1775;
    float _1779 = float(_1777);
    float _1781 = _1757 * _1763;
    float _1783 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1785 = _1435 + _1783;
    float _1787 = -_1757;
    float _1789 = _1787 + 1.0;
    float _1791 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1795 = _1793 != 0;
    float _1797 = fma(_1765, _1785, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1799 = _1779 * _1789;
    float _1801 = _1791 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1803 = _1733 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1805 = 0.0;
    float _1807 = _1637;
    float _1809 = _1573;
    float _1811 = _1797;
    float _1813 = _1657;
    if (_1741)
    {
        float _1815 = in.m_68.w;
        _1805 = _1815;
    }
    float _1817 = _1805;
    float _1819 = _1575 * _1799;
    float _1821 = -_1779;
    float _1823 = _1821 + 1.0;
    float _1825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1827 = precise::min(_1801, _1803);
    float _1829 = _1573 * _1767;
    float _1831 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1819);
    float _1833 = _1641 * _1767;
    float _1835 = _1673 * _1767;
    float _1837 = -_1829;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1573);
    float _1841 = _1829 * _1827;
    float _1843 = -_1833;
    float _1845 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1641);
    float _1847 = _1833 * _1827;
    float _1849 = _1839 * _1839;
    float _1851 = -_1841;
    float _1853 = _1573 + _1851;
    float _1855 = -_1835;
    float _1857 = fma(_1855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1673);
    float _1859 = fma(_1621, _1781, _1831);
    float _1861 = fma(_1845, _1845, _1849);
    float _1863 = -_1847;
    float _1865 = _1641 + _1863;
    float _1867 = _1853 * _1853;
    float _1869 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1871 = _1435 + _1869;
    float _1873 = -_203;
    int _1875 = _1507 ? as_type<int>(_1873) : as_type<int>(_203);
    float _1877 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1879 = fma(_1865, _1865, _1867);
    float _1881 = fma(_1637, _1871, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _1883 = as_type<int>(_1831);
    float _1885 = _1841;
    float _1887 = _1829;
    float _1889 = _1835;
    if (_1741)
    {
        float _1891 = _1817 * 3.1415927410125732421875;
        _1807 = _1891;
    }
    float _1893 = _1807;
    int _1895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1897 = _1895 != 0;
    float _1899 = fma(_1857, _1857, _1861);
    float _1901 = -_207;
    int _1903 = _1509 ? as_type<int>(_1901) : as_type<int>(_207);
    if (_1741)
    {
        float _1905 = _1893 * 0.15915493667125701904296875;
        _1883 = as_type<int>(_1905);
    }
    int _1907 = _1883;
    int _1909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1911 = _1909 != 0;
    float _1913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1917 = _1915 != 0;
    float _1919 = _1835 * _1827;
    float _1921 = -_203;
    int _1923 = _1523 ? as_type<int>(_1921) : as_type<int>(_203);
    bool _1925 = !_1795;
    float _1927 = _1925 ? _203 : as_type<float>(_1875);
    float _1929 = -_1919;
    float _1931 = _1673 + _1929;
    bool _1933 = !_1897;
    float _1935 = _1933 ? _207 : as_type<float>(_1903);
    float _1937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1939 = !_1911;
    float _1941 = _1939 ? _207 : as_type<float>(_1515);
    float _1943 = _1927 + 0.5;
    int _1945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1947 = _1945 != 0;
    float _1949 = -_1935;
    float _1951 = _1949 + 0.5;
    bool _1953 = !_1917;
    float _1955 = _1953 ? _203 : as_type<float>(_1923);
    float _1957 = -_1941;
    float _1959 = _1957 + 0.5;
    float _1961 = _1943 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1965 = _1951 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1967 = _1955 + 0.5;
    float _1969 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1971 = fma(_1931, _1931, _1879);
    float _1973 = -_207;
    float _1975 = _1973 + 0.5;
    float _1977 = _1961 * _1825;
    float _1979 = _1967 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1983 = _1965 * _1877;
    float _1985 = _1969 * _1913;
    float _1987 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1989 = _1979 * _1937;
    bool _1991 = _1947;
    if (!_1947)
    {
        _1809 = _1975;
    }
    float _1993 = _1809;
    int _1995 = _1907;
    float _1997 = _1993;
    if (_1741)
    {
        float _1999 = as_type<float>(_1907) * 6.283185482025146484375;
        float _2001 = sin(_1999);
        _1995 = as_type<int>(_2001);
    }
    int _2003 = _1995;
    float _2005 = sqrt(_1899);
    bool _2007 = !_1947;
    int _2009 = _2003;
    if (!_2007)
    {
        float _2011 = in.m_68.x;
        float _2013 = _2011 * 3.1415927410125732421875;
        float _2015 = _2013 * 0.15915493667125701904296875;
        float _2017 = _2015 * 6.283185482025146484375;
        float _2019 = sin(_2017);
        bool _2021 = _2019 > 0.5;
        float _2023 = -_207;
        float _2025 = _2021 ? _2023 : _207;
        float _2027 = -_2025;
        float _2029 = _2027 + 0.5;
        _1991 = _2021;
        _1997 = _2029;
    }
    bool _2031 = _1991;
    float _2033 = _1997;
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2037 = _2035 != 0;
    int _2039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2041 = _2039 != 0;
    float _2043 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1987);
    bool _2045 = _2031;
    if (_1741)
    {
        bool _2047 = as_type<float>(_2003) > 0.5;
        _2045 = _2047;
    }
    bool _2049 = _2045;
    float _2051 = fma(_1651, _1759, _1859);
    float _2053 = sqrt(_1971);
    float _2055 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2043);
    float _2057 = -_203;
    int _2059 = _1509 ? as_type<int>(_2057) : as_type<int>(_203);
    float _2061 = fma(_1717, _1719, _2051);
    float _2063 = -_207;
    int _2065 = _1523 ? as_type<int>(_2063) : as_type<int>(_207);
    out.m_82.x = _1977;
    out.m_82.y = _1983;
    out.m_82.z = _1989;
    out.m_82.w = _1985;
    float _2067 = fma(_1713, _1715, _2061);
    bool _2069 = !_2037;
    float _2071 = _2069 ? _203 : as_type<float>(_2059);
    float _2073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _2075 = !_2041;
    float _2077 = _2075 ? _207 : as_type<float>(_2065);
    float _2079 = _1767 * _2005;
    int _2081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2083 = _2081 != 0;
    int _2085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2087 = _2085 != 0;
    int _2089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2091 = _2089 != 0;
    float _2093 = _2071 + 0.5;
    bool _2095 = _2055 >= 0.0;
    float _2097 = -_2077;
    float _2099 = _2097 + 0.5;
    float _2101 = _1767 * _2053;
    float _2103 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    out.m_84.w = _1827;
    float _2105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2107 = fma(_1797, _1677, _2067);
    if (!_1741)
    {
        _1811 = _203;
    }
    float _2109 = _1811;
    float _2111 = _2033 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2113 = _2109;
    if (_1741)
    {
        float _2115 = -_203;
        float _2117 = _2049 ? _2115 : _203;
        _2113 = _2117;
    }
    float _2119 = _2113;
    float _2121 = fma(_1881, _1657, _2107);
    float _2123 = _2099 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2125 = _2101 * _2079;
    if (_2095)
    {
        _1813 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2127 = _1813;
    float _2129 = _2119 + 0.5;
    float _2131 = _2103 * _1963;
    float _2133 = _2111 * _2073;
    float _2135 = _2123 * _1981;
    float _2137 = _2129 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _2139 = as_type<int>(_2127);
    if (_2095)
    {
        float _2141 = _2127 * 5.0;
        _2139 = as_type<int>(_2141);
    }
    int _2143 = _2139;
    float _2145 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2121);
    if (_2095)
    {
        out.m_59.x = 0.0;
    }
    float _2147 = _2137 * _2105;
    float _2149 = _1791 * _2125;
    out.m_86.x = _2131;
    out.m_86.y = _2135;
    bool _2151 = !_2083;
    int _2153 = _2151 ? 0 : 1;
    bool _2155 = !_2087;
    int _2157 = _2155 ? 0 : 1;
    out.m_88.x = _2147;
    out.m_88.y = _2133;
    bool _2159 = !_2091;
    int _2161 = _2159 ? 0 : 1;
    if (_2095)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7558 = as_type<float>(_2143);
        out.gl_Position.z = _7558;
    }
    out.m_90.x = _2145;
    out.m_92.x = _2149;
    if (_2095)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2163 = -_1829;
    float _2165 = fma(_2163, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1559);
    float _2167 = -_1833;
    float _2169 = fma(_2167, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1561);
    float _2171 = -_1835;
    float _2173 = fma(_2171, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1589);
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2177 = _2165 + _2175;
    float _2179 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2181 = _2169 + _2179;
    float _2183 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2185 = _2173 + _2183;
    float _2187 = _2177 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2189 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2187);
    float _2191 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2189);
    bool _2193 = _2191 >= 0.0;
    float _2195 = _2185;
    if (_2193)
    {
        _2195 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2197 = _2195;
    int _2199 = as_type<int>(_2197);
    if (_2193)
    {
        out.m_59.x = 0.0;
    }
    if (_2193)
    {
        float _2201 = _2197 * 5.0;
        _2199 = as_type<int>(_2201);
    }
    int _2203 = _2199;
    if (_2193)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7649 = as_type<float>(_2203);
        out.gl_Position.z = _7649;
    }
    if (_2193)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2205 = -_1847;
    float _2207 = _1561 + _2205;
    float _2209 = -_1919;
    float _2211 = _1589 + _2209;
    float _2213 = -_1833;
    float _2215 = fma(_2213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2207);
    float _2217 = -_1835;
    float _2219 = fma(_2217, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2211);
    float _2221 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2223 = fma(_2219, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2225 = floor(_2221);
    float _2227 = floor(_2223);
    float _2229 = -_2225;
    float _2231 = _2221 + _2229;
    float _2233 = -_2227;
    float _2235 = _2223 + _2233;
    float2 _7709 = float2(_2231, _2235);
    float _2237 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7709, float2(0.0), isnan(_7709)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7709, float2(0.0), isnan(_7709)), level(0.0)).x;
    float _2239 = _1441 * 2.0;
    float _2241 = _1437 * 2.0;
    float _2243 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2245 = log2(_2243);
    float _2247 = _1439 + _1437;
    float _2249 = _1439 * 2.0;
    float _2251 = _1439 + _1441;
    float _2253 = _2247 + (-1.0);
    int _2255 = abs(_2157);
    float _2257 = _2251 + (-1.0);
    float _2259 = floor(_2239);
    float _2261 = _1439 + (-0.5);
    float _2263 = fma(_2257, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2265 = abs(_2161);
    float _2267 = _2125 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2269 = _2267 * 0.5;
    float _2271 = fma(_2253, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2273 = floor(_2241);
    float _2275 = _2245 * _157;
    bool _2277 = _2259 > 0.0;
    float _2279 = floor(_2249);
    bool _2281 = _2259 >= 0.0;
    bool _2283 = isnan(_2259);
    bool _2285 = _2281 || _2283;
    bool _2287 = isnan(0.0);
    bool _2289 = _2285 || _2287;
    int _2291 = _2289 ? 0 : 1;
    bool _2293 = _2273 > 0.0;
    float _2295 = exp2(_2275);
    int _2297 = abs(_2153);
    float _2299 = in.m_94.x;
    float _2301 = in.m_94.y;
    float _2303 = in.m_94.z;
    int _2305 = ~_2291;
    int _2307 = _2305 + 1;
    int _2309 = _2307 + 1;
    int _2311 = _2309;
    int _2313 = 2;
    float _2315 = _2215;
    if (!_2277)
    {
        int _2317 = ~_2291;
        int _2319 = _2317 + 1;
        _2311 = _2319;
    }
    int _2321 = _2311;
    bool _2323 = _2273 >= 0.0;
    bool _2325 = isnan(_2273);
    bool _2327 = _2323 || _2325;
    bool _2329 = isnan(0.0);
    bool _2331 = _2327 || _2329;
    float _2333 = float(_2321);
    float _2335 = float(_2297);
    int _2337 = _2331 ? 0 : 1;
    float _2339 = _2335 * _2333;
    int _2341 = ~_2337;
    int _2343 = _2341 + 1;
    int _2345 = _2343 + 1;
    float _2347 = -_2295;
    float _2349 = _2347 + 1.0;
    int _2351 = _2345;
    if (!_2293)
    {
        int _2353 = ~_2337;
        int _2355 = _2353 + 1;
        _2351 = _2355;
    }
    int _2357 = _2351;
    float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2361 = 1.0 + _2359;
    float _2363 = _2339 * (-2.0);
    bool _2365 = _2279 > 0.0;
    float _2367 = _1437 + (-0.5);
    bool _2369 = _2279 >= 0.0;
    bool _2371 = isnan(_2279);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(0.0);
    bool _2377 = _2373 || _2375;
    float _2379 = 1.0 / _2361;
    float _2381 = fma(_2363, _2299, _2299);
    float _2383 = float(_2255);
    float _2385 = _1441 + _1437;
    bool _2387 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2389 = isnan(1.0);
    bool _2391 = _2387 || _2389;
    bool _2393 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2395 = _2391 || _2393;
    float _2397 = fma(_2367, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2381);
    int _2399 = _2377 ? 0 : 1;
    float _2401 = _2385 + (-1.0);
    bool _2403 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2405 = isnan(0.0);
    bool _2407 = _2403 || _2405;
    bool _2409 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2411 = _2407 || _2409;
    float _2413 = _1441 + (-0.5);
    float _2415 = float(_2357);
    float _2417 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _2419 = ~_2399;
    int _2421 = _2419 + 1;
    int _2423 = _2421 + 1;
    float _2425 = fma(_2271, _2363, _2271);
    int _2427 = _2423;
    if (!_2365)
    {
        int _2429 = ~_2399;
        int _2431 = _2429 + 1;
        _2427 = _2431;
    }
    int _2433 = _2427;
    float _2435 = _2383 * _2415;
    float _2437 = _2411 ? _2349 : 0.0;
    float _2439 = _2435 * (-2.0);
    if (_2395)
    {
        float _2441 = _2437 * _2379;
        _181 = _2441;
    }
    float _2443 = _181;
    float _2445 = float(_2433);
    float _2447 = fma(_2439, _2301, _2301);
    float _2449 = float(_2265);
    float _2451 = fma(_2263, _2439, _2263);
    float _2453 = fma(_2261, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2447);
    float _2455 = fma(_2425, _2443, _2397);
    float _2457 = _2449 * _2445;
    float _2459 = fma(_2451, _2443, _2453);
    float _2461 = fma(_2401, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2463 = _2457 * (-2.0);
    float _2465 = -_1841;
    float _2467 = _1559 + _2465;
    float _2469 = _2459 * 0.15915493667125701904296875;
    float _2471 = _2455 * 0.15915493667125701904296875;
    float _2473 = fma(_2463, _2303, _2303);
    float _2475 = fma(_2461, _2463, _2461);
    float _2477 = -_1829;
    float _2479 = fma(_2477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2467);
    float _2481 = _2471 * 6.283185482025146484375;
    float _2483 = sin(_2481);
    float _2485 = fma(_2413, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2473);
    float _2487 = _2479 + _2417;
    float _2489 = fma(_2475, _2443, _2485);
    float _2491 = _2479 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2493 = _2487 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2495 = _2487 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2497 = _2471 * 6.283185482025146484375;
    float _2499 = cos(_2497);
    float _2501 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2491);
    float _2503 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2493);
    float _2505 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2495);
    float _2507 = _2489 * 0.15915493667125701904296875;
    float _2509 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2501);
    float _2511 = fma(_2219, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2503);
    float _2513 = fma(_2219, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2505);
    float _2515 = _2469 * 6.283185482025146484375;
    float _2517 = sin(_2515);
    float _2519 = _2509 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2521 = _2479 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2523 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2525 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2527 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2521);
    float _2529 = 1.0 / _2519;
    float _2531 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2527);
    float _2533 = _2531 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2535 = _2469 * 6.283185482025146484375;
    float _2537 = cos(_2535);
    float _2539 = _2499 * _2517;
    float _2541 = _2533 + _2519;
    float _2543 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2545 = _2507 * 6.283185482025146484375;
    float _2547 = sin(_2545);
    float _2549 = _2541 * _2529;
    float _2551 = _2549 * 0.5;
    float _2553 = _2483 * _2517;
    float _2555 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2557 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2555);
    float _2559 = trunc(_2523);
    int _2561 = int(_2559);
    float _2563 = _2499 * _2537;
    float _2565 = _2483 * _2537;
    float _2567 = trunc(_2525);
    int _2569 = int(_2567);
    float _2571 = fma(_2547, _2563, _2553);
    float _2573 = fma(_2547, _2553, _2563);
    float _2575 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2577 = -_2539;
    float _2579 = fma(_2547, _2565, _2577);
    float _2581 = -_2565;
    float _2583 = fma(_2547, _2539, _2581);
    float _2585 = _2575 * _2125;
    float _2587 = _2507 * 6.283185482025146484375;
    float _2589 = cos(_2587);
    int _2591 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2593 = _2561 + _2591;
    int _2595 = _2593 + 1;
    float _2597 = _2585 * _2543;
    bool _2599 = _2595 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2601 = 1.0 / _2557;
    int _2603 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2605 = _2569 + _2603;
    int _2607 = _2605 + 1;
    int _2609 = _2595 | _2607;
    float _2611 = _2499 * _2589;
    float _2613 = _2537 * _2589;
    float _2615 = _2483 * _2589;
    float _2617 = _2517 * _2589;
    float _2619 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    bool _2621 = _2609 < 0;
    bool _2623 = _2621 || _2599;
    float _2625 = -_2597;
    float _2627 = _2547 * _2625;
    float _2629 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2631 = _2601 * _2629;
    float _2633 = _2149 * _2619;
    float _2635 = _2611 * _2597;
    bool _2637 = _2607 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2639 = _2637 || _2623;
    float _2641 = _2615 * _2597;
    bool _2643 = _2631 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2645 = fma(_2571, _2633, _2635);
    bool _2647 = _2631 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2649 = fma(_2613, _2633, _2627);
    float _2651 = fma(_2579, _2633, _2641);
    float _2653 = fma(_2583, _2269, _2645);
    bool _2655 = !_2643;
    int _2657 = _2655 ? 0 : 1;
    float _2659 = fma(_2617, _2269, _2649);
    float _2661 = fma(_2573, _2269, _2651);
    float _2663 = _2653 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2665 = _2653 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2667 = as_type<int>(_2651);
    float _2669 = _2653;
    float _2671 = _2659;
    if (!_2639)
    {
        int _2673 = _2607 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2675 = _2673 + _2595;
        _2009 = _2675;
    }
    int _2677 = _2009;
    float _2679 = _2653 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_2643)
    {
        _2313 = 1;
    }
    int _2681 = _2313;
    float _2683 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2665);
    int _2685 = _2681;
    if (!_2647)
    {
        _2685 = _2657;
    }
    int _2687 = _2685;
    float _2689 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2663);
    float _2691 = as_type<float>(_2687);
    if (!_2639)
    {
        int _2693 = _2677 << 2;
        _2667 = _2693;
    }
    int _2695 = _2667;
    float _2697 = fma(_2661, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2683);
    int _2699 = _2687 << 6;
    float _2701 = fma(_2661, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2689);
    int _2703 = _2695;
    int _2705 = as_type<int>(_2701);
    if (!_2639)
    {
        int _2707 = 12 & _2695;
        _2703 = _2707;
    }
    int _2709 = _2703;
    float _2711 = _2697 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _2713 = _2699 + 96;
    uint _2716 = uint(int(uint(_2713) >> uint(2)));
    uint _2718 = uint(int(uint(int(_2716)) >> uint(2)));
    int _2720 = int(_2716) & 3;
    float _2722 = (*spvDescriptorSet0.vp_c15)._m0[int(_2718)][_2720];
    int _2724 = int(_2716) + 1;
    uint _2726 = uint(int(uint(_2724) >> uint(2)));
    int _2728 = _2724 & 3;
    float _2730 = (*spvDescriptorSet0.vp_c15)._m0[int(_2726)][_2728];
    float _2732 = _2701 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    if (!_2639)
    {
        uint _2734 = uint(int(uint(_2677) >> uint(2)));
        _2705 = int(_2734);
    }
    int _2736 = _2705;
    float _2738 = _1589 + _2711;
    float _2740 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2679);
    float _2742 = _1561 + _2732;
    float _2744 = 0.0;
    float _2746 = _2742;
    float _2748 = _2738;
    if (!_2639)
    {
        int _2750 = _2736 << 4;
        int _2752 = _2750 + _2709;
        _2744 = as_type<float>(_2752);
    }
    float _2754 = _2744;
    float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2758 = _2738 + _2756;
    int _2760 = _2699 + 48;
    uint _2762 = uint(int(uint(_2760) >> uint(2)));
    uint _2764 = uint(int(uint(int(_2762)) >> uint(2)));
    int _2766 = int(_2762) & 3;
    float _2768 = (*spvDescriptorSet0.vp_c15)._m0[int(_2764)][_2766];
    int _2770 = int(_2762) + 1;
    uint _2772 = uint(int(uint(_2770) >> uint(2)));
    int _2774 = _2770 & 3;
    float _2776 = (*spvDescriptorSet0.vp_c15)._m0[int(_2772)][_2774];
    float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2780 = _2742 + _2778;
    if (!_2639)
    {
        float _2782 = floor(_2523);
        _2669 = _2782;
    }
    float _2784 = _2669;
    float _2786 = _2758 * _2758;
    float _2788 = fma(_2661, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2740);
    float _2790 = fma(_2780, _2780, _2786);
    int _2792 = _2699 + 64;
    uint _2794 = uint(int(uint(_2792) >> uint(2)));
    uint _2796 = uint(int(uint(int(_2794)) >> uint(2)));
    int _2798 = int(_2794) & 3;
    float _2800 = (*spvDescriptorSet0.vp_c15)._m0[int(_2796)][_2798];
    int _2802 = int(_2794) + 1;
    uint _2804 = uint(int(uint(_2802) >> uint(2)));
    int _2806 = _2802 & 3;
    float _2808 = (*spvDescriptorSet0.vp_c15)._m0[int(_2804)][_2806];
    float _2810 = _2788 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    if (!_2639)
    {
        float _2812 = floor(_2525);
        _2671 = _2812;
    }
    float _2814 = _2671;
    int _2816 = _2699 + 104;
    uint _2818 = uint(int(uint(_2816) >> uint(2)));
    uint _2820 = uint(int(uint(int(_2818)) >> uint(2)));
    int _2822 = int(_2818) & 3;
    float _2824 = (*spvDescriptorSet0.vp_c15)._m0[int(_2820)][_2822];
    int _2826 = int(_2818) + 1;
    uint _2828 = uint(int(uint(_2826) >> uint(2)));
    int _2830 = _2826 & 3;
    float _2832 = (*spvDescriptorSet0.vp_c15)._m0[int(_2828)][_2830];
    float _2834 = sqrt(_2790);
    int _2836 = _2699 + 56;
    uint _2838 = uint(int(uint(_2836) >> uint(2)));
    uint _2840 = uint(int(uint(int(_2838)) >> uint(2)));
    int _2842 = int(_2838) & 3;
    float _2844 = (*spvDescriptorSet0.vp_c15)._m0[int(_2840)][_2842];
    int _2846 = int(_2838) + 1;
    uint _2848 = uint(int(uint(_2846) >> uint(2)));
    int _2850 = _2846 & 3;
    float _2852 = (*spvDescriptorSet0.vp_c15)._m0[int(_2848)][_2850];
    int _2854 = _2699 + 72;
    uint _2856 = uint(int(uint(_2854) >> uint(2)));
    uint _2858 = uint(int(uint(int(_2856)) >> uint(2)));
    int _2860 = int(_2856) & 3;
    float _2862 = (*spvDescriptorSet0.vp_c15)._m0[int(_2858)][_2860];
    int _2864 = int(_2856) + 1;
    uint _2866 = uint(int(uint(_2864) >> uint(2)));
    int _2868 = _2864 & 3;
    float _2870 = (*spvDescriptorSet0.vp_c15)._m0[int(_2866)][_2868];
    bool _2872 = _2834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2874 = _2699 + 80;
    uint _2876 = uint(int(uint(_2874) >> uint(2)));
    uint _2878 = uint(int(uint(int(_2876)) >> uint(2)));
    int _2880 = int(_2876) & 3;
    float _2882 = (*spvDescriptorSet0.vp_c15)._m0[int(_2878)][_2880];
    int _2884 = int(_2876) + 1;
    uint _2886 = uint(int(uint(_2884) >> uint(2)));
    int _2888 = _2884 & 3;
    float _2890 = (*spvDescriptorSet0.vp_c15)._m0[int(_2886)][_2888];
    float _2892 = _2487 * _2730;
    int _2894 = _2699 + 88;
    uint _2896 = uint(int(uint(_2894) >> uint(2)));
    uint _2898 = uint(int(uint(int(_2896)) >> uint(2)));
    int _2900 = int(_2896) & 3;
    float _2902 = (*spvDescriptorSet0.vp_c15)._m0[int(_2898)][_2900];
    int _2904 = int(_2896) + 1;
    uint _2906 = uint(int(uint(_2904) >> uint(2)));
    int _2908 = _2904 & 3;
    float _2910 = (*spvDescriptorSet0.vp_c15)._m0[int(_2906)][_2908];
    float _2912 = _2487 * _2776;
    float _2914 = _2754;
    if (!_2639)
    {
        int _2916 = as_type<int>(_2754) + 400;
        uint _2918 = uint(int(uint(_2916) >> uint(2)));
        uint _2920 = uint(int(uint(int(_2918)) >> uint(2)));
        int _2922 = int(_2918) & 3;
        float _2924 = (*spvDescriptorSet0.vp_c15)._m0[int(_2920)][_2922];
        _2914 = _2924;
    }
    float _2926 = _2914;
    float _2928 = _2487 * _2808;
    float _2930 = fma(_2215, _2722, _2892);
    float _2932 = fma(_2215, _2768, _2912);
    float _2934 = _1559 + _2810;
    float _2936 = fma(_2215, _2800, _2928);
    float _2938 = fma(_2219, _2824, _2930);
    bool _2940 = !_2872;
    float _2942 = _2934;
    float _2944 = _2852;
    if (!_2940)
    {
        float _2946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2948 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2950 = _2834 + _2948;
        float _2952 = _2934 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2954 = rsqrt(_2790);
        float _2956 = _2950 * _2946;
        float _2958 = _2956 * 0.15915493667125701904296875;
        float _2960 = _2958 * 6.283185482025146484375;
        float _2962 = cos(_2960);
        float _2964 = _2958 * 6.283185482025146484375;
        float _2966 = sin(_2964);
        float _2968 = _2962 + (-1.0);
        float _2970 = fma(_2966, _2952, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2972 = _2968 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2974 = _2954 * _2970;
        float _2976 = fma(_2934, _2962, _2972);
        float _2978 = fma(_2780, _2974, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2980 = fma(_2758, _2974, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2942 = _2976;
        _2746 = _2978;
        _2748 = _2980;
    }
    float _2982 = _2942;
    float _2984 = _2746;
    float _2986 = _2748;
    float _2988 = _2938 + _2832;
    bool _2990 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2992 = isnan(0.5);
    bool _2994 = _2990 || _2992;
    bool _2996 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2998 = _2994 || _2996;
    float _3000 = fma(_2219, _2844, _2932);
    float _3002 = -_1841;
    float _3004 = _3002 + _2982;
    float _3006 = 1.0 / _2988;
    float _3008 = -_1847;
    float _3010 = _3008 + _2984;
    float _3012 = -_1919;
    float _3014 = _3012 + _2986;
    float _3016 = -_1829;
    float _3018 = fma(_3016, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3004);
    float _3020 = fma(_2219, _2862, _2936);
    float _3022 = _3000 + _2852;
    float _3024 = -_1833;
    float _3026 = fma(_3024, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3010);
    float _3028 = -_1835;
    float _3030 = fma(_3028, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3014);
    float _3032 = _3020 + _2870;
    float _3034 = _3026;
    float _3036 = _3030;
    if (_2998)
    {
        _2944 = _3018;
    }
    float _3038 = _2944;
    float _3040 = _3038;
    if (!_2998)
    {
        float _3042 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3044 = _2479 + _3042;
        float _3046 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3048 = _2215 + _3046;
        float _3050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3052 = -_1589;
        float _3054 = _3052 + _2986;
        float _3056 = _3044 * _3044;
        float _3058 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3060 = _2219 + _3058;
        float _3062 = -_1559;
        float _3064 = _3062 + _2982;
        float _3066 = fma(_3048, _3048, _3056);
        float _3068 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3070 = fma(_3060, _3060, _3066);
        float _3072 = sqrt(_3070);
        float _3074 = 1.0 / _2079;
        float _3076 = _3068 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3078 = precise::min(_3072, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3080 = _3078 * _3050;
        float _3082 = _3080 * _3074;
        float _3084 = -_1561;
        float _3086 = _3084 + _2984;
        float _3088 = _3076 * _3082;
        float _3090 = _3054 * _3082;
        float _3092 = fma(_3086, _3088, _2215);
        float _3094 = fma(_3064, _3088, _2479);
        float _3096 = fma(_3076, _3090, _2219);
        _3040 = _3094;
        _3034 = _3092;
        _3036 = _3096;
    }
    float _3098 = _3040;
    float _3100 = _3034;
    float _3102 = _3036;
    float _3104 = _3098 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3106 = _3098 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3108 = _3022 * _3006;
    float _3110 = _3098 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3112 = fma(_3100, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3104);
    float _3114 = fma(_3100, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3106);
    float _3116 = _3098 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _3118 = _3108 >= 0.0;
    float _3120 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3112);
    float _3122 = fma(_3100, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3110);
    float _3124 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3114);
    float _3126 = _3032 * _3006;
    float _3128 = _3120 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3130 = _3108 <= 1.0;
    bool _3132 = _3130 && _3118;
    float _3134 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3122);
    float _3136 = fma(_3100, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3116);
    float _3138 = _3124 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3140 = _3128 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3142 = _3134 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _3144 = _3126 >= 0.0;
    bool _3146 = _3144 && _3132;
    float _3148 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3136);
    float _3150 = fma(_3138, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3140);
    float _3152 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3154 = _3142 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _3156 = _3126 <= 1.0;
    bool _3158 = _3156 && _3146;
    float _3160 = _3148 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3162 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3150);
    float _3164 = -_3154;
    float _3166 = fma(_3164, _3152, 1.0);
    float _3168 = _2487 * _2890;
    float _3170 = _3128 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3172 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3162);
    float _3174 = _3128 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3176 = fma(_2215, _2882, _3168);
    float _3178 = log2(_3166);
    float _3180 = fma(_3138, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3170);
    float _3182 = fma(_3138, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3174);
    float _3184 = fma(_2219, _2902, _3176);
    float _3186 = _3176;
    if (_3158)
    {
        float _3188 = float(_2687);
        _2691 = _3188;
    }
    float _3190 = _2691;
    float _3192 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3180);
    float _3194 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3182);
    float _3196 = _3184 + _2910;
    float _3198 = 1.0 / _3172;
    float _3200 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3192);
    float _3202 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3194);
    float _3204 = _3200;
    if (!_2639)
    {
        float _3206 = -_2784;
        float _3208 = _2523 + _3206;
        _3186 = _3208;
    }
    float _3210 = _3186;
    if (!_2639)
    {
        float _3212 = -_2814;
        float _3214 = _2525 + _3212;
        _1885 = _3214;
    }
    float _3216 = _1885;
    float _3218 = _3196 * _3006;
    float _3220 = _2988;
    if (!_2639)
    {
        float _3222 = rint(_2926);
        float _3224 = precise::max(_3222, 0.0);
        uint _3226 = uint(_3224);
        uint _3228 = clamp(_3226, 0u, 65535u);
        _3220 = as_type<float>(_3228);
    }
    float _3230 = _3220;
    float _3232 = _3178 * 0.693147182464599609375;
    float _3234 = _3232 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3236 = _3174;
    float _3238 = _3232;
    if (_3158)
    {
        float _3240 = rint(_3190);
        float _3242 = precise::max(_3240, 0.0);
        uint _3244 = uint(_3242);
        uint _3246 = clamp(_3244, 0u, 65535u);
        _3236 = as_type<float>(_3246);
    }
    float _3248 = _3236;
    float _3250 = _3200 * _3198;
    float _3252 = _3202 * _3198;
    float _3254 = fma(_3250, 0.5, 0.5);
    float _3256 = fma(_3252, -0.5, 0.5);
    float _3258 = _3216;
    float _3260 = _3256;
    if (!_2639)
    {
        float3 _9338 = float3(_3210, _3216, float(as_type<int>(_3230)));
        float3 _9342 = select(_9338, float3(0.0), isnan(_9338));
        float _3262 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9342.xy, uint(rint(_9342.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9342.xy, uint(rint(_9342.z)), level(0.0)).x;
        _3258 = _3262;
    }
    float _3264 = _3258;
    float _3266 = _3126;
    if (_3158)
    {
        float3 _9357 = float3(_3108, _3126, float(as_type<int>(_3248)));
        float3 _9359 = select(_9357, float3(0.0), isnan(_9357));
        float _3268 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9359.xy, uint(rint(_9359.z)), _3218, level(0.0));
        _3266 = _3268;
    }
    float _3270 = _3266;
    float3 _9369 = float3(_3254, _3256, _3234);
    float _3272 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9369, float3(0.0), isnan(_9369)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9369, float3(0.0), isnan(_9369)), level(0.0)).x;
    float3 _9378 = float3(_3254, _3256, _3234);
    float4 _3275 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9378, float3(0.0), isnan(_9378)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9378, float3(0.0), isnan(_9378)), level(0.0)).xyzw;
    float _3277 = _3275.x;
    float _3279 = _3275.y;
    float _3281 = _3275.z;
    float _3283 = _3275.w;
    bool _3285 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3287 = isnan(0.5);
    bool _3289 = _3285 || _3287;
    bool _3291 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3293 = _3289 || _3291;
    if (_2639)
    {
        _3238 = 1.0;
    }
    float _3295 = _3238;
    float _3297 = _3295;
    if (_3293)
    {
        _1887 = 1.0;
    }
    float _3299 = _1887;
    float _3301 = _3299;
    if (!_3293)
    {
        float _3303 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3305 = _3303 * 0.15915493667125701904296875;
        float _3307 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3309 = _3305 * 6.283185482025146484375;
        float _3311 = cos(_3309);
        float _3313 = _3307 * 0.15915493667125701904296875;
        float _3315 = _3305 * 6.283185482025146484375;
        float _3317 = sin(_3315);
        float _3319 = 1.0 / _3311;
        float _3321 = _3313 * 6.283185482025146484375;
        float _3323 = cos(_3321);
        float _3325 = _3317 * _3319;
        float _3327 = _3313 * 6.283185482025146484375;
        float _3329 = sin(_3327);
        float _3331 = _3323 * _3325;
        float _3333 = 1.0 / _3331;
        float _3335 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3337 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3335;
        float _3339 = 1.0 / _3337;
        float _3341 = _3329 * _3333;
        float _3343 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3345 = fma(_2631, _3341, _3343);
        float _3347 = _3345 * _3339;
        float _3349 = precise::clamp(_3347, 0.0, 1.0);
        _3260 = _3345;
        _3301 = _3349;
    }
    float _3351 = _3260;
    float _3353 = _3301;
    if (!_2639)
    {
        int _3355 = _2677 << 4;
        int _3357 = _3355 + 2048;
        uint _3359 = uint(int(uint(_3357) >> uint(2)));
        uint _3361 = uint(int(uint(int(_3359)) >> uint(2)));
        int _3363 = int(_3359) & 3;
        float _3365 = (*spvDescriptorSet0.vp_c15)._m0[int(_3361)][_3363];
        int _3367 = int(_3359) + 1;
        uint _3369 = uint(int(uint(_3367) >> uint(2)));
        int _3371 = _3367 & 3;
        float _3373 = (*spvDescriptorSet0.vp_c15)._m0[int(_3369)][_3371];
        int _3375 = _3357 + 8;
        uint _3377 = uint(int(uint(_3375) >> uint(2)));
        uint _3379 = uint(int(uint(int(_3377)) >> uint(2)));
        int _3381 = int(_3377) & 3;
        float _3383 = (*spvDescriptorSet0.vp_c15)._m0[int(_3379)][_3381];
        int _3385 = int(_3377) + 1;
        uint _3387 = uint(int(uint(_3385) >> uint(2)));
        int _3389 = _3385 & 3;
        float _3391 = (*spvDescriptorSet0.vp_c15)._m0[int(_3387)][_3389];
        float _3393 = _2487 * _3373;
        float _3395 = fma(_2215, _3365, _3393);
        float _3397 = fma(_2219, _3383, _3395);
        float _3399 = _3397 + _3391;
        float _3401 = precise::clamp(_3399, 0.0, 1.0);
        float _3403 = -_3401;
        float _3405 = _3403 + _3264;
        float _3407 = fma(_3405, 500.0, 1.5);
        float _3409 = exp2(_3407);
        float _3411 = 0.0 + _3409;
        float _3413 = precise::clamp(_3411, 0.0, 1.0);
        _3297 = _3413;
    }
    float _3415 = _3297;
    float _3417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3419 = _3098 + _3417;
    float _3421 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3423 = _3100 + _3421;
    float _3425 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3427 = _3102 + _3425;
    float _3429 = _3419 * _3419;
    float _3431 = fma(_3423, _3423, _3429);
    float _3433 = fma(_3427, _3427, _3431);
    float _3435 = rsqrt(_3433);
    float _3437 = sqrt(_3433);
    float _3439 = _3435 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3441 = _3423 * _3439;
    float _3443 = _3427 * _3439;
    float _3445 = _3441 * _3441;
    float _3447 = _3443 * _3443;
    float _3449 = _3445 + _3447;
    float _3451 = sqrt(_3449);
    bool _3453 = _3451 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3457 = _3451 + _3455;
    float _3459 = _3351;
    float _3461 = _3449;
    float _3463 = _3457;
    float _3465 = _3441;
    float _3467 = _3443;
    float _3469 = _3445;
    float _3471 = _3447;
    if (_3453)
    {
        float _3473 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3459 = _3473;
    }
    float _3475 = _3459;
    if (_3453)
    {
        float _3477 = rsqrt(_3449);
        _3461 = _3477;
    }
    float _3479 = _3461;
    if (_3453)
    {
        float _3481 = _3457 * _3475;
        _3463 = _3481;
    }
    float _3483 = _3463;
    if (_3453)
    {
        float _3485 = _3483 * 0.15915493667125701904296875;
        _1889 = _3485;
    }
    float _3487 = _1889;
    float _3489 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3491 = _3234;
    float _3493 = _3489;
    if (_3453)
    {
        float _3495 = _3487 * 6.283185482025146484375;
        float _3497 = sin(_3495);
        _3491 = _3497;
    }
    float _3499 = _3491;
    float _3501 = precise::max(0.0, _3489);
    float _3503 = _3483;
    float _3505 = _3501;
    if (_3453)
    {
        float _3507 = _3487 * 6.283185482025146484375;
        float _3509 = cos(_3507);
        _3503 = _3509;
    }
    float _3511 = _3503;
    float _3513 = -_3439;
    float _3515 = -_3501;
    float _3517 = fma(_3419, _3513, _3515);
    float _3519 = _3517;
    if (_3453)
    {
        float _3521 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3505 = _3521;
    }
    float _3523 = _3505;
    float _3525 = _3499;
    if (_3453)
    {
        float _3527 = fma(_3499, _3523, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3525 = _3527;
    }
    float _3529 = _3525;
    float _3531 = _3529;
    if (_3453)
    {
        float _3533 = _3479 * _3529;
        _3531 = _3533;
    }
    float _3535 = _3531;
    if (_3453)
    {
        float _3537 = _3511 + (-1.0);
        _3493 = _3537;
    }
    float _3539 = _3493;
    float _3541 = _3539;
    if (_3453)
    {
        float _3543 = _3441 * _3535;
        _3465 = _3543;
    }
    float _3545 = _3465;
    if (_3453)
    {
        float _3547 = _3443 * _3535;
        _3467 = _3547;
    }
    float _3549 = _3467;
    if (_3453)
    {
        float _3551 = _3539 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3541 = _3551;
    }
    float _3553 = _3541;
    if (_3453)
    {
        float _3555 = _3545 * _3545;
        _3469 = _3555;
    }
    float _3557 = _3469;
    if (_3453)
    {
        float _3559 = _3549 * _3549;
        _3471 = _3559;
    }
    float _3561 = _3471;
    if (_3453)
    {
        float _3563 = fma(_3517, _3511, _3553);
        _3519 = _3563;
    }
    float _3565 = _3519;
    float _3567 = fma(_3565, _3565, _3557);
    float _3569 = _3567 + _3561;
    float _3571 = rsqrt(_3569);
    float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3575 = fma(_3437, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3573);
    float _3577 = precise::clamp(_3575, 0.0, 1.0);
    float _3579 = -_3577;
    float _3581 = _3579 + 1.0;
    float _3583 = abs(_3581);
    float _3585 = log2(_3583);
    float _3587 = _3571 * _3545;
    float _3589 = _3571 * _3565;
    float _3591 = _3571 * _3549;
    float _3593 = _3587 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3595 = -_3593;
    float _3597 = fma(_3589, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3595);
    float _3599 = -_3591;
    float _3601 = fma(_3599, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3597);
    float _3603 = _3585 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3605 = fma(_3601, -0.5, 0.5);
    float _3607 = fma(_3601, 0.5, 0.5);
    float _3609 = exp2(_3603);
    float _3611 = fma(_3607, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3613 = fma(_3607, _3611, -0.212114393711090087890625);
    float _3615 = _3589 + 1.0;
    float _3617 = sqrt(_3605);
    float _3619 = fma(_3607, _3613, 1.570728778839111328125);
    float _3621 = -_3589;
    float _3623 = fma(_3609, _3615, _3621);
    float _3625 = _3617 * 0.636619746685028076171875;
    float _3627 = fma(_3623, 0.5, 0.5);
    float _3629 = -_3619;
    float _3631 = fma(_3625, _3629, 1.0);
    float2 _9910 = float2(_3631, _3627);
    float3 _3635 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9910, float2(0.0), isnan(_9910)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9910, float2(0.0), isnan(_9910)), level(0.0)).xyz;
    float _3637 = _3635.x;
    float _3639 = _3635.y;
    float _3641 = _3635.z;
    float _3643 = _2571 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3645 = _2571 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3647 = _2571 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3649 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3651 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3643);
    float _3653 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3645);
    float _3655 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3647);
    float _3657 = fma(_3649, _3649, 1.0);
    float _3659 = abs(_2631);
    float _3661 = log2(_3659);
    float _3663 = _2611 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3665 = _2611 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3667 = _2611 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3669 = _2583 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3671 = _2583 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3673 = _2583 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3675 = -_2547;
    float _3677 = fma(_3675, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3663);
    float _3679 = rsqrt(_3657);
    float _3681 = -_2547;
    float _3683 = fma(_3681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3665);
    float _3685 = -_2547;
    float _3687 = fma(_3685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3667);
    float _3689 = fma(_2617, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3671);
    float _3691 = fma(_2617, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3669);
    float _3693 = fma(_2617, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3673);
    float _3695 = _3128 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3697 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3677);
    float _3699 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3683);
    float _3701 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3687);
    float _3703 = fma(_3138, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3695);
    float _3705 = _3661 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3707 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3691);
    float _3709 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3689);
    float _3711 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3693);
    float _3713 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3703);
    float _3715 = _3649 * _3679;
    float _3717 = exp2(_3705);
    float _3719 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3653);
    float _3721 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3651);
    float _3723 = -_3707;
    float _3725 = _3715 * _3723;
    float _3727 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3655);
    float _3729 = -_3709;
    float _3731 = _3715 * _3729;
    float _3733 = _3649 * _3697;
    float _3735 = fma(_3679, _3697, _3725);
    float _3737 = -_3711;
    float _3739 = _3715 * _3737;
    float _3741 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3743 = fma(_3679, _3699, _3731);
    float _3745 = _3649 * _3699;
    float _3747 = fma(_3679, _3701, _3739);
    float _3749 = _3172 * 0.5;
    out.m_96.x = _3721;
    out.m_96.y = _3719;
    out.m_96.z = _3727;
    float _3751 = fma(_3741, _3719, _3745);
    float _3753 = _3585 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3755 = _2631 <= 8000.0;
    bool _3757 = isnan(_2631);
    bool _3759 = _3755 || _3757;
    bool _3761 = isnan(8000.0);
    bool _3763 = _3759 || _3761;
    float _3765 = float(_3763);
    float _3767 = fma(_3717, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3769 = precise::clamp(_3767, 0.0, 1.0);
    out.m_98.x = _2215;
    out.m_98.y = _2479;
    out.m_98.z = _2219;
    float _3771 = _3649 * _3701;
    float _3773 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3713);
    float _3775 = exp2(_3753);
    float _3777 = fma(_3741, _3721, _3733);
    float _3779 = fma(_3741, _3727, _3771);
    float _3781 = _3773 + _3172;
    float _3783 = fma(_3202, -0.5, _3749);
    float _3785 = _3200 + _3172;
    float _3787 = -_2237;
    float _3789 = _3787 + 1.0;
    float _3791 = _3781 * 0.5;
    float _3793 = fma(_3769, -2.0, 3.0);
    float _3795 = _3769 * _3769;
    float _3797 = _3785 * 0.5;
    out.m_100.x = _3735;
    out.m_100.y = _3743;
    out.m_100.z = _3747;
    float _3799 = _3785;
    float _3801 = _3789;
    if (!_3158)
    {
        _2315 = 1.0;
    }
    float _3803 = _2315;
    float _3805 = _3795 * _3793;
    float _3807 = _3803;
    if (_3158)
    {
        bool _3809 = _3270 >= _3218;
        bool _3811 = isnan(_3270);
        bool _3813 = _3809 || _3811;
        bool _3815 = isnan(_3218);
        bool _3817 = _3813 || _3815;
        float _3819 = float(_3817);
        _3807 = _3819;
    }
    float _3821 = _3807;
    out.m_102.x = _3797;
    out.m_102.y = _3783;
    out.m_102.z = _3791;
    out.m_102.w = _3172;
    bool _3823 = _3437 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3825 = isnan(_3437);
    bool _3827 = _3823 || _3825;
    bool _3829 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3831 = _3827 || _3829;
    float _3833 = -_3805;
    float _3835 = _3833 + 1.0;
    out.m_104.x = _3100;
    out.m_104.y = _3098;
    out.m_104.z = _3102;
    float _3837 = _3821 * _3415;
    float _3839 = fma(_3835, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3805);
    float _3841 = _3707 + _3777;
    float _3843 = _3709 + _3751;
    float _3845 = _3765 * _3839;
    float _3847 = _3711 + _3779;
    out.gl_Position.x = _3200;
    out.gl_Position.y = _3202;
    out.gl_Position.z = _3773;
    out.gl_Position.w = _3172;
    float _3849 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3851 = -_3775;
    float _3853 = _3851 + 1.0;
    out.m_106.x = _3841;
    out.m_106.y = _3843;
    out.m_106.z = _3847;
    if (!_3831)
    {
        _3799 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3855 = _3799;
    float _3857 = _3789 * _3849;
    float _3859 = precise::clamp(_3857, 0.0, 1.0);
    float _3861 = _3853 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3863 = _3861;
    float _3865 = _3855;
    float _3867 = _3855;
    if (!_3831)
    {
        _3801 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3869 = _3801;
    float _3871 = -_3859;
    float _3873 = fma(_3871, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3875 = _3861 * _3272;
    float _3877 = -_3861;
    float _3879 = _3877 + 1.0;
    float _3881 = _3879;
    float _3883 = _3869;
    float _3885 = _3869;
    if (!_3831)
    {
        _3863 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3887 = _3863;
    float _3889 = -_3837;
    float _3891 = fma(_3889, _3873, 1.0);
    float _3893 = precise::clamp(_3891, 0.0, 1.0);
    float _3895 = _3283 * _3875;
    float _3897 = _3283 * _3879;
    float _3899 = _3353 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3901 = _3893 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3903 = _3901;
    float _3905 = _3887;
    float _3907 = _3887;
    if (!_3831)
    {
        _3204 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3909 = _3204;
    float _3911 = _3909;
    float _3913 = _3909;
    if (!_3831)
    {
        _3881 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3915 = _3881;
    out.m_108.x = _3901;
    float _3917 = _3915;
    float _3919 = _3915;
    if (!_3831)
    {
        _3903 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3921 = _3903;
    float _3923 = _3641 * _3875;
    float _3925 = fma(_3637, _3895, _3277);
    float _3927 = fma(_3639, _3895, _3279);
    float _3929 = fma(_3283, _3923, _3281);
    out.m_110.x = _3925;
    out.m_110.y = _3927;
    out.m_110.z = _3929;
    out.m_110.w = _3897;
    bool _3931 = !_3831;
    float _3933 = _3921;
    float _3935 = _3921;
    if (!_3931)
    {
        bool _3937 = _3437 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3939 = isnan(_3437);
        bool _3941 = _3937 || _3939;
        bool _3943 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3945 = _3941 || _3943;
        if (!_3945)
        {
            float _3947 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3949 = _3437 + _3947;
            float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3953 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3951;
            float _3955 = 1.0 / _3953;
            float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3959 = _3957 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3963 = _3961 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3965 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3967 = _3965 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3971 = _3969 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3973 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3975 = _3973 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3977 = _3949 * _3955;
            float _3979 = precise::clamp(_3977, 0.0, 1.0);
            float _3981 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3983 = _3981 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3985 = fma(_3979, _3959, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3987 = fma(_3979, _3983, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3989 = fma(_3979, _3963, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3991 = fma(_3979, _3967, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3993 = fma(_3979, _3971, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3995 = fma(_3979, _3975, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3913 = _3987;
            _3907 = _3993;
            _3885 = _3985;
            _3919 = _3991;
            _3867 = _3989;
            _3935 = _3995;
            _3997 = true;
        }
        else
        {
            bool _3999 = _3437 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4001 = isnan(_3437);
            bool _4003 = _3999 || _4001;
            bool _4005 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4007 = _4003 || _4005;
            if (!_4007)
            {
                _3883 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4009 = _3883;
            _3885 = _4009;
            if (!_4007)
            {
                _3911 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4011 = _3911;
            _3913 = _4011;
            if (!_4007)
            {
                _3865 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4013 = _3865;
            _3867 = _4013;
            if (!_4007)
            {
                _3917 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4015 = _3917;
            _3919 = _4015;
            if (!_4007)
            {
                _3905 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4017 = _3905;
            _3907 = _4017;
            if (!_4007)
            {
                _3933 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4019 = _3933;
            bool _4021 = !_4007;
            _3935 = _4019;
            if (!_4021)
            {
                bool _4023 = _3437 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4025 = isnan(_3437);
                bool _4027 = _4023 || _4025;
                bool _4029 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4031 = _4027 || _4029;
                if (!_4031)
                {
                    float _4033 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4035 = _3437 + _4033;
                    float _4037 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4039 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4037;
                    float _4041 = 1.0 / _4039;
                    float _4043 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4045 = _4043 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4047 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4049 = _4047 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4051 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4053 = _4051 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4055 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4057 = _4055 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4059 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4061 = _4059 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4063 = _4035 * _4041;
                    float _4065 = precise::clamp(_4063, 0.0, 1.0);
                    float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4069 = _4067 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4071 = fma(_4065, _4045, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4073 = fma(_4065, _4069, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4075 = fma(_4065, _4049, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4077 = fma(_4065, _4053, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4079 = fma(_4065, _4057, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4081 = fma(_4065, _4061, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3913 = _4073;
                    _3907 = _4079;
                    _3885 = _4071;
                    _3919 = _4077;
                    _3867 = _4075;
                    _3935 = _4081;
                    _3997 = true;
                }
                else
                {
                    _3913 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3907 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3885 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3919 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3867 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3935 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3997 = false;
    float _4083 = _3913;
    float _4085 = _3907;
    float _4087 = _3885;
    float _4089 = _3919;
    float _4091 = _3867;
    float _4093 = _3935;
    float _4095 = fma(_3843, -0.5, 0.5);
    float _4097 = precise::clamp(_4095, 0.0, 1.0);
    float _4099 = -_4083;
    float _4101 = _4099 + _4085;
    float _4103 = _3899 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4105 = -_4087;
    float _4107 = _4105 + _4089;
    float _4109 = fma(_4097, _4101, _4083);
    out.m_112.x = 0.0;
    float _4111 = -_4091;
    float _4113 = _4111 + _4093;
    float _4115 = fma(_4097, _4107, _4087);
    float _4117 = _4109 * 0.586610972881317138671875;
    out.m_59.x = _4103;
    bool _4119 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4121 = fma(_4097, _4113, _4091);
    float _4123 = fma(_4115, 0.298911988735198974609375, _4117);
    bool _4125 = _3353 > 0.0;
    bool _4127 = isnan(_3353);
    bool _4129 = _4125 || _4127;
    bool _4131 = isnan(0.0);
    bool _4133 = _4129 || _4131;
    float _4135 = fma(_4121, 0.114477999508380889892578125, _4123);
    float _4137 = -_4135;
    float _4139 = _4115 + _4137;
    float _4141 = -_4135;
    float _4143 = _4109 + _4141;
    float _4145 = -_4135;
    float _4147 = _4121 + _4145;
    float _4149 = fma(_4139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    float _4151 = fma(_4143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    float _4153 = fma(_4147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    bool _4155 = !_4119;
    if (!_4155)
    {
        float _4157 = -_3098;
        float _4159 = _4157 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4161 = -_3100;
        float _4163 = _4161 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4165 = -_3102;
        float _4167 = _4165 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4169 = _4159 * _4159;
        float _4171 = fma(_4163, _4163, _4169);
        float _4173 = fma(_4167, _4167, _4171);
        float _4175 = sqrt(_4173);
        float _4177 = rsqrt(_4173);
        float _4179 = -_4175;
        float _4181 = _4179 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4183 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4185 = precise::clamp(_4183, 0.0, 1.0);
        float _4187 = _4163 * _4177;
        float _4189 = _4159 * _4177;
        float _4191 = abs(_4185);
        float _4193 = log2(_4191);
        float _4195 = _4167 * _4177;
        float _4197 = _4187 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4199 = _3843 * _4189;
        float _4201 = -_4189;
        float _4203 = -_4197;
        float _4205 = fma(_4201, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4203);
        float _4207 = fma(_3841, _4187, _4199);
        float _4209 = -_4195;
        float _4211 = fma(_4209, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4205);
        float _4213 = fma(_3847, _4195, _4207);
        float _4215 = precise::clamp(_4213, 0.0, 1.0);
        float _4217 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4219 = _4211 + _4217;
        float _4221 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4223 = _4219 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4225 = precise::clamp(_4223, 0.0, 1.0);
        float _4227 = exp2(_4221);
        float _4229 = _4227 * _4225;
        float _4231 = _4215 * _4229;
        float _4233 = _4231 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4235 = _4231 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4237 = _4231 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_112.x = _4233;
        out.m_112.y = _4235;
        out.m_112.z = _4237;
    }
    out.m_84.x = _4149;
    out.m_84.y = _4151;
    out.m_84.z = _4153;
    if (_4133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4239 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4239;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_112 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3997 = false;
    bool _1263 = false;
    bool _939 = false;
    bool _803 = false;
    bool _425 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _126 = in.m_56.w;
    float _128 = trunc(_126);
    int _131 = int(_128);
    bool _135 = _131 >= 1;
    float _137 = 0.0;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (!_135)
    {
        out.m_59.x = 0.0;
    }
    int _141 = 0;
    if (!_135)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4295 = as_type<float>(_145);
        out.gl_Position.z = _4295;
    }
    if (!_135)
    {
        return out;
    }
    float _149 = in.m_61.w;
    float _151 = float(_131);
    float _153 = 1.0 / _151;
    float _155 = -_149;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _159 = _149 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _161 = isnan(_149);
    bool _163 = _159 || _161;
    bool _165 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _167 = _163 || _165;
    float _169 = _157 * _153;
    bool _171 = _157 >= _151;
    bool _173 = !_167;
    bool _175 = _171 || _173;
    out.m_63.x = _169;
    float _177 = 0.0;
    float _179 = _169;
    float _181 = _157;
    if (_175)
    {
        _177 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _183 = _177;
    if (_175)
    {
        out.m_59.x = 0.0;
    }
    if (_175)
    {
        float _185 = _183 * 5.0;
        _147 = as_type<int>(_185);
    }
    int _187 = _147;
    if (_175)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4367 = as_type<float>(_187);
        out.gl_Position.z = _4367;
    }
    if (_175)
    {
        return out;
    }
    float _189 = as_type<float>(int(gl_VertexIndex));
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _193 = as_type<int>(_189) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_189) & 2;
    bool _199 = _197 != 0;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_199;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_191;
    float _227;
    if (!_209)
    {
        float _211 = in.m_68.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        _227 = _169;
    }
    _229 = false;
    float _231 = _227;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = _231 + _233;
    bool _237 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _239 = isnan(_231);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _253 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _257;
    float _261 = 1.0 / _251;
    float _263 = -_247;
    float _265 = _263 + 1.0;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _269 = 1.0 / _259;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _271;
    float _275 = 1.0 / _255;
    float _277 = _235 * _261;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = _231 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _231 + _283;
    float _287 = fma(_273, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _289 = _281 * _269;
    bool _291 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _293 = isnan(_231);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = _301 * _265;
    bool _305 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _307 = isnan(_231);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = _285 * _275;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _319;
    bool _323 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_231);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _339 = -_301;
    float _341 = _339 + 1.0;
    float _343 = fma(_321, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = -_333;
    float _351 = _349 + 1.0;
    float _353 = _333 * _341;
    float _355 = fma(_347, _317, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _357 = _315 * _351;
    float _359 = in.m_70.x;
    float _361 = in.m_70.y;
    float _363 = -_315;
    float _365 = _363 + 1.0;
    float _367 = fma(_337, _317, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = _287 * _357;
    float _371 = _343 * _357;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _377;
    float _381 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _383 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _385 = fma(_375, _289, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _387 = fma(_379, _289, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _389 = fma(_367, _353, _381);
    float _391 = fma(_355, _353, _383);
    float _393 = fma(_385, _303, _389);
    float _395 = fma(_387, _303, _391);
    float _397 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].x, _393);
    float _399 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].y, _395);
    float _401 = _397 * _359;
    float _403 = _399 * _361;
    bool _405 = !_267;
    float _423;
    if (!_405)
    {
        float _407 = in.m_68.x;
        float _409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _411 = _407 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[11].x, _157);
        float _415 = _413 * _409;
        float _417 = floor(_415);
        float _419 = -_417;
        float _421 = _415 + _419;
        _423 = _421;
        _425 = true;
    }
    else
    {
        _423 = _169;
    }
    _425 = false;
    float _427 = _423;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _445 = 1.0 / _431;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _455 = 1.0 / _435;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _459 = _427 + _457;
    bool _461 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _463 = isnan(_427);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    bool _473 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _475 = isnan(_427);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -_471;
    float _487 = _485 + 1.0;
    float _489 = 1.0 / _439;
    float _491 = _459 * _445;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _495 = _427 + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _499 = _427 + _497;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _503 = _427 + _501;
    bool _505 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _507 = 1.0 / _449;
    float _509 = _495 * _455;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _513 = _427 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _517 = _427 + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _519;
    float _523 = 1.0 / _453;
    float _525 = _499 * _489;
    bool _527 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _529 = isnan(_427);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = fma(_521, _491, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _541 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _543 = isnan(_427);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = 1.0 / _443;
    float _555 = _513 * _507;
    float _557 = -_537;
    float _559 = _557 + 1.0;
    float _561 = -_551;
    float _563 = _561 + 1.0;
    float _565 = _551 * _559;
    float _567 = _517 * _523;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _569;
    float _573 = fma(_571, _491, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _575 = _483 * _487;
    bool _577 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _579 = isnan(_427);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = _503 * _553;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _591;
    float _595 = -_483;
    float _597 = _595 + 1.0;
    float _599 = fma(_593, _491, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _601 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _603 = isnan(_427);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = _471 * _563;
    bool _615 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _617 = isnan(_427);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _639 = _611 * _597;
    float _641 = -_625;
    float _643 = _641 + 1.0;
    float _645 = -_611;
    float _647 = _645 + 1.0;
    float _649 = fma(_633, _509, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _651 = _587 * _643;
    float _653 = -_587;
    float _655 = _653 + 1.0;
    float _657 = fma(_629, _509, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _659 = fma(_637, _509, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _661 = _573 * _651;
    float _663 = _599 * _651;
    float _665 = _625 * _647;
    float _667 = _539 * _651;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _669;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _685 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[107].y, _661);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _691 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[107].x, _663);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _693;
    float _697 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[107].z, _667);
    float _699 = fma(_675, _589, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _701 = fma(_683, _589, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _703 = fma(_657, _665, _685);
    float _705 = fma(_671, _525, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _707 = fma(_689, _589, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _709 = fma(_649, _665, _691);
    float _711 = fma(_679, _525, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _713 = fma(_695, _525, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _715 = fma(_659, _665, _697);
    float _717 = fma(_705, _639, _709);
    float _719 = fma(_711, _639, _703);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _721;
    float _725 = fma(_713, _639, _715);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _731;
    float _735 = fma(_723, _555, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _737 = fma(_699, _575, _717);
    float _739 = fma(_701, _575, _719);
    float _741 = fma(_707, _575, _725);
    float _743 = fma(_729, _555, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _753 = fma(_733, _555, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _759 = fma(_747, _567, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _761 = fma(_751, _567, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _763 = fma(_735, _613, _737);
    float _765 = fma(_757, _567, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _767 = fma(_743, _613, _739);
    float _769 = fma(_753, _613, _741);
    float _771 = fma(_759, _565, _763);
    float _773 = fma(_761, _565, _767);
    float _775 = fma(_765, _565, _769);
    float _777 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[113].x, _771);
    float _779 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[113].y, _773);
    float _781 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[113].z, _775);
    bool _783 = !_505;
    float _801;
    if (!_783)
    {
        float _785 = in.m_68.x;
        float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _789 = _785 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _791 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[11].y, _157);
        float _793 = _791 * _787;
        float _795 = floor(_793);
        float _797 = -_795;
        float _799 = _793 + _797;
        _801 = _799;
        _803 = true;
    }
    else
    {
        _801 = _169;
    }
    _803 = false;
    float _805 = _801;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _809 = _805 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _815 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _817 = isnan(_805);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _831 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _833 = isnan(_805);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _843;
    bool _847 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _849 = isnan(_805);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = 1.0 / _813;
    float _861 = -_825;
    float _863 = _861 + 1.0;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _867 = _805 + _865;
    bool _869 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _871 = _841 * _863;
    float _873 = -_841;
    float _875 = _873 + 1.0;
    float _877 = 1.0 / _829;
    float _879 = _845 * _859;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _885 = fma(_879, _809, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _887 = _883 * _877;
    float _889 = -_857;
    float _891 = _889 + 1.0;
    float _893 = _885 * _871;
    float _895 = _779 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _897 = fma(_887, _867, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _899 = _825 * _891;
    float _901 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[115].x, _893);
    float _903 = _781 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _905 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = fma(_897, _899, _901);
    float _909 = _777 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _911 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[117].x, _907);
    float _913 = _909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _915 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _917 = _911 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _913;
    out.m_72.y = _905;
    out.m_72.z = _915;
    out.m_72.w = _917;
    bool _919 = !_869;
    float _937;
    if (!_919)
    {
        float _921 = in.m_68.x;
        float _923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _925 = _921 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[11].z, _157);
        float _929 = _927 * _923;
        float _931 = floor(_929);
        float _933 = -_931;
        float _935 = _929 + _933;
        _937 = _935;
        _939 = true;
    }
    else
    {
        _937 = _169;
    }
    _939 = false;
    float _941 = _937;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _945 = _941 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _947;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _953 = _951 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _955;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _963 = 1.0 / _949;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _965;
    float _969 = 1.0 / _957;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _973 = _941 + _971;
    bool _975 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _977 = isnan(_941);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    float _987 = 1.0 / _953;
    float _989 = _973 * _963;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _993 = _941 + _991;
    bool _995 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _997 = isnan(_941);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1007;
    bool _1011 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1013 = 1.0 / _967;
    float _1015 = _993 * _969;
    bool _1017 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1019 = isnan(_941);
    bool _1021 = _1017 || _1019;
    bool _1023 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1025 = _1021 || _1023;
    float _1027 = float(_1025);
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1031 = _941 + _1029;
    bool _1033 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1035 = isnan(_941);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    float _1045 = -_1005;
    float _1047 = _1045 + 1.0;
    float _1049 = fma(_1009, _989, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1051 = 1.0 / _961;
    float _1053 = _945 * _987;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1057 = _941 + _1055;
    float _1059 = -_1027;
    float _1061 = _1059 + 1.0;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1063;
    float _1067 = -_1043;
    float _1069 = _1067 + 1.0;
    float _1071 = _1057 * _1013;
    bool _1073 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1075 = isnan(_941);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = fma(_1065, _989, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1087 = _985 * _1069;
    float _1089 = -_985;
    float _1091 = _1089 + 1.0;
    float _1093 = _1031 * _1051;
    float _1095 = _1005 * _1061;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1097;
    float _1101 = _1083 * _1047;
    float _1103 = -_1083;
    float _1105 = _1103 + 1.0;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1109 = _1107 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1111 = fma(_1099, _989, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1113 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1115 = isnan(_941);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1121 = _1117 || _1119;
    float _1123 = float(_1121);
    float _1125 = _1043 * _1105;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1135 = fma(_1109, _1053, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1137 = _1123 * _1091;
    float _1139 = fma(_1129, _1053, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1141 = fma(_1133, _1053, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1143 = _1111 * _1137;
    float _1145 = -_1123;
    float _1147 = _1145 + 1.0;
    float _1149 = _1085 * _1137;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1151;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1155;
    float _1159 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1143);
    float _1161 = _1049 * _1137;
    float _1163 = fma(_1153, _1015, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1165 = fma(_1157, _1015, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1169 = _1167 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1171 = fma(_1139, _1087, _1159);
    float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1173;
    float _1177 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1149);
    float _1179 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1161);
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1185 = fma(_1169, _1093, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1187 = fma(_1165, _1125, _1171);
    float _1189 = fma(_1175, _1015, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1191 = fma(_1141, _1087, _1177);
    float _1193 = fma(_1135, _1087, _1179);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1197 = _1195 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1199 = fma(_1183, _1093, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1201 = fma(_1163, _1125, _1191);
    float _1203 = fma(_1189, _1125, _1193);
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1209;
    float _1213 = fma(_1197, _1093, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1215;
    float _1219 = fma(_1207, _1071, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1221 = fma(_1211, _1071, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1223 = fma(_1185, _1101, _1187);
    float _1225 = fma(_1217, _1071, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1227 = fma(_1199, _1101, _1201);
    float _1229 = fma(_1213, _1101, _1203);
    float _1231 = fma(_1219, _1095, _1223);
    float _1233 = fma(_1221, _1095, _1227);
    float _1235 = fma(_1225, _1095, _1229);
    float _1237 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1231);
    float _1239 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1233);
    float _1241 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1235);
    bool _1243 = !_1011;
    float _1261;
    if (!_1243)
    {
        float _1245 = in.m_68.x;
        float _1247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1249 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[11].w, _157);
        float _1253 = _1251 * _1247;
        float _1255 = floor(_1253);
        float _1257 = -_1255;
        float _1259 = _1253 + _1257;
        _1261 = _1259;
        _1263 = true;
    }
    else
    {
        _1261 = _169;
    }
    _1263 = false;
    float _1265 = _1261;
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1269 = _1265 + _1267;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1277 = _1275 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1279 = _1265 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1281 = isnan(_1265);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1287 = _1283 || _1285;
    float _1289 = float(_1287);
    float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1293 = _1291 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1295 = _1265 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1297 = isnan(_1265);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1303 = _1299 || _1301;
    float _1305 = float(_1303);
    float _1307 = 1.0 / _1273;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1309;
    float _1313 = -_1289;
    float _1315 = _1313 + 1.0;
    bool _1317 = _1265 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1319 = isnan(_1265);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1325 = _1321 || _1323;
    float _1327 = float(_1325);
    bool _1329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1331 = 1.0 / _1277;
    float _1333 = 1.0 / _1293;
    float _1335 = _1311 * _1307;
    float _1337 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1339 = _1337 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1341 = _1305 * _1315;
    float _1343 = -_1305;
    float _1345 = _1343 + 1.0;
    float _1347 = fma(_1335, _1269, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1349;
    float _1353 = _1327 * _1345;
    float _1355 = _1339 * _1331;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1359 = _1265 + _1357;
    bool _1361 = _1265 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1363 = isnan(_1265);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1369 = _1365 || _1367;
    float _1371 = float(_1369);
    float _1373 = _1347 * _1353;
    float _1375 = -_1327;
    float _1377 = _1375 + 1.0;
    float _1379 = fma(_1355, _1359, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1383 = _1265 + _1381;
    float _1385 = _1351 * _1333;
    float _1387 = -_1371;
    float _1389 = _1387 + 1.0;
    float _1391 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1373);
    float _1393 = fma(_1385, _1383, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1395 = _1289 * _1389;
    float _1397 = fma(_1379, _1341, _1391);
    float _1399 = _1239 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1401 = fma(_1393, _1395, _1397);
    float _1403 = _1237 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1405 = _1241 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1407 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1409 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1401);
    float _1411 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1413 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1415 = _1409 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _1411;
    out.m_74.y = _1407;
    out.m_74.z = _1413;
    out.m_74.w = _1415;
    bool _1417 = !_1329;
    if (!_1417)
    {
        float _1419 = in.m_68.x;
        float _1421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1423 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1425 = fma(_1423, (*spvDescriptorSet0.vp_c9)._m0[14].x, _157);
        float _1427 = _1425 * _1421;
        float _1429 = floor(_1427);
        float _1431 = -_1429;
        float _1433 = _1427 + _1431;
        _179 = _1433;
    }
    float _1435 = _179;
    float _1437 = in.m_68.x;
    float _1439 = in.m_68.y;
    float _1441 = in.m_68.z;
    float _1443 = in.m_68.w;
    float _1445 = in.m_56.x;
    float _1447 = in.m_56.y;
    float _1449 = in.m_56.z;
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1455 = in.m_76.x;
    float _1457 = in.m_76.y;
    float _1459 = in.m_76.z;
    float _1461 = in.m_76.w;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1465 = _1463 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1467 = 1.0 / _1453;
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1473 = in.m_78.x;
    float _1475 = in.m_78.y;
    float _1477 = in.m_78.z;
    float _1479 = in.m_78.w;
    float _1481 = in.m_80.x;
    float _1483 = in.m_80.y;
    float _1485 = in.m_80.z;
    float _1487 = in.m_80.w;
    float _1489 = 1.0 / _1471;
    float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1493 = _1491 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1495 = _1443 > 0.5;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1499 = _1497 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1501 = 1.0 / _1465;
    float _1503 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1505 = _1503 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1507 = _1437 > 0.5;
    bool _1509 = _1439 > 0.5;
    float _1511 = _1447 * _1457;
    float _1513 = -_207;
    int _1515 = _1495 ? as_type<int>(_1513) : as_type<int>(_207);
    float _1517 = 1.0 / _1505;
    float _1519 = _1447 * _1475;
    float _1521 = fma(_1445, _1455, _1511);
    bool _1523 = _1441 > 0.5;
    float _1525 = _1447 * _1483;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1529 = _1527 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1531 = fma(_1445, _1473, _1519);
    float _1533 = fma(_1445, _1481, _1525);
    float _1535 = fma(_1449, _1459, _1521);
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1537;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1543 = _1541 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1545 = fma(_1449, _1477, _1531);
    float _1547 = fma(_1449, _1485, _1533);
    float _1549 = 1.0 / _1529;
    float _1551 = _1543 * _1467;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1553;
    float _1557 = _1539 * _1489;
    float _1559 = _1545 + _1479;
    float _1561 = _1535 + _1461;
    float _1563 = _1555 * _1501;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1567 = _1435 + _1565;
    float _1569 = 1.0 / _1499;
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1573 = _1559 + _1571;
    float _1575 = fma(_1557, _1567, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1577 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1579 = isnan(_1435);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1585 = _1581 || _1583;
    float _1587 = float(_1585);
    float _1589 = _1547 + _1487;
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1591;
    bool _1595 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1597 = isnan(_1435);
    bool _1599 = _1595 || _1597;
    bool _1601 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1603 = _1599 || _1601;
    float _1605 = float(_1603);
    float _1607 = 1.0 / _1493;
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1611 = _1435 + _1609;
    float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1615 = _1435 + _1613;
    float _1617 = -_1587;
    float _1619 = _1617 + 1.0;
    float _1621 = fma(_1551, _1611, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1623 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1625 = isnan(_1435);
    bool _1627 = _1623 || _1625;
    bool _1629 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1631 = _1627 || _1629;
    float _1633 = float(_1631);
    float _1635 = _1573 * _1573;
    float _1637 = _1593 * _1569;
    float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1641 = _1561 + _1639;
    float _1643 = -_1605;
    float _1645 = _1643 + 1.0;
    float _1647 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1647;
    float _1651 = fma(_1563, _1615, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1655 = _1653 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1657 = _1605 * _1619;
    bool _1659 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1661 = isnan(_1435);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1667 = _1663 || _1665;
    float _1669 = float(_1667);
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1673 = _1589 + _1671;
    float _1675 = fma(_1641, _1641, _1635);
    float _1677 = _1633 * _1645;
    float _1679 = _1649 * _1517;
    float _1681 = -_1633;
    float _1683 = _1681 + 1.0;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1687 = _1435 + _1685;
    float _1689 = _1655 * _1607;
    bool _1691 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1693 = isnan(_1435);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1699 = _1695 || _1697;
    float _1701 = float(_1699);
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1705 = _1435 + _1703;
    float _1707 = fma(_1673, _1673, _1675);
    float _1709 = -_1669;
    float _1711 = _1709 + 1.0;
    float _1713 = fma(_1679, _1687, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1715 = _1669 * _1683;
    float _1717 = fma(_1689, _1705, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1719 = _1701 * _1711;
    bool _1721 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1723 = isnan(_1435);
    bool _1725 = _1721 || _1723;
    bool _1727 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1729 = _1725 || _1727;
    float _1731 = float(_1729);
    float _1733 = sqrt(_1707);
    float _1735 = -_1701;
    float _1737 = _1735 + 1.0;
    int _1739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1741 = _1739 != 0;
    float _1743 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1745 = _1743 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _1747 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1749 = isnan(_1435);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1755 = _1751 || _1753;
    float _1757 = float(_1755);
    float _1759 = _1731 * _1737;
    float _1761 = -_1731;
    float _1763 = _1761 + 1.0;
    float _1765 = _1745 * _1549;
    float _1767 = rsqrt(_1707);
    bool _1769 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1771 = isnan(_1435);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1777 = _1773 || _1775;
    float _1779 = float(_1777);
    float _1781 = _1757 * _1763;
    float _1783 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1785 = _1435 + _1783;
    float _1787 = -_1757;
    float _1789 = _1787 + 1.0;
    float _1791 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1795 = _1793 != 0;
    float _1797 = fma(_1765, _1785, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1799 = _1779 * _1789;
    float _1801 = _1791 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1803 = _1733 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1805 = 0.0;
    float _1807 = _1637;
    float _1809 = _1573;
    float _1811 = _1797;
    float _1813 = _1657;
    if (_1741)
    {
        float _1815 = in.m_68.w;
        _1805 = _1815;
    }
    float _1817 = _1805;
    float _1819 = _1575 * _1799;
    float _1821 = -_1779;
    float _1823 = _1821 + 1.0;
    float _1825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1827 = precise::min(_1801, _1803);
    float _1829 = _1573 * _1767;
    float _1831 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1819);
    float _1833 = _1641 * _1767;
    float _1835 = _1673 * _1767;
    float _1837 = -_1829;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1573);
    float _1841 = _1829 * _1827;
    float _1843 = -_1833;
    float _1845 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1641);
    float _1847 = _1833 * _1827;
    float _1849 = _1839 * _1839;
    float _1851 = -_1841;
    float _1853 = _1573 + _1851;
    float _1855 = -_1835;
    float _1857 = fma(_1855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1673);
    float _1859 = fma(_1621, _1781, _1831);
    float _1861 = fma(_1845, _1845, _1849);
    float _1863 = -_1847;
    float _1865 = _1641 + _1863;
    float _1867 = _1853 * _1853;
    float _1869 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1871 = _1435 + _1869;
    float _1873 = -_203;
    int _1875 = _1507 ? as_type<int>(_1873) : as_type<int>(_203);
    float _1877 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1879 = fma(_1865, _1865, _1867);
    float _1881 = fma(_1637, _1871, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _1883 = as_type<int>(_1831);
    float _1885 = _1841;
    float _1887 = _1829;
    float _1889 = _1835;
    if (_1741)
    {
        float _1891 = _1817 * 3.1415927410125732421875;
        _1807 = _1891;
    }
    float _1893 = _1807;
    int _1895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1897 = _1895 != 0;
    float _1899 = fma(_1857, _1857, _1861);
    float _1901 = -_207;
    int _1903 = _1509 ? as_type<int>(_1901) : as_type<int>(_207);
    if (_1741)
    {
        float _1905 = _1893 * 0.15915493667125701904296875;
        _1883 = as_type<int>(_1905);
    }
    int _1907 = _1883;
    int _1909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1911 = _1909 != 0;
    float _1913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1917 = _1915 != 0;
    float _1919 = _1835 * _1827;
    float _1921 = -_203;
    int _1923 = _1523 ? as_type<int>(_1921) : as_type<int>(_203);
    bool _1925 = !_1795;
    float _1927 = _1925 ? _203 : as_type<float>(_1875);
    float _1929 = -_1919;
    float _1931 = _1673 + _1929;
    bool _1933 = !_1897;
    float _1935 = _1933 ? _207 : as_type<float>(_1903);
    float _1937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1939 = !_1911;
    float _1941 = _1939 ? _207 : as_type<float>(_1515);
    float _1943 = _1927 + 0.5;
    int _1945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1947 = _1945 != 0;
    float _1949 = -_1935;
    float _1951 = _1949 + 0.5;
    bool _1953 = !_1917;
    float _1955 = _1953 ? _203 : as_type<float>(_1923);
    float _1957 = -_1941;
    float _1959 = _1957 + 0.5;
    float _1961 = _1943 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1965 = _1951 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1967 = _1955 + 0.5;
    float _1969 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1971 = fma(_1931, _1931, _1879);
    float _1973 = -_207;
    float _1975 = _1973 + 0.5;
    float _1977 = _1961 * _1825;
    float _1979 = _1967 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1983 = _1965 * _1877;
    float _1985 = _1969 * _1913;
    float _1987 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1989 = _1979 * _1937;
    bool _1991 = _1947;
    if (!_1947)
    {
        _1809 = _1975;
    }
    float _1993 = _1809;
    int _1995 = _1907;
    float _1997 = _1993;
    if (_1741)
    {
        float _1999 = as_type<float>(_1907) * 6.283185482025146484375;
        float _2001 = sin(_1999);
        _1995 = as_type<int>(_2001);
    }
    int _2003 = _1995;
    float _2005 = sqrt(_1899);
    bool _2007 = !_1947;
    int _2009 = _2003;
    if (!_2007)
    {
        float _2011 = in.m_68.x;
        float _2013 = _2011 * 3.1415927410125732421875;
        float _2015 = _2013 * 0.15915493667125701904296875;
        float _2017 = _2015 * 6.283185482025146484375;
        float _2019 = sin(_2017);
        bool _2021 = _2019 > 0.5;
        float _2023 = -_207;
        float _2025 = _2021 ? _2023 : _207;
        float _2027 = -_2025;
        float _2029 = _2027 + 0.5;
        _1991 = _2021;
        _1997 = _2029;
    }
    bool _2031 = _1991;
    float _2033 = _1997;
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2037 = _2035 != 0;
    int _2039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2041 = _2039 != 0;
    float _2043 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1987);
    bool _2045 = _2031;
    if (_1741)
    {
        bool _2047 = as_type<float>(_2003) > 0.5;
        _2045 = _2047;
    }
    bool _2049 = _2045;
    float _2051 = fma(_1651, _1759, _1859);
    float _2053 = sqrt(_1971);
    float _2055 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2043);
    float _2057 = -_203;
    int _2059 = _1509 ? as_type<int>(_2057) : as_type<int>(_203);
    float _2061 = fma(_1717, _1719, _2051);
    float _2063 = -_207;
    int _2065 = _1523 ? as_type<int>(_2063) : as_type<int>(_207);
    out.m_82.x = _1977;
    out.m_82.y = _1983;
    out.m_82.z = _1989;
    out.m_82.w = _1985;
    float _2067 = fma(_1713, _1715, _2061);
    bool _2069 = !_2037;
    float _2071 = _2069 ? _203 : as_type<float>(_2059);
    float _2073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _2075 = !_2041;
    float _2077 = _2075 ? _207 : as_type<float>(_2065);
    float _2079 = _1767 * _2005;
    int _2081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2083 = _2081 != 0;
    int _2085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2087 = _2085 != 0;
    int _2089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2091 = _2089 != 0;
    float _2093 = _2071 + 0.5;
    bool _2095 = _2055 >= 0.0;
    float _2097 = -_2077;
    float _2099 = _2097 + 0.5;
    float _2101 = _1767 * _2053;
    float _2103 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    out.m_84.w = _1827;
    float _2105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2107 = fma(_1797, _1677, _2067);
    if (!_1741)
    {
        _1811 = _203;
    }
    float _2109 = _1811;
    float _2111 = _2033 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2113 = _2109;
    if (_1741)
    {
        float _2115 = -_203;
        float _2117 = _2049 ? _2115 : _203;
        _2113 = _2117;
    }
    float _2119 = _2113;
    float _2121 = fma(_1881, _1657, _2107);
    float _2123 = _2099 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2125 = _2101 * _2079;
    if (_2095)
    {
        _1813 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2127 = _1813;
    float _2129 = _2119 + 0.5;
    float _2131 = _2103 * _1963;
    float _2133 = _2111 * _2073;
    float _2135 = _2123 * _1981;
    float _2137 = _2129 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _2139 = as_type<int>(_2127);
    if (_2095)
    {
        float _2141 = _2127 * 5.0;
        _2139 = as_type<int>(_2141);
    }
    int _2143 = _2139;
    float _2145 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2121);
    if (_2095)
    {
        out.m_59.x = 0.0;
    }
    float _2147 = _2137 * _2105;
    float _2149 = _1791 * _2125;
    out.m_86.x = _2131;
    out.m_86.y = _2135;
    bool _2151 = !_2083;
    int _2153 = _2151 ? 0 : 1;
    bool _2155 = !_2087;
    int _2157 = _2155 ? 0 : 1;
    out.m_88.x = _2147;
    out.m_88.y = _2133;
    bool _2159 = !_2091;
    int _2161 = _2159 ? 0 : 1;
    if (_2095)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7558 = as_type<float>(_2143);
        out.gl_Position.z = _7558;
    }
    out.m_90.x = _2145;
    out.m_92.x = _2149;
    if (_2095)
    {
        return out;
    }
    float _2163 = -_1829;
    float _2165 = fma(_2163, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1559);
    float _2167 = -_1833;
    float _2169 = fma(_2167, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1561);
    float _2171 = -_1835;
    float _2173 = fma(_2171, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1589);
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2177 = _2165 + _2175;
    float _2179 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2181 = _2169 + _2179;
    float _2183 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2185 = _2173 + _2183;
    float _2187 = _2177 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2189 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2187);
    float _2191 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2189);
    bool _2193 = _2191 >= 0.0;
    float _2195 = _2185;
    if (_2193)
    {
        _2195 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2197 = _2195;
    int _2199 = as_type<int>(_2197);
    if (_2193)
    {
        out.m_59.x = 0.0;
    }
    if (_2193)
    {
        float _2201 = _2197 * 5.0;
        _2199 = as_type<int>(_2201);
    }
    int _2203 = _2199;
    if (_2193)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7649 = as_type<float>(_2203);
        out.gl_Position.z = _7649;
    }
    if (_2193)
    {
        return out;
    }
    float _2205 = -_1847;
    float _2207 = _1561 + _2205;
    float _2209 = -_1919;
    float _2211 = _1589 + _2209;
    float _2213 = -_1833;
    float _2215 = fma(_2213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2207);
    float _2217 = -_1835;
    float _2219 = fma(_2217, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2211);
    float _2221 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2223 = fma(_2219, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2225 = floor(_2221);
    float _2227 = floor(_2223);
    float _2229 = -_2225;
    float _2231 = _2221 + _2229;
    float _2233 = -_2227;
    float _2235 = _2223 + _2233;
    float2 _7709 = float2(_2231, _2235);
    float _2237 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7709, float2(0.0), isnan(_7709)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7709, float2(0.0), isnan(_7709)), level(0.0)).x;
    float _2239 = _1441 * 2.0;
    float _2241 = _1437 * 2.0;
    float _2243 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2245 = log2(_2243);
    float _2247 = _1439 + _1437;
    float _2249 = _1439 * 2.0;
    float _2251 = _1439 + _1441;
    float _2253 = _2247 + (-1.0);
    int _2255 = abs(_2157);
    float _2257 = _2251 + (-1.0);
    float _2259 = floor(_2239);
    float _2261 = _1439 + (-0.5);
    float _2263 = fma(_2257, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2265 = abs(_2161);
    float _2267 = _2125 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2269 = _2267 * 0.5;
    float _2271 = fma(_2253, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2273 = floor(_2241);
    float _2275 = _2245 * _157;
    bool _2277 = _2259 > 0.0;
    float _2279 = floor(_2249);
    bool _2281 = _2259 >= 0.0;
    bool _2283 = isnan(_2259);
    bool _2285 = _2281 || _2283;
    bool _2287 = isnan(0.0);
    bool _2289 = _2285 || _2287;
    int _2291 = _2289 ? 0 : 1;
    bool _2293 = _2273 > 0.0;
    float _2295 = exp2(_2275);
    int _2297 = abs(_2153);
    float _2299 = in.m_94.x;
    float _2301 = in.m_94.y;
    float _2303 = in.m_94.z;
    int _2305 = ~_2291;
    int _2307 = _2305 + 1;
    int _2309 = _2307 + 1;
    int _2311 = _2309;
    int _2313 = 2;
    float _2315 = _2215;
    if (!_2277)
    {
        int _2317 = ~_2291;
        int _2319 = _2317 + 1;
        _2311 = _2319;
    }
    int _2321 = _2311;
    bool _2323 = _2273 >= 0.0;
    bool _2325 = isnan(_2273);
    bool _2327 = _2323 || _2325;
    bool _2329 = isnan(0.0);
    bool _2331 = _2327 || _2329;
    float _2333 = float(_2321);
    float _2335 = float(_2297);
    int _2337 = _2331 ? 0 : 1;
    float _2339 = _2335 * _2333;
    int _2341 = ~_2337;
    int _2343 = _2341 + 1;
    int _2345 = _2343 + 1;
    float _2347 = -_2295;
    float _2349 = _2347 + 1.0;
    int _2351 = _2345;
    if (!_2293)
    {
        int _2353 = ~_2337;
        int _2355 = _2353 + 1;
        _2351 = _2355;
    }
    int _2357 = _2351;
    float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2361 = 1.0 + _2359;
    float _2363 = _2339 * (-2.0);
    bool _2365 = _2279 > 0.0;
    float _2367 = _1437 + (-0.5);
    bool _2369 = _2279 >= 0.0;
    bool _2371 = isnan(_2279);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(0.0);
    bool _2377 = _2373 || _2375;
    float _2379 = 1.0 / _2361;
    float _2381 = fma(_2363, _2299, _2299);
    float _2383 = float(_2255);
    float _2385 = _1441 + _1437;
    bool _2387 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2389 = isnan(1.0);
    bool _2391 = _2387 || _2389;
    bool _2393 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2395 = _2391 || _2393;
    float _2397 = fma(_2367, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2381);
    int _2399 = _2377 ? 0 : 1;
    float _2401 = _2385 + (-1.0);
    bool _2403 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2405 = isnan(0.0);
    bool _2407 = _2403 || _2405;
    bool _2409 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2411 = _2407 || _2409;
    float _2413 = _1441 + (-0.5);
    float _2415 = float(_2357);
    float _2417 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _2419 = ~_2399;
    int _2421 = _2419 + 1;
    int _2423 = _2421 + 1;
    float _2425 = fma(_2271, _2363, _2271);
    int _2427 = _2423;
    if (!_2365)
    {
        int _2429 = ~_2399;
        int _2431 = _2429 + 1;
        _2427 = _2431;
    }
    int _2433 = _2427;
    float _2435 = _2383 * _2415;
    float _2437 = _2411 ? _2349 : 0.0;
    float _2439 = _2435 * (-2.0);
    if (_2395)
    {
        float _2441 = _2437 * _2379;
        _181 = _2441;
    }
    float _2443 = _181;
    float _2445 = float(_2433);
    float _2447 = fma(_2439, _2301, _2301);
    float _2449 = float(_2265);
    float _2451 = fma(_2263, _2439, _2263);
    float _2453 = fma(_2261, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2447);
    float _2455 = fma(_2425, _2443, _2397);
    float _2457 = _2449 * _2445;
    float _2459 = fma(_2451, _2443, _2453);
    float _2461 = fma(_2401, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2463 = _2457 * (-2.0);
    float _2465 = -_1841;
    float _2467 = _1559 + _2465;
    float _2469 = _2459 * 0.15915493667125701904296875;
    float _2471 = _2455 * 0.15915493667125701904296875;
    float _2473 = fma(_2463, _2303, _2303);
    float _2475 = fma(_2461, _2463, _2461);
    float _2477 = -_1829;
    float _2479 = fma(_2477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2467);
    float _2481 = _2471 * 6.283185482025146484375;
    float _2483 = sin(_2481);
    float _2485 = fma(_2413, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2473);
    float _2487 = _2479 + _2417;
    float _2489 = fma(_2475, _2443, _2485);
    float _2491 = _2479 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2493 = _2487 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2495 = _2487 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2497 = _2471 * 6.283185482025146484375;
    float _2499 = cos(_2497);
    float _2501 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2491);
    float _2503 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2493);
    float _2505 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2495);
    float _2507 = _2489 * 0.15915493667125701904296875;
    float _2509 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2501);
    float _2511 = fma(_2219, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2503);
    float _2513 = fma(_2219, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2505);
    float _2515 = _2469 * 6.283185482025146484375;
    float _2517 = sin(_2515);
    float _2519 = _2509 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2521 = _2479 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2523 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2525 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2527 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2521);
    float _2529 = 1.0 / _2519;
    float _2531 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2527);
    float _2533 = _2531 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2535 = _2469 * 6.283185482025146484375;
    float _2537 = cos(_2535);
    float _2539 = _2499 * _2517;
    float _2541 = _2533 + _2519;
    float _2543 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2545 = _2507 * 6.283185482025146484375;
    float _2547 = sin(_2545);
    float _2549 = _2541 * _2529;
    float _2551 = _2549 * 0.5;
    float _2553 = _2483 * _2517;
    float _2555 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2557 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2555);
    float _2559 = trunc(_2523);
    int _2561 = int(_2559);
    float _2563 = _2499 * _2537;
    float _2565 = _2483 * _2537;
    float _2567 = trunc(_2525);
    int _2569 = int(_2567);
    float _2571 = fma(_2547, _2563, _2553);
    float _2573 = fma(_2547, _2553, _2563);
    float _2575 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2577 = -_2539;
    float _2579 = fma(_2547, _2565, _2577);
    float _2581 = -_2565;
    float _2583 = fma(_2547, _2539, _2581);
    float _2585 = _2575 * _2125;
    float _2587 = _2507 * 6.283185482025146484375;
    float _2589 = cos(_2587);
    int _2591 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2593 = _2561 + _2591;
    int _2595 = _2593 + 1;
    float _2597 = _2585 * _2543;
    bool _2599 = _2595 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2601 = 1.0 / _2557;
    int _2603 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2605 = _2569 + _2603;
    int _2607 = _2605 + 1;
    int _2609 = _2595 | _2607;
    float _2611 = _2499 * _2589;
    float _2613 = _2537 * _2589;
    float _2615 = _2483 * _2589;
    float _2617 = _2517 * _2589;
    float _2619 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    bool _2621 = _2609 < 0;
    bool _2623 = _2621 || _2599;
    float _2625 = -_2597;
    float _2627 = _2547 * _2625;
    float _2629 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2631 = _2601 * _2629;
    float _2633 = _2149 * _2619;
    float _2635 = _2611 * _2597;
    bool _2637 = _2607 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2639 = _2637 || _2623;
    float _2641 = _2615 * _2597;
    bool _2643 = _2631 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2645 = fma(_2571, _2633, _2635);
    bool _2647 = _2631 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2649 = fma(_2613, _2633, _2627);
    float _2651 = fma(_2579, _2633, _2641);
    float _2653 = fma(_2583, _2269, _2645);
    bool _2655 = !_2643;
    int _2657 = _2655 ? 0 : 1;
    float _2659 = fma(_2617, _2269, _2649);
    float _2661 = fma(_2573, _2269, _2651);
    float _2663 = _2653 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2665 = _2653 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2667 = as_type<int>(_2651);
    float _2669 = _2653;
    float _2671 = _2659;
    if (!_2639)
    {
        int _2673 = _2607 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2675 = _2673 + _2595;
        _2009 = _2675;
    }
    int _2677 = _2009;
    float _2679 = _2653 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_2643)
    {
        _2313 = 1;
    }
    int _2681 = _2313;
    float _2683 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2665);
    int _2685 = _2681;
    if (!_2647)
    {
        _2685 = _2657;
    }
    int _2687 = _2685;
    float _2689 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2663);
    float _2691 = as_type<float>(_2687);
    if (!_2639)
    {
        int _2693 = _2677 << 2;
        _2667 = _2693;
    }
    int _2695 = _2667;
    float _2697 = fma(_2661, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2683);
    int _2699 = _2687 << 6;
    float _2701 = fma(_2661, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2689);
    int _2703 = _2695;
    int _2705 = as_type<int>(_2701);
    if (!_2639)
    {
        int _2707 = 12 & _2695;
        _2703 = _2707;
    }
    int _2709 = _2703;
    float _2711 = _2697 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _2713 = _2699 + 96;
    uint _2716 = uint(int(uint(_2713) >> uint(2)));
    uint _2718 = uint(int(uint(int(_2716)) >> uint(2)));
    int _2720 = int(_2716) & 3;
    float _2722 = (*spvDescriptorSet0.vp_c15)._m0[int(_2718)][_2720];
    int _2724 = int(_2716) + 1;
    uint _2726 = uint(int(uint(_2724) >> uint(2)));
    int _2728 = _2724 & 3;
    float _2730 = (*spvDescriptorSet0.vp_c15)._m0[int(_2726)][_2728];
    float _2732 = _2701 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    if (!_2639)
    {
        uint _2734 = uint(int(uint(_2677) >> uint(2)));
        _2705 = int(_2734);
    }
    int _2736 = _2705;
    float _2738 = _1589 + _2711;
    float _2740 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2679);
    float _2742 = _1561 + _2732;
    float _2744 = 0.0;
    float _2746 = _2742;
    float _2748 = _2738;
    if (!_2639)
    {
        int _2750 = _2736 << 4;
        int _2752 = _2750 + _2709;
        _2744 = as_type<float>(_2752);
    }
    float _2754 = _2744;
    float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2758 = _2738 + _2756;
    int _2760 = _2699 + 48;
    uint _2762 = uint(int(uint(_2760) >> uint(2)));
    uint _2764 = uint(int(uint(int(_2762)) >> uint(2)));
    int _2766 = int(_2762) & 3;
    float _2768 = (*spvDescriptorSet0.vp_c15)._m0[int(_2764)][_2766];
    int _2770 = int(_2762) + 1;
    uint _2772 = uint(int(uint(_2770) >> uint(2)));
    int _2774 = _2770 & 3;
    float _2776 = (*spvDescriptorSet0.vp_c15)._m0[int(_2772)][_2774];
    float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2780 = _2742 + _2778;
    if (!_2639)
    {
        float _2782 = floor(_2523);
        _2669 = _2782;
    }
    float _2784 = _2669;
    float _2786 = _2758 * _2758;
    float _2788 = fma(_2661, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2740);
    float _2790 = fma(_2780, _2780, _2786);
    int _2792 = _2699 + 64;
    uint _2794 = uint(int(uint(_2792) >> uint(2)));
    uint _2796 = uint(int(uint(int(_2794)) >> uint(2)));
    int _2798 = int(_2794) & 3;
    float _2800 = (*spvDescriptorSet0.vp_c15)._m0[int(_2796)][_2798];
    int _2802 = int(_2794) + 1;
    uint _2804 = uint(int(uint(_2802) >> uint(2)));
    int _2806 = _2802 & 3;
    float _2808 = (*spvDescriptorSet0.vp_c15)._m0[int(_2804)][_2806];
    float _2810 = _2788 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    if (!_2639)
    {
        float _2812 = floor(_2525);
        _2671 = _2812;
    }
    float _2814 = _2671;
    int _2816 = _2699 + 104;
    uint _2818 = uint(int(uint(_2816) >> uint(2)));
    uint _2820 = uint(int(uint(int(_2818)) >> uint(2)));
    int _2822 = int(_2818) & 3;
    float _2824 = (*spvDescriptorSet0.vp_c15)._m0[int(_2820)][_2822];
    int _2826 = int(_2818) + 1;
    uint _2828 = uint(int(uint(_2826) >> uint(2)));
    int _2830 = _2826 & 3;
    float _2832 = (*spvDescriptorSet0.vp_c15)._m0[int(_2828)][_2830];
    float _2834 = sqrt(_2790);
    int _2836 = _2699 + 56;
    uint _2838 = uint(int(uint(_2836) >> uint(2)));
    uint _2840 = uint(int(uint(int(_2838)) >> uint(2)));
    int _2842 = int(_2838) & 3;
    float _2844 = (*spvDescriptorSet0.vp_c15)._m0[int(_2840)][_2842];
    int _2846 = int(_2838) + 1;
    uint _2848 = uint(int(uint(_2846) >> uint(2)));
    int _2850 = _2846 & 3;
    float _2852 = (*spvDescriptorSet0.vp_c15)._m0[int(_2848)][_2850];
    int _2854 = _2699 + 72;
    uint _2856 = uint(int(uint(_2854) >> uint(2)));
    uint _2858 = uint(int(uint(int(_2856)) >> uint(2)));
    int _2860 = int(_2856) & 3;
    float _2862 = (*spvDescriptorSet0.vp_c15)._m0[int(_2858)][_2860];
    int _2864 = int(_2856) + 1;
    uint _2866 = uint(int(uint(_2864) >> uint(2)));
    int _2868 = _2864 & 3;
    float _2870 = (*spvDescriptorSet0.vp_c15)._m0[int(_2866)][_2868];
    bool _2872 = _2834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2874 = _2699 + 80;
    uint _2876 = uint(int(uint(_2874) >> uint(2)));
    uint _2878 = uint(int(uint(int(_2876)) >> uint(2)));
    int _2880 = int(_2876) & 3;
    float _2882 = (*spvDescriptorSet0.vp_c15)._m0[int(_2878)][_2880];
    int _2884 = int(_2876) + 1;
    uint _2886 = uint(int(uint(_2884) >> uint(2)));
    int _2888 = _2884 & 3;
    float _2890 = (*spvDescriptorSet0.vp_c15)._m0[int(_2886)][_2888];
    float _2892 = _2487 * _2730;
    int _2894 = _2699 + 88;
    uint _2896 = uint(int(uint(_2894) >> uint(2)));
    uint _2898 = uint(int(uint(int(_2896)) >> uint(2)));
    int _2900 = int(_2896) & 3;
    float _2902 = (*spvDescriptorSet0.vp_c15)._m0[int(_2898)][_2900];
    int _2904 = int(_2896) + 1;
    uint _2906 = uint(int(uint(_2904) >> uint(2)));
    int _2908 = _2904 & 3;
    float _2910 = (*spvDescriptorSet0.vp_c15)._m0[int(_2906)][_2908];
    float _2912 = _2487 * _2776;
    float _2914 = _2754;
    if (!_2639)
    {
        int _2916 = as_type<int>(_2754) + 400;
        uint _2918 = uint(int(uint(_2916) >> uint(2)));
        uint _2920 = uint(int(uint(int(_2918)) >> uint(2)));
        int _2922 = int(_2918) & 3;
        float _2924 = (*spvDescriptorSet0.vp_c15)._m0[int(_2920)][_2922];
        _2914 = _2924;
    }
    float _2926 = _2914;
    float _2928 = _2487 * _2808;
    float _2930 = fma(_2215, _2722, _2892);
    float _2932 = fma(_2215, _2768, _2912);
    float _2934 = _1559 + _2810;
    float _2936 = fma(_2215, _2800, _2928);
    float _2938 = fma(_2219, _2824, _2930);
    bool _2940 = !_2872;
    float _2942 = _2934;
    float _2944 = _2852;
    if (!_2940)
    {
        float _2946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2948 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2950 = _2834 + _2948;
        float _2952 = _2934 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2954 = rsqrt(_2790);
        float _2956 = _2950 * _2946;
        float _2958 = _2956 * 0.15915493667125701904296875;
        float _2960 = _2958 * 6.283185482025146484375;
        float _2962 = cos(_2960);
        float _2964 = _2958 * 6.283185482025146484375;
        float _2966 = sin(_2964);
        float _2968 = _2962 + (-1.0);
        float _2970 = fma(_2966, _2952, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2972 = _2968 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2974 = _2954 * _2970;
        float _2976 = fma(_2934, _2962, _2972);
        float _2978 = fma(_2780, _2974, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2980 = fma(_2758, _2974, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2942 = _2976;
        _2746 = _2978;
        _2748 = _2980;
    }
    float _2982 = _2942;
    float _2984 = _2746;
    float _2986 = _2748;
    float _2988 = _2938 + _2832;
    bool _2990 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2992 = isnan(0.5);
    bool _2994 = _2990 || _2992;
    bool _2996 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2998 = _2994 || _2996;
    float _3000 = fma(_2219, _2844, _2932);
    float _3002 = -_1841;
    float _3004 = _3002 + _2982;
    float _3006 = 1.0 / _2988;
    float _3008 = -_1847;
    float _3010 = _3008 + _2984;
    float _3012 = -_1919;
    float _3014 = _3012 + _2986;
    float _3016 = -_1829;
    float _3018 = fma(_3016, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3004);
    float _3020 = fma(_2219, _2862, _2936);
    float _3022 = _3000 + _2852;
    float _3024 = -_1833;
    float _3026 = fma(_3024, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3010);
    float _3028 = -_1835;
    float _3030 = fma(_3028, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3014);
    float _3032 = _3020 + _2870;
    float _3034 = _3026;
    float _3036 = _3030;
    if (_2998)
    {
        _2944 = _3018;
    }
    float _3038 = _2944;
    float _3040 = _3038;
    if (!_2998)
    {
        float _3042 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3044 = _2479 + _3042;
        float _3046 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3048 = _2215 + _3046;
        float _3050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3052 = -_1589;
        float _3054 = _3052 + _2986;
        float _3056 = _3044 * _3044;
        float _3058 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3060 = _2219 + _3058;
        float _3062 = -_1559;
        float _3064 = _3062 + _2982;
        float _3066 = fma(_3048, _3048, _3056);
        float _3068 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3070 = fma(_3060, _3060, _3066);
        float _3072 = sqrt(_3070);
        float _3074 = 1.0 / _2079;
        float _3076 = _3068 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3078 = precise::min(_3072, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3080 = _3078 * _3050;
        float _3082 = _3080 * _3074;
        float _3084 = -_1561;
        float _3086 = _3084 + _2984;
        float _3088 = _3076 * _3082;
        float _3090 = _3054 * _3082;
        float _3092 = fma(_3086, _3088, _2215);
        float _3094 = fma(_3064, _3088, _2479);
        float _3096 = fma(_3076, _3090, _2219);
        _3040 = _3094;
        _3034 = _3092;
        _3036 = _3096;
    }
    float _3098 = _3040;
    float _3100 = _3034;
    float _3102 = _3036;
    float _3104 = _3098 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3106 = _3098 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3108 = _3022 * _3006;
    float _3110 = _3098 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3112 = fma(_3100, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3104);
    float _3114 = fma(_3100, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3106);
    float _3116 = _3098 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _3118 = _3108 >= 0.0;
    float _3120 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3112);
    float _3122 = fma(_3100, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3110);
    float _3124 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3114);
    float _3126 = _3032 * _3006;
    float _3128 = _3120 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3130 = _3108 <= 1.0;
    bool _3132 = _3130 && _3118;
    float _3134 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3122);
    float _3136 = fma(_3100, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3116);
    float _3138 = _3124 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3140 = _3128 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3142 = _3134 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _3144 = _3126 >= 0.0;
    bool _3146 = _3144 && _3132;
    float _3148 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3136);
    float _3150 = fma(_3138, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3140);
    float _3152 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3154 = _3142 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _3156 = _3126 <= 1.0;
    bool _3158 = _3156 && _3146;
    float _3160 = _3148 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3162 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3150);
    float _3164 = -_3154;
    float _3166 = fma(_3164, _3152, 1.0);
    float _3168 = _2487 * _2890;
    float _3170 = _3128 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3172 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3162);
    float _3174 = _3128 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3176 = fma(_2215, _2882, _3168);
    float _3178 = log2(_3166);
    float _3180 = fma(_3138, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3170);
    float _3182 = fma(_3138, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3174);
    float _3184 = fma(_2219, _2902, _3176);
    float _3186 = _3176;
    if (_3158)
    {
        float _3188 = float(_2687);
        _2691 = _3188;
    }
    float _3190 = _2691;
    float _3192 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3180);
    float _3194 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3182);
    float _3196 = _3184 + _2910;
    float _3198 = 1.0 / _3172;
    float _3200 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3192);
    float _3202 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3194);
    float _3204 = _3200;
    if (!_2639)
    {
        float _3206 = -_2784;
        float _3208 = _2523 + _3206;
        _3186 = _3208;
    }
    float _3210 = _3186;
    if (!_2639)
    {
        float _3212 = -_2814;
        float _3214 = _2525 + _3212;
        _1885 = _3214;
    }
    float _3216 = _1885;
    float _3218 = _3196 * _3006;
    float _3220 = _2988;
    if (!_2639)
    {
        float _3222 = rint(_2926);
        float _3224 = precise::max(_3222, 0.0);
        uint _3226 = uint(_3224);
        uint _3228 = clamp(_3226, 0u, 65535u);
        _3220 = as_type<float>(_3228);
    }
    float _3230 = _3220;
    float _3232 = _3178 * 0.693147182464599609375;
    float _3234 = _3232 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3236 = _3174;
    float _3238 = _3232;
    if (_3158)
    {
        float _3240 = rint(_3190);
        float _3242 = precise::max(_3240, 0.0);
        uint _3244 = uint(_3242);
        uint _3246 = clamp(_3244, 0u, 65535u);
        _3236 = as_type<float>(_3246);
    }
    float _3248 = _3236;
    float _3250 = _3200 * _3198;
    float _3252 = _3202 * _3198;
    float _3254 = fma(_3250, 0.5, 0.5);
    float _3256 = fma(_3252, -0.5, 0.5);
    float _3258 = _3216;
    float _3260 = _3256;
    if (!_2639)
    {
        float3 _9338 = float3(_3210, _3216, float(as_type<int>(_3230)));
        float3 _9342 = select(_9338, float3(0.0), isnan(_9338));
        float _3262 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9342.xy, uint(rint(_9342.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9342.xy, uint(rint(_9342.z)), level(0.0)).x;
        _3258 = _3262;
    }
    float _3264 = _3258;
    float _3266 = _3126;
    if (_3158)
    {
        float3 _9357 = float3(_3108, _3126, float(as_type<int>(_3248)));
        float3 _9359 = select(_9357, float3(0.0), isnan(_9357));
        float _3268 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9359.xy, uint(rint(_9359.z)), _3218, level(0.0));
        _3266 = _3268;
    }
    float _3270 = _3266;
    float3 _9369 = float3(_3254, _3256, _3234);
    float _3272 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9369, float3(0.0), isnan(_9369)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9369, float3(0.0), isnan(_9369)), level(0.0)).x;
    float3 _9378 = float3(_3254, _3256, _3234);
    float4 _3275 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9378, float3(0.0), isnan(_9378)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9378, float3(0.0), isnan(_9378)), level(0.0)).xyzw;
    float _3277 = _3275.x;
    float _3279 = _3275.y;
    float _3281 = _3275.z;
    float _3283 = _3275.w;
    bool _3285 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3287 = isnan(0.5);
    bool _3289 = _3285 || _3287;
    bool _3291 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3293 = _3289 || _3291;
    if (_2639)
    {
        _3238 = 1.0;
    }
    float _3295 = _3238;
    float _3297 = _3295;
    if (_3293)
    {
        _1887 = 1.0;
    }
    float _3299 = _1887;
    float _3301 = _3299;
    if (!_3293)
    {
        float _3303 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3305 = _3303 * 0.15915493667125701904296875;
        float _3307 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3309 = _3305 * 6.283185482025146484375;
        float _3311 = cos(_3309);
        float _3313 = _3307 * 0.15915493667125701904296875;
        float _3315 = _3305 * 6.283185482025146484375;
        float _3317 = sin(_3315);
        float _3319 = 1.0 / _3311;
        float _3321 = _3313 * 6.283185482025146484375;
        float _3323 = cos(_3321);
        float _3325 = _3317 * _3319;
        float _3327 = _3313 * 6.283185482025146484375;
        float _3329 = sin(_3327);
        float _3331 = _3323 * _3325;
        float _3333 = 1.0 / _3331;
        float _3335 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3337 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3335;
        float _3339 = 1.0 / _3337;
        float _3341 = _3329 * _3333;
        float _3343 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3345 = fma(_2631, _3341, _3343);
        float _3347 = _3345 * _3339;
        float _3349 = precise::clamp(_3347, 0.0, 1.0);
        _3260 = _3345;
        _3301 = _3349;
    }
    float _3351 = _3260;
    float _3353 = _3301;
    if (!_2639)
    {
        int _3355 = _2677 << 4;
        int _3357 = _3355 + 2048;
        uint _3359 = uint(int(uint(_3357) >> uint(2)));
        uint _3361 = uint(int(uint(int(_3359)) >> uint(2)));
        int _3363 = int(_3359) & 3;
        float _3365 = (*spvDescriptorSet0.vp_c15)._m0[int(_3361)][_3363];
        int _3367 = int(_3359) + 1;
        uint _3369 = uint(int(uint(_3367) >> uint(2)));
        int _3371 = _3367 & 3;
        float _3373 = (*spvDescriptorSet0.vp_c15)._m0[int(_3369)][_3371];
        int _3375 = _3357 + 8;
        uint _3377 = uint(int(uint(_3375) >> uint(2)));
        uint _3379 = uint(int(uint(int(_3377)) >> uint(2)));
        int _3381 = int(_3377) & 3;
        float _3383 = (*spvDescriptorSet0.vp_c15)._m0[int(_3379)][_3381];
        int _3385 = int(_3377) + 1;
        uint _3387 = uint(int(uint(_3385) >> uint(2)));
        int _3389 = _3385 & 3;
        float _3391 = (*spvDescriptorSet0.vp_c15)._m0[int(_3387)][_3389];
        float _3393 = _2487 * _3373;
        float _3395 = fma(_2215, _3365, _3393);
        float _3397 = fma(_2219, _3383, _3395);
        float _3399 = _3397 + _3391;
        float _3401 = precise::clamp(_3399, 0.0, 1.0);
        float _3403 = -_3401;
        float _3405 = _3403 + _3264;
        float _3407 = fma(_3405, 500.0, 1.5);
        float _3409 = exp2(_3407);
        float _3411 = 0.0 + _3409;
        float _3413 = precise::clamp(_3411, 0.0, 1.0);
        _3297 = _3413;
    }
    float _3415 = _3297;
    float _3417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3419 = _3098 + _3417;
    float _3421 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3423 = _3100 + _3421;
    float _3425 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3427 = _3102 + _3425;
    float _3429 = _3419 * _3419;
    float _3431 = fma(_3423, _3423, _3429);
    float _3433 = fma(_3427, _3427, _3431);
    float _3435 = rsqrt(_3433);
    float _3437 = sqrt(_3433);
    float _3439 = _3435 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3441 = _3423 * _3439;
    float _3443 = _3427 * _3439;
    float _3445 = _3441 * _3441;
    float _3447 = _3443 * _3443;
    float _3449 = _3445 + _3447;
    float _3451 = sqrt(_3449);
    bool _3453 = _3451 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3457 = _3451 + _3455;
    float _3459 = _3351;
    float _3461 = _3449;
    float _3463 = _3457;
    float _3465 = _3441;
    float _3467 = _3443;
    float _3469 = _3445;
    float _3471 = _3447;
    if (_3453)
    {
        float _3473 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3459 = _3473;
    }
    float _3475 = _3459;
    if (_3453)
    {
        float _3477 = rsqrt(_3449);
        _3461 = _3477;
    }
    float _3479 = _3461;
    if (_3453)
    {
        float _3481 = _3457 * _3475;
        _3463 = _3481;
    }
    float _3483 = _3463;
    if (_3453)
    {
        float _3485 = _3483 * 0.15915493667125701904296875;
        _1889 = _3485;
    }
    float _3487 = _1889;
    float _3489 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3491 = _3234;
    float _3493 = _3489;
    if (_3453)
    {
        float _3495 = _3487 * 6.283185482025146484375;
        float _3497 = sin(_3495);
        _3491 = _3497;
    }
    float _3499 = _3491;
    float _3501 = precise::max(0.0, _3489);
    float _3503 = _3483;
    float _3505 = _3501;
    if (_3453)
    {
        float _3507 = _3487 * 6.283185482025146484375;
        float _3509 = cos(_3507);
        _3503 = _3509;
    }
    float _3511 = _3503;
    float _3513 = -_3439;
    float _3515 = -_3501;
    float _3517 = fma(_3419, _3513, _3515);
    float _3519 = _3517;
    if (_3453)
    {
        float _3521 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3505 = _3521;
    }
    float _3523 = _3505;
    float _3525 = _3499;
    if (_3453)
    {
        float _3527 = fma(_3499, _3523, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3525 = _3527;
    }
    float _3529 = _3525;
    float _3531 = _3529;
    if (_3453)
    {
        float _3533 = _3479 * _3529;
        _3531 = _3533;
    }
    float _3535 = _3531;
    if (_3453)
    {
        float _3537 = _3511 + (-1.0);
        _3493 = _3537;
    }
    float _3539 = _3493;
    float _3541 = _3539;
    if (_3453)
    {
        float _3543 = _3441 * _3535;
        _3465 = _3543;
    }
    float _3545 = _3465;
    if (_3453)
    {
        float _3547 = _3443 * _3535;
        _3467 = _3547;
    }
    float _3549 = _3467;
    if (_3453)
    {
        float _3551 = _3539 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3541 = _3551;
    }
    float _3553 = _3541;
    if (_3453)
    {
        float _3555 = _3545 * _3545;
        _3469 = _3555;
    }
    float _3557 = _3469;
    if (_3453)
    {
        float _3559 = _3549 * _3549;
        _3471 = _3559;
    }
    float _3561 = _3471;
    if (_3453)
    {
        float _3563 = fma(_3517, _3511, _3553);
        _3519 = _3563;
    }
    float _3565 = _3519;
    float _3567 = fma(_3565, _3565, _3557);
    float _3569 = _3567 + _3561;
    float _3571 = rsqrt(_3569);
    float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3575 = fma(_3437, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3573);
    float _3577 = precise::clamp(_3575, 0.0, 1.0);
    float _3579 = -_3577;
    float _3581 = _3579 + 1.0;
    float _3583 = abs(_3581);
    float _3585 = log2(_3583);
    float _3587 = _3571 * _3545;
    float _3589 = _3571 * _3565;
    float _3591 = _3571 * _3549;
    float _3593 = _3587 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3595 = -_3593;
    float _3597 = fma(_3589, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3595);
    float _3599 = -_3591;
    float _3601 = fma(_3599, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3597);
    float _3603 = _3585 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3605 = fma(_3601, -0.5, 0.5);
    float _3607 = fma(_3601, 0.5, 0.5);
    float _3609 = exp2(_3603);
    float _3611 = fma(_3607, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3613 = fma(_3607, _3611, -0.212114393711090087890625);
    float _3615 = _3589 + 1.0;
    float _3617 = sqrt(_3605);
    float _3619 = fma(_3607, _3613, 1.570728778839111328125);
    float _3621 = -_3589;
    float _3623 = fma(_3609, _3615, _3621);
    float _3625 = _3617 * 0.636619746685028076171875;
    float _3627 = fma(_3623, 0.5, 0.5);
    float _3629 = -_3619;
    float _3631 = fma(_3625, _3629, 1.0);
    float2 _9910 = float2(_3631, _3627);
    float3 _3635 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9910, float2(0.0), isnan(_9910)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9910, float2(0.0), isnan(_9910)), level(0.0)).xyz;
    float _3637 = _3635.x;
    float _3639 = _3635.y;
    float _3641 = _3635.z;
    float _3643 = _2571 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3645 = _2571 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3647 = _2571 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3649 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3651 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3643);
    float _3653 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3645);
    float _3655 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3647);
    float _3657 = fma(_3649, _3649, 1.0);
    float _3659 = abs(_2631);
    float _3661 = log2(_3659);
    float _3663 = _2611 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3665 = _2611 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3667 = _2611 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3669 = _2583 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3671 = _2583 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3673 = _2583 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3675 = -_2547;
    float _3677 = fma(_3675, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3663);
    float _3679 = rsqrt(_3657);
    float _3681 = -_2547;
    float _3683 = fma(_3681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3665);
    float _3685 = -_2547;
    float _3687 = fma(_3685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3667);
    float _3689 = fma(_2617, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3671);
    float _3691 = fma(_2617, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3669);
    float _3693 = fma(_2617, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3673);
    float _3695 = _3128 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3697 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3677);
    float _3699 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3683);
    float _3701 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3687);
    float _3703 = fma(_3138, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3695);
    float _3705 = _3661 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3707 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3691);
    float _3709 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3689);
    float _3711 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3693);
    float _3713 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3703);
    float _3715 = _3649 * _3679;
    float _3717 = exp2(_3705);
    float _3719 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3653);
    float _3721 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3651);
    float _3723 = -_3707;
    float _3725 = _3715 * _3723;
    float _3727 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3655);
    float _3729 = -_3709;
    float _3731 = _3715 * _3729;
    float _3733 = _3649 * _3697;
    float _3735 = fma(_3679, _3697, _3725);
    float _3737 = -_3711;
    float _3739 = _3715 * _3737;
    float _3741 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3743 = fma(_3679, _3699, _3731);
    float _3745 = _3649 * _3699;
    float _3747 = fma(_3679, _3701, _3739);
    float _3749 = _3172 * 0.5;
    out.m_96.x = _3721;
    out.m_96.y = _3719;
    out.m_96.z = _3727;
    float _3751 = fma(_3741, _3719, _3745);
    float _3753 = _3585 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3755 = _2631 <= 8000.0;
    bool _3757 = isnan(_2631);
    bool _3759 = _3755 || _3757;
    bool _3761 = isnan(8000.0);
    bool _3763 = _3759 || _3761;
    float _3765 = float(_3763);
    float _3767 = fma(_3717, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3769 = precise::clamp(_3767, 0.0, 1.0);
    out.m_98.x = _2215;
    out.m_98.y = _2479;
    out.m_98.z = _2219;
    float _3771 = _3649 * _3701;
    float _3773 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3713);
    float _3775 = exp2(_3753);
    float _3777 = fma(_3741, _3721, _3733);
    float _3779 = fma(_3741, _3727, _3771);
    float _3781 = _3773 + _3172;
    float _3783 = fma(_3202, -0.5, _3749);
    float _3785 = _3200 + _3172;
    float _3787 = -_2237;
    float _3789 = _3787 + 1.0;
    float _3791 = _3781 * 0.5;
    float _3793 = fma(_3769, -2.0, 3.0);
    float _3795 = _3769 * _3769;
    float _3797 = _3785 * 0.5;
    out.m_100.x = _3735;
    out.m_100.y = _3743;
    out.m_100.z = _3747;
    float _3799 = _3785;
    float _3801 = _3789;
    if (!_3158)
    {
        _2315 = 1.0;
    }
    float _3803 = _2315;
    float _3805 = _3795 * _3793;
    float _3807 = _3803;
    if (_3158)
    {
        bool _3809 = _3270 >= _3218;
        bool _3811 = isnan(_3270);
        bool _3813 = _3809 || _3811;
        bool _3815 = isnan(_3218);
        bool _3817 = _3813 || _3815;
        float _3819 = float(_3817);
        _3807 = _3819;
    }
    float _3821 = _3807;
    out.m_102.x = _3797;
    out.m_102.y = _3783;
    out.m_102.z = _3791;
    out.m_102.w = _3172;
    bool _3823 = _3437 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3825 = isnan(_3437);
    bool _3827 = _3823 || _3825;
    bool _3829 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3831 = _3827 || _3829;
    float _3833 = -_3805;
    float _3835 = _3833 + 1.0;
    out.m_104.x = _3100;
    out.m_104.y = _3098;
    out.m_104.z = _3102;
    float _3837 = _3821 * _3415;
    float _3839 = fma(_3835, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3805);
    float _3841 = _3707 + _3777;
    float _3843 = _3709 + _3751;
    float _3845 = _3765 * _3839;
    float _3847 = _3711 + _3779;
    out.gl_Position.x = _3200;
    out.gl_Position.y = _3202;
    out.gl_Position.z = _3773;
    out.gl_Position.w = _3172;
    float _3849 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3851 = -_3775;
    float _3853 = _3851 + 1.0;
    out.m_106.x = _3841;
    out.m_106.y = _3843;
    out.m_106.z = _3847;
    if (!_3831)
    {
        _3799 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3855 = _3799;
    float _3857 = _3789 * _3849;
    float _3859 = precise::clamp(_3857, 0.0, 1.0);
    float _3861 = _3853 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3863 = _3861;
    float _3865 = _3855;
    float _3867 = _3855;
    if (!_3831)
    {
        _3801 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3869 = _3801;
    float _3871 = -_3859;
    float _3873 = fma(_3871, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3875 = _3861 * _3272;
    float _3877 = -_3861;
    float _3879 = _3877 + 1.0;
    float _3881 = _3879;
    float _3883 = _3869;
    float _3885 = _3869;
    if (!_3831)
    {
        _3863 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3887 = _3863;
    float _3889 = -_3837;
    float _3891 = fma(_3889, _3873, 1.0);
    float _3893 = precise::clamp(_3891, 0.0, 1.0);
    float _3895 = _3283 * _3875;
    float _3897 = _3283 * _3879;
    float _3899 = _3353 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3901 = _3893 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3903 = _3901;
    float _3905 = _3887;
    float _3907 = _3887;
    if (!_3831)
    {
        _3204 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3909 = _3204;
    float _3911 = _3909;
    float _3913 = _3909;
    if (!_3831)
    {
        _3881 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3915 = _3881;
    out.m_108.x = _3901;
    float _3917 = _3915;
    float _3919 = _3915;
    if (!_3831)
    {
        _3903 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3921 = _3903;
    float _3923 = _3641 * _3875;
    float _3925 = fma(_3637, _3895, _3277);
    float _3927 = fma(_3639, _3895, _3279);
    float _3929 = fma(_3283, _3923, _3281);
    out.m_110.x = _3925;
    out.m_110.y = _3927;
    out.m_110.z = _3929;
    out.m_110.w = _3897;
    bool _3931 = !_3831;
    float _3933 = _3921;
    float _3935 = _3921;
    if (!_3931)
    {
        bool _3937 = _3437 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3939 = isnan(_3437);
        bool _3941 = _3937 || _3939;
        bool _3943 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3945 = _3941 || _3943;
        if (!_3945)
        {
            float _3947 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3949 = _3437 + _3947;
            float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3953 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3951;
            float _3955 = 1.0 / _3953;
            float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3959 = _3957 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3963 = _3961 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3965 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3967 = _3965 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3971 = _3969 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3973 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3975 = _3973 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3977 = _3949 * _3955;
            float _3979 = precise::clamp(_3977, 0.0, 1.0);
            float _3981 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3983 = _3981 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3985 = fma(_3979, _3959, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3987 = fma(_3979, _3983, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3989 = fma(_3979, _3963, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3991 = fma(_3979, _3967, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3993 = fma(_3979, _3971, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3995 = fma(_3979, _3975, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3913 = _3987;
            _3907 = _3993;
            _3885 = _3985;
            _3919 = _3991;
            _3867 = _3989;
            _3935 = _3995;
            _3997 = true;
        }
        else
        {
            bool _3999 = _3437 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4001 = isnan(_3437);
            bool _4003 = _3999 || _4001;
            bool _4005 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4007 = _4003 || _4005;
            if (!_4007)
            {
                _3883 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4009 = _3883;
            _3885 = _4009;
            if (!_4007)
            {
                _3911 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4011 = _3911;
            _3913 = _4011;
            if (!_4007)
            {
                _3865 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4013 = _3865;
            _3867 = _4013;
            if (!_4007)
            {
                _3917 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4015 = _3917;
            _3919 = _4015;
            if (!_4007)
            {
                _3905 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4017 = _3905;
            _3907 = _4017;
            if (!_4007)
            {
                _3933 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4019 = _3933;
            bool _4021 = !_4007;
            _3935 = _4019;
            if (!_4021)
            {
                bool _4023 = _3437 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4025 = isnan(_3437);
                bool _4027 = _4023 || _4025;
                bool _4029 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4031 = _4027 || _4029;
                if (!_4031)
                {
                    float _4033 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4035 = _3437 + _4033;
                    float _4037 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4039 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4037;
                    float _4041 = 1.0 / _4039;
                    float _4043 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4045 = _4043 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4047 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4049 = _4047 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4051 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4053 = _4051 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4055 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4057 = _4055 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4059 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4061 = _4059 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4063 = _4035 * _4041;
                    float _4065 = precise::clamp(_4063, 0.0, 1.0);
                    float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4069 = _4067 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4071 = fma(_4065, _4045, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4073 = fma(_4065, _4069, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4075 = fma(_4065, _4049, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4077 = fma(_4065, _4053, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4079 = fma(_4065, _4057, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4081 = fma(_4065, _4061, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3913 = _4073;
                    _3907 = _4079;
                    _3885 = _4071;
                    _3919 = _4077;
                    _3867 = _4075;
                    _3935 = _4081;
                    _3997 = true;
                }
                else
                {
                    _3913 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3907 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3885 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3919 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3867 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3935 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3997 = false;
    float _4083 = _3913;
    float _4085 = _3907;
    float _4087 = _3885;
    float _4089 = _3919;
    float _4091 = _3867;
    float _4093 = _3935;
    float _4095 = fma(_3843, -0.5, 0.5);
    float _4097 = precise::clamp(_4095, 0.0, 1.0);
    float _4099 = -_4083;
    float _4101 = _4099 + _4085;
    float _4103 = _3899 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4105 = -_4087;
    float _4107 = _4105 + _4089;
    float _4109 = fma(_4097, _4101, _4083);
    out.m_112.x = 0.0;
    float _4111 = -_4091;
    float _4113 = _4111 + _4093;
    float _4115 = fma(_4097, _4107, _4087);
    float _4117 = _4109 * 0.586610972881317138671875;
    out.m_59.x = _4103;
    bool _4119 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4121 = fma(_4097, _4113, _4091);
    float _4123 = fma(_4115, 0.298911988735198974609375, _4117);
    bool _4125 = _3353 > 0.0;
    bool _4127 = isnan(_3353);
    bool _4129 = _4125 || _4127;
    bool _4131 = isnan(0.0);
    bool _4133 = _4129 || _4131;
    float _4135 = fma(_4121, 0.114477999508380889892578125, _4123);
    float _4137 = -_4135;
    float _4139 = _4115 + _4137;
    float _4141 = -_4135;
    float _4143 = _4109 + _4141;
    float _4145 = -_4135;
    float _4147 = _4121 + _4145;
    float _4149 = fma(_4139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    float _4151 = fma(_4143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    float _4153 = fma(_4147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    bool _4155 = !_4119;
    if (!_4155)
    {
        float _4157 = -_3098;
        float _4159 = _4157 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4161 = -_3100;
        float _4163 = _4161 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4165 = -_3102;
        float _4167 = _4165 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4169 = _4159 * _4159;
        float _4171 = fma(_4163, _4163, _4169);
        float _4173 = fma(_4167, _4167, _4171);
        float _4175 = sqrt(_4173);
        float _4177 = rsqrt(_4173);
        float _4179 = -_4175;
        float _4181 = _4179 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4183 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4185 = precise::clamp(_4183, 0.0, 1.0);
        float _4187 = _4163 * _4177;
        float _4189 = _4159 * _4177;
        float _4191 = abs(_4185);
        float _4193 = log2(_4191);
        float _4195 = _4167 * _4177;
        float _4197 = _4187 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4199 = _3843 * _4189;
        float _4201 = -_4189;
        float _4203 = -_4197;
        float _4205 = fma(_4201, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4203);
        float _4207 = fma(_3841, _4187, _4199);
        float _4209 = -_4195;
        float _4211 = fma(_4209, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4205);
        float _4213 = fma(_3847, _4195, _4207);
        float _4215 = precise::clamp(_4213, 0.0, 1.0);
        float _4217 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4219 = _4211 + _4217;
        float _4221 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4223 = _4219 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4225 = precise::clamp(_4223, 0.0, 1.0);
        float _4227 = exp2(_4221);
        float _4229 = _4227 * _4225;
        float _4231 = _4215 * _4229;
        float _4233 = _4231 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4235 = _4231 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4237 = _4231 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_112.x = _4233;
        out.m_112.y = _4235;
        out.m_112.z = _4237;
    }
    out.m_84.x = _4149;
    out.m_84.y = _4151;
    out.m_84.z = _4153;
    if (_4133)
    {
        return out;
    }
    float _4239 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4239;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_112 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3997 = false;
    bool _1263 = false;
    bool _939 = false;
    bool _803 = false;
    bool _425 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _126 = in.m_56.w;
    float _128 = trunc(_126);
    int _131 = int(_128);
    bool _135 = _131 >= 1;
    float _137 = 0.0;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (!_135)
    {
        out.m_59.x = 0.0;
    }
    int _141 = 0;
    if (!_135)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4295 = as_type<float>(_145);
        out.gl_Position.z = _4295;
    }
    if (!_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _149 = in.m_61.w;
    float _151 = float(_131);
    float _153 = 1.0 / _151;
    float _155 = -_149;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _159 = _149 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _161 = isnan(_149);
    bool _163 = _159 || _161;
    bool _165 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _167 = _163 || _165;
    float _169 = _157 * _153;
    bool _171 = _157 >= _151;
    bool _173 = !_167;
    bool _175 = _171 || _173;
    out.m_63.x = _169;
    float _177 = 0.0;
    float _179 = _169;
    float _181 = _157;
    if (_175)
    {
        _177 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _183 = _177;
    if (_175)
    {
        out.m_59.x = 0.0;
    }
    if (_175)
    {
        float _185 = _183 * 5.0;
        _147 = as_type<int>(_185);
    }
    int _187 = _147;
    if (_175)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4367 = as_type<float>(_187);
        out.gl_Position.z = _4367;
    }
    if (_175)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _189 = as_type<float>(int(gl_VertexIndex));
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _193 = as_type<int>(_189) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_189) & 2;
    bool _199 = _197 != 0;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_199;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_191;
    float _227;
    if (!_209)
    {
        float _211 = in.m_68.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        _227 = _169;
    }
    _229 = false;
    float _231 = _227;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = _231 + _233;
    bool _237 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _239 = isnan(_231);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _253 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _257;
    float _261 = 1.0 / _251;
    float _263 = -_247;
    float _265 = _263 + 1.0;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _269 = 1.0 / _259;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _271;
    float _275 = 1.0 / _255;
    float _277 = _235 * _261;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = _231 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _231 + _283;
    float _287 = fma(_273, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _289 = _281 * _269;
    bool _291 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _293 = isnan(_231);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = _301 * _265;
    bool _305 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _307 = isnan(_231);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = _285 * _275;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _319;
    bool _323 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_231);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _339 = -_301;
    float _341 = _339 + 1.0;
    float _343 = fma(_321, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = -_333;
    float _351 = _349 + 1.0;
    float _353 = _333 * _341;
    float _355 = fma(_347, _317, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _357 = _315 * _351;
    float _359 = in.m_70.x;
    float _361 = in.m_70.y;
    float _363 = -_315;
    float _365 = _363 + 1.0;
    float _367 = fma(_337, _317, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = _287 * _357;
    float _371 = _343 * _357;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _377;
    float _381 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _383 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _385 = fma(_375, _289, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _387 = fma(_379, _289, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _389 = fma(_367, _353, _381);
    float _391 = fma(_355, _353, _383);
    float _393 = fma(_385, _303, _389);
    float _395 = fma(_387, _303, _391);
    float _397 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].x, _393);
    float _399 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].y, _395);
    float _401 = _397 * _359;
    float _403 = _399 * _361;
    bool _405 = !_267;
    float _423;
    if (!_405)
    {
        float _407 = in.m_68.x;
        float _409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _411 = _407 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[11].x, _157);
        float _415 = _413 * _409;
        float _417 = floor(_415);
        float _419 = -_417;
        float _421 = _415 + _419;
        _423 = _421;
        _425 = true;
    }
    else
    {
        _423 = _169;
    }
    _425 = false;
    float _427 = _423;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _445 = 1.0 / _431;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _455 = 1.0 / _435;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _459 = _427 + _457;
    bool _461 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _463 = isnan(_427);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    bool _473 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _475 = isnan(_427);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -_471;
    float _487 = _485 + 1.0;
    float _489 = 1.0 / _439;
    float _491 = _459 * _445;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _495 = _427 + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _499 = _427 + _497;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _503 = _427 + _501;
    bool _505 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _507 = 1.0 / _449;
    float _509 = _495 * _455;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _513 = _427 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _517 = _427 + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _519;
    float _523 = 1.0 / _453;
    float _525 = _499 * _489;
    bool _527 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _529 = isnan(_427);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = fma(_521, _491, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _541 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _543 = isnan(_427);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = 1.0 / _443;
    float _555 = _513 * _507;
    float _557 = -_537;
    float _559 = _557 + 1.0;
    float _561 = -_551;
    float _563 = _561 + 1.0;
    float _565 = _551 * _559;
    float _567 = _517 * _523;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _569;
    float _573 = fma(_571, _491, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _575 = _483 * _487;
    bool _577 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _579 = isnan(_427);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = _503 * _553;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _591;
    float _595 = -_483;
    float _597 = _595 + 1.0;
    float _599 = fma(_593, _491, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _601 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _603 = isnan(_427);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = _471 * _563;
    bool _615 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _617 = isnan(_427);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _639 = _611 * _597;
    float _641 = -_625;
    float _643 = _641 + 1.0;
    float _645 = -_611;
    float _647 = _645 + 1.0;
    float _649 = fma(_633, _509, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _651 = _587 * _643;
    float _653 = -_587;
    float _655 = _653 + 1.0;
    float _657 = fma(_629, _509, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _659 = fma(_637, _509, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _661 = _573 * _651;
    float _663 = _599 * _651;
    float _665 = _625 * _647;
    float _667 = _539 * _651;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _669;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _685 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[107].y, _661);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _691 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[107].x, _663);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _693;
    float _697 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[107].z, _667);
    float _699 = fma(_675, _589, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _701 = fma(_683, _589, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _703 = fma(_657, _665, _685);
    float _705 = fma(_671, _525, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _707 = fma(_689, _589, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _709 = fma(_649, _665, _691);
    float _711 = fma(_679, _525, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _713 = fma(_695, _525, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _715 = fma(_659, _665, _697);
    float _717 = fma(_705, _639, _709);
    float _719 = fma(_711, _639, _703);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _721;
    float _725 = fma(_713, _639, _715);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _731;
    float _735 = fma(_723, _555, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _737 = fma(_699, _575, _717);
    float _739 = fma(_701, _575, _719);
    float _741 = fma(_707, _575, _725);
    float _743 = fma(_729, _555, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _753 = fma(_733, _555, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _759 = fma(_747, _567, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _761 = fma(_751, _567, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _763 = fma(_735, _613, _737);
    float _765 = fma(_757, _567, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _767 = fma(_743, _613, _739);
    float _769 = fma(_753, _613, _741);
    float _771 = fma(_759, _565, _763);
    float _773 = fma(_761, _565, _767);
    float _775 = fma(_765, _565, _769);
    float _777 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[113].x, _771);
    float _779 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[113].y, _773);
    float _781 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[113].z, _775);
    bool _783 = !_505;
    float _801;
    if (!_783)
    {
        float _785 = in.m_68.x;
        float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _789 = _785 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _791 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[11].y, _157);
        float _793 = _791 * _787;
        float _795 = floor(_793);
        float _797 = -_795;
        float _799 = _793 + _797;
        _801 = _799;
        _803 = true;
    }
    else
    {
        _801 = _169;
    }
    _803 = false;
    float _805 = _801;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _809 = _805 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _815 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _817 = isnan(_805);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _831 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _833 = isnan(_805);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _843;
    bool _847 = _805 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _849 = isnan(_805);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = 1.0 / _813;
    float _861 = -_825;
    float _863 = _861 + 1.0;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _867 = _805 + _865;
    bool _869 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _871 = _841 * _863;
    float _873 = -_841;
    float _875 = _873 + 1.0;
    float _877 = 1.0 / _829;
    float _879 = _845 * _859;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _885 = fma(_879, _809, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _887 = _883 * _877;
    float _889 = -_857;
    float _891 = _889 + 1.0;
    float _893 = _885 * _871;
    float _895 = _779 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _897 = fma(_887, _867, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _899 = _825 * _891;
    float _901 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[115].x, _893);
    float _903 = _781 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _905 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = fma(_897, _899, _901);
    float _909 = _777 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _911 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[117].x, _907);
    float _913 = _909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _915 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _917 = _911 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _913;
    out.m_72.y = _905;
    out.m_72.z = _915;
    out.m_72.w = _917;
    bool _919 = !_869;
    float _937;
    if (!_919)
    {
        float _921 = in.m_68.x;
        float _923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _925 = _921 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[11].z, _157);
        float _929 = _927 * _923;
        float _931 = floor(_929);
        float _933 = -_931;
        float _935 = _929 + _933;
        _937 = _935;
        _939 = true;
    }
    else
    {
        _937 = _169;
    }
    _939 = false;
    float _941 = _937;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _945 = _941 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _947;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _953 = _951 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _955;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _963 = 1.0 / _949;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _965;
    float _969 = 1.0 / _957;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _973 = _941 + _971;
    bool _975 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _977 = isnan(_941);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    float _987 = 1.0 / _953;
    float _989 = _973 * _963;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _993 = _941 + _991;
    bool _995 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _997 = isnan(_941);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1007;
    bool _1011 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1013 = 1.0 / _967;
    float _1015 = _993 * _969;
    bool _1017 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1019 = isnan(_941);
    bool _1021 = _1017 || _1019;
    bool _1023 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1025 = _1021 || _1023;
    float _1027 = float(_1025);
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1031 = _941 + _1029;
    bool _1033 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1035 = isnan(_941);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    float _1045 = -_1005;
    float _1047 = _1045 + 1.0;
    float _1049 = fma(_1009, _989, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1051 = 1.0 / _961;
    float _1053 = _945 * _987;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1057 = _941 + _1055;
    float _1059 = -_1027;
    float _1061 = _1059 + 1.0;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1063;
    float _1067 = -_1043;
    float _1069 = _1067 + 1.0;
    float _1071 = _1057 * _1013;
    bool _1073 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1075 = isnan(_941);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = fma(_1065, _989, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1087 = _985 * _1069;
    float _1089 = -_985;
    float _1091 = _1089 + 1.0;
    float _1093 = _1031 * _1051;
    float _1095 = _1005 * _1061;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1097;
    float _1101 = _1083 * _1047;
    float _1103 = -_1083;
    float _1105 = _1103 + 1.0;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1109 = _1107 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1111 = fma(_1099, _989, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1113 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1115 = isnan(_941);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1121 = _1117 || _1119;
    float _1123 = float(_1121);
    float _1125 = _1043 * _1105;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1135 = fma(_1109, _1053, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1137 = _1123 * _1091;
    float _1139 = fma(_1129, _1053, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1141 = fma(_1133, _1053, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1143 = _1111 * _1137;
    float _1145 = -_1123;
    float _1147 = _1145 + 1.0;
    float _1149 = _1085 * _1137;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1151;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1155;
    float _1159 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1143);
    float _1161 = _1049 * _1137;
    float _1163 = fma(_1153, _1015, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1165 = fma(_1157, _1015, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1169 = _1167 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1171 = fma(_1139, _1087, _1159);
    float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1173;
    float _1177 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1149);
    float _1179 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1161);
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1185 = fma(_1169, _1093, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1187 = fma(_1165, _1125, _1171);
    float _1189 = fma(_1175, _1015, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1191 = fma(_1141, _1087, _1177);
    float _1193 = fma(_1135, _1087, _1179);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1197 = _1195 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1199 = fma(_1183, _1093, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1201 = fma(_1163, _1125, _1191);
    float _1203 = fma(_1189, _1125, _1193);
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1209;
    float _1213 = fma(_1197, _1093, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1215;
    float _1219 = fma(_1207, _1071, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1221 = fma(_1211, _1071, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1223 = fma(_1185, _1101, _1187);
    float _1225 = fma(_1217, _1071, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1227 = fma(_1199, _1101, _1201);
    float _1229 = fma(_1213, _1101, _1203);
    float _1231 = fma(_1219, _1095, _1223);
    float _1233 = fma(_1221, _1095, _1227);
    float _1235 = fma(_1225, _1095, _1229);
    float _1237 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1231);
    float _1239 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1233);
    float _1241 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1235);
    bool _1243 = !_1011;
    float _1261;
    if (!_1243)
    {
        float _1245 = in.m_68.x;
        float _1247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1249 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[11].w, _157);
        float _1253 = _1251 * _1247;
        float _1255 = floor(_1253);
        float _1257 = -_1255;
        float _1259 = _1253 + _1257;
        _1261 = _1259;
        _1263 = true;
    }
    else
    {
        _1261 = _169;
    }
    _1263 = false;
    float _1265 = _1261;
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1269 = _1265 + _1267;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1277 = _1275 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1279 = _1265 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1281 = isnan(_1265);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1287 = _1283 || _1285;
    float _1289 = float(_1287);
    float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1293 = _1291 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1295 = _1265 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1297 = isnan(_1265);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1303 = _1299 || _1301;
    float _1305 = float(_1303);
    float _1307 = 1.0 / _1273;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1309;
    float _1313 = -_1289;
    float _1315 = _1313 + 1.0;
    bool _1317 = _1265 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1319 = isnan(_1265);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1325 = _1321 || _1323;
    float _1327 = float(_1325);
    bool _1329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1331 = 1.0 / _1277;
    float _1333 = 1.0 / _1293;
    float _1335 = _1311 * _1307;
    float _1337 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1339 = _1337 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1341 = _1305 * _1315;
    float _1343 = -_1305;
    float _1345 = _1343 + 1.0;
    float _1347 = fma(_1335, _1269, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1349;
    float _1353 = _1327 * _1345;
    float _1355 = _1339 * _1331;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1359 = _1265 + _1357;
    bool _1361 = _1265 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1363 = isnan(_1265);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1369 = _1365 || _1367;
    float _1371 = float(_1369);
    float _1373 = _1347 * _1353;
    float _1375 = -_1327;
    float _1377 = _1375 + 1.0;
    float _1379 = fma(_1355, _1359, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1383 = _1265 + _1381;
    float _1385 = _1351 * _1333;
    float _1387 = -_1371;
    float _1389 = _1387 + 1.0;
    float _1391 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1373);
    float _1393 = fma(_1385, _1383, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1395 = _1289 * _1389;
    float _1397 = fma(_1379, _1341, _1391);
    float _1399 = _1239 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1401 = fma(_1393, _1395, _1397);
    float _1403 = _1237 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1405 = _1241 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1407 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1409 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1401);
    float _1411 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1413 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1415 = _1409 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _1411;
    out.m_74.y = _1407;
    out.m_74.z = _1413;
    out.m_74.w = _1415;
    bool _1417 = !_1329;
    if (!_1417)
    {
        float _1419 = in.m_68.x;
        float _1421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1423 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1425 = fma(_1423, (*spvDescriptorSet0.vp_c9)._m0[14].x, _157);
        float _1427 = _1425 * _1421;
        float _1429 = floor(_1427);
        float _1431 = -_1429;
        float _1433 = _1427 + _1431;
        _179 = _1433;
    }
    float _1435 = _179;
    float _1437 = in.m_68.x;
    float _1439 = in.m_68.y;
    float _1441 = in.m_68.z;
    float _1443 = in.m_68.w;
    float _1445 = in.m_56.x;
    float _1447 = in.m_56.y;
    float _1449 = in.m_56.z;
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1455 = in.m_76.x;
    float _1457 = in.m_76.y;
    float _1459 = in.m_76.z;
    float _1461 = in.m_76.w;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1465 = _1463 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1467 = 1.0 / _1453;
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1473 = in.m_78.x;
    float _1475 = in.m_78.y;
    float _1477 = in.m_78.z;
    float _1479 = in.m_78.w;
    float _1481 = in.m_80.x;
    float _1483 = in.m_80.y;
    float _1485 = in.m_80.z;
    float _1487 = in.m_80.w;
    float _1489 = 1.0 / _1471;
    float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1493 = _1491 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1495 = _1443 > 0.5;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1499 = _1497 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1501 = 1.0 / _1465;
    float _1503 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1505 = _1503 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1507 = _1437 > 0.5;
    bool _1509 = _1439 > 0.5;
    float _1511 = _1447 * _1457;
    float _1513 = -_207;
    int _1515 = _1495 ? as_type<int>(_1513) : as_type<int>(_207);
    float _1517 = 1.0 / _1505;
    float _1519 = _1447 * _1475;
    float _1521 = fma(_1445, _1455, _1511);
    bool _1523 = _1441 > 0.5;
    float _1525 = _1447 * _1483;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1529 = _1527 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1531 = fma(_1445, _1473, _1519);
    float _1533 = fma(_1445, _1481, _1525);
    float _1535 = fma(_1449, _1459, _1521);
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1537;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1543 = _1541 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1545 = fma(_1449, _1477, _1531);
    float _1547 = fma(_1449, _1485, _1533);
    float _1549 = 1.0 / _1529;
    float _1551 = _1543 * _1467;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1553;
    float _1557 = _1539 * _1489;
    float _1559 = _1545 + _1479;
    float _1561 = _1535 + _1461;
    float _1563 = _1555 * _1501;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1567 = _1435 + _1565;
    float _1569 = 1.0 / _1499;
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1573 = _1559 + _1571;
    float _1575 = fma(_1557, _1567, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1577 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1579 = isnan(_1435);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1585 = _1581 || _1583;
    float _1587 = float(_1585);
    float _1589 = _1547 + _1487;
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1591;
    bool _1595 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1597 = isnan(_1435);
    bool _1599 = _1595 || _1597;
    bool _1601 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1603 = _1599 || _1601;
    float _1605 = float(_1603);
    float _1607 = 1.0 / _1493;
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1611 = _1435 + _1609;
    float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1615 = _1435 + _1613;
    float _1617 = -_1587;
    float _1619 = _1617 + 1.0;
    float _1621 = fma(_1551, _1611, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1623 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1625 = isnan(_1435);
    bool _1627 = _1623 || _1625;
    bool _1629 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1631 = _1627 || _1629;
    float _1633 = float(_1631);
    float _1635 = _1573 * _1573;
    float _1637 = _1593 * _1569;
    float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1641 = _1561 + _1639;
    float _1643 = -_1605;
    float _1645 = _1643 + 1.0;
    float _1647 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1647;
    float _1651 = fma(_1563, _1615, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1655 = _1653 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1657 = _1605 * _1619;
    bool _1659 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1661 = isnan(_1435);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1667 = _1663 || _1665;
    float _1669 = float(_1667);
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1673 = _1589 + _1671;
    float _1675 = fma(_1641, _1641, _1635);
    float _1677 = _1633 * _1645;
    float _1679 = _1649 * _1517;
    float _1681 = -_1633;
    float _1683 = _1681 + 1.0;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1687 = _1435 + _1685;
    float _1689 = _1655 * _1607;
    bool _1691 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1693 = isnan(_1435);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1699 = _1695 || _1697;
    float _1701 = float(_1699);
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1705 = _1435 + _1703;
    float _1707 = fma(_1673, _1673, _1675);
    float _1709 = -_1669;
    float _1711 = _1709 + 1.0;
    float _1713 = fma(_1679, _1687, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1715 = _1669 * _1683;
    float _1717 = fma(_1689, _1705, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1719 = _1701 * _1711;
    bool _1721 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1723 = isnan(_1435);
    bool _1725 = _1721 || _1723;
    bool _1727 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1729 = _1725 || _1727;
    float _1731 = float(_1729);
    float _1733 = sqrt(_1707);
    float _1735 = -_1701;
    float _1737 = _1735 + 1.0;
    int _1739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1741 = _1739 != 0;
    float _1743 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1745 = _1743 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _1747 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1749 = isnan(_1435);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1755 = _1751 || _1753;
    float _1757 = float(_1755);
    float _1759 = _1731 * _1737;
    float _1761 = -_1731;
    float _1763 = _1761 + 1.0;
    float _1765 = _1745 * _1549;
    float _1767 = rsqrt(_1707);
    bool _1769 = _1435 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1771 = isnan(_1435);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1777 = _1773 || _1775;
    float _1779 = float(_1777);
    float _1781 = _1757 * _1763;
    float _1783 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1785 = _1435 + _1783;
    float _1787 = -_1757;
    float _1789 = _1787 + 1.0;
    float _1791 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1795 = _1793 != 0;
    float _1797 = fma(_1765, _1785, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1799 = _1779 * _1789;
    float _1801 = _1791 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1803 = _1733 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1805 = 0.0;
    float _1807 = _1637;
    float _1809 = _1573;
    float _1811 = _1797;
    float _1813 = _1657;
    if (_1741)
    {
        float _1815 = in.m_68.w;
        _1805 = _1815;
    }
    float _1817 = _1805;
    float _1819 = _1575 * _1799;
    float _1821 = -_1779;
    float _1823 = _1821 + 1.0;
    float _1825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1827 = precise::min(_1801, _1803);
    float _1829 = _1573 * _1767;
    float _1831 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1819);
    float _1833 = _1641 * _1767;
    float _1835 = _1673 * _1767;
    float _1837 = -_1829;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1573);
    float _1841 = _1829 * _1827;
    float _1843 = -_1833;
    float _1845 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1641);
    float _1847 = _1833 * _1827;
    float _1849 = _1839 * _1839;
    float _1851 = -_1841;
    float _1853 = _1573 + _1851;
    float _1855 = -_1835;
    float _1857 = fma(_1855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1673);
    float _1859 = fma(_1621, _1781, _1831);
    float _1861 = fma(_1845, _1845, _1849);
    float _1863 = -_1847;
    float _1865 = _1641 + _1863;
    float _1867 = _1853 * _1853;
    float _1869 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1871 = _1435 + _1869;
    float _1873 = -_203;
    int _1875 = _1507 ? as_type<int>(_1873) : as_type<int>(_203);
    float _1877 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1879 = fma(_1865, _1865, _1867);
    float _1881 = fma(_1637, _1871, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _1883 = as_type<int>(_1831);
    float _1885 = _1841;
    float _1887 = _1829;
    float _1889 = _1835;
    if (_1741)
    {
        float _1891 = _1817 * 3.1415927410125732421875;
        _1807 = _1891;
    }
    float _1893 = _1807;
    int _1895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1897 = _1895 != 0;
    float _1899 = fma(_1857, _1857, _1861);
    float _1901 = -_207;
    int _1903 = _1509 ? as_type<int>(_1901) : as_type<int>(_207);
    if (_1741)
    {
        float _1905 = _1893 * 0.15915493667125701904296875;
        _1883 = as_type<int>(_1905);
    }
    int _1907 = _1883;
    int _1909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1911 = _1909 != 0;
    float _1913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1917 = _1915 != 0;
    float _1919 = _1835 * _1827;
    float _1921 = -_203;
    int _1923 = _1523 ? as_type<int>(_1921) : as_type<int>(_203);
    bool _1925 = !_1795;
    float _1927 = _1925 ? _203 : as_type<float>(_1875);
    float _1929 = -_1919;
    float _1931 = _1673 + _1929;
    bool _1933 = !_1897;
    float _1935 = _1933 ? _207 : as_type<float>(_1903);
    float _1937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1939 = !_1911;
    float _1941 = _1939 ? _207 : as_type<float>(_1515);
    float _1943 = _1927 + 0.5;
    int _1945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1947 = _1945 != 0;
    float _1949 = -_1935;
    float _1951 = _1949 + 0.5;
    bool _1953 = !_1917;
    float _1955 = _1953 ? _203 : as_type<float>(_1923);
    float _1957 = -_1941;
    float _1959 = _1957 + 0.5;
    float _1961 = _1943 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1965 = _1951 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1967 = _1955 + 0.5;
    float _1969 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1971 = fma(_1931, _1931, _1879);
    float _1973 = -_207;
    float _1975 = _1973 + 0.5;
    float _1977 = _1961 * _1825;
    float _1979 = _1967 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1983 = _1965 * _1877;
    float _1985 = _1969 * _1913;
    float _1987 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1989 = _1979 * _1937;
    bool _1991 = _1947;
    if (!_1947)
    {
        _1809 = _1975;
    }
    float _1993 = _1809;
    int _1995 = _1907;
    float _1997 = _1993;
    if (_1741)
    {
        float _1999 = as_type<float>(_1907) * 6.283185482025146484375;
        float _2001 = sin(_1999);
        _1995 = as_type<int>(_2001);
    }
    int _2003 = _1995;
    float _2005 = sqrt(_1899);
    bool _2007 = !_1947;
    int _2009 = _2003;
    if (!_2007)
    {
        float _2011 = in.m_68.x;
        float _2013 = _2011 * 3.1415927410125732421875;
        float _2015 = _2013 * 0.15915493667125701904296875;
        float _2017 = _2015 * 6.283185482025146484375;
        float _2019 = sin(_2017);
        bool _2021 = _2019 > 0.5;
        float _2023 = -_207;
        float _2025 = _2021 ? _2023 : _207;
        float _2027 = -_2025;
        float _2029 = _2027 + 0.5;
        _1991 = _2021;
        _1997 = _2029;
    }
    bool _2031 = _1991;
    float _2033 = _1997;
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2037 = _2035 != 0;
    int _2039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2041 = _2039 != 0;
    float _2043 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1987);
    bool _2045 = _2031;
    if (_1741)
    {
        bool _2047 = as_type<float>(_2003) > 0.5;
        _2045 = _2047;
    }
    bool _2049 = _2045;
    float _2051 = fma(_1651, _1759, _1859);
    float _2053 = sqrt(_1971);
    float _2055 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2043);
    float _2057 = -_203;
    int _2059 = _1509 ? as_type<int>(_2057) : as_type<int>(_203);
    float _2061 = fma(_1717, _1719, _2051);
    float _2063 = -_207;
    int _2065 = _1523 ? as_type<int>(_2063) : as_type<int>(_207);
    out.m_82.x = _1977;
    out.m_82.y = _1983;
    out.m_82.z = _1989;
    out.m_82.w = _1985;
    float _2067 = fma(_1713, _1715, _2061);
    bool _2069 = !_2037;
    float _2071 = _2069 ? _203 : as_type<float>(_2059);
    float _2073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _2075 = !_2041;
    float _2077 = _2075 ? _207 : as_type<float>(_2065);
    float _2079 = _1767 * _2005;
    int _2081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2083 = _2081 != 0;
    int _2085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2087 = _2085 != 0;
    int _2089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2091 = _2089 != 0;
    float _2093 = _2071 + 0.5;
    bool _2095 = _2055 >= 0.0;
    float _2097 = -_2077;
    float _2099 = _2097 + 0.5;
    float _2101 = _1767 * _2053;
    float _2103 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    out.m_84.w = _1827;
    float _2105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2107 = fma(_1797, _1677, _2067);
    if (!_1741)
    {
        _1811 = _203;
    }
    float _2109 = _1811;
    float _2111 = _2033 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2113 = _2109;
    if (_1741)
    {
        float _2115 = -_203;
        float _2117 = _2049 ? _2115 : _203;
        _2113 = _2117;
    }
    float _2119 = _2113;
    float _2121 = fma(_1881, _1657, _2107);
    float _2123 = _2099 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2125 = _2101 * _2079;
    if (_2095)
    {
        _1813 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2127 = _1813;
    float _2129 = _2119 + 0.5;
    float _2131 = _2103 * _1963;
    float _2133 = _2111 * _2073;
    float _2135 = _2123 * _1981;
    float _2137 = _2129 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _2139 = as_type<int>(_2127);
    if (_2095)
    {
        float _2141 = _2127 * 5.0;
        _2139 = as_type<int>(_2141);
    }
    int _2143 = _2139;
    float _2145 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2121);
    if (_2095)
    {
        out.m_59.x = 0.0;
    }
    float _2147 = _2137 * _2105;
    float _2149 = _1791 * _2125;
    out.m_86.x = _2131;
    out.m_86.y = _2135;
    bool _2151 = !_2083;
    int _2153 = _2151 ? 0 : 1;
    bool _2155 = !_2087;
    int _2157 = _2155 ? 0 : 1;
    out.m_88.x = _2147;
    out.m_88.y = _2133;
    bool _2159 = !_2091;
    int _2161 = _2159 ? 0 : 1;
    if (_2095)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7558 = as_type<float>(_2143);
        out.gl_Position.z = _7558;
    }
    out.m_90.x = _2145;
    out.m_92.x = _2149;
    if (_2095)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2163 = -_1829;
    float _2165 = fma(_2163, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1559);
    float _2167 = -_1833;
    float _2169 = fma(_2167, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1561);
    float _2171 = -_1835;
    float _2173 = fma(_2171, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1589);
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2177 = _2165 + _2175;
    float _2179 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2181 = _2169 + _2179;
    float _2183 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2185 = _2173 + _2183;
    float _2187 = _2177 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2189 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2187);
    float _2191 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2189);
    bool _2193 = _2191 >= 0.0;
    float _2195 = _2185;
    if (_2193)
    {
        _2195 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2197 = _2195;
    int _2199 = as_type<int>(_2197);
    if (_2193)
    {
        out.m_59.x = 0.0;
    }
    if (_2193)
    {
        float _2201 = _2197 * 5.0;
        _2199 = as_type<int>(_2201);
    }
    int _2203 = _2199;
    if (_2193)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7649 = as_type<float>(_2203);
        out.gl_Position.z = _7649;
    }
    if (_2193)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2205 = -_1847;
    float _2207 = _1561 + _2205;
    float _2209 = -_1919;
    float _2211 = _1589 + _2209;
    float _2213 = -_1833;
    float _2215 = fma(_2213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2207);
    float _2217 = -_1835;
    float _2219 = fma(_2217, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2211);
    float _2221 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2223 = fma(_2219, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2225 = floor(_2221);
    float _2227 = floor(_2223);
    float _2229 = -_2225;
    float _2231 = _2221 + _2229;
    float _2233 = -_2227;
    float _2235 = _2223 + _2233;
    float2 _7709 = float2(_2231, _2235);
    float _2237 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7709, float2(0.0), isnan(_7709)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7709, float2(0.0), isnan(_7709)), level(0.0)).x;
    float _2239 = _1441 * 2.0;
    float _2241 = _1437 * 2.0;
    float _2243 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2245 = log2(_2243);
    float _2247 = _1439 + _1437;
    float _2249 = _1439 * 2.0;
    float _2251 = _1439 + _1441;
    float _2253 = _2247 + (-1.0);
    int _2255 = abs(_2157);
    float _2257 = _2251 + (-1.0);
    float _2259 = floor(_2239);
    float _2261 = _1439 + (-0.5);
    float _2263 = fma(_2257, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2265 = abs(_2161);
    float _2267 = _2125 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2269 = _2267 * 0.5;
    float _2271 = fma(_2253, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2273 = floor(_2241);
    float _2275 = _2245 * _157;
    bool _2277 = _2259 > 0.0;
    float _2279 = floor(_2249);
    bool _2281 = _2259 >= 0.0;
    bool _2283 = isnan(_2259);
    bool _2285 = _2281 || _2283;
    bool _2287 = isnan(0.0);
    bool _2289 = _2285 || _2287;
    int _2291 = _2289 ? 0 : 1;
    bool _2293 = _2273 > 0.0;
    float _2295 = exp2(_2275);
    int _2297 = abs(_2153);
    float _2299 = in.m_94.x;
    float _2301 = in.m_94.y;
    float _2303 = in.m_94.z;
    int _2305 = ~_2291;
    int _2307 = _2305 + 1;
    int _2309 = _2307 + 1;
    int _2311 = _2309;
    int _2313 = 2;
    float _2315 = _2215;
    if (!_2277)
    {
        int _2317 = ~_2291;
        int _2319 = _2317 + 1;
        _2311 = _2319;
    }
    int _2321 = _2311;
    bool _2323 = _2273 >= 0.0;
    bool _2325 = isnan(_2273);
    bool _2327 = _2323 || _2325;
    bool _2329 = isnan(0.0);
    bool _2331 = _2327 || _2329;
    float _2333 = float(_2321);
    float _2335 = float(_2297);
    int _2337 = _2331 ? 0 : 1;
    float _2339 = _2335 * _2333;
    int _2341 = ~_2337;
    int _2343 = _2341 + 1;
    int _2345 = _2343 + 1;
    float _2347 = -_2295;
    float _2349 = _2347 + 1.0;
    int _2351 = _2345;
    if (!_2293)
    {
        int _2353 = ~_2337;
        int _2355 = _2353 + 1;
        _2351 = _2355;
    }
    int _2357 = _2351;
    float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2361 = 1.0 + _2359;
    float _2363 = _2339 * (-2.0);
    bool _2365 = _2279 > 0.0;
    float _2367 = _1437 + (-0.5);
    bool _2369 = _2279 >= 0.0;
    bool _2371 = isnan(_2279);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(0.0);
    bool _2377 = _2373 || _2375;
    float _2379 = 1.0 / _2361;
    float _2381 = fma(_2363, _2299, _2299);
    float _2383 = float(_2255);
    float _2385 = _1441 + _1437;
    bool _2387 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2389 = isnan(1.0);
    bool _2391 = _2387 || _2389;
    bool _2393 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2395 = _2391 || _2393;
    float _2397 = fma(_2367, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2381);
    int _2399 = _2377 ? 0 : 1;
    float _2401 = _2385 + (-1.0);
    bool _2403 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2405 = isnan(0.0);
    bool _2407 = _2403 || _2405;
    bool _2409 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2411 = _2407 || _2409;
    float _2413 = _1441 + (-0.5);
    float _2415 = float(_2357);
    float _2417 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _2419 = ~_2399;
    int _2421 = _2419 + 1;
    int _2423 = _2421 + 1;
    float _2425 = fma(_2271, _2363, _2271);
    int _2427 = _2423;
    if (!_2365)
    {
        int _2429 = ~_2399;
        int _2431 = _2429 + 1;
        _2427 = _2431;
    }
    int _2433 = _2427;
    float _2435 = _2383 * _2415;
    float _2437 = _2411 ? _2349 : 0.0;
    float _2439 = _2435 * (-2.0);
    if (_2395)
    {
        float _2441 = _2437 * _2379;
        _181 = _2441;
    }
    float _2443 = _181;
    float _2445 = float(_2433);
    float _2447 = fma(_2439, _2301, _2301);
    float _2449 = float(_2265);
    float _2451 = fma(_2263, _2439, _2263);
    float _2453 = fma(_2261, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2447);
    float _2455 = fma(_2425, _2443, _2397);
    float _2457 = _2449 * _2445;
    float _2459 = fma(_2451, _2443, _2453);
    float _2461 = fma(_2401, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2463 = _2457 * (-2.0);
    float _2465 = -_1841;
    float _2467 = _1559 + _2465;
    float _2469 = _2459 * 0.15915493667125701904296875;
    float _2471 = _2455 * 0.15915493667125701904296875;
    float _2473 = fma(_2463, _2303, _2303);
    float _2475 = fma(_2461, _2463, _2461);
    float _2477 = -_1829;
    float _2479 = fma(_2477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2467);
    float _2481 = _2471 * 6.283185482025146484375;
    float _2483 = sin(_2481);
    float _2485 = fma(_2413, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2473);
    float _2487 = _2479 + _2417;
    float _2489 = fma(_2475, _2443, _2485);
    float _2491 = _2479 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2493 = _2487 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2495 = _2487 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2497 = _2471 * 6.283185482025146484375;
    float _2499 = cos(_2497);
    float _2501 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2491);
    float _2503 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2493);
    float _2505 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2495);
    float _2507 = _2489 * 0.15915493667125701904296875;
    float _2509 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2501);
    float _2511 = fma(_2219, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2503);
    float _2513 = fma(_2219, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2505);
    float _2515 = _2469 * 6.283185482025146484375;
    float _2517 = sin(_2515);
    float _2519 = _2509 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2521 = _2479 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2523 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2525 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2527 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2521);
    float _2529 = 1.0 / _2519;
    float _2531 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2527);
    float _2533 = _2531 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2535 = _2469 * 6.283185482025146484375;
    float _2537 = cos(_2535);
    float _2539 = _2499 * _2517;
    float _2541 = _2533 + _2519;
    float _2543 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2545 = _2507 * 6.283185482025146484375;
    float _2547 = sin(_2545);
    float _2549 = _2541 * _2529;
    float _2551 = _2549 * 0.5;
    float _2553 = _2483 * _2517;
    float _2555 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2557 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2555);
    float _2559 = trunc(_2523);
    int _2561 = int(_2559);
    float _2563 = _2499 * _2537;
    float _2565 = _2483 * _2537;
    float _2567 = trunc(_2525);
    int _2569 = int(_2567);
    float _2571 = fma(_2547, _2563, _2553);
    float _2573 = fma(_2547, _2553, _2563);
    float _2575 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2577 = -_2539;
    float _2579 = fma(_2547, _2565, _2577);
    float _2581 = -_2565;
    float _2583 = fma(_2547, _2539, _2581);
    float _2585 = _2575 * _2125;
    float _2587 = _2507 * 6.283185482025146484375;
    float _2589 = cos(_2587);
    int _2591 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2593 = _2561 + _2591;
    int _2595 = _2593 + 1;
    float _2597 = _2585 * _2543;
    bool _2599 = _2595 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2601 = 1.0 / _2557;
    int _2603 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2605 = _2569 + _2603;
    int _2607 = _2605 + 1;
    int _2609 = _2595 | _2607;
    float _2611 = _2499 * _2589;
    float _2613 = _2537 * _2589;
    float _2615 = _2483 * _2589;
    float _2617 = _2517 * _2589;
    float _2619 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    bool _2621 = _2609 < 0;
    bool _2623 = _2621 || _2599;
    float _2625 = -_2597;
    float _2627 = _2547 * _2625;
    float _2629 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2631 = _2601 * _2629;
    float _2633 = _2149 * _2619;
    float _2635 = _2611 * _2597;
    bool _2637 = _2607 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2639 = _2637 || _2623;
    float _2641 = _2615 * _2597;
    bool _2643 = _2631 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2645 = fma(_2571, _2633, _2635);
    bool _2647 = _2631 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2649 = fma(_2613, _2633, _2627);
    float _2651 = fma(_2579, _2633, _2641);
    float _2653 = fma(_2583, _2269, _2645);
    bool _2655 = !_2643;
    int _2657 = _2655 ? 0 : 1;
    float _2659 = fma(_2617, _2269, _2649);
    float _2661 = fma(_2573, _2269, _2651);
    float _2663 = _2653 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2665 = _2653 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2667 = as_type<int>(_2651);
    float _2669 = _2653;
    float _2671 = _2659;
    if (!_2639)
    {
        int _2673 = _2607 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2675 = _2673 + _2595;
        _2009 = _2675;
    }
    int _2677 = _2009;
    float _2679 = _2653 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_2643)
    {
        _2313 = 1;
    }
    int _2681 = _2313;
    float _2683 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2665);
    int _2685 = _2681;
    if (!_2647)
    {
        _2685 = _2657;
    }
    int _2687 = _2685;
    float _2689 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2663);
    float _2691 = as_type<float>(_2687);
    if (!_2639)
    {
        int _2693 = _2677 << 2;
        _2667 = _2693;
    }
    int _2695 = _2667;
    float _2697 = fma(_2661, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2683);
    int _2699 = _2687 << 6;
    float _2701 = fma(_2661, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2689);
    int _2703 = _2695;
    int _2705 = as_type<int>(_2701);
    if (!_2639)
    {
        int _2707 = 12 & _2695;
        _2703 = _2707;
    }
    int _2709 = _2703;
    float _2711 = _2697 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _2713 = _2699 + 96;
    uint _2716 = uint(int(uint(_2713) >> uint(2)));
    uint _2718 = uint(int(uint(int(_2716)) >> uint(2)));
    int _2720 = int(_2716) & 3;
    float _2722 = (*spvDescriptorSet0.vp_c15)._m0[int(_2718)][_2720];
    int _2724 = int(_2716) + 1;
    uint _2726 = uint(int(uint(_2724) >> uint(2)));
    int _2728 = _2724 & 3;
    float _2730 = (*spvDescriptorSet0.vp_c15)._m0[int(_2726)][_2728];
    float _2732 = _2701 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    if (!_2639)
    {
        uint _2734 = uint(int(uint(_2677) >> uint(2)));
        _2705 = int(_2734);
    }
    int _2736 = _2705;
    float _2738 = _1589 + _2711;
    float _2740 = fma(_2659, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2679);
    float _2742 = _1561 + _2732;
    float _2744 = 0.0;
    float _2746 = _2742;
    float _2748 = _2738;
    if (!_2639)
    {
        int _2750 = _2736 << 4;
        int _2752 = _2750 + _2709;
        _2744 = as_type<float>(_2752);
    }
    float _2754 = _2744;
    float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2758 = _2738 + _2756;
    int _2760 = _2699 + 48;
    uint _2762 = uint(int(uint(_2760) >> uint(2)));
    uint _2764 = uint(int(uint(int(_2762)) >> uint(2)));
    int _2766 = int(_2762) & 3;
    float _2768 = (*spvDescriptorSet0.vp_c15)._m0[int(_2764)][_2766];
    int _2770 = int(_2762) + 1;
    uint _2772 = uint(int(uint(_2770) >> uint(2)));
    int _2774 = _2770 & 3;
    float _2776 = (*spvDescriptorSet0.vp_c15)._m0[int(_2772)][_2774];
    float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2780 = _2742 + _2778;
    if (!_2639)
    {
        float _2782 = floor(_2523);
        _2669 = _2782;
    }
    float _2784 = _2669;
    float _2786 = _2758 * _2758;
    float _2788 = fma(_2661, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2740);
    float _2790 = fma(_2780, _2780, _2786);
    int _2792 = _2699 + 64;
    uint _2794 = uint(int(uint(_2792) >> uint(2)));
    uint _2796 = uint(int(uint(int(_2794)) >> uint(2)));
    int _2798 = int(_2794) & 3;
    float _2800 = (*spvDescriptorSet0.vp_c15)._m0[int(_2796)][_2798];
    int _2802 = int(_2794) + 1;
    uint _2804 = uint(int(uint(_2802) >> uint(2)));
    int _2806 = _2802 & 3;
    float _2808 = (*spvDescriptorSet0.vp_c15)._m0[int(_2804)][_2806];
    float _2810 = _2788 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    if (!_2639)
    {
        float _2812 = floor(_2525);
        _2671 = _2812;
    }
    float _2814 = _2671;
    int _2816 = _2699 + 104;
    uint _2818 = uint(int(uint(_2816) >> uint(2)));
    uint _2820 = uint(int(uint(int(_2818)) >> uint(2)));
    int _2822 = int(_2818) & 3;
    float _2824 = (*spvDescriptorSet0.vp_c15)._m0[int(_2820)][_2822];
    int _2826 = int(_2818) + 1;
    uint _2828 = uint(int(uint(_2826) >> uint(2)));
    int _2830 = _2826 & 3;
    float _2832 = (*spvDescriptorSet0.vp_c15)._m0[int(_2828)][_2830];
    float _2834 = sqrt(_2790);
    int _2836 = _2699 + 56;
    uint _2838 = uint(int(uint(_2836) >> uint(2)));
    uint _2840 = uint(int(uint(int(_2838)) >> uint(2)));
    int _2842 = int(_2838) & 3;
    float _2844 = (*spvDescriptorSet0.vp_c15)._m0[int(_2840)][_2842];
    int _2846 = int(_2838) + 1;
    uint _2848 = uint(int(uint(_2846) >> uint(2)));
    int _2850 = _2846 & 3;
    float _2852 = (*spvDescriptorSet0.vp_c15)._m0[int(_2848)][_2850];
    int _2854 = _2699 + 72;
    uint _2856 = uint(int(uint(_2854) >> uint(2)));
    uint _2858 = uint(int(uint(int(_2856)) >> uint(2)));
    int _2860 = int(_2856) & 3;
    float _2862 = (*spvDescriptorSet0.vp_c15)._m0[int(_2858)][_2860];
    int _2864 = int(_2856) + 1;
    uint _2866 = uint(int(uint(_2864) >> uint(2)));
    int _2868 = _2864 & 3;
    float _2870 = (*spvDescriptorSet0.vp_c15)._m0[int(_2866)][_2868];
    bool _2872 = _2834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2874 = _2699 + 80;
    uint _2876 = uint(int(uint(_2874) >> uint(2)));
    uint _2878 = uint(int(uint(int(_2876)) >> uint(2)));
    int _2880 = int(_2876) & 3;
    float _2882 = (*spvDescriptorSet0.vp_c15)._m0[int(_2878)][_2880];
    int _2884 = int(_2876) + 1;
    uint _2886 = uint(int(uint(_2884) >> uint(2)));
    int _2888 = _2884 & 3;
    float _2890 = (*spvDescriptorSet0.vp_c15)._m0[int(_2886)][_2888];
    float _2892 = _2487 * _2730;
    int _2894 = _2699 + 88;
    uint _2896 = uint(int(uint(_2894) >> uint(2)));
    uint _2898 = uint(int(uint(int(_2896)) >> uint(2)));
    int _2900 = int(_2896) & 3;
    float _2902 = (*spvDescriptorSet0.vp_c15)._m0[int(_2898)][_2900];
    int _2904 = int(_2896) + 1;
    uint _2906 = uint(int(uint(_2904) >> uint(2)));
    int _2908 = _2904 & 3;
    float _2910 = (*spvDescriptorSet0.vp_c15)._m0[int(_2906)][_2908];
    float _2912 = _2487 * _2776;
    float _2914 = _2754;
    if (!_2639)
    {
        int _2916 = as_type<int>(_2754) + 400;
        uint _2918 = uint(int(uint(_2916) >> uint(2)));
        uint _2920 = uint(int(uint(int(_2918)) >> uint(2)));
        int _2922 = int(_2918) & 3;
        float _2924 = (*spvDescriptorSet0.vp_c15)._m0[int(_2920)][_2922];
        _2914 = _2924;
    }
    float _2926 = _2914;
    float _2928 = _2487 * _2808;
    float _2930 = fma(_2215, _2722, _2892);
    float _2932 = fma(_2215, _2768, _2912);
    float _2934 = _1559 + _2810;
    float _2936 = fma(_2215, _2800, _2928);
    float _2938 = fma(_2219, _2824, _2930);
    bool _2940 = !_2872;
    float _2942 = _2934;
    float _2944 = _2852;
    if (!_2940)
    {
        float _2946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2948 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2950 = _2834 + _2948;
        float _2952 = _2934 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2954 = rsqrt(_2790);
        float _2956 = _2950 * _2946;
        float _2958 = _2956 * 0.15915493667125701904296875;
        float _2960 = _2958 * 6.283185482025146484375;
        float _2962 = cos(_2960);
        float _2964 = _2958 * 6.283185482025146484375;
        float _2966 = sin(_2964);
        float _2968 = _2962 + (-1.0);
        float _2970 = fma(_2966, _2952, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2972 = _2968 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2974 = _2954 * _2970;
        float _2976 = fma(_2934, _2962, _2972);
        float _2978 = fma(_2780, _2974, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2980 = fma(_2758, _2974, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2942 = _2976;
        _2746 = _2978;
        _2748 = _2980;
    }
    float _2982 = _2942;
    float _2984 = _2746;
    float _2986 = _2748;
    float _2988 = _2938 + _2832;
    bool _2990 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2992 = isnan(0.5);
    bool _2994 = _2990 || _2992;
    bool _2996 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2998 = _2994 || _2996;
    float _3000 = fma(_2219, _2844, _2932);
    float _3002 = -_1841;
    float _3004 = _3002 + _2982;
    float _3006 = 1.0 / _2988;
    float _3008 = -_1847;
    float _3010 = _3008 + _2984;
    float _3012 = -_1919;
    float _3014 = _3012 + _2986;
    float _3016 = -_1829;
    float _3018 = fma(_3016, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3004);
    float _3020 = fma(_2219, _2862, _2936);
    float _3022 = _3000 + _2852;
    float _3024 = -_1833;
    float _3026 = fma(_3024, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3010);
    float _3028 = -_1835;
    float _3030 = fma(_3028, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3014);
    float _3032 = _3020 + _2870;
    float _3034 = _3026;
    float _3036 = _3030;
    if (_2998)
    {
        _2944 = _3018;
    }
    float _3038 = _2944;
    float _3040 = _3038;
    if (!_2998)
    {
        float _3042 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3044 = _2479 + _3042;
        float _3046 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3048 = _2215 + _3046;
        float _3050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3052 = -_1589;
        float _3054 = _3052 + _2986;
        float _3056 = _3044 * _3044;
        float _3058 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3060 = _2219 + _3058;
        float _3062 = -_1559;
        float _3064 = _3062 + _2982;
        float _3066 = fma(_3048, _3048, _3056);
        float _3068 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3070 = fma(_3060, _3060, _3066);
        float _3072 = sqrt(_3070);
        float _3074 = 1.0 / _2079;
        float _3076 = _3068 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3078 = precise::min(_3072, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3080 = _3078 * _3050;
        float _3082 = _3080 * _3074;
        float _3084 = -_1561;
        float _3086 = _3084 + _2984;
        float _3088 = _3076 * _3082;
        float _3090 = _3054 * _3082;
        float _3092 = fma(_3086, _3088, _2215);
        float _3094 = fma(_3064, _3088, _2479);
        float _3096 = fma(_3076, _3090, _2219);
        _3040 = _3094;
        _3034 = _3092;
        _3036 = _3096;
    }
    float _3098 = _3040;
    float _3100 = _3034;
    float _3102 = _3036;
    float _3104 = _3098 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3106 = _3098 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3108 = _3022 * _3006;
    float _3110 = _3098 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3112 = fma(_3100, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3104);
    float _3114 = fma(_3100, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3106);
    float _3116 = _3098 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _3118 = _3108 >= 0.0;
    float _3120 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3112);
    float _3122 = fma(_3100, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3110);
    float _3124 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3114);
    float _3126 = _3032 * _3006;
    float _3128 = _3120 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3130 = _3108 <= 1.0;
    bool _3132 = _3130 && _3118;
    float _3134 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3122);
    float _3136 = fma(_3100, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3116);
    float _3138 = _3124 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3140 = _3128 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3142 = _3134 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _3144 = _3126 >= 0.0;
    bool _3146 = _3144 && _3132;
    float _3148 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3136);
    float _3150 = fma(_3138, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3140);
    float _3152 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3154 = _3142 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _3156 = _3126 <= 1.0;
    bool _3158 = _3156 && _3146;
    float _3160 = _3148 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3162 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3150);
    float _3164 = -_3154;
    float _3166 = fma(_3164, _3152, 1.0);
    float _3168 = _2487 * _2890;
    float _3170 = _3128 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3172 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3162);
    float _3174 = _3128 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3176 = fma(_2215, _2882, _3168);
    float _3178 = log2(_3166);
    float _3180 = fma(_3138, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3170);
    float _3182 = fma(_3138, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3174);
    float _3184 = fma(_2219, _2902, _3176);
    float _3186 = _3176;
    if (_3158)
    {
        float _3188 = float(_2687);
        _2691 = _3188;
    }
    float _3190 = _2691;
    float _3192 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3180);
    float _3194 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3182);
    float _3196 = _3184 + _2910;
    float _3198 = 1.0 / _3172;
    float _3200 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3192);
    float _3202 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3194);
    float _3204 = _3200;
    if (!_2639)
    {
        float _3206 = -_2784;
        float _3208 = _2523 + _3206;
        _3186 = _3208;
    }
    float _3210 = _3186;
    if (!_2639)
    {
        float _3212 = -_2814;
        float _3214 = _2525 + _3212;
        _1885 = _3214;
    }
    float _3216 = _1885;
    float _3218 = _3196 * _3006;
    float _3220 = _2988;
    if (!_2639)
    {
        float _3222 = rint(_2926);
        float _3224 = precise::max(_3222, 0.0);
        uint _3226 = uint(_3224);
        uint _3228 = clamp(_3226, 0u, 65535u);
        _3220 = as_type<float>(_3228);
    }
    float _3230 = _3220;
    float _3232 = _3178 * 0.693147182464599609375;
    float _3234 = _3232 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3236 = _3174;
    float _3238 = _3232;
    if (_3158)
    {
        float _3240 = rint(_3190);
        float _3242 = precise::max(_3240, 0.0);
        uint _3244 = uint(_3242);
        uint _3246 = clamp(_3244, 0u, 65535u);
        _3236 = as_type<float>(_3246);
    }
    float _3248 = _3236;
    float _3250 = _3200 * _3198;
    float _3252 = _3202 * _3198;
    float _3254 = fma(_3250, 0.5, 0.5);
    float _3256 = fma(_3252, -0.5, 0.5);
    float _3258 = _3216;
    float _3260 = _3256;
    if (!_2639)
    {
        float3 _9338 = float3(_3210, _3216, float(as_type<int>(_3230)));
        float3 _9342 = select(_9338, float3(0.0), isnan(_9338));
        float _3262 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9342.xy, uint(rint(_9342.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9342.xy, uint(rint(_9342.z)), level(0.0)).x;
        _3258 = _3262;
    }
    float _3264 = _3258;
    float _3266 = _3126;
    if (_3158)
    {
        float3 _9357 = float3(_3108, _3126, float(as_type<int>(_3248)));
        float3 _9359 = select(_9357, float3(0.0), isnan(_9357));
        float _3268 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9359.xy, uint(rint(_9359.z)), _3218, level(0.0));
        _3266 = _3268;
    }
    float _3270 = _3266;
    float3 _9369 = float3(_3254, _3256, _3234);
    float _3272 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9369, float3(0.0), isnan(_9369)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9369, float3(0.0), isnan(_9369)), level(0.0)).x;
    float3 _9378 = float3(_3254, _3256, _3234);
    float4 _3275 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9378, float3(0.0), isnan(_9378)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9378, float3(0.0), isnan(_9378)), level(0.0)).xyzw;
    float _3277 = _3275.x;
    float _3279 = _3275.y;
    float _3281 = _3275.z;
    float _3283 = _3275.w;
    bool _3285 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3287 = isnan(0.5);
    bool _3289 = _3285 || _3287;
    bool _3291 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3293 = _3289 || _3291;
    if (_2639)
    {
        _3238 = 1.0;
    }
    float _3295 = _3238;
    float _3297 = _3295;
    if (_3293)
    {
        _1887 = 1.0;
    }
    float _3299 = _1887;
    float _3301 = _3299;
    if (!_3293)
    {
        float _3303 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3305 = _3303 * 0.15915493667125701904296875;
        float _3307 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3309 = _3305 * 6.283185482025146484375;
        float _3311 = cos(_3309);
        float _3313 = _3307 * 0.15915493667125701904296875;
        float _3315 = _3305 * 6.283185482025146484375;
        float _3317 = sin(_3315);
        float _3319 = 1.0 / _3311;
        float _3321 = _3313 * 6.283185482025146484375;
        float _3323 = cos(_3321);
        float _3325 = _3317 * _3319;
        float _3327 = _3313 * 6.283185482025146484375;
        float _3329 = sin(_3327);
        float _3331 = _3323 * _3325;
        float _3333 = 1.0 / _3331;
        float _3335 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3337 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3335;
        float _3339 = 1.0 / _3337;
        float _3341 = _3329 * _3333;
        float _3343 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3345 = fma(_2631, _3341, _3343);
        float _3347 = _3345 * _3339;
        float _3349 = precise::clamp(_3347, 0.0, 1.0);
        _3260 = _3345;
        _3301 = _3349;
    }
    float _3351 = _3260;
    float _3353 = _3301;
    if (!_2639)
    {
        int _3355 = _2677 << 4;
        int _3357 = _3355 + 2048;
        uint _3359 = uint(int(uint(_3357) >> uint(2)));
        uint _3361 = uint(int(uint(int(_3359)) >> uint(2)));
        int _3363 = int(_3359) & 3;
        float _3365 = (*spvDescriptorSet0.vp_c15)._m0[int(_3361)][_3363];
        int _3367 = int(_3359) + 1;
        uint _3369 = uint(int(uint(_3367) >> uint(2)));
        int _3371 = _3367 & 3;
        float _3373 = (*spvDescriptorSet0.vp_c15)._m0[int(_3369)][_3371];
        int _3375 = _3357 + 8;
        uint _3377 = uint(int(uint(_3375) >> uint(2)));
        uint _3379 = uint(int(uint(int(_3377)) >> uint(2)));
        int _3381 = int(_3377) & 3;
        float _3383 = (*spvDescriptorSet0.vp_c15)._m0[int(_3379)][_3381];
        int _3385 = int(_3377) + 1;
        uint _3387 = uint(int(uint(_3385) >> uint(2)));
        int _3389 = _3385 & 3;
        float _3391 = (*spvDescriptorSet0.vp_c15)._m0[int(_3387)][_3389];
        float _3393 = _2487 * _3373;
        float _3395 = fma(_2215, _3365, _3393);
        float _3397 = fma(_2219, _3383, _3395);
        float _3399 = _3397 + _3391;
        float _3401 = precise::clamp(_3399, 0.0, 1.0);
        float _3403 = -_3401;
        float _3405 = _3403 + _3264;
        float _3407 = fma(_3405, 500.0, 1.5);
        float _3409 = exp2(_3407);
        float _3411 = 0.0 + _3409;
        float _3413 = precise::clamp(_3411, 0.0, 1.0);
        _3297 = _3413;
    }
    float _3415 = _3297;
    float _3417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3419 = _3098 + _3417;
    float _3421 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3423 = _3100 + _3421;
    float _3425 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3427 = _3102 + _3425;
    float _3429 = _3419 * _3419;
    float _3431 = fma(_3423, _3423, _3429);
    float _3433 = fma(_3427, _3427, _3431);
    float _3435 = rsqrt(_3433);
    float _3437 = sqrt(_3433);
    float _3439 = _3435 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3441 = _3423 * _3439;
    float _3443 = _3427 * _3439;
    float _3445 = _3441 * _3441;
    float _3447 = _3443 * _3443;
    float _3449 = _3445 + _3447;
    float _3451 = sqrt(_3449);
    bool _3453 = _3451 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3457 = _3451 + _3455;
    float _3459 = _3351;
    float _3461 = _3449;
    float _3463 = _3457;
    float _3465 = _3441;
    float _3467 = _3443;
    float _3469 = _3445;
    float _3471 = _3447;
    if (_3453)
    {
        float _3473 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3459 = _3473;
    }
    float _3475 = _3459;
    if (_3453)
    {
        float _3477 = rsqrt(_3449);
        _3461 = _3477;
    }
    float _3479 = _3461;
    if (_3453)
    {
        float _3481 = _3457 * _3475;
        _3463 = _3481;
    }
    float _3483 = _3463;
    if (_3453)
    {
        float _3485 = _3483 * 0.15915493667125701904296875;
        _1889 = _3485;
    }
    float _3487 = _1889;
    float _3489 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3491 = _3234;
    float _3493 = _3489;
    if (_3453)
    {
        float _3495 = _3487 * 6.283185482025146484375;
        float _3497 = sin(_3495);
        _3491 = _3497;
    }
    float _3499 = _3491;
    float _3501 = precise::max(0.0, _3489);
    float _3503 = _3483;
    float _3505 = _3501;
    if (_3453)
    {
        float _3507 = _3487 * 6.283185482025146484375;
        float _3509 = cos(_3507);
        _3503 = _3509;
    }
    float _3511 = _3503;
    float _3513 = -_3439;
    float _3515 = -_3501;
    float _3517 = fma(_3419, _3513, _3515);
    float _3519 = _3517;
    if (_3453)
    {
        float _3521 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3505 = _3521;
    }
    float _3523 = _3505;
    float _3525 = _3499;
    if (_3453)
    {
        float _3527 = fma(_3499, _3523, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3525 = _3527;
    }
    float _3529 = _3525;
    float _3531 = _3529;
    if (_3453)
    {
        float _3533 = _3479 * _3529;
        _3531 = _3533;
    }
    float _3535 = _3531;
    if (_3453)
    {
        float _3537 = _3511 + (-1.0);
        _3493 = _3537;
    }
    float _3539 = _3493;
    float _3541 = _3539;
    if (_3453)
    {
        float _3543 = _3441 * _3535;
        _3465 = _3543;
    }
    float _3545 = _3465;
    if (_3453)
    {
        float _3547 = _3443 * _3535;
        _3467 = _3547;
    }
    float _3549 = _3467;
    if (_3453)
    {
        float _3551 = _3539 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3541 = _3551;
    }
    float _3553 = _3541;
    if (_3453)
    {
        float _3555 = _3545 * _3545;
        _3469 = _3555;
    }
    float _3557 = _3469;
    if (_3453)
    {
        float _3559 = _3549 * _3549;
        _3471 = _3559;
    }
    float _3561 = _3471;
    if (_3453)
    {
        float _3563 = fma(_3517, _3511, _3553);
        _3519 = _3563;
    }
    float _3565 = _3519;
    float _3567 = fma(_3565, _3565, _3557);
    float _3569 = _3567 + _3561;
    float _3571 = rsqrt(_3569);
    float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3575 = fma(_3437, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3573);
    float _3577 = precise::clamp(_3575, 0.0, 1.0);
    float _3579 = -_3577;
    float _3581 = _3579 + 1.0;
    float _3583 = abs(_3581);
    float _3585 = log2(_3583);
    float _3587 = _3571 * _3545;
    float _3589 = _3571 * _3565;
    float _3591 = _3571 * _3549;
    float _3593 = _3587 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3595 = -_3593;
    float _3597 = fma(_3589, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3595);
    float _3599 = -_3591;
    float _3601 = fma(_3599, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3597);
    float _3603 = _3585 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3605 = fma(_3601, -0.5, 0.5);
    float _3607 = fma(_3601, 0.5, 0.5);
    float _3609 = exp2(_3603);
    float _3611 = fma(_3607, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3613 = fma(_3607, _3611, -0.212114393711090087890625);
    float _3615 = _3589 + 1.0;
    float _3617 = sqrt(_3605);
    float _3619 = fma(_3607, _3613, 1.570728778839111328125);
    float _3621 = -_3589;
    float _3623 = fma(_3609, _3615, _3621);
    float _3625 = _3617 * 0.636619746685028076171875;
    float _3627 = fma(_3623, 0.5, 0.5);
    float _3629 = -_3619;
    float _3631 = fma(_3625, _3629, 1.0);
    float2 _9910 = float2(_3631, _3627);
    float3 _3635 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9910, float2(0.0), isnan(_9910)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9910, float2(0.0), isnan(_9910)), level(0.0)).xyz;
    float _3637 = _3635.x;
    float _3639 = _3635.y;
    float _3641 = _3635.z;
    float _3643 = _2571 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3645 = _2571 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3647 = _2571 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3649 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3651 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3643);
    float _3653 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3645);
    float _3655 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3647);
    float _3657 = fma(_3649, _3649, 1.0);
    float _3659 = abs(_2631);
    float _3661 = log2(_3659);
    float _3663 = _2611 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3665 = _2611 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3667 = _2611 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3669 = _2583 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3671 = _2583 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3673 = _2583 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3675 = -_2547;
    float _3677 = fma(_3675, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3663);
    float _3679 = rsqrt(_3657);
    float _3681 = -_2547;
    float _3683 = fma(_3681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3665);
    float _3685 = -_2547;
    float _3687 = fma(_3685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3667);
    float _3689 = fma(_2617, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3671);
    float _3691 = fma(_2617, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3669);
    float _3693 = fma(_2617, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3673);
    float _3695 = _3128 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3697 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3677);
    float _3699 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3683);
    float _3701 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3687);
    float _3703 = fma(_3138, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3695);
    float _3705 = _3661 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3707 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3691);
    float _3709 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3689);
    float _3711 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3693);
    float _3713 = fma(_3142, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3703);
    float _3715 = _3649 * _3679;
    float _3717 = exp2(_3705);
    float _3719 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3653);
    float _3721 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3651);
    float _3723 = -_3707;
    float _3725 = _3715 * _3723;
    float _3727 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3655);
    float _3729 = -_3709;
    float _3731 = _3715 * _3729;
    float _3733 = _3649 * _3697;
    float _3735 = fma(_3679, _3697, _3725);
    float _3737 = -_3711;
    float _3739 = _3715 * _3737;
    float _3741 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3743 = fma(_3679, _3699, _3731);
    float _3745 = _3649 * _3699;
    float _3747 = fma(_3679, _3701, _3739);
    float _3749 = _3172 * 0.5;
    out.m_96.x = _3721;
    out.m_96.y = _3719;
    out.m_96.z = _3727;
    float _3751 = fma(_3741, _3719, _3745);
    float _3753 = _3585 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3755 = _2631 <= 8000.0;
    bool _3757 = isnan(_2631);
    bool _3759 = _3755 || _3757;
    bool _3761 = isnan(8000.0);
    bool _3763 = _3759 || _3761;
    float _3765 = float(_3763);
    float _3767 = fma(_3717, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3769 = precise::clamp(_3767, 0.0, 1.0);
    out.m_98.x = _2215;
    out.m_98.y = _2479;
    out.m_98.z = _2219;
    float _3771 = _3649 * _3701;
    float _3773 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3713);
    float _3775 = exp2(_3753);
    float _3777 = fma(_3741, _3721, _3733);
    float _3779 = fma(_3741, _3727, _3771);
    float _3781 = _3773 + _3172;
    float _3783 = fma(_3202, -0.5, _3749);
    float _3785 = _3200 + _3172;
    float _3787 = -_2237;
    float _3789 = _3787 + 1.0;
    float _3791 = _3781 * 0.5;
    float _3793 = fma(_3769, -2.0, 3.0);
    float _3795 = _3769 * _3769;
    float _3797 = _3785 * 0.5;
    out.m_100.x = _3735;
    out.m_100.y = _3743;
    out.m_100.z = _3747;
    float _3799 = _3785;
    float _3801 = _3789;
    if (!_3158)
    {
        _2315 = 1.0;
    }
    float _3803 = _2315;
    float _3805 = _3795 * _3793;
    float _3807 = _3803;
    if (_3158)
    {
        bool _3809 = _3270 >= _3218;
        bool _3811 = isnan(_3270);
        bool _3813 = _3809 || _3811;
        bool _3815 = isnan(_3218);
        bool _3817 = _3813 || _3815;
        float _3819 = float(_3817);
        _3807 = _3819;
    }
    float _3821 = _3807;
    out.m_102.x = _3797;
    out.m_102.y = _3783;
    out.m_102.z = _3791;
    out.m_102.w = _3172;
    bool _3823 = _3437 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3825 = isnan(_3437);
    bool _3827 = _3823 || _3825;
    bool _3829 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3831 = _3827 || _3829;
    float _3833 = -_3805;
    float _3835 = _3833 + 1.0;
    out.m_104.x = _3100;
    out.m_104.y = _3098;
    out.m_104.z = _3102;
    float _3837 = _3821 * _3415;
    float _3839 = fma(_3835, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3805);
    float _3841 = _3707 + _3777;
    float _3843 = _3709 + _3751;
    float _3845 = _3765 * _3839;
    float _3847 = _3711 + _3779;
    out.gl_Position.x = _3200;
    out.gl_Position.y = _3202;
    out.gl_Position.z = _3773;
    out.gl_Position.w = _3172;
    float _3849 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3851 = -_3775;
    float _3853 = _3851 + 1.0;
    out.m_106.x = _3841;
    out.m_106.y = _3843;
    out.m_106.z = _3847;
    if (!_3831)
    {
        _3799 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3855 = _3799;
    float _3857 = _3789 * _3849;
    float _3859 = precise::clamp(_3857, 0.0, 1.0);
    float _3861 = _3853 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3863 = _3861;
    float _3865 = _3855;
    float _3867 = _3855;
    if (!_3831)
    {
        _3801 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3869 = _3801;
    float _3871 = -_3859;
    float _3873 = fma(_3871, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3875 = _3861 * _3272;
    float _3877 = -_3861;
    float _3879 = _3877 + 1.0;
    float _3881 = _3879;
    float _3883 = _3869;
    float _3885 = _3869;
    if (!_3831)
    {
        _3863 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3887 = _3863;
    float _3889 = -_3837;
    float _3891 = fma(_3889, _3873, 1.0);
    float _3893 = precise::clamp(_3891, 0.0, 1.0);
    float _3895 = _3283 * _3875;
    float _3897 = _3283 * _3879;
    float _3899 = _3353 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3901 = _3893 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3903 = _3901;
    float _3905 = _3887;
    float _3907 = _3887;
    if (!_3831)
    {
        _3204 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3909 = _3204;
    float _3911 = _3909;
    float _3913 = _3909;
    if (!_3831)
    {
        _3881 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3915 = _3881;
    out.m_108.x = _3901;
    float _3917 = _3915;
    float _3919 = _3915;
    if (!_3831)
    {
        _3903 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3921 = _3903;
    float _3923 = _3641 * _3875;
    float _3925 = fma(_3637, _3895, _3277);
    float _3927 = fma(_3639, _3895, _3279);
    float _3929 = fma(_3283, _3923, _3281);
    out.m_110.x = _3925;
    out.m_110.y = _3927;
    out.m_110.z = _3929;
    out.m_110.w = _3897;
    bool _3931 = !_3831;
    float _3933 = _3921;
    float _3935 = _3921;
    if (!_3931)
    {
        bool _3937 = _3437 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3939 = isnan(_3437);
        bool _3941 = _3937 || _3939;
        bool _3943 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3945 = _3941 || _3943;
        if (!_3945)
        {
            float _3947 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3949 = _3437 + _3947;
            float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3953 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3951;
            float _3955 = 1.0 / _3953;
            float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3959 = _3957 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3963 = _3961 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3965 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3967 = _3965 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3971 = _3969 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3973 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3975 = _3973 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3977 = _3949 * _3955;
            float _3979 = precise::clamp(_3977, 0.0, 1.0);
            float _3981 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3983 = _3981 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3985 = fma(_3979, _3959, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3987 = fma(_3979, _3983, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3989 = fma(_3979, _3963, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3991 = fma(_3979, _3967, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3993 = fma(_3979, _3971, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3995 = fma(_3979, _3975, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3913 = _3987;
            _3907 = _3993;
            _3885 = _3985;
            _3919 = _3991;
            _3867 = _3989;
            _3935 = _3995;
            _3997 = true;
        }
        else
        {
            bool _3999 = _3437 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4001 = isnan(_3437);
            bool _4003 = _3999 || _4001;
            bool _4005 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4007 = _4003 || _4005;
            if (!_4007)
            {
                _3883 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4009 = _3883;
            _3885 = _4009;
            if (!_4007)
            {
                _3911 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4011 = _3911;
            _3913 = _4011;
            if (!_4007)
            {
                _3865 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4013 = _3865;
            _3867 = _4013;
            if (!_4007)
            {
                _3917 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4015 = _3917;
            _3919 = _4015;
            if (!_4007)
            {
                _3905 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4017 = _3905;
            _3907 = _4017;
            if (!_4007)
            {
                _3933 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4019 = _3933;
            bool _4021 = !_4007;
            _3935 = _4019;
            if (!_4021)
            {
                bool _4023 = _3437 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4025 = isnan(_3437);
                bool _4027 = _4023 || _4025;
                bool _4029 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4031 = _4027 || _4029;
                if (!_4031)
                {
                    float _4033 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4035 = _3437 + _4033;
                    float _4037 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4039 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4037;
                    float _4041 = 1.0 / _4039;
                    float _4043 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4045 = _4043 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4047 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4049 = _4047 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4051 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4053 = _4051 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4055 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4057 = _4055 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4059 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4061 = _4059 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4063 = _4035 * _4041;
                    float _4065 = precise::clamp(_4063, 0.0, 1.0);
                    float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4069 = _4067 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4071 = fma(_4065, _4045, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4073 = fma(_4065, _4069, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4075 = fma(_4065, _4049, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4077 = fma(_4065, _4053, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4079 = fma(_4065, _4057, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4081 = fma(_4065, _4061, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3913 = _4073;
                    _3907 = _4079;
                    _3885 = _4071;
                    _3919 = _4077;
                    _3867 = _4075;
                    _3935 = _4081;
                    _3997 = true;
                }
                else
                {
                    _3913 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3907 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3885 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3919 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3867 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3935 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3997 = false;
    float _4083 = _3913;
    float _4085 = _3907;
    float _4087 = _3885;
    float _4089 = _3919;
    float _4091 = _3867;
    float _4093 = _3935;
    float _4095 = fma(_3843, -0.5, 0.5);
    float _4097 = precise::clamp(_4095, 0.0, 1.0);
    float _4099 = -_4083;
    float _4101 = _4099 + _4085;
    float _4103 = _3899 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4105 = -_4087;
    float _4107 = _4105 + _4089;
    float _4109 = fma(_4097, _4101, _4083);
    out.m_112.x = 0.0;
    float _4111 = -_4091;
    float _4113 = _4111 + _4093;
    float _4115 = fma(_4097, _4107, _4087);
    float _4117 = _4109 * 0.586610972881317138671875;
    out.m_59.x = _4103;
    bool _4119 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4121 = fma(_4097, _4113, _4091);
    float _4123 = fma(_4115, 0.298911988735198974609375, _4117);
    bool _4125 = _3353 > 0.0;
    bool _4127 = isnan(_3353);
    bool _4129 = _4125 || _4127;
    bool _4131 = isnan(0.0);
    bool _4133 = _4129 || _4131;
    float _4135 = fma(_4121, 0.114477999508380889892578125, _4123);
    float _4137 = -_4135;
    float _4139 = _4115 + _4137;
    float _4141 = -_4135;
    float _4143 = _4109 + _4141;
    float _4145 = -_4135;
    float _4147 = _4121 + _4145;
    float _4149 = fma(_4139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    float _4151 = fma(_4143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    float _4153 = fma(_4147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4135);
    bool _4155 = !_4119;
    if (!_4155)
    {
        float _4157 = -_3098;
        float _4159 = _4157 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4161 = -_3100;
        float _4163 = _4161 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4165 = -_3102;
        float _4167 = _4165 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4169 = _4159 * _4159;
        float _4171 = fma(_4163, _4163, _4169);
        float _4173 = fma(_4167, _4167, _4171);
        float _4175 = sqrt(_4173);
        float _4177 = rsqrt(_4173);
        float _4179 = -_4175;
        float _4181 = _4179 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4183 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4185 = precise::clamp(_4183, 0.0, 1.0);
        float _4187 = _4163 * _4177;
        float _4189 = _4159 * _4177;
        float _4191 = abs(_4185);
        float _4193 = log2(_4191);
        float _4195 = _4167 * _4177;
        float _4197 = _4187 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4199 = _3843 * _4189;
        float _4201 = -_4189;
        float _4203 = -_4197;
        float _4205 = fma(_4201, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4203);
        float _4207 = fma(_3841, _4187, _4199);
        float _4209 = -_4195;
        float _4211 = fma(_4209, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4205);
        float _4213 = fma(_3847, _4195, _4207);
        float _4215 = precise::clamp(_4213, 0.0, 1.0);
        float _4217 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4219 = _4211 + _4217;
        float _4221 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4223 = _4219 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4225 = precise::clamp(_4223, 0.0, 1.0);
        float _4227 = exp2(_4221);
        float _4229 = _4227 * _4225;
        float _4231 = _4215 * _4229;
        float _4233 = _4231 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4235 = _4231 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4237 = _4231 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_112.x = _4233;
        out.m_112.y = _4235;
        out.m_112.z = _4237;
    }
    out.m_84.x = _4149;
    out.m_84.y = _4151;
    out.m_84.z = _4153;
    if (_4133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4239 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4239;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

