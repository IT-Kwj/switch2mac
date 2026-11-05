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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_60 [[user(locn7)]];
    float4 m_58 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _425 = false;
    bool _279 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1433 = as_type<float>(_107);
        out.gl_Position.z = _1433;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    if (_121)
    {
        float _129 = float(_91);
        _127 = _129;
    }
    float _131 = _127;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    if (_137)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _101;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1501 = as_type<float>(_143);
        out.gl_Position.z = _1501;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_49.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = in.m_51.x;
    float _153 = in.m_51.y;
    float _155 = in.m_51.z;
    float _157 = _149 * _147;
    float _159 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _161 = floor(_159);
    int _163 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _165 = _163 != 0;
    float _167 = _159 * 6.283185482025146484375;
    float _169 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _173 = _171 != 0;
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _177 = _175 != 0;
    float _179 = _167 * 0.15915493667125701904296875;
    float _181 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _185 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _169);
    bool _187 = !_173;
    int _189 = _187 ? 0 : 1;
    float _191 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = _179 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _183);
    bool _199 = !_165;
    int _201 = _199 ? 0 : 1;
    float _203 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _205 = -_161;
    float _207 = _159 + _205;
    int _209 = abs(_189);
    bool _211 = !_177;
    int _213 = _211 ? 0 : 1;
    float _215 = -_207;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _219 = abs(_201);
    float _221 = float(_209);
    bool _223 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _225 = fma(_195, 0.5, 0.5);
    int _227 = abs(_213);
    float _229 = abs(_217);
    float _231 = _221 * _229;
    float _233 = -_225;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _237 = _207 < 0.5;
    float _239 = float(_237);
    float _241 = float(_219);
    float _243 = -_239;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_227);
    float _249 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    float _251 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    float _253 = fma(_241, _235, _231);
    float _255 = abs(_245);
    float _257 = fma(_247, _255, _253);
    bool _259 = !_223;
    float _261 = _251;
    float _277;
    if (!_259)
    {
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_91);
        float _283 = 1.0 / _281;
        float _285 = _125 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = _287 + _289;
    bool _293 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _295 = isnan(_287);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    bool _305 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _307 = isnan(_287);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -_303;
    float _327 = _325 + 1.0;
    float _329 = 1.0 / _319;
    bool _331 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _333 = isnan(_287);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = _315 * _327;
    float _345 = -_315;
    float _347 = _345 + 1.0;
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _351 = _341 * _347;
    float _353 = 1.0 / _323;
    float _355 = -_341;
    float _357 = _355 + 1.0;
    float _359 = _291 * _329;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _363 = _287 + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _369;
    float _373 = fma(_367, _359, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _375 = fma(_371, _359, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _377 = _363 * _353;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = _373 * _351;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = _375 * _351;
    float _391 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _393 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[143].x, _383);
    float _395 = fma(_387, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[143].y, _389);
    float _399 = fma(_391, _343, _393);
    float _401 = fma(_395, _343, _397);
    float _403 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[145].x, _399);
    float _405 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[145].y, _401);
    bool _407 = !_349;
    float _423;
    if (!_407)
    {
        float _409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _411 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _415 = _413 * _409;
        float _417 = floor(_415);
        float _419 = -_417;
        float _421 = _415 + _419;
        _423 = _421;
        _425 = true;
    }
    else
    {
        float _427 = float(_91);
        float _429 = 1.0 / _427;
        float _431 = _125 * _429;
        _423 = _431;
    }
    _425 = false;
    float _433 = _423;
    float _435 = as_type<float>(int(gl_VertexIndex));
    float _437 = in.m_56.x;
    float _439 = in.m_56.y;
    float _441 = in.m_42.x;
    float _443 = in.m_42.y;
    float _445 = in.m_42.z;
    int _447 = as_type<int>(_435) & 1;
    bool _449 = _447 != 0;
    int _451 = as_type<int>(_435) & 2;
    bool _453 = _451 != 0;
    float _455 = _405 * _439;
    float _457 = _403 * _437;
    bool _459 = !_453;
    float _461 = _459 ? (-0.5) : 0.5;
    float _463 = _257 * _455;
    float _465 = _257 * _457;
    bool _467 = !_449;
    float _469 = _467 ? (-0.5) : 0.5;
    float _471 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _461);
    float _473 = _463 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _475 = _465 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _477 = _443 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _479 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _469);
    float _481 = _473 * _471;
    float _483 = _443 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _485 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _477);
    float _487 = _475 * _479;
    float _489 = _481 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _491 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _493 = _481 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _495 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _483);
    float _497 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[26].x, _489);
    float _499 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].z, _485);
    float _501 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[24].x, _493);
    float _503 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].z, _495);
    float _505 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[26].z, _497);
    float _507 = _499 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _509 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[24].z, _501);
    float _511 = _503 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _513 = _505 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _515 = _443 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _517 = _509 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _519 = _481 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _521 = _507 + _513;
    float _523 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _515);
    float _525 = _511 + _517;
    float _527 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[25].x, _519);
    float _529 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _531 = _521 + _529;
    float _533 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].z, _523);
    float _535 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _537 = _525 + _535;
    float _539 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[25].z, _527);
    float _541 = _531 * _531;
    float _543 = _539 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _545 = fma(_537, _537, _541);
    float _547 = _533 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _549 = sqrt(_545);
    float _551 = _547 + _543;
    bool _553 = _549 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _555 = _441;
    float _557 = _445;
    float _559 = _533;
    float _561 = _511;
    if (!_553)
    {
        _555 = _525;
    }
    float _563 = _555;
    float _565 = _563;
    if (!_553)
    {
        _557 = _521;
    }
    float _567 = _557;
    float _569 = _567;
    if (!_553)
    {
        _559 = _551;
    }
    float _571 = _559;
    bool _573 = !_553;
    float _575 = _571;
    if (!_573)
    {
        float _577 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _579 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _581 = _549 + _579;
        float _583 = _551 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _585 = rsqrt(_545);
        float _587 = _581 * _577;
        float _589 = _587 * 0.15915493667125701904296875;
        float _591 = _589 * 6.283185482025146484375;
        float _593 = cos(_591);
        float _595 = _589 * 6.283185482025146484375;
        float _597 = sin(_595);
        float _599 = _593 + (-1.0);
        float _601 = _599 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _603 = fma(_597, _583, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _605 = fma(_551, _593, _601);
        float _607 = _585 * _603;
        float _609 = fma(_537, _607, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _611 = fma(_531, _607, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _575 = _605;
        _565 = _609;
        _569 = _611;
    }
    float _613 = _575;
    float _615 = _565;
    float _617 = _569;
    float _619 = -_547;
    float _621 = _619 + _613;
    float _623 = -_511;
    float _625 = _623 + _615;
    float _627 = -_507;
    float _629 = _627 + _617;
    float _631 = _547 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _633 = _621 * _621;
    float _635 = _547 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _637 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _639 = isnan(0.5);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _645 = _641 || _643;
    float _647 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[11].x, _631);
    float _649 = fma(_625, _625, _633);
    float _651 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[10].x, _635);
    float _653 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[11].z, _647);
    float _655 = fma(_629, _629, _649);
    float _657 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[10].z, _651);
    float _659 = _653 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _661 = sqrt(_655);
    float _663 = _657 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _665 = _613;
    float _667 = _615;
    float _669 = _617;
    float _671 = _655;
    float _673 = _653;
    float _675 = _629;
    if (_645)
    {
        _561 = 1.0;
    }
    float _677 = _561;
    float _679 = _663 + _659;
    float _681 = 1.0 / _659;
    bool _683 = _661 > 0.0;
    float _685 = _679 * _681;
    float _687 = _685 * 0.5;
    bool _689 = !_683;
    float _691 = _677;
    if (!_689)
    {
        float _693 = _249 * _249;
        float _695 = rsqrt(_655);
        float _697 = fma(_203, _203, _693);
        float _699 = fma(_251, _251, _697);
        float _701 = sqrt(_699);
        float _703 = _621 * _695;
        float _705 = _625 * _695;
        float _707 = _629 * _695;
        bool _709 = _701 > 0.0;
        bool _711 = !_709;
        _673 = _701;
        if (!_711)
        {
            float _713 = rsqrt(_699);
            float _715 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _717 = _249 * _713;
            float _719 = _203 * _713;
            float _721 = _703 * _717;
            float _723 = _251 * _713;
            float _725 = fma(_705, _719, _721);
            float _727 = _715 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _729 = fma(_707, _723, _725);
            float _731 = _729 * _727;
            float _733 = fma(_203, _731, _615);
            float _735 = fma(_249, _731, _613);
            float _737 = fma(_251, _731, _617);
            _665 = _735;
            _667 = _733;
            _669 = _737;
            _671 = _723;
            _673 = _727;
        }
    }
    float _739 = _665;
    float _741 = _667;
    float _743 = _669;
    float _745 = _671;
    float _747 = _673;
    float _749 = _745;
    float _751 = _747;
    if (!_645)
    {
        float _753 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _755 = _753 * 0.15915493667125701904296875;
        float _757 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _759 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _761 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[30].w, _759);
        float _763 = _755 * 6.283185482025146484375;
        float _765 = cos(_763);
        float _767 = _757 * 0.15915493667125701904296875;
        float _769 = _755 * 6.283185482025146484375;
        float _771 = sin(_769);
        float _773 = 1.0 / _765;
        float _775 = _767 * 6.283185482025146484375;
        float _777 = cos(_775);
        float _779 = _771 * _773;
        float _781 = _767 * 6.283185482025146484375;
        float _783 = sin(_781);
        float _785 = _777 * _779;
        float _787 = 1.0 / _761;
        float _789 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _791 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _789;
        float _793 = 1.0 / _785;
        float _795 = 1.0 / _791;
        float _797 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _799 = _787 * _797;
        float _801 = _783 * _793;
        float _803 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _805 = fma(_801, _799, _803);
        float _807 = _805 * _795;
        float _809 = precise::clamp(_807, 0.0, 1.0);
        _749 = _795;
        _261 = _767;
        _691 = _809;
    }
    float _811 = _749;
    float _813 = _261;
    float _815 = _691;
    float _817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _819 = _739 + _817;
    float _821 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _823 = _741 + _821;
    float _825 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _827 = _743 + _825;
    float _829 = _819 * _819;
    float _831 = fma(_823, _823, _829);
    float _833 = fma(_827, _827, _831);
    float _835 = rsqrt(_833);
    float _837 = _835 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _839 = _823 * _837;
    float _841 = _827 * _837;
    float _843 = _839 * _839;
    float _845 = _841 * _841;
    float _847 = _843 + _845;
    float _849 = sqrt(_847);
    bool _851 = _849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _853 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _855 = _849 + _853;
    float _857 = _811;
    float _859 = _855;
    float _861 = _819;
    float _863 = _839;
    if (_851)
    {
        float _865 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _857 = _865;
    }
    float _867 = _857;
    float _869 = _867;
    if (_851)
    {
        float _871 = _855 * _867;
        _859 = _871;
    }
    float _873 = _859;
    if (_851)
    {
        float _875 = rsqrt(_847);
        _869 = _875;
    }
    float _877 = _869;
    float _879 = _877;
    if (_851)
    {
        float _881 = _873 * 0.15915493667125701904296875;
        _751 = _881;
    }
    float _883 = _751;
    float _885 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _887 = _827;
    if (_851)
    {
        float _889 = _883 * 6.283185482025146484375;
        float _891 = sin(_889);
        _887 = _891;
    }
    float _893 = _887;
    float _895 = precise::max(0.0, _885);
    float _897 = _813;
    float _899 = _895;
    if (_851)
    {
        float _901 = _883 * 6.283185482025146484375;
        float _903 = cos(_901);
        _897 = _903;
    }
    float _905 = _897;
    float _907 = -_837;
    float _909 = -_895;
    float _911 = fma(_819, _907, _909);
    if (_851)
    {
        float _913 = _911 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _861 = _913;
    }
    float _915 = _861;
    float _917 = sqrt(_833);
    float _919 = _893;
    float _921 = _915;
    if (_851)
    {
        float _923 = fma(_893, _915, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _919 = _923;
    }
    float _925 = _919;
    float _927 = _925;
    if (!_851)
    {
        _921 = _843;
    }
    float _929 = _921;
    float _931 = _929;
    if (_851)
    {
        float _933 = _877 * _925;
        _675 = _933;
    }
    float _935 = _675;
    if (!_851)
    {
        _927 = _911;
    }
    float _937 = _927;
    float _939 = _937;
    float _941 = _905;
    if (_851)
    {
        float _943 = _905 + (-1.0);
        _899 = _943;
    }
    float _945 = _899;
    float _947 = _945;
    if (_851)
    {
        float _949 = _839 * _935;
        _863 = _949;
    }
    float _951 = _863;
    if (_851)
    {
        float _953 = _945 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _879 = _953;
    }
    float _955 = _879;
    if (!_851)
    {
        _947 = _841;
    }
    float _957 = _947;
    float _959 = _957;
    if (_851)
    {
        float _961 = _841 * _935;
        _959 = _961;
    }
    float _963 = _959;
    if (_851)
    {
        float _965 = _951 * _951;
        _931 = _965;
    }
    float _967 = _931;
    if (_851)
    {
        float _969 = fma(_911, _905, _955);
        _939 = _969;
    }
    float _971 = _939;
    if (!_851)
    {
        _941 = _845;
    }
    float _973 = _941;
    float _975 = _973;
    if (_851)
    {
        float _977 = _963 * _963;
        _975 = _977;
    }
    float _979 = _975;
    float _981 = fma(_971, _971, _967);
    float _983 = _739 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _985 = _981 + _979;
    float _987 = _739 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _989 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _991 = fma(_917, (*spvDescriptorSet0.vp_c15)._m0[23].w, _989);
    float _993 = precise::clamp(_991, 0.0, 1.0);
    float _995 = _739 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _997 = rsqrt(_985);
    float _999 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[2].x, _987);
    float _1001 = -_993;
    float _1003 = _1001 + 1.0;
    float _1005 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[1].x, _995);
    float _1007 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1009 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[2].z, _999);
    float _1011 = _739 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1013 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1005);
    float _1015 = abs(_1003);
    float _1017 = log2(_1015);
    float _1019 = _1009 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1021 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1011);
    float _1023 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1025 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[3].x, _983);
    float _1027 = _1019 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1029 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1021);
    float _1031 = _997 * _951;
    float _1033 = _997 * _971;
    float _1035 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1037 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1039 = _1031 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1041 = -_1027;
    float _1043 = fma(_1041, _1007, 1.0);
    float _1045 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1025);
    float _1047 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1037);
    float _1049 = _997 * _963;
    float _1051 = -_1039;
    float _1053 = fma(_1033, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1051);
    float _1055 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1057 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1047);
    float _1059 = _1017 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1061 = -_1049;
    float _1063 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1053);
    float _1065 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1067 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1057);
    float _1069 = log2(_1043);
    float _1071 = fma(_1063, -0.5, 0.5);
    float _1073 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1075 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1065);
    float _1077 = fma(_1063, 0.5, 0.5);
    float _1079 = _1033 + 1.0;
    float _1081 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1073);
    float _1083 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1075);
    float _1085 = 1.0 / _1067;
    float _1087 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1081);
    float _1089 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1083);
    float _1091 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1087);
    float _1093 = exp2(_1059);
    float _1095 = _1069 * 0.693147182464599609375;
    float _1097 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1099 = sqrt(_1071);
    float _1101 = fma(_1077, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1103 = _1089 * _1085;
    float _1105 = fma(_1077, _1101, -0.212114393711090087890625);
    float _1107 = fma(_1103, 0.5, 0.5);
    float _1109 = -_1033;
    float _1111 = fma(_1093, _1079, _1109);
    float _1113 = fma(_1077, _1105, 1.570728778839111328125);
    float _1115 = _1091 * _1085;
    float _1117 = fma(_1111, 0.5, 0.5);
    float _1119 = fma(_1115, -0.5, 0.5);
    float _1121 = _1099 * 0.636619746685028076171875;
    float3 _3061 = float3(_1107, _1119, _1097);
    float _1123 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3061, float3(0.0), isnan(_3061)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3061, float3(0.0), isnan(_3061)), level(0.0)).x;
    float3 _3072 = float3(_1107, _1119, _1097);
    float4 _1126 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3072, float3(0.0), isnan(_3072)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3072, float3(0.0), isnan(_3072)), level(0.0)).xyzw;
    float _1128 = _1126.x;
    float _1130 = _1126.y;
    float _1132 = _1126.z;
    float _1134 = _1126.w;
    float _1136 = -_1113;
    float _1138 = fma(_1121, _1136, 1.0);
    float2 _3094 = float2(_1138, _1117);
    float3 _1142 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3094, float2(0.0), isnan(_3094)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3094, float2(0.0), isnan(_3094)), level(0.0)).xyz;
    float _1144 = _1142.x;
    float _1146 = _1142.y;
    float _1148 = _1142.z;
    float _1150 = in.m_49.y;
    float _1152 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1154;
    float _1158 = _1017 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1160 = _461 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1162 = 1.0 / _1156;
    bool _1164 = _145 > 0.5;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1168 = _433 + _1166;
    out.m_58.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_58.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_58.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1172 = _1170 != 0;
    float _1174 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1152);
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1178 = _1176 != 0;
    out.m_60.x = _741;
    out.m_60.y = _739;
    out.m_60.z = _743;
    bool _1180 = _1150 > 0.5;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1182;
    float _1186 = -_469;
    int _1188 = _1164 ? as_type<int>(_1186) : as_type<int>(_469);
    float _1190 = _1168 * _1162;
    bool _1192 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1194 = isnan(_433);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1206 = fma(_1160, _1160, 1.0);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1208;
    bool _1212 = !_1172;
    float _1214 = _1212 ? _469 : as_type<float>(_1188);
    float _1216 = -_1202;
    float _1218 = _1216 + 1.0;
    bool _1220 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1222 = isnan(_433);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1232;
    float _1236 = rsqrt(_1206);
    float _1238 = fma(_1210, _1190, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1240 = _1214 + 0.5;
    float _1242 = _1230 * _1218;
    float _1244 = -_461;
    int _1246 = _1180 ? as_type<int>(_1244) : as_type<int>(_461);
    float _1248 = fma(_1234, _1190, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1250 = fma(_1184, _1190, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1252 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1254 = _1238 * _1242;
    bool _1256 = !_1178;
    float _1258 = _1256 ? _461 : as_type<float>(_1246);
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1262 = _1248 * _1242;
    float _1264 = _1250 * _1242;
    float _1266 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1174);
    float _1268 = -_1230;
    float _1270 = _1268 + 1.0;
    float _1272 = _1252 * _1204;
    float _1274 = -_1258;
    float _1276 = _1274 + 0.5;
    float _1278 = _1160 * _1236;
    float _1280 = exp2(_1158);
    float _1282 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1262);
    float _1284 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1254);
    float _1286 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1264);
    float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1290 = _1278 * _1288;
    float _1292 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1282);
    float _1294 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1296 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1284);
    float _1298 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1286);
    float _1300 = _1294 * _1260;
    float _1302 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[24].y, _1290);
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1308 = _1278 * _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1312 = _1278 * _1310;
    float _1314 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1266);
    float _1316 = -_1280;
    float _1318 = _1316 + 1.0;
    out.m_62.w = _1304;
    float _1320 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[25].y, _1308);
    float _1322 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[26].y, _1312);
    bool _1324 = _815 > 0.0;
    bool _1326 = isnan(_815);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan(0.0);
    bool _1332 = _1328 || _1330;
    float _1334 = _1292 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1336 = _1296 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_64.x = _1302;
    out.m_64.y = _1320;
    out.m_64.z = _1322;
    float _1338 = _1318 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1340 = _1298 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1342 = _815 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1344 = _1314 + _1067;
    float _1346 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1350 = _1336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1354 = _1344 * 0.5;
    float _1356 = -_1338;
    float _1358 = _1356 + 1.0;
    float _1360 = _1342 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_66.x = _1272;
    out.m_66.y = _1300;
    out.m_68.x = _1346;
    out.m_68.y = _1350;
    out.m_68.z = _1352;
    out.m_68.w = _1348;
    out.gl_Position.x = _1089;
    out.gl_Position.y = _1091;
    out.gl_Position.z = _1314;
    out.gl_Position.w = _1067;
    out.m_70.z = _1354;
    out.m_70.w = _1067;
    out.m_45.x = _1360;
    float _1362 = _1338 * _1123;
    float _1364 = _1134 * _1358;
    float _1366 = _1134 * _1362;
    float _1368 = _1148 * _1362;
    float _1370 = fma(_1144, _1366, _1128);
    float _1372 = fma(_1146, _1366, _1130);
    float _1374 = fma(_1134, _1368, _1132);
    out.m_72.x = _1370;
    out.m_72.y = _1372;
    out.m_72.z = _1374;
    out.m_72.w = _1364;
    if (_1332)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1376 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1376;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _425 = false;
    bool _279 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1433 = as_type<float>(_107);
        out.gl_Position.z = _1433;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    if (_121)
    {
        float _129 = float(_91);
        _127 = _129;
    }
    float _131 = _127;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    if (_137)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _101;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1501 = as_type<float>(_143);
        out.gl_Position.z = _1501;
    }
    if (_137)
    {
        return out;
    }
    float _145 = in.m_49.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = in.m_51.x;
    float _153 = in.m_51.y;
    float _155 = in.m_51.z;
    float _157 = _149 * _147;
    float _159 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _161 = floor(_159);
    int _163 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _165 = _163 != 0;
    float _167 = _159 * 6.283185482025146484375;
    float _169 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _173 = _171 != 0;
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _177 = _175 != 0;
    float _179 = _167 * 0.15915493667125701904296875;
    float _181 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _185 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _169);
    bool _187 = !_173;
    int _189 = _187 ? 0 : 1;
    float _191 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = _179 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _183);
    bool _199 = !_165;
    int _201 = _199 ? 0 : 1;
    float _203 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _205 = -_161;
    float _207 = _159 + _205;
    int _209 = abs(_189);
    bool _211 = !_177;
    int _213 = _211 ? 0 : 1;
    float _215 = -_207;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _219 = abs(_201);
    float _221 = float(_209);
    bool _223 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _225 = fma(_195, 0.5, 0.5);
    int _227 = abs(_213);
    float _229 = abs(_217);
    float _231 = _221 * _229;
    float _233 = -_225;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _237 = _207 < 0.5;
    float _239 = float(_237);
    float _241 = float(_219);
    float _243 = -_239;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_227);
    float _249 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    float _251 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    float _253 = fma(_241, _235, _231);
    float _255 = abs(_245);
    float _257 = fma(_247, _255, _253);
    bool _259 = !_223;
    float _261 = _251;
    float _277;
    if (!_259)
    {
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_91);
        float _283 = 1.0 / _281;
        float _285 = _125 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = _287 + _289;
    bool _293 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _295 = isnan(_287);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    bool _305 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _307 = isnan(_287);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -_303;
    float _327 = _325 + 1.0;
    float _329 = 1.0 / _319;
    bool _331 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _333 = isnan(_287);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = _315 * _327;
    float _345 = -_315;
    float _347 = _345 + 1.0;
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _351 = _341 * _347;
    float _353 = 1.0 / _323;
    float _355 = -_341;
    float _357 = _355 + 1.0;
    float _359 = _291 * _329;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _363 = _287 + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _369;
    float _373 = fma(_367, _359, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _375 = fma(_371, _359, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _377 = _363 * _353;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = _373 * _351;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = _375 * _351;
    float _391 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _393 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[143].x, _383);
    float _395 = fma(_387, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[143].y, _389);
    float _399 = fma(_391, _343, _393);
    float _401 = fma(_395, _343, _397);
    float _403 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[145].x, _399);
    float _405 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[145].y, _401);
    bool _407 = !_349;
    float _423;
    if (!_407)
    {
        float _409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _411 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _415 = _413 * _409;
        float _417 = floor(_415);
        float _419 = -_417;
        float _421 = _415 + _419;
        _423 = _421;
        _425 = true;
    }
    else
    {
        float _427 = float(_91);
        float _429 = 1.0 / _427;
        float _431 = _125 * _429;
        _423 = _431;
    }
    _425 = false;
    float _433 = _423;
    float _435 = as_type<float>(int(gl_VertexIndex));
    float _437 = in.m_56.x;
    float _439 = in.m_56.y;
    float _441 = in.m_42.x;
    float _443 = in.m_42.y;
    float _445 = in.m_42.z;
    int _447 = as_type<int>(_435) & 1;
    bool _449 = _447 != 0;
    int _451 = as_type<int>(_435) & 2;
    bool _453 = _451 != 0;
    float _455 = _405 * _439;
    float _457 = _403 * _437;
    bool _459 = !_453;
    float _461 = _459 ? (-0.5) : 0.5;
    float _463 = _257 * _455;
    float _465 = _257 * _457;
    bool _467 = !_449;
    float _469 = _467 ? (-0.5) : 0.5;
    float _471 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _461);
    float _473 = _463 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _475 = _465 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _477 = _443 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _479 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _469);
    float _481 = _473 * _471;
    float _483 = _443 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _485 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _477);
    float _487 = _475 * _479;
    float _489 = _481 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _491 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _493 = _481 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _495 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _483);
    float _497 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[26].x, _489);
    float _499 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].z, _485);
    float _501 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[24].x, _493);
    float _503 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].z, _495);
    float _505 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[26].z, _497);
    float _507 = _499 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _509 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[24].z, _501);
    float _511 = _503 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _513 = _505 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _515 = _443 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _517 = _509 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _519 = _481 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _521 = _507 + _513;
    float _523 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _515);
    float _525 = _511 + _517;
    float _527 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[25].x, _519);
    float _529 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _531 = _521 + _529;
    float _533 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].z, _523);
    float _535 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _537 = _525 + _535;
    float _539 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[25].z, _527);
    float _541 = _531 * _531;
    float _543 = _539 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _545 = fma(_537, _537, _541);
    float _547 = _533 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _549 = sqrt(_545);
    float _551 = _547 + _543;
    bool _553 = _549 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _555 = _441;
    float _557 = _445;
    float _559 = _533;
    float _561 = _511;
    if (!_553)
    {
        _555 = _525;
    }
    float _563 = _555;
    float _565 = _563;
    if (!_553)
    {
        _557 = _521;
    }
    float _567 = _557;
    float _569 = _567;
    if (!_553)
    {
        _559 = _551;
    }
    float _571 = _559;
    bool _573 = !_553;
    float _575 = _571;
    if (!_573)
    {
        float _577 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _579 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _581 = _549 + _579;
        float _583 = _551 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _585 = rsqrt(_545);
        float _587 = _581 * _577;
        float _589 = _587 * 0.15915493667125701904296875;
        float _591 = _589 * 6.283185482025146484375;
        float _593 = cos(_591);
        float _595 = _589 * 6.283185482025146484375;
        float _597 = sin(_595);
        float _599 = _593 + (-1.0);
        float _601 = _599 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _603 = fma(_597, _583, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _605 = fma(_551, _593, _601);
        float _607 = _585 * _603;
        float _609 = fma(_537, _607, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _611 = fma(_531, _607, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _575 = _605;
        _565 = _609;
        _569 = _611;
    }
    float _613 = _575;
    float _615 = _565;
    float _617 = _569;
    float _619 = -_547;
    float _621 = _619 + _613;
    float _623 = -_511;
    float _625 = _623 + _615;
    float _627 = -_507;
    float _629 = _627 + _617;
    float _631 = _547 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _633 = _621 * _621;
    float _635 = _547 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _637 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _639 = isnan(0.5);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _645 = _641 || _643;
    float _647 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[11].x, _631);
    float _649 = fma(_625, _625, _633);
    float _651 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[10].x, _635);
    float _653 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[11].z, _647);
    float _655 = fma(_629, _629, _649);
    float _657 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[10].z, _651);
    float _659 = _653 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _661 = sqrt(_655);
    float _663 = _657 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _665 = _613;
    float _667 = _615;
    float _669 = _617;
    float _671 = _655;
    float _673 = _653;
    float _675 = _629;
    if (_645)
    {
        _561 = 1.0;
    }
    float _677 = _561;
    float _679 = _663 + _659;
    float _681 = 1.0 / _659;
    bool _683 = _661 > 0.0;
    float _685 = _679 * _681;
    float _687 = _685 * 0.5;
    bool _689 = !_683;
    float _691 = _677;
    if (!_689)
    {
        float _693 = _249 * _249;
        float _695 = rsqrt(_655);
        float _697 = fma(_203, _203, _693);
        float _699 = fma(_251, _251, _697);
        float _701 = sqrt(_699);
        float _703 = _621 * _695;
        float _705 = _625 * _695;
        float _707 = _629 * _695;
        bool _709 = _701 > 0.0;
        bool _711 = !_709;
        _673 = _701;
        if (!_711)
        {
            float _713 = rsqrt(_699);
            float _715 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _717 = _249 * _713;
            float _719 = _203 * _713;
            float _721 = _703 * _717;
            float _723 = _251 * _713;
            float _725 = fma(_705, _719, _721);
            float _727 = _715 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _729 = fma(_707, _723, _725);
            float _731 = _729 * _727;
            float _733 = fma(_203, _731, _615);
            float _735 = fma(_249, _731, _613);
            float _737 = fma(_251, _731, _617);
            _665 = _735;
            _667 = _733;
            _669 = _737;
            _671 = _723;
            _673 = _727;
        }
    }
    float _739 = _665;
    float _741 = _667;
    float _743 = _669;
    float _745 = _671;
    float _747 = _673;
    float _749 = _745;
    float _751 = _747;
    if (!_645)
    {
        float _753 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _755 = _753 * 0.15915493667125701904296875;
        float _757 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _759 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _761 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[30].w, _759);
        float _763 = _755 * 6.283185482025146484375;
        float _765 = cos(_763);
        float _767 = _757 * 0.15915493667125701904296875;
        float _769 = _755 * 6.283185482025146484375;
        float _771 = sin(_769);
        float _773 = 1.0 / _765;
        float _775 = _767 * 6.283185482025146484375;
        float _777 = cos(_775);
        float _779 = _771 * _773;
        float _781 = _767 * 6.283185482025146484375;
        float _783 = sin(_781);
        float _785 = _777 * _779;
        float _787 = 1.0 / _761;
        float _789 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _791 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _789;
        float _793 = 1.0 / _785;
        float _795 = 1.0 / _791;
        float _797 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _799 = _787 * _797;
        float _801 = _783 * _793;
        float _803 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _805 = fma(_801, _799, _803);
        float _807 = _805 * _795;
        float _809 = precise::clamp(_807, 0.0, 1.0);
        _749 = _795;
        _261 = _767;
        _691 = _809;
    }
    float _811 = _749;
    float _813 = _261;
    float _815 = _691;
    float _817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _819 = _739 + _817;
    float _821 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _823 = _741 + _821;
    float _825 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _827 = _743 + _825;
    float _829 = _819 * _819;
    float _831 = fma(_823, _823, _829);
    float _833 = fma(_827, _827, _831);
    float _835 = rsqrt(_833);
    float _837 = _835 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _839 = _823 * _837;
    float _841 = _827 * _837;
    float _843 = _839 * _839;
    float _845 = _841 * _841;
    float _847 = _843 + _845;
    float _849 = sqrt(_847);
    bool _851 = _849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _853 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _855 = _849 + _853;
    float _857 = _811;
    float _859 = _855;
    float _861 = _819;
    float _863 = _839;
    if (_851)
    {
        float _865 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _857 = _865;
    }
    float _867 = _857;
    float _869 = _867;
    if (_851)
    {
        float _871 = _855 * _867;
        _859 = _871;
    }
    float _873 = _859;
    if (_851)
    {
        float _875 = rsqrt(_847);
        _869 = _875;
    }
    float _877 = _869;
    float _879 = _877;
    if (_851)
    {
        float _881 = _873 * 0.15915493667125701904296875;
        _751 = _881;
    }
    float _883 = _751;
    float _885 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _887 = _827;
    if (_851)
    {
        float _889 = _883 * 6.283185482025146484375;
        float _891 = sin(_889);
        _887 = _891;
    }
    float _893 = _887;
    float _895 = precise::max(0.0, _885);
    float _897 = _813;
    float _899 = _895;
    if (_851)
    {
        float _901 = _883 * 6.283185482025146484375;
        float _903 = cos(_901);
        _897 = _903;
    }
    float _905 = _897;
    float _907 = -_837;
    float _909 = -_895;
    float _911 = fma(_819, _907, _909);
    if (_851)
    {
        float _913 = _911 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _861 = _913;
    }
    float _915 = _861;
    float _917 = sqrt(_833);
    float _919 = _893;
    float _921 = _915;
    if (_851)
    {
        float _923 = fma(_893, _915, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _919 = _923;
    }
    float _925 = _919;
    float _927 = _925;
    if (!_851)
    {
        _921 = _843;
    }
    float _929 = _921;
    float _931 = _929;
    if (_851)
    {
        float _933 = _877 * _925;
        _675 = _933;
    }
    float _935 = _675;
    if (!_851)
    {
        _927 = _911;
    }
    float _937 = _927;
    float _939 = _937;
    float _941 = _905;
    if (_851)
    {
        float _943 = _905 + (-1.0);
        _899 = _943;
    }
    float _945 = _899;
    float _947 = _945;
    if (_851)
    {
        float _949 = _839 * _935;
        _863 = _949;
    }
    float _951 = _863;
    if (_851)
    {
        float _953 = _945 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _879 = _953;
    }
    float _955 = _879;
    if (!_851)
    {
        _947 = _841;
    }
    float _957 = _947;
    float _959 = _957;
    if (_851)
    {
        float _961 = _841 * _935;
        _959 = _961;
    }
    float _963 = _959;
    if (_851)
    {
        float _965 = _951 * _951;
        _931 = _965;
    }
    float _967 = _931;
    if (_851)
    {
        float _969 = fma(_911, _905, _955);
        _939 = _969;
    }
    float _971 = _939;
    if (!_851)
    {
        _941 = _845;
    }
    float _973 = _941;
    float _975 = _973;
    if (_851)
    {
        float _977 = _963 * _963;
        _975 = _977;
    }
    float _979 = _975;
    float _981 = fma(_971, _971, _967);
    float _983 = _739 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _985 = _981 + _979;
    float _987 = _739 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _989 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _991 = fma(_917, (*spvDescriptorSet0.vp_c15)._m0[23].w, _989);
    float _993 = precise::clamp(_991, 0.0, 1.0);
    float _995 = _739 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _997 = rsqrt(_985);
    float _999 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[2].x, _987);
    float _1001 = -_993;
    float _1003 = _1001 + 1.0;
    float _1005 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[1].x, _995);
    float _1007 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1009 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[2].z, _999);
    float _1011 = _739 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1013 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1005);
    float _1015 = abs(_1003);
    float _1017 = log2(_1015);
    float _1019 = _1009 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1021 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1011);
    float _1023 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1025 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[3].x, _983);
    float _1027 = _1019 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1029 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1021);
    float _1031 = _997 * _951;
    float _1033 = _997 * _971;
    float _1035 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1037 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1039 = _1031 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1041 = -_1027;
    float _1043 = fma(_1041, _1007, 1.0);
    float _1045 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1025);
    float _1047 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1037);
    float _1049 = _997 * _963;
    float _1051 = -_1039;
    float _1053 = fma(_1033, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1051);
    float _1055 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1057 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1047);
    float _1059 = _1017 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1061 = -_1049;
    float _1063 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1053);
    float _1065 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1067 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1057);
    float _1069 = log2(_1043);
    float _1071 = fma(_1063, -0.5, 0.5);
    float _1073 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1075 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1065);
    float _1077 = fma(_1063, 0.5, 0.5);
    float _1079 = _1033 + 1.0;
    float _1081 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1073);
    float _1083 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1075);
    float _1085 = 1.0 / _1067;
    float _1087 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1081);
    float _1089 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1083);
    float _1091 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1087);
    float _1093 = exp2(_1059);
    float _1095 = _1069 * 0.693147182464599609375;
    float _1097 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1099 = sqrt(_1071);
    float _1101 = fma(_1077, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1103 = _1089 * _1085;
    float _1105 = fma(_1077, _1101, -0.212114393711090087890625);
    float _1107 = fma(_1103, 0.5, 0.5);
    float _1109 = -_1033;
    float _1111 = fma(_1093, _1079, _1109);
    float _1113 = fma(_1077, _1105, 1.570728778839111328125);
    float _1115 = _1091 * _1085;
    float _1117 = fma(_1111, 0.5, 0.5);
    float _1119 = fma(_1115, -0.5, 0.5);
    float _1121 = _1099 * 0.636619746685028076171875;
    float3 _3061 = float3(_1107, _1119, _1097);
    float _1123 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3061, float3(0.0), isnan(_3061)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3061, float3(0.0), isnan(_3061)), level(0.0)).x;
    float3 _3072 = float3(_1107, _1119, _1097);
    float4 _1126 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3072, float3(0.0), isnan(_3072)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3072, float3(0.0), isnan(_3072)), level(0.0)).xyzw;
    float _1128 = _1126.x;
    float _1130 = _1126.y;
    float _1132 = _1126.z;
    float _1134 = _1126.w;
    float _1136 = -_1113;
    float _1138 = fma(_1121, _1136, 1.0);
    float2 _3094 = float2(_1138, _1117);
    float3 _1142 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3094, float2(0.0), isnan(_3094)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3094, float2(0.0), isnan(_3094)), level(0.0)).xyz;
    float _1144 = _1142.x;
    float _1146 = _1142.y;
    float _1148 = _1142.z;
    float _1150 = in.m_49.y;
    float _1152 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1154;
    float _1158 = _1017 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1160 = _461 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1162 = 1.0 / _1156;
    bool _1164 = _145 > 0.5;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1168 = _433 + _1166;
    out.m_58.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_58.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_58.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1172 = _1170 != 0;
    float _1174 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1152);
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1178 = _1176 != 0;
    out.m_60.x = _741;
    out.m_60.y = _739;
    out.m_60.z = _743;
    bool _1180 = _1150 > 0.5;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1182;
    float _1186 = -_469;
    int _1188 = _1164 ? as_type<int>(_1186) : as_type<int>(_469);
    float _1190 = _1168 * _1162;
    bool _1192 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1194 = isnan(_433);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1206 = fma(_1160, _1160, 1.0);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1208;
    bool _1212 = !_1172;
    float _1214 = _1212 ? _469 : as_type<float>(_1188);
    float _1216 = -_1202;
    float _1218 = _1216 + 1.0;
    bool _1220 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1222 = isnan(_433);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1232;
    float _1236 = rsqrt(_1206);
    float _1238 = fma(_1210, _1190, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1240 = _1214 + 0.5;
    float _1242 = _1230 * _1218;
    float _1244 = -_461;
    int _1246 = _1180 ? as_type<int>(_1244) : as_type<int>(_461);
    float _1248 = fma(_1234, _1190, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1250 = fma(_1184, _1190, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1252 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1254 = _1238 * _1242;
    bool _1256 = !_1178;
    float _1258 = _1256 ? _461 : as_type<float>(_1246);
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1262 = _1248 * _1242;
    float _1264 = _1250 * _1242;
    float _1266 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1174);
    float _1268 = -_1230;
    float _1270 = _1268 + 1.0;
    float _1272 = _1252 * _1204;
    float _1274 = -_1258;
    float _1276 = _1274 + 0.5;
    float _1278 = _1160 * _1236;
    float _1280 = exp2(_1158);
    float _1282 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1262);
    float _1284 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1254);
    float _1286 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1264);
    float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1290 = _1278 * _1288;
    float _1292 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1282);
    float _1294 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1296 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1284);
    float _1298 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1286);
    float _1300 = _1294 * _1260;
    float _1302 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[24].y, _1290);
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1308 = _1278 * _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1312 = _1278 * _1310;
    float _1314 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1266);
    float _1316 = -_1280;
    float _1318 = _1316 + 1.0;
    out.m_62.w = _1304;
    float _1320 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[25].y, _1308);
    float _1322 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[26].y, _1312);
    bool _1324 = _815 > 0.0;
    bool _1326 = isnan(_815);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan(0.0);
    bool _1332 = _1328 || _1330;
    float _1334 = _1292 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1336 = _1296 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_64.x = _1302;
    out.m_64.y = _1320;
    out.m_64.z = _1322;
    float _1338 = _1318 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1340 = _1298 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1342 = _815 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1344 = _1314 + _1067;
    float _1346 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1350 = _1336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1354 = _1344 * 0.5;
    float _1356 = -_1338;
    float _1358 = _1356 + 1.0;
    float _1360 = _1342 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_66.x = _1272;
    out.m_66.y = _1300;
    out.m_68.x = _1346;
    out.m_68.y = _1350;
    out.m_68.z = _1352;
    out.m_68.w = _1348;
    out.gl_Position.x = _1089;
    out.gl_Position.y = _1091;
    out.gl_Position.z = _1314;
    out.gl_Position.w = _1067;
    out.m_70.z = _1354;
    out.m_70.w = _1067;
    out.m_45.x = _1360;
    float _1362 = _1338 * _1123;
    float _1364 = _1134 * _1358;
    float _1366 = _1134 * _1362;
    float _1368 = _1148 * _1362;
    float _1370 = fma(_1144, _1366, _1128);
    float _1372 = fma(_1146, _1366, _1130);
    float _1374 = fma(_1134, _1368, _1132);
    out.m_72.x = _1370;
    out.m_72.y = _1372;
    out.m_72.z = _1374;
    out.m_72.w = _1364;
    if (_1332)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1376 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1376;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _425 = false;
    bool _279 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1433 = as_type<float>(_107);
        out.gl_Position.z = _1433;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    if (_121)
    {
        float _129 = float(_91);
        _127 = _129;
    }
    float _131 = _127;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    if (_137)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _101;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1501 = as_type<float>(_143);
        out.gl_Position.z = _1501;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_49.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = in.m_51.x;
    float _153 = in.m_51.y;
    float _155 = in.m_51.z;
    float _157 = _149 * _147;
    float _159 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _161 = floor(_159);
    int _163 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _165 = _163 != 0;
    float _167 = _159 * 6.283185482025146484375;
    float _169 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _173 = _171 != 0;
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _177 = _175 != 0;
    float _179 = _167 * 0.15915493667125701904296875;
    float _181 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _185 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _169);
    bool _187 = !_173;
    int _189 = _187 ? 0 : 1;
    float _191 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = _179 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _183);
    bool _199 = !_165;
    int _201 = _199 ? 0 : 1;
    float _203 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _205 = -_161;
    float _207 = _159 + _205;
    int _209 = abs(_189);
    bool _211 = !_177;
    int _213 = _211 ? 0 : 1;
    float _215 = -_207;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _219 = abs(_201);
    float _221 = float(_209);
    bool _223 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _225 = fma(_195, 0.5, 0.5);
    int _227 = abs(_213);
    float _229 = abs(_217);
    float _231 = _221 * _229;
    float _233 = -_225;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _237 = _207 < 0.5;
    float _239 = float(_237);
    float _241 = float(_219);
    float _243 = -_239;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_227);
    float _249 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    float _251 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    float _253 = fma(_241, _235, _231);
    float _255 = abs(_245);
    float _257 = fma(_247, _255, _253);
    bool _259 = !_223;
    float _261 = _251;
    float _277;
    if (!_259)
    {
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_91);
        float _283 = 1.0 / _281;
        float _285 = _125 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = _287 + _289;
    bool _293 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _295 = isnan(_287);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    bool _305 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _307 = isnan(_287);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -_303;
    float _327 = _325 + 1.0;
    float _329 = 1.0 / _319;
    bool _331 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _333 = isnan(_287);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = _315 * _327;
    float _345 = -_315;
    float _347 = _345 + 1.0;
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _351 = _341 * _347;
    float _353 = 1.0 / _323;
    float _355 = -_341;
    float _357 = _355 + 1.0;
    float _359 = _291 * _329;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _363 = _287 + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _369;
    float _373 = fma(_367, _359, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _375 = fma(_371, _359, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _377 = _363 * _353;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = _373 * _351;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = _375 * _351;
    float _391 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _393 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[143].x, _383);
    float _395 = fma(_387, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[143].y, _389);
    float _399 = fma(_391, _343, _393);
    float _401 = fma(_395, _343, _397);
    float _403 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[145].x, _399);
    float _405 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[145].y, _401);
    bool _407 = !_349;
    float _423;
    if (!_407)
    {
        float _409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _411 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _415 = _413 * _409;
        float _417 = floor(_415);
        float _419 = -_417;
        float _421 = _415 + _419;
        _423 = _421;
        _425 = true;
    }
    else
    {
        float _427 = float(_91);
        float _429 = 1.0 / _427;
        float _431 = _125 * _429;
        _423 = _431;
    }
    _425 = false;
    float _433 = _423;
    float _435 = as_type<float>(int(gl_VertexIndex));
    float _437 = in.m_56.x;
    float _439 = in.m_56.y;
    float _441 = in.m_42.x;
    float _443 = in.m_42.y;
    float _445 = in.m_42.z;
    int _447 = as_type<int>(_435) & 1;
    bool _449 = _447 != 0;
    int _451 = as_type<int>(_435) & 2;
    bool _453 = _451 != 0;
    float _455 = _405 * _439;
    float _457 = _403 * _437;
    bool _459 = !_453;
    float _461 = _459 ? (-0.5) : 0.5;
    float _463 = _257 * _455;
    float _465 = _257 * _457;
    bool _467 = !_449;
    float _469 = _467 ? (-0.5) : 0.5;
    float _471 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _461);
    float _473 = _463 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _475 = _465 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _477 = _443 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _479 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _469);
    float _481 = _473 * _471;
    float _483 = _443 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _485 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _477);
    float _487 = _475 * _479;
    float _489 = _481 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _491 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _493 = _481 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _495 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _483);
    float _497 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[26].x, _489);
    float _499 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].z, _485);
    float _501 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[24].x, _493);
    float _503 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].z, _495);
    float _505 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[26].z, _497);
    float _507 = _499 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _509 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[24].z, _501);
    float _511 = _503 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _513 = _505 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _515 = _443 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _517 = _509 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _519 = _481 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _521 = _507 + _513;
    float _523 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _515);
    float _525 = _511 + _517;
    float _527 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[25].x, _519);
    float _529 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _531 = _521 + _529;
    float _533 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].z, _523);
    float _535 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _537 = _525 + _535;
    float _539 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[25].z, _527);
    float _541 = _531 * _531;
    float _543 = _539 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _545 = fma(_537, _537, _541);
    float _547 = _533 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _549 = sqrt(_545);
    float _551 = _547 + _543;
    bool _553 = _549 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _555 = _441;
    float _557 = _445;
    float _559 = _533;
    float _561 = _511;
    if (!_553)
    {
        _555 = _525;
    }
    float _563 = _555;
    float _565 = _563;
    if (!_553)
    {
        _557 = _521;
    }
    float _567 = _557;
    float _569 = _567;
    if (!_553)
    {
        _559 = _551;
    }
    float _571 = _559;
    bool _573 = !_553;
    float _575 = _571;
    if (!_573)
    {
        float _577 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _579 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _581 = _549 + _579;
        float _583 = _551 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _585 = rsqrt(_545);
        float _587 = _581 * _577;
        float _589 = _587 * 0.15915493667125701904296875;
        float _591 = _589 * 6.283185482025146484375;
        float _593 = cos(_591);
        float _595 = _589 * 6.283185482025146484375;
        float _597 = sin(_595);
        float _599 = _593 + (-1.0);
        float _601 = _599 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _603 = fma(_597, _583, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _605 = fma(_551, _593, _601);
        float _607 = _585 * _603;
        float _609 = fma(_537, _607, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _611 = fma(_531, _607, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _575 = _605;
        _565 = _609;
        _569 = _611;
    }
    float _613 = _575;
    float _615 = _565;
    float _617 = _569;
    float _619 = -_547;
    float _621 = _619 + _613;
    float _623 = -_511;
    float _625 = _623 + _615;
    float _627 = -_507;
    float _629 = _627 + _617;
    float _631 = _547 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _633 = _621 * _621;
    float _635 = _547 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _637 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _639 = isnan(0.5);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _645 = _641 || _643;
    float _647 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[11].x, _631);
    float _649 = fma(_625, _625, _633);
    float _651 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[10].x, _635);
    float _653 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[11].z, _647);
    float _655 = fma(_629, _629, _649);
    float _657 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[10].z, _651);
    float _659 = _653 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _661 = sqrt(_655);
    float _663 = _657 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _665 = _613;
    float _667 = _615;
    float _669 = _617;
    float _671 = _655;
    float _673 = _653;
    float _675 = _629;
    if (_645)
    {
        _561 = 1.0;
    }
    float _677 = _561;
    float _679 = _663 + _659;
    float _681 = 1.0 / _659;
    bool _683 = _661 > 0.0;
    float _685 = _679 * _681;
    float _687 = _685 * 0.5;
    bool _689 = !_683;
    float _691 = _677;
    if (!_689)
    {
        float _693 = _249 * _249;
        float _695 = rsqrt(_655);
        float _697 = fma(_203, _203, _693);
        float _699 = fma(_251, _251, _697);
        float _701 = sqrt(_699);
        float _703 = _621 * _695;
        float _705 = _625 * _695;
        float _707 = _629 * _695;
        bool _709 = _701 > 0.0;
        bool _711 = !_709;
        _673 = _701;
        if (!_711)
        {
            float _713 = rsqrt(_699);
            float _715 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _717 = _249 * _713;
            float _719 = _203 * _713;
            float _721 = _703 * _717;
            float _723 = _251 * _713;
            float _725 = fma(_705, _719, _721);
            float _727 = _715 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _729 = fma(_707, _723, _725);
            float _731 = _729 * _727;
            float _733 = fma(_203, _731, _615);
            float _735 = fma(_249, _731, _613);
            float _737 = fma(_251, _731, _617);
            _665 = _735;
            _667 = _733;
            _669 = _737;
            _671 = _723;
            _673 = _727;
        }
    }
    float _739 = _665;
    float _741 = _667;
    float _743 = _669;
    float _745 = _671;
    float _747 = _673;
    float _749 = _745;
    float _751 = _747;
    if (!_645)
    {
        float _753 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _755 = _753 * 0.15915493667125701904296875;
        float _757 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _759 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _761 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[30].w, _759);
        float _763 = _755 * 6.283185482025146484375;
        float _765 = cos(_763);
        float _767 = _757 * 0.15915493667125701904296875;
        float _769 = _755 * 6.283185482025146484375;
        float _771 = sin(_769);
        float _773 = 1.0 / _765;
        float _775 = _767 * 6.283185482025146484375;
        float _777 = cos(_775);
        float _779 = _771 * _773;
        float _781 = _767 * 6.283185482025146484375;
        float _783 = sin(_781);
        float _785 = _777 * _779;
        float _787 = 1.0 / _761;
        float _789 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _791 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _789;
        float _793 = 1.0 / _785;
        float _795 = 1.0 / _791;
        float _797 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _799 = _787 * _797;
        float _801 = _783 * _793;
        float _803 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _805 = fma(_801, _799, _803);
        float _807 = _805 * _795;
        float _809 = precise::clamp(_807, 0.0, 1.0);
        _749 = _795;
        _261 = _767;
        _691 = _809;
    }
    float _811 = _749;
    float _813 = _261;
    float _815 = _691;
    float _817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _819 = _739 + _817;
    float _821 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _823 = _741 + _821;
    float _825 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _827 = _743 + _825;
    float _829 = _819 * _819;
    float _831 = fma(_823, _823, _829);
    float _833 = fma(_827, _827, _831);
    float _835 = rsqrt(_833);
    float _837 = _835 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _839 = _823 * _837;
    float _841 = _827 * _837;
    float _843 = _839 * _839;
    float _845 = _841 * _841;
    float _847 = _843 + _845;
    float _849 = sqrt(_847);
    bool _851 = _849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _853 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _855 = _849 + _853;
    float _857 = _811;
    float _859 = _855;
    float _861 = _819;
    float _863 = _839;
    if (_851)
    {
        float _865 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _857 = _865;
    }
    float _867 = _857;
    float _869 = _867;
    if (_851)
    {
        float _871 = _855 * _867;
        _859 = _871;
    }
    float _873 = _859;
    if (_851)
    {
        float _875 = rsqrt(_847);
        _869 = _875;
    }
    float _877 = _869;
    float _879 = _877;
    if (_851)
    {
        float _881 = _873 * 0.15915493667125701904296875;
        _751 = _881;
    }
    float _883 = _751;
    float _885 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _887 = _827;
    if (_851)
    {
        float _889 = _883 * 6.283185482025146484375;
        float _891 = sin(_889);
        _887 = _891;
    }
    float _893 = _887;
    float _895 = precise::max(0.0, _885);
    float _897 = _813;
    float _899 = _895;
    if (_851)
    {
        float _901 = _883 * 6.283185482025146484375;
        float _903 = cos(_901);
        _897 = _903;
    }
    float _905 = _897;
    float _907 = -_837;
    float _909 = -_895;
    float _911 = fma(_819, _907, _909);
    if (_851)
    {
        float _913 = _911 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _861 = _913;
    }
    float _915 = _861;
    float _917 = sqrt(_833);
    float _919 = _893;
    float _921 = _915;
    if (_851)
    {
        float _923 = fma(_893, _915, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _919 = _923;
    }
    float _925 = _919;
    float _927 = _925;
    if (!_851)
    {
        _921 = _843;
    }
    float _929 = _921;
    float _931 = _929;
    if (_851)
    {
        float _933 = _877 * _925;
        _675 = _933;
    }
    float _935 = _675;
    if (!_851)
    {
        _927 = _911;
    }
    float _937 = _927;
    float _939 = _937;
    float _941 = _905;
    if (_851)
    {
        float _943 = _905 + (-1.0);
        _899 = _943;
    }
    float _945 = _899;
    float _947 = _945;
    if (_851)
    {
        float _949 = _839 * _935;
        _863 = _949;
    }
    float _951 = _863;
    if (_851)
    {
        float _953 = _945 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _879 = _953;
    }
    float _955 = _879;
    if (!_851)
    {
        _947 = _841;
    }
    float _957 = _947;
    float _959 = _957;
    if (_851)
    {
        float _961 = _841 * _935;
        _959 = _961;
    }
    float _963 = _959;
    if (_851)
    {
        float _965 = _951 * _951;
        _931 = _965;
    }
    float _967 = _931;
    if (_851)
    {
        float _969 = fma(_911, _905, _955);
        _939 = _969;
    }
    float _971 = _939;
    if (!_851)
    {
        _941 = _845;
    }
    float _973 = _941;
    float _975 = _973;
    if (_851)
    {
        float _977 = _963 * _963;
        _975 = _977;
    }
    float _979 = _975;
    float _981 = fma(_971, _971, _967);
    float _983 = _739 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _985 = _981 + _979;
    float _987 = _739 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _989 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _991 = fma(_917, (*spvDescriptorSet0.vp_c15)._m0[23].w, _989);
    float _993 = precise::clamp(_991, 0.0, 1.0);
    float _995 = _739 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _997 = rsqrt(_985);
    float _999 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[2].x, _987);
    float _1001 = -_993;
    float _1003 = _1001 + 1.0;
    float _1005 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[1].x, _995);
    float _1007 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1009 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[2].z, _999);
    float _1011 = _739 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1013 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1005);
    float _1015 = abs(_1003);
    float _1017 = log2(_1015);
    float _1019 = _1009 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1021 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1011);
    float _1023 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1025 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[3].x, _983);
    float _1027 = _1019 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1029 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1021);
    float _1031 = _997 * _951;
    float _1033 = _997 * _971;
    float _1035 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1037 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1039 = _1031 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1041 = -_1027;
    float _1043 = fma(_1041, _1007, 1.0);
    float _1045 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1025);
    float _1047 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1037);
    float _1049 = _997 * _963;
    float _1051 = -_1039;
    float _1053 = fma(_1033, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1051);
    float _1055 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1057 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1047);
    float _1059 = _1017 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1061 = -_1049;
    float _1063 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1053);
    float _1065 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1067 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1057);
    float _1069 = log2(_1043);
    float _1071 = fma(_1063, -0.5, 0.5);
    float _1073 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1075 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1065);
    float _1077 = fma(_1063, 0.5, 0.5);
    float _1079 = _1033 + 1.0;
    float _1081 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1073);
    float _1083 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1075);
    float _1085 = 1.0 / _1067;
    float _1087 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1081);
    float _1089 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1083);
    float _1091 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1087);
    float _1093 = exp2(_1059);
    float _1095 = _1069 * 0.693147182464599609375;
    float _1097 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1099 = sqrt(_1071);
    float _1101 = fma(_1077, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1103 = _1089 * _1085;
    float _1105 = fma(_1077, _1101, -0.212114393711090087890625);
    float _1107 = fma(_1103, 0.5, 0.5);
    float _1109 = -_1033;
    float _1111 = fma(_1093, _1079, _1109);
    float _1113 = fma(_1077, _1105, 1.570728778839111328125);
    float _1115 = _1091 * _1085;
    float _1117 = fma(_1111, 0.5, 0.5);
    float _1119 = fma(_1115, -0.5, 0.5);
    float _1121 = _1099 * 0.636619746685028076171875;
    float3 _3061 = float3(_1107, _1119, _1097);
    float _1123 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3061, float3(0.0), isnan(_3061)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3061, float3(0.0), isnan(_3061)), level(0.0)).x;
    float3 _3072 = float3(_1107, _1119, _1097);
    float4 _1126 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3072, float3(0.0), isnan(_3072)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3072, float3(0.0), isnan(_3072)), level(0.0)).xyzw;
    float _1128 = _1126.x;
    float _1130 = _1126.y;
    float _1132 = _1126.z;
    float _1134 = _1126.w;
    float _1136 = -_1113;
    float _1138 = fma(_1121, _1136, 1.0);
    float2 _3094 = float2(_1138, _1117);
    float3 _1142 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3094, float2(0.0), isnan(_3094)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3094, float2(0.0), isnan(_3094)), level(0.0)).xyz;
    float _1144 = _1142.x;
    float _1146 = _1142.y;
    float _1148 = _1142.z;
    float _1150 = in.m_49.y;
    float _1152 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1154;
    float _1158 = _1017 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1160 = _461 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1162 = 1.0 / _1156;
    bool _1164 = _145 > 0.5;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1168 = _433 + _1166;
    out.m_58.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_58.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_58.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1172 = _1170 != 0;
    float _1174 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1152);
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1178 = _1176 != 0;
    out.m_60.x = _741;
    out.m_60.y = _739;
    out.m_60.z = _743;
    bool _1180 = _1150 > 0.5;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1182;
    float _1186 = -_469;
    int _1188 = _1164 ? as_type<int>(_1186) : as_type<int>(_469);
    float _1190 = _1168 * _1162;
    bool _1192 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1194 = isnan(_433);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1206 = fma(_1160, _1160, 1.0);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1208;
    bool _1212 = !_1172;
    float _1214 = _1212 ? _469 : as_type<float>(_1188);
    float _1216 = -_1202;
    float _1218 = _1216 + 1.0;
    bool _1220 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1222 = isnan(_433);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1232;
    float _1236 = rsqrt(_1206);
    float _1238 = fma(_1210, _1190, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1240 = _1214 + 0.5;
    float _1242 = _1230 * _1218;
    float _1244 = -_461;
    int _1246 = _1180 ? as_type<int>(_1244) : as_type<int>(_461);
    float _1248 = fma(_1234, _1190, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1250 = fma(_1184, _1190, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1252 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1254 = _1238 * _1242;
    bool _1256 = !_1178;
    float _1258 = _1256 ? _461 : as_type<float>(_1246);
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1262 = _1248 * _1242;
    float _1264 = _1250 * _1242;
    float _1266 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1174);
    float _1268 = -_1230;
    float _1270 = _1268 + 1.0;
    float _1272 = _1252 * _1204;
    float _1274 = -_1258;
    float _1276 = _1274 + 0.5;
    float _1278 = _1160 * _1236;
    float _1280 = exp2(_1158);
    float _1282 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1262);
    float _1284 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1254);
    float _1286 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1264);
    float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1290 = _1278 * _1288;
    float _1292 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1282);
    float _1294 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1296 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1284);
    float _1298 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1286);
    float _1300 = _1294 * _1260;
    float _1302 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[24].y, _1290);
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1308 = _1278 * _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1312 = _1278 * _1310;
    float _1314 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1266);
    float _1316 = -_1280;
    float _1318 = _1316 + 1.0;
    out.m_62.w = _1304;
    float _1320 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[25].y, _1308);
    float _1322 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[26].y, _1312);
    bool _1324 = _815 > 0.0;
    bool _1326 = isnan(_815);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan(0.0);
    bool _1332 = _1328 || _1330;
    float _1334 = _1292 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1336 = _1296 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_64.x = _1302;
    out.m_64.y = _1320;
    out.m_64.z = _1322;
    float _1338 = _1318 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1340 = _1298 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1342 = _815 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1344 = _1314 + _1067;
    float _1346 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1350 = _1336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1354 = _1344 * 0.5;
    float _1356 = -_1338;
    float _1358 = _1356 + 1.0;
    float _1360 = _1342 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_66.x = _1272;
    out.m_66.y = _1300;
    out.m_68.x = _1346;
    out.m_68.y = _1350;
    out.m_68.z = _1352;
    out.m_68.w = _1348;
    out.gl_Position.x = _1089;
    out.gl_Position.y = _1091;
    out.gl_Position.z = _1314;
    out.gl_Position.w = _1067;
    out.m_70.z = _1354;
    out.m_70.w = _1067;
    out.m_45.x = _1360;
    float _1362 = _1338 * _1123;
    float _1364 = _1134 * _1358;
    float _1366 = _1134 * _1362;
    float _1368 = _1148 * _1362;
    float _1370 = fma(_1144, _1366, _1128);
    float _1372 = fma(_1146, _1366, _1130);
    float _1374 = fma(_1134, _1368, _1132);
    out.m_72.x = _1370;
    out.m_72.y = _1372;
    out.m_72.z = _1374;
    out.m_72.w = _1364;
    if (_1332)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1376 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1376;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

