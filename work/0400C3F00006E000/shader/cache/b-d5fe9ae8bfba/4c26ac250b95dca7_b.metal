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
    float4 m_62 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_70 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _389 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1358 = as_type<float>(_105);
        out.gl_Position.z = _1358;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    if (_117)
    {
        float _125 = float(_89);
        _123 = _125;
    }
    float _127 = _123;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    if (_133)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _99;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    int _137 = 0;
    if (_133)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1426 = as_type<float>(_141);
        out.gl_Position.z = _1426;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = _147 * _145;
    float _169 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _171 = _169 * 6.283185482025146484375;
    float _173 = floor(_169);
    int _175 = as_type<int>(_149) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_149) & 2;
    bool _181 = _179 != 0;
    float _183 = _171 * 0.15915493667125701904296875;
    bool _185 = !_177;
    float _187 = _185 ? (-0.5) : 0.5;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = _183 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _199 = -_173;
    float _201 = _169 + _199;
    float _203 = _173;
    float _205 = _197;
    if (!_159)
    {
        float _207 = _197 * _197;
        float _209 = _207 * 0.5;
        _203 = _209;
    }
    float _211 = _203;
    bool _213 = !_181;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = _211;
    if (!_159)
    {
        float _219 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _219;
    }
    float _221 = _217;
    bool _223 = !_159;
    float _225 = _221;
    if (!_223)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _197 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _197);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _255;
    }
    float _257 = _225;
    bool _259 = !_159;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _197 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _205 = _279;
    }
    float _281 = _205;
    float _283 = in.m_54.w;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _287 = _285 != 0;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _291 = _289 != 0;
    bool _293 = _201 < 0.5;
    float _295 = float(_293);
    float _297 = -_201;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = fma(_195, 0.5, 0.5);
    float _303 = in.m_42.x;
    float _305 = in.m_42.y;
    float _307 = in.m_42.z;
    bool _309 = !_287;
    int _311 = _309 ? 0 : 1;
    float _313 = -_295;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _317 = !_191;
    int _319 = _317 ? 0 : 1;
    float _321 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _323 = -_301;
    float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _327 = abs(_311);
    int _329 = abs(_319);
    float _331 = fma(_281, _161, _321);
    bool _333 = !_291;
    int _335 = _333 ? 0 : 1;
    float _337 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _341 = fma(_281, _163, _337);
    int _343 = abs(_335);
    float _345 = float(_327);
    float _347 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = float(_329);
    float _351 = abs(_299);
    float _353 = _345 * _351;
    float _355 = fma(_281, _165, _347);
    float _357 = fma(_331, _283, _303);
    float _359 = float(_343);
    float _361 = fma(_349, _325, _353);
    float _363 = fma(_341, _283, _305);
    float _365 = fma(_355, _283, _307);
    float _367 = abs(_315);
    float _369 = fma(_359, _367, _361);
    bool _371 = !_339;
    float _387;
    if (!_371)
    {
        float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _375 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _377 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _379 = _377 * _373;
        float _381 = floor(_379);
        float _383 = -_381;
        float _385 = _379 + _383;
        _387 = _385;
        _389 = true;
    }
    else
    {
        float _391 = float(_89);
        float _393 = 1.0 / _391;
        float _395 = _121 * _393;
        _387 = _395;
    }
    _389 = false;
    float _397 = _387;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _401 = _397 + _399;
    float _403 = in.m_54.x;
    float _405 = in.m_54.y;
    bool _407 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _409 = isnan(_397);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _419;
    float _423 = in.m_56.x;
    float _425 = in.m_56.y;
    float _427 = in.m_56.z;
    float _429 = in.m_56.w;
    bool _431 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _433 = isnan(0.5);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _439 = _435 || _437;
    float _441 = 1.0 / _421;
    bool _443 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _445 = isnan(0.5);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _451 = _447 || _449;
    float _453 = in.m_58.x;
    float _455 = in.m_58.y;
    float _457 = in.m_58.z;
    float _459 = in.m_58.w;
    float _461 = _401 * _441;
    bool _463 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _465 = isnan(_397);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _475;
    float _479 = -_417;
    float _481 = _479 + 1.0;
    float _483 = fma(_477, _461, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _485 = _473 * _481;
    float _487 = -_473;
    float _489 = _487 + 1.0;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _491;
    float _495 = _483 * _485;
    float _497 = in.m_60.x;
    float _499 = in.m_60.y;
    float _501 = in.m_60.z;
    float _503 = in.m_60.w;
    float _505 = fma(_493, _461, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _495);
    float _509 = _505 * _485;
    float _511 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[144].y, _507);
    float _513 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _509);
    float _515 = _511 * _405;
    float _517 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _519 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[144].x, _513);
    float _521 = _363 * _425;
    float _523 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _525 = _519 * _403;
    float _527 = fma(_357, _423, _521);
    float _529 = _523 * _517;
    float _531 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _533 = _525 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _535 = _363 * _455;
    float _537 = _529 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _539 = _529 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _541 = _533 * _531;
    float _543 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _545 = _363 * _499;
    float _547 = fma(_357, _453, _535);
    float _549 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[26].x, _537);
    float _551 = fma(_365, _427, _527);
    float _553 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[24].x, _539);
    float _555 = fma(_365, _457, _547);
    float _557 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[26].z, _549);
    float _559 = _551 + _429;
    float _561 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[24].z, _553);
    float _563 = fma(_357, _497, _545);
    float _565 = _557 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _567 = _555 + _459;
    float _569 = _561 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _571 = fma(_365, _501, _563);
    float _573 = _559 + _565;
    float _575 = _567 + _569;
    float _577 = _571 + _503;
    float _579 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _581 = _573 + _579;
    float _583 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _585 = _575 + _583;
    float _587 = _577 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _589 = _581 * _581;
    float _591 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[11].x, _587);
    float _593 = fma(_585, _585, _589);
    float _595 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[11].z, _591);
    float _597 = sqrt(_593);
    float _599 = _577 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _601 = _595 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _603 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[10].x, _599);
    float _605 = _529 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _607 = 1.0 / _601;
    float _609 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[10].z, _603);
    float _611 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[25].x, _605);
    float _613 = _609 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _615 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[25].z, _611);
    bool _617 = _597 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _619 = _613 + _601;
    float _621 = _615 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _623 = _577 + _621;
    float _625 = _619 * _607;
    float _627 = _625 * 0.5;
    float _629 = _607;
    float _631 = _601;
    float _633 = _621;
    float _635 = _585;
    float _637 = _581;
    float _639 = _623;
    float _641 = _539;
    float _643 = _577;
    if (!_617)
    {
        _629 = _575;
    }
    float _645 = _629;
    float _647 = _645;
    if (!_617)
    {
        _631 = _573;
    }
    float _649 = _631;
    float _651 = _649;
    if (!_617)
    {
        _633 = _623;
    }
    float _653 = _633;
    bool _655 = !_617;
    float _657 = _653;
    if (!_655)
    {
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _661 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _663 = _597 + _661;
        float _665 = _623 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _667 = rsqrt(_593);
        float _669 = _663 * _659;
        float _671 = _669 * 0.15915493667125701904296875;
        float _673 = _671 * 6.283185482025146484375;
        float _675 = cos(_673);
        float _677 = _671 * 6.283185482025146484375;
        float _679 = sin(_677);
        float _681 = _675 + (-1.0);
        float _683 = _681 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _685 = fma(_679, _665, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _687 = fma(_623, _675, _683);
        float _689 = _667 * _685;
        float _691 = fma(_585, _689, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _693 = fma(_581, _689, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _657 = _687;
        _647 = _691;
        _651 = _693;
    }
    float _695 = _657;
    float _697 = _647;
    float _699 = _651;
    float _701 = _695;
    float _703 = _697;
    float _705 = _699;
    if (_451)
    {
        _635 = 1.0;
    }
    float _707 = _635;
    float _709 = _707;
    if (!_439)
    {
        float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _713 = _577 + _711;
        float _715 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _717 = _567 + _715;
        float _719 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _721 = -_577;
        float _723 = _721 + _695;
        float _725 = _713 * _713;
        float _727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _729 = _559 + _727;
        float _731 = fma(_717, _717, _725);
        float _733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _735 = fma(_729, _729, _731);
        float _737 = sqrt(_735);
        float _739 = _719 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _741 = precise::min(_737, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _743 = _741 * _733;
        float _745 = -_567;
        float _747 = _745 + _697;
        float _749 = _739 * _743;
        float _751 = -_559;
        float _753 = _751 + _699;
        float _755 = fma(_747, _749, _567);
        float _757 = fma(_723, _749, _577);
        float _759 = fma(_753, _749, _559);
        _701 = _757;
        _703 = _755;
        _705 = _759;
        _637 = _733;
    }
    float _761 = _701;
    float _763 = _703;
    float _765 = _705;
    float _767 = _637;
    float _769 = _767;
    if (!_451)
    {
        float _771 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _773 = _771 * 0.15915493667125701904296875;
        float _775 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _777 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _779 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[30].w, _777);
        float _781 = _773 * 6.283185482025146484375;
        float _783 = cos(_781);
        float _785 = _775 * 0.15915493667125701904296875;
        float _787 = _773 * 6.283185482025146484375;
        float _789 = sin(_787);
        float _791 = 1.0 / _783;
        float _793 = _785 * 6.283185482025146484375;
        float _795 = cos(_793);
        float _797 = _789 * _791;
        float _799 = _785 * 6.283185482025146484375;
        float _801 = sin(_799);
        float _803 = _795 * _797;
        float _805 = 1.0 / _779;
        float _807 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _809 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _807;
        float _811 = 1.0 / _803;
        float _813 = 1.0 / _809;
        float _815 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _817 = _805 * _815;
        float _819 = _801 * _811;
        float _821 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _823 = fma(_819, _817, _821);
        float _825 = _823 * _813;
        float _827 = precise::clamp(_825, 0.0, 1.0);
        _639 = _773;
        _769 = _785;
        _709 = _827;
    }
    float _829 = _639;
    float _831 = _769;
    float _833 = _709;
    float _835 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _837 = _761 + _835;
    float _839 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _841 = _763 + _839;
    float _843 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _845 = _765 + _843;
    float _847 = _837 * _837;
    float _849 = fma(_841, _841, _847);
    float _851 = fma(_845, _845, _849);
    float _853 = rsqrt(_851);
    float _855 = _853 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _857 = _841 * _855;
    float _859 = _845 * _855;
    float _861 = _857 * _857;
    float _863 = _859 * _859;
    float _865 = _861 + _863;
    float _867 = sqrt(_865);
    bool _869 = _867 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _871 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _873 = _867 + _871;
    float _875 = _853;
    float _877 = _865;
    float _879 = _873;
    float _881 = _829;
    float _883 = _837;
    float _885 = _831;
    if (_869)
    {
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _875 = _887;
    }
    float _889 = _875;
    if (_869)
    {
        float _891 = rsqrt(_865);
        _877 = _891;
    }
    float _893 = _877;
    if (_869)
    {
        float _895 = _873 * _889;
        _879 = _895;
    }
    float _897 = _879;
    if (_869)
    {
        float _899 = _897 * 0.15915493667125701904296875;
        _881 = _899;
    }
    float _901 = _881;
    float _903 = _845;
    if (_869)
    {
        float _905 = _901 * 6.283185482025146484375;
        float _907 = sin(_905);
        _903 = _907;
    }
    float _909 = _903;
    float _911 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _913 = precise::max(0.0, _911);
    float _915 = _889;
    float _917 = _913;
    if (_869)
    {
        float _919 = _901 * 6.283185482025146484375;
        float _921 = cos(_919);
        _915 = _921;
    }
    float _923 = _915;
    float _925 = -_855;
    float _927 = -_913;
    float _929 = fma(_837, _925, _927);
    if (_869)
    {
        float _931 = _929 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _883 = _931;
    }
    float _933 = _883;
    float _935 = _909;
    float _937 = _933;
    if (_869)
    {
        float _939 = fma(_909, _933, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _885 = _939;
    }
    float _941 = _885;
    float _943 = _941;
    if (!_869)
    {
        _935 = _857;
    }
    float _945 = _935;
    float _947 = _945;
    if (!_869)
    {
        _937 = _929;
    }
    float _949 = _937;
    float _951 = _949;
    float _953 = _923;
    if (_869)
    {
        float _955 = _923 + (-1.0);
        _917 = _955;
    }
    float _957 = _917;
    float _959 = _957;
    if (_869)
    {
        float _961 = _893 * _941;
        _641 = _961;
    }
    float _963 = _641;
    if (!_869)
    {
        _943 = _861;
    }
    float _965 = _943;
    float _967 = sqrt(_851);
    float _969 = _965;
    if (_869)
    {
        float _971 = _957 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _643 = _971;
    }
    float _973 = _643;
    if (_869)
    {
        float _975 = _857 * _963;
        _947 = _975;
    }
    float _977 = _947;
    if (!_869)
    {
        _959 = _859;
    }
    float _979 = _959;
    float _981 = _979;
    if (_869)
    {
        float _983 = _859 * _963;
        _981 = _983;
    }
    float _985 = _981;
    if (_869)
    {
        float _987 = fma(_929, _923, _973);
        _951 = _987;
    }
    float _989 = _951;
    if (_869)
    {
        float _991 = _977 * _977;
        _969 = _991;
    }
    float _993 = _969;
    if (!_869)
    {
        _953 = _863;
    }
    float _995 = _953;
    float _997 = _995;
    if (_869)
    {
        float _999 = _985 * _985;
        _997 = _999;
    }
    float _1001 = _997;
    float _1003 = fma(_989, _989, _993);
    float _1005 = _1003 + _1001;
    float _1007 = _761 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1009 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1011 = fma(_967, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1009);
    float _1013 = precise::clamp(_1011, 0.0, 1.0);
    float _1015 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1017 = rsqrt(_1005);
    float _1019 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1007);
    float _1021 = _761 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1023 = -_1013;
    float _1025 = _1023 + 1.0;
    float _1027 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1019);
    float _1029 = _761 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1031 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1021);
    float _1033 = _761 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1035 = abs(_1025);
    float _1037 = log2(_1035);
    float _1039 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1029);
    float _1041 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1031);
    float _1043 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1033);
    float _1045 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1047 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1039);
    float _1049 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1051 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1043);
    float _1053 = _1017 * _977;
    float _1055 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1057 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1059 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1061 = _1017 * _989;
    float _1063 = _1053 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1065 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1057);
    float _1067 = _1045 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1069 = _1017 * _985;
    float _1071 = _1037 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1073 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1065);
    float _1075 = -_1063;
    float _1077 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1075);
    float _1079 = -_1067;
    float _1081 = fma(_1079, _1015, 1.0);
    float _1083 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1085 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1073);
    float _1087 = -_1069;
    float _1089 = fma(_1087, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1077);
    float _1091 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1093 = exp2(_1071);
    float _1095 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1083);
    float _1097 = fma(_1089, -0.5, 0.5);
    float _1099 = fma(_1089, 0.5, 0.5);
    float _1101 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1091);
    float _1103 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1095);
    float _1105 = _1061 + 1.0;
    float _1107 = fma(_1099, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1109 = 1.0 / _1085;
    float _1111 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1101);
    float _1113 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1103);
    float _1115 = fma(_1099, _1107, -0.212114393711090087890625);
    float _1117 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1111);
    float _1119 = fma(_1099, _1115, 1.570728778839111328125);
    float _1121 = log2(_1081);
    float _1123 = -_1061;
    float _1125 = fma(_1093, _1105, _1123);
    float _1127 = sqrt(_1097);
    float _1129 = _1113 * _1109;
    float _1131 = _1117 * _1109;
    float _1133 = fma(_1129, 0.5, 0.5);
    float _1135 = fma(_1131, -0.5, 0.5);
    float _1137 = _1121 * 0.693147182464599609375;
    float _1139 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1141 = _1127 * 0.636619746685028076171875;
    float _1143 = fma(_1125, 0.5, 0.5);
    float3 _2980 = float3(_1133, _1135, _1139);
    float _1145 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2980, float3(0.0), isnan(_2980)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2980, float3(0.0), isnan(_2980)), level(0.0)).x;
    float3 _2991 = float3(_1133, _1135, _1139);
    float4 _1148 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2991, float3(0.0), isnan(_2991)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2991, float3(0.0), isnan(_2991)), level(0.0)).xyzw;
    float _1150 = _1148.x;
    float _1152 = _1148.y;
    float _1154 = _1148.z;
    float _1156 = _1148.w;
    float _1158 = -_1119;
    float _1160 = fma(_1141, _1158, 1.0);
    float2 _3013 = float2(_1160, _1143);
    float3 _1164 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3013, float2(0.0), isnan(_3013)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3013, float2(0.0), isnan(_3013)), level(0.0)).xyz;
    float _1166 = _1164.x;
    float _1168 = _1164.y;
    float _1170 = _1164.z;
    float _1172 = in.m_49.y;
    float _1174 = _1037 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1176 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1178 = _143 > 0.5;
    float _1180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1184 = _1182 != 0;
    float _1186 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1176);
    float _1188 = -_187;
    int _1190 = _1178 ? as_type<int>(_1188) : as_type<int>(_187);
    float _1192 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1186);
    bool _1194 = !_1184;
    float _1196 = _1194 ? _187 : as_type<float>(_1190);
    float _1198 = exp2(_1174);
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1204 = _1202 != 0;
    float _1206 = _1196 + 0.5;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1210 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1214 = _1172 > 0.5;
    float _1216 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1220 = -_1198;
    float _1222 = _1220 + 1.0;
    float _1224 = -_215;
    int _1226 = _1214 ? as_type<int>(_1224) : as_type<int>(_215);
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1236 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1238 = !_1204;
    float _1240 = _1238 ? _215 : as_type<float>(_1226);
    float _1242 = _833 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1244 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1246 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _1210;
    out.m_62.y = _1216;
    out.m_62.z = _1236;
    out.m_62.w = _1212;
    float _1248 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1250 = -_1240;
    float _1252 = _1250 + 0.5;
    float _1254 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1192);
    float _1256 = _369 * _1242;
    bool _1258 = _833 > 0.0;
    bool _1260 = isnan(_833);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan(0.0);
    bool _1266 = _1262 || _1264;
    out.m_64.x = _1244;
    out.m_64.y = _1246;
    out.m_64.z = _1248;
    float _1268 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1270 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.gl_Position.x = _1113;
    out.gl_Position.y = _1117;
    out.gl_Position.z = _1254;
    out.gl_Position.w = _1085;
    float _1272 = _1268 * _1180;
    float _1274 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1276 = _1254 + _1085;
    float _1278 = _1270 * _1218;
    float _1280 = -_1274;
    float _1282 = _1280 + 1.0;
    float _1284 = _1276 * 0.5;
    float _1286 = _1256 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_66.x = _1272;
    out.m_66.y = _1278;
    out.m_68.z = _1284;
    out.m_68.w = _1085;
    out.m_45.x = _1286;
    float _1288 = _1274 * _1145;
    float _1290 = _1156 * _1282;
    float _1292 = _1156 * _1288;
    float _1294 = _1170 * _1288;
    float _1296 = fma(_1166, _1292, _1150);
    float _1298 = fma(_1168, _1292, _1152);
    float _1300 = fma(_1156, _1294, _1154);
    out.m_70.x = _1296;
    out.m_70.y = _1298;
    out.m_70.z = _1300;
    out.m_70.w = _1290;
    if (_1266)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1302 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1302;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _389 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1358 = as_type<float>(_105);
        out.gl_Position.z = _1358;
    }
    if (!_93)
    {
        return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    if (_117)
    {
        float _125 = float(_89);
        _123 = _125;
    }
    float _127 = _123;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    if (_133)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _99;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    int _137 = 0;
    if (_133)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1426 = as_type<float>(_141);
        out.gl_Position.z = _1426;
    }
    if (_133)
    {
        return out;
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = _147 * _145;
    float _169 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _171 = _169 * 6.283185482025146484375;
    float _173 = floor(_169);
    int _175 = as_type<int>(_149) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_149) & 2;
    bool _181 = _179 != 0;
    float _183 = _171 * 0.15915493667125701904296875;
    bool _185 = !_177;
    float _187 = _185 ? (-0.5) : 0.5;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = _183 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _199 = -_173;
    float _201 = _169 + _199;
    float _203 = _173;
    float _205 = _197;
    if (!_159)
    {
        float _207 = _197 * _197;
        float _209 = _207 * 0.5;
        _203 = _209;
    }
    float _211 = _203;
    bool _213 = !_181;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = _211;
    if (!_159)
    {
        float _219 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _219;
    }
    float _221 = _217;
    bool _223 = !_159;
    float _225 = _221;
    if (!_223)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _197 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _197);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _255;
    }
    float _257 = _225;
    bool _259 = !_159;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _197 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _205 = _279;
    }
    float _281 = _205;
    float _283 = in.m_54.w;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _287 = _285 != 0;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _291 = _289 != 0;
    bool _293 = _201 < 0.5;
    float _295 = float(_293);
    float _297 = -_201;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = fma(_195, 0.5, 0.5);
    float _303 = in.m_42.x;
    float _305 = in.m_42.y;
    float _307 = in.m_42.z;
    bool _309 = !_287;
    int _311 = _309 ? 0 : 1;
    float _313 = -_295;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _317 = !_191;
    int _319 = _317 ? 0 : 1;
    float _321 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _323 = -_301;
    float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _327 = abs(_311);
    int _329 = abs(_319);
    float _331 = fma(_281, _161, _321);
    bool _333 = !_291;
    int _335 = _333 ? 0 : 1;
    float _337 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _341 = fma(_281, _163, _337);
    int _343 = abs(_335);
    float _345 = float(_327);
    float _347 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = float(_329);
    float _351 = abs(_299);
    float _353 = _345 * _351;
    float _355 = fma(_281, _165, _347);
    float _357 = fma(_331, _283, _303);
    float _359 = float(_343);
    float _361 = fma(_349, _325, _353);
    float _363 = fma(_341, _283, _305);
    float _365 = fma(_355, _283, _307);
    float _367 = abs(_315);
    float _369 = fma(_359, _367, _361);
    bool _371 = !_339;
    float _387;
    if (!_371)
    {
        float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _375 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _377 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _379 = _377 * _373;
        float _381 = floor(_379);
        float _383 = -_381;
        float _385 = _379 + _383;
        _387 = _385;
        _389 = true;
    }
    else
    {
        float _391 = float(_89);
        float _393 = 1.0 / _391;
        float _395 = _121 * _393;
        _387 = _395;
    }
    _389 = false;
    float _397 = _387;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _401 = _397 + _399;
    float _403 = in.m_54.x;
    float _405 = in.m_54.y;
    bool _407 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _409 = isnan(_397);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _419;
    float _423 = in.m_56.x;
    float _425 = in.m_56.y;
    float _427 = in.m_56.z;
    float _429 = in.m_56.w;
    bool _431 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _433 = isnan(0.5);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _439 = _435 || _437;
    float _441 = 1.0 / _421;
    bool _443 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _445 = isnan(0.5);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _451 = _447 || _449;
    float _453 = in.m_58.x;
    float _455 = in.m_58.y;
    float _457 = in.m_58.z;
    float _459 = in.m_58.w;
    float _461 = _401 * _441;
    bool _463 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _465 = isnan(_397);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _475;
    float _479 = -_417;
    float _481 = _479 + 1.0;
    float _483 = fma(_477, _461, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _485 = _473 * _481;
    float _487 = -_473;
    float _489 = _487 + 1.0;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _491;
    float _495 = _483 * _485;
    float _497 = in.m_60.x;
    float _499 = in.m_60.y;
    float _501 = in.m_60.z;
    float _503 = in.m_60.w;
    float _505 = fma(_493, _461, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _495);
    float _509 = _505 * _485;
    float _511 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[144].y, _507);
    float _513 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _509);
    float _515 = _511 * _405;
    float _517 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _519 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[144].x, _513);
    float _521 = _363 * _425;
    float _523 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _525 = _519 * _403;
    float _527 = fma(_357, _423, _521);
    float _529 = _523 * _517;
    float _531 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _533 = _525 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _535 = _363 * _455;
    float _537 = _529 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _539 = _529 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _541 = _533 * _531;
    float _543 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _545 = _363 * _499;
    float _547 = fma(_357, _453, _535);
    float _549 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[26].x, _537);
    float _551 = fma(_365, _427, _527);
    float _553 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[24].x, _539);
    float _555 = fma(_365, _457, _547);
    float _557 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[26].z, _549);
    float _559 = _551 + _429;
    float _561 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[24].z, _553);
    float _563 = fma(_357, _497, _545);
    float _565 = _557 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _567 = _555 + _459;
    float _569 = _561 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _571 = fma(_365, _501, _563);
    float _573 = _559 + _565;
    float _575 = _567 + _569;
    float _577 = _571 + _503;
    float _579 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _581 = _573 + _579;
    float _583 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _585 = _575 + _583;
    float _587 = _577 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _589 = _581 * _581;
    float _591 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[11].x, _587);
    float _593 = fma(_585, _585, _589);
    float _595 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[11].z, _591);
    float _597 = sqrt(_593);
    float _599 = _577 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _601 = _595 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _603 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[10].x, _599);
    float _605 = _529 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _607 = 1.0 / _601;
    float _609 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[10].z, _603);
    float _611 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[25].x, _605);
    float _613 = _609 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _615 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[25].z, _611);
    bool _617 = _597 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _619 = _613 + _601;
    float _621 = _615 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _623 = _577 + _621;
    float _625 = _619 * _607;
    float _627 = _625 * 0.5;
    float _629 = _607;
    float _631 = _601;
    float _633 = _621;
    float _635 = _585;
    float _637 = _581;
    float _639 = _623;
    float _641 = _539;
    float _643 = _577;
    if (!_617)
    {
        _629 = _575;
    }
    float _645 = _629;
    float _647 = _645;
    if (!_617)
    {
        _631 = _573;
    }
    float _649 = _631;
    float _651 = _649;
    if (!_617)
    {
        _633 = _623;
    }
    float _653 = _633;
    bool _655 = !_617;
    float _657 = _653;
    if (!_655)
    {
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _661 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _663 = _597 + _661;
        float _665 = _623 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _667 = rsqrt(_593);
        float _669 = _663 * _659;
        float _671 = _669 * 0.15915493667125701904296875;
        float _673 = _671 * 6.283185482025146484375;
        float _675 = cos(_673);
        float _677 = _671 * 6.283185482025146484375;
        float _679 = sin(_677);
        float _681 = _675 + (-1.0);
        float _683 = _681 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _685 = fma(_679, _665, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _687 = fma(_623, _675, _683);
        float _689 = _667 * _685;
        float _691 = fma(_585, _689, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _693 = fma(_581, _689, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _657 = _687;
        _647 = _691;
        _651 = _693;
    }
    float _695 = _657;
    float _697 = _647;
    float _699 = _651;
    float _701 = _695;
    float _703 = _697;
    float _705 = _699;
    if (_451)
    {
        _635 = 1.0;
    }
    float _707 = _635;
    float _709 = _707;
    if (!_439)
    {
        float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _713 = _577 + _711;
        float _715 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _717 = _567 + _715;
        float _719 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _721 = -_577;
        float _723 = _721 + _695;
        float _725 = _713 * _713;
        float _727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _729 = _559 + _727;
        float _731 = fma(_717, _717, _725);
        float _733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _735 = fma(_729, _729, _731);
        float _737 = sqrt(_735);
        float _739 = _719 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _741 = precise::min(_737, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _743 = _741 * _733;
        float _745 = -_567;
        float _747 = _745 + _697;
        float _749 = _739 * _743;
        float _751 = -_559;
        float _753 = _751 + _699;
        float _755 = fma(_747, _749, _567);
        float _757 = fma(_723, _749, _577);
        float _759 = fma(_753, _749, _559);
        _701 = _757;
        _703 = _755;
        _705 = _759;
        _637 = _733;
    }
    float _761 = _701;
    float _763 = _703;
    float _765 = _705;
    float _767 = _637;
    float _769 = _767;
    if (!_451)
    {
        float _771 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _773 = _771 * 0.15915493667125701904296875;
        float _775 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _777 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _779 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[30].w, _777);
        float _781 = _773 * 6.283185482025146484375;
        float _783 = cos(_781);
        float _785 = _775 * 0.15915493667125701904296875;
        float _787 = _773 * 6.283185482025146484375;
        float _789 = sin(_787);
        float _791 = 1.0 / _783;
        float _793 = _785 * 6.283185482025146484375;
        float _795 = cos(_793);
        float _797 = _789 * _791;
        float _799 = _785 * 6.283185482025146484375;
        float _801 = sin(_799);
        float _803 = _795 * _797;
        float _805 = 1.0 / _779;
        float _807 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _809 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _807;
        float _811 = 1.0 / _803;
        float _813 = 1.0 / _809;
        float _815 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _817 = _805 * _815;
        float _819 = _801 * _811;
        float _821 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _823 = fma(_819, _817, _821);
        float _825 = _823 * _813;
        float _827 = precise::clamp(_825, 0.0, 1.0);
        _639 = _773;
        _769 = _785;
        _709 = _827;
    }
    float _829 = _639;
    float _831 = _769;
    float _833 = _709;
    float _835 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _837 = _761 + _835;
    float _839 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _841 = _763 + _839;
    float _843 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _845 = _765 + _843;
    float _847 = _837 * _837;
    float _849 = fma(_841, _841, _847);
    float _851 = fma(_845, _845, _849);
    float _853 = rsqrt(_851);
    float _855 = _853 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _857 = _841 * _855;
    float _859 = _845 * _855;
    float _861 = _857 * _857;
    float _863 = _859 * _859;
    float _865 = _861 + _863;
    float _867 = sqrt(_865);
    bool _869 = _867 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _871 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _873 = _867 + _871;
    float _875 = _853;
    float _877 = _865;
    float _879 = _873;
    float _881 = _829;
    float _883 = _837;
    float _885 = _831;
    if (_869)
    {
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _875 = _887;
    }
    float _889 = _875;
    if (_869)
    {
        float _891 = rsqrt(_865);
        _877 = _891;
    }
    float _893 = _877;
    if (_869)
    {
        float _895 = _873 * _889;
        _879 = _895;
    }
    float _897 = _879;
    if (_869)
    {
        float _899 = _897 * 0.15915493667125701904296875;
        _881 = _899;
    }
    float _901 = _881;
    float _903 = _845;
    if (_869)
    {
        float _905 = _901 * 6.283185482025146484375;
        float _907 = sin(_905);
        _903 = _907;
    }
    float _909 = _903;
    float _911 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _913 = precise::max(0.0, _911);
    float _915 = _889;
    float _917 = _913;
    if (_869)
    {
        float _919 = _901 * 6.283185482025146484375;
        float _921 = cos(_919);
        _915 = _921;
    }
    float _923 = _915;
    float _925 = -_855;
    float _927 = -_913;
    float _929 = fma(_837, _925, _927);
    if (_869)
    {
        float _931 = _929 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _883 = _931;
    }
    float _933 = _883;
    float _935 = _909;
    float _937 = _933;
    if (_869)
    {
        float _939 = fma(_909, _933, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _885 = _939;
    }
    float _941 = _885;
    float _943 = _941;
    if (!_869)
    {
        _935 = _857;
    }
    float _945 = _935;
    float _947 = _945;
    if (!_869)
    {
        _937 = _929;
    }
    float _949 = _937;
    float _951 = _949;
    float _953 = _923;
    if (_869)
    {
        float _955 = _923 + (-1.0);
        _917 = _955;
    }
    float _957 = _917;
    float _959 = _957;
    if (_869)
    {
        float _961 = _893 * _941;
        _641 = _961;
    }
    float _963 = _641;
    if (!_869)
    {
        _943 = _861;
    }
    float _965 = _943;
    float _967 = sqrt(_851);
    float _969 = _965;
    if (_869)
    {
        float _971 = _957 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _643 = _971;
    }
    float _973 = _643;
    if (_869)
    {
        float _975 = _857 * _963;
        _947 = _975;
    }
    float _977 = _947;
    if (!_869)
    {
        _959 = _859;
    }
    float _979 = _959;
    float _981 = _979;
    if (_869)
    {
        float _983 = _859 * _963;
        _981 = _983;
    }
    float _985 = _981;
    if (_869)
    {
        float _987 = fma(_929, _923, _973);
        _951 = _987;
    }
    float _989 = _951;
    if (_869)
    {
        float _991 = _977 * _977;
        _969 = _991;
    }
    float _993 = _969;
    if (!_869)
    {
        _953 = _863;
    }
    float _995 = _953;
    float _997 = _995;
    if (_869)
    {
        float _999 = _985 * _985;
        _997 = _999;
    }
    float _1001 = _997;
    float _1003 = fma(_989, _989, _993);
    float _1005 = _1003 + _1001;
    float _1007 = _761 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1009 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1011 = fma(_967, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1009);
    float _1013 = precise::clamp(_1011, 0.0, 1.0);
    float _1015 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1017 = rsqrt(_1005);
    float _1019 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1007);
    float _1021 = _761 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1023 = -_1013;
    float _1025 = _1023 + 1.0;
    float _1027 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1019);
    float _1029 = _761 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1031 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1021);
    float _1033 = _761 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1035 = abs(_1025);
    float _1037 = log2(_1035);
    float _1039 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1029);
    float _1041 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1031);
    float _1043 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1033);
    float _1045 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1047 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1039);
    float _1049 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1051 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1043);
    float _1053 = _1017 * _977;
    float _1055 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1057 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1059 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1061 = _1017 * _989;
    float _1063 = _1053 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1065 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1057);
    float _1067 = _1045 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1069 = _1017 * _985;
    float _1071 = _1037 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1073 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1065);
    float _1075 = -_1063;
    float _1077 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1075);
    float _1079 = -_1067;
    float _1081 = fma(_1079, _1015, 1.0);
    float _1083 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1085 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1073);
    float _1087 = -_1069;
    float _1089 = fma(_1087, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1077);
    float _1091 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1093 = exp2(_1071);
    float _1095 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1083);
    float _1097 = fma(_1089, -0.5, 0.5);
    float _1099 = fma(_1089, 0.5, 0.5);
    float _1101 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1091);
    float _1103 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1095);
    float _1105 = _1061 + 1.0;
    float _1107 = fma(_1099, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1109 = 1.0 / _1085;
    float _1111 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1101);
    float _1113 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1103);
    float _1115 = fma(_1099, _1107, -0.212114393711090087890625);
    float _1117 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1111);
    float _1119 = fma(_1099, _1115, 1.570728778839111328125);
    float _1121 = log2(_1081);
    float _1123 = -_1061;
    float _1125 = fma(_1093, _1105, _1123);
    float _1127 = sqrt(_1097);
    float _1129 = _1113 * _1109;
    float _1131 = _1117 * _1109;
    float _1133 = fma(_1129, 0.5, 0.5);
    float _1135 = fma(_1131, -0.5, 0.5);
    float _1137 = _1121 * 0.693147182464599609375;
    float _1139 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1141 = _1127 * 0.636619746685028076171875;
    float _1143 = fma(_1125, 0.5, 0.5);
    float3 _2980 = float3(_1133, _1135, _1139);
    float _1145 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2980, float3(0.0), isnan(_2980)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2980, float3(0.0), isnan(_2980)), level(0.0)).x;
    float3 _2991 = float3(_1133, _1135, _1139);
    float4 _1148 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2991, float3(0.0), isnan(_2991)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2991, float3(0.0), isnan(_2991)), level(0.0)).xyzw;
    float _1150 = _1148.x;
    float _1152 = _1148.y;
    float _1154 = _1148.z;
    float _1156 = _1148.w;
    float _1158 = -_1119;
    float _1160 = fma(_1141, _1158, 1.0);
    float2 _3013 = float2(_1160, _1143);
    float3 _1164 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3013, float2(0.0), isnan(_3013)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3013, float2(0.0), isnan(_3013)), level(0.0)).xyz;
    float _1166 = _1164.x;
    float _1168 = _1164.y;
    float _1170 = _1164.z;
    float _1172 = in.m_49.y;
    float _1174 = _1037 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1176 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1178 = _143 > 0.5;
    float _1180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1184 = _1182 != 0;
    float _1186 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1176);
    float _1188 = -_187;
    int _1190 = _1178 ? as_type<int>(_1188) : as_type<int>(_187);
    float _1192 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1186);
    bool _1194 = !_1184;
    float _1196 = _1194 ? _187 : as_type<float>(_1190);
    float _1198 = exp2(_1174);
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1204 = _1202 != 0;
    float _1206 = _1196 + 0.5;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1210 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1214 = _1172 > 0.5;
    float _1216 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1220 = -_1198;
    float _1222 = _1220 + 1.0;
    float _1224 = -_215;
    int _1226 = _1214 ? as_type<int>(_1224) : as_type<int>(_215);
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1236 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1238 = !_1204;
    float _1240 = _1238 ? _215 : as_type<float>(_1226);
    float _1242 = _833 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1244 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1246 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _1210;
    out.m_62.y = _1216;
    out.m_62.z = _1236;
    out.m_62.w = _1212;
    float _1248 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1250 = -_1240;
    float _1252 = _1250 + 0.5;
    float _1254 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1192);
    float _1256 = _369 * _1242;
    bool _1258 = _833 > 0.0;
    bool _1260 = isnan(_833);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan(0.0);
    bool _1266 = _1262 || _1264;
    out.m_64.x = _1244;
    out.m_64.y = _1246;
    out.m_64.z = _1248;
    float _1268 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1270 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.gl_Position.x = _1113;
    out.gl_Position.y = _1117;
    out.gl_Position.z = _1254;
    out.gl_Position.w = _1085;
    float _1272 = _1268 * _1180;
    float _1274 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1276 = _1254 + _1085;
    float _1278 = _1270 * _1218;
    float _1280 = -_1274;
    float _1282 = _1280 + 1.0;
    float _1284 = _1276 * 0.5;
    float _1286 = _1256 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_66.x = _1272;
    out.m_66.y = _1278;
    out.m_68.z = _1284;
    out.m_68.w = _1085;
    out.m_45.x = _1286;
    float _1288 = _1274 * _1145;
    float _1290 = _1156 * _1282;
    float _1292 = _1156 * _1288;
    float _1294 = _1170 * _1288;
    float _1296 = fma(_1166, _1292, _1150);
    float _1298 = fma(_1168, _1292, _1152);
    float _1300 = fma(_1156, _1294, _1154);
    out.m_70.x = _1296;
    out.m_70.y = _1298;
    out.m_70.z = _1300;
    out.m_70.w = _1290;
    if (_1266)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1302 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1302;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _389 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1358 = as_type<float>(_105);
        out.gl_Position.z = _1358;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    if (_117)
    {
        float _125 = float(_89);
        _123 = _125;
    }
    float _127 = _123;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    if (_133)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _99;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    int _137 = 0;
    if (_133)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1426 = as_type<float>(_141);
        out.gl_Position.z = _1426;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = _147 * _145;
    float _169 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _171 = _169 * 6.283185482025146484375;
    float _173 = floor(_169);
    int _175 = as_type<int>(_149) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_149) & 2;
    bool _181 = _179 != 0;
    float _183 = _171 * 0.15915493667125701904296875;
    bool _185 = !_177;
    float _187 = _185 ? (-0.5) : 0.5;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = _183 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _199 = -_173;
    float _201 = _169 + _199;
    float _203 = _173;
    float _205 = _197;
    if (!_159)
    {
        float _207 = _197 * _197;
        float _209 = _207 * 0.5;
        _203 = _209;
    }
    float _211 = _203;
    bool _213 = !_181;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = _211;
    if (!_159)
    {
        float _219 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _219;
    }
    float _221 = _217;
    bool _223 = !_159;
    float _225 = _221;
    if (!_223)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _197 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _197);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _255;
    }
    float _257 = _225;
    bool _259 = !_159;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _197 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _205 = _279;
    }
    float _281 = _205;
    float _283 = in.m_54.w;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _287 = _285 != 0;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _291 = _289 != 0;
    bool _293 = _201 < 0.5;
    float _295 = float(_293);
    float _297 = -_201;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = fma(_195, 0.5, 0.5);
    float _303 = in.m_42.x;
    float _305 = in.m_42.y;
    float _307 = in.m_42.z;
    bool _309 = !_287;
    int _311 = _309 ? 0 : 1;
    float _313 = -_295;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _317 = !_191;
    int _319 = _317 ? 0 : 1;
    float _321 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _323 = -_301;
    float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _327 = abs(_311);
    int _329 = abs(_319);
    float _331 = fma(_281, _161, _321);
    bool _333 = !_291;
    int _335 = _333 ? 0 : 1;
    float _337 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _341 = fma(_281, _163, _337);
    int _343 = abs(_335);
    float _345 = float(_327);
    float _347 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = float(_329);
    float _351 = abs(_299);
    float _353 = _345 * _351;
    float _355 = fma(_281, _165, _347);
    float _357 = fma(_331, _283, _303);
    float _359 = float(_343);
    float _361 = fma(_349, _325, _353);
    float _363 = fma(_341, _283, _305);
    float _365 = fma(_355, _283, _307);
    float _367 = abs(_315);
    float _369 = fma(_359, _367, _361);
    bool _371 = !_339;
    float _387;
    if (!_371)
    {
        float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _375 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _377 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _379 = _377 * _373;
        float _381 = floor(_379);
        float _383 = -_381;
        float _385 = _379 + _383;
        _387 = _385;
        _389 = true;
    }
    else
    {
        float _391 = float(_89);
        float _393 = 1.0 / _391;
        float _395 = _121 * _393;
        _387 = _395;
    }
    _389 = false;
    float _397 = _387;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _401 = _397 + _399;
    float _403 = in.m_54.x;
    float _405 = in.m_54.y;
    bool _407 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _409 = isnan(_397);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _419;
    float _423 = in.m_56.x;
    float _425 = in.m_56.y;
    float _427 = in.m_56.z;
    float _429 = in.m_56.w;
    bool _431 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _433 = isnan(0.5);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _439 = _435 || _437;
    float _441 = 1.0 / _421;
    bool _443 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _445 = isnan(0.5);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _451 = _447 || _449;
    float _453 = in.m_58.x;
    float _455 = in.m_58.y;
    float _457 = in.m_58.z;
    float _459 = in.m_58.w;
    float _461 = _401 * _441;
    bool _463 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _465 = isnan(_397);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _475;
    float _479 = -_417;
    float _481 = _479 + 1.0;
    float _483 = fma(_477, _461, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _485 = _473 * _481;
    float _487 = -_473;
    float _489 = _487 + 1.0;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _491;
    float _495 = _483 * _485;
    float _497 = in.m_60.x;
    float _499 = in.m_60.y;
    float _501 = in.m_60.z;
    float _503 = in.m_60.w;
    float _505 = fma(_493, _461, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _495);
    float _509 = _505 * _485;
    float _511 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[144].y, _507);
    float _513 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _509);
    float _515 = _511 * _405;
    float _517 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _519 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[144].x, _513);
    float _521 = _363 * _425;
    float _523 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _525 = _519 * _403;
    float _527 = fma(_357, _423, _521);
    float _529 = _523 * _517;
    float _531 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _533 = _525 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _535 = _363 * _455;
    float _537 = _529 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _539 = _529 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _541 = _533 * _531;
    float _543 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _545 = _363 * _499;
    float _547 = fma(_357, _453, _535);
    float _549 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[26].x, _537);
    float _551 = fma(_365, _427, _527);
    float _553 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[24].x, _539);
    float _555 = fma(_365, _457, _547);
    float _557 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[26].z, _549);
    float _559 = _551 + _429;
    float _561 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[24].z, _553);
    float _563 = fma(_357, _497, _545);
    float _565 = _557 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _567 = _555 + _459;
    float _569 = _561 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _571 = fma(_365, _501, _563);
    float _573 = _559 + _565;
    float _575 = _567 + _569;
    float _577 = _571 + _503;
    float _579 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _581 = _573 + _579;
    float _583 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _585 = _575 + _583;
    float _587 = _577 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _589 = _581 * _581;
    float _591 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[11].x, _587);
    float _593 = fma(_585, _585, _589);
    float _595 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[11].z, _591);
    float _597 = sqrt(_593);
    float _599 = _577 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _601 = _595 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _603 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[10].x, _599);
    float _605 = _529 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _607 = 1.0 / _601;
    float _609 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[10].z, _603);
    float _611 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[25].x, _605);
    float _613 = _609 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _615 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[25].z, _611);
    bool _617 = _597 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _619 = _613 + _601;
    float _621 = _615 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _623 = _577 + _621;
    float _625 = _619 * _607;
    float _627 = _625 * 0.5;
    float _629 = _607;
    float _631 = _601;
    float _633 = _621;
    float _635 = _585;
    float _637 = _581;
    float _639 = _623;
    float _641 = _539;
    float _643 = _577;
    if (!_617)
    {
        _629 = _575;
    }
    float _645 = _629;
    float _647 = _645;
    if (!_617)
    {
        _631 = _573;
    }
    float _649 = _631;
    float _651 = _649;
    if (!_617)
    {
        _633 = _623;
    }
    float _653 = _633;
    bool _655 = !_617;
    float _657 = _653;
    if (!_655)
    {
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _661 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _663 = _597 + _661;
        float _665 = _623 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _667 = rsqrt(_593);
        float _669 = _663 * _659;
        float _671 = _669 * 0.15915493667125701904296875;
        float _673 = _671 * 6.283185482025146484375;
        float _675 = cos(_673);
        float _677 = _671 * 6.283185482025146484375;
        float _679 = sin(_677);
        float _681 = _675 + (-1.0);
        float _683 = _681 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _685 = fma(_679, _665, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _687 = fma(_623, _675, _683);
        float _689 = _667 * _685;
        float _691 = fma(_585, _689, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _693 = fma(_581, _689, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _657 = _687;
        _647 = _691;
        _651 = _693;
    }
    float _695 = _657;
    float _697 = _647;
    float _699 = _651;
    float _701 = _695;
    float _703 = _697;
    float _705 = _699;
    if (_451)
    {
        _635 = 1.0;
    }
    float _707 = _635;
    float _709 = _707;
    if (!_439)
    {
        float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _713 = _577 + _711;
        float _715 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _717 = _567 + _715;
        float _719 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _721 = -_577;
        float _723 = _721 + _695;
        float _725 = _713 * _713;
        float _727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _729 = _559 + _727;
        float _731 = fma(_717, _717, _725);
        float _733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _735 = fma(_729, _729, _731);
        float _737 = sqrt(_735);
        float _739 = _719 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _741 = precise::min(_737, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _743 = _741 * _733;
        float _745 = -_567;
        float _747 = _745 + _697;
        float _749 = _739 * _743;
        float _751 = -_559;
        float _753 = _751 + _699;
        float _755 = fma(_747, _749, _567);
        float _757 = fma(_723, _749, _577);
        float _759 = fma(_753, _749, _559);
        _701 = _757;
        _703 = _755;
        _705 = _759;
        _637 = _733;
    }
    float _761 = _701;
    float _763 = _703;
    float _765 = _705;
    float _767 = _637;
    float _769 = _767;
    if (!_451)
    {
        float _771 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _773 = _771 * 0.15915493667125701904296875;
        float _775 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _777 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _779 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[30].w, _777);
        float _781 = _773 * 6.283185482025146484375;
        float _783 = cos(_781);
        float _785 = _775 * 0.15915493667125701904296875;
        float _787 = _773 * 6.283185482025146484375;
        float _789 = sin(_787);
        float _791 = 1.0 / _783;
        float _793 = _785 * 6.283185482025146484375;
        float _795 = cos(_793);
        float _797 = _789 * _791;
        float _799 = _785 * 6.283185482025146484375;
        float _801 = sin(_799);
        float _803 = _795 * _797;
        float _805 = 1.0 / _779;
        float _807 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _809 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _807;
        float _811 = 1.0 / _803;
        float _813 = 1.0 / _809;
        float _815 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _817 = _805 * _815;
        float _819 = _801 * _811;
        float _821 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _823 = fma(_819, _817, _821);
        float _825 = _823 * _813;
        float _827 = precise::clamp(_825, 0.0, 1.0);
        _639 = _773;
        _769 = _785;
        _709 = _827;
    }
    float _829 = _639;
    float _831 = _769;
    float _833 = _709;
    float _835 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _837 = _761 + _835;
    float _839 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _841 = _763 + _839;
    float _843 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _845 = _765 + _843;
    float _847 = _837 * _837;
    float _849 = fma(_841, _841, _847);
    float _851 = fma(_845, _845, _849);
    float _853 = rsqrt(_851);
    float _855 = _853 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _857 = _841 * _855;
    float _859 = _845 * _855;
    float _861 = _857 * _857;
    float _863 = _859 * _859;
    float _865 = _861 + _863;
    float _867 = sqrt(_865);
    bool _869 = _867 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _871 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _873 = _867 + _871;
    float _875 = _853;
    float _877 = _865;
    float _879 = _873;
    float _881 = _829;
    float _883 = _837;
    float _885 = _831;
    if (_869)
    {
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _875 = _887;
    }
    float _889 = _875;
    if (_869)
    {
        float _891 = rsqrt(_865);
        _877 = _891;
    }
    float _893 = _877;
    if (_869)
    {
        float _895 = _873 * _889;
        _879 = _895;
    }
    float _897 = _879;
    if (_869)
    {
        float _899 = _897 * 0.15915493667125701904296875;
        _881 = _899;
    }
    float _901 = _881;
    float _903 = _845;
    if (_869)
    {
        float _905 = _901 * 6.283185482025146484375;
        float _907 = sin(_905);
        _903 = _907;
    }
    float _909 = _903;
    float _911 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _913 = precise::max(0.0, _911);
    float _915 = _889;
    float _917 = _913;
    if (_869)
    {
        float _919 = _901 * 6.283185482025146484375;
        float _921 = cos(_919);
        _915 = _921;
    }
    float _923 = _915;
    float _925 = -_855;
    float _927 = -_913;
    float _929 = fma(_837, _925, _927);
    if (_869)
    {
        float _931 = _929 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _883 = _931;
    }
    float _933 = _883;
    float _935 = _909;
    float _937 = _933;
    if (_869)
    {
        float _939 = fma(_909, _933, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _885 = _939;
    }
    float _941 = _885;
    float _943 = _941;
    if (!_869)
    {
        _935 = _857;
    }
    float _945 = _935;
    float _947 = _945;
    if (!_869)
    {
        _937 = _929;
    }
    float _949 = _937;
    float _951 = _949;
    float _953 = _923;
    if (_869)
    {
        float _955 = _923 + (-1.0);
        _917 = _955;
    }
    float _957 = _917;
    float _959 = _957;
    if (_869)
    {
        float _961 = _893 * _941;
        _641 = _961;
    }
    float _963 = _641;
    if (!_869)
    {
        _943 = _861;
    }
    float _965 = _943;
    float _967 = sqrt(_851);
    float _969 = _965;
    if (_869)
    {
        float _971 = _957 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _643 = _971;
    }
    float _973 = _643;
    if (_869)
    {
        float _975 = _857 * _963;
        _947 = _975;
    }
    float _977 = _947;
    if (!_869)
    {
        _959 = _859;
    }
    float _979 = _959;
    float _981 = _979;
    if (_869)
    {
        float _983 = _859 * _963;
        _981 = _983;
    }
    float _985 = _981;
    if (_869)
    {
        float _987 = fma(_929, _923, _973);
        _951 = _987;
    }
    float _989 = _951;
    if (_869)
    {
        float _991 = _977 * _977;
        _969 = _991;
    }
    float _993 = _969;
    if (!_869)
    {
        _953 = _863;
    }
    float _995 = _953;
    float _997 = _995;
    if (_869)
    {
        float _999 = _985 * _985;
        _997 = _999;
    }
    float _1001 = _997;
    float _1003 = fma(_989, _989, _993);
    float _1005 = _1003 + _1001;
    float _1007 = _761 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1009 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1011 = fma(_967, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1009);
    float _1013 = precise::clamp(_1011, 0.0, 1.0);
    float _1015 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1017 = rsqrt(_1005);
    float _1019 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1007);
    float _1021 = _761 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1023 = -_1013;
    float _1025 = _1023 + 1.0;
    float _1027 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1019);
    float _1029 = _761 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1031 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1021);
    float _1033 = _761 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1035 = abs(_1025);
    float _1037 = log2(_1035);
    float _1039 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1029);
    float _1041 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1031);
    float _1043 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1033);
    float _1045 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1047 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1039);
    float _1049 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1051 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1043);
    float _1053 = _1017 * _977;
    float _1055 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1057 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1059 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1061 = _1017 * _989;
    float _1063 = _1053 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1065 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1057);
    float _1067 = _1045 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1069 = _1017 * _985;
    float _1071 = _1037 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1073 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1065);
    float _1075 = -_1063;
    float _1077 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1075);
    float _1079 = -_1067;
    float _1081 = fma(_1079, _1015, 1.0);
    float _1083 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1085 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1073);
    float _1087 = -_1069;
    float _1089 = fma(_1087, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1077);
    float _1091 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1093 = exp2(_1071);
    float _1095 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1083);
    float _1097 = fma(_1089, -0.5, 0.5);
    float _1099 = fma(_1089, 0.5, 0.5);
    float _1101 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1091);
    float _1103 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1095);
    float _1105 = _1061 + 1.0;
    float _1107 = fma(_1099, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1109 = 1.0 / _1085;
    float _1111 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1101);
    float _1113 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1103);
    float _1115 = fma(_1099, _1107, -0.212114393711090087890625);
    float _1117 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1111);
    float _1119 = fma(_1099, _1115, 1.570728778839111328125);
    float _1121 = log2(_1081);
    float _1123 = -_1061;
    float _1125 = fma(_1093, _1105, _1123);
    float _1127 = sqrt(_1097);
    float _1129 = _1113 * _1109;
    float _1131 = _1117 * _1109;
    float _1133 = fma(_1129, 0.5, 0.5);
    float _1135 = fma(_1131, -0.5, 0.5);
    float _1137 = _1121 * 0.693147182464599609375;
    float _1139 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1141 = _1127 * 0.636619746685028076171875;
    float _1143 = fma(_1125, 0.5, 0.5);
    float3 _2980 = float3(_1133, _1135, _1139);
    float _1145 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2980, float3(0.0), isnan(_2980)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2980, float3(0.0), isnan(_2980)), level(0.0)).x;
    float3 _2991 = float3(_1133, _1135, _1139);
    float4 _1148 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2991, float3(0.0), isnan(_2991)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2991, float3(0.0), isnan(_2991)), level(0.0)).xyzw;
    float _1150 = _1148.x;
    float _1152 = _1148.y;
    float _1154 = _1148.z;
    float _1156 = _1148.w;
    float _1158 = -_1119;
    float _1160 = fma(_1141, _1158, 1.0);
    float2 _3013 = float2(_1160, _1143);
    float3 _1164 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3013, float2(0.0), isnan(_3013)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3013, float2(0.0), isnan(_3013)), level(0.0)).xyz;
    float _1166 = _1164.x;
    float _1168 = _1164.y;
    float _1170 = _1164.z;
    float _1172 = in.m_49.y;
    float _1174 = _1037 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1176 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1178 = _143 > 0.5;
    float _1180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1184 = _1182 != 0;
    float _1186 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1176);
    float _1188 = -_187;
    int _1190 = _1178 ? as_type<int>(_1188) : as_type<int>(_187);
    float _1192 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1186);
    bool _1194 = !_1184;
    float _1196 = _1194 ? _187 : as_type<float>(_1190);
    float _1198 = exp2(_1174);
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1204 = _1202 != 0;
    float _1206 = _1196 + 0.5;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1210 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1214 = _1172 > 0.5;
    float _1216 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1220 = -_1198;
    float _1222 = _1220 + 1.0;
    float _1224 = -_215;
    int _1226 = _1214 ? as_type<int>(_1224) : as_type<int>(_215);
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1236 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1238 = !_1204;
    float _1240 = _1238 ? _215 : as_type<float>(_1226);
    float _1242 = _833 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1244 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1246 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _1210;
    out.m_62.y = _1216;
    out.m_62.z = _1236;
    out.m_62.w = _1212;
    float _1248 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1250 = -_1240;
    float _1252 = _1250 + 0.5;
    float _1254 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1192);
    float _1256 = _369 * _1242;
    bool _1258 = _833 > 0.0;
    bool _1260 = isnan(_833);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan(0.0);
    bool _1266 = _1262 || _1264;
    out.m_64.x = _1244;
    out.m_64.y = _1246;
    out.m_64.z = _1248;
    float _1268 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1270 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.gl_Position.x = _1113;
    out.gl_Position.y = _1117;
    out.gl_Position.z = _1254;
    out.gl_Position.w = _1085;
    float _1272 = _1268 * _1180;
    float _1274 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1276 = _1254 + _1085;
    float _1278 = _1270 * _1218;
    float _1280 = -_1274;
    float _1282 = _1280 + 1.0;
    float _1284 = _1276 * 0.5;
    float _1286 = _1256 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_66.x = _1272;
    out.m_66.y = _1278;
    out.m_68.z = _1284;
    out.m_68.w = _1085;
    out.m_45.x = _1286;
    float _1288 = _1274 * _1145;
    float _1290 = _1156 * _1282;
    float _1292 = _1156 * _1288;
    float _1294 = _1170 * _1288;
    float _1296 = fma(_1166, _1292, _1150);
    float _1298 = fma(_1168, _1292, _1152);
    float _1300 = fma(_1156, _1294, _1154);
    out.m_70.x = _1296;
    out.m_70.y = _1298;
    out.m_70.z = _1300;
    out.m_70.w = _1290;
    if (_1266)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1302 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1302;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

