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
    float4 m_60 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_49 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _185 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_89)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1262 = as_type<float>(_99);
        out.gl_Position.z = _1262;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_85);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    float _131 = 0.0;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1330 = as_type<float>(_137);
        out.gl_Position.z = _1330;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_49.x;
    float _141 = in.m_49.y;
    float _143 = in.m_49.z;
    bool _145 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _147 = _141 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _149 = _141 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _151 = _141 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _153 = fma(_139, (*spvDescriptorSet0.vp_c10)._m0[4].x, _147);
    float _155 = fma(_139, (*spvDescriptorSet0.vp_c10)._m0[5].x, _149);
    float _157 = fma(_139, (*spvDescriptorSet0.vp_c10)._m0[6].x, _151);
    float _159 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].z, _153);
    float _161 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].z, _155);
    float _163 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].z, _157);
    bool _165 = !_145;
    float _183;
    if (!_165)
    {
        float _167 = in.m_51.x;
        float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _171 = _167 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _173 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _175 = _173 * _169;
        float _177 = floor(_175);
        float _179 = -_177;
        float _181 = _175 + _179;
        _183 = _181;
        _185 = true;
    }
    else
    {
        float _187 = float(_85);
        float _189 = 1.0 / _187;
        float _191 = _117 * _189;
        _183 = _191;
    }
    _185 = false;
    float _193 = _183;
    float _195 = _161 * _161;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _199 = _193 + _197;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = fma(_159, _159, _195);
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _193 + _211;
    bool _215 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _217 = isnan(_193);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = as_type<float>(int(gl_VertexIndex));
    float _229 = 1.0 / _203;
    float _231 = fma(_163, _163, _209);
    bool _233 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _235 = isnan(_193);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = -_225;
    float _247 = _245 + 1.0;
    bool _249 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_193);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = _243 * _247;
    float _263 = 1.0 / _207;
    float _265 = rsqrt(_231);
    float _267 = _213 * _229;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _279 = fma(_275, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _281 = _199 * _263;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _285 = _283 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _291 = as_type<int>(_227) & 1;
    bool _293 = _291 != 0;
    int _295 = as_type<int>(_227) & 2;
    bool _297 = _295 != 0;
    float _299 = fma(_285, _281, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _301 = fma(_289, _281, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _303 = -_243;
    float _305 = _303 + 1.0;
    float _307 = _163 * _265;
    float _309 = _159 * _265;
    float _311 = _161 * _265;
    float _313 = _259 * _305;
    float _315 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _317 = _307 * _315;
    float _319 = in.m_56.x;
    float _321 = in.m_56.y;
    float _323 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _325 = _311 * _323;
    float _327 = -_259;
    float _329 = _327 + 1.0;
    float _331 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _333 = -_317;
    float _335 = fma(_309, _331, _333);
    float _337 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _339 = _309 * _337;
    float _341 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _343 = -_325;
    float _345 = fma(_307, _341, _343);
    float _347 = _277 * _313;
    float _349 = _335 * _335;
    float _351 = _279 * _313;
    float _353 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _355 = -_339;
    float _357 = fma(_311, _353, _355);
    float _359 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].x, _347);
    float _361 = fma(_345, _345, _349);
    float _363 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].y, _351);
    float _365 = fma(_299, _261, _359);
    float _367 = fma(_357, _357, _361);
    float _369 = fma(_301, _261, _363);
    float _371 = in.m_42.x;
    float _373 = in.m_42.y;
    float _375 = in.m_42.z;
    float _377 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[145].x, _365);
    float _379 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[145].y, _369);
    float _381 = rsqrt(_367);
    bool _383 = !_297;
    float _385 = _383 ? (-0.5) : 0.5;
    float _387 = _379 * _321;
    bool _389 = !_293;
    float _391 = _389 ? (-0.5) : 0.5;
    float _393 = _377 * _319;
    float _395 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _385);
    float _397 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _399 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _391);
    float _401 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _403 = _397 * _395;
    float _405 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _407 = _401 * _399;
    float _409 = _403 * _307;
    float _411 = _335 * _381;
    float _413 = _345 * _381;
    float _415 = _357 * _381;
    float _417 = _309 * _411;
    float _419 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _421 = fma(_407, _415, _409);
    float _423 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _425 = -_417;
    float _427 = fma(_311, _413, _425);
    float _429 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].x, _419);
    float _431 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _433 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _423);
    float _435 = fma(_405, _427, _421);
    float _437 = _403 * _309;
    float _439 = _311 * _415;
    float _441 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].z, _429);
    float _443 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].z, _433);
    float _445 = fma(_407, _413, _437);
    float _447 = -_439;
    float _449 = fma(_307, _411, _447);
    float _451 = _441 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _453 = _443 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _455 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _431);
    float _457 = fma(_405, _449, _445);
    float _459 = _451 + _435;
    float _461 = _403 * _311;
    float _463 = _307 * _413;
    float _465 = _453 + _457;
    float _467 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _469 = _459 + _467;
    float _471 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].z, _455);
    float _473 = fma(_407, _411, _461);
    float _475 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _477 = _465 + _475;
    float _479 = _469 * _469;
    float _481 = -_463;
    float _483 = fma(_309, _415, _481);
    float _485 = _471 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _487 = fma(_477, _477, _479);
    float _489 = fma(_405, _483, _473);
    float _491 = sqrt(_487);
    float _493 = _485 + _489;
    bool _495 = _491 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _497 = _455;
    float _499 = _371;
    float _501 = _405;
    float _503 = _309;
    float _505 = _311;
    float _507 = _415;
    float _509 = _391;
    if (!_495)
    {
        _497 = _465;
    }
    float _511 = _497;
    float _513 = _511;
    if (!_495)
    {
        _499 = _459;
    }
    float _515 = _499;
    float _517 = _515;
    if (!_495)
    {
        _501 = _493;
    }
    float _519 = _501;
    bool _521 = !_495;
    float _523 = _519;
    if (!_521)
    {
        float _525 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _527 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _529 = _491 + _527;
        float _531 = _493 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _533 = rsqrt(_487);
        float _535 = _529 * _525;
        float _537 = _535 * 0.15915493667125701904296875;
        float _539 = _537 * 6.283185482025146484375;
        float _541 = cos(_539);
        float _543 = _537 * 6.283185482025146484375;
        float _545 = sin(_543);
        float _547 = _541 + (-1.0);
        float _549 = _547 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _551 = fma(_545, _531, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _553 = fma(_493, _541, _549);
        float _555 = _533 * _551;
        float _557 = fma(_477, _555, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _559 = fma(_469, _555, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _523 = _553;
        _513 = _557;
        _517 = _559;
    }
    float _561 = _523;
    float _563 = _513;
    float _565 = _517;
    float _567 = -_485;
    float _569 = _567 + _561;
    float _571 = -_453;
    float _573 = _571 + _563;
    float _575 = -_451;
    float _577 = _575 + _565;
    float _579 = _569 * _569;
    float _581 = fma(_573, _573, _579);
    float _583 = fma(_577, _577, _581);
    float _585 = sqrt(_583);
    bool _587 = _585 > 0.0;
    bool _589 = !_587;
    float _591 = _561;
    float _593 = _563;
    float _595 = _565;
    if (!_589)
    {
        float _597 = sqrt(_231);
        float _599 = rsqrt(_583);
        bool _601 = _597 > 0.0;
        float _603 = _573 * _599;
        float _605 = _569 * _599;
        float _607 = _577 * _599;
        bool _609 = !_601;
        if (!_609)
        {
            float _611 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _613 = _311 * _605;
            float _615 = fma(_309, _603, _613);
            float _617 = fma(_307, _607, _615);
            float _619 = _611 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _621 = _617 * _619;
            float _623 = fma(_159, _621, _563);
            float _625 = fma(_161, _621, _561);
            float _627 = fma(_163, _621, _565);
            _591 = _625;
            _593 = _623;
            _595 = _627;
            _503 = _621;
            _505 = _617;
        }
    }
    float _629 = _591;
    float _631 = _593;
    float _633 = _595;
    float _635 = _503;
    float _637 = _505;
    float _639 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _641 = _629 + _639;
    float _643 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _645 = _631 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _649 = _633 + _647;
    float _651 = _641 * _641;
    float _653 = fma(_645, _645, _651);
    float _655 = fma(_649, _649, _653);
    float _657 = rsqrt(_655);
    float _659 = _657 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _661 = _645 * _659;
    float _663 = _649 * _659;
    float _665 = _661 * _661;
    float _667 = _663 * _663;
    float _669 = _665 + _667;
    float _671 = sqrt(_669);
    bool _673 = _671 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _675 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _677 = _671 + _675;
    float _679 = _653;
    float _681 = _669;
    float _683 = _677;
    float _685 = _635;
    float _687 = _641;
    float _689 = _637;
    if (_673)
    {
        float _691 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _679 = _691;
    }
    float _693 = _679;
    if (_673)
    {
        float _695 = rsqrt(_669);
        _681 = _695;
    }
    float _697 = _681;
    float _699 = _697;
    if (_673)
    {
        float _701 = _677 * _693;
        _683 = _701;
    }
    float _703 = _683;
    if (_673)
    {
        float _705 = _703 * 0.15915493667125701904296875;
        _685 = _705;
    }
    float _707 = _685;
    float _709 = _649;
    if (_673)
    {
        float _711 = _707 * 6.283185482025146484375;
        float _713 = sin(_711);
        _709 = _713;
    }
    float _715 = _709;
    float _717 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _719 = precise::max(0.0, _717);
    float _721 = _693;
    float _723 = _719;
    if (_673)
    {
        float _725 = _707 * 6.283185482025146484375;
        float _727 = cos(_725);
        _721 = _727;
    }
    float _729 = _721;
    float _731 = -_659;
    float _733 = -_719;
    float _735 = fma(_641, _731, _733);
    if (_673)
    {
        float _737 = _735 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _687 = _737;
    }
    float _739 = _687;
    float _741 = sqrt(_655);
    float _743 = _739;
    float _745 = _715;
    if (_673)
    {
        float _747 = fma(_715, _739, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _743 = _747;
    }
    float _749 = _743;
    float _751 = _749;
    if (!_673)
    {
        _745 = _661;
    }
    float _753 = _745;
    float _755 = _753;
    float _757 = _729;
    if (_673)
    {
        float _759 = _729 + (-1.0);
        _723 = _759;
    }
    float _761 = _723;
    float _763 = _761;
    if (_673)
    {
        float _765 = _697 * _749;
        _507 = _765;
    }
    float _767 = _507;
    if (!_673)
    {
        _751 = _735;
    }
    float _769 = _751;
    float _771 = _769;
    if (_673)
    {
        float _773 = _761 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _689 = _773;
    }
    float _775 = _689;
    if (_673)
    {
        float _777 = _661 * _767;
        _755 = _777;
    }
    float _779 = _755;
    if (!_673)
    {
        _763 = _663;
    }
    float _781 = _763;
    float _783 = _781;
    if (_673)
    {
        float _785 = _663 * _767;
        _783 = _785;
    }
    float _787 = _783;
    if (!_673)
    {
        _699 = _665;
    }
    float _789 = _699;
    float _791 = _789;
    if (_673)
    {
        float _793 = fma(_735, _729, _775);
        _771 = _793;
    }
    float _795 = _771;
    if (_673)
    {
        float _797 = _779 * _779;
        _791 = _797;
    }
    float _799 = _791;
    if (!_673)
    {
        _757 = _667;
    }
    float _801 = _757;
    float _803 = _801;
    if (_673)
    {
        float _805 = _787 * _787;
        _803 = _805;
    }
    float _807 = _803;
    float _809 = fma(_795, _795, _799);
    float _811 = _809 + _807;
    float _813 = _629 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _815 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _817 = fma(_741, (*spvDescriptorSet0.vp_c15)._m0[23].w, _815);
    float _819 = precise::clamp(_817, 0.0, 1.0);
    float _821 = _629 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _823 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _825 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[2].x, _813);
    float _827 = rsqrt(_811);
    float _829 = -_819;
    float _831 = _829 + 1.0;
    float _833 = _629 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _835 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[2].z, _825);
    float _837 = _629 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _839 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[1].x, _821);
    float _841 = _835 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _843 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[0].x, _833);
    float _845 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[3].x, _837);
    float _847 = abs(_831);
    float _849 = log2(_847);
    float _851 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[1].z, _839);
    float _853 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[0].z, _843);
    float _855 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[3].z, _845);
    float _857 = _841 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _859 = _851 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _861 = _827 * _779;
    float _863 = _855 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _865 = _827 * _795;
    float _867 = _853 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _869 = _859 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _871 = _861 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _873 = _827 * _787;
    float _875 = -_857;
    float _877 = fma(_875, _823, 1.0);
    float _879 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[7].x, _869);
    float _881 = -_871;
    float _883 = fma(_865, (*spvDescriptorSet0.vp_c15)._m0[21].y, _881);
    float _885 = _849 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _887 = _859 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _889 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[7].z, _879);
    float _891 = -_873;
    float _893 = fma(_891, (*spvDescriptorSet0.vp_c15)._m0[21].z, _883);
    float _895 = exp2(_885);
    float _897 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[7].w, _889);
    float _899 = fma(_893, -0.5, 0.5);
    float _901 = _859 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _903 = fma(_893, 0.5, 0.5);
    float _905 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[5].x, _887);
    float _907 = _865 + 1.0;
    float _909 = log2(_877);
    float _911 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[4].x, _901);
    float _913 = fma(_903, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _915 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[5].z, _905);
    float _917 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[4].z, _911);
    float _919 = fma(_903, _913, -0.212114393711090087890625);
    float _921 = 1.0 / _897;
    float _923 = -_865;
    float _925 = fma(_895, _907, _923);
    float _927 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[4].w, _917);
    float _929 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[5].w, _915);
    float _931 = fma(_903, _919, 1.570728778839111328125);
    float _933 = sqrt(_899);
    float _935 = _909 * 0.693147182464599609375;
    float _937 = _935 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _939 = _927 * _921;
    float _941 = _929 * _921;
    float _943 = fma(_925, 0.5, 0.5);
    float _945 = fma(_939, 0.5, 0.5);
    float _947 = fma(_941, -0.5, 0.5);
    float _949 = _933 * 0.636619746685028076171875;
    float3 _2652 = float3(_945, _947, _937);
    float _951 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2652, float3(0.0), isnan(_2652)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2652, float3(0.0), isnan(_2652)), level(0.0)).x;
    float _953 = -_931;
    float _955 = fma(_949, _953, 1.0);
    float3 _2668 = float3(_945, _947, _937);
    float4 _958 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2668, float3(0.0), isnan(_2668)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2668, float3(0.0), isnan(_2668)), level(0.0)).xyzw;
    float _960 = _958.x;
    float _962 = _958.y;
    float _964 = _958.z;
    float _966 = _958.w;
    float2 _2685 = float2(_955, _943);
    float3 _970 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2685, float2(0.0), isnan(_2685)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2685, float2(0.0), isnan(_2685)), level(0.0)).xyz;
    float _972 = _970.x;
    float _974 = _970.y;
    float _976 = _970.z;
    float _978 = _485 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _980 = _485 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _982 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _984 = isnan(0.5);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _990 = _986 || _988;
    float _992 = in.m_51.x;
    float _994 = in.m_51.y;
    float _996 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[11].x, _978);
    float _998 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[10].x, _980);
    float _1000 = _849 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1002 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[11].z, _996);
    float _1004 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[10].z, _998);
    float _1006 = _859 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1008 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1010 = _1004 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1012 = exp2(_1000);
    float _1014 = _945;
    float _1016 = _947;
    if (!_990)
    {
        _1014 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1018 = _1014;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1022 = _1010 + _1008;
    float _1024 = 0.0;
    float _1026 = _1018;
    if (!_990)
    {
        _1024 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1028 = _1024;
    float _1030 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1006);
    float _1032 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1034 = 1.0 / _1008;
    float _1036 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1030);
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1040 = _992 > 0.5;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1044 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1050 = _1048 != 0;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1054 = _994 > 0.5;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1060 = _1058 != 0;
    float _1062 = _1022 * _1034;
    float _1064 = _1062 * 0.5;
    float _1066 = _1034;
    float _1068 = _1032;
    if (!_990)
    {
        float _1070 = -_1028;
        float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1066 = _1072;
    }
    float _1074 = _1066;
    float _1076 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1078 = -_385;
    int _1080 = _1054 ? as_type<int>(_1078) : as_type<int>(_385);
    if (!_990)
    {
        float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1084 = fma(_1064, _1018, _1082);
        _1026 = _1084;
    }
    float _1086 = _1026;
    if (!_990)
    {
        float _1088 = 1.0 / _1074;
        _1016 = _1088;
    }
    float _1090 = _1016;
    float _1092 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1094 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1096 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1100 = -_1012;
    float _1102 = _1100 + 1.0;
    bool _1104 = !_1060;
    float _1106 = _1104 ? _385 : as_type<float>(_1080);
    float _1108 = _1086;
    if (!_990)
    {
        float _1110 = 1.0 / _1086;
        _1108 = _1110;
    }
    float _1112 = _1108;
    float _1114 = -_391;
    int _1116 = _1040 ? as_type<int>(_1114) : as_type<int>(_391);
    float _1118 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1120 = _1102 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_58.x = _1092;
    out.m_58.y = _1094;
    out.m_58.z = _1096;
    bool _1122 = !_1050;
    float _1124 = _1122 ? _391 : as_type<float>(_1116);
    float _1126 = -_1106;
    float _1128 = _1126 + 0.5;
    if (_990)
    {
        _509 = 1.0;
    }
    float _1130 = _509;
    out.m_60.x = _1032;
    out.m_60.y = _1118;
    out.m_60.z = _1076;
    out.m_60.w = _1038;
    float _1132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1134 = _1124 + 0.5;
    float _1136 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1138 = _897 * 0.5;
    float _1140 = _1130;
    if (!_990)
    {
        float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1144 = -_1028;
        float _1146 = fma(_1112, _1142, _1144);
        _1068 = _1146;
    }
    float _1148 = _1068;
    float _1150 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1152 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1036);
    float _1154 = _1136 * _1132;
    if (!_990)
    {
        float _1156 = _1148 * _1090;
        float _1158 = precise::clamp(_1156, 0.0, 1.0);
        _1140 = _1158;
    }
    float _1160 = _1140;
    float _1162 = _1150 * _1044;
    float _1164 = fma(_929, -0.5, _1138);
    float _1166 = _1152 + _897;
    float _1168 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1170 = _1160 > 0.0;
    bool _1172 = isnan(_1160);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(0.0);
    bool _1178 = _1174 || _1176;
    float _1180 = _927 + _897;
    out.gl_Position.x = _927;
    out.gl_Position.y = _929;
    out.gl_Position.z = _1152;
    out.gl_Position.w = _897;
    float _1182 = _1168 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1184 = _1166 * 0.5;
    float _1186 = _1180 * 0.5;
    out.m_62.x = _1162;
    out.m_62.y = _1154;
    out.m_64.x = _1186;
    out.m_64.y = _1164;
    out.m_64.z = _1184;
    out.m_64.w = _897;
    out.m_45.x = _1182;
    float _1188 = _1120 * _951;
    float _1190 = -_1120;
    float _1192 = _1190 + 1.0;
    float _1194 = _966 * _1188;
    float _1196 = _966 * _1192;
    float _1198 = _976 * _1188;
    float _1200 = fma(_972, _1194, _960);
    float _1202 = fma(_974, _1194, _962);
    float _1204 = fma(_966, _1198, _964);
    out.m_66.x = _1200;
    out.m_66.y = _1202;
    out.m_66.z = _1204;
    out.m_66.w = _1196;
    if (_1178)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1206 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1206;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _185 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_89)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1262 = as_type<float>(_99);
        out.gl_Position.z = _1262;
    }
    if (!_89)
    {
        return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_85);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    float _131 = 0.0;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1330 = as_type<float>(_137);
        out.gl_Position.z = _1330;
    }
    if (_129)
    {
        return out;
    }
    float _139 = in.m_49.x;
    float _141 = in.m_49.y;
    float _143 = in.m_49.z;
    bool _145 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _147 = _141 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _149 = _141 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _151 = _141 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _153 = fma(_139, (*spvDescriptorSet0.vp_c10)._m0[4].x, _147);
    float _155 = fma(_139, (*spvDescriptorSet0.vp_c10)._m0[5].x, _149);
    float _157 = fma(_139, (*spvDescriptorSet0.vp_c10)._m0[6].x, _151);
    float _159 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].z, _153);
    float _161 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].z, _155);
    float _163 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].z, _157);
    bool _165 = !_145;
    float _183;
    if (!_165)
    {
        float _167 = in.m_51.x;
        float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _171 = _167 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _173 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _175 = _173 * _169;
        float _177 = floor(_175);
        float _179 = -_177;
        float _181 = _175 + _179;
        _183 = _181;
        _185 = true;
    }
    else
    {
        float _187 = float(_85);
        float _189 = 1.0 / _187;
        float _191 = _117 * _189;
        _183 = _191;
    }
    _185 = false;
    float _193 = _183;
    float _195 = _161 * _161;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _199 = _193 + _197;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = fma(_159, _159, _195);
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _193 + _211;
    bool _215 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _217 = isnan(_193);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = as_type<float>(int(gl_VertexIndex));
    float _229 = 1.0 / _203;
    float _231 = fma(_163, _163, _209);
    bool _233 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _235 = isnan(_193);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = -_225;
    float _247 = _245 + 1.0;
    bool _249 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_193);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = _243 * _247;
    float _263 = 1.0 / _207;
    float _265 = rsqrt(_231);
    float _267 = _213 * _229;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _279 = fma(_275, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _281 = _199 * _263;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _285 = _283 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _291 = as_type<int>(_227) & 1;
    bool _293 = _291 != 0;
    int _295 = as_type<int>(_227) & 2;
    bool _297 = _295 != 0;
    float _299 = fma(_285, _281, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _301 = fma(_289, _281, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _303 = -_243;
    float _305 = _303 + 1.0;
    float _307 = _163 * _265;
    float _309 = _159 * _265;
    float _311 = _161 * _265;
    float _313 = _259 * _305;
    float _315 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _317 = _307 * _315;
    float _319 = in.m_56.x;
    float _321 = in.m_56.y;
    float _323 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _325 = _311 * _323;
    float _327 = -_259;
    float _329 = _327 + 1.0;
    float _331 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _333 = -_317;
    float _335 = fma(_309, _331, _333);
    float _337 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _339 = _309 * _337;
    float _341 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _343 = -_325;
    float _345 = fma(_307, _341, _343);
    float _347 = _277 * _313;
    float _349 = _335 * _335;
    float _351 = _279 * _313;
    float _353 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _355 = -_339;
    float _357 = fma(_311, _353, _355);
    float _359 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].x, _347);
    float _361 = fma(_345, _345, _349);
    float _363 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].y, _351);
    float _365 = fma(_299, _261, _359);
    float _367 = fma(_357, _357, _361);
    float _369 = fma(_301, _261, _363);
    float _371 = in.m_42.x;
    float _373 = in.m_42.y;
    float _375 = in.m_42.z;
    float _377 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[145].x, _365);
    float _379 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[145].y, _369);
    float _381 = rsqrt(_367);
    bool _383 = !_297;
    float _385 = _383 ? (-0.5) : 0.5;
    float _387 = _379 * _321;
    bool _389 = !_293;
    float _391 = _389 ? (-0.5) : 0.5;
    float _393 = _377 * _319;
    float _395 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _385);
    float _397 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _399 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _391);
    float _401 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _403 = _397 * _395;
    float _405 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _407 = _401 * _399;
    float _409 = _403 * _307;
    float _411 = _335 * _381;
    float _413 = _345 * _381;
    float _415 = _357 * _381;
    float _417 = _309 * _411;
    float _419 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _421 = fma(_407, _415, _409);
    float _423 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _425 = -_417;
    float _427 = fma(_311, _413, _425);
    float _429 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].x, _419);
    float _431 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _433 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _423);
    float _435 = fma(_405, _427, _421);
    float _437 = _403 * _309;
    float _439 = _311 * _415;
    float _441 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].z, _429);
    float _443 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].z, _433);
    float _445 = fma(_407, _413, _437);
    float _447 = -_439;
    float _449 = fma(_307, _411, _447);
    float _451 = _441 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _453 = _443 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _455 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _431);
    float _457 = fma(_405, _449, _445);
    float _459 = _451 + _435;
    float _461 = _403 * _311;
    float _463 = _307 * _413;
    float _465 = _453 + _457;
    float _467 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _469 = _459 + _467;
    float _471 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].z, _455);
    float _473 = fma(_407, _411, _461);
    float _475 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _477 = _465 + _475;
    float _479 = _469 * _469;
    float _481 = -_463;
    float _483 = fma(_309, _415, _481);
    float _485 = _471 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _487 = fma(_477, _477, _479);
    float _489 = fma(_405, _483, _473);
    float _491 = sqrt(_487);
    float _493 = _485 + _489;
    bool _495 = _491 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _497 = _455;
    float _499 = _371;
    float _501 = _405;
    float _503 = _309;
    float _505 = _311;
    float _507 = _415;
    float _509 = _391;
    if (!_495)
    {
        _497 = _465;
    }
    float _511 = _497;
    float _513 = _511;
    if (!_495)
    {
        _499 = _459;
    }
    float _515 = _499;
    float _517 = _515;
    if (!_495)
    {
        _501 = _493;
    }
    float _519 = _501;
    bool _521 = !_495;
    float _523 = _519;
    if (!_521)
    {
        float _525 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _527 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _529 = _491 + _527;
        float _531 = _493 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _533 = rsqrt(_487);
        float _535 = _529 * _525;
        float _537 = _535 * 0.15915493667125701904296875;
        float _539 = _537 * 6.283185482025146484375;
        float _541 = cos(_539);
        float _543 = _537 * 6.283185482025146484375;
        float _545 = sin(_543);
        float _547 = _541 + (-1.0);
        float _549 = _547 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _551 = fma(_545, _531, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _553 = fma(_493, _541, _549);
        float _555 = _533 * _551;
        float _557 = fma(_477, _555, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _559 = fma(_469, _555, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _523 = _553;
        _513 = _557;
        _517 = _559;
    }
    float _561 = _523;
    float _563 = _513;
    float _565 = _517;
    float _567 = -_485;
    float _569 = _567 + _561;
    float _571 = -_453;
    float _573 = _571 + _563;
    float _575 = -_451;
    float _577 = _575 + _565;
    float _579 = _569 * _569;
    float _581 = fma(_573, _573, _579);
    float _583 = fma(_577, _577, _581);
    float _585 = sqrt(_583);
    bool _587 = _585 > 0.0;
    bool _589 = !_587;
    float _591 = _561;
    float _593 = _563;
    float _595 = _565;
    if (!_589)
    {
        float _597 = sqrt(_231);
        float _599 = rsqrt(_583);
        bool _601 = _597 > 0.0;
        float _603 = _573 * _599;
        float _605 = _569 * _599;
        float _607 = _577 * _599;
        bool _609 = !_601;
        if (!_609)
        {
            float _611 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _613 = _311 * _605;
            float _615 = fma(_309, _603, _613);
            float _617 = fma(_307, _607, _615);
            float _619 = _611 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _621 = _617 * _619;
            float _623 = fma(_159, _621, _563);
            float _625 = fma(_161, _621, _561);
            float _627 = fma(_163, _621, _565);
            _591 = _625;
            _593 = _623;
            _595 = _627;
            _503 = _621;
            _505 = _617;
        }
    }
    float _629 = _591;
    float _631 = _593;
    float _633 = _595;
    float _635 = _503;
    float _637 = _505;
    float _639 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _641 = _629 + _639;
    float _643 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _645 = _631 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _649 = _633 + _647;
    float _651 = _641 * _641;
    float _653 = fma(_645, _645, _651);
    float _655 = fma(_649, _649, _653);
    float _657 = rsqrt(_655);
    float _659 = _657 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _661 = _645 * _659;
    float _663 = _649 * _659;
    float _665 = _661 * _661;
    float _667 = _663 * _663;
    float _669 = _665 + _667;
    float _671 = sqrt(_669);
    bool _673 = _671 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _675 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _677 = _671 + _675;
    float _679 = _653;
    float _681 = _669;
    float _683 = _677;
    float _685 = _635;
    float _687 = _641;
    float _689 = _637;
    if (_673)
    {
        float _691 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _679 = _691;
    }
    float _693 = _679;
    if (_673)
    {
        float _695 = rsqrt(_669);
        _681 = _695;
    }
    float _697 = _681;
    float _699 = _697;
    if (_673)
    {
        float _701 = _677 * _693;
        _683 = _701;
    }
    float _703 = _683;
    if (_673)
    {
        float _705 = _703 * 0.15915493667125701904296875;
        _685 = _705;
    }
    float _707 = _685;
    float _709 = _649;
    if (_673)
    {
        float _711 = _707 * 6.283185482025146484375;
        float _713 = sin(_711);
        _709 = _713;
    }
    float _715 = _709;
    float _717 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _719 = precise::max(0.0, _717);
    float _721 = _693;
    float _723 = _719;
    if (_673)
    {
        float _725 = _707 * 6.283185482025146484375;
        float _727 = cos(_725);
        _721 = _727;
    }
    float _729 = _721;
    float _731 = -_659;
    float _733 = -_719;
    float _735 = fma(_641, _731, _733);
    if (_673)
    {
        float _737 = _735 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _687 = _737;
    }
    float _739 = _687;
    float _741 = sqrt(_655);
    float _743 = _739;
    float _745 = _715;
    if (_673)
    {
        float _747 = fma(_715, _739, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _743 = _747;
    }
    float _749 = _743;
    float _751 = _749;
    if (!_673)
    {
        _745 = _661;
    }
    float _753 = _745;
    float _755 = _753;
    float _757 = _729;
    if (_673)
    {
        float _759 = _729 + (-1.0);
        _723 = _759;
    }
    float _761 = _723;
    float _763 = _761;
    if (_673)
    {
        float _765 = _697 * _749;
        _507 = _765;
    }
    float _767 = _507;
    if (!_673)
    {
        _751 = _735;
    }
    float _769 = _751;
    float _771 = _769;
    if (_673)
    {
        float _773 = _761 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _689 = _773;
    }
    float _775 = _689;
    if (_673)
    {
        float _777 = _661 * _767;
        _755 = _777;
    }
    float _779 = _755;
    if (!_673)
    {
        _763 = _663;
    }
    float _781 = _763;
    float _783 = _781;
    if (_673)
    {
        float _785 = _663 * _767;
        _783 = _785;
    }
    float _787 = _783;
    if (!_673)
    {
        _699 = _665;
    }
    float _789 = _699;
    float _791 = _789;
    if (_673)
    {
        float _793 = fma(_735, _729, _775);
        _771 = _793;
    }
    float _795 = _771;
    if (_673)
    {
        float _797 = _779 * _779;
        _791 = _797;
    }
    float _799 = _791;
    if (!_673)
    {
        _757 = _667;
    }
    float _801 = _757;
    float _803 = _801;
    if (_673)
    {
        float _805 = _787 * _787;
        _803 = _805;
    }
    float _807 = _803;
    float _809 = fma(_795, _795, _799);
    float _811 = _809 + _807;
    float _813 = _629 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _815 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _817 = fma(_741, (*spvDescriptorSet0.vp_c15)._m0[23].w, _815);
    float _819 = precise::clamp(_817, 0.0, 1.0);
    float _821 = _629 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _823 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _825 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[2].x, _813);
    float _827 = rsqrt(_811);
    float _829 = -_819;
    float _831 = _829 + 1.0;
    float _833 = _629 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _835 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[2].z, _825);
    float _837 = _629 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _839 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[1].x, _821);
    float _841 = _835 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _843 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[0].x, _833);
    float _845 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[3].x, _837);
    float _847 = abs(_831);
    float _849 = log2(_847);
    float _851 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[1].z, _839);
    float _853 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[0].z, _843);
    float _855 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[3].z, _845);
    float _857 = _841 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _859 = _851 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _861 = _827 * _779;
    float _863 = _855 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _865 = _827 * _795;
    float _867 = _853 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _869 = _859 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _871 = _861 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _873 = _827 * _787;
    float _875 = -_857;
    float _877 = fma(_875, _823, 1.0);
    float _879 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[7].x, _869);
    float _881 = -_871;
    float _883 = fma(_865, (*spvDescriptorSet0.vp_c15)._m0[21].y, _881);
    float _885 = _849 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _887 = _859 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _889 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[7].z, _879);
    float _891 = -_873;
    float _893 = fma(_891, (*spvDescriptorSet0.vp_c15)._m0[21].z, _883);
    float _895 = exp2(_885);
    float _897 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[7].w, _889);
    float _899 = fma(_893, -0.5, 0.5);
    float _901 = _859 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _903 = fma(_893, 0.5, 0.5);
    float _905 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[5].x, _887);
    float _907 = _865 + 1.0;
    float _909 = log2(_877);
    float _911 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[4].x, _901);
    float _913 = fma(_903, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _915 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[5].z, _905);
    float _917 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[4].z, _911);
    float _919 = fma(_903, _913, -0.212114393711090087890625);
    float _921 = 1.0 / _897;
    float _923 = -_865;
    float _925 = fma(_895, _907, _923);
    float _927 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[4].w, _917);
    float _929 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[5].w, _915);
    float _931 = fma(_903, _919, 1.570728778839111328125);
    float _933 = sqrt(_899);
    float _935 = _909 * 0.693147182464599609375;
    float _937 = _935 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _939 = _927 * _921;
    float _941 = _929 * _921;
    float _943 = fma(_925, 0.5, 0.5);
    float _945 = fma(_939, 0.5, 0.5);
    float _947 = fma(_941, -0.5, 0.5);
    float _949 = _933 * 0.636619746685028076171875;
    float3 _2652 = float3(_945, _947, _937);
    float _951 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2652, float3(0.0), isnan(_2652)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2652, float3(0.0), isnan(_2652)), level(0.0)).x;
    float _953 = -_931;
    float _955 = fma(_949, _953, 1.0);
    float3 _2668 = float3(_945, _947, _937);
    float4 _958 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2668, float3(0.0), isnan(_2668)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2668, float3(0.0), isnan(_2668)), level(0.0)).xyzw;
    float _960 = _958.x;
    float _962 = _958.y;
    float _964 = _958.z;
    float _966 = _958.w;
    float2 _2685 = float2(_955, _943);
    float3 _970 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2685, float2(0.0), isnan(_2685)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2685, float2(0.0), isnan(_2685)), level(0.0)).xyz;
    float _972 = _970.x;
    float _974 = _970.y;
    float _976 = _970.z;
    float _978 = _485 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _980 = _485 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _982 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _984 = isnan(0.5);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _990 = _986 || _988;
    float _992 = in.m_51.x;
    float _994 = in.m_51.y;
    float _996 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[11].x, _978);
    float _998 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[10].x, _980);
    float _1000 = _849 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1002 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[11].z, _996);
    float _1004 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[10].z, _998);
    float _1006 = _859 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1008 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1010 = _1004 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1012 = exp2(_1000);
    float _1014 = _945;
    float _1016 = _947;
    if (!_990)
    {
        _1014 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1018 = _1014;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1022 = _1010 + _1008;
    float _1024 = 0.0;
    float _1026 = _1018;
    if (!_990)
    {
        _1024 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1028 = _1024;
    float _1030 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1006);
    float _1032 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1034 = 1.0 / _1008;
    float _1036 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1030);
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1040 = _992 > 0.5;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1044 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1050 = _1048 != 0;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1054 = _994 > 0.5;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1060 = _1058 != 0;
    float _1062 = _1022 * _1034;
    float _1064 = _1062 * 0.5;
    float _1066 = _1034;
    float _1068 = _1032;
    if (!_990)
    {
        float _1070 = -_1028;
        float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1066 = _1072;
    }
    float _1074 = _1066;
    float _1076 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1078 = -_385;
    int _1080 = _1054 ? as_type<int>(_1078) : as_type<int>(_385);
    if (!_990)
    {
        float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1084 = fma(_1064, _1018, _1082);
        _1026 = _1084;
    }
    float _1086 = _1026;
    if (!_990)
    {
        float _1088 = 1.0 / _1074;
        _1016 = _1088;
    }
    float _1090 = _1016;
    float _1092 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1094 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1096 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1100 = -_1012;
    float _1102 = _1100 + 1.0;
    bool _1104 = !_1060;
    float _1106 = _1104 ? _385 : as_type<float>(_1080);
    float _1108 = _1086;
    if (!_990)
    {
        float _1110 = 1.0 / _1086;
        _1108 = _1110;
    }
    float _1112 = _1108;
    float _1114 = -_391;
    int _1116 = _1040 ? as_type<int>(_1114) : as_type<int>(_391);
    float _1118 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1120 = _1102 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_58.x = _1092;
    out.m_58.y = _1094;
    out.m_58.z = _1096;
    bool _1122 = !_1050;
    float _1124 = _1122 ? _391 : as_type<float>(_1116);
    float _1126 = -_1106;
    float _1128 = _1126 + 0.5;
    if (_990)
    {
        _509 = 1.0;
    }
    float _1130 = _509;
    out.m_60.x = _1032;
    out.m_60.y = _1118;
    out.m_60.z = _1076;
    out.m_60.w = _1038;
    float _1132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1134 = _1124 + 0.5;
    float _1136 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1138 = _897 * 0.5;
    float _1140 = _1130;
    if (!_990)
    {
        float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1144 = -_1028;
        float _1146 = fma(_1112, _1142, _1144);
        _1068 = _1146;
    }
    float _1148 = _1068;
    float _1150 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1152 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1036);
    float _1154 = _1136 * _1132;
    if (!_990)
    {
        float _1156 = _1148 * _1090;
        float _1158 = precise::clamp(_1156, 0.0, 1.0);
        _1140 = _1158;
    }
    float _1160 = _1140;
    float _1162 = _1150 * _1044;
    float _1164 = fma(_929, -0.5, _1138);
    float _1166 = _1152 + _897;
    float _1168 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1170 = _1160 > 0.0;
    bool _1172 = isnan(_1160);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(0.0);
    bool _1178 = _1174 || _1176;
    float _1180 = _927 + _897;
    out.gl_Position.x = _927;
    out.gl_Position.y = _929;
    out.gl_Position.z = _1152;
    out.gl_Position.w = _897;
    float _1182 = _1168 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1184 = _1166 * 0.5;
    float _1186 = _1180 * 0.5;
    out.m_62.x = _1162;
    out.m_62.y = _1154;
    out.m_64.x = _1186;
    out.m_64.y = _1164;
    out.m_64.z = _1184;
    out.m_64.w = _897;
    out.m_45.x = _1182;
    float _1188 = _1120 * _951;
    float _1190 = -_1120;
    float _1192 = _1190 + 1.0;
    float _1194 = _966 * _1188;
    float _1196 = _966 * _1192;
    float _1198 = _976 * _1188;
    float _1200 = fma(_972, _1194, _960);
    float _1202 = fma(_974, _1194, _962);
    float _1204 = fma(_966, _1198, _964);
    out.m_66.x = _1200;
    out.m_66.y = _1202;
    out.m_66.z = _1204;
    out.m_66.w = _1196;
    if (_1178)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1206 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1206;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _185 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_89)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1262 = as_type<float>(_99);
        out.gl_Position.z = _1262;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_85);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    float _131 = 0.0;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1330 = as_type<float>(_137);
        out.gl_Position.z = _1330;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_49.x;
    float _141 = in.m_49.y;
    float _143 = in.m_49.z;
    bool _145 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _147 = _141 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _149 = _141 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _151 = _141 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _153 = fma(_139, (*spvDescriptorSet0.vp_c10)._m0[4].x, _147);
    float _155 = fma(_139, (*spvDescriptorSet0.vp_c10)._m0[5].x, _149);
    float _157 = fma(_139, (*spvDescriptorSet0.vp_c10)._m0[6].x, _151);
    float _159 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].z, _153);
    float _161 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].z, _155);
    float _163 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].z, _157);
    bool _165 = !_145;
    float _183;
    if (!_165)
    {
        float _167 = in.m_51.x;
        float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _171 = _167 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _173 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _175 = _173 * _169;
        float _177 = floor(_175);
        float _179 = -_177;
        float _181 = _175 + _179;
        _183 = _181;
        _185 = true;
    }
    else
    {
        float _187 = float(_85);
        float _189 = 1.0 / _187;
        float _191 = _117 * _189;
        _183 = _191;
    }
    _185 = false;
    float _193 = _183;
    float _195 = _161 * _161;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _199 = _193 + _197;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = fma(_159, _159, _195);
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _193 + _211;
    bool _215 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _217 = isnan(_193);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = as_type<float>(int(gl_VertexIndex));
    float _229 = 1.0 / _203;
    float _231 = fma(_163, _163, _209);
    bool _233 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _235 = isnan(_193);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = -_225;
    float _247 = _245 + 1.0;
    bool _249 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_193);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = _243 * _247;
    float _263 = 1.0 / _207;
    float _265 = rsqrt(_231);
    float _267 = _213 * _229;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _279 = fma(_275, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _281 = _199 * _263;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _285 = _283 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _291 = as_type<int>(_227) & 1;
    bool _293 = _291 != 0;
    int _295 = as_type<int>(_227) & 2;
    bool _297 = _295 != 0;
    float _299 = fma(_285, _281, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _301 = fma(_289, _281, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _303 = -_243;
    float _305 = _303 + 1.0;
    float _307 = _163 * _265;
    float _309 = _159 * _265;
    float _311 = _161 * _265;
    float _313 = _259 * _305;
    float _315 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _317 = _307 * _315;
    float _319 = in.m_56.x;
    float _321 = in.m_56.y;
    float _323 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _325 = _311 * _323;
    float _327 = -_259;
    float _329 = _327 + 1.0;
    float _331 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _333 = -_317;
    float _335 = fma(_309, _331, _333);
    float _337 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _339 = _309 * _337;
    float _341 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _343 = -_325;
    float _345 = fma(_307, _341, _343);
    float _347 = _277 * _313;
    float _349 = _335 * _335;
    float _351 = _279 * _313;
    float _353 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _355 = -_339;
    float _357 = fma(_311, _353, _355);
    float _359 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].x, _347);
    float _361 = fma(_345, _345, _349);
    float _363 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].y, _351);
    float _365 = fma(_299, _261, _359);
    float _367 = fma(_357, _357, _361);
    float _369 = fma(_301, _261, _363);
    float _371 = in.m_42.x;
    float _373 = in.m_42.y;
    float _375 = in.m_42.z;
    float _377 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[145].x, _365);
    float _379 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[145].y, _369);
    float _381 = rsqrt(_367);
    bool _383 = !_297;
    float _385 = _383 ? (-0.5) : 0.5;
    float _387 = _379 * _321;
    bool _389 = !_293;
    float _391 = _389 ? (-0.5) : 0.5;
    float _393 = _377 * _319;
    float _395 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _385);
    float _397 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _399 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _391);
    float _401 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _403 = _397 * _395;
    float _405 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _407 = _401 * _399;
    float _409 = _403 * _307;
    float _411 = _335 * _381;
    float _413 = _345 * _381;
    float _415 = _357 * _381;
    float _417 = _309 * _411;
    float _419 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _421 = fma(_407, _415, _409);
    float _423 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _425 = -_417;
    float _427 = fma(_311, _413, _425);
    float _429 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].x, _419);
    float _431 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _433 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _423);
    float _435 = fma(_405, _427, _421);
    float _437 = _403 * _309;
    float _439 = _311 * _415;
    float _441 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].z, _429);
    float _443 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].z, _433);
    float _445 = fma(_407, _413, _437);
    float _447 = -_439;
    float _449 = fma(_307, _411, _447);
    float _451 = _441 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _453 = _443 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _455 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _431);
    float _457 = fma(_405, _449, _445);
    float _459 = _451 + _435;
    float _461 = _403 * _311;
    float _463 = _307 * _413;
    float _465 = _453 + _457;
    float _467 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _469 = _459 + _467;
    float _471 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].z, _455);
    float _473 = fma(_407, _411, _461);
    float _475 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _477 = _465 + _475;
    float _479 = _469 * _469;
    float _481 = -_463;
    float _483 = fma(_309, _415, _481);
    float _485 = _471 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _487 = fma(_477, _477, _479);
    float _489 = fma(_405, _483, _473);
    float _491 = sqrt(_487);
    float _493 = _485 + _489;
    bool _495 = _491 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _497 = _455;
    float _499 = _371;
    float _501 = _405;
    float _503 = _309;
    float _505 = _311;
    float _507 = _415;
    float _509 = _391;
    if (!_495)
    {
        _497 = _465;
    }
    float _511 = _497;
    float _513 = _511;
    if (!_495)
    {
        _499 = _459;
    }
    float _515 = _499;
    float _517 = _515;
    if (!_495)
    {
        _501 = _493;
    }
    float _519 = _501;
    bool _521 = !_495;
    float _523 = _519;
    if (!_521)
    {
        float _525 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _527 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _529 = _491 + _527;
        float _531 = _493 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _533 = rsqrt(_487);
        float _535 = _529 * _525;
        float _537 = _535 * 0.15915493667125701904296875;
        float _539 = _537 * 6.283185482025146484375;
        float _541 = cos(_539);
        float _543 = _537 * 6.283185482025146484375;
        float _545 = sin(_543);
        float _547 = _541 + (-1.0);
        float _549 = _547 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _551 = fma(_545, _531, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _553 = fma(_493, _541, _549);
        float _555 = _533 * _551;
        float _557 = fma(_477, _555, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _559 = fma(_469, _555, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _523 = _553;
        _513 = _557;
        _517 = _559;
    }
    float _561 = _523;
    float _563 = _513;
    float _565 = _517;
    float _567 = -_485;
    float _569 = _567 + _561;
    float _571 = -_453;
    float _573 = _571 + _563;
    float _575 = -_451;
    float _577 = _575 + _565;
    float _579 = _569 * _569;
    float _581 = fma(_573, _573, _579);
    float _583 = fma(_577, _577, _581);
    float _585 = sqrt(_583);
    bool _587 = _585 > 0.0;
    bool _589 = !_587;
    float _591 = _561;
    float _593 = _563;
    float _595 = _565;
    if (!_589)
    {
        float _597 = sqrt(_231);
        float _599 = rsqrt(_583);
        bool _601 = _597 > 0.0;
        float _603 = _573 * _599;
        float _605 = _569 * _599;
        float _607 = _577 * _599;
        bool _609 = !_601;
        if (!_609)
        {
            float _611 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _613 = _311 * _605;
            float _615 = fma(_309, _603, _613);
            float _617 = fma(_307, _607, _615);
            float _619 = _611 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _621 = _617 * _619;
            float _623 = fma(_159, _621, _563);
            float _625 = fma(_161, _621, _561);
            float _627 = fma(_163, _621, _565);
            _591 = _625;
            _593 = _623;
            _595 = _627;
            _503 = _621;
            _505 = _617;
        }
    }
    float _629 = _591;
    float _631 = _593;
    float _633 = _595;
    float _635 = _503;
    float _637 = _505;
    float _639 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _641 = _629 + _639;
    float _643 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _645 = _631 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _649 = _633 + _647;
    float _651 = _641 * _641;
    float _653 = fma(_645, _645, _651);
    float _655 = fma(_649, _649, _653);
    float _657 = rsqrt(_655);
    float _659 = _657 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _661 = _645 * _659;
    float _663 = _649 * _659;
    float _665 = _661 * _661;
    float _667 = _663 * _663;
    float _669 = _665 + _667;
    float _671 = sqrt(_669);
    bool _673 = _671 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _675 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _677 = _671 + _675;
    float _679 = _653;
    float _681 = _669;
    float _683 = _677;
    float _685 = _635;
    float _687 = _641;
    float _689 = _637;
    if (_673)
    {
        float _691 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _679 = _691;
    }
    float _693 = _679;
    if (_673)
    {
        float _695 = rsqrt(_669);
        _681 = _695;
    }
    float _697 = _681;
    float _699 = _697;
    if (_673)
    {
        float _701 = _677 * _693;
        _683 = _701;
    }
    float _703 = _683;
    if (_673)
    {
        float _705 = _703 * 0.15915493667125701904296875;
        _685 = _705;
    }
    float _707 = _685;
    float _709 = _649;
    if (_673)
    {
        float _711 = _707 * 6.283185482025146484375;
        float _713 = sin(_711);
        _709 = _713;
    }
    float _715 = _709;
    float _717 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _719 = precise::max(0.0, _717);
    float _721 = _693;
    float _723 = _719;
    if (_673)
    {
        float _725 = _707 * 6.283185482025146484375;
        float _727 = cos(_725);
        _721 = _727;
    }
    float _729 = _721;
    float _731 = -_659;
    float _733 = -_719;
    float _735 = fma(_641, _731, _733);
    if (_673)
    {
        float _737 = _735 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _687 = _737;
    }
    float _739 = _687;
    float _741 = sqrt(_655);
    float _743 = _739;
    float _745 = _715;
    if (_673)
    {
        float _747 = fma(_715, _739, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _743 = _747;
    }
    float _749 = _743;
    float _751 = _749;
    if (!_673)
    {
        _745 = _661;
    }
    float _753 = _745;
    float _755 = _753;
    float _757 = _729;
    if (_673)
    {
        float _759 = _729 + (-1.0);
        _723 = _759;
    }
    float _761 = _723;
    float _763 = _761;
    if (_673)
    {
        float _765 = _697 * _749;
        _507 = _765;
    }
    float _767 = _507;
    if (!_673)
    {
        _751 = _735;
    }
    float _769 = _751;
    float _771 = _769;
    if (_673)
    {
        float _773 = _761 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _689 = _773;
    }
    float _775 = _689;
    if (_673)
    {
        float _777 = _661 * _767;
        _755 = _777;
    }
    float _779 = _755;
    if (!_673)
    {
        _763 = _663;
    }
    float _781 = _763;
    float _783 = _781;
    if (_673)
    {
        float _785 = _663 * _767;
        _783 = _785;
    }
    float _787 = _783;
    if (!_673)
    {
        _699 = _665;
    }
    float _789 = _699;
    float _791 = _789;
    if (_673)
    {
        float _793 = fma(_735, _729, _775);
        _771 = _793;
    }
    float _795 = _771;
    if (_673)
    {
        float _797 = _779 * _779;
        _791 = _797;
    }
    float _799 = _791;
    if (!_673)
    {
        _757 = _667;
    }
    float _801 = _757;
    float _803 = _801;
    if (_673)
    {
        float _805 = _787 * _787;
        _803 = _805;
    }
    float _807 = _803;
    float _809 = fma(_795, _795, _799);
    float _811 = _809 + _807;
    float _813 = _629 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _815 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _817 = fma(_741, (*spvDescriptorSet0.vp_c15)._m0[23].w, _815);
    float _819 = precise::clamp(_817, 0.0, 1.0);
    float _821 = _629 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _823 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _825 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[2].x, _813);
    float _827 = rsqrt(_811);
    float _829 = -_819;
    float _831 = _829 + 1.0;
    float _833 = _629 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _835 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[2].z, _825);
    float _837 = _629 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _839 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[1].x, _821);
    float _841 = _835 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _843 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[0].x, _833);
    float _845 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[3].x, _837);
    float _847 = abs(_831);
    float _849 = log2(_847);
    float _851 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[1].z, _839);
    float _853 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[0].z, _843);
    float _855 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[3].z, _845);
    float _857 = _841 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _859 = _851 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _861 = _827 * _779;
    float _863 = _855 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _865 = _827 * _795;
    float _867 = _853 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _869 = _859 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _871 = _861 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _873 = _827 * _787;
    float _875 = -_857;
    float _877 = fma(_875, _823, 1.0);
    float _879 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[7].x, _869);
    float _881 = -_871;
    float _883 = fma(_865, (*spvDescriptorSet0.vp_c15)._m0[21].y, _881);
    float _885 = _849 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _887 = _859 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _889 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[7].z, _879);
    float _891 = -_873;
    float _893 = fma(_891, (*spvDescriptorSet0.vp_c15)._m0[21].z, _883);
    float _895 = exp2(_885);
    float _897 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[7].w, _889);
    float _899 = fma(_893, -0.5, 0.5);
    float _901 = _859 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _903 = fma(_893, 0.5, 0.5);
    float _905 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[5].x, _887);
    float _907 = _865 + 1.0;
    float _909 = log2(_877);
    float _911 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[4].x, _901);
    float _913 = fma(_903, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _915 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[5].z, _905);
    float _917 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[4].z, _911);
    float _919 = fma(_903, _913, -0.212114393711090087890625);
    float _921 = 1.0 / _897;
    float _923 = -_865;
    float _925 = fma(_895, _907, _923);
    float _927 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[4].w, _917);
    float _929 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[5].w, _915);
    float _931 = fma(_903, _919, 1.570728778839111328125);
    float _933 = sqrt(_899);
    float _935 = _909 * 0.693147182464599609375;
    float _937 = _935 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _939 = _927 * _921;
    float _941 = _929 * _921;
    float _943 = fma(_925, 0.5, 0.5);
    float _945 = fma(_939, 0.5, 0.5);
    float _947 = fma(_941, -0.5, 0.5);
    float _949 = _933 * 0.636619746685028076171875;
    float3 _2652 = float3(_945, _947, _937);
    float _951 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2652, float3(0.0), isnan(_2652)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2652, float3(0.0), isnan(_2652)), level(0.0)).x;
    float _953 = -_931;
    float _955 = fma(_949, _953, 1.0);
    float3 _2668 = float3(_945, _947, _937);
    float4 _958 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2668, float3(0.0), isnan(_2668)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2668, float3(0.0), isnan(_2668)), level(0.0)).xyzw;
    float _960 = _958.x;
    float _962 = _958.y;
    float _964 = _958.z;
    float _966 = _958.w;
    float2 _2685 = float2(_955, _943);
    float3 _970 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2685, float2(0.0), isnan(_2685)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2685, float2(0.0), isnan(_2685)), level(0.0)).xyz;
    float _972 = _970.x;
    float _974 = _970.y;
    float _976 = _970.z;
    float _978 = _485 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _980 = _485 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _982 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _984 = isnan(0.5);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _990 = _986 || _988;
    float _992 = in.m_51.x;
    float _994 = in.m_51.y;
    float _996 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[11].x, _978);
    float _998 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[10].x, _980);
    float _1000 = _849 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1002 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[11].z, _996);
    float _1004 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[10].z, _998);
    float _1006 = _859 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1008 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1010 = _1004 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1012 = exp2(_1000);
    float _1014 = _945;
    float _1016 = _947;
    if (!_990)
    {
        _1014 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1018 = _1014;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1022 = _1010 + _1008;
    float _1024 = 0.0;
    float _1026 = _1018;
    if (!_990)
    {
        _1024 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1028 = _1024;
    float _1030 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1006);
    float _1032 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1034 = 1.0 / _1008;
    float _1036 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1030);
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1040 = _992 > 0.5;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1044 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1050 = _1048 != 0;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1054 = _994 > 0.5;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1060 = _1058 != 0;
    float _1062 = _1022 * _1034;
    float _1064 = _1062 * 0.5;
    float _1066 = _1034;
    float _1068 = _1032;
    if (!_990)
    {
        float _1070 = -_1028;
        float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1066 = _1072;
    }
    float _1074 = _1066;
    float _1076 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1078 = -_385;
    int _1080 = _1054 ? as_type<int>(_1078) : as_type<int>(_385);
    if (!_990)
    {
        float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1084 = fma(_1064, _1018, _1082);
        _1026 = _1084;
    }
    float _1086 = _1026;
    if (!_990)
    {
        float _1088 = 1.0 / _1074;
        _1016 = _1088;
    }
    float _1090 = _1016;
    float _1092 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1094 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1096 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1100 = -_1012;
    float _1102 = _1100 + 1.0;
    bool _1104 = !_1060;
    float _1106 = _1104 ? _385 : as_type<float>(_1080);
    float _1108 = _1086;
    if (!_990)
    {
        float _1110 = 1.0 / _1086;
        _1108 = _1110;
    }
    float _1112 = _1108;
    float _1114 = -_391;
    int _1116 = _1040 ? as_type<int>(_1114) : as_type<int>(_391);
    float _1118 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1120 = _1102 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_58.x = _1092;
    out.m_58.y = _1094;
    out.m_58.z = _1096;
    bool _1122 = !_1050;
    float _1124 = _1122 ? _391 : as_type<float>(_1116);
    float _1126 = -_1106;
    float _1128 = _1126 + 0.5;
    if (_990)
    {
        _509 = 1.0;
    }
    float _1130 = _509;
    out.m_60.x = _1032;
    out.m_60.y = _1118;
    out.m_60.z = _1076;
    out.m_60.w = _1038;
    float _1132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1134 = _1124 + 0.5;
    float _1136 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1138 = _897 * 0.5;
    float _1140 = _1130;
    if (!_990)
    {
        float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1144 = -_1028;
        float _1146 = fma(_1112, _1142, _1144);
        _1068 = _1146;
    }
    float _1148 = _1068;
    float _1150 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1152 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1036);
    float _1154 = _1136 * _1132;
    if (!_990)
    {
        float _1156 = _1148 * _1090;
        float _1158 = precise::clamp(_1156, 0.0, 1.0);
        _1140 = _1158;
    }
    float _1160 = _1140;
    float _1162 = _1150 * _1044;
    float _1164 = fma(_929, -0.5, _1138);
    float _1166 = _1152 + _897;
    float _1168 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1170 = _1160 > 0.0;
    bool _1172 = isnan(_1160);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(0.0);
    bool _1178 = _1174 || _1176;
    float _1180 = _927 + _897;
    out.gl_Position.x = _927;
    out.gl_Position.y = _929;
    out.gl_Position.z = _1152;
    out.gl_Position.w = _897;
    float _1182 = _1168 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1184 = _1166 * 0.5;
    float _1186 = _1180 * 0.5;
    out.m_62.x = _1162;
    out.m_62.y = _1154;
    out.m_64.x = _1186;
    out.m_64.y = _1164;
    out.m_64.z = _1184;
    out.m_64.w = _897;
    out.m_45.x = _1182;
    float _1188 = _1120 * _951;
    float _1190 = -_1120;
    float _1192 = _1190 + 1.0;
    float _1194 = _966 * _1188;
    float _1196 = _966 * _1192;
    float _1198 = _976 * _1188;
    float _1200 = fma(_972, _1194, _960);
    float _1202 = fma(_974, _1194, _962);
    float _1204 = fma(_966, _1198, _964);
    out.m_66.x = _1200;
    out.m_66.y = _1202;
    out.m_66.z = _1204;
    out.m_66.w = _1196;
    if (_1178)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1206 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1206;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

