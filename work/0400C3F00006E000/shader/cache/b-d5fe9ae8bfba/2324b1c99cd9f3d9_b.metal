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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_2C [[id(7)]];
    sampler vp_t_tcb_2CSmplr [[id(8)]];
    texture2d<float> vp_t_tcb_28 [[id(9)]];
    sampler vp_t_tcb_28Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_24 [[id(11)]];
    sampler vp_t_tcb_24Smplr [[id(12)]];
    sampler vp_t_tcb_2CSmplr_w [[id(13)]];
    sampler vp_t_tcb_28Smplr_w [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_66 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
    float4 m_62 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_88 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_82 [[attribute(0)]];
    float4 m_56 [[attribute(1)]];
    float4 m_54 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_43 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_74 [[attribute(7)]];
    float4 m_72 [[attribute(8)]];
    float4 m_50 [[attribute(9)]];
    float4 m_64 [[attribute(10)]];
    float4 m_60 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2211 = false;
    bool _1865 = false;
    bool _745 = false;
    bool _617 = false;
    bool _465 = false;
    bool _353 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_43.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_46.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2496 = as_type<float>(_127);
        out.gl_Position.z = _2496;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_48.w;
    float _133 = in.m_50.x;
    bool _135 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_131);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_131;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_52.x = _133;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_111);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _121;
    if (_161)
    {
        out.m_46.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _129 = as_type<int>(_165);
    }
    int _167 = _129;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2569 = as_type<float>(_167);
        out.gl_Position.z = _2569;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = in.m_54.x;
    float _171 = in.m_54.y;
    float _173 = in.m_54.z;
    float _175 = in.m_56.x;
    float _177 = in.m_56.y;
    float _179 = in.m_56.z;
    float _181 = in.m_58.x;
    float _183 = in.m_58.y;
    float _185 = in.m_58.z;
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = _169 * _169;
    float _193 = _171 * _171;
    float _195 = _173 * _173;
    float _197 = fma(_175, _175, _191);
    float _199 = fma(_177, _177, _193);
    float _201 = fma(_179, _179, _195);
    float _203 = fma(_181, _181, _197);
    float _205 = fma(_183, _183, _199);
    float _207 = fma(_185, _185, _201);
    float _209 = sqrt(_203);
    out.m_62.x = _187;
    out.m_62.y = _189;
    float _211 = sqrt(_205);
    float _213 = sqrt(_207);
    bool _215 = _209 > 0.0;
    bool _217 = _211 > 0.0;
    float _219 = _203;
    float _221 = _211;
    float _223 = _207;
    float _225 = _189;
    float _227 = _187;
    if (_215)
    {
        float _229 = rsqrt(_203);
        _219 = _229;
    }
    float _231 = _219;
    float _233 = 0.0;
    float _235 = 0.0;
    if (!_215)
    {
        _233 = 0.0;
        _235 = 0.0;
    }
    float _237 = _233;
    float _239 = _235;
    bool _241 = _213 > 0.0;
    float _243 = 0.0;
    float _245 = _237;
    float _247 = _239;
    if (!_215)
    {
        _243 = 0.0;
    }
    float _249 = _243;
    float _251 = 0.0;
    float _253 = _249;
    if (!_217)
    {
        _251 = 0.0;
    }
    float _255 = _251;
    float _257 = _209;
    float _259 = _255;
    if (_217)
    {
        float _261 = rsqrt(_205);
        _257 = _261;
    }
    float _263 = _257;
    float _265 = 0.0;
    if (!_217)
    {
        _265 = 0.0;
    }
    float _267 = _265;
    float _269 = 0.0;
    float _271 = _267;
    if (!_217)
    {
        _269 = 0.0;
    }
    float _273 = _269;
    float _275 = _273;
    if (!_241)
    {
        _221 = 0.0;
    }
    float _277 = _221;
    float _279 = _213;
    float _281 = _277;
    if (_241)
    {
        float _283 = rsqrt(_207);
        _279 = _283;
    }
    float _285 = _279;
    float _287 = _231;
    if (_215)
    {
        float _289 = _231 * _175;
        _245 = _289;
    }
    float _291 = _245;
    if (_215)
    {
        float _293 = _231 * _169;
        _247 = _293;
    }
    float _295 = _247;
    if (_215)
    {
        float _297 = _231 * _181;
        _253 = _297;
    }
    float _299 = _253;
    bool _301 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_241)
    {
        _287 = 0.0;
    }
    float _303 = _287;
    float _305 = _303;
    if (_217)
    {
        float _307 = _263 * _177;
        _259 = _307;
    }
    float _309 = _259;
    if (!_241)
    {
        _223 = 0.0;
    }
    float _311 = _223;
    float _313 = _311;
    if (_217)
    {
        float _315 = _263 * _171;
        _271 = _315;
    }
    float _317 = _271;
    if (_217)
    {
        float _319 = _263 * _183;
        _275 = _319;
    }
    float _321 = _275;
    if (_241)
    {
        float _323 = _285 * _179;
        _313 = _323;
    }
    float _325 = _313;
    if (_241)
    {
        float _327 = _285 * _173;
        _281 = _327;
    }
    float _329 = _281;
    if (_241)
    {
        float _331 = _285 * _185;
        _305 = _331;
    }
    float _333 = _305;
    bool _335 = !_301;
    float _351;
    if (!_335)
    {
        float _337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _339 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _341 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _343 = _341 * _337;
        float _345 = floor(_343);
        float _347 = -_345;
        float _349 = _343 + _347;
        _351 = _349;
        _353 = true;
    }
    else
    {
        float _355 = float(_111);
        float _357 = 1.0 / _355;
        float _359 = _147 * _357;
        _351 = _359;
    }
    _353 = false;
    float _361 = _351;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _365 = _361 + _363;
    bool _367 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _369 = isnan(_361);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _379;
    bool _383 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _385 = isnan(_361);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -_377;
    float _397 = _395 + 1.0;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _399;
    float _403 = 1.0 / _381;
    bool _405 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _407 = _393 * _397;
    float _409 = -_393;
    float _411 = _409 + 1.0;
    float _413 = _365 * _403;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _415;
    float _419 = fma(_401, _413, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _421;
    float _425 = fma(_417, _413, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _427 = _419 * _407;
    float _429 = fma(_423, _413, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _431 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[143].x, _427);
    float _433 = _429 * _407;
    float _435 = _425 * _407;
    float _437 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[144].x, _431);
    float _439 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[143].y, _433);
    float _441 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[143].z, _435);
    float _443 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[144].y, _439);
    float _445 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[144].z, _441);
    bool _447 = !_405;
    float _463;
    if (!_447)
    {
        float _449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _451 = _133 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _455 = _453 * _449;
        float _457 = floor(_455);
        float _459 = -_457;
        float _461 = _455 + _459;
        _463 = _461;
        _465 = true;
    }
    else
    {
        float _467 = float(_111);
        float _469 = 1.0 / _467;
        float _471 = _147 * _469;
        _463 = _471;
    }
    _465 = false;
    float _473 = _463;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _477 = _473 + _475;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _483 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _485 = isnan(_473);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _499 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _501 = isnan(_473);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _511;
    bool _515 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _517 = isnan(_473);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = 1.0 / _481;
    float _529 = -_493;
    float _531 = _529 + 1.0;
    bool _533 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _535 = 1.0 / _497;
    float _537 = _513 * _527;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _543 = -_525;
    float _545 = _543 + 1.0;
    float _547 = fma(_537, _477, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _549 = _509 * _531;
    float _551 = -_509;
    float _553 = _551 + 1.0;
    float _555 = _493 * _545;
    float _557 = _541 * _535;
    float _559 = _547 * _549;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = _473 + _561;
    float _565 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[115].x, _559);
    float _567 = fma(_557, _563, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _571 = fma(_567, _555, _565);
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _575 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _577 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[117].x, _571);
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _581 = _573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _583 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _585 = in.m_64.x;
    float _587 = in.m_64.y;
    float _589 = in.m_64.z;
    float _591 = _579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _575;
    out.m_66.y = _581;
    out.m_66.z = _591;
    out.m_66.w = _583;
    float _593 = _445 * _589;
    float _595 = _443 * _587;
    float _597 = _437 * _585;
    bool _599 = !_533;
    float _615;
    if (!_599)
    {
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _603 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_111);
        float _621 = 1.0 / _619;
        float _623 = _147 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _629 = _625 + _627;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _635 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _637 = isnan(_625);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _651 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _653 = isnan(_625);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _663;
    bool _667 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _669 = isnan(_625);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = 1.0 / _633;
    float _681 = -_645;
    float _683 = _681 + 1.0;
    bool _685 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _687 = 1.0 / _649;
    float _689 = _665 * _679;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _695 = -_677;
    float _697 = _695 + 1.0;
    float _699 = fma(_689, _629, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _701 = _661 * _683;
    float _703 = -_661;
    float _705 = _703 + 1.0;
    float _707 = _645 * _697;
    float _709 = _693 * _687;
    float _711 = _699 * _701;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _715 = _625 + _713;
    float _717 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[131].x, _711);
    float _719 = fma(_709, _715, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _721 = fma(_719, _707, _717);
    float _723 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[133].x, _721);
    float _725 = _723 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.w = _725;
    bool _727 = !_685;
    float _743;
    if (!_727)
    {
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _731 = _133 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[14].x, _147);
        float _735 = _733 * _729;
        float _737 = floor(_735);
        float _739 = -_737;
        float _741 = _735 + _739;
        _743 = _741;
        _745 = true;
    }
    else
    {
        float _747 = float(_111);
        float _749 = 1.0 / _747;
        float _751 = _147 * _749;
        _743 = _751;
    }
    _745 = false;
    float _753 = _743;
    float _755 = in.m_50.z;
    float _757 = _133 * 2.0;
    float _759 = in.m_50.y;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _763 = _761 != 0;
    float _765 = _597 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _767 = floor(_757);
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _775 = _773 != 0;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _779 = _777 != 0;
    float _781 = _595 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _783 = _593 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (_763)
    {
        _785 = _133;
    }
    float _787 = _785;
    float _789 = _755 * 2.0;
    float _791 = _787;
    float _793 = _789;
    if (!_763)
    {
        _791 = _755;
    }
    float _795 = _791;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _799 = _767 > 0.0;
    float _801 = floor(_789);
    float _803 = _759 + _755;
    float _805 = _759 * 2.0;
    bool _807 = _767 >= 0.0;
    bool _809 = isnan(_767);
    bool _811 = _807 || _809;
    bool _813 = isnan(0.0);
    bool _815 = _811 || _813;
    float _817 = _133 + _759;
    float _819 = _803 + (-1.0);
    float _821 = _795 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _823 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[88].w, _797);
    float _825 = floor(_805);
    if (_763)
    {
        _793 = _759;
    }
    float _827 = _793;
    float _829 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _831 = _827;
    if (!_763)
    {
        _831 = _133;
    }
    float _833 = _831;
    float _835 = _817 + (-1.0);
    bool _837 = _801 > 0.0;
    float _839 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _841 = _801 >= 0.0;
    bool _843 = isnan(_801);
    bool _845 = _841 || _843;
    bool _847 = isnan(0.0);
    bool _849 = _845 || _847;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _853 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _855 = log2(_853);
    bool _857 = !_775;
    int _859 = _857 ? 0 : 1;
    float _861 = -_851;
    float _863 = fma(_821, 2.0, _861);
    int _865 = _815 ? 0 : 1;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _869 = abs(_859);
    float _871 = -_147;
    float _873 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[86].x, _863);
    bool _875 = _825 > 0.0;
    bool _877 = _825 >= 0.0;
    bool _879 = isnan(_825);
    bool _881 = _877 || _879;
    bool _883 = isnan(0.0);
    bool _885 = _881 || _883;
    int _887 = ~_865;
    int _889 = _887 + 1;
    int _891 = _889 + 1;
    float _893 = _855 * _147;
    int _895 = _891;
    if (!_799)
    {
        int _897 = ~_865;
        int _899 = _897 + 1;
        _895 = _899;
    }
    int _901 = _895;
    float _903 = _833 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _905 = float(_869);
    int _907 = _849 ? 0 : 1;
    float _909 = exp2(_893);
    float _911 = float(_901);
    float _913 = fma(_903, -2.0, _867);
    int _915 = ~_907;
    int _917 = _915 + 1;
    int _919 = _917 + 1;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _923 = 1.0 + _921;
    int _925 = _919;
    if (!_837)
    {
        int _927 = ~_907;
        int _929 = _927 + 1;
        _925 = _929;
    }
    int _931 = _925;
    float _933 = _905 * _911;
    bool _935 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _937 = isnan(1.0);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _943 = _939 || _941;
    float _945 = in.m_70.x;
    float _947 = in.m_70.y;
    float _949 = in.m_70.z;
    float _951 = 1.0 / _923;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _955 = !_771;
    int _957 = _955 ? 0 : 1;
    bool _959 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _961 = isnan(0.0);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _967 = _963 || _965;
    float _969 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[88].z, _953);
    int _971 = abs(_957);
    float _973 = -_909;
    float _975 = _973 + 1.0;
    float _977 = float(_931);
    float _979 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[87].z, _969);
    float _981 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[87].w, _823);
    float _983 = float(_971);
    float _985 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[86].y, _913);
    float _987 = _967 ? _975 : 0.0;
    bool _989 = !_779;
    int _991 = _989 ? 0 : 1;
    float _993 = _983 * _977;
    float _995 = _759 + (-0.5);
    if (_943)
    {
        float _997 = _987 * _951;
        _151 = _997;
    }
    float _999 = _151;
    float _1001 = _933 * (-2.0);
    int _1003 = _885 ? 0 : 1;
    float _1005 = _993 * (-2.0);
    int _1007 = abs(_991);
    float _1009 = fma(_1001, _947, _947);
    float _1011 = fma(_829, _1001, _829);
    int _1013 = ~_1003;
    int _1015 = _1013 + 1;
    int _1017 = _1015 + 1;
    float _1019 = _133 + (-0.5);
    float _1021 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1009);
    int _1023 = _1017;
    if (!_875)
    {
        int _1025 = ~_1003;
        int _1027 = _1025 + 1;
        _1023 = _1027;
    }
    int _1029 = _1023;
    float _1031 = _133 + _755;
    float _1033 = fma(_1011, _999, _1021);
    float _1035 = fma(_839, _1005, _839);
    float _1037 = float(_1007);
    float _1039 = fma(_1005, _945, _945);
    float _1041 = _1033 * 0.15915493667125701904296875;
    float _1043 = float(_1029);
    float _1045 = in.m_43.x;
    float _1047 = in.m_43.y;
    float _1049 = in.m_43.z;
    float _1051 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1039);
    float _1053 = _1031 + (-1.0);
    float _1055 = _1037 * _1043;
    float _1057 = _1041 * 6.283185482025146484375;
    float _1059 = sin(_1057);
    float _1061 = fma(_1035, _999, _1051);
    float _1063 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1065 = _1055 * (-2.0);
    float _1067 = _1061 * 0.15915493667125701904296875;
    float _1069 = _755 + (-0.5);
    float _1071 = fma(_1065, _949, _949);
    float _1073 = in.m_72.x;
    float _1075 = in.m_72.y;
    float _1077 = in.m_72.z;
    float _1079 = fma(_1063, _1065, _1063);
    float _1081 = _1041 * 6.283185482025146484375;
    float _1083 = cos(_1081);
    float _1085 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1071);
    float _1087 = fma(_1079, _999, _1085);
    float _1089 = _1067 * 6.283185482025146484375;
    float _1091 = sin(_1089);
    float _1093 = _1087 * 0.15915493667125701904296875;
    float _1095 = _177 * _1047;
    float _1097 = _183 * _1047;
    float _1099 = _171 * _1047;
    float _1101 = fma(_175, _1045, _1095);
    float _1103 = fma(_181, _1045, _1097);
    float _1105 = _1093 * 6.283185482025146484375;
    float _1107 = cos(_1105);
    float _1109 = fma(_169, _1045, _1099);
    float _1111 = fma(_179, _1049, _1101);
    float _1113 = fma(_185, _1049, _1103);
    float _1115 = in.m_58.w;
    float _1117 = fma(_173, _1049, _1109);
    float _1119 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1073);
    float _1121 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1077);
    float _1123 = _1067 * 6.283185482025146484375;
    float _1125 = cos(_1123);
    float _1127 = _1091 * _1059;
    float _1129 = _765 * _1119;
    float _1131 = _783 * _1121;
    float _1133 = in.m_56.w;
    float _1135 = _1093 * 6.283185482025146484375;
    float _1137 = sin(_1135);
    float _1139 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1075);
    float _1141 = _1091 * _1107;
    float _1143 = _781 * _1139;
    float _1145 = _1091 * _1083;
    float _1147 = _1125 * _1083;
    float _1149 = _1125 * _1107;
    float _1151 = _1125 * _1059;
    float _1153 = _1083 * _1107;
    float _1155 = _1059 * _1107;
    float _1157 = _1149 * _1143;
    float _1159 = _1141 * _1143;
    float _1161 = _1113 + _1115;
    float _1163 = fma(_1137, _1147, _1127);
    float _1165 = -_1143;
    float _1167 = _1137 * _1165;
    float _1169 = -_1145;
    float _1171 = fma(_1137, _1151, _1169);
    float _1173 = -_1151;
    float _1175 = fma(_1137, _1145, _1173);
    float _1177 = fma(_1163, _1129, _1157);
    float _1179 = fma(_1153, _1129, _1167);
    float _1181 = fma(_1137, _1127, _1147);
    float _1183 = fma(_1175, _1129, _1159);
    float _1185 = fma(_1171, _1131, _1177);
    float _1187 = fma(_1155, _1131, _1179);
    float _1189 = fma(_1181, _1131, _1183);
    float _1191 = _1185 * _309;
    float _1193 = _1185 * _321;
    float _1195 = fma(_1187, _291, _1191);
    float _1197 = fma(_1187, _299, _1193);
    float _1199 = _1111 + _1133;
    float _1201 = fma(_1189, _325, _1195);
    float _1203 = fma(_1189, _333, _1197);
    float _1205 = _1199 + _1201;
    float _1207 = _1161 + _1203;
    float _1209 = in.m_54.w;
    float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1213 = _1205 + _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1217 = _1207 + _1215;
    float _1219 = _1213 * _1213;
    float _1221 = _1217 * _1217;
    float _1223 = _1219 + _1221;
    float _1225 = sqrt(_1223);
    float _1227 = _1117 + _1209;
    float _1229 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1231 = floor(_1229);
    bool _1233 = _1225 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1235 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1237 = _1225 + _1235;
    float _1239 = 0.0;
    float _1241 = _1045;
    float _1243 = _1049;
    float _1245 = _1223;
    float _1247 = _1237;
    float _1249 = _1219;
    float _1251 = _1221;
    if (_1233)
    {
        float _1253 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1239 = _1253;
    }
    float _1255 = _1239;
    if (!_1233)
    {
        _1241 = _1205;
    }
    float _1257 = _1241;
    float _1259 = -_1231;
    float _1261 = _1229 + _1259;
    float _1263 = _1257;
    if (!_1233)
    {
        _1243 = _1207;
    }
    float _1265 = _1243;
    float _1267 = _1265;
    if (_1233)
    {
        float _1269 = rsqrt(_1223);
        _1245 = _1269;
    }
    float _1271 = _1245;
    float _1273 = _1255;
    if (_1233)
    {
        float _1275 = _1237 * _1255;
        _1247 = _1275;
    }
    float _1277 = _1247;
    if (_1233)
    {
        float _1279 = _1277 * 0.15915493667125701904296875;
        _1273 = _1279;
    }
    float _1281 = _1273;
    float _1283 = _1185 * _317;
    float _1285 = _171;
    if (_1233)
    {
        float _1287 = _1281 * 6.283185482025146484375;
        float _1289 = sin(_1287);
        _1285 = _1289;
    }
    float _1291 = _1285;
    float _1293 = fma(_1187, _295, _1283);
    float _1295 = fma(_1189, _329, _1293);
    float _1297 = _1227 + _1295;
    float _1299 = fma(_1161, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1301 = _1297;
    float _1303 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    if (_1233)
    {
        float _1305 = _1297 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1301 = _1305;
    }
    float _1307 = _1301;
    if (_1233)
    {
        float _1309 = fma(_1291, _1307, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1303 = _1309;
    }
    float _1311 = _1303;
    float _1313 = floor(_1299);
    float _1315 = _1311;
    if (_1233)
    {
        float _1317 = _1271 * _1311;
        _1315 = _1317;
    }
    float _1319 = _1315;
    if (_1233)
    {
        float _1321 = fma(_1213, _1319, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1263 = _1321;
    }
    float _1323 = _1263;
    if (_1233)
    {
        float _1325 = fma(_1217, _1319, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1267 = _1325;
    }
    float _1327 = _1267;
    float _1329 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1331 = _1323 + _1329;
    float _1333 = fma(_1323, 6.2500002968590706586837768554688e-05, 0.5);
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1337 = _1327 + _1335;
    float _1339 = fma(_1327, 6.2500002968590706586837768554688e-05, 0.5);
    float _1341 = fma(_1331, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1343 = fma(_1337, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4359 = float2(_1333, _1339);
    float _1345 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_4359, float2(0.0), isnan(_4359)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_4359, float2(0.0), isnan(_4359)), level(0.0)).y;
    float _1347 = -_1313;
    float _1349 = _1299 + _1347;
    float2 _4374 = float2(_1341, _1343);
    float _1351 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4374, float2(0.0), isnan(_4374)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4374, float2(0.0), isnan(_4374)), level(0.0)).x;
    float2 _4382 = float2(_1261, _1349);
    float _1353 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4382, float2(0.0), isnan(_4382)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4382, float2(0.0), isnan(_4382)), level(0.0)).x;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1361 = _1359 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1363 = 1.0 / _1357;
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1367 = _1365 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1371 = _1369 != 0;
    int _1373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1375 = _1373 != 0;
    float _1377 = -_189;
    float _1379 = _1377 + 1.0;
    float _1381 = 1.0 / _1361;
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1383;
    bool _1387 = _759 > 0.5;
    bool _1389 = _1387 && _1375;
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _1395 = _755 > 0.5;
    float _1397 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1399 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1397;
    bool _1401 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1403 = isnan(_753);
    bool _1405 = _1401 || _1403;
    bool _1407 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1409 = _1405 || _1407;
    float _1411 = float(_1409);
    float _1413 = 1.0 / _1367;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1417 = _1415 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1419 = _1399 * _1363;
    if (_1371)
    {
        float _1421 = _1395 ? _1379 : _189;
        _225 = _1421;
    }
    float _1423 = _225;
    float _1425 = -_1411;
    float _1427 = _1425 + 1.0;
    bool _1429 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1431 = isnan(_753);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1437 = _1433 || _1435;
    float _1439 = float(_1437);
    float _1441 = 1.0 / _1417;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1445 = _1443 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1447 = _1439 * _1427;
    float _1449 = -_1439;
    float _1451 = _1449 + 1.0;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1457 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1459 = isnan(_753);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1465 = _1461 || _1463;
    float _1467 = float(_1465);
    float _1469 = _1385 * _1381;
    float _1471 = _1393 * _1413;
    bool _1473 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1475 = isnan(_753);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1481 = _1477 || _1479;
    float _1483 = float(_1481);
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1487 = _1485 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1491 = _753 + _1489;
    float _1493 = 1.0 / _1455;
    float _1495 = _1483 * _1451;
    float _1497 = -_1483;
    float _1499 = _1497 + 1.0;
    float _1501 = _1445 * _1441;
    bool _1503 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1505 = isnan(_753);
    bool _1507 = _1503 || _1505;
    bool _1509 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1511 = _1507 || _1509;
    float _1513 = float(_1511);
    float _1515 = fma(_1469, _1491, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1517 = 1.0 / _1487;
    bool _1519 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1521 = isnan(_753);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1527 = _1523 || _1525;
    float _1529 = float(_1527);
    float _1531 = _1513 * _1499;
    float _1533 = -_1513;
    float _1535 = _1533 + 1.0;
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1539 = _1537 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1541 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1543 = isnan(_753);
    bool _1545 = _1541 || _1543;
    bool _1547 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1549 = _1545 || _1547;
    float _1551 = float(_1549);
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1553;
    float _1557 = _1467 * _1535;
    float _1559 = -_1467;
    float _1561 = _1559 + 1.0;
    float _1563 = 1.0 / _1539;
    bool _1565 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1567 = isnan(_753);
    bool _1569 = _1565 || _1567;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1573 = _1569 || _1571;
    float _1575 = float(_1573);
    float _1577 = _1551 * _1561;
    float _1579 = -_1551;
    float _1581 = _1579 + 1.0;
    float _1583 = -_1529;
    float _1585 = _1583 + 1.0;
    float _1587 = _1555 * _1493;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1591 = _753 + _1589;
    float _1593 = _1529 * _1581;
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1597 = _1595 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1599;
    float _1603 = _1575 * _1585;
    bool _1605 = _1075 != 0.0;
    bool _1607 = isnan(_1075);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan(0.0);
    bool _1613 = _1609 || _1611;
    float _1615 = _1597 * _1517;
    float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1619 = _753 + _1617;
    float _1621 = _1515 * _1603;
    float _1623 = fma(_1471, _1591, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1625 = _1601 * _1563;
    float _1627 = -_1575;
    float _1629 = _1627 + 1.0;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1633 = _753 + _1631;
    float _1635 = fma(_1419, _1619, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1637 = _1073 == 0.0;
    bool _1639 = !_1613;
    bool _1641 = _1637 && _1639;
    float _1643 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1621);
    float _1645 = fma(_1501, _1633, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1649 = _1077 == 0.0;
    bool _1651 = _1649 && _1641;
    float _1653 = fma(_1623, _1593, _1643);
    float _1655 = _1591;
    if (!_1375)
    {
        _1655 = _187;
    }
    float _1657 = _1655;
    float _1659 = in.m_74.x;
    float _1661 = in.m_74.y;
    float _1663 = in.m_74.z;
    float _1665 = _1657;
    if (_1389)
    {
        float _1667 = -_187;
        float _1669 = _1667 + 1.0;
        _227 = _1669;
    }
    float _1671 = _227;
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1675 = _753 + _1673;
    float _1677 = fma(_1635, _1577, _1653);
    float _1679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1681 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1683 = _753 + _1681;
    float _1685 = fma(_1587, _1675, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    if (_1375)
    {
        _1665 = _1671;
    }
    float _1687 = _1665;
    float _1689 = fma(_1645, _1557, _1677);
    float _1691 = fma(_1615, _1683, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1693 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1695 = _753 + _1693;
    float _1697 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1699 = fma(_1685, _1531, _1689);
    float _1701 = fma(_1625, _1695, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1703 = fma(_1697, _1423, -0.5);
    float _1705 = fma(_1691, _1495, _1699);
    float _1707 = _1679 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1709 = -_985;
    float _1711 = fma(_981, _1703, _1709);
    float _1713 = fma(_1701, _1447, _1705);
    float _1715 = _1661;
    float _1717 = _1659;
    float _1719 = _1663;
    if (!_1651)
    {
        float _1721 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1661);
        _1715 = _1721;
    }
    float _1723 = _1715;
    if (!_1651)
    {
        float _1725 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1659);
        _1717 = _1725;
    }
    float _1727 = _1717;
    float _1729 = fma(_1707, _1687, -0.5);
    float _1731 = _1727;
    if (!_1651)
    {
        float _1733 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1663);
        _1719 = _1733;
    }
    float _1735 = _1719;
    float _1737 = _1149 * _1723;
    float _1739 = -_1723;
    float _1741 = _1137 * _1739;
    float _1743 = fma(_979, _1729, _873);
    float _1745 = _1141 * _1723;
    float _1747 = fma(_1163, _1727, _1737);
    float _1749 = fma(_1153, _1727, _1741);
    float _1751 = _1743 + 0.5;
    float _1753 = _1711 + 0.5;
    float _1755 = fma(_1171, _1735, _1747);
    float _1757 = fma(_1175, _1727, _1745);
    float _1759 = fma(_1155, _1735, _1749);
    float _1761 = _1751;
    float _1763 = _1757;
    if (_1233)
    {
        float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1767 = _1323 + _1765;
        _1731 = _1767;
    }
    float _1769 = _1731;
    float _1771 = _1755 * _309;
    float _1773 = _1755 * _317;
    float _1775 = _1755 * _321;
    float _1777 = fma(_1181, _1735, _1757);
    float _1779 = fma(_1759, _291, _1771);
    out.m_76.x = _1751;
    out.m_76.y = _1753;
    float _1781 = fma(_1759, _295, _1773);
    float _1783 = fma(_1759, _299, _1775);
    if (_1233)
    {
        float _1785 = _1769 * _1769;
        _1249 = _1785;
    }
    float _1787 = _1249;
    float _1789 = fma(_1777, _325, _1779);
    float _1791 = fma(_1777, _329, _1781);
    float _1793 = fma(_1777, _333, _1783);
    float _1795 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1713);
    if (_1233)
    {
        float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1799 = _1327 + _1797;
        _1761 = _1799;
    }
    float _1801 = _1761;
    out.m_78.x = _1795;
    if (_1233)
    {
        float _1803 = _1801 * _1801;
        _1251 = _1803;
    }
    float _1805 = _1251;
    out.m_80.x = _1789;
    out.m_80.y = _1791;
    out.m_80.z = _1793;
    float _1807 = fma(_1345, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _1809 = fma(_1351, 100.0, _1807);
    float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1813 = _1809 + _1811;
    float _1815 = fma(_1813, _1813, _1787);
    float _1817 = _1815 + _1805;
    float _1819 = sqrt(_1817);
    bool _1821 = _1819 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1823 = isnan(_1819);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1829 = _1825 || _1827;
    if (!_1829)
    {
        _1763 = 1.0;
    }
    float _1831 = _1763;
    bool _1833 = !_1829;
    float _1835 = _1831;
    if (!_1833)
    {
        bool _1837 = _1819 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1839 = isnan(_1819);
        bool _1841 = _1837 || _1839;
        bool _1843 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1845 = _1841 || _1843;
        if (!_1845)
        {
            float _1847 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1849 = _1819 + _1847;
            float _1851 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1853 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1851;
            float _1855 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1857 = _1855 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1859 = 1.0 / _1853;
            float _1861 = _1849 * _1859;
            float _1863 = fma(_1861, _1857, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1835 = _1863;
            _1865 = true;
        }
        else
        {
            bool _1867 = _1819 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1869 = isnan(_1819);
            bool _1871 = _1867 || _1869;
            bool _1873 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1875 = _1871 || _1873;
            if (!_1875)
            {
                float _1877 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1879 = _1819 + _1877;
                float _1881 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1883 = _1881 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1885 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1887 = _1885 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1889 = 1.0 / _1883;
                float _1891 = _1879 * _1889;
                float _1893 = fma(_1891, _1887, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1835 = _1893;
                _1865 = true;
            }
            else
            {
                _1835 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1865 = false;
    float _1895 = _1835;
    float _1897 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1899 = in.m_82.x;
    float _1901 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1897);
    float _1903 = -_1353;
    float _1905 = _1903 + 1.0;
    out.m_84.x = _1199;
    out.m_84.y = _1227;
    out.m_84.z = _1161;
    float _1907 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1901);
    float _1909 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1911 = _1907 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1913 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1909);
    float _1915 = 1.0 / _1911;
    float _1917 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1913);
    float _1919 = _1917 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1921 = _1919 + _1911;
    float _1923 = _1921 * _1915;
    float _1925 = _1923 * 0.5;
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1929 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1927);
    float _1931 = 1.0 / _1929;
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1935 = _1931 * _1933;
    float _1937 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1939 = _1323 + _1937;
    float _1941 = abs(_1935);
    float _1943 = log2(_1941);
    bool _1945 = _1935 <= 8000.0;
    bool _1947 = isnan(_1935);
    bool _1949 = _1945 || _1947;
    bool _1951 = isnan(8000.0);
    bool _1953 = _1949 || _1951;
    float _1955 = float(_1953);
    float _1957 = _1943 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1959 = exp2(_1957);
    float _1961 = fma(_1959, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1963 = precise::clamp(_1961, 0.0, 1.0);
    float _1965 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1967 = _1327 + _1965;
    float _1969 = fma(_1963, -2.0, 3.0);
    float _1971 = _1963 * _1963;
    float _1973 = _1971 * _1969;
    float _1975 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1977 = _1809 + _1975;
    float _1979 = -_1973;
    float _1981 = _1979 + 1.0;
    float _1983 = fma(_1977, _1895, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1985 = fma(_1981, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1973);
    float _1987 = fma(_1939, _1895, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1991 = _1983 + _1989;
    float _1993 = fma(_1967, _1895, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1995 = _1955 * _1985;
    float _1997 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1999 = _1987 + _1997;
    float _2001 = _1991 * _1991;
    float _2003 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2005 = _1993 + _2003;
    float _2007 = _1995 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2009 = _1983 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2011 = fma(_1999, _1999, _2001);
    float _2013 = _1983 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2015 = _1983 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2017 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2009);
    float _2019 = fma(_2005, _2005, _2011);
    float _2021 = _1983 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2023 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2013);
    float _2025 = _1905 * _2007;
    float _2027 = precise::clamp(_2025, 0.0, 1.0);
    float _2029 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2015);
    float _2031 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2021);
    float _2033 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2023);
    float _2035 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2017);
    float _2037 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2029);
    float _2039 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2031);
    float _2041 = _2033 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2043 = _2035 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2045 = -_2027;
    float _2047 = fma(_2045, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2049 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2051 = sqrt(_2019);
    float _2053 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2055 = _2047 * _1899;
    float _2057 = _2049 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2059 = _2049 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2061 = _2049 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2063 = _2049 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2065 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2057);
    float _2067 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2059);
    float _2069 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2061);
    float _2071 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2063);
    float _2073 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2065);
    float _2075 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2067);
    float _2077 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2069);
    float _2079 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2071);
    float _2081 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2073);
    float _2083 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2075);
    float _2085 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2077);
    float _2087 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2079);
    float _2089 = _2055 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_86.x = _1987;
    out.m_86.y = _1983;
    out.m_86.z = _1993;
    bool _2091 = _2051 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2093 = isnan(_2051);
    bool _2095 = _2091 || _2093;
    bool _2097 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2099 = _2095 || _2097;
    out.gl_Position.x = _2081;
    out.gl_Position.y = _2083;
    out.gl_Position.z = _2085;
    out.gl_Position.w = _2087;
    out.m_88.x = _2089;
    float _2101 = _2077;
    float _2103 = _2075;
    float _2105 = _2073;
    float _2107 = _2043;
    float _2109 = _2049;
    float _2111 = _2041;
    if (!_2099)
    {
        _2101 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2113 = _2101;
    float _2115 = _2113;
    float _2117 = _2113;
    if (!_2099)
    {
        _2103 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2119 = _2103;
    float _2121 = _2119;
    float _2123 = _2119;
    if (!_2099)
    {
        _2105 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2125 = _2105;
    float _2127 = _2125;
    float _2129 = _2125;
    if (!_2099)
    {
        _2107 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2131 = _2107;
    float _2133 = _2131;
    float _2135 = _2131;
    if (!_2099)
    {
        _2109 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2137 = _2109;
    float _2139 = _2137;
    float _2141 = _2137;
    if (!_2099)
    {
        _2111 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2143 = _2111;
    bool _2145 = !_2099;
    float _2147 = _2143;
    float _2149 = _2143;
    if (!_2145)
    {
        bool _2151 = _2051 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2153 = isnan(_2051);
        bool _2155 = _2151 || _2153;
        bool _2157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2159 = _2155 || _2157;
        if (!_2159)
        {
            float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2163 = _2051 + _2161;
            float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2167 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2165;
            float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2177 = 1.0 / _2167;
            float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2191 = _2163 * _2177;
            float _2193 = precise::clamp(_2191, 0.0, 1.0);
            float _2195 = fma(_2193, _2171, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2197 = fma(_2193, _2175, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2203 = fma(_2193, _2181, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2205 = fma(_2193, _2185, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2207 = fma(_2193, _2201, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2209 = fma(_2193, _2189, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2141 = _2197;
            _2123 = _2205;
            _2135 = _2195;
            _2117 = _2203;
            _2149 = _2207;
            _2129 = _2209;
            _2211 = true;
        }
        else
        {
            bool _2213 = _2051 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2215 = isnan(_2051);
            bool _2217 = _2213 || _2215;
            bool _2219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2221 = _2217 || _2219;
            if (!_2221)
            {
                _2115 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2223 = _2115;
            _2117 = _2223;
            if (!_2221)
            {
                _2121 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2225 = _2121;
            _2123 = _2225;
            if (!_2221)
            {
                _2127 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2227 = _2127;
            _2129 = _2227;
            if (!_2221)
            {
                _2133 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2229 = _2133;
            _2135 = _2229;
            if (!_2221)
            {
                _2139 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2231 = _2139;
            _2141 = _2231;
            if (!_2221)
            {
                _2147 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2233 = _2147;
            bool _2235 = !_2221;
            _2149 = _2233;
            if (!_2235)
            {
                bool _2237 = _2051 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2239 = isnan(_2051);
                bool _2241 = _2237 || _2239;
                bool _2243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2245 = _2241 || _2243;
                if (!_2245)
                {
                    float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2249 = _2051 + _2247;
                    float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2253 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2251;
                    float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2263 = 1.0 / _2253;
                    float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2269 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2271 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2277 = _2249 * _2263;
                    float _2279 = precise::clamp(_2277, 0.0, 1.0);
                    float _2281 = fma(_2279, _2257, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2283 = fma(_2279, _2261, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2289 = fma(_2279, _2267, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2291 = fma(_2279, _2271, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2293 = fma(_2279, _2287, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2295 = fma(_2279, _2275, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2141 = _2283;
                    _2123 = _2291;
                    _2135 = _2281;
                    _2117 = _2289;
                    _2149 = _2293;
                    _2129 = _2295;
                    _2211 = true;
                }
                else
                {
                    _2141 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2123 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2135 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2117 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2149 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2129 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2211 = false;
    float _2297 = _2141;
    float _2299 = _2123;
    float _2301 = _2135;
    float _2303 = _2117;
    float _2305 = _2149;
    float _2307 = _2129;
    float _2309 = fma(_1791, -0.5, 0.5);
    float _2311 = precise::clamp(_2309, 0.0, 1.0);
    float _2313 = -_2297;
    float _2315 = _2299 + _2313;
    float _2317 = -_2301;
    float _2319 = _2303 + _2317;
    float _2321 = -_2305;
    float _2323 = _2307 + _2321;
    bool _2325 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2327 = fma(_2311, _2315, _2297);
    float _2329 = fma(_2311, _2319, _2301);
    float _2331 = fma(_2311, _2323, _2305);
    float _2333 = _2327 * 0.586610972881317138671875;
    out.m_46.x = 1.0;
    float _2335 = fma(_2329, 0.298911988735198974609375, _2333);
    float _2337 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2339 = fma(_2331, 0.114477999508380889892578125, _2335);
    out.m_88.w = _2337;
    float _2341 = -_2339;
    float _2343 = _2329 + _2341;
    float _2345 = -_2339;
    float _2347 = _2327 + _2345;
    float _2349 = -_2339;
    float _2351 = _2331 + _2349;
    out.m_90.x = 0.0;
    float _2353 = fma(_2343, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2339);
    float _2355 = fma(_2347, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2339);
    float _2357 = fma(_2351, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2339);
    out.m_92.x = _2353;
    out.m_92.y = _2355;
    out.m_92.z = _2357;
    if (!_2325)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2359 = -_1983;
    float _2361 = _2359 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2363 = -_1987;
    float _2365 = _2363 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2367 = -_1993;
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
    float _2401 = _1791 * _2391;
    float _2403 = -_2391;
    float _2405 = -_2399;
    float _2407 = fma(_2403, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2405);
    float _2409 = fma(_1789, _2389, _2401);
    float _2411 = -_2397;
    float _2413 = fma(_2411, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2407);
    float _2415 = fma(_1793, _2397, _2409);
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
    out.m_90.x = _2435;
    out.m_90.y = _2437;
    out.m_90.z = _2439;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2211 = false;
    bool _1865 = false;
    bool _745 = false;
    bool _617 = false;
    bool _465 = false;
    bool _353 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_43.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_46.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2496 = as_type<float>(_127);
        out.gl_Position.z = _2496;
    }
    if (!_115)
    {
        return out;
    }
    float _131 = in.m_48.w;
    float _133 = in.m_50.x;
    bool _135 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_131);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_131;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_52.x = _133;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_111);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _121;
    if (_161)
    {
        out.m_46.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _129 = as_type<int>(_165);
    }
    int _167 = _129;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2569 = as_type<float>(_167);
        out.gl_Position.z = _2569;
    }
    if (_161)
    {
        return out;
    }
    float _169 = in.m_54.x;
    float _171 = in.m_54.y;
    float _173 = in.m_54.z;
    float _175 = in.m_56.x;
    float _177 = in.m_56.y;
    float _179 = in.m_56.z;
    float _181 = in.m_58.x;
    float _183 = in.m_58.y;
    float _185 = in.m_58.z;
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = _169 * _169;
    float _193 = _171 * _171;
    float _195 = _173 * _173;
    float _197 = fma(_175, _175, _191);
    float _199 = fma(_177, _177, _193);
    float _201 = fma(_179, _179, _195);
    float _203 = fma(_181, _181, _197);
    float _205 = fma(_183, _183, _199);
    float _207 = fma(_185, _185, _201);
    float _209 = sqrt(_203);
    out.m_62.x = _187;
    out.m_62.y = _189;
    float _211 = sqrt(_205);
    float _213 = sqrt(_207);
    bool _215 = _209 > 0.0;
    bool _217 = _211 > 0.0;
    float _219 = _203;
    float _221 = _211;
    float _223 = _207;
    float _225 = _189;
    float _227 = _187;
    if (_215)
    {
        float _229 = rsqrt(_203);
        _219 = _229;
    }
    float _231 = _219;
    float _233 = 0.0;
    float _235 = 0.0;
    if (!_215)
    {
        _233 = 0.0;
        _235 = 0.0;
    }
    float _237 = _233;
    float _239 = _235;
    bool _241 = _213 > 0.0;
    float _243 = 0.0;
    float _245 = _237;
    float _247 = _239;
    if (!_215)
    {
        _243 = 0.0;
    }
    float _249 = _243;
    float _251 = 0.0;
    float _253 = _249;
    if (!_217)
    {
        _251 = 0.0;
    }
    float _255 = _251;
    float _257 = _209;
    float _259 = _255;
    if (_217)
    {
        float _261 = rsqrt(_205);
        _257 = _261;
    }
    float _263 = _257;
    float _265 = 0.0;
    if (!_217)
    {
        _265 = 0.0;
    }
    float _267 = _265;
    float _269 = 0.0;
    float _271 = _267;
    if (!_217)
    {
        _269 = 0.0;
    }
    float _273 = _269;
    float _275 = _273;
    if (!_241)
    {
        _221 = 0.0;
    }
    float _277 = _221;
    float _279 = _213;
    float _281 = _277;
    if (_241)
    {
        float _283 = rsqrt(_207);
        _279 = _283;
    }
    float _285 = _279;
    float _287 = _231;
    if (_215)
    {
        float _289 = _231 * _175;
        _245 = _289;
    }
    float _291 = _245;
    if (_215)
    {
        float _293 = _231 * _169;
        _247 = _293;
    }
    float _295 = _247;
    if (_215)
    {
        float _297 = _231 * _181;
        _253 = _297;
    }
    float _299 = _253;
    bool _301 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_241)
    {
        _287 = 0.0;
    }
    float _303 = _287;
    float _305 = _303;
    if (_217)
    {
        float _307 = _263 * _177;
        _259 = _307;
    }
    float _309 = _259;
    if (!_241)
    {
        _223 = 0.0;
    }
    float _311 = _223;
    float _313 = _311;
    if (_217)
    {
        float _315 = _263 * _171;
        _271 = _315;
    }
    float _317 = _271;
    if (_217)
    {
        float _319 = _263 * _183;
        _275 = _319;
    }
    float _321 = _275;
    if (_241)
    {
        float _323 = _285 * _179;
        _313 = _323;
    }
    float _325 = _313;
    if (_241)
    {
        float _327 = _285 * _173;
        _281 = _327;
    }
    float _329 = _281;
    if (_241)
    {
        float _331 = _285 * _185;
        _305 = _331;
    }
    float _333 = _305;
    bool _335 = !_301;
    float _351;
    if (!_335)
    {
        float _337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _339 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _341 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _343 = _341 * _337;
        float _345 = floor(_343);
        float _347 = -_345;
        float _349 = _343 + _347;
        _351 = _349;
        _353 = true;
    }
    else
    {
        float _355 = float(_111);
        float _357 = 1.0 / _355;
        float _359 = _147 * _357;
        _351 = _359;
    }
    _353 = false;
    float _361 = _351;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _365 = _361 + _363;
    bool _367 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _369 = isnan(_361);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _379;
    bool _383 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _385 = isnan(_361);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -_377;
    float _397 = _395 + 1.0;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _399;
    float _403 = 1.0 / _381;
    bool _405 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _407 = _393 * _397;
    float _409 = -_393;
    float _411 = _409 + 1.0;
    float _413 = _365 * _403;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _415;
    float _419 = fma(_401, _413, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _421;
    float _425 = fma(_417, _413, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _427 = _419 * _407;
    float _429 = fma(_423, _413, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _431 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[143].x, _427);
    float _433 = _429 * _407;
    float _435 = _425 * _407;
    float _437 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[144].x, _431);
    float _439 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[143].y, _433);
    float _441 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[143].z, _435);
    float _443 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[144].y, _439);
    float _445 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[144].z, _441);
    bool _447 = !_405;
    float _463;
    if (!_447)
    {
        float _449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _451 = _133 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _455 = _453 * _449;
        float _457 = floor(_455);
        float _459 = -_457;
        float _461 = _455 + _459;
        _463 = _461;
        _465 = true;
    }
    else
    {
        float _467 = float(_111);
        float _469 = 1.0 / _467;
        float _471 = _147 * _469;
        _463 = _471;
    }
    _465 = false;
    float _473 = _463;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _477 = _473 + _475;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _483 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _485 = isnan(_473);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _499 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _501 = isnan(_473);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _511;
    bool _515 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _517 = isnan(_473);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = 1.0 / _481;
    float _529 = -_493;
    float _531 = _529 + 1.0;
    bool _533 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _535 = 1.0 / _497;
    float _537 = _513 * _527;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _543 = -_525;
    float _545 = _543 + 1.0;
    float _547 = fma(_537, _477, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _549 = _509 * _531;
    float _551 = -_509;
    float _553 = _551 + 1.0;
    float _555 = _493 * _545;
    float _557 = _541 * _535;
    float _559 = _547 * _549;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = _473 + _561;
    float _565 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[115].x, _559);
    float _567 = fma(_557, _563, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _571 = fma(_567, _555, _565);
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _575 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _577 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[117].x, _571);
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _581 = _573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _583 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _585 = in.m_64.x;
    float _587 = in.m_64.y;
    float _589 = in.m_64.z;
    float _591 = _579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _575;
    out.m_66.y = _581;
    out.m_66.z = _591;
    out.m_66.w = _583;
    float _593 = _445 * _589;
    float _595 = _443 * _587;
    float _597 = _437 * _585;
    bool _599 = !_533;
    float _615;
    if (!_599)
    {
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _603 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_111);
        float _621 = 1.0 / _619;
        float _623 = _147 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _629 = _625 + _627;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _635 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _637 = isnan(_625);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _651 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _653 = isnan(_625);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _663;
    bool _667 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _669 = isnan(_625);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = 1.0 / _633;
    float _681 = -_645;
    float _683 = _681 + 1.0;
    bool _685 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _687 = 1.0 / _649;
    float _689 = _665 * _679;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _695 = -_677;
    float _697 = _695 + 1.0;
    float _699 = fma(_689, _629, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _701 = _661 * _683;
    float _703 = -_661;
    float _705 = _703 + 1.0;
    float _707 = _645 * _697;
    float _709 = _693 * _687;
    float _711 = _699 * _701;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _715 = _625 + _713;
    float _717 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[131].x, _711);
    float _719 = fma(_709, _715, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _721 = fma(_719, _707, _717);
    float _723 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[133].x, _721);
    float _725 = _723 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.w = _725;
    bool _727 = !_685;
    float _743;
    if (!_727)
    {
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _731 = _133 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[14].x, _147);
        float _735 = _733 * _729;
        float _737 = floor(_735);
        float _739 = -_737;
        float _741 = _735 + _739;
        _743 = _741;
        _745 = true;
    }
    else
    {
        float _747 = float(_111);
        float _749 = 1.0 / _747;
        float _751 = _147 * _749;
        _743 = _751;
    }
    _745 = false;
    float _753 = _743;
    float _755 = in.m_50.z;
    float _757 = _133 * 2.0;
    float _759 = in.m_50.y;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _763 = _761 != 0;
    float _765 = _597 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _767 = floor(_757);
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _775 = _773 != 0;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _779 = _777 != 0;
    float _781 = _595 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _783 = _593 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (_763)
    {
        _785 = _133;
    }
    float _787 = _785;
    float _789 = _755 * 2.0;
    float _791 = _787;
    float _793 = _789;
    if (!_763)
    {
        _791 = _755;
    }
    float _795 = _791;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _799 = _767 > 0.0;
    float _801 = floor(_789);
    float _803 = _759 + _755;
    float _805 = _759 * 2.0;
    bool _807 = _767 >= 0.0;
    bool _809 = isnan(_767);
    bool _811 = _807 || _809;
    bool _813 = isnan(0.0);
    bool _815 = _811 || _813;
    float _817 = _133 + _759;
    float _819 = _803 + (-1.0);
    float _821 = _795 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _823 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[88].w, _797);
    float _825 = floor(_805);
    if (_763)
    {
        _793 = _759;
    }
    float _827 = _793;
    float _829 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _831 = _827;
    if (!_763)
    {
        _831 = _133;
    }
    float _833 = _831;
    float _835 = _817 + (-1.0);
    bool _837 = _801 > 0.0;
    float _839 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _841 = _801 >= 0.0;
    bool _843 = isnan(_801);
    bool _845 = _841 || _843;
    bool _847 = isnan(0.0);
    bool _849 = _845 || _847;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _853 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _855 = log2(_853);
    bool _857 = !_775;
    int _859 = _857 ? 0 : 1;
    float _861 = -_851;
    float _863 = fma(_821, 2.0, _861);
    int _865 = _815 ? 0 : 1;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _869 = abs(_859);
    float _871 = -_147;
    float _873 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[86].x, _863);
    bool _875 = _825 > 0.0;
    bool _877 = _825 >= 0.0;
    bool _879 = isnan(_825);
    bool _881 = _877 || _879;
    bool _883 = isnan(0.0);
    bool _885 = _881 || _883;
    int _887 = ~_865;
    int _889 = _887 + 1;
    int _891 = _889 + 1;
    float _893 = _855 * _147;
    int _895 = _891;
    if (!_799)
    {
        int _897 = ~_865;
        int _899 = _897 + 1;
        _895 = _899;
    }
    int _901 = _895;
    float _903 = _833 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _905 = float(_869);
    int _907 = _849 ? 0 : 1;
    float _909 = exp2(_893);
    float _911 = float(_901);
    float _913 = fma(_903, -2.0, _867);
    int _915 = ~_907;
    int _917 = _915 + 1;
    int _919 = _917 + 1;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _923 = 1.0 + _921;
    int _925 = _919;
    if (!_837)
    {
        int _927 = ~_907;
        int _929 = _927 + 1;
        _925 = _929;
    }
    int _931 = _925;
    float _933 = _905 * _911;
    bool _935 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _937 = isnan(1.0);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _943 = _939 || _941;
    float _945 = in.m_70.x;
    float _947 = in.m_70.y;
    float _949 = in.m_70.z;
    float _951 = 1.0 / _923;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _955 = !_771;
    int _957 = _955 ? 0 : 1;
    bool _959 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _961 = isnan(0.0);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _967 = _963 || _965;
    float _969 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[88].z, _953);
    int _971 = abs(_957);
    float _973 = -_909;
    float _975 = _973 + 1.0;
    float _977 = float(_931);
    float _979 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[87].z, _969);
    float _981 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[87].w, _823);
    float _983 = float(_971);
    float _985 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[86].y, _913);
    float _987 = _967 ? _975 : 0.0;
    bool _989 = !_779;
    int _991 = _989 ? 0 : 1;
    float _993 = _983 * _977;
    float _995 = _759 + (-0.5);
    if (_943)
    {
        float _997 = _987 * _951;
        _151 = _997;
    }
    float _999 = _151;
    float _1001 = _933 * (-2.0);
    int _1003 = _885 ? 0 : 1;
    float _1005 = _993 * (-2.0);
    int _1007 = abs(_991);
    float _1009 = fma(_1001, _947, _947);
    float _1011 = fma(_829, _1001, _829);
    int _1013 = ~_1003;
    int _1015 = _1013 + 1;
    int _1017 = _1015 + 1;
    float _1019 = _133 + (-0.5);
    float _1021 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1009);
    int _1023 = _1017;
    if (!_875)
    {
        int _1025 = ~_1003;
        int _1027 = _1025 + 1;
        _1023 = _1027;
    }
    int _1029 = _1023;
    float _1031 = _133 + _755;
    float _1033 = fma(_1011, _999, _1021);
    float _1035 = fma(_839, _1005, _839);
    float _1037 = float(_1007);
    float _1039 = fma(_1005, _945, _945);
    float _1041 = _1033 * 0.15915493667125701904296875;
    float _1043 = float(_1029);
    float _1045 = in.m_43.x;
    float _1047 = in.m_43.y;
    float _1049 = in.m_43.z;
    float _1051 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1039);
    float _1053 = _1031 + (-1.0);
    float _1055 = _1037 * _1043;
    float _1057 = _1041 * 6.283185482025146484375;
    float _1059 = sin(_1057);
    float _1061 = fma(_1035, _999, _1051);
    float _1063 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1065 = _1055 * (-2.0);
    float _1067 = _1061 * 0.15915493667125701904296875;
    float _1069 = _755 + (-0.5);
    float _1071 = fma(_1065, _949, _949);
    float _1073 = in.m_72.x;
    float _1075 = in.m_72.y;
    float _1077 = in.m_72.z;
    float _1079 = fma(_1063, _1065, _1063);
    float _1081 = _1041 * 6.283185482025146484375;
    float _1083 = cos(_1081);
    float _1085 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1071);
    float _1087 = fma(_1079, _999, _1085);
    float _1089 = _1067 * 6.283185482025146484375;
    float _1091 = sin(_1089);
    float _1093 = _1087 * 0.15915493667125701904296875;
    float _1095 = _177 * _1047;
    float _1097 = _183 * _1047;
    float _1099 = _171 * _1047;
    float _1101 = fma(_175, _1045, _1095);
    float _1103 = fma(_181, _1045, _1097);
    float _1105 = _1093 * 6.283185482025146484375;
    float _1107 = cos(_1105);
    float _1109 = fma(_169, _1045, _1099);
    float _1111 = fma(_179, _1049, _1101);
    float _1113 = fma(_185, _1049, _1103);
    float _1115 = in.m_58.w;
    float _1117 = fma(_173, _1049, _1109);
    float _1119 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1073);
    float _1121 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1077);
    float _1123 = _1067 * 6.283185482025146484375;
    float _1125 = cos(_1123);
    float _1127 = _1091 * _1059;
    float _1129 = _765 * _1119;
    float _1131 = _783 * _1121;
    float _1133 = in.m_56.w;
    float _1135 = _1093 * 6.283185482025146484375;
    float _1137 = sin(_1135);
    float _1139 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1075);
    float _1141 = _1091 * _1107;
    float _1143 = _781 * _1139;
    float _1145 = _1091 * _1083;
    float _1147 = _1125 * _1083;
    float _1149 = _1125 * _1107;
    float _1151 = _1125 * _1059;
    float _1153 = _1083 * _1107;
    float _1155 = _1059 * _1107;
    float _1157 = _1149 * _1143;
    float _1159 = _1141 * _1143;
    float _1161 = _1113 + _1115;
    float _1163 = fma(_1137, _1147, _1127);
    float _1165 = -_1143;
    float _1167 = _1137 * _1165;
    float _1169 = -_1145;
    float _1171 = fma(_1137, _1151, _1169);
    float _1173 = -_1151;
    float _1175 = fma(_1137, _1145, _1173);
    float _1177 = fma(_1163, _1129, _1157);
    float _1179 = fma(_1153, _1129, _1167);
    float _1181 = fma(_1137, _1127, _1147);
    float _1183 = fma(_1175, _1129, _1159);
    float _1185 = fma(_1171, _1131, _1177);
    float _1187 = fma(_1155, _1131, _1179);
    float _1189 = fma(_1181, _1131, _1183);
    float _1191 = _1185 * _309;
    float _1193 = _1185 * _321;
    float _1195 = fma(_1187, _291, _1191);
    float _1197 = fma(_1187, _299, _1193);
    float _1199 = _1111 + _1133;
    float _1201 = fma(_1189, _325, _1195);
    float _1203 = fma(_1189, _333, _1197);
    float _1205 = _1199 + _1201;
    float _1207 = _1161 + _1203;
    float _1209 = in.m_54.w;
    float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1213 = _1205 + _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1217 = _1207 + _1215;
    float _1219 = _1213 * _1213;
    float _1221 = _1217 * _1217;
    float _1223 = _1219 + _1221;
    float _1225 = sqrt(_1223);
    float _1227 = _1117 + _1209;
    float _1229 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1231 = floor(_1229);
    bool _1233 = _1225 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1235 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1237 = _1225 + _1235;
    float _1239 = 0.0;
    float _1241 = _1045;
    float _1243 = _1049;
    float _1245 = _1223;
    float _1247 = _1237;
    float _1249 = _1219;
    float _1251 = _1221;
    if (_1233)
    {
        float _1253 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1239 = _1253;
    }
    float _1255 = _1239;
    if (!_1233)
    {
        _1241 = _1205;
    }
    float _1257 = _1241;
    float _1259 = -_1231;
    float _1261 = _1229 + _1259;
    float _1263 = _1257;
    if (!_1233)
    {
        _1243 = _1207;
    }
    float _1265 = _1243;
    float _1267 = _1265;
    if (_1233)
    {
        float _1269 = rsqrt(_1223);
        _1245 = _1269;
    }
    float _1271 = _1245;
    float _1273 = _1255;
    if (_1233)
    {
        float _1275 = _1237 * _1255;
        _1247 = _1275;
    }
    float _1277 = _1247;
    if (_1233)
    {
        float _1279 = _1277 * 0.15915493667125701904296875;
        _1273 = _1279;
    }
    float _1281 = _1273;
    float _1283 = _1185 * _317;
    float _1285 = _171;
    if (_1233)
    {
        float _1287 = _1281 * 6.283185482025146484375;
        float _1289 = sin(_1287);
        _1285 = _1289;
    }
    float _1291 = _1285;
    float _1293 = fma(_1187, _295, _1283);
    float _1295 = fma(_1189, _329, _1293);
    float _1297 = _1227 + _1295;
    float _1299 = fma(_1161, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1301 = _1297;
    float _1303 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    if (_1233)
    {
        float _1305 = _1297 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1301 = _1305;
    }
    float _1307 = _1301;
    if (_1233)
    {
        float _1309 = fma(_1291, _1307, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1303 = _1309;
    }
    float _1311 = _1303;
    float _1313 = floor(_1299);
    float _1315 = _1311;
    if (_1233)
    {
        float _1317 = _1271 * _1311;
        _1315 = _1317;
    }
    float _1319 = _1315;
    if (_1233)
    {
        float _1321 = fma(_1213, _1319, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1263 = _1321;
    }
    float _1323 = _1263;
    if (_1233)
    {
        float _1325 = fma(_1217, _1319, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1267 = _1325;
    }
    float _1327 = _1267;
    float _1329 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1331 = _1323 + _1329;
    float _1333 = fma(_1323, 6.2500002968590706586837768554688e-05, 0.5);
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1337 = _1327 + _1335;
    float _1339 = fma(_1327, 6.2500002968590706586837768554688e-05, 0.5);
    float _1341 = fma(_1331, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1343 = fma(_1337, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4359 = float2(_1333, _1339);
    float _1345 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_4359, float2(0.0), isnan(_4359)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_4359, float2(0.0), isnan(_4359)), level(0.0)).y;
    float _1347 = -_1313;
    float _1349 = _1299 + _1347;
    float2 _4374 = float2(_1341, _1343);
    float _1351 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4374, float2(0.0), isnan(_4374)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4374, float2(0.0), isnan(_4374)), level(0.0)).x;
    float2 _4382 = float2(_1261, _1349);
    float _1353 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4382, float2(0.0), isnan(_4382)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4382, float2(0.0), isnan(_4382)), level(0.0)).x;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1361 = _1359 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1363 = 1.0 / _1357;
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1367 = _1365 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1371 = _1369 != 0;
    int _1373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1375 = _1373 != 0;
    float _1377 = -_189;
    float _1379 = _1377 + 1.0;
    float _1381 = 1.0 / _1361;
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1383;
    bool _1387 = _759 > 0.5;
    bool _1389 = _1387 && _1375;
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _1395 = _755 > 0.5;
    float _1397 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1399 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1397;
    bool _1401 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1403 = isnan(_753);
    bool _1405 = _1401 || _1403;
    bool _1407 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1409 = _1405 || _1407;
    float _1411 = float(_1409);
    float _1413 = 1.0 / _1367;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1417 = _1415 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1419 = _1399 * _1363;
    if (_1371)
    {
        float _1421 = _1395 ? _1379 : _189;
        _225 = _1421;
    }
    float _1423 = _225;
    float _1425 = -_1411;
    float _1427 = _1425 + 1.0;
    bool _1429 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1431 = isnan(_753);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1437 = _1433 || _1435;
    float _1439 = float(_1437);
    float _1441 = 1.0 / _1417;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1445 = _1443 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1447 = _1439 * _1427;
    float _1449 = -_1439;
    float _1451 = _1449 + 1.0;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1457 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1459 = isnan(_753);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1465 = _1461 || _1463;
    float _1467 = float(_1465);
    float _1469 = _1385 * _1381;
    float _1471 = _1393 * _1413;
    bool _1473 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1475 = isnan(_753);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1481 = _1477 || _1479;
    float _1483 = float(_1481);
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1487 = _1485 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1491 = _753 + _1489;
    float _1493 = 1.0 / _1455;
    float _1495 = _1483 * _1451;
    float _1497 = -_1483;
    float _1499 = _1497 + 1.0;
    float _1501 = _1445 * _1441;
    bool _1503 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1505 = isnan(_753);
    bool _1507 = _1503 || _1505;
    bool _1509 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1511 = _1507 || _1509;
    float _1513 = float(_1511);
    float _1515 = fma(_1469, _1491, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1517 = 1.0 / _1487;
    bool _1519 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1521 = isnan(_753);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1527 = _1523 || _1525;
    float _1529 = float(_1527);
    float _1531 = _1513 * _1499;
    float _1533 = -_1513;
    float _1535 = _1533 + 1.0;
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1539 = _1537 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1541 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1543 = isnan(_753);
    bool _1545 = _1541 || _1543;
    bool _1547 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1549 = _1545 || _1547;
    float _1551 = float(_1549);
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1553;
    float _1557 = _1467 * _1535;
    float _1559 = -_1467;
    float _1561 = _1559 + 1.0;
    float _1563 = 1.0 / _1539;
    bool _1565 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1567 = isnan(_753);
    bool _1569 = _1565 || _1567;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1573 = _1569 || _1571;
    float _1575 = float(_1573);
    float _1577 = _1551 * _1561;
    float _1579 = -_1551;
    float _1581 = _1579 + 1.0;
    float _1583 = -_1529;
    float _1585 = _1583 + 1.0;
    float _1587 = _1555 * _1493;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1591 = _753 + _1589;
    float _1593 = _1529 * _1581;
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1597 = _1595 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1599;
    float _1603 = _1575 * _1585;
    bool _1605 = _1075 != 0.0;
    bool _1607 = isnan(_1075);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan(0.0);
    bool _1613 = _1609 || _1611;
    float _1615 = _1597 * _1517;
    float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1619 = _753 + _1617;
    float _1621 = _1515 * _1603;
    float _1623 = fma(_1471, _1591, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1625 = _1601 * _1563;
    float _1627 = -_1575;
    float _1629 = _1627 + 1.0;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1633 = _753 + _1631;
    float _1635 = fma(_1419, _1619, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1637 = _1073 == 0.0;
    bool _1639 = !_1613;
    bool _1641 = _1637 && _1639;
    float _1643 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1621);
    float _1645 = fma(_1501, _1633, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1649 = _1077 == 0.0;
    bool _1651 = _1649 && _1641;
    float _1653 = fma(_1623, _1593, _1643);
    float _1655 = _1591;
    if (!_1375)
    {
        _1655 = _187;
    }
    float _1657 = _1655;
    float _1659 = in.m_74.x;
    float _1661 = in.m_74.y;
    float _1663 = in.m_74.z;
    float _1665 = _1657;
    if (_1389)
    {
        float _1667 = -_187;
        float _1669 = _1667 + 1.0;
        _227 = _1669;
    }
    float _1671 = _227;
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1675 = _753 + _1673;
    float _1677 = fma(_1635, _1577, _1653);
    float _1679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1681 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1683 = _753 + _1681;
    float _1685 = fma(_1587, _1675, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    if (_1375)
    {
        _1665 = _1671;
    }
    float _1687 = _1665;
    float _1689 = fma(_1645, _1557, _1677);
    float _1691 = fma(_1615, _1683, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1693 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1695 = _753 + _1693;
    float _1697 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1699 = fma(_1685, _1531, _1689);
    float _1701 = fma(_1625, _1695, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1703 = fma(_1697, _1423, -0.5);
    float _1705 = fma(_1691, _1495, _1699);
    float _1707 = _1679 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1709 = -_985;
    float _1711 = fma(_981, _1703, _1709);
    float _1713 = fma(_1701, _1447, _1705);
    float _1715 = _1661;
    float _1717 = _1659;
    float _1719 = _1663;
    if (!_1651)
    {
        float _1721 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1661);
        _1715 = _1721;
    }
    float _1723 = _1715;
    if (!_1651)
    {
        float _1725 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1659);
        _1717 = _1725;
    }
    float _1727 = _1717;
    float _1729 = fma(_1707, _1687, -0.5);
    float _1731 = _1727;
    if (!_1651)
    {
        float _1733 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1663);
        _1719 = _1733;
    }
    float _1735 = _1719;
    float _1737 = _1149 * _1723;
    float _1739 = -_1723;
    float _1741 = _1137 * _1739;
    float _1743 = fma(_979, _1729, _873);
    float _1745 = _1141 * _1723;
    float _1747 = fma(_1163, _1727, _1737);
    float _1749 = fma(_1153, _1727, _1741);
    float _1751 = _1743 + 0.5;
    float _1753 = _1711 + 0.5;
    float _1755 = fma(_1171, _1735, _1747);
    float _1757 = fma(_1175, _1727, _1745);
    float _1759 = fma(_1155, _1735, _1749);
    float _1761 = _1751;
    float _1763 = _1757;
    if (_1233)
    {
        float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1767 = _1323 + _1765;
        _1731 = _1767;
    }
    float _1769 = _1731;
    float _1771 = _1755 * _309;
    float _1773 = _1755 * _317;
    float _1775 = _1755 * _321;
    float _1777 = fma(_1181, _1735, _1757);
    float _1779 = fma(_1759, _291, _1771);
    out.m_76.x = _1751;
    out.m_76.y = _1753;
    float _1781 = fma(_1759, _295, _1773);
    float _1783 = fma(_1759, _299, _1775);
    if (_1233)
    {
        float _1785 = _1769 * _1769;
        _1249 = _1785;
    }
    float _1787 = _1249;
    float _1789 = fma(_1777, _325, _1779);
    float _1791 = fma(_1777, _329, _1781);
    float _1793 = fma(_1777, _333, _1783);
    float _1795 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1713);
    if (_1233)
    {
        float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1799 = _1327 + _1797;
        _1761 = _1799;
    }
    float _1801 = _1761;
    out.m_78.x = _1795;
    if (_1233)
    {
        float _1803 = _1801 * _1801;
        _1251 = _1803;
    }
    float _1805 = _1251;
    out.m_80.x = _1789;
    out.m_80.y = _1791;
    out.m_80.z = _1793;
    float _1807 = fma(_1345, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _1809 = fma(_1351, 100.0, _1807);
    float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1813 = _1809 + _1811;
    float _1815 = fma(_1813, _1813, _1787);
    float _1817 = _1815 + _1805;
    float _1819 = sqrt(_1817);
    bool _1821 = _1819 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1823 = isnan(_1819);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1829 = _1825 || _1827;
    if (!_1829)
    {
        _1763 = 1.0;
    }
    float _1831 = _1763;
    bool _1833 = !_1829;
    float _1835 = _1831;
    if (!_1833)
    {
        bool _1837 = _1819 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1839 = isnan(_1819);
        bool _1841 = _1837 || _1839;
        bool _1843 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1845 = _1841 || _1843;
        if (!_1845)
        {
            float _1847 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1849 = _1819 + _1847;
            float _1851 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1853 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1851;
            float _1855 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1857 = _1855 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1859 = 1.0 / _1853;
            float _1861 = _1849 * _1859;
            float _1863 = fma(_1861, _1857, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1835 = _1863;
            _1865 = true;
        }
        else
        {
            bool _1867 = _1819 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1869 = isnan(_1819);
            bool _1871 = _1867 || _1869;
            bool _1873 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1875 = _1871 || _1873;
            if (!_1875)
            {
                float _1877 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1879 = _1819 + _1877;
                float _1881 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1883 = _1881 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1885 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1887 = _1885 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1889 = 1.0 / _1883;
                float _1891 = _1879 * _1889;
                float _1893 = fma(_1891, _1887, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1835 = _1893;
                _1865 = true;
            }
            else
            {
                _1835 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1865 = false;
    float _1895 = _1835;
    float _1897 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1899 = in.m_82.x;
    float _1901 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1897);
    float _1903 = -_1353;
    float _1905 = _1903 + 1.0;
    out.m_84.x = _1199;
    out.m_84.y = _1227;
    out.m_84.z = _1161;
    float _1907 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1901);
    float _1909 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1911 = _1907 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1913 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1909);
    float _1915 = 1.0 / _1911;
    float _1917 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1913);
    float _1919 = _1917 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1921 = _1919 + _1911;
    float _1923 = _1921 * _1915;
    float _1925 = _1923 * 0.5;
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1929 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1927);
    float _1931 = 1.0 / _1929;
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1935 = _1931 * _1933;
    float _1937 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1939 = _1323 + _1937;
    float _1941 = abs(_1935);
    float _1943 = log2(_1941);
    bool _1945 = _1935 <= 8000.0;
    bool _1947 = isnan(_1935);
    bool _1949 = _1945 || _1947;
    bool _1951 = isnan(8000.0);
    bool _1953 = _1949 || _1951;
    float _1955 = float(_1953);
    float _1957 = _1943 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1959 = exp2(_1957);
    float _1961 = fma(_1959, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1963 = precise::clamp(_1961, 0.0, 1.0);
    float _1965 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1967 = _1327 + _1965;
    float _1969 = fma(_1963, -2.0, 3.0);
    float _1971 = _1963 * _1963;
    float _1973 = _1971 * _1969;
    float _1975 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1977 = _1809 + _1975;
    float _1979 = -_1973;
    float _1981 = _1979 + 1.0;
    float _1983 = fma(_1977, _1895, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1985 = fma(_1981, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1973);
    float _1987 = fma(_1939, _1895, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1991 = _1983 + _1989;
    float _1993 = fma(_1967, _1895, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1995 = _1955 * _1985;
    float _1997 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1999 = _1987 + _1997;
    float _2001 = _1991 * _1991;
    float _2003 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2005 = _1993 + _2003;
    float _2007 = _1995 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2009 = _1983 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2011 = fma(_1999, _1999, _2001);
    float _2013 = _1983 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2015 = _1983 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2017 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2009);
    float _2019 = fma(_2005, _2005, _2011);
    float _2021 = _1983 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2023 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2013);
    float _2025 = _1905 * _2007;
    float _2027 = precise::clamp(_2025, 0.0, 1.0);
    float _2029 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2015);
    float _2031 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2021);
    float _2033 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2023);
    float _2035 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2017);
    float _2037 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2029);
    float _2039 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2031);
    float _2041 = _2033 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2043 = _2035 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2045 = -_2027;
    float _2047 = fma(_2045, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2049 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2051 = sqrt(_2019);
    float _2053 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2055 = _2047 * _1899;
    float _2057 = _2049 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2059 = _2049 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2061 = _2049 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2063 = _2049 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2065 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2057);
    float _2067 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2059);
    float _2069 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2061);
    float _2071 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2063);
    float _2073 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2065);
    float _2075 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2067);
    float _2077 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2069);
    float _2079 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2071);
    float _2081 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2073);
    float _2083 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2075);
    float _2085 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2077);
    float _2087 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2079);
    float _2089 = _2055 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_86.x = _1987;
    out.m_86.y = _1983;
    out.m_86.z = _1993;
    bool _2091 = _2051 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2093 = isnan(_2051);
    bool _2095 = _2091 || _2093;
    bool _2097 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2099 = _2095 || _2097;
    out.gl_Position.x = _2081;
    out.gl_Position.y = _2083;
    out.gl_Position.z = _2085;
    out.gl_Position.w = _2087;
    out.m_88.x = _2089;
    float _2101 = _2077;
    float _2103 = _2075;
    float _2105 = _2073;
    float _2107 = _2043;
    float _2109 = _2049;
    float _2111 = _2041;
    if (!_2099)
    {
        _2101 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2113 = _2101;
    float _2115 = _2113;
    float _2117 = _2113;
    if (!_2099)
    {
        _2103 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2119 = _2103;
    float _2121 = _2119;
    float _2123 = _2119;
    if (!_2099)
    {
        _2105 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2125 = _2105;
    float _2127 = _2125;
    float _2129 = _2125;
    if (!_2099)
    {
        _2107 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2131 = _2107;
    float _2133 = _2131;
    float _2135 = _2131;
    if (!_2099)
    {
        _2109 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2137 = _2109;
    float _2139 = _2137;
    float _2141 = _2137;
    if (!_2099)
    {
        _2111 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2143 = _2111;
    bool _2145 = !_2099;
    float _2147 = _2143;
    float _2149 = _2143;
    if (!_2145)
    {
        bool _2151 = _2051 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2153 = isnan(_2051);
        bool _2155 = _2151 || _2153;
        bool _2157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2159 = _2155 || _2157;
        if (!_2159)
        {
            float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2163 = _2051 + _2161;
            float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2167 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2165;
            float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2177 = 1.0 / _2167;
            float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2191 = _2163 * _2177;
            float _2193 = precise::clamp(_2191, 0.0, 1.0);
            float _2195 = fma(_2193, _2171, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2197 = fma(_2193, _2175, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2203 = fma(_2193, _2181, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2205 = fma(_2193, _2185, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2207 = fma(_2193, _2201, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2209 = fma(_2193, _2189, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2141 = _2197;
            _2123 = _2205;
            _2135 = _2195;
            _2117 = _2203;
            _2149 = _2207;
            _2129 = _2209;
            _2211 = true;
        }
        else
        {
            bool _2213 = _2051 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2215 = isnan(_2051);
            bool _2217 = _2213 || _2215;
            bool _2219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2221 = _2217 || _2219;
            if (!_2221)
            {
                _2115 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2223 = _2115;
            _2117 = _2223;
            if (!_2221)
            {
                _2121 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2225 = _2121;
            _2123 = _2225;
            if (!_2221)
            {
                _2127 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2227 = _2127;
            _2129 = _2227;
            if (!_2221)
            {
                _2133 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2229 = _2133;
            _2135 = _2229;
            if (!_2221)
            {
                _2139 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2231 = _2139;
            _2141 = _2231;
            if (!_2221)
            {
                _2147 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2233 = _2147;
            bool _2235 = !_2221;
            _2149 = _2233;
            if (!_2235)
            {
                bool _2237 = _2051 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2239 = isnan(_2051);
                bool _2241 = _2237 || _2239;
                bool _2243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2245 = _2241 || _2243;
                if (!_2245)
                {
                    float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2249 = _2051 + _2247;
                    float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2253 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2251;
                    float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2263 = 1.0 / _2253;
                    float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2269 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2271 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2277 = _2249 * _2263;
                    float _2279 = precise::clamp(_2277, 0.0, 1.0);
                    float _2281 = fma(_2279, _2257, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2283 = fma(_2279, _2261, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2289 = fma(_2279, _2267, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2291 = fma(_2279, _2271, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2293 = fma(_2279, _2287, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2295 = fma(_2279, _2275, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2141 = _2283;
                    _2123 = _2291;
                    _2135 = _2281;
                    _2117 = _2289;
                    _2149 = _2293;
                    _2129 = _2295;
                    _2211 = true;
                }
                else
                {
                    _2141 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2123 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2135 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2117 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2149 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2129 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2211 = false;
    float _2297 = _2141;
    float _2299 = _2123;
    float _2301 = _2135;
    float _2303 = _2117;
    float _2305 = _2149;
    float _2307 = _2129;
    float _2309 = fma(_1791, -0.5, 0.5);
    float _2311 = precise::clamp(_2309, 0.0, 1.0);
    float _2313 = -_2297;
    float _2315 = _2299 + _2313;
    float _2317 = -_2301;
    float _2319 = _2303 + _2317;
    float _2321 = -_2305;
    float _2323 = _2307 + _2321;
    bool _2325 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2327 = fma(_2311, _2315, _2297);
    float _2329 = fma(_2311, _2319, _2301);
    float _2331 = fma(_2311, _2323, _2305);
    float _2333 = _2327 * 0.586610972881317138671875;
    out.m_46.x = 1.0;
    float _2335 = fma(_2329, 0.298911988735198974609375, _2333);
    float _2337 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2339 = fma(_2331, 0.114477999508380889892578125, _2335);
    out.m_88.w = _2337;
    float _2341 = -_2339;
    float _2343 = _2329 + _2341;
    float _2345 = -_2339;
    float _2347 = _2327 + _2345;
    float _2349 = -_2339;
    float _2351 = _2331 + _2349;
    out.m_90.x = 0.0;
    float _2353 = fma(_2343, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2339);
    float _2355 = fma(_2347, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2339);
    float _2357 = fma(_2351, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2339);
    out.m_92.x = _2353;
    out.m_92.y = _2355;
    out.m_92.z = _2357;
    if (!_2325)
    {
        return out;
    }
    float _2359 = -_1983;
    float _2361 = _2359 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2363 = -_1987;
    float _2365 = _2363 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2367 = -_1993;
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
    float _2401 = _1791 * _2391;
    float _2403 = -_2391;
    float _2405 = -_2399;
    float _2407 = fma(_2403, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2405);
    float _2409 = fma(_1789, _2389, _2401);
    float _2411 = -_2397;
    float _2413 = fma(_2411, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2407);
    float _2415 = fma(_1793, _2397, _2409);
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
    out.m_90.x = _2435;
    out.m_90.y = _2437;
    out.m_90.z = _2439;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2211 = false;
    bool _1865 = false;
    bool _745 = false;
    bool _617 = false;
    bool _465 = false;
    bool _353 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_43.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_46.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2496 = as_type<float>(_127);
        out.gl_Position.z = _2496;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_48.w;
    float _133 = in.m_50.x;
    bool _135 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_131);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_131;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_52.x = _133;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_111);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _121;
    if (_161)
    {
        out.m_46.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _129 = as_type<int>(_165);
    }
    int _167 = _129;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2569 = as_type<float>(_167);
        out.gl_Position.z = _2569;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = in.m_54.x;
    float _171 = in.m_54.y;
    float _173 = in.m_54.z;
    float _175 = in.m_56.x;
    float _177 = in.m_56.y;
    float _179 = in.m_56.z;
    float _181 = in.m_58.x;
    float _183 = in.m_58.y;
    float _185 = in.m_58.z;
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = _169 * _169;
    float _193 = _171 * _171;
    float _195 = _173 * _173;
    float _197 = fma(_175, _175, _191);
    float _199 = fma(_177, _177, _193);
    float _201 = fma(_179, _179, _195);
    float _203 = fma(_181, _181, _197);
    float _205 = fma(_183, _183, _199);
    float _207 = fma(_185, _185, _201);
    float _209 = sqrt(_203);
    out.m_62.x = _187;
    out.m_62.y = _189;
    float _211 = sqrt(_205);
    float _213 = sqrt(_207);
    bool _215 = _209 > 0.0;
    bool _217 = _211 > 0.0;
    float _219 = _203;
    float _221 = _211;
    float _223 = _207;
    float _225 = _189;
    float _227 = _187;
    if (_215)
    {
        float _229 = rsqrt(_203);
        _219 = _229;
    }
    float _231 = _219;
    float _233 = 0.0;
    float _235 = 0.0;
    if (!_215)
    {
        _233 = 0.0;
        _235 = 0.0;
    }
    float _237 = _233;
    float _239 = _235;
    bool _241 = _213 > 0.0;
    float _243 = 0.0;
    float _245 = _237;
    float _247 = _239;
    if (!_215)
    {
        _243 = 0.0;
    }
    float _249 = _243;
    float _251 = 0.0;
    float _253 = _249;
    if (!_217)
    {
        _251 = 0.0;
    }
    float _255 = _251;
    float _257 = _209;
    float _259 = _255;
    if (_217)
    {
        float _261 = rsqrt(_205);
        _257 = _261;
    }
    float _263 = _257;
    float _265 = 0.0;
    if (!_217)
    {
        _265 = 0.0;
    }
    float _267 = _265;
    float _269 = 0.0;
    float _271 = _267;
    if (!_217)
    {
        _269 = 0.0;
    }
    float _273 = _269;
    float _275 = _273;
    if (!_241)
    {
        _221 = 0.0;
    }
    float _277 = _221;
    float _279 = _213;
    float _281 = _277;
    if (_241)
    {
        float _283 = rsqrt(_207);
        _279 = _283;
    }
    float _285 = _279;
    float _287 = _231;
    if (_215)
    {
        float _289 = _231 * _175;
        _245 = _289;
    }
    float _291 = _245;
    if (_215)
    {
        float _293 = _231 * _169;
        _247 = _293;
    }
    float _295 = _247;
    if (_215)
    {
        float _297 = _231 * _181;
        _253 = _297;
    }
    float _299 = _253;
    bool _301 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_241)
    {
        _287 = 0.0;
    }
    float _303 = _287;
    float _305 = _303;
    if (_217)
    {
        float _307 = _263 * _177;
        _259 = _307;
    }
    float _309 = _259;
    if (!_241)
    {
        _223 = 0.0;
    }
    float _311 = _223;
    float _313 = _311;
    if (_217)
    {
        float _315 = _263 * _171;
        _271 = _315;
    }
    float _317 = _271;
    if (_217)
    {
        float _319 = _263 * _183;
        _275 = _319;
    }
    float _321 = _275;
    if (_241)
    {
        float _323 = _285 * _179;
        _313 = _323;
    }
    float _325 = _313;
    if (_241)
    {
        float _327 = _285 * _173;
        _281 = _327;
    }
    float _329 = _281;
    if (_241)
    {
        float _331 = _285 * _185;
        _305 = _331;
    }
    float _333 = _305;
    bool _335 = !_301;
    float _351;
    if (!_335)
    {
        float _337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _339 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _341 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _343 = _341 * _337;
        float _345 = floor(_343);
        float _347 = -_345;
        float _349 = _343 + _347;
        _351 = _349;
        _353 = true;
    }
    else
    {
        float _355 = float(_111);
        float _357 = 1.0 / _355;
        float _359 = _147 * _357;
        _351 = _359;
    }
    _353 = false;
    float _361 = _351;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _365 = _361 + _363;
    bool _367 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _369 = isnan(_361);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _379;
    bool _383 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _385 = isnan(_361);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -_377;
    float _397 = _395 + 1.0;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _399;
    float _403 = 1.0 / _381;
    bool _405 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _407 = _393 * _397;
    float _409 = -_393;
    float _411 = _409 + 1.0;
    float _413 = _365 * _403;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _415;
    float _419 = fma(_401, _413, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _421;
    float _425 = fma(_417, _413, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _427 = _419 * _407;
    float _429 = fma(_423, _413, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _431 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[143].x, _427);
    float _433 = _429 * _407;
    float _435 = _425 * _407;
    float _437 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[144].x, _431);
    float _439 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[143].y, _433);
    float _441 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[143].z, _435);
    float _443 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[144].y, _439);
    float _445 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[144].z, _441);
    bool _447 = !_405;
    float _463;
    if (!_447)
    {
        float _449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _451 = _133 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _455 = _453 * _449;
        float _457 = floor(_455);
        float _459 = -_457;
        float _461 = _455 + _459;
        _463 = _461;
        _465 = true;
    }
    else
    {
        float _467 = float(_111);
        float _469 = 1.0 / _467;
        float _471 = _147 * _469;
        _463 = _471;
    }
    _465 = false;
    float _473 = _463;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _477 = _473 + _475;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _483 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _485 = isnan(_473);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _499 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _501 = isnan(_473);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _511;
    bool _515 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _517 = isnan(_473);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = 1.0 / _481;
    float _529 = -_493;
    float _531 = _529 + 1.0;
    bool _533 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _535 = 1.0 / _497;
    float _537 = _513 * _527;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _543 = -_525;
    float _545 = _543 + 1.0;
    float _547 = fma(_537, _477, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _549 = _509 * _531;
    float _551 = -_509;
    float _553 = _551 + 1.0;
    float _555 = _493 * _545;
    float _557 = _541 * _535;
    float _559 = _547 * _549;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = _473 + _561;
    float _565 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[115].x, _559);
    float _567 = fma(_557, _563, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _571 = fma(_567, _555, _565);
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _575 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _577 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[117].x, _571);
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _581 = _573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _583 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _585 = in.m_64.x;
    float _587 = in.m_64.y;
    float _589 = in.m_64.z;
    float _591 = _579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _575;
    out.m_66.y = _581;
    out.m_66.z = _591;
    out.m_66.w = _583;
    float _593 = _445 * _589;
    float _595 = _443 * _587;
    float _597 = _437 * _585;
    bool _599 = !_533;
    float _615;
    if (!_599)
    {
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _603 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_111);
        float _621 = 1.0 / _619;
        float _623 = _147 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _629 = _625 + _627;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _635 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _637 = isnan(_625);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _651 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _653 = isnan(_625);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _663;
    bool _667 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _669 = isnan(_625);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = 1.0 / _633;
    float _681 = -_645;
    float _683 = _681 + 1.0;
    bool _685 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _687 = 1.0 / _649;
    float _689 = _665 * _679;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _695 = -_677;
    float _697 = _695 + 1.0;
    float _699 = fma(_689, _629, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _701 = _661 * _683;
    float _703 = -_661;
    float _705 = _703 + 1.0;
    float _707 = _645 * _697;
    float _709 = _693 * _687;
    float _711 = _699 * _701;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _715 = _625 + _713;
    float _717 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[131].x, _711);
    float _719 = fma(_709, _715, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _721 = fma(_719, _707, _717);
    float _723 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[133].x, _721);
    float _725 = _723 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.w = _725;
    bool _727 = !_685;
    float _743;
    if (!_727)
    {
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _731 = _133 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[14].x, _147);
        float _735 = _733 * _729;
        float _737 = floor(_735);
        float _739 = -_737;
        float _741 = _735 + _739;
        _743 = _741;
        _745 = true;
    }
    else
    {
        float _747 = float(_111);
        float _749 = 1.0 / _747;
        float _751 = _147 * _749;
        _743 = _751;
    }
    _745 = false;
    float _753 = _743;
    float _755 = in.m_50.z;
    float _757 = _133 * 2.0;
    float _759 = in.m_50.y;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _763 = _761 != 0;
    float _765 = _597 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _767 = floor(_757);
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _775 = _773 != 0;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _779 = _777 != 0;
    float _781 = _595 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _783 = _593 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (_763)
    {
        _785 = _133;
    }
    float _787 = _785;
    float _789 = _755 * 2.0;
    float _791 = _787;
    float _793 = _789;
    if (!_763)
    {
        _791 = _755;
    }
    float _795 = _791;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _799 = _767 > 0.0;
    float _801 = floor(_789);
    float _803 = _759 + _755;
    float _805 = _759 * 2.0;
    bool _807 = _767 >= 0.0;
    bool _809 = isnan(_767);
    bool _811 = _807 || _809;
    bool _813 = isnan(0.0);
    bool _815 = _811 || _813;
    float _817 = _133 + _759;
    float _819 = _803 + (-1.0);
    float _821 = _795 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _823 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[88].w, _797);
    float _825 = floor(_805);
    if (_763)
    {
        _793 = _759;
    }
    float _827 = _793;
    float _829 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _831 = _827;
    if (!_763)
    {
        _831 = _133;
    }
    float _833 = _831;
    float _835 = _817 + (-1.0);
    bool _837 = _801 > 0.0;
    float _839 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _841 = _801 >= 0.0;
    bool _843 = isnan(_801);
    bool _845 = _841 || _843;
    bool _847 = isnan(0.0);
    bool _849 = _845 || _847;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _853 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _855 = log2(_853);
    bool _857 = !_775;
    int _859 = _857 ? 0 : 1;
    float _861 = -_851;
    float _863 = fma(_821, 2.0, _861);
    int _865 = _815 ? 0 : 1;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _869 = abs(_859);
    float _871 = -_147;
    float _873 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[86].x, _863);
    bool _875 = _825 > 0.0;
    bool _877 = _825 >= 0.0;
    bool _879 = isnan(_825);
    bool _881 = _877 || _879;
    bool _883 = isnan(0.0);
    bool _885 = _881 || _883;
    int _887 = ~_865;
    int _889 = _887 + 1;
    int _891 = _889 + 1;
    float _893 = _855 * _147;
    int _895 = _891;
    if (!_799)
    {
        int _897 = ~_865;
        int _899 = _897 + 1;
        _895 = _899;
    }
    int _901 = _895;
    float _903 = _833 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _905 = float(_869);
    int _907 = _849 ? 0 : 1;
    float _909 = exp2(_893);
    float _911 = float(_901);
    float _913 = fma(_903, -2.0, _867);
    int _915 = ~_907;
    int _917 = _915 + 1;
    int _919 = _917 + 1;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _923 = 1.0 + _921;
    int _925 = _919;
    if (!_837)
    {
        int _927 = ~_907;
        int _929 = _927 + 1;
        _925 = _929;
    }
    int _931 = _925;
    float _933 = _905 * _911;
    bool _935 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _937 = isnan(1.0);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _943 = _939 || _941;
    float _945 = in.m_70.x;
    float _947 = in.m_70.y;
    float _949 = in.m_70.z;
    float _951 = 1.0 / _923;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _955 = !_771;
    int _957 = _955 ? 0 : 1;
    bool _959 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _961 = isnan(0.0);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _967 = _963 || _965;
    float _969 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[88].z, _953);
    int _971 = abs(_957);
    float _973 = -_909;
    float _975 = _973 + 1.0;
    float _977 = float(_931);
    float _979 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[87].z, _969);
    float _981 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[87].w, _823);
    float _983 = float(_971);
    float _985 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[86].y, _913);
    float _987 = _967 ? _975 : 0.0;
    bool _989 = !_779;
    int _991 = _989 ? 0 : 1;
    float _993 = _983 * _977;
    float _995 = _759 + (-0.5);
    if (_943)
    {
        float _997 = _987 * _951;
        _151 = _997;
    }
    float _999 = _151;
    float _1001 = _933 * (-2.0);
    int _1003 = _885 ? 0 : 1;
    float _1005 = _993 * (-2.0);
    int _1007 = abs(_991);
    float _1009 = fma(_1001, _947, _947);
    float _1011 = fma(_829, _1001, _829);
    int _1013 = ~_1003;
    int _1015 = _1013 + 1;
    int _1017 = _1015 + 1;
    float _1019 = _133 + (-0.5);
    float _1021 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1009);
    int _1023 = _1017;
    if (!_875)
    {
        int _1025 = ~_1003;
        int _1027 = _1025 + 1;
        _1023 = _1027;
    }
    int _1029 = _1023;
    float _1031 = _133 + _755;
    float _1033 = fma(_1011, _999, _1021);
    float _1035 = fma(_839, _1005, _839);
    float _1037 = float(_1007);
    float _1039 = fma(_1005, _945, _945);
    float _1041 = _1033 * 0.15915493667125701904296875;
    float _1043 = float(_1029);
    float _1045 = in.m_43.x;
    float _1047 = in.m_43.y;
    float _1049 = in.m_43.z;
    float _1051 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1039);
    float _1053 = _1031 + (-1.0);
    float _1055 = _1037 * _1043;
    float _1057 = _1041 * 6.283185482025146484375;
    float _1059 = sin(_1057);
    float _1061 = fma(_1035, _999, _1051);
    float _1063 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1065 = _1055 * (-2.0);
    float _1067 = _1061 * 0.15915493667125701904296875;
    float _1069 = _755 + (-0.5);
    float _1071 = fma(_1065, _949, _949);
    float _1073 = in.m_72.x;
    float _1075 = in.m_72.y;
    float _1077 = in.m_72.z;
    float _1079 = fma(_1063, _1065, _1063);
    float _1081 = _1041 * 6.283185482025146484375;
    float _1083 = cos(_1081);
    float _1085 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1071);
    float _1087 = fma(_1079, _999, _1085);
    float _1089 = _1067 * 6.283185482025146484375;
    float _1091 = sin(_1089);
    float _1093 = _1087 * 0.15915493667125701904296875;
    float _1095 = _177 * _1047;
    float _1097 = _183 * _1047;
    float _1099 = _171 * _1047;
    float _1101 = fma(_175, _1045, _1095);
    float _1103 = fma(_181, _1045, _1097);
    float _1105 = _1093 * 6.283185482025146484375;
    float _1107 = cos(_1105);
    float _1109 = fma(_169, _1045, _1099);
    float _1111 = fma(_179, _1049, _1101);
    float _1113 = fma(_185, _1049, _1103);
    float _1115 = in.m_58.w;
    float _1117 = fma(_173, _1049, _1109);
    float _1119 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1073);
    float _1121 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1077);
    float _1123 = _1067 * 6.283185482025146484375;
    float _1125 = cos(_1123);
    float _1127 = _1091 * _1059;
    float _1129 = _765 * _1119;
    float _1131 = _783 * _1121;
    float _1133 = in.m_56.w;
    float _1135 = _1093 * 6.283185482025146484375;
    float _1137 = sin(_1135);
    float _1139 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1075);
    float _1141 = _1091 * _1107;
    float _1143 = _781 * _1139;
    float _1145 = _1091 * _1083;
    float _1147 = _1125 * _1083;
    float _1149 = _1125 * _1107;
    float _1151 = _1125 * _1059;
    float _1153 = _1083 * _1107;
    float _1155 = _1059 * _1107;
    float _1157 = _1149 * _1143;
    float _1159 = _1141 * _1143;
    float _1161 = _1113 + _1115;
    float _1163 = fma(_1137, _1147, _1127);
    float _1165 = -_1143;
    float _1167 = _1137 * _1165;
    float _1169 = -_1145;
    float _1171 = fma(_1137, _1151, _1169);
    float _1173 = -_1151;
    float _1175 = fma(_1137, _1145, _1173);
    float _1177 = fma(_1163, _1129, _1157);
    float _1179 = fma(_1153, _1129, _1167);
    float _1181 = fma(_1137, _1127, _1147);
    float _1183 = fma(_1175, _1129, _1159);
    float _1185 = fma(_1171, _1131, _1177);
    float _1187 = fma(_1155, _1131, _1179);
    float _1189 = fma(_1181, _1131, _1183);
    float _1191 = _1185 * _309;
    float _1193 = _1185 * _321;
    float _1195 = fma(_1187, _291, _1191);
    float _1197 = fma(_1187, _299, _1193);
    float _1199 = _1111 + _1133;
    float _1201 = fma(_1189, _325, _1195);
    float _1203 = fma(_1189, _333, _1197);
    float _1205 = _1199 + _1201;
    float _1207 = _1161 + _1203;
    float _1209 = in.m_54.w;
    float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1213 = _1205 + _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1217 = _1207 + _1215;
    float _1219 = _1213 * _1213;
    float _1221 = _1217 * _1217;
    float _1223 = _1219 + _1221;
    float _1225 = sqrt(_1223);
    float _1227 = _1117 + _1209;
    float _1229 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1231 = floor(_1229);
    bool _1233 = _1225 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1235 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1237 = _1225 + _1235;
    float _1239 = 0.0;
    float _1241 = _1045;
    float _1243 = _1049;
    float _1245 = _1223;
    float _1247 = _1237;
    float _1249 = _1219;
    float _1251 = _1221;
    if (_1233)
    {
        float _1253 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1239 = _1253;
    }
    float _1255 = _1239;
    if (!_1233)
    {
        _1241 = _1205;
    }
    float _1257 = _1241;
    float _1259 = -_1231;
    float _1261 = _1229 + _1259;
    float _1263 = _1257;
    if (!_1233)
    {
        _1243 = _1207;
    }
    float _1265 = _1243;
    float _1267 = _1265;
    if (_1233)
    {
        float _1269 = rsqrt(_1223);
        _1245 = _1269;
    }
    float _1271 = _1245;
    float _1273 = _1255;
    if (_1233)
    {
        float _1275 = _1237 * _1255;
        _1247 = _1275;
    }
    float _1277 = _1247;
    if (_1233)
    {
        float _1279 = _1277 * 0.15915493667125701904296875;
        _1273 = _1279;
    }
    float _1281 = _1273;
    float _1283 = _1185 * _317;
    float _1285 = _171;
    if (_1233)
    {
        float _1287 = _1281 * 6.283185482025146484375;
        float _1289 = sin(_1287);
        _1285 = _1289;
    }
    float _1291 = _1285;
    float _1293 = fma(_1187, _295, _1283);
    float _1295 = fma(_1189, _329, _1293);
    float _1297 = _1227 + _1295;
    float _1299 = fma(_1161, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1301 = _1297;
    float _1303 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    if (_1233)
    {
        float _1305 = _1297 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1301 = _1305;
    }
    float _1307 = _1301;
    if (_1233)
    {
        float _1309 = fma(_1291, _1307, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1303 = _1309;
    }
    float _1311 = _1303;
    float _1313 = floor(_1299);
    float _1315 = _1311;
    if (_1233)
    {
        float _1317 = _1271 * _1311;
        _1315 = _1317;
    }
    float _1319 = _1315;
    if (_1233)
    {
        float _1321 = fma(_1213, _1319, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1263 = _1321;
    }
    float _1323 = _1263;
    if (_1233)
    {
        float _1325 = fma(_1217, _1319, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1267 = _1325;
    }
    float _1327 = _1267;
    float _1329 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1331 = _1323 + _1329;
    float _1333 = fma(_1323, 6.2500002968590706586837768554688e-05, 0.5);
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1337 = _1327 + _1335;
    float _1339 = fma(_1327, 6.2500002968590706586837768554688e-05, 0.5);
    float _1341 = fma(_1331, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1343 = fma(_1337, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4359 = float2(_1333, _1339);
    float _1345 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_4359, float2(0.0), isnan(_4359)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_4359, float2(0.0), isnan(_4359)), level(0.0)).y;
    float _1347 = -_1313;
    float _1349 = _1299 + _1347;
    float2 _4374 = float2(_1341, _1343);
    float _1351 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4374, float2(0.0), isnan(_4374)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4374, float2(0.0), isnan(_4374)), level(0.0)).x;
    float2 _4382 = float2(_1261, _1349);
    float _1353 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4382, float2(0.0), isnan(_4382)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4382, float2(0.0), isnan(_4382)), level(0.0)).x;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1361 = _1359 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1363 = 1.0 / _1357;
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1367 = _1365 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1371 = _1369 != 0;
    int _1373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1375 = _1373 != 0;
    float _1377 = -_189;
    float _1379 = _1377 + 1.0;
    float _1381 = 1.0 / _1361;
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1383;
    bool _1387 = _759 > 0.5;
    bool _1389 = _1387 && _1375;
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _1395 = _755 > 0.5;
    float _1397 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1399 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1397;
    bool _1401 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1403 = isnan(_753);
    bool _1405 = _1401 || _1403;
    bool _1407 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1409 = _1405 || _1407;
    float _1411 = float(_1409);
    float _1413 = 1.0 / _1367;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1417 = _1415 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1419 = _1399 * _1363;
    if (_1371)
    {
        float _1421 = _1395 ? _1379 : _189;
        _225 = _1421;
    }
    float _1423 = _225;
    float _1425 = -_1411;
    float _1427 = _1425 + 1.0;
    bool _1429 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1431 = isnan(_753);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1437 = _1433 || _1435;
    float _1439 = float(_1437);
    float _1441 = 1.0 / _1417;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1445 = _1443 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1447 = _1439 * _1427;
    float _1449 = -_1439;
    float _1451 = _1449 + 1.0;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1457 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1459 = isnan(_753);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1465 = _1461 || _1463;
    float _1467 = float(_1465);
    float _1469 = _1385 * _1381;
    float _1471 = _1393 * _1413;
    bool _1473 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1475 = isnan(_753);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1481 = _1477 || _1479;
    float _1483 = float(_1481);
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1487 = _1485 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1491 = _753 + _1489;
    float _1493 = 1.0 / _1455;
    float _1495 = _1483 * _1451;
    float _1497 = -_1483;
    float _1499 = _1497 + 1.0;
    float _1501 = _1445 * _1441;
    bool _1503 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1505 = isnan(_753);
    bool _1507 = _1503 || _1505;
    bool _1509 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1511 = _1507 || _1509;
    float _1513 = float(_1511);
    float _1515 = fma(_1469, _1491, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1517 = 1.0 / _1487;
    bool _1519 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1521 = isnan(_753);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1527 = _1523 || _1525;
    float _1529 = float(_1527);
    float _1531 = _1513 * _1499;
    float _1533 = -_1513;
    float _1535 = _1533 + 1.0;
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1539 = _1537 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1541 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1543 = isnan(_753);
    bool _1545 = _1541 || _1543;
    bool _1547 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1549 = _1545 || _1547;
    float _1551 = float(_1549);
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1553;
    float _1557 = _1467 * _1535;
    float _1559 = -_1467;
    float _1561 = _1559 + 1.0;
    float _1563 = 1.0 / _1539;
    bool _1565 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1567 = isnan(_753);
    bool _1569 = _1565 || _1567;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1573 = _1569 || _1571;
    float _1575 = float(_1573);
    float _1577 = _1551 * _1561;
    float _1579 = -_1551;
    float _1581 = _1579 + 1.0;
    float _1583 = -_1529;
    float _1585 = _1583 + 1.0;
    float _1587 = _1555 * _1493;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1591 = _753 + _1589;
    float _1593 = _1529 * _1581;
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1597 = _1595 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1599;
    float _1603 = _1575 * _1585;
    bool _1605 = _1075 != 0.0;
    bool _1607 = isnan(_1075);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan(0.0);
    bool _1613 = _1609 || _1611;
    float _1615 = _1597 * _1517;
    float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1619 = _753 + _1617;
    float _1621 = _1515 * _1603;
    float _1623 = fma(_1471, _1591, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1625 = _1601 * _1563;
    float _1627 = -_1575;
    float _1629 = _1627 + 1.0;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1633 = _753 + _1631;
    float _1635 = fma(_1419, _1619, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1637 = _1073 == 0.0;
    bool _1639 = !_1613;
    bool _1641 = _1637 && _1639;
    float _1643 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1621);
    float _1645 = fma(_1501, _1633, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1649 = _1077 == 0.0;
    bool _1651 = _1649 && _1641;
    float _1653 = fma(_1623, _1593, _1643);
    float _1655 = _1591;
    if (!_1375)
    {
        _1655 = _187;
    }
    float _1657 = _1655;
    float _1659 = in.m_74.x;
    float _1661 = in.m_74.y;
    float _1663 = in.m_74.z;
    float _1665 = _1657;
    if (_1389)
    {
        float _1667 = -_187;
        float _1669 = _1667 + 1.0;
        _227 = _1669;
    }
    float _1671 = _227;
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1675 = _753 + _1673;
    float _1677 = fma(_1635, _1577, _1653);
    float _1679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1681 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1683 = _753 + _1681;
    float _1685 = fma(_1587, _1675, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    if (_1375)
    {
        _1665 = _1671;
    }
    float _1687 = _1665;
    float _1689 = fma(_1645, _1557, _1677);
    float _1691 = fma(_1615, _1683, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1693 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1695 = _753 + _1693;
    float _1697 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1699 = fma(_1685, _1531, _1689);
    float _1701 = fma(_1625, _1695, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1703 = fma(_1697, _1423, -0.5);
    float _1705 = fma(_1691, _1495, _1699);
    float _1707 = _1679 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1709 = -_985;
    float _1711 = fma(_981, _1703, _1709);
    float _1713 = fma(_1701, _1447, _1705);
    float _1715 = _1661;
    float _1717 = _1659;
    float _1719 = _1663;
    if (!_1651)
    {
        float _1721 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1661);
        _1715 = _1721;
    }
    float _1723 = _1715;
    if (!_1651)
    {
        float _1725 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1659);
        _1717 = _1725;
    }
    float _1727 = _1717;
    float _1729 = fma(_1707, _1687, -0.5);
    float _1731 = _1727;
    if (!_1651)
    {
        float _1733 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1663);
        _1719 = _1733;
    }
    float _1735 = _1719;
    float _1737 = _1149 * _1723;
    float _1739 = -_1723;
    float _1741 = _1137 * _1739;
    float _1743 = fma(_979, _1729, _873);
    float _1745 = _1141 * _1723;
    float _1747 = fma(_1163, _1727, _1737);
    float _1749 = fma(_1153, _1727, _1741);
    float _1751 = _1743 + 0.5;
    float _1753 = _1711 + 0.5;
    float _1755 = fma(_1171, _1735, _1747);
    float _1757 = fma(_1175, _1727, _1745);
    float _1759 = fma(_1155, _1735, _1749);
    float _1761 = _1751;
    float _1763 = _1757;
    if (_1233)
    {
        float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1767 = _1323 + _1765;
        _1731 = _1767;
    }
    float _1769 = _1731;
    float _1771 = _1755 * _309;
    float _1773 = _1755 * _317;
    float _1775 = _1755 * _321;
    float _1777 = fma(_1181, _1735, _1757);
    float _1779 = fma(_1759, _291, _1771);
    out.m_76.x = _1751;
    out.m_76.y = _1753;
    float _1781 = fma(_1759, _295, _1773);
    float _1783 = fma(_1759, _299, _1775);
    if (_1233)
    {
        float _1785 = _1769 * _1769;
        _1249 = _1785;
    }
    float _1787 = _1249;
    float _1789 = fma(_1777, _325, _1779);
    float _1791 = fma(_1777, _329, _1781);
    float _1793 = fma(_1777, _333, _1783);
    float _1795 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1713);
    if (_1233)
    {
        float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1799 = _1327 + _1797;
        _1761 = _1799;
    }
    float _1801 = _1761;
    out.m_78.x = _1795;
    if (_1233)
    {
        float _1803 = _1801 * _1801;
        _1251 = _1803;
    }
    float _1805 = _1251;
    out.m_80.x = _1789;
    out.m_80.y = _1791;
    out.m_80.z = _1793;
    float _1807 = fma(_1345, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _1809 = fma(_1351, 100.0, _1807);
    float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1813 = _1809 + _1811;
    float _1815 = fma(_1813, _1813, _1787);
    float _1817 = _1815 + _1805;
    float _1819 = sqrt(_1817);
    bool _1821 = _1819 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1823 = isnan(_1819);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1829 = _1825 || _1827;
    if (!_1829)
    {
        _1763 = 1.0;
    }
    float _1831 = _1763;
    bool _1833 = !_1829;
    float _1835 = _1831;
    if (!_1833)
    {
        bool _1837 = _1819 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1839 = isnan(_1819);
        bool _1841 = _1837 || _1839;
        bool _1843 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1845 = _1841 || _1843;
        if (!_1845)
        {
            float _1847 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1849 = _1819 + _1847;
            float _1851 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1853 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1851;
            float _1855 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1857 = _1855 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1859 = 1.0 / _1853;
            float _1861 = _1849 * _1859;
            float _1863 = fma(_1861, _1857, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1835 = _1863;
            _1865 = true;
        }
        else
        {
            bool _1867 = _1819 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1869 = isnan(_1819);
            bool _1871 = _1867 || _1869;
            bool _1873 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1875 = _1871 || _1873;
            if (!_1875)
            {
                float _1877 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1879 = _1819 + _1877;
                float _1881 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1883 = _1881 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1885 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1887 = _1885 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1889 = 1.0 / _1883;
                float _1891 = _1879 * _1889;
                float _1893 = fma(_1891, _1887, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1835 = _1893;
                _1865 = true;
            }
            else
            {
                _1835 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1865 = false;
    float _1895 = _1835;
    float _1897 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1899 = in.m_82.x;
    float _1901 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1897);
    float _1903 = -_1353;
    float _1905 = _1903 + 1.0;
    out.m_84.x = _1199;
    out.m_84.y = _1227;
    out.m_84.z = _1161;
    float _1907 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1901);
    float _1909 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1911 = _1907 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1913 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1909);
    float _1915 = 1.0 / _1911;
    float _1917 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1913);
    float _1919 = _1917 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1921 = _1919 + _1911;
    float _1923 = _1921 * _1915;
    float _1925 = _1923 * 0.5;
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1929 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1927);
    float _1931 = 1.0 / _1929;
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1935 = _1931 * _1933;
    float _1937 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1939 = _1323 + _1937;
    float _1941 = abs(_1935);
    float _1943 = log2(_1941);
    bool _1945 = _1935 <= 8000.0;
    bool _1947 = isnan(_1935);
    bool _1949 = _1945 || _1947;
    bool _1951 = isnan(8000.0);
    bool _1953 = _1949 || _1951;
    float _1955 = float(_1953);
    float _1957 = _1943 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1959 = exp2(_1957);
    float _1961 = fma(_1959, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1963 = precise::clamp(_1961, 0.0, 1.0);
    float _1965 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1967 = _1327 + _1965;
    float _1969 = fma(_1963, -2.0, 3.0);
    float _1971 = _1963 * _1963;
    float _1973 = _1971 * _1969;
    float _1975 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1977 = _1809 + _1975;
    float _1979 = -_1973;
    float _1981 = _1979 + 1.0;
    float _1983 = fma(_1977, _1895, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1985 = fma(_1981, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1973);
    float _1987 = fma(_1939, _1895, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1991 = _1983 + _1989;
    float _1993 = fma(_1967, _1895, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1995 = _1955 * _1985;
    float _1997 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1999 = _1987 + _1997;
    float _2001 = _1991 * _1991;
    float _2003 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2005 = _1993 + _2003;
    float _2007 = _1995 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2009 = _1983 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2011 = fma(_1999, _1999, _2001);
    float _2013 = _1983 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2015 = _1983 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2017 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2009);
    float _2019 = fma(_2005, _2005, _2011);
    float _2021 = _1983 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2023 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2013);
    float _2025 = _1905 * _2007;
    float _2027 = precise::clamp(_2025, 0.0, 1.0);
    float _2029 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2015);
    float _2031 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2021);
    float _2033 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2023);
    float _2035 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2017);
    float _2037 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2029);
    float _2039 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2031);
    float _2041 = _2033 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2043 = _2035 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2045 = -_2027;
    float _2047 = fma(_2045, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2049 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2051 = sqrt(_2019);
    float _2053 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2055 = _2047 * _1899;
    float _2057 = _2049 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2059 = _2049 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2061 = _2049 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2063 = _2049 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2065 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2057);
    float _2067 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2059);
    float _2069 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2061);
    float _2071 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2063);
    float _2073 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2065);
    float _2075 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2067);
    float _2077 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2069);
    float _2079 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2071);
    float _2081 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2073);
    float _2083 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2075);
    float _2085 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2077);
    float _2087 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2079);
    float _2089 = _2055 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_86.x = _1987;
    out.m_86.y = _1983;
    out.m_86.z = _1993;
    bool _2091 = _2051 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2093 = isnan(_2051);
    bool _2095 = _2091 || _2093;
    bool _2097 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2099 = _2095 || _2097;
    out.gl_Position.x = _2081;
    out.gl_Position.y = _2083;
    out.gl_Position.z = _2085;
    out.gl_Position.w = _2087;
    out.m_88.x = _2089;
    float _2101 = _2077;
    float _2103 = _2075;
    float _2105 = _2073;
    float _2107 = _2043;
    float _2109 = _2049;
    float _2111 = _2041;
    if (!_2099)
    {
        _2101 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2113 = _2101;
    float _2115 = _2113;
    float _2117 = _2113;
    if (!_2099)
    {
        _2103 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2119 = _2103;
    float _2121 = _2119;
    float _2123 = _2119;
    if (!_2099)
    {
        _2105 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2125 = _2105;
    float _2127 = _2125;
    float _2129 = _2125;
    if (!_2099)
    {
        _2107 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2131 = _2107;
    float _2133 = _2131;
    float _2135 = _2131;
    if (!_2099)
    {
        _2109 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2137 = _2109;
    float _2139 = _2137;
    float _2141 = _2137;
    if (!_2099)
    {
        _2111 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2143 = _2111;
    bool _2145 = !_2099;
    float _2147 = _2143;
    float _2149 = _2143;
    if (!_2145)
    {
        bool _2151 = _2051 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2153 = isnan(_2051);
        bool _2155 = _2151 || _2153;
        bool _2157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2159 = _2155 || _2157;
        if (!_2159)
        {
            float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2163 = _2051 + _2161;
            float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2167 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2165;
            float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2177 = 1.0 / _2167;
            float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2191 = _2163 * _2177;
            float _2193 = precise::clamp(_2191, 0.0, 1.0);
            float _2195 = fma(_2193, _2171, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2197 = fma(_2193, _2175, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2203 = fma(_2193, _2181, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2205 = fma(_2193, _2185, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2207 = fma(_2193, _2201, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2209 = fma(_2193, _2189, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2141 = _2197;
            _2123 = _2205;
            _2135 = _2195;
            _2117 = _2203;
            _2149 = _2207;
            _2129 = _2209;
            _2211 = true;
        }
        else
        {
            bool _2213 = _2051 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2215 = isnan(_2051);
            bool _2217 = _2213 || _2215;
            bool _2219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2221 = _2217 || _2219;
            if (!_2221)
            {
                _2115 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2223 = _2115;
            _2117 = _2223;
            if (!_2221)
            {
                _2121 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2225 = _2121;
            _2123 = _2225;
            if (!_2221)
            {
                _2127 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2227 = _2127;
            _2129 = _2227;
            if (!_2221)
            {
                _2133 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2229 = _2133;
            _2135 = _2229;
            if (!_2221)
            {
                _2139 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2231 = _2139;
            _2141 = _2231;
            if (!_2221)
            {
                _2147 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2233 = _2147;
            bool _2235 = !_2221;
            _2149 = _2233;
            if (!_2235)
            {
                bool _2237 = _2051 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2239 = isnan(_2051);
                bool _2241 = _2237 || _2239;
                bool _2243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2245 = _2241 || _2243;
                if (!_2245)
                {
                    float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2249 = _2051 + _2247;
                    float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2253 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2251;
                    float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2263 = 1.0 / _2253;
                    float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2269 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2271 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2277 = _2249 * _2263;
                    float _2279 = precise::clamp(_2277, 0.0, 1.0);
                    float _2281 = fma(_2279, _2257, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2283 = fma(_2279, _2261, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2289 = fma(_2279, _2267, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2291 = fma(_2279, _2271, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2293 = fma(_2279, _2287, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2295 = fma(_2279, _2275, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2141 = _2283;
                    _2123 = _2291;
                    _2135 = _2281;
                    _2117 = _2289;
                    _2149 = _2293;
                    _2129 = _2295;
                    _2211 = true;
                }
                else
                {
                    _2141 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2123 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2135 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2117 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2149 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2129 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2211 = false;
    float _2297 = _2141;
    float _2299 = _2123;
    float _2301 = _2135;
    float _2303 = _2117;
    float _2305 = _2149;
    float _2307 = _2129;
    float _2309 = fma(_1791, -0.5, 0.5);
    float _2311 = precise::clamp(_2309, 0.0, 1.0);
    float _2313 = -_2297;
    float _2315 = _2299 + _2313;
    float _2317 = -_2301;
    float _2319 = _2303 + _2317;
    float _2321 = -_2305;
    float _2323 = _2307 + _2321;
    bool _2325 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2327 = fma(_2311, _2315, _2297);
    float _2329 = fma(_2311, _2319, _2301);
    float _2331 = fma(_2311, _2323, _2305);
    float _2333 = _2327 * 0.586610972881317138671875;
    out.m_46.x = 1.0;
    float _2335 = fma(_2329, 0.298911988735198974609375, _2333);
    float _2337 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2339 = fma(_2331, 0.114477999508380889892578125, _2335);
    out.m_88.w = _2337;
    float _2341 = -_2339;
    float _2343 = _2329 + _2341;
    float _2345 = -_2339;
    float _2347 = _2327 + _2345;
    float _2349 = -_2339;
    float _2351 = _2331 + _2349;
    out.m_90.x = 0.0;
    float _2353 = fma(_2343, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2339);
    float _2355 = fma(_2347, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2339);
    float _2357 = fma(_2351, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2339);
    out.m_92.x = _2353;
    out.m_92.y = _2355;
    out.m_92.z = _2357;
    if (!_2325)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2359 = -_1983;
    float _2361 = _2359 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2363 = -_1987;
    float _2365 = _2363 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2367 = -_1993;
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
    float _2401 = _1791 * _2391;
    float _2403 = -_2391;
    float _2405 = -_2399;
    float _2407 = fma(_2403, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2405);
    float _2409 = fma(_1789, _2389, _2401);
    float _2411 = -_2397;
    float _2413 = fma(_2411, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2407);
    float _2415 = fma(_1793, _2397, _2409);
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
    out.m_90.x = _2435;
    out.m_90.y = _2437;
    out.m_90.z = _2439;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

