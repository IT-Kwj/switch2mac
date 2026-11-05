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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_58 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_60 [[user(locn5)]];
    float4 m_64 [[user(locn6)]];
    float4 m_62 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 m_72 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_52 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _399 = false;
    bool _187 = false;
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
        float _3982 = as_type<float>(_107);
        out.gl_Position.z = _3982;
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
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4052 = as_type<float>(_145);
        out.gl_Position.z = _4052;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _151 = as_type<int>(_147) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_147) & 2;
    bool _157 = _155 != 0;
    bool _159 = !_153;
    float _161 = _159 ? (-0.5) : 0.5;
    bool _163 = !_157;
    float _165 = _163 ? (-0.5) : 0.5;
    bool _167 = !_149;
    float _185;
    if (!_167)
    {
        float _169 = in.m_52.x;
        float _171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _173 = _169 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _175 = fma(_173, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _177 = _175 * _171;
        float _179 = floor(_177);
        float _181 = -_179;
        float _183 = _177 + _181;
        _185 = _183;
        _187 = true;
    }
    else
    {
        float _189 = float(_91);
        float _191 = 1.0 / _189;
        float _193 = _125 * _191;
        _185 = _193;
    }
    _187 = false;
    float _195 = _185;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _199 = _195 + _197;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _203 = _195 + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _195 + _205;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _215 = _213 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _217;
    bool _221 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _223 = isnan(_195);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = 1.0 / _211;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _237 = 1.0 / _219;
    float _239 = 1.0 / _215;
    float _241 = _199 * _233;
    bool _243 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _245 = isnan(_195);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -_231;
    float _257 = _255 + 1.0;
    float _259 = _253 * _257;
    float _261 = _203 * _237;
    bool _263 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _265 = isnan(_195);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = -_253;
    float _277 = _275 + 1.0;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _281 = _279 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _283 = _273 * _277;
    float _285 = -_273;
    float _287 = _285 + 1.0;
    float _289 = _207 * _239;
    bool _291 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _293 = isnan(_195);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _303;
    float _307 = fma(_281, _289, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _317 = fma(_305, _241, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _319 = _301 * _287;
    float _321 = fma(_311, _241, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _323 = fma(_315, _289, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _325 = -_301;
    float _327 = _325 + 1.0;
    float _329 = _317 * _319;
    float _331 = _321 * _319;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _333;
    float _337 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].x, _329);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _339;
    float _343 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].y, _331);
    float _345 = fma(_335, _261, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _347 = fma(_307, _283, _337);
    float _349 = fma(_341, _261, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _351 = fma(_323, _283, _343);
    float _353 = fma(_345, _259, _347);
    float _355 = fma(_349, _259, _351);
    float _357 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[146].x, _353);
    float _359 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[146].y, _355);
    bool _361 = !_235;
    float _363 = _355;
    int _365 = as_type<int>(_351);
    int _367 = as_type<int>(_259);
    float _369 = _323;
    float _393;
    float _395;
    float _397;
    if (!_361)
    {
        float _371 = in.m_52.x;
        float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _375 = float(_91);
        float _377 = 1.0 / _375;
        float _379 = _371 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _381 = _125 * _377;
        float _383 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _385 = _383 * _373;
        float _387 = floor(_385);
        float _389 = -_387;
        float _391 = _385 + _389;
        _363 = _387;
        _393 = _375;
        _395 = _391;
        _397 = _381;
        _399 = true;
    }
    else
    {
        float _401 = float(_91);
        float _403 = 1.0 / _401;
        float _405 = _125 * _403;
        _393 = _401;
        _395 = _405;
        _397 = _405;
    }
    _399 = false;
    float _407 = _363;
    float _409 = _393;
    float _411 = _395;
    float _413 = _397;
    float _415 = in.m_52.w;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _419 = _417 != 0;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _423 = _407;
    float _425 = _307;
    if (_419)
    {
        float _427 = in.m_52.x;
        float _429 = in.m_52.y;
        float _431 = in.m_52.z;
        _421 = _427;
        _423 = _429;
        _425 = _431;
    }
    float _433 = _421;
    float _435 = _423;
    float _437 = _425;
    float _439 = 0.0;
    if (_419)
    {
        _439 = 1.0;
    }
    float _441 = _439;
    float _443 = 0.0;
    float _445 = _441;
    if (_419)
    {
        _443 = 1.0;
    }
    float _447 = _443;
    float _449 = _447;
    if (_419)
    {
        _365 = 0;
    }
    int _451 = _365;
    int _453 = _451;
    if (_419)
    {
        _367 = 0;
    }
    int _455 = _367;
    float _457 = 0.0;
    float _459 = _437;
    float _461 = _433;
    int _463 = _455;
    float _465 = _435;
    if (_419)
    {
        _457 = _433;
    }
    float _467 = _457;
    float _469 = _467;
    if (_419)
    {
        _369 = _437;
    }
    float _471 = _369;
    float _473 = 0.0;
    float _475 = _471;
    if (_419)
    {
        _473 = _467;
    }
    float _477 = _473;
    float _479 = 0.0;
    float _481 = _477;
    if (_419)
    {
        _479 = _435;
    }
    float _483 = _479;
    float _485 = _483;
    if (!_419)
    {
        float _487 = in.m_52.x;
        float _489 = in.m_52.y;
        float _491 = in.m_52.z;
        float _493 = _487 * 3.1415927410125732421875;
        float _495 = _493 * 0.15915493667125701904296875;
        float _497 = _489 * 3.1415927410125732421875;
        float _499 = _497 * 0.15915493667125701904296875;
        float _501 = _491 * 3.1415927410125732421875;
        float _503 = _495 * 6.283185482025146484375;
        float _505 = sin(_503);
        float _507 = _501 * 0.15915493667125701904296875;
        float _509 = _499 * 6.283185482025146484375;
        float _511 = sin(_509);
        float _513 = _507 * 6.283185482025146484375;
        float _515 = sin(_513);
        _459 = _491;
        _453 = 1;
        _461 = _487;
        _463 = 2;
        _465 = _489;
        _475 = _515;
        _481 = _505;
        _485 = _511;
        _449 = 1.2345600128173828125;
        _469 = _489;
        _445 = 7.345489978790283203125;
    }
    float _517 = _459;
    int _519 = _453;
    float _521 = _461;
    int _523 = _463;
    float _525 = _465;
    float _527 = _475;
    float _529 = _481;
    float _531 = _485;
    float _533 = _449;
    float _535 = _469;
    float _537 = _445;
    float _539 = _517 * 2.0;
    bool _541 = _519 != 1;
    float _543 = _521 * 2.0;
    bool _545 = _415 > 0.5;
    float _547 = _521 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _549 = in.m_42.x;
    float _551 = in.m_42.y;
    float _553 = in.m_42.z;
    float _555 = floor(_539);
    bool _557 = _523 != 2;
    float _559 = _525 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _561 = -_165;
    int _563 = _545 ? as_type<int>(_561) : as_type<int>(_165);
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[94].z + (*spvDescriptorSet0.vp_c9)._m0[94].y;
    float _567 = 0.0;
    if (!_541)
    {
        _567 = _517;
    }
    float _569 = _567;
    float _571 = floor(_543);
    float _573 = 0.0;
    float _575 = _569;
    if (!_541)
    {
        _573 = _525;
    }
    float _577 = _573;
    float _579 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[94].z, _565);
    float _581 = 0.0;
    float _583 = _577;
    if (!_541)
    {
        _581 = _569;
    }
    float _585 = _581;
    float _587 = 0.0;
    float _589 = _585;
    if (_557)
    {
        _587 = _525;
    }
    float _591 = _587;
    float _593 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[94].x, _579);
    bool _595 = _555 > 0.0;
    float _597 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _599 = log2(_597);
    bool _601 = _555 >= 0.0;
    bool _603 = isnan(_555);
    bool _605 = _601 || _603;
    bool _607 = isnan(0.0);
    bool _609 = _605 || _607;
    float _611 = 0.0;
    float _613 = _591;
    if (_557)
    {
        _611 = _521;
    }
    float _615 = _611;
    float _617 = _551 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _619 = _551 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _621 = _609 ? 0 : 1;
    float _623 = 1.0 / _409;
    float _625 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[4].x, _617);
    float _627 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[6].x, _619);
    int _629 = ~_621;
    int _631 = _629 + 1;
    int _633 = _631 + 1;
    float _635 = 0.0;
    float _637 = _615;
    int _639 = _633;
    if (!_541)
    {
        _635 = _525;
    }
    float _641 = _635;
    float _643 = fma(_553, (*spvDescriptorSet0.vp_c10)._m0[4].z, _625);
    float _645 = 0.0;
    float _647 = _641;
    if (!_541)
    {
        _645 = _521;
    }
    float _649 = _645;
    float _651 = _649;
    if (!_557)
    {
        _613 = _521;
    }
    float _653 = _613;
    float _655 = _643 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (!_557)
    {
        _637 = _517;
    }
    float _657 = _637;
    if (!_595)
    {
        int _659 = ~_621;
        int _661 = _659 + 1;
        _639 = _661;
    }
    int _663 = _639;
    float _665 = fma(_553, (*spvDescriptorSet0.vp_c10)._m0[6].z, _627);
    if (_541)
    {
        _589 = _525;
    }
    float _667 = _589;
    float _669 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _671 = _655 + _669;
    float _673 = _671;
    if (_541)
    {
        _575 = _525;
    }
    float _675 = _575;
    float _677 = _665 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _679 = _677;
    if (_541)
    {
        _583 = _521;
    }
    float _681 = _583;
    float _683 = _657 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_541)
    {
        _647 = _521;
    }
    float _685 = _647;
    if (_541)
    {
        _651 = _517;
    }
    float _687 = _651;
    int _689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _691 = _689 != 0;
    int _693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _695 = _693 != 0;
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _699 = _697 != 0;
    bool _701 = _517 > 0.5;
    bool _703 = _525 > 0.5;
    int _705 = int(_545);
    int _707 = _595 ? 2 : 0;
    int _709 = _705 | _707;
    int _711 = _701 ? 4 : 0;
    int _713 = _709 | _711;
    int _715 = _691 ? 8 : 0;
    int _717 = _713 | _715;
    int _719 = _695 ? 16 : 0;
    int _721 = _717 | _719;
    int _723 = _699 ? 32 : 0;
    int _725 = _721 | _723;
    int _727 = _703 ? 64 : 0;
    int _729 = _725 | _727;
    int _731 = _729 & 4;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _735 = -_165;
    int _737 = _701 ? as_type<int>(_735) : as_type<int>(_165);
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _741 = !_691;
    float _743 = _741 ? _165 : as_type<float>(_563);
    float _745 = -_677;
    float _747 = _745 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _749 = -_161;
    int _751 = _703 ? as_type<int>(_749) : as_type<int>(_161);
    float _753 = -_733;
    float _755 = fma(_547, 2.0, _753);
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _771 = _769 != 0;
    float _773 = fma(_559, -2.0, _739);
    int _775 = int(_759);
    int _777 = _763 ? 2 : 0;
    int _779 = _775 | _777;
    int _781 = _767 ? 4 : 0;
    int _783 = _779 | _781;
    int _785 = _771 ? 8 : 0;
    int _787 = _783 | _785;
    int _789 = _695 ? 16 : 0;
    int _791 = _787 | _789;
    int _793 = _699 ? 32 : 0;
    int _795 = _791 | _793;
    int _797 = _703 ? 64 : 0;
    int _799 = _795 | _797;
    int _801 = _799 & 64;
    float _803 = _525 * 2.0;
    bool _805 = !_699;
    float _807 = _805 ? _165 : as_type<float>(_737);
    float _809 = -_125;
    float _811 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[76].x, _755);
    bool _813 = !_695;
    float _815 = _813 ? _161 : as_type<float>(_751);
    float _817 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _773);
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _821 = _819 != 0;
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _825 = _823 != 0;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _829 = _827 != 0;
    float _831 = floor(_803);
    float _833 = abs(_671);
    float _835 = abs(_747);
    float _837 = precise::max(_833, _835);
    bool _839 = !_759;
    int _841 = _839 ? 0 : 1;
    bool _843 = !_821;
    int _845 = _843 ? 0 : 1;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _849 = _571 >= 0.0;
    bool _851 = isnan(_571);
    bool _853 = _849 || _851;
    bool _855 = isnan(0.0);
    bool _857 = _853 || _855;
    bool _859 = _837 >= 16.0;
    int _861 = _857 ? 0 : 1;
    bool _863 = _571 > 0.0;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _867 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[93].z, _847);
    float _869 = _529 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _871 = _525 + _517;
    float _873 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[93].w, _865);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _877 = _531 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _879 = _871 + (-1.0);
    float _881 = _517 + _521;
    float _883 = fma(_877, -2.0, _875);
    float _885 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _887 = _881 + (-1.0);
    int _889 = ~_861;
    int _891 = _889 + 1;
    int _893 = _891 + 1;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _897 = _893;
    float _899 = _747;
    if (!_863)
    {
        int _901 = ~_861;
        int _903 = _901 + 1;
        _897 = _903;
    }
    int _905 = _897;
    float _907 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _873);
    bool _909 = _831 >= 0.0;
    bool _911 = isnan(_831);
    bool _913 = _909 || _911;
    bool _915 = isnan(0.0);
    bool _917 = _913 || _915;
    float _919 = -_895;
    float _921 = fma(_869, 2.0, _919);
    float _923 = _525 + _521;
    int _925 = _917 ? 0 : 1;
    float _927 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _883);
    bool _929 = _831 > 0.0;
    float _931 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _933 = _923 + (-1.0);
    if (_859)
    {
        float _935 = _747 * 0.0625;
        _899 = _935;
    }
    float _937 = _899;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _941 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _943 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[83].w, _939);
    float _945 = _599 * _125;
    float _947 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _949 = int(_947);
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _957 = abs(_845);
    float _959 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[84].z, _951);
    float _961 = _681 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _963 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _965 = int(_963);
    int _967 = ~_925;
    int _969 = _967 + 1;
    int _971 = _969 + 1;
    float _973 = -_953;
    float _975 = fma(_961, 2.0, _973);
    float _977 = _667 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _979 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[83].z, _955);
    int _981 = _971;
    if (!_929)
    {
        int _983 = ~_925;
        int _985 = _983 + 1;
        _981 = _985;
    }
    int _987 = _981;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _991 = exp2(_945);
    float _993 = float(_949);
    float _995 = -_989;
    float _997 = fma(_683, 2.0, _995);
    float _999 = _653 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1001 = -_125;
    float _1003 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[91].x, _921);
    float _1005 = float(_663);
    float _1007 = 1.0 / _993;
    float _1009 = float(_957);
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1013 = float(_965);
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1017 = 1.0 + _1015;
    bool _1019 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1021 = isnan(0.0);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1027 = _1023 || _1025;
    float _1029 = _1009 * _1005;
    float _1031 = fma(_977, -2.0, _1011);
    float _1033 = -_991;
    float _1035 = _1033 + 1.0;
    float _1037 = 1.0 / _1013;
    float _1039 = _1029 * (-2.0);
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1043 = 1.0 / _1017;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1049 = _1027 ? _1035 : 0.0;
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1053 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1055 = isnan(1.0);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1061 = _1057 || _1059;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1067 = _1007 * _125;
    float _1069 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1041);
    float _1071 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1031);
    float _1073 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1045);
    float _1075 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1047);
    float _1077 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[84].x, _959);
    float _1079 = _521 + (-0.5);
    float _1081 = fma(_999, -2.0, _1051);
    float _1083 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1063);
    float _1085 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1065);
    float _1087 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _867);
    float _1089 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _979);
    bool _1091 = !_825;
    int _1093 = _1091 ? 0 : 1;
    float _1095 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _943);
    bool _1097 = !_829;
    int _1099 = _1097 ? 0 : 1;
    float _1101 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1069);
    float _1103 = fma(_941, _1039, _941);
    float _1105 = _623 * _125;
    float _1107 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1073);
    float _1109 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1075);
    float _1111 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1113 = _1037 * _125;
    float _1115 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1083);
    float _1117 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1085);
    float _1119 = -_125;
    float _1121 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[81].x, _975);
    float _1123 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1081);
    float _1125 = -_125;
    float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[86].x, _997);
    int _1129 = abs(_1093);
    if (_1061)
    {
        float _1131 = _1049 * _1043;
        _127 = _1131;
    }
    float _1133 = _127;
    int _1135 = abs(_1099);
    float _1137 = _671 * 0.0625;
    bool _1139 = !_763;
    int _1141 = _1139 ? 0 : 1;
    float _1143 = fma(_1103, _1133, _1111);
    bool _1145 = !_767;
    int _1147 = _1145 ? 0 : 1;
    float _1149 = _525 + (-0.5);
    bool _1151 = !_771;
    int _1153 = _1151 ? 0 : 1;
    float _1155 = _1143 * 0.15915493667125701904296875;
    int _1157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1159 = _1157 != 0;
    int _1161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1163 = _1161 != 0;
    int _1165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1167 = _1165 != 0;
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1171 = _1169 != 0;
    float _1173 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1175 = float(_905);
    float _1177 = _1155 * 6.283185482025146484375;
    float _1179 = sin(_1177);
    float _1181 = float(_987);
    float _1183 = float(_1129);
    float _1185 = float(_1135);
    float _1187 = _859 ? _1137 : _671;
    float _1189 = _1183 * _1175;
    bool _1191 = !_1163;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = _1185 * _1181;
    float _1197 = abs(_1187);
    bool _1199 = _1197 != 0.0;
    bool _1201 = isnan(_1197);
    bool _1203 = _1199 || _1201;
    bool _1205 = isnan(0.0);
    bool _1207 = _1203 || _1205;
    float _1209 = _1189 * (-2.0);
    bool _1211 = !_1159;
    int _1213 = _1211 ? 0 : 1;
    float _1215 = _1195 * (-2.0);
    float _1217 = abs(_937);
    bool _1219 = _1217 == 0.0;
    bool _1221 = !_1207;
    bool _1223 = _1219 && _1221;
    float _1225 = in.m_54.x;
    float _1227 = in.m_54.y;
    float _1229 = abs(_937);
    bool _1231 = _1229 == 0.0;
    float _1233 = fma(_885, _1209, _885);
    float _1235 = fma(_931, _1215, _931);
    float _1237 = _1155 * 6.283185482025146484375;
    float _1239 = cos(_1237);
    float _1241 = _517 + (-0.5);
    bool _1243 = !_1167;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = fma(_1233, _1133, _1173);
    bool _1249 = !_1171;
    int _1251 = _1249 ? 0 : 1;
    float _1253 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _1255 = _1167;
    int _1257 = _1135;
    int _1259 = as_type<int>(_1133);
    if (_1223)
    {
        bool _1261 = as_type<int>(_937) >= 0;
        _1255 = _1261;
    }
    bool _1263 = _1255;
    float _1265 = fma(_1235, _1133, _1253);
    int _1267 = _1263 ? (-1) : 0;
    if (_1223)
    {
        int _1269 = _1263 ? 0 : 1078530011;
        _1257 = _1269;
    }
    int _1271 = _1257;
    if (_1223)
    {
        int _1273 = int(0x80000000) & as_type<int>(_1187);
        int _1275 = _1271 | _1273;
        _1259 = _1275;
    }
    int _1277 = _1259;
    bool _1279 = !_1207;
    bool _1281 = _1279 && _1231;
    int _1283 = _1277;
    float _1285 = as_type<float>(_1277);
    if (!_1281)
    {
        float _1287 = abs(_1187);
        bool _1289 = _1287 != as_type<float>(0x7f800000u /* inf */);
        bool _1291 = isnan(_1287);
        bool _1293 = _1289 || _1291;
        bool _1295 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1297 = _1293 || _1295;
        float _1299 = abs(_937);
        bool _1301 = _1299 == as_type<float>(0x7f800000u /* inf */);
        float _1303 = abs(_937);
        bool _1305 = _1303 == as_type<float>(0x7f800000u /* inf */);
        bool _1307 = !_1297;
        bool _1309 = _1305 && _1307;
        if (_1309)
        {
            bool _1311 = as_type<int>(_937) >= 0;
            _1267 = _1311 ? (-1) : 0;
        }
        int _1313 = _1267;
        if (_1309)
        {
            _1283 = 1075235812;
        }
        int _1315 = _1283;
        int _1317 = _1315;
        if (_1309)
        {
            int _1319 = ~_1313;
            int _1321 = (_1319 != 0) ? _1315 : 1061752795;
            _1317 = _1321;
        }
        int _1323 = _1317;
        float _1325 = as_type<float>(_1323);
        if (_1309)
        {
            int _1327 = int(0x80000000) & as_type<int>(_1187);
            int _1329 = _1323 | _1327;
            _1325 = as_type<float>(_1329);
        }
        float _1331 = _1325;
        bool _1333 = !_1297;
        bool _1335 = _1333 && _1301;
        _1285 = _1331;
        if (!_1335)
        {
            float _1337 = abs(_937);
            float _1339 = abs(_1187);
            float _1341 = precise::max(_1337, _1339);
            float _1343 = abs(_937);
            float _1345 = abs(_1187);
            float _1347 = precise::min(_1343, _1345);
            float _1349 = 1.0 / _1341;
            float _1351 = abs(_1187);
            float _1353 = abs(_937);
            bool _1355 = _1351 > _1353;
            bool _1357 = as_type<int>(_937) >= 0;
            float _1359 = abs(_937);
            float _1361 = abs(_1187);
            float _1363 = _1359 + _1361;
            int _1365 = as_type<int>(_1187) & int(0x80000000);
            bool _1367 = _1363 > as_type<float>(0x7f800000u /* inf */);
            bool _1369 = isnan(_1363);
            bool _1371 = _1367 || _1369;
            bool _1373 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1375 = _1371 || _1373;
            float _1377 = _1347 * _1349;
            float _1379 = _1377 * _1377;
            float _1381 = _1379 + 11.33538818359375;
            float _1383 = fma(_1379, _1381, 28.84246826171875);
            float _1385 = fma(_1379, _1383, 19.6966705322265625);
            float _1387 = fma(_1379, -0.82336294651031494140625, -5.674867153167724609375);
            float _1389 = fma(_1379, _1387, -6.565555095672607421875);
            float _1391 = 1.0 / _1385;
            float _1393 = _1379 * _1389;
            float _1395 = _1377 * _1393;
            float _1397 = fma(_1395, _1391, _1377);
            float _1399 = _1397;
            _1285 = _1363;
            if (_1355)
            {
                float _1401 = -_1397;
                float _1403 = _1401 + 1.57079637050628662109375;
                _1399 = _1403;
            }
            float _1405 = _1399;
            int _1407 = as_type<int>(_1405);
            if (!_1357)
            {
                float _1409 = -_1405;
                float _1411 = _1409 + 3.1415927410125732421875;
                _1407 = as_type<int>(_1411);
            }
            int _1413 = _1407;
            if (!_1375)
            {
                int _1415 = _1365 | _1413;
                _1285 = as_type<float>(_1415);
            }
        }
    }
    float _1417 = _1285;
    float _1419 = -_1417;
    float _1421 = _1247 + _1419;
    float _1423 = _1265 * 0.15915493667125701904296875;
    float _1425 = _359 * _1227;
    float _1427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _165);
    float _1429 = _1421 * 0.15915493667125701904296875;
    float _1431 = _1423 * 6.283185482025146484375;
    float _1433 = cos(_1431);
    float _1435 = _1425 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1437 = _551 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1439 = _357 * _1225;
    float _1441 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _161);
    float _1443 = _1427 * _1435;
    float _1445 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1437);
    float _1447 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1449 = _1429 * 6.283185482025146484375;
    float _1451 = sin(_1449);
    float _1453 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1455 = fma(_553, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1445);
    float _1457 = _1441 * _1447;
    bool _1459 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1461 = isnan(0.5);
    bool _1463 = _1459 || _1461;
    bool _1465 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1467 = _1463 || _1465;
    float _1469 = _1455 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1471 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1473 = isnan(0.5);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1479 = _1475 || _1477;
    float _1481 = _1429 * 6.283185482025146484375;
    float _1483 = cos(_1481);
    float _1485 = _1433 * _1443;
    float _1487 = _1179 * _1485;
    float _1489 = _1423 * 6.283185482025146484375;
    float _1491 = sin(_1489);
    float _1493 = _1239 * _1451;
    float _1495 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1497 = _1179 * _1483;
    float _1499 = _1239 * _1483;
    float _1501 = _1483 * _1433;
    float _1503 = -_1493;
    float _1505 = fma(_1491, _1497, _1503);
    float _1507 = -_1443;
    float _1509 = _1491 * _1507;
    float _1511 = -_1497;
    float _1513 = fma(_1491, _1493, _1511);
    float _1515 = fma(_1505, _1457, _1487);
    float _1517 = _1179 * _1451;
    float _1519 = _1451 * _1433;
    float _1521 = fma(_1501, _1457, _1509);
    float _1523 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1495);
    float _1525 = fma(_1491, _1517, _1499);
    float _1527 = fma(_1519, _1453, _1521);
    float _1529 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1523);
    float _1531 = fma(_1525, _1453, _1515);
    float _1533 = fma(_1491, _1499, _1517);
    float _1535 = _655 + _1527;
    float _1537 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1539 = _677 + _1531;
    float _1541 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1543 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1545 = _1535 + _1543;
    float _1547 = 1.0 / _1537;
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1551 = _1539 + _1549;
    float _1553 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1541);
    float _1555 = _1239 * _1485;
    float _1557 = _1551 * _1551;
    float _1559 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1553);
    float _1561 = fma(_1533, _1457, _1555);
    float _1563 = fma(_1545, _1545, _1557);
    float _1565 = _1559 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1567 = fma(_1513, _1453, _1561);
    float _1569 = sqrt(_1563);
    float _1571 = _1565 + _1537;
    float _1573 = _1469 + _1567;
    float _1575 = _1571 * _1547;
    float _1577 = _1575 * 0.5;
    float _1579 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1581 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1579);
    float _1583 = 1.0 / _1581;
    bool _1585 = _1569 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1587 = _1567;
    float _1589 = _1513;
    float _1591 = _1557;
    float _1593 = _1581;
    float _1595 = _1457;
    float _1597 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    bool _1599 = _1479;
    bool _1601 = _1467;
    if (!_1585)
    {
        _1587 = _1535;
    }
    float _1603 = _1587;
    float _1605 = _1603;
    if (!_1585)
    {
        _1589 = _1539;
    }
    float _1607 = _1589;
    float _1609 = _1607;
    if (!_1585)
    {
        _1591 = _1573;
    }
    float _1611 = _1591;
    bool _1613 = !_1585;
    float _1615 = _1611;
    if (!_1613)
    {
        float _1617 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1621 = _1569 + _1619;
        float _1623 = rsqrt(_1563);
        float _1625 = _1621 * _1617;
        float _1627 = _1573 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1629 = _1625 * 0.15915493667125701904296875;
        float _1631 = _1629 * 6.283185482025146484375;
        float _1633 = cos(_1631);
        float _1635 = _1629 * 6.283185482025146484375;
        float _1637 = sin(_1635);
        float _1639 = _1633 + (-1.0);
        float _1641 = fma(_1637, _1627, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1643 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1645 = _1623 * _1641;
        float _1647 = fma(_1573, _1633, _1643);
        float _1649 = fma(_1545, _1645, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1651 = fma(_1551, _1645, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1615 = _1647;
        _1605 = _1649;
        _1609 = _1651;
    }
    float _1653 = _1615;
    float _1655 = _1605;
    float _1657 = _1609;
    float _1659 = _1653;
    float _1661 = _1655;
    float _1663 = _1657;
    if (_1479)
    {
        _1593 = 1.0;
    }
    float _1665 = _1593;
    float _1667 = _1665;
    if (!_1467)
    {
        float _1669 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1671 = _1469 + _1669;
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1675 = -_1469;
        float _1677 = _1675 + _1653;
        float _1679 = _1671 * _1671;
        float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1683 = _677 + _1681;
        float _1685 = fma(_671, _671, _1679);
        float _1687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1689 = fma(_1683, _1683, _1685);
        float _1691 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1693 = sqrt(_1689);
        float _1695 = -_655;
        float _1697 = _1695 + _1655;
        float _1699 = precise::min(_1693, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1701 = _1699 * _1687;
        float _1703 = _1691 * _1701;
        float _1705 = -_677;
        float _1707 = _1705 + _1657;
        float _1709 = fma(_1697, _1703, _655);
        float _1711 = fma(_1677, _1703, _1469);
        float _1713 = fma(_1707, _1703, _677);
        _1659 = _1711;
        _1661 = _1709;
        _1663 = _1713;
        _673 = _1699;
    }
    float _1715 = _1659;
    float _1717 = _1661;
    float _1719 = _1663;
    float _1721 = _673;
    float _1723 = _1721;
    if (_1479)
    {
        _1595 = 1.0;
    }
    float _1725 = _1595;
    float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1729 = _1583 * _1727;
    float _1731 = _1725;
    if (!_1479)
    {
        float _1733 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1735 = _1733 * 0.15915493667125701904296875;
        float _1737 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1739 = _1735 * 6.283185482025146484375;
        float _1741 = cos(_1739);
        float _1743 = _1737 * 0.15915493667125701904296875;
        float _1745 = _1735 * 6.283185482025146484375;
        float _1747 = sin(_1745);
        float _1749 = 1.0 / _1741;
        float _1751 = _1743 * 6.283185482025146484375;
        float _1753 = cos(_1751);
        float _1755 = _1747 * _1749;
        float _1757 = _1743 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        float _1761 = _1753 * _1755;
        float _1763 = 1.0 / _1761;
        float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1767 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1765;
        float _1769 = 1.0 / _1767;
        float _1771 = _1759 * _1763;
        float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1775 = fma(_1729, _1771, _1773);
        float _1777 = _1775 * _1769;
        float _1779 = precise::clamp(_1777, 0.0, 1.0);
        _1723 = _1743;
        _679 = _1749;
        _1667 = _1779;
    }
    float _1781 = _1723;
    float _1783 = _679;
    float _1785 = _1667;
    float _1787 = _1781;
    float _1789 = _1783;
    if (!_1479)
    {
        float _1791 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1793 = _1791 * 0.15915493667125701904296875;
        float _1795 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1797 = _1793 * 6.283185482025146484375;
        float _1799 = cos(_1797);
        float _1801 = _1795 * 0.15915493667125701904296875;
        float _1803 = _1793 * 6.283185482025146484375;
        float _1805 = sin(_1803);
        float _1807 = 1.0 / _1799;
        float _1809 = _1801 * 6.283185482025146484375;
        float _1811 = cos(_1809);
        float _1813 = _1805 * _1807;
        float _1815 = _1801 * 6.283185482025146484375;
        float _1817 = sin(_1815);
        float _1819 = _1811 * _1813;
        float _1821 = 1.0 / _1819;
        float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1825 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1823;
        float _1827 = 1.0 / _1825;
        float _1829 = _1817 * _1821;
        float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1833 = fma(_1729, _1829, _1831);
        float _1835 = _1833 * _1827;
        float _1837 = precise::clamp(_1835, 0.0, 1.0);
        float _1839 = -_1837;
        float _1841 = _1839 + 1.0;
        _1787 = _1805;
        _1789 = _1793;
        _1731 = _1841;
    }
    float _1843 = _1787;
    float _1845 = _1789;
    float _1847 = _1731;
    float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1851 = _1715 + _1849;
    float _1853 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1855 = _1717 + _1853;
    float _1857 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1859 = _1719 + _1857;
    bool _1861 = _731 != 0;
    float _1863 = _1851 * _1851;
    bool _1865 = _801 != 0;
    float _1867 = fma(_1855, _1855, _1863);
    float _1869 = fma(_1859, _1859, _1867);
    float _1871 = rsqrt(_1869);
    float _1873 = sqrt(_1869);
    float _1875 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1877 = _1855 * _1875;
    float _1879 = _1859 * _1875;
    float _1881 = _1877 * _1877;
    float _1883 = _1879 * _1879;
    float _1885 = _1881 + _1883;
    float _1887 = sqrt(_1885);
    bool _1889 = _1887 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1893 = _1887 + _1891;
    float _1895 = _1871;
    float _1897 = _1893;
    float _1899 = _1843;
    float _1901 = _1851;
    float _1903 = _1875;
    if (_1889)
    {
        float _1905 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1895 = _1905;
    }
    float _1907 = _1895;
    float _1909 = _1907;
    if (_1889)
    {
        float _1911 = _1893 * _1907;
        _1897 = _1911;
    }
    float _1913 = _1897;
    if (_1889)
    {
        float _1915 = rsqrt(_1885);
        _1909 = _1915;
    }
    float _1917 = _1909;
    float _1919 = _1917;
    if (_1889)
    {
        float _1921 = _1913 * 0.15915493667125701904296875;
        _1899 = _1921;
    }
    float _1923 = _1899;
    float _1925 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1927 = _1859;
    float _1929 = _1923;
    if (_1889)
    {
        float _1931 = _1923 * 6.283185482025146484375;
        float _1933 = sin(_1931);
        _1927 = _1933;
    }
    float _1935 = _1927;
    float _1937 = precise::max(0.0, _1925);
    float _1939 = _1845;
    float _1941 = _1937;
    if (_1889)
    {
        float _1943 = _1923 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        _1939 = _1945;
    }
    float _1947 = _1939;
    float _1949 = -_1875;
    float _1951 = -_1937;
    float _1953 = fma(_1851, _1949, _1951);
    if (_1889)
    {
        float _1955 = _1953 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1901 = _1955;
    }
    float _1957 = _1901;
    float _1959 = _1935;
    float _1961 = _1957;
    if (_1889)
    {
        float _1963 = fma(_1935, _1957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1959 = _1963;
    }
    float _1965 = _1959;
    float _1967 = _1965;
    if (!_1889)
    {
        _1961 = _1879;
    }
    float _1969 = _1961;
    float _1971 = _1969;
    if (!_1889)
    {
        _1929 = _1881;
    }
    float _1973 = _1929;
    float _1975 = _1973;
    if (_1889)
    {
        float _1977 = _1917 * _1965;
        _1597 = _1977;
    }
    float _1979 = _1597;
    if (!_1889)
    {
        _1919 = _1877;
    }
    float _1981 = _1919;
    float _1983 = _1981;
    if (_1889)
    {
        float _1985 = _1947 + (-1.0);
        _1941 = _1985;
    }
    float _1987 = _1941;
    float _1989 = _1987;
    if (_1889)
    {
        float _1991 = _1877 * _1979;
        _1983 = _1991;
    }
    float _1993 = _1983;
    if (!_1889)
    {
        _1967 = _1953;
    }
    float _1995 = _1967;
    float _1997 = _1995;
    if (_1889)
    {
        float _1999 = _1879 * _1979;
        _1971 = _1999;
    }
    float _2001 = _1971;
    if (_1889)
    {
        float _2003 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1903 = _2003;
    }
    float _2005 = _1903;
    if (_1889)
    {
        float _2007 = _1993 * _1993;
        _1975 = _2007;
    }
    float _2009 = _1975;
    if (!_1889)
    {
        _1989 = _1883;
    }
    float _2011 = _1989;
    float _2013 = _2011;
    if (_1889)
    {
        float _2015 = _2001 * _2001;
        _2013 = _2015;
    }
    float _2017 = _2013;
    if (_1889)
    {
        float _2019 = fma(_1953, _1947, _2005);
        _1997 = _2019;
    }
    float _2021 = _1997;
    float _2023 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2025 = fma(_2021, _2021, _2009);
    float _2027 = _2025 + _2017;
    float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2031 = fma(_1873, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2029);
    float _2033 = precise::clamp(_2031, 0.0, 1.0);
    float _2035 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2023);
    float _2037 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2039 = rsqrt(_2027);
    float _2041 = -_2033;
    float _2043 = _2041 + 1.0;
    float _2045 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2035);
    float _2047 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2049 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2037);
    float _2051 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2053 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2055 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2047);
    float _2057 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2049);
    float _2059 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2051);
    float _2061 = abs(_2043);
    float _2063 = log2(_2061);
    float _2065 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2055);
    float _2067 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2069 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2059);
    float _2071 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2073 = _2065 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2075 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2077 = _2039 * _1993;
    float _2079 = _2039 * _2021;
    float _2081 = _2039 * _2001;
    float _2083 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2075);
    float _2085 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2087 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2089 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2091 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2083);
    float _2093 = -_2085;
    float _2095 = fma(_2079, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2093);
    float _2097 = -_2087;
    float _2099 = fma(_2097, _2071, 1.0);
    float _2101 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2103 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2091);
    float _2105 = -_2081;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2095);
    float _2109 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2111 = exp2(_2101);
    float _2113 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2115 = fma(_2107, -0.5, 0.5);
    float _2117 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2109);
    float _2119 = fma(_2107, 0.5, 0.5);
    float _2121 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2113);
    float _2123 = _2079 + 1.0;
    float _2125 = log2(_2099);
    float _2127 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2117);
    float _2129 = fma(_2119, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2131 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2121);
    float _2133 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2127);
    float _2135 = fma(_2119, _2129, -0.212114393711090087890625);
    float _2137 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2131);
    float _2139 = 1.0 / _2103;
    float _2141 = -_2079;
    float _2143 = fma(_2111, _2123, _2141);
    float _2145 = fma(_2119, _2135, 1.570728778839111328125);
    float _2147 = fma(_2143, 0.5, 0.5);
    float _2149 = sqrt(_2115);
    float _2151 = _2125 * 0.693147182464599609375;
    float _2153 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2155 = _2133 * _2139;
    float _2157 = _2137 * _2139;
    float _2159 = fma(_2155, 0.5, 0.5);
    float _2161 = fma(_2157, -0.5, 0.5);
    float _2163 = _2149 * 0.636619746685028076171875;
    float _2165 = -_2145;
    float _2167 = fma(_2163, _2165, 1.0);
    float3 _7102 = float3(_2159, _2161, _2153);
    float _2169 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7102, float3(0.0), isnan(_7102)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7102, float3(0.0), isnan(_7102)), level(0.0)).x;
    float3 _7113 = float3(_2159, _2161, _2153);
    float4 _2172 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7113, float3(0.0), isnan(_7113)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7113, float3(0.0), isnan(_7113)), level(0.0)).xyzw;
    float _2174 = _2172.x;
    float _2176 = _2172.y;
    float _2178 = _2172.z;
    float _2180 = _2172.w;
    float2 _7130 = float2(_2167, _2147);
    float3 _2184 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7130, float2(0.0), isnan(_7130)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7130, float2(0.0), isnan(_7130)), level(0.0)).xyz;
    float _2186 = _2184.x;
    float _2188 = _2184.y;
    float _2190 = _2184.z;
    float _2192 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2194 = int(_2192);
    int _2196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2198 = _2196 != 0;
    float _2200 = _1077 * (-0.15915493667125701904296875);
    int _2202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2204 = _2202 != 0;
    float _2206 = -_1087;
    float _2208 = _2206 + 1.0;
    float _2210 = -_907;
    float _2212 = _2210 + 1.0;
    float _2214 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2216 = int(_2214);
    float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2220 = _2218 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2222 = -_1115;
    float _2224 = _2222 + 1.0;
    float _2226 = 0.5;
    if (_2198)
    {
        float _2228 = in.m_52.w;
        _2226 = _2228;
    }
    float _2230 = _2226;
    float _2232 = trunc(_1113);
    int _2234 = int(_2232);
    float _2236 = float(uint(_2194));
    float _2238 = trunc(_1067);
    int _2240 = int(_2238);
    float _2242 = float(uint(_2216));
    float _2244 = _2161;
    if (_2204)
    {
        float _2246 = in.m_52.x;
        _2244 = _2246;
    }
    float _2248 = _2244;
    int _2250 = ~_2194;
    int _2252 = _2250 + 1;
    float _2254 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2256 = _2254 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2260 = _2258 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2262 = 1.0 / _2236;
    float _2264 = float(uint(_2234));
    float _2266 = -_1109;
    float _2268 = _2266 + 1.0;
    float _2270 = -_1117;
    float _2272 = _2270 + 1.0;
    float _2274 = _2230;
    if (_2198)
    {
        float _2276 = _2230 * 3.1415927410125732421875;
        _2274 = _2276;
    }
    float _2278 = _2274;
    bool _2280 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2282 = isnan(_411);
    bool _2284 = _2280 || _2282;
    bool _2286 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2288 = _2284 || _2286;
    float _2290 = float(_2288);
    float _2292 = 1.0 / _2242;
    bool _2294 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2296 = isnan(_413);
    bool _2298 = _2294 || _2296;
    bool _2300 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2302 = _2298 || _2300;
    float _2304 = float(_2302);
    float _2306 = _2278;
    if (_2198)
    {
        float _2308 = _2278 * 0.15915493667125701904296875;
        _2306 = _2308;
    }
    float _2310 = _2306;
    bool _2312 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2314 = isnan(_413);
    bool _2316 = _2312 || _2314;
    bool _2318 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2320 = _2316 || _2318;
    float _2322 = float(_2320);
    float _2324 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2326 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2328 = isnan(_413);
    bool _2330 = _2326 || _2328;
    bool _2332 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2334 = _2330 || _2332;
    float _2336 = float(_2334);
    float _2338 = float(_2216);
    float _2340 = _2310;
    if (_2198)
    {
        float _2342 = _2310 * 6.283185482025146484375;
        float _2344 = sin(_2342);
        _2340 = _2344;
    }
    float _2346 = _2340;
    int _2348 = as_type<int>(_2262) + (-2);
    float _2350 = float(uint(_2240));
    int _2352 = abs(_1141);
    float _2354 = as_type<float>(_2348) * _2264;
    int _2356 = abs(_1193);
    float _2358 = 1.0 / _2220;
    int _2360 = as_type<int>(_2292) + (-2);
    int _2362 = abs(_1153);
    float _2364 = as_type<float>(_2360) * _2350;
    float _2366 = trunc(_2354);
    float _2368 = precise::max(_2366, 0.0);
    uint _2371 = uint(_2368);
    int _2373 = ~_2216;
    int _2375 = _2373 + 1;
    if (_2198)
    {
        bool _2377 = _2346 > 0.5;
        _1599 = _2377;
    }
    bool _2379 = _1599;
    float _2381 = trunc(_2364);
    float _2383 = precise::max(_2381, 0.0);
    uint _2385 = uint(_2383);
    int _2387 = _2252 * int(_2371);
    int _2389 = _2387 + _2234;
    float _2391 = 1.0 / _2256;
    float _2393 = float(uint(_2389));
    float _2395 = as_type<float>(_2389);
    if (_2204)
    {
        float _2397 = _2248 * 3.1415927410125732421875;
        _2395 = _2397;
    }
    float _2399 = _2395;
    float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2403 = _2401 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _2405 = _2375 * int(_2385);
    int _2407 = _2405 + _2240;
    int _2409 = ~_2194;
    int _2411 = _2409 + 1;
    float _2413 = as_type<float>(_2348) * _2393;
    float _2415 = _2399;
    float _2417 = as_type<float>(_2411);
    if (_2204)
    {
        float _2419 = _2399 * 0.15915493667125701904296875;
        _2415 = _2419;
    }
    float _2421 = _2415;
    float _2423 = 1.0 / _2403;
    float _2425 = float(uint(_2407));
    float _2427 = as_type<float>(_2360) * _2425;
    float _2429 = trunc(_2413);
    float _2431 = precise::max(_2429, 0.0);
    uint _2433 = uint(_2431);
    float _2435 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2437 = _2435 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2439 = _2421;
    if (_2204)
    {
        float _2441 = _2421 * 6.283185482025146484375;
        float _2443 = sin(_2441);
        _2439 = _2443;
    }
    float _2445 = _2439;
    float _2447 = trunc(_2427);
    float _2449 = precise::max(_2447, 0.0);
    uint _2451 = uint(_2449);
    int _2453 = int(_2371) + int(_2433);
    if (!_2204)
    {
        _2417 = _165;
    }
    float _2455 = _2417;
    int _2457 = _2411 * _2453;
    int _2459 = _2457 + _2234;
    float _2461 = _2455;
    if (_2204)
    {
        bool _2463 = _2445 > 0.5;
        _1601 = _2463;
    }
    bool _2465 = _1601;
    float _2467 = 1.0 / _2437;
    bool _2469 = uint(_2459) >= uint(_2194);
    float _2471 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2473 = _2471 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    int _2475 = ~_2216;
    int _2477 = _2475 + 1;
    float _2479 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2481 = _2479 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _2483 = int(_2385) + int(_2451);
    float _2485 = 1.0 / _2473;
    float _2487 = as_type<float>(_2451);
    if (!_2198)
    {
        _2487 = _161;
    }
    float _2489 = _2487;
    float _2491 = _2489;
    if (_2198)
    {
        float _2493 = -_161;
        float _2495 = _2379 ? _2493 : _161;
        _2491 = _2495;
    }
    float _2497 = _2491;
    int _2499 = _2477 * _2483;
    int _2501 = _2499 + _2240;
    int _2503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2505 = _2503 != 0;
    if (_2204)
    {
        float _2507 = -_165;
        float _2509 = _2465 ? _2507 : _165;
        _2461 = _2509;
    }
    float _2511 = _2461;
    float _2513 = 1.0 / _2481;
    bool _2515 = !_2469;
    int _2517 = _2515 ? 0 : (-1);
    int _2519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2521 = _2519 != 0;
    int _2523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2525 = _2523 != 0;
    int _2527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2529 = _2527 != 0;
    float _2531 = 1.0 / _2260;
    int _2533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2535 = _2533 != 0;
    bool _2537 = !_2505;
    int _2539 = _2537 ? 0 : 1;
    bool _2541 = uint(_2501) >= uint(_2216);
    float _2543 = exp2(_2324);
    float _2545 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2547 = _2545 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2549 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2551 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2553 = 1.0 / _2547;
    float _2555 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2557 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2559 = _2549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2561 = _2551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2563 = _2555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2565 = !_2541;
    int _2567 = _2565 ? 0 : (-1);
    float _2569 = -_2543;
    float _2571 = _2569 + 1.0;
    int _2573 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2575 = _2573 != 0;
    bool _2577 = !_2535;
    int _2579 = _2577 ? 0 : 1;
    out.m_56.x = _2559;
    out.m_56.y = _2561;
    out.m_56.z = _2563;
    out.m_56.w = _2557;
    int _2581 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2583 = _2581 != 0;
    float _2585 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2587 = ~_2453;
    int _2589 = _2587 + _2517;
    int _2591 = _2589 + 1;
    float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2595 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2593;
    float _2597 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2599 = _2597 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2601 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2603 = _2601 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    int _2605 = abs(_2539);
    float _2607 = _2595 * _2358;
    float _2609 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2611 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2609;
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2615 = _2613 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _2619 = _2617 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2621 = _2599 * _2423;
    float _2623 = _2611 * _2513;
    float _2625 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _2627 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _2625;
    float _2629 = 1.0 / _2615;
    int _2631 = ~_2483;
    int _2633 = _2631 + _2567;
    int _2635 = _2633 + 1;
    float _2637 = _2627 * _2485;
    float _2639 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _2639;
    float _2643 = _2619 * _2467;
    float _2645 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _2647 = _2645 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2649 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2651 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2649;
    float _2653 = _2641 * _2553;
    float _2655 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2657 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _2655;
    float _2659 = 1.0 / _2603;
    float _2661 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2663 = _413 + _2661;
    float _2665 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2667 = _411 + _2665;
    float _2669 = _2657 * _2531;
    float _2671 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2673 = _411 + _2671;
    float _2675 = fma(_2637, _2663, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _2677 = fma(_2607, _2667, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2681 = _413 + _2679;
    float _2683 = fma(_2621, _2673, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2685 = _2647 * _2391;
    float _2687 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2689 = _413 + _2687;
    float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2693 = _411 + _2691;
    float _2695 = fma(_2669, _2681, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _2697 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2699 = isnan(_413);
    bool _2701 = _2697 || _2699;
    bool _2703 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2705 = _2701 || _2703;
    float _2707 = float(_2705);
    float _2709 = fma(_2643, _2689, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _2711 = fma(_2623, _2693, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _2713 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2715 = isnan(_413);
    bool _2717 = _2713 || _2715;
    bool _2719 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2721 = _2717 || _2719;
    float _2723 = float(_2721);
    float _2725 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2727 = _413 + _2725;
    float _2729 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2731 = _413 + _2729;
    float _2733 = _2651 * _2629;
    bool _2735 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2737 = isnan(_411);
    bool _2739 = _2735 || _2737;
    bool _2741 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2743 = _2739 || _2741;
    float _2745 = float(_2743);
    float _2747 = fma(_2653, _2727, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2749 = -_2723;
    float _2751 = _2749 + 1.0;
    bool _2753 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2755 = isnan(_413);
    bool _2757 = _2753 || _2755;
    bool _2759 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2761 = _2757 || _2759;
    float _2763 = float(_2761);
    float _2765 = fma(_2685, _2731, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _2767 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2769 = isnan(_411);
    bool _2771 = _2767 || _2769;
    bool _2773 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2775 = _2771 || _2773;
    float _2777 = float(_2775);
    float _2779 = -_2707;
    float _2781 = _2779 + 1.0;
    bool _2783 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2785 = isnan(_411);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2791 = _2787 || _2789;
    float _2793 = float(_2791);
    float _2795 = _2707 * _2751;
    bool _2797 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2799 = isnan(_413);
    bool _2801 = _2797 || _2799;
    bool _2803 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2805 = _2801 || _2803;
    float _2807 = float(_2805);
    float _2809 = -_2763;
    float _2811 = _2809 + 1.0;
    bool _2813 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2815 = isnan(_413);
    bool _2817 = _2813 || _2815;
    bool _2819 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2821 = _2817 || _2819;
    float _2823 = float(_2821);
    float _2825 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _2827 = _2825 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2829 = _2763 * _2781;
    float _2831 = _2807 * _2811;
    float _2833 = -_2807;
    float _2835 = _2833 + 1.0;
    float _2837 = -_2777;
    float _2839 = _2837 + 1.0;
    float _2841 = -_2823;
    float _2843 = _2841 + 1.0;
    float _2845 = _2827 * _2659;
    float _2847 = _2823 * _2835;
    float _2849 = _2745 * _2839;
    float _2851 = -_2745;
    float _2853 = _2851 + 1.0;
    float _2855 = _2304 * _2843;
    float _2857 = -_2304;
    float _2859 = _2857 + 1.0;
    float _2861 = _533 * _535;
    float _2863 = _2290 * _2853;
    float _2865 = _537 * _535;
    float _2867 = _2322 * _2859;
    float _2869 = -_2322;
    float _2871 = _2869 + 1.0;
    float _2873 = _2677 * _2863;
    float _2875 = floor(_2861);
    float _2877 = float(_2194);
    float _2879 = _2336 * _2871;
    float _2881 = float(_2234);
    float _2883 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2885 = _413 + _2883;
    float _2887 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2889 = _413 + _2887;
    float _2891 = _2675 * _2879;
    bool _2893 = _2881 >= _2877;
    bool _2895 = isnan(_2881);
    bool _2897 = _2893 || _2895;
    bool _2899 = isnan(_2877);
    bool _2901 = _2897 || _2899;
    float _2903 = float(_2901);
    float _2905 = floor(_2865);
    float _2907 = float(_2240);
    float _2909 = -_2290;
    float _2911 = _2909 + 1.0;
    float _2913 = fma(_2733, _2889, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2915 = -_2793;
    float _2917 = _2915 + 1.0;
    bool _2919 = _2907 >= _2338;
    bool _2921 = isnan(_2907);
    bool _2923 = _2919 || _2921;
    bool _2925 = isnan(_2338);
    bool _2927 = _2923 || _2925;
    float _2929 = float(_2927);
    float _2931 = fma(_2911, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2873);
    float _2933 = fma(_2845, _2885, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2935 = trunc(_2903);
    int _2937 = int(_2935);
    float _2939 = _2777 * _2917;
    float _2941 = fma(_2683, _2849, _2931);
    float _2943 = -_2875;
    float _2945 = _2861 + _2943;
    float _2947 = -_165;
    int _2949 = _1865 ? as_type<int>(_2947) : as_type<int>(_165);
    int _2951 = _2216 * _2635;
    int _2953 = _2951 + _2240;
    float _2955 = fma(_2711, _2939, _2941);
    float _2957 = _2945 * _2877;
    float _2959 = trunc(_2929);
    int _2961 = int(_2959);
    float _2963 = -_2905;
    float _2965 = _2865 + _2963;
    float _2967 = _2877 * _1105;
    float _2969 = _2338 * _1105;
    float _2971 = -_161;
    int _2973 = _1861 ? as_type<int>(_2971) : as_type<int>(_161);
    int _2975 = _2194 * _2591;
    int _2977 = _2975 + _2234;
    bool _2979 = _2194 == 0;
    float _2981 = -_2336;
    float _2983 = _2981 + 1.0;
    bool _2985 = _521 > 0.5;
    float _2987 = _2965 * _2338;
    float _2989 = trunc(_2967);
    int _2991 = int(_2989);
    int _2993 = ~_2937;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    float _2999 = fma(_2983, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2891);
    bool _3001 = !_2979;
    int _3003 = _3001 ? _2977 : (-1);
    float _3005 = _2585 * _2169;
    bool _3007 = !_2575;
    float _3009 = _3007 ? _165 : as_type<float>(_2949);
    float _3011 = fma(_2709, _2867, _2999);
    bool _3013 = _2216 == 0;
    float _3015 = trunc(_2987);
    int _3017 = int(_3015);
    int _3019 = _2194 + (-1);
    int _3021 = _3003 * _2997;
    int _3023 = ~_2961;
    int _3025 = _3023 + 1;
    int _3027 = _3025 + 1;
    float _3029 = fma(_2747, _2855, _3011);
    bool _3031 = !_3013;
    int _3033 = _3031 ? _2953 : (-1);
    int _3035 = _2937 * _3019;
    int _3037 = _3035 + _3021;
    int _3039 = _2216 + (-1);
    float _3041 = trunc(_2957);
    int _3043 = int(_3041);
    int _3045 = abs(_2579);
    int _3047 = _3033 * _3027;
    int _3049 = abs(_841);
    float _3051 = fma(_2765, _2847, _3029);
    int _3053 = _2961 * _3039;
    int _3055 = _3053 + _3047;
    float _3057 = trunc(_2969);
    int _3059 = int(_3057);
    int _3061 = abs(_1213);
    int _3063 = _3037 * _2352;
    int _3065 = abs(_1147);
    int _3067 = _3017 * _3045;
    int _3069 = _3067 + _2240;
    int _3071 = _3055 * _2356;
    float _3073 = _1101 * (-0.15915493667125701904296875);
    int _3075 = _2991 * _3049;
    int _3077 = _3075 + _3063;
    int _3079 = abs(_1245);
    int _3081 = _3043 * _2605;
    int _3083 = _3081 + _2234;
    float _3085 = _593 * (-0.15915493667125701904296875);
    float _3087 = _3073 * 6.283185482025146484375;
    float _3089 = sin(_3087);
    float _3091 = fma(_2695, _2831, _3051);
    int _3093 = _3059 * _3061;
    int _3095 = _3093 + _3071;
    int _3097 = _3083 * _3065;
    int _3099 = _3097 + _3077;
    float _3101 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _3103 = fma(_2933, _2829, _3091);
    float _3105 = fma(_2793, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2955);
    int _3107 = _3069 * _3079;
    int _3109 = _3107 + _3095;
    int _3111 = _3043 * _2362;
    int _3113 = _3111 + _3099;
    float _3115 = _3073 * 6.283185482025146484375;
    float _3117 = cos(_3115);
    int _3119 = abs(_1251);
    float _3121 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _3123 = fma(_2913, _2795, _3103);
    float _3125 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _3127 = !_2525;
    float _3129 = _3127 ? _161 : as_type<float>(_2973);
    int _3131 = _3017 * _3119;
    int _3133 = _3131 + _3109;
    float _3135 = _3121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3137 = _3125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3139 = _3101 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3141 = float(uint(_3113));
    float _3143 = _3105 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _3145 = -_161;
    int _3147 = _2985 ? as_type<int>(_3145) : as_type<int>(_161);
    float _3149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _3151 = float(uint(_3133));
    float _3153 = as_type<float>(_2348) * _3141;
    bool _3155 = !_2583;
    float _3157 = _3155 ? _161 : as_type<float>(_3147);
    float _3159 = _3009 * _3089;
    float _3161 = _3009 * _3117;
    float _3163 = as_type<float>(_2360) * _3151;
    out.m_58.x = _3135;
    out.m_58.y = _3137;
    out.m_58.z = _3139;
    out.m_58.w = _3143;
    float _3165 = trunc(_3153);
    float _3167 = precise::max(_3165, 0.0);
    uint _3169 = uint(_3167);
    float _3171 = -_3159;
    float _3173 = fma(_3157, _3117, _3171);
    int _3175 = ~_2194;
    int _3177 = _3175 + 1;
    float _3179 = fma(_3157, _3089, _3161);
    float _3181 = fma(_2723, (*spvDescriptorSet0.vp_c9)._m0[158].x, _3123);
    float _3183 = trunc(_3163);
    float _3185 = precise::max(_3183, 0.0);
    uint _3187 = uint(_3185);
    float _3189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3191 = _3149 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3193 = float(uint(_3083));
    float _3195 = _2190 * _3005;
    int _3197 = ~_2216;
    int _3199 = _3197 + 1;
    int _3201 = _3177 * int(_3169);
    int _3203 = _3201 + _3113;
    out.m_60.x = _3181;
    float _3205 = _3085 * 6.283185482025146484375;
    float _3207 = sin(_3205);
    float _3209 = as_type<float>(_2348) * _3193;
    int _3211 = _3199 * int(_3187);
    int _3213 = _3211 + _3133;
    float _3215 = float(uint(_3203));
    float _3217 = _3173 + 0.5;
    float _3219 = float(uint(_3213));
    float _3221 = _3085 * 6.283185482025146484375;
    float _3223 = cos(_3221);
    float _3225 = as_type<float>(_2348) * _3215;
    float _3227 = _3189 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3229 = _3179 + (-0.5);
    float _3231 = fma(_3191, _3217, _811);
    int _3233 = ~_2194;
    int _3235 = _3233 + 1;
    float _3237 = as_type<float>(_2360) * _3219;
    float _3239 = -_3227;
    float _3241 = -_817;
    float _3243 = fma(_3239, _3229, _3241);
    float _3245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3247 = _3207 * _2511;
    float _3249 = float(uint(_3069));
    float _3251 = as_type<float>(_2360) * _3249;
    float _3253 = trunc(_3209);
    float _3255 = precise::max(_3253, 0.0);
    uint _3257 = uint(_3255);
    float _3259 = -_3247;
    float _3261 = fma(_3223, _2497, _3259);
    float _3263 = _3223 * _2511;
    float _3265 = _3261 + 0.5;
    float _3267 = fma(_3207, _2497, _3263);
    float _3269 = trunc(_3225);
    float _3271 = precise::max(_3269, 0.0);
    uint _3273 = uint(_3271);
    float _3275 = _3245 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3277 = _807 + (-0.5);
    float _3279 = fma(_3265, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1003);
    float _3281 = _815 + 0.5;
    float _3283 = _3267 + (-0.5);
    float _3285 = -_3275;
    float _3287 = -_1123;
    float _3289 = fma(_3285, _3277, _3287);
    float _3291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3293 = _3235 * int(_3257);
    int _3295 = _3293 + _3083;
    int _3297 = ~_2194;
    int _3299 = _3297 + 1;
    float _3301 = -_3283;
    float _3303 = -_927;
    float _3305 = fma(_3301, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3303);
    float _3307 = -_2208;
    float _3309 = fma(_3261, _3307, _3279);
    float _3311 = fma(_807, _2272, _3289);
    float _3313 = fma(_3267, _2212, _3305);
    float _3315 = trunc(_3251);
    float _3317 = precise::max(_3315, 0.0);
    uint _3319 = uint(_3317);
    int _3321 = int(_3169) + int(_3273);
    int _3323 = ~_2216;
    int _3325 = _3323 + 1;
    out.m_62.x = _3309;
    out.m_62.y = _3313;
    float _3327 = trunc(_3237);
    float _3329 = precise::max(_3327, 0.0);
    uint _3331 = uint(_3329);
    float _3333 = _3291 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3335 = fma(_3333, _3281, _1127);
    float _3337 = _2200 * 6.283185482025146484375;
    float _3339 = sin(_3337);
    float _3341 = float(uint(_3295));
    float _3343 = as_type<float>(_2348) * _3341;
    int _3345 = _3299 * _3321;
    int _3347 = _3345 + _3113;
    int _3349 = ~_2216;
    int _3351 = _3349 + 1;
    float _3353 = _2200 * 6.283185482025146484375;
    float _3355 = cos(_3353);
    int _3357 = int(_3187) + int(_3331);
    bool _3359 = uint(_3347) >= uint(_2194);
    int _3361 = _3351 * int(_3319);
    int _3363 = _3361 + _3069;
    bool _3365 = !_3359;
    int _3367 = _3365 ? 0 : (-1);
    float _3369 = trunc(_3343);
    float _3371 = precise::max(_3369, 0.0);
    uint _3373 = uint(_3371);
    float _3375 = float(uint(_3363));
    int _3377 = _3325 * _3357;
    int _3379 = _3377 + _3133;
    int _3381 = ~_3321;
    int _3383 = _3381 + _3367;
    int _3385 = _3383 + 1;
    float _3387 = _743 * _3339;
    float _3389 = as_type<float>(_2360) * _3375;
    bool _3391 = uint(_3379) >= uint(_2216);
    int _3393 = _2194 * _3385;
    int _3395 = _3393 + _3113;
    float _3397 = _743 * _3355;
    float _3399 = -_3387;
    float _3401 = fma(_3129, _3355, _3399);
    float _3403 = trunc(_3389);
    float _3405 = precise::max(_3403, 0.0);
    uint _3407 = uint(_3405);
    bool _3409 = !_3391;
    int _3411 = _3409 ? 0 : (-1);
    float _3413 = fma(_3129, _3339, _3397);
    bool _3415 = !_2979;
    int _3417 = _3415 ? _3395 : (-1);
    float _3419 = _3401 + 0.5;
    int _3421 = ~_3357;
    int _3423 = _3421 + _3411;
    int _3425 = _3423 + 1;
    int _3427 = _3417 & 3;
    bool _3429 = _3427 != 0;
    float _3431 = fma(_3419, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1121);
    int _3433 = ~_2194;
    int _3435 = _3433 + 1;
    int _3437 = _2216 * _3425;
    int _3439 = _3437 + _3133;
    bool _3441 = uint(_3427) > 1u;
    int _3443 = int(_3257) + int(_3373);
    int _3445 = _3417 & 3;
    bool _3447 = _3445 != 0;
    int _3449 = int(_3319) + int(_3407);
    int _3451 = _3435 * _3443;
    int _3453 = _3451 + _3083;
    int _3455 = _3447 ? 0 : 1;
    bool _3457 = !_3013;
    int _3459 = _3457 ? _3439 : (-1);
    int _3461 = _3417 >> 31;
    bool _3463 = uint(_3453) >= uint(_2194);
    int _3465 = ~_3455;
    int _3467 = _3465 + 1;
    int _3469 = _3467 + 1;
    int _3471 = _3459 >> 31;
    int _3473 = _3469;
    if (!_3441)
    {
        int _3475 = ~_3455;
        int _3477 = _3475 + 1;
        _3473 = _3477;
    }
    int _3479 = _3473;
    float _3481 = _3413 + (-0.5);
    int _3483 = _3461 & 3;
    int _3485 = _3471 & 3;
    float _3487 = -_3481;
    float _3489 = -_1071;
    float _3491 = fma(_3487, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3489);
    int _3493 = _3417 + _3483;
    bool _3495 = !_3463;
    int _3497 = _3495 ? 0 : (-1);
    int _3499 = ~_2216;
    int _3501 = _3499 + 1;
    int _3503 = _3459 + _3485;
    int _3505 = _3493 >> 2;
    int _3507 = _3501 * _3449;
    int _3509 = _3507 + _3069;
    bool _3511 = uint(_3427) >= 2u;
    int _3513 = ~_3443;
    int _3515 = _3513 + _3497;
    int _3517 = _3515 + 1;
    int _3519 = _3503 >> 2;
    int _3521 = _3505 << 4;
    int _3523 = _3521 + 512;
    float _3525 = -_1107;
    float _3527 = _3525 + 1.0;
    int _3529 = _3511 ? 0 : 1;
    int _3531 = _2194 * _3517;
    int _3533 = _3531 + _3083;
    bool _3535 = _3427 != 3;
    int _3537 = _3519 << 4;
    int _3539 = _3537 + 800;
    uint _3541 = uint(int(uint(_3523) >> uint(2)));
    uint _3543 = uint(int(uint(int(_3541)) >> uint(2)));
    int _3545 = int(_3541) & 3;
    float _3547 = (*spvDescriptorSet0.vp_c9)._m0[int(_3543)][_3545];
    int _3549 = int(_3541) + 1;
    uint _3551 = uint(int(uint(_3549) >> uint(2)));
    int _3553 = _3549 & 3;
    float _3555 = (*spvDescriptorSet0.vp_c9)._m0[int(_3551)][_3553];
    bool _3557 = uint(_3509) >= uint(_2216);
    int _3559 = ~_3529;
    int _3561 = _3559 + 1;
    int _3563 = _3561 + 1;
    bool _3565 = !_3429;
    int _3567 = _3565 ? 0 : 1;
    int _3569 = _3459 & 3;
    bool _3571 = _3569 != 0;
    uint _3573 = uint(int(uint(_3539) >> uint(2)));
    uint _3575 = uint(int(uint(int(_3573)) >> uint(2)));
    int _3577 = int(_3573) & 3;
    float _3579 = (*spvDescriptorSet0.vp_c9)._m0[int(_3575)][_3577];
    int _3581 = int(_3573) + 1;
    uint _3583 = uint(int(uint(_3581) >> uint(2)));
    int _3585 = _3581 & 3;
    float _3587 = (*spvDescriptorSet0.vp_c9)._m0[int(_3583)][_3585];
    int _3589 = _3563;
    if (_3535)
    {
        int _3591 = ~_3529;
        int _3593 = _3591 + 1;
        _3589 = _3593;
    }
    int _3595 = _3589;
    float _3597 = -_2224;
    float _3599 = fma(_815, _3597, _3335);
    float _3601 = -_3527;
    float _3603 = fma(_3173, _3601, _3231);
    float _3605 = fma(_3179, _2268, _3243);
    int _3607 = _3459 & 3;
    bool _3609 = _3607 != 0;
    float _3611 = -_1089;
    float _3613 = _3611 + 1.0;
    float _3615 = -_1095;
    float _3617 = _3615 + 1.0;
    int _3619 = _3523 + 8;
    uint _3621 = uint(int(uint(_3619) >> uint(2)));
    uint _3623 = uint(int(uint(int(_3621)) >> uint(2)));
    int _3625 = int(_3621) & 3;
    float _3627 = (*spvDescriptorSet0.vp_c9)._m0[int(_3623)][_3625];
    int _3629 = int(_3621) + 1;
    uint _3631 = uint(int(uint(_3629) >> uint(2)));
    int _3633 = _3629 & 3;
    float _3635 = (*spvDescriptorSet0.vp_c9)._m0[int(_3631)][_3633];
    bool _3637 = !_3557;
    int _3639 = _3637 ? 0 : (-1);
    float _3641 = -_3613;
    float _3643 = fma(_3401, _3641, _3431);
    bool _3645 = uint(_3607) > 1u;
    float _3647 = fma(_3413, _3617, _3491);
    int _3649 = _3571 ? 0 : 1;
    out.m_64.x = _3599;
    out.m_64.y = _3311;
    int _3651 = abs(_3479);
    int _3653 = _3539 + 8;
    uint _3655 = uint(int(uint(_3653) >> uint(2)));
    uint _3657 = uint(int(uint(int(_3655)) >> uint(2)));
    int _3659 = int(_3655) & 3;
    float _3661 = (*spvDescriptorSet0.vp_c9)._m0[int(_3657)][_3659];
    int _3663 = int(_3655) + 1;
    uint _3665 = uint(int(uint(_3663) >> uint(2)));
    int _3667 = _3663 & 3;
    float _3669 = (*spvDescriptorSet0.vp_c9)._m0[int(_3665)][_3667];
    int _3671 = ~_3649;
    int _3673 = _3671 + 1;
    int _3675 = _3673 + 1;
    out.m_66.x = _3603;
    out.m_66.y = _3605;
    out.m_66.z = _3643;
    out.m_66.w = _3647;
    bool _3677 = !_3609;
    int _3679 = _3677 ? 0 : 1;
    bool _3681 = uint(_3607) >= 2u;
    int _3683 = abs(_3679);
    int _3685 = _3675;
    if (!_3645)
    {
        int _3687 = ~_3649;
        int _3689 = _3687 + 1;
        _3685 = _3689;
    }
    int _3691 = _3685;
    bool _3693 = _3607 != 3;
    int _3695 = _3681 ? 0 : 1;
    bool _3697 = _3427 != 3;
    float _3699 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3701 = abs(_3691);
    float _3703 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3699);
    int _3705 = abs(_3567);
    int _3707 = ~_3651;
    int _3709 = _3707 + 1;
    int _3711 = _3709 + 1;
    float _3713 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3703);
    int _3715 = ~_3701;
    int _3717 = _3715 + 1;
    int _3719 = _3717 + 1;
    int _3721 = _3711 * as_type<int>(_3555);
    int _3723 = ~_3705;
    int _3725 = _3723 + 1;
    int _3727 = _3725 + 1;
    int _3729 = ~_3683;
    int _3731 = _3729 + 1;
    int _3733 = _3731 + 1;
    int _3735 = _3719 * as_type<int>(_3587);
    int _3737 = ~_3449;
    int _3739 = _3737 + _3639;
    int _3741 = _3739 + 1;
    int _3743 = _3727 * as_type<int>(_3547);
    int _3745 = _3743 + _3721;
    bool _3747 = _3607 != 3;
    int _3749 = _3733 * as_type<int>(_3579);
    int _3751 = _3749 + _3735;
    bool _3753 = !_3697;
    int _3755 = _3753 ? 0 : (-1);
    int _3757 = _2216 * _3741;
    int _3759 = _3757 + _3069;
    int _3761 = abs(_3595);
    bool _3763 = !_3747;
    int _3765 = _3763 ? 0 : (-1);
    int _3767 = ~_3695;
    int _3769 = _3767 + 1;
    int _3771 = _3769 + 1;
    int _3773 = abs(_3755);
    int _3775 = _3771;
    if (_3693)
    {
        int _3777 = ~_3695;
        int _3779 = _3777 + 1;
        _3775 = _3779;
    }
    int _3781 = _3775;
    int _3783 = ~_3761;
    int _3785 = _3783 + 1;
    int _3787 = _3785 + 1;
    bool _3789 = !_2521;
    int _3791 = _3789 ? 0 : 1;
    int _3793 = abs(_3765);
    int _3795 = _3787 * as_type<int>(_3627);
    int _3797 = _3795 + _3745;
    int _3799 = abs(_3781);
    int _3801 = abs(_3791);
    int _3803 = ~_3773;
    int _3805 = _3803 + 1;
    int _3807 = _3805 + 1;
    int _3809 = ~_3799;
    int _3811 = _3809 + 1;
    int _3813 = _3811 + 1;
    int _3815 = _3807 * as_type<int>(_3635);
    int _3817 = _3815 + _3797;
    bool _3819 = !_2529;
    int _3821 = _3819 ? 0 : 1;
    int _3823 = _3813 * as_type<int>(_3661);
    int _3825 = _3823 + _3751;
    int _3827 = ~_3793;
    int _3829 = _3827 + 1;
    int _3831 = _3829 + 1;
    int _3833 = abs(_3821);
    float _3835 = _1785 * _1847;
    int _3837 = ~_3801;
    int _3839 = _3837 + 1;
    int _3841 = _3839 + 1;
    int _3843 = _3831 * as_type<int>(_3669);
    int _3845 = _3843 + _3825;
    int _3847 = ~_3833;
    int _3849 = _3847 + 1;
    int _3851 = _3849 + 1;
    float _3853 = _3835 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3855 = _1785 > 0.0;
    bool _3857 = isnan(_1785);
    bool _3859 = _3855 || _3857;
    bool _3861 = isnan(0.0);
    bool _3863 = _3859 || _3861;
    int _3865 = _3817 * _3841;
    bool _3867 = !_2979;
    int _3869 = _3867 ? _3533 : (-1);
    float _3871 = _3853 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _3873 = !_3013;
    int _3875 = _3873 ? _3759 : (-1);
    int _3877 = _3845 * _3851;
    float _3879 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3713);
    int _3881 = _3869 * _3801;
    int _3883 = _3881 + _3865;
    float _3885 = _2133 + _2103;
    int _3887 = _3875 * _3833;
    int _3889 = _3887 + _3877;
    float _3891 = _2103 * 0.5;
    bool _3893 = _1847 <= 0.0;
    bool _3895 = !_3863;
    bool _3897 = _3893 || _3895;
    float _3899 = _3885 * 0.5;
    float _3901 = float(_3883);
    float _3903 = fma(_2137, -0.5, _3891);
    float _3905 = float(_3889);
    float _3907 = _2180 * _3005;
    float _3909 = _3879 + _2103;
    float _3911 = -_2585;
    float _3913 = _3911 + 1.0;
    out.m_45.x = _3871;
    float _3915 = fma(_2186, _3907, _2174);
    float _3917 = fma(_2188, _3907, _2176);
    float _3919 = _3909 * 0.5;
    float _3921 = _2180 * _3913;
    out.gl_Position.x = _2133;
    out.gl_Position.y = _2137;
    out.gl_Position.z = _3879;
    out.gl_Position.w = _2103;
    float _3923 = fma(_2180, _3195, _2178);
    out.m_68.x = _3899;
    out.m_68.y = _3903;
    out.m_68.z = _3919;
    out.m_68.w = _2103;
    out.m_70.y = _3901;
    out.m_70.w = _3905;
    out.m_72.x = _3915;
    out.m_72.y = _3917;
    out.m_72.z = _3923;
    out.m_72.w = _3921;
    if (!_3897)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3925 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3925;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _399 = false;
    bool _187 = false;
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
        float _3982 = as_type<float>(_107);
        out.gl_Position.z = _3982;
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
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4052 = as_type<float>(_145);
        out.gl_Position.z = _4052;
    }
    if (_137)
    {
        return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _151 = as_type<int>(_147) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_147) & 2;
    bool _157 = _155 != 0;
    bool _159 = !_153;
    float _161 = _159 ? (-0.5) : 0.5;
    bool _163 = !_157;
    float _165 = _163 ? (-0.5) : 0.5;
    bool _167 = !_149;
    float _185;
    if (!_167)
    {
        float _169 = in.m_52.x;
        float _171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _173 = _169 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _175 = fma(_173, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _177 = _175 * _171;
        float _179 = floor(_177);
        float _181 = -_179;
        float _183 = _177 + _181;
        _185 = _183;
        _187 = true;
    }
    else
    {
        float _189 = float(_91);
        float _191 = 1.0 / _189;
        float _193 = _125 * _191;
        _185 = _193;
    }
    _187 = false;
    float _195 = _185;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _199 = _195 + _197;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _203 = _195 + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _195 + _205;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _215 = _213 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _217;
    bool _221 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _223 = isnan(_195);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = 1.0 / _211;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _237 = 1.0 / _219;
    float _239 = 1.0 / _215;
    float _241 = _199 * _233;
    bool _243 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _245 = isnan(_195);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -_231;
    float _257 = _255 + 1.0;
    float _259 = _253 * _257;
    float _261 = _203 * _237;
    bool _263 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _265 = isnan(_195);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = -_253;
    float _277 = _275 + 1.0;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _281 = _279 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _283 = _273 * _277;
    float _285 = -_273;
    float _287 = _285 + 1.0;
    float _289 = _207 * _239;
    bool _291 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _293 = isnan(_195);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _303;
    float _307 = fma(_281, _289, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _317 = fma(_305, _241, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _319 = _301 * _287;
    float _321 = fma(_311, _241, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _323 = fma(_315, _289, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _325 = -_301;
    float _327 = _325 + 1.0;
    float _329 = _317 * _319;
    float _331 = _321 * _319;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _333;
    float _337 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].x, _329);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _339;
    float _343 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].y, _331);
    float _345 = fma(_335, _261, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _347 = fma(_307, _283, _337);
    float _349 = fma(_341, _261, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _351 = fma(_323, _283, _343);
    float _353 = fma(_345, _259, _347);
    float _355 = fma(_349, _259, _351);
    float _357 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[146].x, _353);
    float _359 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[146].y, _355);
    bool _361 = !_235;
    float _363 = _355;
    int _365 = as_type<int>(_351);
    int _367 = as_type<int>(_259);
    float _369 = _323;
    float _393;
    float _395;
    float _397;
    if (!_361)
    {
        float _371 = in.m_52.x;
        float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _375 = float(_91);
        float _377 = 1.0 / _375;
        float _379 = _371 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _381 = _125 * _377;
        float _383 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _385 = _383 * _373;
        float _387 = floor(_385);
        float _389 = -_387;
        float _391 = _385 + _389;
        _363 = _387;
        _393 = _375;
        _395 = _391;
        _397 = _381;
        _399 = true;
    }
    else
    {
        float _401 = float(_91);
        float _403 = 1.0 / _401;
        float _405 = _125 * _403;
        _393 = _401;
        _395 = _405;
        _397 = _405;
    }
    _399 = false;
    float _407 = _363;
    float _409 = _393;
    float _411 = _395;
    float _413 = _397;
    float _415 = in.m_52.w;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _419 = _417 != 0;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _423 = _407;
    float _425 = _307;
    if (_419)
    {
        float _427 = in.m_52.x;
        float _429 = in.m_52.y;
        float _431 = in.m_52.z;
        _421 = _427;
        _423 = _429;
        _425 = _431;
    }
    float _433 = _421;
    float _435 = _423;
    float _437 = _425;
    float _439 = 0.0;
    if (_419)
    {
        _439 = 1.0;
    }
    float _441 = _439;
    float _443 = 0.0;
    float _445 = _441;
    if (_419)
    {
        _443 = 1.0;
    }
    float _447 = _443;
    float _449 = _447;
    if (_419)
    {
        _365 = 0;
    }
    int _451 = _365;
    int _453 = _451;
    if (_419)
    {
        _367 = 0;
    }
    int _455 = _367;
    float _457 = 0.0;
    float _459 = _437;
    float _461 = _433;
    int _463 = _455;
    float _465 = _435;
    if (_419)
    {
        _457 = _433;
    }
    float _467 = _457;
    float _469 = _467;
    if (_419)
    {
        _369 = _437;
    }
    float _471 = _369;
    float _473 = 0.0;
    float _475 = _471;
    if (_419)
    {
        _473 = _467;
    }
    float _477 = _473;
    float _479 = 0.0;
    float _481 = _477;
    if (_419)
    {
        _479 = _435;
    }
    float _483 = _479;
    float _485 = _483;
    if (!_419)
    {
        float _487 = in.m_52.x;
        float _489 = in.m_52.y;
        float _491 = in.m_52.z;
        float _493 = _487 * 3.1415927410125732421875;
        float _495 = _493 * 0.15915493667125701904296875;
        float _497 = _489 * 3.1415927410125732421875;
        float _499 = _497 * 0.15915493667125701904296875;
        float _501 = _491 * 3.1415927410125732421875;
        float _503 = _495 * 6.283185482025146484375;
        float _505 = sin(_503);
        float _507 = _501 * 0.15915493667125701904296875;
        float _509 = _499 * 6.283185482025146484375;
        float _511 = sin(_509);
        float _513 = _507 * 6.283185482025146484375;
        float _515 = sin(_513);
        _459 = _491;
        _453 = 1;
        _461 = _487;
        _463 = 2;
        _465 = _489;
        _475 = _515;
        _481 = _505;
        _485 = _511;
        _449 = 1.2345600128173828125;
        _469 = _489;
        _445 = 7.345489978790283203125;
    }
    float _517 = _459;
    int _519 = _453;
    float _521 = _461;
    int _523 = _463;
    float _525 = _465;
    float _527 = _475;
    float _529 = _481;
    float _531 = _485;
    float _533 = _449;
    float _535 = _469;
    float _537 = _445;
    float _539 = _517 * 2.0;
    bool _541 = _519 != 1;
    float _543 = _521 * 2.0;
    bool _545 = _415 > 0.5;
    float _547 = _521 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _549 = in.m_42.x;
    float _551 = in.m_42.y;
    float _553 = in.m_42.z;
    float _555 = floor(_539);
    bool _557 = _523 != 2;
    float _559 = _525 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _561 = -_165;
    int _563 = _545 ? as_type<int>(_561) : as_type<int>(_165);
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[94].z + (*spvDescriptorSet0.vp_c9)._m0[94].y;
    float _567 = 0.0;
    if (!_541)
    {
        _567 = _517;
    }
    float _569 = _567;
    float _571 = floor(_543);
    float _573 = 0.0;
    float _575 = _569;
    if (!_541)
    {
        _573 = _525;
    }
    float _577 = _573;
    float _579 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[94].z, _565);
    float _581 = 0.0;
    float _583 = _577;
    if (!_541)
    {
        _581 = _569;
    }
    float _585 = _581;
    float _587 = 0.0;
    float _589 = _585;
    if (_557)
    {
        _587 = _525;
    }
    float _591 = _587;
    float _593 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[94].x, _579);
    bool _595 = _555 > 0.0;
    float _597 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _599 = log2(_597);
    bool _601 = _555 >= 0.0;
    bool _603 = isnan(_555);
    bool _605 = _601 || _603;
    bool _607 = isnan(0.0);
    bool _609 = _605 || _607;
    float _611 = 0.0;
    float _613 = _591;
    if (_557)
    {
        _611 = _521;
    }
    float _615 = _611;
    float _617 = _551 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _619 = _551 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _621 = _609 ? 0 : 1;
    float _623 = 1.0 / _409;
    float _625 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[4].x, _617);
    float _627 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[6].x, _619);
    int _629 = ~_621;
    int _631 = _629 + 1;
    int _633 = _631 + 1;
    float _635 = 0.0;
    float _637 = _615;
    int _639 = _633;
    if (!_541)
    {
        _635 = _525;
    }
    float _641 = _635;
    float _643 = fma(_553, (*spvDescriptorSet0.vp_c10)._m0[4].z, _625);
    float _645 = 0.0;
    float _647 = _641;
    if (!_541)
    {
        _645 = _521;
    }
    float _649 = _645;
    float _651 = _649;
    if (!_557)
    {
        _613 = _521;
    }
    float _653 = _613;
    float _655 = _643 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (!_557)
    {
        _637 = _517;
    }
    float _657 = _637;
    if (!_595)
    {
        int _659 = ~_621;
        int _661 = _659 + 1;
        _639 = _661;
    }
    int _663 = _639;
    float _665 = fma(_553, (*spvDescriptorSet0.vp_c10)._m0[6].z, _627);
    if (_541)
    {
        _589 = _525;
    }
    float _667 = _589;
    float _669 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _671 = _655 + _669;
    float _673 = _671;
    if (_541)
    {
        _575 = _525;
    }
    float _675 = _575;
    float _677 = _665 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _679 = _677;
    if (_541)
    {
        _583 = _521;
    }
    float _681 = _583;
    float _683 = _657 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_541)
    {
        _647 = _521;
    }
    float _685 = _647;
    if (_541)
    {
        _651 = _517;
    }
    float _687 = _651;
    int _689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _691 = _689 != 0;
    int _693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _695 = _693 != 0;
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _699 = _697 != 0;
    bool _701 = _517 > 0.5;
    bool _703 = _525 > 0.5;
    int _705 = int(_545);
    int _707 = _595 ? 2 : 0;
    int _709 = _705 | _707;
    int _711 = _701 ? 4 : 0;
    int _713 = _709 | _711;
    int _715 = _691 ? 8 : 0;
    int _717 = _713 | _715;
    int _719 = _695 ? 16 : 0;
    int _721 = _717 | _719;
    int _723 = _699 ? 32 : 0;
    int _725 = _721 | _723;
    int _727 = _703 ? 64 : 0;
    int _729 = _725 | _727;
    int _731 = _729 & 4;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _735 = -_165;
    int _737 = _701 ? as_type<int>(_735) : as_type<int>(_165);
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _741 = !_691;
    float _743 = _741 ? _165 : as_type<float>(_563);
    float _745 = -_677;
    float _747 = _745 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _749 = -_161;
    int _751 = _703 ? as_type<int>(_749) : as_type<int>(_161);
    float _753 = -_733;
    float _755 = fma(_547, 2.0, _753);
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _771 = _769 != 0;
    float _773 = fma(_559, -2.0, _739);
    int _775 = int(_759);
    int _777 = _763 ? 2 : 0;
    int _779 = _775 | _777;
    int _781 = _767 ? 4 : 0;
    int _783 = _779 | _781;
    int _785 = _771 ? 8 : 0;
    int _787 = _783 | _785;
    int _789 = _695 ? 16 : 0;
    int _791 = _787 | _789;
    int _793 = _699 ? 32 : 0;
    int _795 = _791 | _793;
    int _797 = _703 ? 64 : 0;
    int _799 = _795 | _797;
    int _801 = _799 & 64;
    float _803 = _525 * 2.0;
    bool _805 = !_699;
    float _807 = _805 ? _165 : as_type<float>(_737);
    float _809 = -_125;
    float _811 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[76].x, _755);
    bool _813 = !_695;
    float _815 = _813 ? _161 : as_type<float>(_751);
    float _817 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _773);
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _821 = _819 != 0;
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _825 = _823 != 0;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _829 = _827 != 0;
    float _831 = floor(_803);
    float _833 = abs(_671);
    float _835 = abs(_747);
    float _837 = precise::max(_833, _835);
    bool _839 = !_759;
    int _841 = _839 ? 0 : 1;
    bool _843 = !_821;
    int _845 = _843 ? 0 : 1;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _849 = _571 >= 0.0;
    bool _851 = isnan(_571);
    bool _853 = _849 || _851;
    bool _855 = isnan(0.0);
    bool _857 = _853 || _855;
    bool _859 = _837 >= 16.0;
    int _861 = _857 ? 0 : 1;
    bool _863 = _571 > 0.0;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _867 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[93].z, _847);
    float _869 = _529 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _871 = _525 + _517;
    float _873 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[93].w, _865);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _877 = _531 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _879 = _871 + (-1.0);
    float _881 = _517 + _521;
    float _883 = fma(_877, -2.0, _875);
    float _885 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _887 = _881 + (-1.0);
    int _889 = ~_861;
    int _891 = _889 + 1;
    int _893 = _891 + 1;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _897 = _893;
    float _899 = _747;
    if (!_863)
    {
        int _901 = ~_861;
        int _903 = _901 + 1;
        _897 = _903;
    }
    int _905 = _897;
    float _907 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _873);
    bool _909 = _831 >= 0.0;
    bool _911 = isnan(_831);
    bool _913 = _909 || _911;
    bool _915 = isnan(0.0);
    bool _917 = _913 || _915;
    float _919 = -_895;
    float _921 = fma(_869, 2.0, _919);
    float _923 = _525 + _521;
    int _925 = _917 ? 0 : 1;
    float _927 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _883);
    bool _929 = _831 > 0.0;
    float _931 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _933 = _923 + (-1.0);
    if (_859)
    {
        float _935 = _747 * 0.0625;
        _899 = _935;
    }
    float _937 = _899;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _941 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _943 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[83].w, _939);
    float _945 = _599 * _125;
    float _947 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _949 = int(_947);
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _957 = abs(_845);
    float _959 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[84].z, _951);
    float _961 = _681 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _963 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _965 = int(_963);
    int _967 = ~_925;
    int _969 = _967 + 1;
    int _971 = _969 + 1;
    float _973 = -_953;
    float _975 = fma(_961, 2.0, _973);
    float _977 = _667 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _979 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[83].z, _955);
    int _981 = _971;
    if (!_929)
    {
        int _983 = ~_925;
        int _985 = _983 + 1;
        _981 = _985;
    }
    int _987 = _981;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _991 = exp2(_945);
    float _993 = float(_949);
    float _995 = -_989;
    float _997 = fma(_683, 2.0, _995);
    float _999 = _653 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1001 = -_125;
    float _1003 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[91].x, _921);
    float _1005 = float(_663);
    float _1007 = 1.0 / _993;
    float _1009 = float(_957);
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1013 = float(_965);
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1017 = 1.0 + _1015;
    bool _1019 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1021 = isnan(0.0);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1027 = _1023 || _1025;
    float _1029 = _1009 * _1005;
    float _1031 = fma(_977, -2.0, _1011);
    float _1033 = -_991;
    float _1035 = _1033 + 1.0;
    float _1037 = 1.0 / _1013;
    float _1039 = _1029 * (-2.0);
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1043 = 1.0 / _1017;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1049 = _1027 ? _1035 : 0.0;
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1053 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1055 = isnan(1.0);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1061 = _1057 || _1059;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1067 = _1007 * _125;
    float _1069 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1041);
    float _1071 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1031);
    float _1073 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1045);
    float _1075 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1047);
    float _1077 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[84].x, _959);
    float _1079 = _521 + (-0.5);
    float _1081 = fma(_999, -2.0, _1051);
    float _1083 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1063);
    float _1085 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1065);
    float _1087 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _867);
    float _1089 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _979);
    bool _1091 = !_825;
    int _1093 = _1091 ? 0 : 1;
    float _1095 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _943);
    bool _1097 = !_829;
    int _1099 = _1097 ? 0 : 1;
    float _1101 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1069);
    float _1103 = fma(_941, _1039, _941);
    float _1105 = _623 * _125;
    float _1107 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1073);
    float _1109 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1075);
    float _1111 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1113 = _1037 * _125;
    float _1115 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1083);
    float _1117 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1085);
    float _1119 = -_125;
    float _1121 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[81].x, _975);
    float _1123 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1081);
    float _1125 = -_125;
    float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[86].x, _997);
    int _1129 = abs(_1093);
    if (_1061)
    {
        float _1131 = _1049 * _1043;
        _127 = _1131;
    }
    float _1133 = _127;
    int _1135 = abs(_1099);
    float _1137 = _671 * 0.0625;
    bool _1139 = !_763;
    int _1141 = _1139 ? 0 : 1;
    float _1143 = fma(_1103, _1133, _1111);
    bool _1145 = !_767;
    int _1147 = _1145 ? 0 : 1;
    float _1149 = _525 + (-0.5);
    bool _1151 = !_771;
    int _1153 = _1151 ? 0 : 1;
    float _1155 = _1143 * 0.15915493667125701904296875;
    int _1157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1159 = _1157 != 0;
    int _1161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1163 = _1161 != 0;
    int _1165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1167 = _1165 != 0;
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1171 = _1169 != 0;
    float _1173 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1175 = float(_905);
    float _1177 = _1155 * 6.283185482025146484375;
    float _1179 = sin(_1177);
    float _1181 = float(_987);
    float _1183 = float(_1129);
    float _1185 = float(_1135);
    float _1187 = _859 ? _1137 : _671;
    float _1189 = _1183 * _1175;
    bool _1191 = !_1163;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = _1185 * _1181;
    float _1197 = abs(_1187);
    bool _1199 = _1197 != 0.0;
    bool _1201 = isnan(_1197);
    bool _1203 = _1199 || _1201;
    bool _1205 = isnan(0.0);
    bool _1207 = _1203 || _1205;
    float _1209 = _1189 * (-2.0);
    bool _1211 = !_1159;
    int _1213 = _1211 ? 0 : 1;
    float _1215 = _1195 * (-2.0);
    float _1217 = abs(_937);
    bool _1219 = _1217 == 0.0;
    bool _1221 = !_1207;
    bool _1223 = _1219 && _1221;
    float _1225 = in.m_54.x;
    float _1227 = in.m_54.y;
    float _1229 = abs(_937);
    bool _1231 = _1229 == 0.0;
    float _1233 = fma(_885, _1209, _885);
    float _1235 = fma(_931, _1215, _931);
    float _1237 = _1155 * 6.283185482025146484375;
    float _1239 = cos(_1237);
    float _1241 = _517 + (-0.5);
    bool _1243 = !_1167;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = fma(_1233, _1133, _1173);
    bool _1249 = !_1171;
    int _1251 = _1249 ? 0 : 1;
    float _1253 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _1255 = _1167;
    int _1257 = _1135;
    int _1259 = as_type<int>(_1133);
    if (_1223)
    {
        bool _1261 = as_type<int>(_937) >= 0;
        _1255 = _1261;
    }
    bool _1263 = _1255;
    float _1265 = fma(_1235, _1133, _1253);
    int _1267 = _1263 ? (-1) : 0;
    if (_1223)
    {
        int _1269 = _1263 ? 0 : 1078530011;
        _1257 = _1269;
    }
    int _1271 = _1257;
    if (_1223)
    {
        int _1273 = int(0x80000000) & as_type<int>(_1187);
        int _1275 = _1271 | _1273;
        _1259 = _1275;
    }
    int _1277 = _1259;
    bool _1279 = !_1207;
    bool _1281 = _1279 && _1231;
    int _1283 = _1277;
    float _1285 = as_type<float>(_1277);
    if (!_1281)
    {
        float _1287 = abs(_1187);
        bool _1289 = _1287 != as_type<float>(0x7f800000u /* inf */);
        bool _1291 = isnan(_1287);
        bool _1293 = _1289 || _1291;
        bool _1295 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1297 = _1293 || _1295;
        float _1299 = abs(_937);
        bool _1301 = _1299 == as_type<float>(0x7f800000u /* inf */);
        float _1303 = abs(_937);
        bool _1305 = _1303 == as_type<float>(0x7f800000u /* inf */);
        bool _1307 = !_1297;
        bool _1309 = _1305 && _1307;
        if (_1309)
        {
            bool _1311 = as_type<int>(_937) >= 0;
            _1267 = _1311 ? (-1) : 0;
        }
        int _1313 = _1267;
        if (_1309)
        {
            _1283 = 1075235812;
        }
        int _1315 = _1283;
        int _1317 = _1315;
        if (_1309)
        {
            int _1319 = ~_1313;
            int _1321 = (_1319 != 0) ? _1315 : 1061752795;
            _1317 = _1321;
        }
        int _1323 = _1317;
        float _1325 = as_type<float>(_1323);
        if (_1309)
        {
            int _1327 = int(0x80000000) & as_type<int>(_1187);
            int _1329 = _1323 | _1327;
            _1325 = as_type<float>(_1329);
        }
        float _1331 = _1325;
        bool _1333 = !_1297;
        bool _1335 = _1333 && _1301;
        _1285 = _1331;
        if (!_1335)
        {
            float _1337 = abs(_937);
            float _1339 = abs(_1187);
            float _1341 = precise::max(_1337, _1339);
            float _1343 = abs(_937);
            float _1345 = abs(_1187);
            float _1347 = precise::min(_1343, _1345);
            float _1349 = 1.0 / _1341;
            float _1351 = abs(_1187);
            float _1353 = abs(_937);
            bool _1355 = _1351 > _1353;
            bool _1357 = as_type<int>(_937) >= 0;
            float _1359 = abs(_937);
            float _1361 = abs(_1187);
            float _1363 = _1359 + _1361;
            int _1365 = as_type<int>(_1187) & int(0x80000000);
            bool _1367 = _1363 > as_type<float>(0x7f800000u /* inf */);
            bool _1369 = isnan(_1363);
            bool _1371 = _1367 || _1369;
            bool _1373 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1375 = _1371 || _1373;
            float _1377 = _1347 * _1349;
            float _1379 = _1377 * _1377;
            float _1381 = _1379 + 11.33538818359375;
            float _1383 = fma(_1379, _1381, 28.84246826171875);
            float _1385 = fma(_1379, _1383, 19.6966705322265625);
            float _1387 = fma(_1379, -0.82336294651031494140625, -5.674867153167724609375);
            float _1389 = fma(_1379, _1387, -6.565555095672607421875);
            float _1391 = 1.0 / _1385;
            float _1393 = _1379 * _1389;
            float _1395 = _1377 * _1393;
            float _1397 = fma(_1395, _1391, _1377);
            float _1399 = _1397;
            _1285 = _1363;
            if (_1355)
            {
                float _1401 = -_1397;
                float _1403 = _1401 + 1.57079637050628662109375;
                _1399 = _1403;
            }
            float _1405 = _1399;
            int _1407 = as_type<int>(_1405);
            if (!_1357)
            {
                float _1409 = -_1405;
                float _1411 = _1409 + 3.1415927410125732421875;
                _1407 = as_type<int>(_1411);
            }
            int _1413 = _1407;
            if (!_1375)
            {
                int _1415 = _1365 | _1413;
                _1285 = as_type<float>(_1415);
            }
        }
    }
    float _1417 = _1285;
    float _1419 = -_1417;
    float _1421 = _1247 + _1419;
    float _1423 = _1265 * 0.15915493667125701904296875;
    float _1425 = _359 * _1227;
    float _1427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _165);
    float _1429 = _1421 * 0.15915493667125701904296875;
    float _1431 = _1423 * 6.283185482025146484375;
    float _1433 = cos(_1431);
    float _1435 = _1425 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1437 = _551 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1439 = _357 * _1225;
    float _1441 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _161);
    float _1443 = _1427 * _1435;
    float _1445 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1437);
    float _1447 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1449 = _1429 * 6.283185482025146484375;
    float _1451 = sin(_1449);
    float _1453 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1455 = fma(_553, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1445);
    float _1457 = _1441 * _1447;
    bool _1459 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1461 = isnan(0.5);
    bool _1463 = _1459 || _1461;
    bool _1465 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1467 = _1463 || _1465;
    float _1469 = _1455 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1471 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1473 = isnan(0.5);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1479 = _1475 || _1477;
    float _1481 = _1429 * 6.283185482025146484375;
    float _1483 = cos(_1481);
    float _1485 = _1433 * _1443;
    float _1487 = _1179 * _1485;
    float _1489 = _1423 * 6.283185482025146484375;
    float _1491 = sin(_1489);
    float _1493 = _1239 * _1451;
    float _1495 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1497 = _1179 * _1483;
    float _1499 = _1239 * _1483;
    float _1501 = _1483 * _1433;
    float _1503 = -_1493;
    float _1505 = fma(_1491, _1497, _1503);
    float _1507 = -_1443;
    float _1509 = _1491 * _1507;
    float _1511 = -_1497;
    float _1513 = fma(_1491, _1493, _1511);
    float _1515 = fma(_1505, _1457, _1487);
    float _1517 = _1179 * _1451;
    float _1519 = _1451 * _1433;
    float _1521 = fma(_1501, _1457, _1509);
    float _1523 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1495);
    float _1525 = fma(_1491, _1517, _1499);
    float _1527 = fma(_1519, _1453, _1521);
    float _1529 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1523);
    float _1531 = fma(_1525, _1453, _1515);
    float _1533 = fma(_1491, _1499, _1517);
    float _1535 = _655 + _1527;
    float _1537 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1539 = _677 + _1531;
    float _1541 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1543 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1545 = _1535 + _1543;
    float _1547 = 1.0 / _1537;
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1551 = _1539 + _1549;
    float _1553 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1541);
    float _1555 = _1239 * _1485;
    float _1557 = _1551 * _1551;
    float _1559 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1553);
    float _1561 = fma(_1533, _1457, _1555);
    float _1563 = fma(_1545, _1545, _1557);
    float _1565 = _1559 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1567 = fma(_1513, _1453, _1561);
    float _1569 = sqrt(_1563);
    float _1571 = _1565 + _1537;
    float _1573 = _1469 + _1567;
    float _1575 = _1571 * _1547;
    float _1577 = _1575 * 0.5;
    float _1579 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1581 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1579);
    float _1583 = 1.0 / _1581;
    bool _1585 = _1569 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1587 = _1567;
    float _1589 = _1513;
    float _1591 = _1557;
    float _1593 = _1581;
    float _1595 = _1457;
    float _1597 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    bool _1599 = _1479;
    bool _1601 = _1467;
    if (!_1585)
    {
        _1587 = _1535;
    }
    float _1603 = _1587;
    float _1605 = _1603;
    if (!_1585)
    {
        _1589 = _1539;
    }
    float _1607 = _1589;
    float _1609 = _1607;
    if (!_1585)
    {
        _1591 = _1573;
    }
    float _1611 = _1591;
    bool _1613 = !_1585;
    float _1615 = _1611;
    if (!_1613)
    {
        float _1617 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1621 = _1569 + _1619;
        float _1623 = rsqrt(_1563);
        float _1625 = _1621 * _1617;
        float _1627 = _1573 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1629 = _1625 * 0.15915493667125701904296875;
        float _1631 = _1629 * 6.283185482025146484375;
        float _1633 = cos(_1631);
        float _1635 = _1629 * 6.283185482025146484375;
        float _1637 = sin(_1635);
        float _1639 = _1633 + (-1.0);
        float _1641 = fma(_1637, _1627, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1643 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1645 = _1623 * _1641;
        float _1647 = fma(_1573, _1633, _1643);
        float _1649 = fma(_1545, _1645, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1651 = fma(_1551, _1645, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1615 = _1647;
        _1605 = _1649;
        _1609 = _1651;
    }
    float _1653 = _1615;
    float _1655 = _1605;
    float _1657 = _1609;
    float _1659 = _1653;
    float _1661 = _1655;
    float _1663 = _1657;
    if (_1479)
    {
        _1593 = 1.0;
    }
    float _1665 = _1593;
    float _1667 = _1665;
    if (!_1467)
    {
        float _1669 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1671 = _1469 + _1669;
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1675 = -_1469;
        float _1677 = _1675 + _1653;
        float _1679 = _1671 * _1671;
        float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1683 = _677 + _1681;
        float _1685 = fma(_671, _671, _1679);
        float _1687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1689 = fma(_1683, _1683, _1685);
        float _1691 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1693 = sqrt(_1689);
        float _1695 = -_655;
        float _1697 = _1695 + _1655;
        float _1699 = precise::min(_1693, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1701 = _1699 * _1687;
        float _1703 = _1691 * _1701;
        float _1705 = -_677;
        float _1707 = _1705 + _1657;
        float _1709 = fma(_1697, _1703, _655);
        float _1711 = fma(_1677, _1703, _1469);
        float _1713 = fma(_1707, _1703, _677);
        _1659 = _1711;
        _1661 = _1709;
        _1663 = _1713;
        _673 = _1699;
    }
    float _1715 = _1659;
    float _1717 = _1661;
    float _1719 = _1663;
    float _1721 = _673;
    float _1723 = _1721;
    if (_1479)
    {
        _1595 = 1.0;
    }
    float _1725 = _1595;
    float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1729 = _1583 * _1727;
    float _1731 = _1725;
    if (!_1479)
    {
        float _1733 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1735 = _1733 * 0.15915493667125701904296875;
        float _1737 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1739 = _1735 * 6.283185482025146484375;
        float _1741 = cos(_1739);
        float _1743 = _1737 * 0.15915493667125701904296875;
        float _1745 = _1735 * 6.283185482025146484375;
        float _1747 = sin(_1745);
        float _1749 = 1.0 / _1741;
        float _1751 = _1743 * 6.283185482025146484375;
        float _1753 = cos(_1751);
        float _1755 = _1747 * _1749;
        float _1757 = _1743 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        float _1761 = _1753 * _1755;
        float _1763 = 1.0 / _1761;
        float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1767 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1765;
        float _1769 = 1.0 / _1767;
        float _1771 = _1759 * _1763;
        float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1775 = fma(_1729, _1771, _1773);
        float _1777 = _1775 * _1769;
        float _1779 = precise::clamp(_1777, 0.0, 1.0);
        _1723 = _1743;
        _679 = _1749;
        _1667 = _1779;
    }
    float _1781 = _1723;
    float _1783 = _679;
    float _1785 = _1667;
    float _1787 = _1781;
    float _1789 = _1783;
    if (!_1479)
    {
        float _1791 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1793 = _1791 * 0.15915493667125701904296875;
        float _1795 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1797 = _1793 * 6.283185482025146484375;
        float _1799 = cos(_1797);
        float _1801 = _1795 * 0.15915493667125701904296875;
        float _1803 = _1793 * 6.283185482025146484375;
        float _1805 = sin(_1803);
        float _1807 = 1.0 / _1799;
        float _1809 = _1801 * 6.283185482025146484375;
        float _1811 = cos(_1809);
        float _1813 = _1805 * _1807;
        float _1815 = _1801 * 6.283185482025146484375;
        float _1817 = sin(_1815);
        float _1819 = _1811 * _1813;
        float _1821 = 1.0 / _1819;
        float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1825 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1823;
        float _1827 = 1.0 / _1825;
        float _1829 = _1817 * _1821;
        float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1833 = fma(_1729, _1829, _1831);
        float _1835 = _1833 * _1827;
        float _1837 = precise::clamp(_1835, 0.0, 1.0);
        float _1839 = -_1837;
        float _1841 = _1839 + 1.0;
        _1787 = _1805;
        _1789 = _1793;
        _1731 = _1841;
    }
    float _1843 = _1787;
    float _1845 = _1789;
    float _1847 = _1731;
    float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1851 = _1715 + _1849;
    float _1853 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1855 = _1717 + _1853;
    float _1857 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1859 = _1719 + _1857;
    bool _1861 = _731 != 0;
    float _1863 = _1851 * _1851;
    bool _1865 = _801 != 0;
    float _1867 = fma(_1855, _1855, _1863);
    float _1869 = fma(_1859, _1859, _1867);
    float _1871 = rsqrt(_1869);
    float _1873 = sqrt(_1869);
    float _1875 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1877 = _1855 * _1875;
    float _1879 = _1859 * _1875;
    float _1881 = _1877 * _1877;
    float _1883 = _1879 * _1879;
    float _1885 = _1881 + _1883;
    float _1887 = sqrt(_1885);
    bool _1889 = _1887 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1893 = _1887 + _1891;
    float _1895 = _1871;
    float _1897 = _1893;
    float _1899 = _1843;
    float _1901 = _1851;
    float _1903 = _1875;
    if (_1889)
    {
        float _1905 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1895 = _1905;
    }
    float _1907 = _1895;
    float _1909 = _1907;
    if (_1889)
    {
        float _1911 = _1893 * _1907;
        _1897 = _1911;
    }
    float _1913 = _1897;
    if (_1889)
    {
        float _1915 = rsqrt(_1885);
        _1909 = _1915;
    }
    float _1917 = _1909;
    float _1919 = _1917;
    if (_1889)
    {
        float _1921 = _1913 * 0.15915493667125701904296875;
        _1899 = _1921;
    }
    float _1923 = _1899;
    float _1925 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1927 = _1859;
    float _1929 = _1923;
    if (_1889)
    {
        float _1931 = _1923 * 6.283185482025146484375;
        float _1933 = sin(_1931);
        _1927 = _1933;
    }
    float _1935 = _1927;
    float _1937 = precise::max(0.0, _1925);
    float _1939 = _1845;
    float _1941 = _1937;
    if (_1889)
    {
        float _1943 = _1923 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        _1939 = _1945;
    }
    float _1947 = _1939;
    float _1949 = -_1875;
    float _1951 = -_1937;
    float _1953 = fma(_1851, _1949, _1951);
    if (_1889)
    {
        float _1955 = _1953 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1901 = _1955;
    }
    float _1957 = _1901;
    float _1959 = _1935;
    float _1961 = _1957;
    if (_1889)
    {
        float _1963 = fma(_1935, _1957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1959 = _1963;
    }
    float _1965 = _1959;
    float _1967 = _1965;
    if (!_1889)
    {
        _1961 = _1879;
    }
    float _1969 = _1961;
    float _1971 = _1969;
    if (!_1889)
    {
        _1929 = _1881;
    }
    float _1973 = _1929;
    float _1975 = _1973;
    if (_1889)
    {
        float _1977 = _1917 * _1965;
        _1597 = _1977;
    }
    float _1979 = _1597;
    if (!_1889)
    {
        _1919 = _1877;
    }
    float _1981 = _1919;
    float _1983 = _1981;
    if (_1889)
    {
        float _1985 = _1947 + (-1.0);
        _1941 = _1985;
    }
    float _1987 = _1941;
    float _1989 = _1987;
    if (_1889)
    {
        float _1991 = _1877 * _1979;
        _1983 = _1991;
    }
    float _1993 = _1983;
    if (!_1889)
    {
        _1967 = _1953;
    }
    float _1995 = _1967;
    float _1997 = _1995;
    if (_1889)
    {
        float _1999 = _1879 * _1979;
        _1971 = _1999;
    }
    float _2001 = _1971;
    if (_1889)
    {
        float _2003 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1903 = _2003;
    }
    float _2005 = _1903;
    if (_1889)
    {
        float _2007 = _1993 * _1993;
        _1975 = _2007;
    }
    float _2009 = _1975;
    if (!_1889)
    {
        _1989 = _1883;
    }
    float _2011 = _1989;
    float _2013 = _2011;
    if (_1889)
    {
        float _2015 = _2001 * _2001;
        _2013 = _2015;
    }
    float _2017 = _2013;
    if (_1889)
    {
        float _2019 = fma(_1953, _1947, _2005);
        _1997 = _2019;
    }
    float _2021 = _1997;
    float _2023 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2025 = fma(_2021, _2021, _2009);
    float _2027 = _2025 + _2017;
    float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2031 = fma(_1873, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2029);
    float _2033 = precise::clamp(_2031, 0.0, 1.0);
    float _2035 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2023);
    float _2037 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2039 = rsqrt(_2027);
    float _2041 = -_2033;
    float _2043 = _2041 + 1.0;
    float _2045 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2035);
    float _2047 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2049 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2037);
    float _2051 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2053 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2055 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2047);
    float _2057 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2049);
    float _2059 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2051);
    float _2061 = abs(_2043);
    float _2063 = log2(_2061);
    float _2065 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2055);
    float _2067 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2069 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2059);
    float _2071 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2073 = _2065 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2075 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2077 = _2039 * _1993;
    float _2079 = _2039 * _2021;
    float _2081 = _2039 * _2001;
    float _2083 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2075);
    float _2085 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2087 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2089 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2091 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2083);
    float _2093 = -_2085;
    float _2095 = fma(_2079, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2093);
    float _2097 = -_2087;
    float _2099 = fma(_2097, _2071, 1.0);
    float _2101 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2103 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2091);
    float _2105 = -_2081;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2095);
    float _2109 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2111 = exp2(_2101);
    float _2113 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2115 = fma(_2107, -0.5, 0.5);
    float _2117 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2109);
    float _2119 = fma(_2107, 0.5, 0.5);
    float _2121 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2113);
    float _2123 = _2079 + 1.0;
    float _2125 = log2(_2099);
    float _2127 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2117);
    float _2129 = fma(_2119, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2131 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2121);
    float _2133 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2127);
    float _2135 = fma(_2119, _2129, -0.212114393711090087890625);
    float _2137 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2131);
    float _2139 = 1.0 / _2103;
    float _2141 = -_2079;
    float _2143 = fma(_2111, _2123, _2141);
    float _2145 = fma(_2119, _2135, 1.570728778839111328125);
    float _2147 = fma(_2143, 0.5, 0.5);
    float _2149 = sqrt(_2115);
    float _2151 = _2125 * 0.693147182464599609375;
    float _2153 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2155 = _2133 * _2139;
    float _2157 = _2137 * _2139;
    float _2159 = fma(_2155, 0.5, 0.5);
    float _2161 = fma(_2157, -0.5, 0.5);
    float _2163 = _2149 * 0.636619746685028076171875;
    float _2165 = -_2145;
    float _2167 = fma(_2163, _2165, 1.0);
    float3 _7102 = float3(_2159, _2161, _2153);
    float _2169 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7102, float3(0.0), isnan(_7102)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7102, float3(0.0), isnan(_7102)), level(0.0)).x;
    float3 _7113 = float3(_2159, _2161, _2153);
    float4 _2172 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7113, float3(0.0), isnan(_7113)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7113, float3(0.0), isnan(_7113)), level(0.0)).xyzw;
    float _2174 = _2172.x;
    float _2176 = _2172.y;
    float _2178 = _2172.z;
    float _2180 = _2172.w;
    float2 _7130 = float2(_2167, _2147);
    float3 _2184 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7130, float2(0.0), isnan(_7130)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7130, float2(0.0), isnan(_7130)), level(0.0)).xyz;
    float _2186 = _2184.x;
    float _2188 = _2184.y;
    float _2190 = _2184.z;
    float _2192 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2194 = int(_2192);
    int _2196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2198 = _2196 != 0;
    float _2200 = _1077 * (-0.15915493667125701904296875);
    int _2202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2204 = _2202 != 0;
    float _2206 = -_1087;
    float _2208 = _2206 + 1.0;
    float _2210 = -_907;
    float _2212 = _2210 + 1.0;
    float _2214 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2216 = int(_2214);
    float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2220 = _2218 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2222 = -_1115;
    float _2224 = _2222 + 1.0;
    float _2226 = 0.5;
    if (_2198)
    {
        float _2228 = in.m_52.w;
        _2226 = _2228;
    }
    float _2230 = _2226;
    float _2232 = trunc(_1113);
    int _2234 = int(_2232);
    float _2236 = float(uint(_2194));
    float _2238 = trunc(_1067);
    int _2240 = int(_2238);
    float _2242 = float(uint(_2216));
    float _2244 = _2161;
    if (_2204)
    {
        float _2246 = in.m_52.x;
        _2244 = _2246;
    }
    float _2248 = _2244;
    int _2250 = ~_2194;
    int _2252 = _2250 + 1;
    float _2254 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2256 = _2254 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2260 = _2258 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2262 = 1.0 / _2236;
    float _2264 = float(uint(_2234));
    float _2266 = -_1109;
    float _2268 = _2266 + 1.0;
    float _2270 = -_1117;
    float _2272 = _2270 + 1.0;
    float _2274 = _2230;
    if (_2198)
    {
        float _2276 = _2230 * 3.1415927410125732421875;
        _2274 = _2276;
    }
    float _2278 = _2274;
    bool _2280 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2282 = isnan(_411);
    bool _2284 = _2280 || _2282;
    bool _2286 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2288 = _2284 || _2286;
    float _2290 = float(_2288);
    float _2292 = 1.0 / _2242;
    bool _2294 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2296 = isnan(_413);
    bool _2298 = _2294 || _2296;
    bool _2300 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2302 = _2298 || _2300;
    float _2304 = float(_2302);
    float _2306 = _2278;
    if (_2198)
    {
        float _2308 = _2278 * 0.15915493667125701904296875;
        _2306 = _2308;
    }
    float _2310 = _2306;
    bool _2312 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2314 = isnan(_413);
    bool _2316 = _2312 || _2314;
    bool _2318 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2320 = _2316 || _2318;
    float _2322 = float(_2320);
    float _2324 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2326 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2328 = isnan(_413);
    bool _2330 = _2326 || _2328;
    bool _2332 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2334 = _2330 || _2332;
    float _2336 = float(_2334);
    float _2338 = float(_2216);
    float _2340 = _2310;
    if (_2198)
    {
        float _2342 = _2310 * 6.283185482025146484375;
        float _2344 = sin(_2342);
        _2340 = _2344;
    }
    float _2346 = _2340;
    int _2348 = as_type<int>(_2262) + (-2);
    float _2350 = float(uint(_2240));
    int _2352 = abs(_1141);
    float _2354 = as_type<float>(_2348) * _2264;
    int _2356 = abs(_1193);
    float _2358 = 1.0 / _2220;
    int _2360 = as_type<int>(_2292) + (-2);
    int _2362 = abs(_1153);
    float _2364 = as_type<float>(_2360) * _2350;
    float _2366 = trunc(_2354);
    float _2368 = precise::max(_2366, 0.0);
    uint _2371 = uint(_2368);
    int _2373 = ~_2216;
    int _2375 = _2373 + 1;
    if (_2198)
    {
        bool _2377 = _2346 > 0.5;
        _1599 = _2377;
    }
    bool _2379 = _1599;
    float _2381 = trunc(_2364);
    float _2383 = precise::max(_2381, 0.0);
    uint _2385 = uint(_2383);
    int _2387 = _2252 * int(_2371);
    int _2389 = _2387 + _2234;
    float _2391 = 1.0 / _2256;
    float _2393 = float(uint(_2389));
    float _2395 = as_type<float>(_2389);
    if (_2204)
    {
        float _2397 = _2248 * 3.1415927410125732421875;
        _2395 = _2397;
    }
    float _2399 = _2395;
    float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2403 = _2401 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _2405 = _2375 * int(_2385);
    int _2407 = _2405 + _2240;
    int _2409 = ~_2194;
    int _2411 = _2409 + 1;
    float _2413 = as_type<float>(_2348) * _2393;
    float _2415 = _2399;
    float _2417 = as_type<float>(_2411);
    if (_2204)
    {
        float _2419 = _2399 * 0.15915493667125701904296875;
        _2415 = _2419;
    }
    float _2421 = _2415;
    float _2423 = 1.0 / _2403;
    float _2425 = float(uint(_2407));
    float _2427 = as_type<float>(_2360) * _2425;
    float _2429 = trunc(_2413);
    float _2431 = precise::max(_2429, 0.0);
    uint _2433 = uint(_2431);
    float _2435 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2437 = _2435 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2439 = _2421;
    if (_2204)
    {
        float _2441 = _2421 * 6.283185482025146484375;
        float _2443 = sin(_2441);
        _2439 = _2443;
    }
    float _2445 = _2439;
    float _2447 = trunc(_2427);
    float _2449 = precise::max(_2447, 0.0);
    uint _2451 = uint(_2449);
    int _2453 = int(_2371) + int(_2433);
    if (!_2204)
    {
        _2417 = _165;
    }
    float _2455 = _2417;
    int _2457 = _2411 * _2453;
    int _2459 = _2457 + _2234;
    float _2461 = _2455;
    if (_2204)
    {
        bool _2463 = _2445 > 0.5;
        _1601 = _2463;
    }
    bool _2465 = _1601;
    float _2467 = 1.0 / _2437;
    bool _2469 = uint(_2459) >= uint(_2194);
    float _2471 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2473 = _2471 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    int _2475 = ~_2216;
    int _2477 = _2475 + 1;
    float _2479 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2481 = _2479 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _2483 = int(_2385) + int(_2451);
    float _2485 = 1.0 / _2473;
    float _2487 = as_type<float>(_2451);
    if (!_2198)
    {
        _2487 = _161;
    }
    float _2489 = _2487;
    float _2491 = _2489;
    if (_2198)
    {
        float _2493 = -_161;
        float _2495 = _2379 ? _2493 : _161;
        _2491 = _2495;
    }
    float _2497 = _2491;
    int _2499 = _2477 * _2483;
    int _2501 = _2499 + _2240;
    int _2503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2505 = _2503 != 0;
    if (_2204)
    {
        float _2507 = -_165;
        float _2509 = _2465 ? _2507 : _165;
        _2461 = _2509;
    }
    float _2511 = _2461;
    float _2513 = 1.0 / _2481;
    bool _2515 = !_2469;
    int _2517 = _2515 ? 0 : (-1);
    int _2519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2521 = _2519 != 0;
    int _2523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2525 = _2523 != 0;
    int _2527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2529 = _2527 != 0;
    float _2531 = 1.0 / _2260;
    int _2533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2535 = _2533 != 0;
    bool _2537 = !_2505;
    int _2539 = _2537 ? 0 : 1;
    bool _2541 = uint(_2501) >= uint(_2216);
    float _2543 = exp2(_2324);
    float _2545 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2547 = _2545 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2549 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2551 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2553 = 1.0 / _2547;
    float _2555 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2557 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2559 = _2549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2561 = _2551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2563 = _2555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2565 = !_2541;
    int _2567 = _2565 ? 0 : (-1);
    float _2569 = -_2543;
    float _2571 = _2569 + 1.0;
    int _2573 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2575 = _2573 != 0;
    bool _2577 = !_2535;
    int _2579 = _2577 ? 0 : 1;
    out.m_56.x = _2559;
    out.m_56.y = _2561;
    out.m_56.z = _2563;
    out.m_56.w = _2557;
    int _2581 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2583 = _2581 != 0;
    float _2585 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2587 = ~_2453;
    int _2589 = _2587 + _2517;
    int _2591 = _2589 + 1;
    float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2595 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2593;
    float _2597 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2599 = _2597 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2601 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2603 = _2601 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    int _2605 = abs(_2539);
    float _2607 = _2595 * _2358;
    float _2609 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2611 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2609;
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2615 = _2613 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _2619 = _2617 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2621 = _2599 * _2423;
    float _2623 = _2611 * _2513;
    float _2625 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _2627 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _2625;
    float _2629 = 1.0 / _2615;
    int _2631 = ~_2483;
    int _2633 = _2631 + _2567;
    int _2635 = _2633 + 1;
    float _2637 = _2627 * _2485;
    float _2639 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _2639;
    float _2643 = _2619 * _2467;
    float _2645 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _2647 = _2645 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2649 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2651 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2649;
    float _2653 = _2641 * _2553;
    float _2655 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2657 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _2655;
    float _2659 = 1.0 / _2603;
    float _2661 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2663 = _413 + _2661;
    float _2665 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2667 = _411 + _2665;
    float _2669 = _2657 * _2531;
    float _2671 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2673 = _411 + _2671;
    float _2675 = fma(_2637, _2663, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _2677 = fma(_2607, _2667, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2681 = _413 + _2679;
    float _2683 = fma(_2621, _2673, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2685 = _2647 * _2391;
    float _2687 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2689 = _413 + _2687;
    float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2693 = _411 + _2691;
    float _2695 = fma(_2669, _2681, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _2697 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2699 = isnan(_413);
    bool _2701 = _2697 || _2699;
    bool _2703 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2705 = _2701 || _2703;
    float _2707 = float(_2705);
    float _2709 = fma(_2643, _2689, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _2711 = fma(_2623, _2693, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _2713 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2715 = isnan(_413);
    bool _2717 = _2713 || _2715;
    bool _2719 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2721 = _2717 || _2719;
    float _2723 = float(_2721);
    float _2725 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2727 = _413 + _2725;
    float _2729 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2731 = _413 + _2729;
    float _2733 = _2651 * _2629;
    bool _2735 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2737 = isnan(_411);
    bool _2739 = _2735 || _2737;
    bool _2741 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2743 = _2739 || _2741;
    float _2745 = float(_2743);
    float _2747 = fma(_2653, _2727, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2749 = -_2723;
    float _2751 = _2749 + 1.0;
    bool _2753 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2755 = isnan(_413);
    bool _2757 = _2753 || _2755;
    bool _2759 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2761 = _2757 || _2759;
    float _2763 = float(_2761);
    float _2765 = fma(_2685, _2731, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _2767 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2769 = isnan(_411);
    bool _2771 = _2767 || _2769;
    bool _2773 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2775 = _2771 || _2773;
    float _2777 = float(_2775);
    float _2779 = -_2707;
    float _2781 = _2779 + 1.0;
    bool _2783 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2785 = isnan(_411);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2791 = _2787 || _2789;
    float _2793 = float(_2791);
    float _2795 = _2707 * _2751;
    bool _2797 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2799 = isnan(_413);
    bool _2801 = _2797 || _2799;
    bool _2803 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2805 = _2801 || _2803;
    float _2807 = float(_2805);
    float _2809 = -_2763;
    float _2811 = _2809 + 1.0;
    bool _2813 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2815 = isnan(_413);
    bool _2817 = _2813 || _2815;
    bool _2819 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2821 = _2817 || _2819;
    float _2823 = float(_2821);
    float _2825 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _2827 = _2825 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2829 = _2763 * _2781;
    float _2831 = _2807 * _2811;
    float _2833 = -_2807;
    float _2835 = _2833 + 1.0;
    float _2837 = -_2777;
    float _2839 = _2837 + 1.0;
    float _2841 = -_2823;
    float _2843 = _2841 + 1.0;
    float _2845 = _2827 * _2659;
    float _2847 = _2823 * _2835;
    float _2849 = _2745 * _2839;
    float _2851 = -_2745;
    float _2853 = _2851 + 1.0;
    float _2855 = _2304 * _2843;
    float _2857 = -_2304;
    float _2859 = _2857 + 1.0;
    float _2861 = _533 * _535;
    float _2863 = _2290 * _2853;
    float _2865 = _537 * _535;
    float _2867 = _2322 * _2859;
    float _2869 = -_2322;
    float _2871 = _2869 + 1.0;
    float _2873 = _2677 * _2863;
    float _2875 = floor(_2861);
    float _2877 = float(_2194);
    float _2879 = _2336 * _2871;
    float _2881 = float(_2234);
    float _2883 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2885 = _413 + _2883;
    float _2887 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2889 = _413 + _2887;
    float _2891 = _2675 * _2879;
    bool _2893 = _2881 >= _2877;
    bool _2895 = isnan(_2881);
    bool _2897 = _2893 || _2895;
    bool _2899 = isnan(_2877);
    bool _2901 = _2897 || _2899;
    float _2903 = float(_2901);
    float _2905 = floor(_2865);
    float _2907 = float(_2240);
    float _2909 = -_2290;
    float _2911 = _2909 + 1.0;
    float _2913 = fma(_2733, _2889, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2915 = -_2793;
    float _2917 = _2915 + 1.0;
    bool _2919 = _2907 >= _2338;
    bool _2921 = isnan(_2907);
    bool _2923 = _2919 || _2921;
    bool _2925 = isnan(_2338);
    bool _2927 = _2923 || _2925;
    float _2929 = float(_2927);
    float _2931 = fma(_2911, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2873);
    float _2933 = fma(_2845, _2885, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2935 = trunc(_2903);
    int _2937 = int(_2935);
    float _2939 = _2777 * _2917;
    float _2941 = fma(_2683, _2849, _2931);
    float _2943 = -_2875;
    float _2945 = _2861 + _2943;
    float _2947 = -_165;
    int _2949 = _1865 ? as_type<int>(_2947) : as_type<int>(_165);
    int _2951 = _2216 * _2635;
    int _2953 = _2951 + _2240;
    float _2955 = fma(_2711, _2939, _2941);
    float _2957 = _2945 * _2877;
    float _2959 = trunc(_2929);
    int _2961 = int(_2959);
    float _2963 = -_2905;
    float _2965 = _2865 + _2963;
    float _2967 = _2877 * _1105;
    float _2969 = _2338 * _1105;
    float _2971 = -_161;
    int _2973 = _1861 ? as_type<int>(_2971) : as_type<int>(_161);
    int _2975 = _2194 * _2591;
    int _2977 = _2975 + _2234;
    bool _2979 = _2194 == 0;
    float _2981 = -_2336;
    float _2983 = _2981 + 1.0;
    bool _2985 = _521 > 0.5;
    float _2987 = _2965 * _2338;
    float _2989 = trunc(_2967);
    int _2991 = int(_2989);
    int _2993 = ~_2937;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    float _2999 = fma(_2983, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2891);
    bool _3001 = !_2979;
    int _3003 = _3001 ? _2977 : (-1);
    float _3005 = _2585 * _2169;
    bool _3007 = !_2575;
    float _3009 = _3007 ? _165 : as_type<float>(_2949);
    float _3011 = fma(_2709, _2867, _2999);
    bool _3013 = _2216 == 0;
    float _3015 = trunc(_2987);
    int _3017 = int(_3015);
    int _3019 = _2194 + (-1);
    int _3021 = _3003 * _2997;
    int _3023 = ~_2961;
    int _3025 = _3023 + 1;
    int _3027 = _3025 + 1;
    float _3029 = fma(_2747, _2855, _3011);
    bool _3031 = !_3013;
    int _3033 = _3031 ? _2953 : (-1);
    int _3035 = _2937 * _3019;
    int _3037 = _3035 + _3021;
    int _3039 = _2216 + (-1);
    float _3041 = trunc(_2957);
    int _3043 = int(_3041);
    int _3045 = abs(_2579);
    int _3047 = _3033 * _3027;
    int _3049 = abs(_841);
    float _3051 = fma(_2765, _2847, _3029);
    int _3053 = _2961 * _3039;
    int _3055 = _3053 + _3047;
    float _3057 = trunc(_2969);
    int _3059 = int(_3057);
    int _3061 = abs(_1213);
    int _3063 = _3037 * _2352;
    int _3065 = abs(_1147);
    int _3067 = _3017 * _3045;
    int _3069 = _3067 + _2240;
    int _3071 = _3055 * _2356;
    float _3073 = _1101 * (-0.15915493667125701904296875);
    int _3075 = _2991 * _3049;
    int _3077 = _3075 + _3063;
    int _3079 = abs(_1245);
    int _3081 = _3043 * _2605;
    int _3083 = _3081 + _2234;
    float _3085 = _593 * (-0.15915493667125701904296875);
    float _3087 = _3073 * 6.283185482025146484375;
    float _3089 = sin(_3087);
    float _3091 = fma(_2695, _2831, _3051);
    int _3093 = _3059 * _3061;
    int _3095 = _3093 + _3071;
    int _3097 = _3083 * _3065;
    int _3099 = _3097 + _3077;
    float _3101 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _3103 = fma(_2933, _2829, _3091);
    float _3105 = fma(_2793, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2955);
    int _3107 = _3069 * _3079;
    int _3109 = _3107 + _3095;
    int _3111 = _3043 * _2362;
    int _3113 = _3111 + _3099;
    float _3115 = _3073 * 6.283185482025146484375;
    float _3117 = cos(_3115);
    int _3119 = abs(_1251);
    float _3121 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _3123 = fma(_2913, _2795, _3103);
    float _3125 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _3127 = !_2525;
    float _3129 = _3127 ? _161 : as_type<float>(_2973);
    int _3131 = _3017 * _3119;
    int _3133 = _3131 + _3109;
    float _3135 = _3121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3137 = _3125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3139 = _3101 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3141 = float(uint(_3113));
    float _3143 = _3105 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _3145 = -_161;
    int _3147 = _2985 ? as_type<int>(_3145) : as_type<int>(_161);
    float _3149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _3151 = float(uint(_3133));
    float _3153 = as_type<float>(_2348) * _3141;
    bool _3155 = !_2583;
    float _3157 = _3155 ? _161 : as_type<float>(_3147);
    float _3159 = _3009 * _3089;
    float _3161 = _3009 * _3117;
    float _3163 = as_type<float>(_2360) * _3151;
    out.m_58.x = _3135;
    out.m_58.y = _3137;
    out.m_58.z = _3139;
    out.m_58.w = _3143;
    float _3165 = trunc(_3153);
    float _3167 = precise::max(_3165, 0.0);
    uint _3169 = uint(_3167);
    float _3171 = -_3159;
    float _3173 = fma(_3157, _3117, _3171);
    int _3175 = ~_2194;
    int _3177 = _3175 + 1;
    float _3179 = fma(_3157, _3089, _3161);
    float _3181 = fma(_2723, (*spvDescriptorSet0.vp_c9)._m0[158].x, _3123);
    float _3183 = trunc(_3163);
    float _3185 = precise::max(_3183, 0.0);
    uint _3187 = uint(_3185);
    float _3189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3191 = _3149 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3193 = float(uint(_3083));
    float _3195 = _2190 * _3005;
    int _3197 = ~_2216;
    int _3199 = _3197 + 1;
    int _3201 = _3177 * int(_3169);
    int _3203 = _3201 + _3113;
    out.m_60.x = _3181;
    float _3205 = _3085 * 6.283185482025146484375;
    float _3207 = sin(_3205);
    float _3209 = as_type<float>(_2348) * _3193;
    int _3211 = _3199 * int(_3187);
    int _3213 = _3211 + _3133;
    float _3215 = float(uint(_3203));
    float _3217 = _3173 + 0.5;
    float _3219 = float(uint(_3213));
    float _3221 = _3085 * 6.283185482025146484375;
    float _3223 = cos(_3221);
    float _3225 = as_type<float>(_2348) * _3215;
    float _3227 = _3189 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3229 = _3179 + (-0.5);
    float _3231 = fma(_3191, _3217, _811);
    int _3233 = ~_2194;
    int _3235 = _3233 + 1;
    float _3237 = as_type<float>(_2360) * _3219;
    float _3239 = -_3227;
    float _3241 = -_817;
    float _3243 = fma(_3239, _3229, _3241);
    float _3245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3247 = _3207 * _2511;
    float _3249 = float(uint(_3069));
    float _3251 = as_type<float>(_2360) * _3249;
    float _3253 = trunc(_3209);
    float _3255 = precise::max(_3253, 0.0);
    uint _3257 = uint(_3255);
    float _3259 = -_3247;
    float _3261 = fma(_3223, _2497, _3259);
    float _3263 = _3223 * _2511;
    float _3265 = _3261 + 0.5;
    float _3267 = fma(_3207, _2497, _3263);
    float _3269 = trunc(_3225);
    float _3271 = precise::max(_3269, 0.0);
    uint _3273 = uint(_3271);
    float _3275 = _3245 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3277 = _807 + (-0.5);
    float _3279 = fma(_3265, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1003);
    float _3281 = _815 + 0.5;
    float _3283 = _3267 + (-0.5);
    float _3285 = -_3275;
    float _3287 = -_1123;
    float _3289 = fma(_3285, _3277, _3287);
    float _3291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3293 = _3235 * int(_3257);
    int _3295 = _3293 + _3083;
    int _3297 = ~_2194;
    int _3299 = _3297 + 1;
    float _3301 = -_3283;
    float _3303 = -_927;
    float _3305 = fma(_3301, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3303);
    float _3307 = -_2208;
    float _3309 = fma(_3261, _3307, _3279);
    float _3311 = fma(_807, _2272, _3289);
    float _3313 = fma(_3267, _2212, _3305);
    float _3315 = trunc(_3251);
    float _3317 = precise::max(_3315, 0.0);
    uint _3319 = uint(_3317);
    int _3321 = int(_3169) + int(_3273);
    int _3323 = ~_2216;
    int _3325 = _3323 + 1;
    out.m_62.x = _3309;
    out.m_62.y = _3313;
    float _3327 = trunc(_3237);
    float _3329 = precise::max(_3327, 0.0);
    uint _3331 = uint(_3329);
    float _3333 = _3291 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3335 = fma(_3333, _3281, _1127);
    float _3337 = _2200 * 6.283185482025146484375;
    float _3339 = sin(_3337);
    float _3341 = float(uint(_3295));
    float _3343 = as_type<float>(_2348) * _3341;
    int _3345 = _3299 * _3321;
    int _3347 = _3345 + _3113;
    int _3349 = ~_2216;
    int _3351 = _3349 + 1;
    float _3353 = _2200 * 6.283185482025146484375;
    float _3355 = cos(_3353);
    int _3357 = int(_3187) + int(_3331);
    bool _3359 = uint(_3347) >= uint(_2194);
    int _3361 = _3351 * int(_3319);
    int _3363 = _3361 + _3069;
    bool _3365 = !_3359;
    int _3367 = _3365 ? 0 : (-1);
    float _3369 = trunc(_3343);
    float _3371 = precise::max(_3369, 0.0);
    uint _3373 = uint(_3371);
    float _3375 = float(uint(_3363));
    int _3377 = _3325 * _3357;
    int _3379 = _3377 + _3133;
    int _3381 = ~_3321;
    int _3383 = _3381 + _3367;
    int _3385 = _3383 + 1;
    float _3387 = _743 * _3339;
    float _3389 = as_type<float>(_2360) * _3375;
    bool _3391 = uint(_3379) >= uint(_2216);
    int _3393 = _2194 * _3385;
    int _3395 = _3393 + _3113;
    float _3397 = _743 * _3355;
    float _3399 = -_3387;
    float _3401 = fma(_3129, _3355, _3399);
    float _3403 = trunc(_3389);
    float _3405 = precise::max(_3403, 0.0);
    uint _3407 = uint(_3405);
    bool _3409 = !_3391;
    int _3411 = _3409 ? 0 : (-1);
    float _3413 = fma(_3129, _3339, _3397);
    bool _3415 = !_2979;
    int _3417 = _3415 ? _3395 : (-1);
    float _3419 = _3401 + 0.5;
    int _3421 = ~_3357;
    int _3423 = _3421 + _3411;
    int _3425 = _3423 + 1;
    int _3427 = _3417 & 3;
    bool _3429 = _3427 != 0;
    float _3431 = fma(_3419, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1121);
    int _3433 = ~_2194;
    int _3435 = _3433 + 1;
    int _3437 = _2216 * _3425;
    int _3439 = _3437 + _3133;
    bool _3441 = uint(_3427) > 1u;
    int _3443 = int(_3257) + int(_3373);
    int _3445 = _3417 & 3;
    bool _3447 = _3445 != 0;
    int _3449 = int(_3319) + int(_3407);
    int _3451 = _3435 * _3443;
    int _3453 = _3451 + _3083;
    int _3455 = _3447 ? 0 : 1;
    bool _3457 = !_3013;
    int _3459 = _3457 ? _3439 : (-1);
    int _3461 = _3417 >> 31;
    bool _3463 = uint(_3453) >= uint(_2194);
    int _3465 = ~_3455;
    int _3467 = _3465 + 1;
    int _3469 = _3467 + 1;
    int _3471 = _3459 >> 31;
    int _3473 = _3469;
    if (!_3441)
    {
        int _3475 = ~_3455;
        int _3477 = _3475 + 1;
        _3473 = _3477;
    }
    int _3479 = _3473;
    float _3481 = _3413 + (-0.5);
    int _3483 = _3461 & 3;
    int _3485 = _3471 & 3;
    float _3487 = -_3481;
    float _3489 = -_1071;
    float _3491 = fma(_3487, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3489);
    int _3493 = _3417 + _3483;
    bool _3495 = !_3463;
    int _3497 = _3495 ? 0 : (-1);
    int _3499 = ~_2216;
    int _3501 = _3499 + 1;
    int _3503 = _3459 + _3485;
    int _3505 = _3493 >> 2;
    int _3507 = _3501 * _3449;
    int _3509 = _3507 + _3069;
    bool _3511 = uint(_3427) >= 2u;
    int _3513 = ~_3443;
    int _3515 = _3513 + _3497;
    int _3517 = _3515 + 1;
    int _3519 = _3503 >> 2;
    int _3521 = _3505 << 4;
    int _3523 = _3521 + 512;
    float _3525 = -_1107;
    float _3527 = _3525 + 1.0;
    int _3529 = _3511 ? 0 : 1;
    int _3531 = _2194 * _3517;
    int _3533 = _3531 + _3083;
    bool _3535 = _3427 != 3;
    int _3537 = _3519 << 4;
    int _3539 = _3537 + 800;
    uint _3541 = uint(int(uint(_3523) >> uint(2)));
    uint _3543 = uint(int(uint(int(_3541)) >> uint(2)));
    int _3545 = int(_3541) & 3;
    float _3547 = (*spvDescriptorSet0.vp_c9)._m0[int(_3543)][_3545];
    int _3549 = int(_3541) + 1;
    uint _3551 = uint(int(uint(_3549) >> uint(2)));
    int _3553 = _3549 & 3;
    float _3555 = (*spvDescriptorSet0.vp_c9)._m0[int(_3551)][_3553];
    bool _3557 = uint(_3509) >= uint(_2216);
    int _3559 = ~_3529;
    int _3561 = _3559 + 1;
    int _3563 = _3561 + 1;
    bool _3565 = !_3429;
    int _3567 = _3565 ? 0 : 1;
    int _3569 = _3459 & 3;
    bool _3571 = _3569 != 0;
    uint _3573 = uint(int(uint(_3539) >> uint(2)));
    uint _3575 = uint(int(uint(int(_3573)) >> uint(2)));
    int _3577 = int(_3573) & 3;
    float _3579 = (*spvDescriptorSet0.vp_c9)._m0[int(_3575)][_3577];
    int _3581 = int(_3573) + 1;
    uint _3583 = uint(int(uint(_3581) >> uint(2)));
    int _3585 = _3581 & 3;
    float _3587 = (*spvDescriptorSet0.vp_c9)._m0[int(_3583)][_3585];
    int _3589 = _3563;
    if (_3535)
    {
        int _3591 = ~_3529;
        int _3593 = _3591 + 1;
        _3589 = _3593;
    }
    int _3595 = _3589;
    float _3597 = -_2224;
    float _3599 = fma(_815, _3597, _3335);
    float _3601 = -_3527;
    float _3603 = fma(_3173, _3601, _3231);
    float _3605 = fma(_3179, _2268, _3243);
    int _3607 = _3459 & 3;
    bool _3609 = _3607 != 0;
    float _3611 = -_1089;
    float _3613 = _3611 + 1.0;
    float _3615 = -_1095;
    float _3617 = _3615 + 1.0;
    int _3619 = _3523 + 8;
    uint _3621 = uint(int(uint(_3619) >> uint(2)));
    uint _3623 = uint(int(uint(int(_3621)) >> uint(2)));
    int _3625 = int(_3621) & 3;
    float _3627 = (*spvDescriptorSet0.vp_c9)._m0[int(_3623)][_3625];
    int _3629 = int(_3621) + 1;
    uint _3631 = uint(int(uint(_3629) >> uint(2)));
    int _3633 = _3629 & 3;
    float _3635 = (*spvDescriptorSet0.vp_c9)._m0[int(_3631)][_3633];
    bool _3637 = !_3557;
    int _3639 = _3637 ? 0 : (-1);
    float _3641 = -_3613;
    float _3643 = fma(_3401, _3641, _3431);
    bool _3645 = uint(_3607) > 1u;
    float _3647 = fma(_3413, _3617, _3491);
    int _3649 = _3571 ? 0 : 1;
    out.m_64.x = _3599;
    out.m_64.y = _3311;
    int _3651 = abs(_3479);
    int _3653 = _3539 + 8;
    uint _3655 = uint(int(uint(_3653) >> uint(2)));
    uint _3657 = uint(int(uint(int(_3655)) >> uint(2)));
    int _3659 = int(_3655) & 3;
    float _3661 = (*spvDescriptorSet0.vp_c9)._m0[int(_3657)][_3659];
    int _3663 = int(_3655) + 1;
    uint _3665 = uint(int(uint(_3663) >> uint(2)));
    int _3667 = _3663 & 3;
    float _3669 = (*spvDescriptorSet0.vp_c9)._m0[int(_3665)][_3667];
    int _3671 = ~_3649;
    int _3673 = _3671 + 1;
    int _3675 = _3673 + 1;
    out.m_66.x = _3603;
    out.m_66.y = _3605;
    out.m_66.z = _3643;
    out.m_66.w = _3647;
    bool _3677 = !_3609;
    int _3679 = _3677 ? 0 : 1;
    bool _3681 = uint(_3607) >= 2u;
    int _3683 = abs(_3679);
    int _3685 = _3675;
    if (!_3645)
    {
        int _3687 = ~_3649;
        int _3689 = _3687 + 1;
        _3685 = _3689;
    }
    int _3691 = _3685;
    bool _3693 = _3607 != 3;
    int _3695 = _3681 ? 0 : 1;
    bool _3697 = _3427 != 3;
    float _3699 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3701 = abs(_3691);
    float _3703 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3699);
    int _3705 = abs(_3567);
    int _3707 = ~_3651;
    int _3709 = _3707 + 1;
    int _3711 = _3709 + 1;
    float _3713 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3703);
    int _3715 = ~_3701;
    int _3717 = _3715 + 1;
    int _3719 = _3717 + 1;
    int _3721 = _3711 * as_type<int>(_3555);
    int _3723 = ~_3705;
    int _3725 = _3723 + 1;
    int _3727 = _3725 + 1;
    int _3729 = ~_3683;
    int _3731 = _3729 + 1;
    int _3733 = _3731 + 1;
    int _3735 = _3719 * as_type<int>(_3587);
    int _3737 = ~_3449;
    int _3739 = _3737 + _3639;
    int _3741 = _3739 + 1;
    int _3743 = _3727 * as_type<int>(_3547);
    int _3745 = _3743 + _3721;
    bool _3747 = _3607 != 3;
    int _3749 = _3733 * as_type<int>(_3579);
    int _3751 = _3749 + _3735;
    bool _3753 = !_3697;
    int _3755 = _3753 ? 0 : (-1);
    int _3757 = _2216 * _3741;
    int _3759 = _3757 + _3069;
    int _3761 = abs(_3595);
    bool _3763 = !_3747;
    int _3765 = _3763 ? 0 : (-1);
    int _3767 = ~_3695;
    int _3769 = _3767 + 1;
    int _3771 = _3769 + 1;
    int _3773 = abs(_3755);
    int _3775 = _3771;
    if (_3693)
    {
        int _3777 = ~_3695;
        int _3779 = _3777 + 1;
        _3775 = _3779;
    }
    int _3781 = _3775;
    int _3783 = ~_3761;
    int _3785 = _3783 + 1;
    int _3787 = _3785 + 1;
    bool _3789 = !_2521;
    int _3791 = _3789 ? 0 : 1;
    int _3793 = abs(_3765);
    int _3795 = _3787 * as_type<int>(_3627);
    int _3797 = _3795 + _3745;
    int _3799 = abs(_3781);
    int _3801 = abs(_3791);
    int _3803 = ~_3773;
    int _3805 = _3803 + 1;
    int _3807 = _3805 + 1;
    int _3809 = ~_3799;
    int _3811 = _3809 + 1;
    int _3813 = _3811 + 1;
    int _3815 = _3807 * as_type<int>(_3635);
    int _3817 = _3815 + _3797;
    bool _3819 = !_2529;
    int _3821 = _3819 ? 0 : 1;
    int _3823 = _3813 * as_type<int>(_3661);
    int _3825 = _3823 + _3751;
    int _3827 = ~_3793;
    int _3829 = _3827 + 1;
    int _3831 = _3829 + 1;
    int _3833 = abs(_3821);
    float _3835 = _1785 * _1847;
    int _3837 = ~_3801;
    int _3839 = _3837 + 1;
    int _3841 = _3839 + 1;
    int _3843 = _3831 * as_type<int>(_3669);
    int _3845 = _3843 + _3825;
    int _3847 = ~_3833;
    int _3849 = _3847 + 1;
    int _3851 = _3849 + 1;
    float _3853 = _3835 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3855 = _1785 > 0.0;
    bool _3857 = isnan(_1785);
    bool _3859 = _3855 || _3857;
    bool _3861 = isnan(0.0);
    bool _3863 = _3859 || _3861;
    int _3865 = _3817 * _3841;
    bool _3867 = !_2979;
    int _3869 = _3867 ? _3533 : (-1);
    float _3871 = _3853 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _3873 = !_3013;
    int _3875 = _3873 ? _3759 : (-1);
    int _3877 = _3845 * _3851;
    float _3879 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3713);
    int _3881 = _3869 * _3801;
    int _3883 = _3881 + _3865;
    float _3885 = _2133 + _2103;
    int _3887 = _3875 * _3833;
    int _3889 = _3887 + _3877;
    float _3891 = _2103 * 0.5;
    bool _3893 = _1847 <= 0.0;
    bool _3895 = !_3863;
    bool _3897 = _3893 || _3895;
    float _3899 = _3885 * 0.5;
    float _3901 = float(_3883);
    float _3903 = fma(_2137, -0.5, _3891);
    float _3905 = float(_3889);
    float _3907 = _2180 * _3005;
    float _3909 = _3879 + _2103;
    float _3911 = -_2585;
    float _3913 = _3911 + 1.0;
    out.m_45.x = _3871;
    float _3915 = fma(_2186, _3907, _2174);
    float _3917 = fma(_2188, _3907, _2176);
    float _3919 = _3909 * 0.5;
    float _3921 = _2180 * _3913;
    out.gl_Position.x = _2133;
    out.gl_Position.y = _2137;
    out.gl_Position.z = _3879;
    out.gl_Position.w = _2103;
    float _3923 = fma(_2180, _3195, _2178);
    out.m_68.x = _3899;
    out.m_68.y = _3903;
    out.m_68.z = _3919;
    out.m_68.w = _2103;
    out.m_70.y = _3901;
    out.m_70.w = _3905;
    out.m_72.x = _3915;
    out.m_72.y = _3917;
    out.m_72.z = _3923;
    out.m_72.w = _3921;
    if (!_3897)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3925 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3925;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _399 = false;
    bool _187 = false;
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
        float _3982 = as_type<float>(_107);
        out.gl_Position.z = _3982;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4052 = as_type<float>(_145);
        out.gl_Position.z = _4052;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _151 = as_type<int>(_147) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_147) & 2;
    bool _157 = _155 != 0;
    bool _159 = !_153;
    float _161 = _159 ? (-0.5) : 0.5;
    bool _163 = !_157;
    float _165 = _163 ? (-0.5) : 0.5;
    bool _167 = !_149;
    float _185;
    if (!_167)
    {
        float _169 = in.m_52.x;
        float _171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _173 = _169 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _175 = fma(_173, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _177 = _175 * _171;
        float _179 = floor(_177);
        float _181 = -_179;
        float _183 = _177 + _181;
        _185 = _183;
        _187 = true;
    }
    else
    {
        float _189 = float(_91);
        float _191 = 1.0 / _189;
        float _193 = _125 * _191;
        _185 = _193;
    }
    _187 = false;
    float _195 = _185;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _199 = _195 + _197;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _203 = _195 + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _195 + _205;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _215 = _213 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _217;
    bool _221 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _223 = isnan(_195);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = 1.0 / _211;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _237 = 1.0 / _219;
    float _239 = 1.0 / _215;
    float _241 = _199 * _233;
    bool _243 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _245 = isnan(_195);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -_231;
    float _257 = _255 + 1.0;
    float _259 = _253 * _257;
    float _261 = _203 * _237;
    bool _263 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _265 = isnan(_195);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = -_253;
    float _277 = _275 + 1.0;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _281 = _279 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _283 = _273 * _277;
    float _285 = -_273;
    float _287 = _285 + 1.0;
    float _289 = _207 * _239;
    bool _291 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _293 = isnan(_195);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _303;
    float _307 = fma(_281, _289, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _317 = fma(_305, _241, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _319 = _301 * _287;
    float _321 = fma(_311, _241, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _323 = fma(_315, _289, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _325 = -_301;
    float _327 = _325 + 1.0;
    float _329 = _317 * _319;
    float _331 = _321 * _319;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _333;
    float _337 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].x, _329);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _339;
    float _343 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].y, _331);
    float _345 = fma(_335, _261, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _347 = fma(_307, _283, _337);
    float _349 = fma(_341, _261, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _351 = fma(_323, _283, _343);
    float _353 = fma(_345, _259, _347);
    float _355 = fma(_349, _259, _351);
    float _357 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[146].x, _353);
    float _359 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[146].y, _355);
    bool _361 = !_235;
    float _363 = _355;
    int _365 = as_type<int>(_351);
    int _367 = as_type<int>(_259);
    float _369 = _323;
    float _393;
    float _395;
    float _397;
    if (!_361)
    {
        float _371 = in.m_52.x;
        float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _375 = float(_91);
        float _377 = 1.0 / _375;
        float _379 = _371 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _381 = _125 * _377;
        float _383 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _385 = _383 * _373;
        float _387 = floor(_385);
        float _389 = -_387;
        float _391 = _385 + _389;
        _363 = _387;
        _393 = _375;
        _395 = _391;
        _397 = _381;
        _399 = true;
    }
    else
    {
        float _401 = float(_91);
        float _403 = 1.0 / _401;
        float _405 = _125 * _403;
        _393 = _401;
        _395 = _405;
        _397 = _405;
    }
    _399 = false;
    float _407 = _363;
    float _409 = _393;
    float _411 = _395;
    float _413 = _397;
    float _415 = in.m_52.w;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _419 = _417 != 0;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _423 = _407;
    float _425 = _307;
    if (_419)
    {
        float _427 = in.m_52.x;
        float _429 = in.m_52.y;
        float _431 = in.m_52.z;
        _421 = _427;
        _423 = _429;
        _425 = _431;
    }
    float _433 = _421;
    float _435 = _423;
    float _437 = _425;
    float _439 = 0.0;
    if (_419)
    {
        _439 = 1.0;
    }
    float _441 = _439;
    float _443 = 0.0;
    float _445 = _441;
    if (_419)
    {
        _443 = 1.0;
    }
    float _447 = _443;
    float _449 = _447;
    if (_419)
    {
        _365 = 0;
    }
    int _451 = _365;
    int _453 = _451;
    if (_419)
    {
        _367 = 0;
    }
    int _455 = _367;
    float _457 = 0.0;
    float _459 = _437;
    float _461 = _433;
    int _463 = _455;
    float _465 = _435;
    if (_419)
    {
        _457 = _433;
    }
    float _467 = _457;
    float _469 = _467;
    if (_419)
    {
        _369 = _437;
    }
    float _471 = _369;
    float _473 = 0.0;
    float _475 = _471;
    if (_419)
    {
        _473 = _467;
    }
    float _477 = _473;
    float _479 = 0.0;
    float _481 = _477;
    if (_419)
    {
        _479 = _435;
    }
    float _483 = _479;
    float _485 = _483;
    if (!_419)
    {
        float _487 = in.m_52.x;
        float _489 = in.m_52.y;
        float _491 = in.m_52.z;
        float _493 = _487 * 3.1415927410125732421875;
        float _495 = _493 * 0.15915493667125701904296875;
        float _497 = _489 * 3.1415927410125732421875;
        float _499 = _497 * 0.15915493667125701904296875;
        float _501 = _491 * 3.1415927410125732421875;
        float _503 = _495 * 6.283185482025146484375;
        float _505 = sin(_503);
        float _507 = _501 * 0.15915493667125701904296875;
        float _509 = _499 * 6.283185482025146484375;
        float _511 = sin(_509);
        float _513 = _507 * 6.283185482025146484375;
        float _515 = sin(_513);
        _459 = _491;
        _453 = 1;
        _461 = _487;
        _463 = 2;
        _465 = _489;
        _475 = _515;
        _481 = _505;
        _485 = _511;
        _449 = 1.2345600128173828125;
        _469 = _489;
        _445 = 7.345489978790283203125;
    }
    float _517 = _459;
    int _519 = _453;
    float _521 = _461;
    int _523 = _463;
    float _525 = _465;
    float _527 = _475;
    float _529 = _481;
    float _531 = _485;
    float _533 = _449;
    float _535 = _469;
    float _537 = _445;
    float _539 = _517 * 2.0;
    bool _541 = _519 != 1;
    float _543 = _521 * 2.0;
    bool _545 = _415 > 0.5;
    float _547 = _521 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _549 = in.m_42.x;
    float _551 = in.m_42.y;
    float _553 = in.m_42.z;
    float _555 = floor(_539);
    bool _557 = _523 != 2;
    float _559 = _525 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _561 = -_165;
    int _563 = _545 ? as_type<int>(_561) : as_type<int>(_165);
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[94].z + (*spvDescriptorSet0.vp_c9)._m0[94].y;
    float _567 = 0.0;
    if (!_541)
    {
        _567 = _517;
    }
    float _569 = _567;
    float _571 = floor(_543);
    float _573 = 0.0;
    float _575 = _569;
    if (!_541)
    {
        _573 = _525;
    }
    float _577 = _573;
    float _579 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[94].z, _565);
    float _581 = 0.0;
    float _583 = _577;
    if (!_541)
    {
        _581 = _569;
    }
    float _585 = _581;
    float _587 = 0.0;
    float _589 = _585;
    if (_557)
    {
        _587 = _525;
    }
    float _591 = _587;
    float _593 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[94].x, _579);
    bool _595 = _555 > 0.0;
    float _597 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _599 = log2(_597);
    bool _601 = _555 >= 0.0;
    bool _603 = isnan(_555);
    bool _605 = _601 || _603;
    bool _607 = isnan(0.0);
    bool _609 = _605 || _607;
    float _611 = 0.0;
    float _613 = _591;
    if (_557)
    {
        _611 = _521;
    }
    float _615 = _611;
    float _617 = _551 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _619 = _551 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _621 = _609 ? 0 : 1;
    float _623 = 1.0 / _409;
    float _625 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[4].x, _617);
    float _627 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[6].x, _619);
    int _629 = ~_621;
    int _631 = _629 + 1;
    int _633 = _631 + 1;
    float _635 = 0.0;
    float _637 = _615;
    int _639 = _633;
    if (!_541)
    {
        _635 = _525;
    }
    float _641 = _635;
    float _643 = fma(_553, (*spvDescriptorSet0.vp_c10)._m0[4].z, _625);
    float _645 = 0.0;
    float _647 = _641;
    if (!_541)
    {
        _645 = _521;
    }
    float _649 = _645;
    float _651 = _649;
    if (!_557)
    {
        _613 = _521;
    }
    float _653 = _613;
    float _655 = _643 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (!_557)
    {
        _637 = _517;
    }
    float _657 = _637;
    if (!_595)
    {
        int _659 = ~_621;
        int _661 = _659 + 1;
        _639 = _661;
    }
    int _663 = _639;
    float _665 = fma(_553, (*spvDescriptorSet0.vp_c10)._m0[6].z, _627);
    if (_541)
    {
        _589 = _525;
    }
    float _667 = _589;
    float _669 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _671 = _655 + _669;
    float _673 = _671;
    if (_541)
    {
        _575 = _525;
    }
    float _675 = _575;
    float _677 = _665 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _679 = _677;
    if (_541)
    {
        _583 = _521;
    }
    float _681 = _583;
    float _683 = _657 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_541)
    {
        _647 = _521;
    }
    float _685 = _647;
    if (_541)
    {
        _651 = _517;
    }
    float _687 = _651;
    int _689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _691 = _689 != 0;
    int _693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _695 = _693 != 0;
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _699 = _697 != 0;
    bool _701 = _517 > 0.5;
    bool _703 = _525 > 0.5;
    int _705 = int(_545);
    int _707 = _595 ? 2 : 0;
    int _709 = _705 | _707;
    int _711 = _701 ? 4 : 0;
    int _713 = _709 | _711;
    int _715 = _691 ? 8 : 0;
    int _717 = _713 | _715;
    int _719 = _695 ? 16 : 0;
    int _721 = _717 | _719;
    int _723 = _699 ? 32 : 0;
    int _725 = _721 | _723;
    int _727 = _703 ? 64 : 0;
    int _729 = _725 | _727;
    int _731 = _729 & 4;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _735 = -_165;
    int _737 = _701 ? as_type<int>(_735) : as_type<int>(_165);
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _741 = !_691;
    float _743 = _741 ? _165 : as_type<float>(_563);
    float _745 = -_677;
    float _747 = _745 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _749 = -_161;
    int _751 = _703 ? as_type<int>(_749) : as_type<int>(_161);
    float _753 = -_733;
    float _755 = fma(_547, 2.0, _753);
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _771 = _769 != 0;
    float _773 = fma(_559, -2.0, _739);
    int _775 = int(_759);
    int _777 = _763 ? 2 : 0;
    int _779 = _775 | _777;
    int _781 = _767 ? 4 : 0;
    int _783 = _779 | _781;
    int _785 = _771 ? 8 : 0;
    int _787 = _783 | _785;
    int _789 = _695 ? 16 : 0;
    int _791 = _787 | _789;
    int _793 = _699 ? 32 : 0;
    int _795 = _791 | _793;
    int _797 = _703 ? 64 : 0;
    int _799 = _795 | _797;
    int _801 = _799 & 64;
    float _803 = _525 * 2.0;
    bool _805 = !_699;
    float _807 = _805 ? _165 : as_type<float>(_737);
    float _809 = -_125;
    float _811 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[76].x, _755);
    bool _813 = !_695;
    float _815 = _813 ? _161 : as_type<float>(_751);
    float _817 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _773);
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _821 = _819 != 0;
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _825 = _823 != 0;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _829 = _827 != 0;
    float _831 = floor(_803);
    float _833 = abs(_671);
    float _835 = abs(_747);
    float _837 = precise::max(_833, _835);
    bool _839 = !_759;
    int _841 = _839 ? 0 : 1;
    bool _843 = !_821;
    int _845 = _843 ? 0 : 1;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _849 = _571 >= 0.0;
    bool _851 = isnan(_571);
    bool _853 = _849 || _851;
    bool _855 = isnan(0.0);
    bool _857 = _853 || _855;
    bool _859 = _837 >= 16.0;
    int _861 = _857 ? 0 : 1;
    bool _863 = _571 > 0.0;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _867 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[93].z, _847);
    float _869 = _529 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _871 = _525 + _517;
    float _873 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[93].w, _865);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _877 = _531 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _879 = _871 + (-1.0);
    float _881 = _517 + _521;
    float _883 = fma(_877, -2.0, _875);
    float _885 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _887 = _881 + (-1.0);
    int _889 = ~_861;
    int _891 = _889 + 1;
    int _893 = _891 + 1;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _897 = _893;
    float _899 = _747;
    if (!_863)
    {
        int _901 = ~_861;
        int _903 = _901 + 1;
        _897 = _903;
    }
    int _905 = _897;
    float _907 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _873);
    bool _909 = _831 >= 0.0;
    bool _911 = isnan(_831);
    bool _913 = _909 || _911;
    bool _915 = isnan(0.0);
    bool _917 = _913 || _915;
    float _919 = -_895;
    float _921 = fma(_869, 2.0, _919);
    float _923 = _525 + _521;
    int _925 = _917 ? 0 : 1;
    float _927 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _883);
    bool _929 = _831 > 0.0;
    float _931 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _933 = _923 + (-1.0);
    if (_859)
    {
        float _935 = _747 * 0.0625;
        _899 = _935;
    }
    float _937 = _899;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _941 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _943 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[83].w, _939);
    float _945 = _599 * _125;
    float _947 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _949 = int(_947);
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _957 = abs(_845);
    float _959 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[84].z, _951);
    float _961 = _681 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _963 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _965 = int(_963);
    int _967 = ~_925;
    int _969 = _967 + 1;
    int _971 = _969 + 1;
    float _973 = -_953;
    float _975 = fma(_961, 2.0, _973);
    float _977 = _667 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _979 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[83].z, _955);
    int _981 = _971;
    if (!_929)
    {
        int _983 = ~_925;
        int _985 = _983 + 1;
        _981 = _985;
    }
    int _987 = _981;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _991 = exp2(_945);
    float _993 = float(_949);
    float _995 = -_989;
    float _997 = fma(_683, 2.0, _995);
    float _999 = _653 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1001 = -_125;
    float _1003 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[91].x, _921);
    float _1005 = float(_663);
    float _1007 = 1.0 / _993;
    float _1009 = float(_957);
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1013 = float(_965);
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1017 = 1.0 + _1015;
    bool _1019 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1021 = isnan(0.0);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1027 = _1023 || _1025;
    float _1029 = _1009 * _1005;
    float _1031 = fma(_977, -2.0, _1011);
    float _1033 = -_991;
    float _1035 = _1033 + 1.0;
    float _1037 = 1.0 / _1013;
    float _1039 = _1029 * (-2.0);
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1043 = 1.0 / _1017;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1049 = _1027 ? _1035 : 0.0;
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1053 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1055 = isnan(1.0);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1061 = _1057 || _1059;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1067 = _1007 * _125;
    float _1069 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1041);
    float _1071 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1031);
    float _1073 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1045);
    float _1075 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1047);
    float _1077 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[84].x, _959);
    float _1079 = _521 + (-0.5);
    float _1081 = fma(_999, -2.0, _1051);
    float _1083 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1063);
    float _1085 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1065);
    float _1087 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _867);
    float _1089 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _979);
    bool _1091 = !_825;
    int _1093 = _1091 ? 0 : 1;
    float _1095 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _943);
    bool _1097 = !_829;
    int _1099 = _1097 ? 0 : 1;
    float _1101 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1069);
    float _1103 = fma(_941, _1039, _941);
    float _1105 = _623 * _125;
    float _1107 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1073);
    float _1109 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1075);
    float _1111 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1113 = _1037 * _125;
    float _1115 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1083);
    float _1117 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1085);
    float _1119 = -_125;
    float _1121 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[81].x, _975);
    float _1123 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1081);
    float _1125 = -_125;
    float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[86].x, _997);
    int _1129 = abs(_1093);
    if (_1061)
    {
        float _1131 = _1049 * _1043;
        _127 = _1131;
    }
    float _1133 = _127;
    int _1135 = abs(_1099);
    float _1137 = _671 * 0.0625;
    bool _1139 = !_763;
    int _1141 = _1139 ? 0 : 1;
    float _1143 = fma(_1103, _1133, _1111);
    bool _1145 = !_767;
    int _1147 = _1145 ? 0 : 1;
    float _1149 = _525 + (-0.5);
    bool _1151 = !_771;
    int _1153 = _1151 ? 0 : 1;
    float _1155 = _1143 * 0.15915493667125701904296875;
    int _1157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1159 = _1157 != 0;
    int _1161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1163 = _1161 != 0;
    int _1165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1167 = _1165 != 0;
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1171 = _1169 != 0;
    float _1173 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1175 = float(_905);
    float _1177 = _1155 * 6.283185482025146484375;
    float _1179 = sin(_1177);
    float _1181 = float(_987);
    float _1183 = float(_1129);
    float _1185 = float(_1135);
    float _1187 = _859 ? _1137 : _671;
    float _1189 = _1183 * _1175;
    bool _1191 = !_1163;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = _1185 * _1181;
    float _1197 = abs(_1187);
    bool _1199 = _1197 != 0.0;
    bool _1201 = isnan(_1197);
    bool _1203 = _1199 || _1201;
    bool _1205 = isnan(0.0);
    bool _1207 = _1203 || _1205;
    float _1209 = _1189 * (-2.0);
    bool _1211 = !_1159;
    int _1213 = _1211 ? 0 : 1;
    float _1215 = _1195 * (-2.0);
    float _1217 = abs(_937);
    bool _1219 = _1217 == 0.0;
    bool _1221 = !_1207;
    bool _1223 = _1219 && _1221;
    float _1225 = in.m_54.x;
    float _1227 = in.m_54.y;
    float _1229 = abs(_937);
    bool _1231 = _1229 == 0.0;
    float _1233 = fma(_885, _1209, _885);
    float _1235 = fma(_931, _1215, _931);
    float _1237 = _1155 * 6.283185482025146484375;
    float _1239 = cos(_1237);
    float _1241 = _517 + (-0.5);
    bool _1243 = !_1167;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = fma(_1233, _1133, _1173);
    bool _1249 = !_1171;
    int _1251 = _1249 ? 0 : 1;
    float _1253 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _1255 = _1167;
    int _1257 = _1135;
    int _1259 = as_type<int>(_1133);
    if (_1223)
    {
        bool _1261 = as_type<int>(_937) >= 0;
        _1255 = _1261;
    }
    bool _1263 = _1255;
    float _1265 = fma(_1235, _1133, _1253);
    int _1267 = _1263 ? (-1) : 0;
    if (_1223)
    {
        int _1269 = _1263 ? 0 : 1078530011;
        _1257 = _1269;
    }
    int _1271 = _1257;
    if (_1223)
    {
        int _1273 = int(0x80000000) & as_type<int>(_1187);
        int _1275 = _1271 | _1273;
        _1259 = _1275;
    }
    int _1277 = _1259;
    bool _1279 = !_1207;
    bool _1281 = _1279 && _1231;
    int _1283 = _1277;
    float _1285 = as_type<float>(_1277);
    if (!_1281)
    {
        float _1287 = abs(_1187);
        bool _1289 = _1287 != as_type<float>(0x7f800000u /* inf */);
        bool _1291 = isnan(_1287);
        bool _1293 = _1289 || _1291;
        bool _1295 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1297 = _1293 || _1295;
        float _1299 = abs(_937);
        bool _1301 = _1299 == as_type<float>(0x7f800000u /* inf */);
        float _1303 = abs(_937);
        bool _1305 = _1303 == as_type<float>(0x7f800000u /* inf */);
        bool _1307 = !_1297;
        bool _1309 = _1305 && _1307;
        if (_1309)
        {
            bool _1311 = as_type<int>(_937) >= 0;
            _1267 = _1311 ? (-1) : 0;
        }
        int _1313 = _1267;
        if (_1309)
        {
            _1283 = 1075235812;
        }
        int _1315 = _1283;
        int _1317 = _1315;
        if (_1309)
        {
            int _1319 = ~_1313;
            int _1321 = (_1319 != 0) ? _1315 : 1061752795;
            _1317 = _1321;
        }
        int _1323 = _1317;
        float _1325 = as_type<float>(_1323);
        if (_1309)
        {
            int _1327 = int(0x80000000) & as_type<int>(_1187);
            int _1329 = _1323 | _1327;
            _1325 = as_type<float>(_1329);
        }
        float _1331 = _1325;
        bool _1333 = !_1297;
        bool _1335 = _1333 && _1301;
        _1285 = _1331;
        if (!_1335)
        {
            float _1337 = abs(_937);
            float _1339 = abs(_1187);
            float _1341 = precise::max(_1337, _1339);
            float _1343 = abs(_937);
            float _1345 = abs(_1187);
            float _1347 = precise::min(_1343, _1345);
            float _1349 = 1.0 / _1341;
            float _1351 = abs(_1187);
            float _1353 = abs(_937);
            bool _1355 = _1351 > _1353;
            bool _1357 = as_type<int>(_937) >= 0;
            float _1359 = abs(_937);
            float _1361 = abs(_1187);
            float _1363 = _1359 + _1361;
            int _1365 = as_type<int>(_1187) & int(0x80000000);
            bool _1367 = _1363 > as_type<float>(0x7f800000u /* inf */);
            bool _1369 = isnan(_1363);
            bool _1371 = _1367 || _1369;
            bool _1373 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1375 = _1371 || _1373;
            float _1377 = _1347 * _1349;
            float _1379 = _1377 * _1377;
            float _1381 = _1379 + 11.33538818359375;
            float _1383 = fma(_1379, _1381, 28.84246826171875);
            float _1385 = fma(_1379, _1383, 19.6966705322265625);
            float _1387 = fma(_1379, -0.82336294651031494140625, -5.674867153167724609375);
            float _1389 = fma(_1379, _1387, -6.565555095672607421875);
            float _1391 = 1.0 / _1385;
            float _1393 = _1379 * _1389;
            float _1395 = _1377 * _1393;
            float _1397 = fma(_1395, _1391, _1377);
            float _1399 = _1397;
            _1285 = _1363;
            if (_1355)
            {
                float _1401 = -_1397;
                float _1403 = _1401 + 1.57079637050628662109375;
                _1399 = _1403;
            }
            float _1405 = _1399;
            int _1407 = as_type<int>(_1405);
            if (!_1357)
            {
                float _1409 = -_1405;
                float _1411 = _1409 + 3.1415927410125732421875;
                _1407 = as_type<int>(_1411);
            }
            int _1413 = _1407;
            if (!_1375)
            {
                int _1415 = _1365 | _1413;
                _1285 = as_type<float>(_1415);
            }
        }
    }
    float _1417 = _1285;
    float _1419 = -_1417;
    float _1421 = _1247 + _1419;
    float _1423 = _1265 * 0.15915493667125701904296875;
    float _1425 = _359 * _1227;
    float _1427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _165);
    float _1429 = _1421 * 0.15915493667125701904296875;
    float _1431 = _1423 * 6.283185482025146484375;
    float _1433 = cos(_1431);
    float _1435 = _1425 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1437 = _551 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1439 = _357 * _1225;
    float _1441 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _161);
    float _1443 = _1427 * _1435;
    float _1445 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1437);
    float _1447 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1449 = _1429 * 6.283185482025146484375;
    float _1451 = sin(_1449);
    float _1453 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1455 = fma(_553, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1445);
    float _1457 = _1441 * _1447;
    bool _1459 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1461 = isnan(0.5);
    bool _1463 = _1459 || _1461;
    bool _1465 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1467 = _1463 || _1465;
    float _1469 = _1455 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1471 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1473 = isnan(0.5);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1479 = _1475 || _1477;
    float _1481 = _1429 * 6.283185482025146484375;
    float _1483 = cos(_1481);
    float _1485 = _1433 * _1443;
    float _1487 = _1179 * _1485;
    float _1489 = _1423 * 6.283185482025146484375;
    float _1491 = sin(_1489);
    float _1493 = _1239 * _1451;
    float _1495 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1497 = _1179 * _1483;
    float _1499 = _1239 * _1483;
    float _1501 = _1483 * _1433;
    float _1503 = -_1493;
    float _1505 = fma(_1491, _1497, _1503);
    float _1507 = -_1443;
    float _1509 = _1491 * _1507;
    float _1511 = -_1497;
    float _1513 = fma(_1491, _1493, _1511);
    float _1515 = fma(_1505, _1457, _1487);
    float _1517 = _1179 * _1451;
    float _1519 = _1451 * _1433;
    float _1521 = fma(_1501, _1457, _1509);
    float _1523 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1495);
    float _1525 = fma(_1491, _1517, _1499);
    float _1527 = fma(_1519, _1453, _1521);
    float _1529 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1523);
    float _1531 = fma(_1525, _1453, _1515);
    float _1533 = fma(_1491, _1499, _1517);
    float _1535 = _655 + _1527;
    float _1537 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1539 = _677 + _1531;
    float _1541 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1543 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1545 = _1535 + _1543;
    float _1547 = 1.0 / _1537;
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1551 = _1539 + _1549;
    float _1553 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1541);
    float _1555 = _1239 * _1485;
    float _1557 = _1551 * _1551;
    float _1559 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1553);
    float _1561 = fma(_1533, _1457, _1555);
    float _1563 = fma(_1545, _1545, _1557);
    float _1565 = _1559 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1567 = fma(_1513, _1453, _1561);
    float _1569 = sqrt(_1563);
    float _1571 = _1565 + _1537;
    float _1573 = _1469 + _1567;
    float _1575 = _1571 * _1547;
    float _1577 = _1575 * 0.5;
    float _1579 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1581 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1579);
    float _1583 = 1.0 / _1581;
    bool _1585 = _1569 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1587 = _1567;
    float _1589 = _1513;
    float _1591 = _1557;
    float _1593 = _1581;
    float _1595 = _1457;
    float _1597 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    bool _1599 = _1479;
    bool _1601 = _1467;
    if (!_1585)
    {
        _1587 = _1535;
    }
    float _1603 = _1587;
    float _1605 = _1603;
    if (!_1585)
    {
        _1589 = _1539;
    }
    float _1607 = _1589;
    float _1609 = _1607;
    if (!_1585)
    {
        _1591 = _1573;
    }
    float _1611 = _1591;
    bool _1613 = !_1585;
    float _1615 = _1611;
    if (!_1613)
    {
        float _1617 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1621 = _1569 + _1619;
        float _1623 = rsqrt(_1563);
        float _1625 = _1621 * _1617;
        float _1627 = _1573 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1629 = _1625 * 0.15915493667125701904296875;
        float _1631 = _1629 * 6.283185482025146484375;
        float _1633 = cos(_1631);
        float _1635 = _1629 * 6.283185482025146484375;
        float _1637 = sin(_1635);
        float _1639 = _1633 + (-1.0);
        float _1641 = fma(_1637, _1627, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1643 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1645 = _1623 * _1641;
        float _1647 = fma(_1573, _1633, _1643);
        float _1649 = fma(_1545, _1645, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1651 = fma(_1551, _1645, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1615 = _1647;
        _1605 = _1649;
        _1609 = _1651;
    }
    float _1653 = _1615;
    float _1655 = _1605;
    float _1657 = _1609;
    float _1659 = _1653;
    float _1661 = _1655;
    float _1663 = _1657;
    if (_1479)
    {
        _1593 = 1.0;
    }
    float _1665 = _1593;
    float _1667 = _1665;
    if (!_1467)
    {
        float _1669 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1671 = _1469 + _1669;
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1675 = -_1469;
        float _1677 = _1675 + _1653;
        float _1679 = _1671 * _1671;
        float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1683 = _677 + _1681;
        float _1685 = fma(_671, _671, _1679);
        float _1687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1689 = fma(_1683, _1683, _1685);
        float _1691 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1693 = sqrt(_1689);
        float _1695 = -_655;
        float _1697 = _1695 + _1655;
        float _1699 = precise::min(_1693, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1701 = _1699 * _1687;
        float _1703 = _1691 * _1701;
        float _1705 = -_677;
        float _1707 = _1705 + _1657;
        float _1709 = fma(_1697, _1703, _655);
        float _1711 = fma(_1677, _1703, _1469);
        float _1713 = fma(_1707, _1703, _677);
        _1659 = _1711;
        _1661 = _1709;
        _1663 = _1713;
        _673 = _1699;
    }
    float _1715 = _1659;
    float _1717 = _1661;
    float _1719 = _1663;
    float _1721 = _673;
    float _1723 = _1721;
    if (_1479)
    {
        _1595 = 1.0;
    }
    float _1725 = _1595;
    float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1729 = _1583 * _1727;
    float _1731 = _1725;
    if (!_1479)
    {
        float _1733 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1735 = _1733 * 0.15915493667125701904296875;
        float _1737 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1739 = _1735 * 6.283185482025146484375;
        float _1741 = cos(_1739);
        float _1743 = _1737 * 0.15915493667125701904296875;
        float _1745 = _1735 * 6.283185482025146484375;
        float _1747 = sin(_1745);
        float _1749 = 1.0 / _1741;
        float _1751 = _1743 * 6.283185482025146484375;
        float _1753 = cos(_1751);
        float _1755 = _1747 * _1749;
        float _1757 = _1743 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        float _1761 = _1753 * _1755;
        float _1763 = 1.0 / _1761;
        float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1767 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1765;
        float _1769 = 1.0 / _1767;
        float _1771 = _1759 * _1763;
        float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1775 = fma(_1729, _1771, _1773);
        float _1777 = _1775 * _1769;
        float _1779 = precise::clamp(_1777, 0.0, 1.0);
        _1723 = _1743;
        _679 = _1749;
        _1667 = _1779;
    }
    float _1781 = _1723;
    float _1783 = _679;
    float _1785 = _1667;
    float _1787 = _1781;
    float _1789 = _1783;
    if (!_1479)
    {
        float _1791 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1793 = _1791 * 0.15915493667125701904296875;
        float _1795 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1797 = _1793 * 6.283185482025146484375;
        float _1799 = cos(_1797);
        float _1801 = _1795 * 0.15915493667125701904296875;
        float _1803 = _1793 * 6.283185482025146484375;
        float _1805 = sin(_1803);
        float _1807 = 1.0 / _1799;
        float _1809 = _1801 * 6.283185482025146484375;
        float _1811 = cos(_1809);
        float _1813 = _1805 * _1807;
        float _1815 = _1801 * 6.283185482025146484375;
        float _1817 = sin(_1815);
        float _1819 = _1811 * _1813;
        float _1821 = 1.0 / _1819;
        float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1825 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1823;
        float _1827 = 1.0 / _1825;
        float _1829 = _1817 * _1821;
        float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1833 = fma(_1729, _1829, _1831);
        float _1835 = _1833 * _1827;
        float _1837 = precise::clamp(_1835, 0.0, 1.0);
        float _1839 = -_1837;
        float _1841 = _1839 + 1.0;
        _1787 = _1805;
        _1789 = _1793;
        _1731 = _1841;
    }
    float _1843 = _1787;
    float _1845 = _1789;
    float _1847 = _1731;
    float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1851 = _1715 + _1849;
    float _1853 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1855 = _1717 + _1853;
    float _1857 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1859 = _1719 + _1857;
    bool _1861 = _731 != 0;
    float _1863 = _1851 * _1851;
    bool _1865 = _801 != 0;
    float _1867 = fma(_1855, _1855, _1863);
    float _1869 = fma(_1859, _1859, _1867);
    float _1871 = rsqrt(_1869);
    float _1873 = sqrt(_1869);
    float _1875 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1877 = _1855 * _1875;
    float _1879 = _1859 * _1875;
    float _1881 = _1877 * _1877;
    float _1883 = _1879 * _1879;
    float _1885 = _1881 + _1883;
    float _1887 = sqrt(_1885);
    bool _1889 = _1887 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1893 = _1887 + _1891;
    float _1895 = _1871;
    float _1897 = _1893;
    float _1899 = _1843;
    float _1901 = _1851;
    float _1903 = _1875;
    if (_1889)
    {
        float _1905 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1895 = _1905;
    }
    float _1907 = _1895;
    float _1909 = _1907;
    if (_1889)
    {
        float _1911 = _1893 * _1907;
        _1897 = _1911;
    }
    float _1913 = _1897;
    if (_1889)
    {
        float _1915 = rsqrt(_1885);
        _1909 = _1915;
    }
    float _1917 = _1909;
    float _1919 = _1917;
    if (_1889)
    {
        float _1921 = _1913 * 0.15915493667125701904296875;
        _1899 = _1921;
    }
    float _1923 = _1899;
    float _1925 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1927 = _1859;
    float _1929 = _1923;
    if (_1889)
    {
        float _1931 = _1923 * 6.283185482025146484375;
        float _1933 = sin(_1931);
        _1927 = _1933;
    }
    float _1935 = _1927;
    float _1937 = precise::max(0.0, _1925);
    float _1939 = _1845;
    float _1941 = _1937;
    if (_1889)
    {
        float _1943 = _1923 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        _1939 = _1945;
    }
    float _1947 = _1939;
    float _1949 = -_1875;
    float _1951 = -_1937;
    float _1953 = fma(_1851, _1949, _1951);
    if (_1889)
    {
        float _1955 = _1953 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1901 = _1955;
    }
    float _1957 = _1901;
    float _1959 = _1935;
    float _1961 = _1957;
    if (_1889)
    {
        float _1963 = fma(_1935, _1957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1959 = _1963;
    }
    float _1965 = _1959;
    float _1967 = _1965;
    if (!_1889)
    {
        _1961 = _1879;
    }
    float _1969 = _1961;
    float _1971 = _1969;
    if (!_1889)
    {
        _1929 = _1881;
    }
    float _1973 = _1929;
    float _1975 = _1973;
    if (_1889)
    {
        float _1977 = _1917 * _1965;
        _1597 = _1977;
    }
    float _1979 = _1597;
    if (!_1889)
    {
        _1919 = _1877;
    }
    float _1981 = _1919;
    float _1983 = _1981;
    if (_1889)
    {
        float _1985 = _1947 + (-1.0);
        _1941 = _1985;
    }
    float _1987 = _1941;
    float _1989 = _1987;
    if (_1889)
    {
        float _1991 = _1877 * _1979;
        _1983 = _1991;
    }
    float _1993 = _1983;
    if (!_1889)
    {
        _1967 = _1953;
    }
    float _1995 = _1967;
    float _1997 = _1995;
    if (_1889)
    {
        float _1999 = _1879 * _1979;
        _1971 = _1999;
    }
    float _2001 = _1971;
    if (_1889)
    {
        float _2003 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1903 = _2003;
    }
    float _2005 = _1903;
    if (_1889)
    {
        float _2007 = _1993 * _1993;
        _1975 = _2007;
    }
    float _2009 = _1975;
    if (!_1889)
    {
        _1989 = _1883;
    }
    float _2011 = _1989;
    float _2013 = _2011;
    if (_1889)
    {
        float _2015 = _2001 * _2001;
        _2013 = _2015;
    }
    float _2017 = _2013;
    if (_1889)
    {
        float _2019 = fma(_1953, _1947, _2005);
        _1997 = _2019;
    }
    float _2021 = _1997;
    float _2023 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2025 = fma(_2021, _2021, _2009);
    float _2027 = _2025 + _2017;
    float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2031 = fma(_1873, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2029);
    float _2033 = precise::clamp(_2031, 0.0, 1.0);
    float _2035 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2023);
    float _2037 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2039 = rsqrt(_2027);
    float _2041 = -_2033;
    float _2043 = _2041 + 1.0;
    float _2045 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2035);
    float _2047 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2049 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2037);
    float _2051 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2053 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2055 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2047);
    float _2057 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2049);
    float _2059 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2051);
    float _2061 = abs(_2043);
    float _2063 = log2(_2061);
    float _2065 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2055);
    float _2067 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2069 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2059);
    float _2071 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2073 = _2065 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2075 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2077 = _2039 * _1993;
    float _2079 = _2039 * _2021;
    float _2081 = _2039 * _2001;
    float _2083 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2075);
    float _2085 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2087 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2089 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2091 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2083);
    float _2093 = -_2085;
    float _2095 = fma(_2079, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2093);
    float _2097 = -_2087;
    float _2099 = fma(_2097, _2071, 1.0);
    float _2101 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2103 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2091);
    float _2105 = -_2081;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2095);
    float _2109 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2111 = exp2(_2101);
    float _2113 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2115 = fma(_2107, -0.5, 0.5);
    float _2117 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2109);
    float _2119 = fma(_2107, 0.5, 0.5);
    float _2121 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2113);
    float _2123 = _2079 + 1.0;
    float _2125 = log2(_2099);
    float _2127 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2117);
    float _2129 = fma(_2119, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2131 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2121);
    float _2133 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2127);
    float _2135 = fma(_2119, _2129, -0.212114393711090087890625);
    float _2137 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2131);
    float _2139 = 1.0 / _2103;
    float _2141 = -_2079;
    float _2143 = fma(_2111, _2123, _2141);
    float _2145 = fma(_2119, _2135, 1.570728778839111328125);
    float _2147 = fma(_2143, 0.5, 0.5);
    float _2149 = sqrt(_2115);
    float _2151 = _2125 * 0.693147182464599609375;
    float _2153 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2155 = _2133 * _2139;
    float _2157 = _2137 * _2139;
    float _2159 = fma(_2155, 0.5, 0.5);
    float _2161 = fma(_2157, -0.5, 0.5);
    float _2163 = _2149 * 0.636619746685028076171875;
    float _2165 = -_2145;
    float _2167 = fma(_2163, _2165, 1.0);
    float3 _7102 = float3(_2159, _2161, _2153);
    float _2169 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7102, float3(0.0), isnan(_7102)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7102, float3(0.0), isnan(_7102)), level(0.0)).x;
    float3 _7113 = float3(_2159, _2161, _2153);
    float4 _2172 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7113, float3(0.0), isnan(_7113)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7113, float3(0.0), isnan(_7113)), level(0.0)).xyzw;
    float _2174 = _2172.x;
    float _2176 = _2172.y;
    float _2178 = _2172.z;
    float _2180 = _2172.w;
    float2 _7130 = float2(_2167, _2147);
    float3 _2184 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7130, float2(0.0), isnan(_7130)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7130, float2(0.0), isnan(_7130)), level(0.0)).xyz;
    float _2186 = _2184.x;
    float _2188 = _2184.y;
    float _2190 = _2184.z;
    float _2192 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2194 = int(_2192);
    int _2196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2198 = _2196 != 0;
    float _2200 = _1077 * (-0.15915493667125701904296875);
    int _2202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2204 = _2202 != 0;
    float _2206 = -_1087;
    float _2208 = _2206 + 1.0;
    float _2210 = -_907;
    float _2212 = _2210 + 1.0;
    float _2214 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2216 = int(_2214);
    float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2220 = _2218 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2222 = -_1115;
    float _2224 = _2222 + 1.0;
    float _2226 = 0.5;
    if (_2198)
    {
        float _2228 = in.m_52.w;
        _2226 = _2228;
    }
    float _2230 = _2226;
    float _2232 = trunc(_1113);
    int _2234 = int(_2232);
    float _2236 = float(uint(_2194));
    float _2238 = trunc(_1067);
    int _2240 = int(_2238);
    float _2242 = float(uint(_2216));
    float _2244 = _2161;
    if (_2204)
    {
        float _2246 = in.m_52.x;
        _2244 = _2246;
    }
    float _2248 = _2244;
    int _2250 = ~_2194;
    int _2252 = _2250 + 1;
    float _2254 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2256 = _2254 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2260 = _2258 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2262 = 1.0 / _2236;
    float _2264 = float(uint(_2234));
    float _2266 = -_1109;
    float _2268 = _2266 + 1.0;
    float _2270 = -_1117;
    float _2272 = _2270 + 1.0;
    float _2274 = _2230;
    if (_2198)
    {
        float _2276 = _2230 * 3.1415927410125732421875;
        _2274 = _2276;
    }
    float _2278 = _2274;
    bool _2280 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2282 = isnan(_411);
    bool _2284 = _2280 || _2282;
    bool _2286 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2288 = _2284 || _2286;
    float _2290 = float(_2288);
    float _2292 = 1.0 / _2242;
    bool _2294 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2296 = isnan(_413);
    bool _2298 = _2294 || _2296;
    bool _2300 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2302 = _2298 || _2300;
    float _2304 = float(_2302);
    float _2306 = _2278;
    if (_2198)
    {
        float _2308 = _2278 * 0.15915493667125701904296875;
        _2306 = _2308;
    }
    float _2310 = _2306;
    bool _2312 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2314 = isnan(_413);
    bool _2316 = _2312 || _2314;
    bool _2318 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2320 = _2316 || _2318;
    float _2322 = float(_2320);
    float _2324 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2326 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2328 = isnan(_413);
    bool _2330 = _2326 || _2328;
    bool _2332 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2334 = _2330 || _2332;
    float _2336 = float(_2334);
    float _2338 = float(_2216);
    float _2340 = _2310;
    if (_2198)
    {
        float _2342 = _2310 * 6.283185482025146484375;
        float _2344 = sin(_2342);
        _2340 = _2344;
    }
    float _2346 = _2340;
    int _2348 = as_type<int>(_2262) + (-2);
    float _2350 = float(uint(_2240));
    int _2352 = abs(_1141);
    float _2354 = as_type<float>(_2348) * _2264;
    int _2356 = abs(_1193);
    float _2358 = 1.0 / _2220;
    int _2360 = as_type<int>(_2292) + (-2);
    int _2362 = abs(_1153);
    float _2364 = as_type<float>(_2360) * _2350;
    float _2366 = trunc(_2354);
    float _2368 = precise::max(_2366, 0.0);
    uint _2371 = uint(_2368);
    int _2373 = ~_2216;
    int _2375 = _2373 + 1;
    if (_2198)
    {
        bool _2377 = _2346 > 0.5;
        _1599 = _2377;
    }
    bool _2379 = _1599;
    float _2381 = trunc(_2364);
    float _2383 = precise::max(_2381, 0.0);
    uint _2385 = uint(_2383);
    int _2387 = _2252 * int(_2371);
    int _2389 = _2387 + _2234;
    float _2391 = 1.0 / _2256;
    float _2393 = float(uint(_2389));
    float _2395 = as_type<float>(_2389);
    if (_2204)
    {
        float _2397 = _2248 * 3.1415927410125732421875;
        _2395 = _2397;
    }
    float _2399 = _2395;
    float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2403 = _2401 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _2405 = _2375 * int(_2385);
    int _2407 = _2405 + _2240;
    int _2409 = ~_2194;
    int _2411 = _2409 + 1;
    float _2413 = as_type<float>(_2348) * _2393;
    float _2415 = _2399;
    float _2417 = as_type<float>(_2411);
    if (_2204)
    {
        float _2419 = _2399 * 0.15915493667125701904296875;
        _2415 = _2419;
    }
    float _2421 = _2415;
    float _2423 = 1.0 / _2403;
    float _2425 = float(uint(_2407));
    float _2427 = as_type<float>(_2360) * _2425;
    float _2429 = trunc(_2413);
    float _2431 = precise::max(_2429, 0.0);
    uint _2433 = uint(_2431);
    float _2435 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2437 = _2435 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2439 = _2421;
    if (_2204)
    {
        float _2441 = _2421 * 6.283185482025146484375;
        float _2443 = sin(_2441);
        _2439 = _2443;
    }
    float _2445 = _2439;
    float _2447 = trunc(_2427);
    float _2449 = precise::max(_2447, 0.0);
    uint _2451 = uint(_2449);
    int _2453 = int(_2371) + int(_2433);
    if (!_2204)
    {
        _2417 = _165;
    }
    float _2455 = _2417;
    int _2457 = _2411 * _2453;
    int _2459 = _2457 + _2234;
    float _2461 = _2455;
    if (_2204)
    {
        bool _2463 = _2445 > 0.5;
        _1601 = _2463;
    }
    bool _2465 = _1601;
    float _2467 = 1.0 / _2437;
    bool _2469 = uint(_2459) >= uint(_2194);
    float _2471 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2473 = _2471 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    int _2475 = ~_2216;
    int _2477 = _2475 + 1;
    float _2479 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2481 = _2479 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _2483 = int(_2385) + int(_2451);
    float _2485 = 1.0 / _2473;
    float _2487 = as_type<float>(_2451);
    if (!_2198)
    {
        _2487 = _161;
    }
    float _2489 = _2487;
    float _2491 = _2489;
    if (_2198)
    {
        float _2493 = -_161;
        float _2495 = _2379 ? _2493 : _161;
        _2491 = _2495;
    }
    float _2497 = _2491;
    int _2499 = _2477 * _2483;
    int _2501 = _2499 + _2240;
    int _2503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2505 = _2503 != 0;
    if (_2204)
    {
        float _2507 = -_165;
        float _2509 = _2465 ? _2507 : _165;
        _2461 = _2509;
    }
    float _2511 = _2461;
    float _2513 = 1.0 / _2481;
    bool _2515 = !_2469;
    int _2517 = _2515 ? 0 : (-1);
    int _2519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2521 = _2519 != 0;
    int _2523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2525 = _2523 != 0;
    int _2527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2529 = _2527 != 0;
    float _2531 = 1.0 / _2260;
    int _2533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2535 = _2533 != 0;
    bool _2537 = !_2505;
    int _2539 = _2537 ? 0 : 1;
    bool _2541 = uint(_2501) >= uint(_2216);
    float _2543 = exp2(_2324);
    float _2545 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2547 = _2545 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2549 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2551 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2553 = 1.0 / _2547;
    float _2555 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2557 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2559 = _2549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2561 = _2551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2563 = _2555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2565 = !_2541;
    int _2567 = _2565 ? 0 : (-1);
    float _2569 = -_2543;
    float _2571 = _2569 + 1.0;
    int _2573 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2575 = _2573 != 0;
    bool _2577 = !_2535;
    int _2579 = _2577 ? 0 : 1;
    out.m_56.x = _2559;
    out.m_56.y = _2561;
    out.m_56.z = _2563;
    out.m_56.w = _2557;
    int _2581 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2583 = _2581 != 0;
    float _2585 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2587 = ~_2453;
    int _2589 = _2587 + _2517;
    int _2591 = _2589 + 1;
    float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2595 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2593;
    float _2597 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2599 = _2597 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2601 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2603 = _2601 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    int _2605 = abs(_2539);
    float _2607 = _2595 * _2358;
    float _2609 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2611 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2609;
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2615 = _2613 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _2619 = _2617 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2621 = _2599 * _2423;
    float _2623 = _2611 * _2513;
    float _2625 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _2627 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _2625;
    float _2629 = 1.0 / _2615;
    int _2631 = ~_2483;
    int _2633 = _2631 + _2567;
    int _2635 = _2633 + 1;
    float _2637 = _2627 * _2485;
    float _2639 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _2639;
    float _2643 = _2619 * _2467;
    float _2645 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _2647 = _2645 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2649 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2651 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2649;
    float _2653 = _2641 * _2553;
    float _2655 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2657 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _2655;
    float _2659 = 1.0 / _2603;
    float _2661 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2663 = _413 + _2661;
    float _2665 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2667 = _411 + _2665;
    float _2669 = _2657 * _2531;
    float _2671 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2673 = _411 + _2671;
    float _2675 = fma(_2637, _2663, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _2677 = fma(_2607, _2667, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2681 = _413 + _2679;
    float _2683 = fma(_2621, _2673, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2685 = _2647 * _2391;
    float _2687 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2689 = _413 + _2687;
    float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2693 = _411 + _2691;
    float _2695 = fma(_2669, _2681, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _2697 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2699 = isnan(_413);
    bool _2701 = _2697 || _2699;
    bool _2703 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2705 = _2701 || _2703;
    float _2707 = float(_2705);
    float _2709 = fma(_2643, _2689, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _2711 = fma(_2623, _2693, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _2713 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2715 = isnan(_413);
    bool _2717 = _2713 || _2715;
    bool _2719 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2721 = _2717 || _2719;
    float _2723 = float(_2721);
    float _2725 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2727 = _413 + _2725;
    float _2729 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2731 = _413 + _2729;
    float _2733 = _2651 * _2629;
    bool _2735 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2737 = isnan(_411);
    bool _2739 = _2735 || _2737;
    bool _2741 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2743 = _2739 || _2741;
    float _2745 = float(_2743);
    float _2747 = fma(_2653, _2727, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2749 = -_2723;
    float _2751 = _2749 + 1.0;
    bool _2753 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2755 = isnan(_413);
    bool _2757 = _2753 || _2755;
    bool _2759 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2761 = _2757 || _2759;
    float _2763 = float(_2761);
    float _2765 = fma(_2685, _2731, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _2767 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2769 = isnan(_411);
    bool _2771 = _2767 || _2769;
    bool _2773 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2775 = _2771 || _2773;
    float _2777 = float(_2775);
    float _2779 = -_2707;
    float _2781 = _2779 + 1.0;
    bool _2783 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2785 = isnan(_411);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2791 = _2787 || _2789;
    float _2793 = float(_2791);
    float _2795 = _2707 * _2751;
    bool _2797 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2799 = isnan(_413);
    bool _2801 = _2797 || _2799;
    bool _2803 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2805 = _2801 || _2803;
    float _2807 = float(_2805);
    float _2809 = -_2763;
    float _2811 = _2809 + 1.0;
    bool _2813 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2815 = isnan(_413);
    bool _2817 = _2813 || _2815;
    bool _2819 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2821 = _2817 || _2819;
    float _2823 = float(_2821);
    float _2825 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _2827 = _2825 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2829 = _2763 * _2781;
    float _2831 = _2807 * _2811;
    float _2833 = -_2807;
    float _2835 = _2833 + 1.0;
    float _2837 = -_2777;
    float _2839 = _2837 + 1.0;
    float _2841 = -_2823;
    float _2843 = _2841 + 1.0;
    float _2845 = _2827 * _2659;
    float _2847 = _2823 * _2835;
    float _2849 = _2745 * _2839;
    float _2851 = -_2745;
    float _2853 = _2851 + 1.0;
    float _2855 = _2304 * _2843;
    float _2857 = -_2304;
    float _2859 = _2857 + 1.0;
    float _2861 = _533 * _535;
    float _2863 = _2290 * _2853;
    float _2865 = _537 * _535;
    float _2867 = _2322 * _2859;
    float _2869 = -_2322;
    float _2871 = _2869 + 1.0;
    float _2873 = _2677 * _2863;
    float _2875 = floor(_2861);
    float _2877 = float(_2194);
    float _2879 = _2336 * _2871;
    float _2881 = float(_2234);
    float _2883 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2885 = _413 + _2883;
    float _2887 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2889 = _413 + _2887;
    float _2891 = _2675 * _2879;
    bool _2893 = _2881 >= _2877;
    bool _2895 = isnan(_2881);
    bool _2897 = _2893 || _2895;
    bool _2899 = isnan(_2877);
    bool _2901 = _2897 || _2899;
    float _2903 = float(_2901);
    float _2905 = floor(_2865);
    float _2907 = float(_2240);
    float _2909 = -_2290;
    float _2911 = _2909 + 1.0;
    float _2913 = fma(_2733, _2889, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2915 = -_2793;
    float _2917 = _2915 + 1.0;
    bool _2919 = _2907 >= _2338;
    bool _2921 = isnan(_2907);
    bool _2923 = _2919 || _2921;
    bool _2925 = isnan(_2338);
    bool _2927 = _2923 || _2925;
    float _2929 = float(_2927);
    float _2931 = fma(_2911, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2873);
    float _2933 = fma(_2845, _2885, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2935 = trunc(_2903);
    int _2937 = int(_2935);
    float _2939 = _2777 * _2917;
    float _2941 = fma(_2683, _2849, _2931);
    float _2943 = -_2875;
    float _2945 = _2861 + _2943;
    float _2947 = -_165;
    int _2949 = _1865 ? as_type<int>(_2947) : as_type<int>(_165);
    int _2951 = _2216 * _2635;
    int _2953 = _2951 + _2240;
    float _2955 = fma(_2711, _2939, _2941);
    float _2957 = _2945 * _2877;
    float _2959 = trunc(_2929);
    int _2961 = int(_2959);
    float _2963 = -_2905;
    float _2965 = _2865 + _2963;
    float _2967 = _2877 * _1105;
    float _2969 = _2338 * _1105;
    float _2971 = -_161;
    int _2973 = _1861 ? as_type<int>(_2971) : as_type<int>(_161);
    int _2975 = _2194 * _2591;
    int _2977 = _2975 + _2234;
    bool _2979 = _2194 == 0;
    float _2981 = -_2336;
    float _2983 = _2981 + 1.0;
    bool _2985 = _521 > 0.5;
    float _2987 = _2965 * _2338;
    float _2989 = trunc(_2967);
    int _2991 = int(_2989);
    int _2993 = ~_2937;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    float _2999 = fma(_2983, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2891);
    bool _3001 = !_2979;
    int _3003 = _3001 ? _2977 : (-1);
    float _3005 = _2585 * _2169;
    bool _3007 = !_2575;
    float _3009 = _3007 ? _165 : as_type<float>(_2949);
    float _3011 = fma(_2709, _2867, _2999);
    bool _3013 = _2216 == 0;
    float _3015 = trunc(_2987);
    int _3017 = int(_3015);
    int _3019 = _2194 + (-1);
    int _3021 = _3003 * _2997;
    int _3023 = ~_2961;
    int _3025 = _3023 + 1;
    int _3027 = _3025 + 1;
    float _3029 = fma(_2747, _2855, _3011);
    bool _3031 = !_3013;
    int _3033 = _3031 ? _2953 : (-1);
    int _3035 = _2937 * _3019;
    int _3037 = _3035 + _3021;
    int _3039 = _2216 + (-1);
    float _3041 = trunc(_2957);
    int _3043 = int(_3041);
    int _3045 = abs(_2579);
    int _3047 = _3033 * _3027;
    int _3049 = abs(_841);
    float _3051 = fma(_2765, _2847, _3029);
    int _3053 = _2961 * _3039;
    int _3055 = _3053 + _3047;
    float _3057 = trunc(_2969);
    int _3059 = int(_3057);
    int _3061 = abs(_1213);
    int _3063 = _3037 * _2352;
    int _3065 = abs(_1147);
    int _3067 = _3017 * _3045;
    int _3069 = _3067 + _2240;
    int _3071 = _3055 * _2356;
    float _3073 = _1101 * (-0.15915493667125701904296875);
    int _3075 = _2991 * _3049;
    int _3077 = _3075 + _3063;
    int _3079 = abs(_1245);
    int _3081 = _3043 * _2605;
    int _3083 = _3081 + _2234;
    float _3085 = _593 * (-0.15915493667125701904296875);
    float _3087 = _3073 * 6.283185482025146484375;
    float _3089 = sin(_3087);
    float _3091 = fma(_2695, _2831, _3051);
    int _3093 = _3059 * _3061;
    int _3095 = _3093 + _3071;
    int _3097 = _3083 * _3065;
    int _3099 = _3097 + _3077;
    float _3101 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _3103 = fma(_2933, _2829, _3091);
    float _3105 = fma(_2793, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2955);
    int _3107 = _3069 * _3079;
    int _3109 = _3107 + _3095;
    int _3111 = _3043 * _2362;
    int _3113 = _3111 + _3099;
    float _3115 = _3073 * 6.283185482025146484375;
    float _3117 = cos(_3115);
    int _3119 = abs(_1251);
    float _3121 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _3123 = fma(_2913, _2795, _3103);
    float _3125 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _3127 = !_2525;
    float _3129 = _3127 ? _161 : as_type<float>(_2973);
    int _3131 = _3017 * _3119;
    int _3133 = _3131 + _3109;
    float _3135 = _3121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3137 = _3125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3139 = _3101 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3141 = float(uint(_3113));
    float _3143 = _3105 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _3145 = -_161;
    int _3147 = _2985 ? as_type<int>(_3145) : as_type<int>(_161);
    float _3149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _3151 = float(uint(_3133));
    float _3153 = as_type<float>(_2348) * _3141;
    bool _3155 = !_2583;
    float _3157 = _3155 ? _161 : as_type<float>(_3147);
    float _3159 = _3009 * _3089;
    float _3161 = _3009 * _3117;
    float _3163 = as_type<float>(_2360) * _3151;
    out.m_58.x = _3135;
    out.m_58.y = _3137;
    out.m_58.z = _3139;
    out.m_58.w = _3143;
    float _3165 = trunc(_3153);
    float _3167 = precise::max(_3165, 0.0);
    uint _3169 = uint(_3167);
    float _3171 = -_3159;
    float _3173 = fma(_3157, _3117, _3171);
    int _3175 = ~_2194;
    int _3177 = _3175 + 1;
    float _3179 = fma(_3157, _3089, _3161);
    float _3181 = fma(_2723, (*spvDescriptorSet0.vp_c9)._m0[158].x, _3123);
    float _3183 = trunc(_3163);
    float _3185 = precise::max(_3183, 0.0);
    uint _3187 = uint(_3185);
    float _3189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3191 = _3149 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3193 = float(uint(_3083));
    float _3195 = _2190 * _3005;
    int _3197 = ~_2216;
    int _3199 = _3197 + 1;
    int _3201 = _3177 * int(_3169);
    int _3203 = _3201 + _3113;
    out.m_60.x = _3181;
    float _3205 = _3085 * 6.283185482025146484375;
    float _3207 = sin(_3205);
    float _3209 = as_type<float>(_2348) * _3193;
    int _3211 = _3199 * int(_3187);
    int _3213 = _3211 + _3133;
    float _3215 = float(uint(_3203));
    float _3217 = _3173 + 0.5;
    float _3219 = float(uint(_3213));
    float _3221 = _3085 * 6.283185482025146484375;
    float _3223 = cos(_3221);
    float _3225 = as_type<float>(_2348) * _3215;
    float _3227 = _3189 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3229 = _3179 + (-0.5);
    float _3231 = fma(_3191, _3217, _811);
    int _3233 = ~_2194;
    int _3235 = _3233 + 1;
    float _3237 = as_type<float>(_2360) * _3219;
    float _3239 = -_3227;
    float _3241 = -_817;
    float _3243 = fma(_3239, _3229, _3241);
    float _3245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3247 = _3207 * _2511;
    float _3249 = float(uint(_3069));
    float _3251 = as_type<float>(_2360) * _3249;
    float _3253 = trunc(_3209);
    float _3255 = precise::max(_3253, 0.0);
    uint _3257 = uint(_3255);
    float _3259 = -_3247;
    float _3261 = fma(_3223, _2497, _3259);
    float _3263 = _3223 * _2511;
    float _3265 = _3261 + 0.5;
    float _3267 = fma(_3207, _2497, _3263);
    float _3269 = trunc(_3225);
    float _3271 = precise::max(_3269, 0.0);
    uint _3273 = uint(_3271);
    float _3275 = _3245 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3277 = _807 + (-0.5);
    float _3279 = fma(_3265, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1003);
    float _3281 = _815 + 0.5;
    float _3283 = _3267 + (-0.5);
    float _3285 = -_3275;
    float _3287 = -_1123;
    float _3289 = fma(_3285, _3277, _3287);
    float _3291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3293 = _3235 * int(_3257);
    int _3295 = _3293 + _3083;
    int _3297 = ~_2194;
    int _3299 = _3297 + 1;
    float _3301 = -_3283;
    float _3303 = -_927;
    float _3305 = fma(_3301, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3303);
    float _3307 = -_2208;
    float _3309 = fma(_3261, _3307, _3279);
    float _3311 = fma(_807, _2272, _3289);
    float _3313 = fma(_3267, _2212, _3305);
    float _3315 = trunc(_3251);
    float _3317 = precise::max(_3315, 0.0);
    uint _3319 = uint(_3317);
    int _3321 = int(_3169) + int(_3273);
    int _3323 = ~_2216;
    int _3325 = _3323 + 1;
    out.m_62.x = _3309;
    out.m_62.y = _3313;
    float _3327 = trunc(_3237);
    float _3329 = precise::max(_3327, 0.0);
    uint _3331 = uint(_3329);
    float _3333 = _3291 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3335 = fma(_3333, _3281, _1127);
    float _3337 = _2200 * 6.283185482025146484375;
    float _3339 = sin(_3337);
    float _3341 = float(uint(_3295));
    float _3343 = as_type<float>(_2348) * _3341;
    int _3345 = _3299 * _3321;
    int _3347 = _3345 + _3113;
    int _3349 = ~_2216;
    int _3351 = _3349 + 1;
    float _3353 = _2200 * 6.283185482025146484375;
    float _3355 = cos(_3353);
    int _3357 = int(_3187) + int(_3331);
    bool _3359 = uint(_3347) >= uint(_2194);
    int _3361 = _3351 * int(_3319);
    int _3363 = _3361 + _3069;
    bool _3365 = !_3359;
    int _3367 = _3365 ? 0 : (-1);
    float _3369 = trunc(_3343);
    float _3371 = precise::max(_3369, 0.0);
    uint _3373 = uint(_3371);
    float _3375 = float(uint(_3363));
    int _3377 = _3325 * _3357;
    int _3379 = _3377 + _3133;
    int _3381 = ~_3321;
    int _3383 = _3381 + _3367;
    int _3385 = _3383 + 1;
    float _3387 = _743 * _3339;
    float _3389 = as_type<float>(_2360) * _3375;
    bool _3391 = uint(_3379) >= uint(_2216);
    int _3393 = _2194 * _3385;
    int _3395 = _3393 + _3113;
    float _3397 = _743 * _3355;
    float _3399 = -_3387;
    float _3401 = fma(_3129, _3355, _3399);
    float _3403 = trunc(_3389);
    float _3405 = precise::max(_3403, 0.0);
    uint _3407 = uint(_3405);
    bool _3409 = !_3391;
    int _3411 = _3409 ? 0 : (-1);
    float _3413 = fma(_3129, _3339, _3397);
    bool _3415 = !_2979;
    int _3417 = _3415 ? _3395 : (-1);
    float _3419 = _3401 + 0.5;
    int _3421 = ~_3357;
    int _3423 = _3421 + _3411;
    int _3425 = _3423 + 1;
    int _3427 = _3417 & 3;
    bool _3429 = _3427 != 0;
    float _3431 = fma(_3419, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1121);
    int _3433 = ~_2194;
    int _3435 = _3433 + 1;
    int _3437 = _2216 * _3425;
    int _3439 = _3437 + _3133;
    bool _3441 = uint(_3427) > 1u;
    int _3443 = int(_3257) + int(_3373);
    int _3445 = _3417 & 3;
    bool _3447 = _3445 != 0;
    int _3449 = int(_3319) + int(_3407);
    int _3451 = _3435 * _3443;
    int _3453 = _3451 + _3083;
    int _3455 = _3447 ? 0 : 1;
    bool _3457 = !_3013;
    int _3459 = _3457 ? _3439 : (-1);
    int _3461 = _3417 >> 31;
    bool _3463 = uint(_3453) >= uint(_2194);
    int _3465 = ~_3455;
    int _3467 = _3465 + 1;
    int _3469 = _3467 + 1;
    int _3471 = _3459 >> 31;
    int _3473 = _3469;
    if (!_3441)
    {
        int _3475 = ~_3455;
        int _3477 = _3475 + 1;
        _3473 = _3477;
    }
    int _3479 = _3473;
    float _3481 = _3413 + (-0.5);
    int _3483 = _3461 & 3;
    int _3485 = _3471 & 3;
    float _3487 = -_3481;
    float _3489 = -_1071;
    float _3491 = fma(_3487, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3489);
    int _3493 = _3417 + _3483;
    bool _3495 = !_3463;
    int _3497 = _3495 ? 0 : (-1);
    int _3499 = ~_2216;
    int _3501 = _3499 + 1;
    int _3503 = _3459 + _3485;
    int _3505 = _3493 >> 2;
    int _3507 = _3501 * _3449;
    int _3509 = _3507 + _3069;
    bool _3511 = uint(_3427) >= 2u;
    int _3513 = ~_3443;
    int _3515 = _3513 + _3497;
    int _3517 = _3515 + 1;
    int _3519 = _3503 >> 2;
    int _3521 = _3505 << 4;
    int _3523 = _3521 + 512;
    float _3525 = -_1107;
    float _3527 = _3525 + 1.0;
    int _3529 = _3511 ? 0 : 1;
    int _3531 = _2194 * _3517;
    int _3533 = _3531 + _3083;
    bool _3535 = _3427 != 3;
    int _3537 = _3519 << 4;
    int _3539 = _3537 + 800;
    uint _3541 = uint(int(uint(_3523) >> uint(2)));
    uint _3543 = uint(int(uint(int(_3541)) >> uint(2)));
    int _3545 = int(_3541) & 3;
    float _3547 = (*spvDescriptorSet0.vp_c9)._m0[int(_3543)][_3545];
    int _3549 = int(_3541) + 1;
    uint _3551 = uint(int(uint(_3549) >> uint(2)));
    int _3553 = _3549 & 3;
    float _3555 = (*spvDescriptorSet0.vp_c9)._m0[int(_3551)][_3553];
    bool _3557 = uint(_3509) >= uint(_2216);
    int _3559 = ~_3529;
    int _3561 = _3559 + 1;
    int _3563 = _3561 + 1;
    bool _3565 = !_3429;
    int _3567 = _3565 ? 0 : 1;
    int _3569 = _3459 & 3;
    bool _3571 = _3569 != 0;
    uint _3573 = uint(int(uint(_3539) >> uint(2)));
    uint _3575 = uint(int(uint(int(_3573)) >> uint(2)));
    int _3577 = int(_3573) & 3;
    float _3579 = (*spvDescriptorSet0.vp_c9)._m0[int(_3575)][_3577];
    int _3581 = int(_3573) + 1;
    uint _3583 = uint(int(uint(_3581) >> uint(2)));
    int _3585 = _3581 & 3;
    float _3587 = (*spvDescriptorSet0.vp_c9)._m0[int(_3583)][_3585];
    int _3589 = _3563;
    if (_3535)
    {
        int _3591 = ~_3529;
        int _3593 = _3591 + 1;
        _3589 = _3593;
    }
    int _3595 = _3589;
    float _3597 = -_2224;
    float _3599 = fma(_815, _3597, _3335);
    float _3601 = -_3527;
    float _3603 = fma(_3173, _3601, _3231);
    float _3605 = fma(_3179, _2268, _3243);
    int _3607 = _3459 & 3;
    bool _3609 = _3607 != 0;
    float _3611 = -_1089;
    float _3613 = _3611 + 1.0;
    float _3615 = -_1095;
    float _3617 = _3615 + 1.0;
    int _3619 = _3523 + 8;
    uint _3621 = uint(int(uint(_3619) >> uint(2)));
    uint _3623 = uint(int(uint(int(_3621)) >> uint(2)));
    int _3625 = int(_3621) & 3;
    float _3627 = (*spvDescriptorSet0.vp_c9)._m0[int(_3623)][_3625];
    int _3629 = int(_3621) + 1;
    uint _3631 = uint(int(uint(_3629) >> uint(2)));
    int _3633 = _3629 & 3;
    float _3635 = (*spvDescriptorSet0.vp_c9)._m0[int(_3631)][_3633];
    bool _3637 = !_3557;
    int _3639 = _3637 ? 0 : (-1);
    float _3641 = -_3613;
    float _3643 = fma(_3401, _3641, _3431);
    bool _3645 = uint(_3607) > 1u;
    float _3647 = fma(_3413, _3617, _3491);
    int _3649 = _3571 ? 0 : 1;
    out.m_64.x = _3599;
    out.m_64.y = _3311;
    int _3651 = abs(_3479);
    int _3653 = _3539 + 8;
    uint _3655 = uint(int(uint(_3653) >> uint(2)));
    uint _3657 = uint(int(uint(int(_3655)) >> uint(2)));
    int _3659 = int(_3655) & 3;
    float _3661 = (*spvDescriptorSet0.vp_c9)._m0[int(_3657)][_3659];
    int _3663 = int(_3655) + 1;
    uint _3665 = uint(int(uint(_3663) >> uint(2)));
    int _3667 = _3663 & 3;
    float _3669 = (*spvDescriptorSet0.vp_c9)._m0[int(_3665)][_3667];
    int _3671 = ~_3649;
    int _3673 = _3671 + 1;
    int _3675 = _3673 + 1;
    out.m_66.x = _3603;
    out.m_66.y = _3605;
    out.m_66.z = _3643;
    out.m_66.w = _3647;
    bool _3677 = !_3609;
    int _3679 = _3677 ? 0 : 1;
    bool _3681 = uint(_3607) >= 2u;
    int _3683 = abs(_3679);
    int _3685 = _3675;
    if (!_3645)
    {
        int _3687 = ~_3649;
        int _3689 = _3687 + 1;
        _3685 = _3689;
    }
    int _3691 = _3685;
    bool _3693 = _3607 != 3;
    int _3695 = _3681 ? 0 : 1;
    bool _3697 = _3427 != 3;
    float _3699 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3701 = abs(_3691);
    float _3703 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3699);
    int _3705 = abs(_3567);
    int _3707 = ~_3651;
    int _3709 = _3707 + 1;
    int _3711 = _3709 + 1;
    float _3713 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3703);
    int _3715 = ~_3701;
    int _3717 = _3715 + 1;
    int _3719 = _3717 + 1;
    int _3721 = _3711 * as_type<int>(_3555);
    int _3723 = ~_3705;
    int _3725 = _3723 + 1;
    int _3727 = _3725 + 1;
    int _3729 = ~_3683;
    int _3731 = _3729 + 1;
    int _3733 = _3731 + 1;
    int _3735 = _3719 * as_type<int>(_3587);
    int _3737 = ~_3449;
    int _3739 = _3737 + _3639;
    int _3741 = _3739 + 1;
    int _3743 = _3727 * as_type<int>(_3547);
    int _3745 = _3743 + _3721;
    bool _3747 = _3607 != 3;
    int _3749 = _3733 * as_type<int>(_3579);
    int _3751 = _3749 + _3735;
    bool _3753 = !_3697;
    int _3755 = _3753 ? 0 : (-1);
    int _3757 = _2216 * _3741;
    int _3759 = _3757 + _3069;
    int _3761 = abs(_3595);
    bool _3763 = !_3747;
    int _3765 = _3763 ? 0 : (-1);
    int _3767 = ~_3695;
    int _3769 = _3767 + 1;
    int _3771 = _3769 + 1;
    int _3773 = abs(_3755);
    int _3775 = _3771;
    if (_3693)
    {
        int _3777 = ~_3695;
        int _3779 = _3777 + 1;
        _3775 = _3779;
    }
    int _3781 = _3775;
    int _3783 = ~_3761;
    int _3785 = _3783 + 1;
    int _3787 = _3785 + 1;
    bool _3789 = !_2521;
    int _3791 = _3789 ? 0 : 1;
    int _3793 = abs(_3765);
    int _3795 = _3787 * as_type<int>(_3627);
    int _3797 = _3795 + _3745;
    int _3799 = abs(_3781);
    int _3801 = abs(_3791);
    int _3803 = ~_3773;
    int _3805 = _3803 + 1;
    int _3807 = _3805 + 1;
    int _3809 = ~_3799;
    int _3811 = _3809 + 1;
    int _3813 = _3811 + 1;
    int _3815 = _3807 * as_type<int>(_3635);
    int _3817 = _3815 + _3797;
    bool _3819 = !_2529;
    int _3821 = _3819 ? 0 : 1;
    int _3823 = _3813 * as_type<int>(_3661);
    int _3825 = _3823 + _3751;
    int _3827 = ~_3793;
    int _3829 = _3827 + 1;
    int _3831 = _3829 + 1;
    int _3833 = abs(_3821);
    float _3835 = _1785 * _1847;
    int _3837 = ~_3801;
    int _3839 = _3837 + 1;
    int _3841 = _3839 + 1;
    int _3843 = _3831 * as_type<int>(_3669);
    int _3845 = _3843 + _3825;
    int _3847 = ~_3833;
    int _3849 = _3847 + 1;
    int _3851 = _3849 + 1;
    float _3853 = _3835 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3855 = _1785 > 0.0;
    bool _3857 = isnan(_1785);
    bool _3859 = _3855 || _3857;
    bool _3861 = isnan(0.0);
    bool _3863 = _3859 || _3861;
    int _3865 = _3817 * _3841;
    bool _3867 = !_2979;
    int _3869 = _3867 ? _3533 : (-1);
    float _3871 = _3853 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _3873 = !_3013;
    int _3875 = _3873 ? _3759 : (-1);
    int _3877 = _3845 * _3851;
    float _3879 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3713);
    int _3881 = _3869 * _3801;
    int _3883 = _3881 + _3865;
    float _3885 = _2133 + _2103;
    int _3887 = _3875 * _3833;
    int _3889 = _3887 + _3877;
    float _3891 = _2103 * 0.5;
    bool _3893 = _1847 <= 0.0;
    bool _3895 = !_3863;
    bool _3897 = _3893 || _3895;
    float _3899 = _3885 * 0.5;
    float _3901 = float(_3883);
    float _3903 = fma(_2137, -0.5, _3891);
    float _3905 = float(_3889);
    float _3907 = _2180 * _3005;
    float _3909 = _3879 + _2103;
    float _3911 = -_2585;
    float _3913 = _3911 + 1.0;
    out.m_45.x = _3871;
    float _3915 = fma(_2186, _3907, _2174);
    float _3917 = fma(_2188, _3907, _2176);
    float _3919 = _3909 * 0.5;
    float _3921 = _2180 * _3913;
    out.gl_Position.x = _2133;
    out.gl_Position.y = _2137;
    out.gl_Position.z = _3879;
    out.gl_Position.w = _2103;
    float _3923 = fma(_2180, _3195, _2178);
    out.m_68.x = _3899;
    out.m_68.y = _3903;
    out.m_68.z = _3919;
    out.m_68.w = _2103;
    out.m_70.y = _3901;
    out.m_70.w = _3905;
    out.m_72.x = _3915;
    out.m_72.y = _3917;
    out.m_72.z = _3923;
    out.m_72.w = _3921;
    if (!_3897)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3925 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3925;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

