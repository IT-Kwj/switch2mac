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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_88 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_68 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_62 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2423 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
    float _106 = in.m_48.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_111);
    float _125 = _115;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _121;
    if (!_119)
    {
        out.m_53.x = 0.0;
    }
    int _129 = 0;
    if (!_119)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2740 = as_type<float>(_133);
        out.gl_Position.z = _2740;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _137 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_106);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = float(_111);
    bool _149 = _115 >= _147;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    if (_153)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _123;
    if (_153)
    {
        out.m_53.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _135 = as_type<int>(_157);
    }
    int _159 = _135;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2795 = as_type<float>(_159);
        out.gl_Position.z = _2795;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = 1.0 / _147;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _115 * _163;
    int _169 = as_type<int>(_161) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_161) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_165;
    float _187 = _167;
    float _205;
    if (!_185)
    {
        float _189 = in.m_58.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        _205 = _167;
    }
    _207 = false;
    float _209 = _205;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    bool _215 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _217 = isnan(_209);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    bool _231 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _233 = isnan(_209);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = 1.0 / _229;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _245;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _251 = _213 * _243;
    float _253 = -_225;
    float _255 = _253 + 1.0;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _257;
    float _261 = fma(_247, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _263 = _241 * _255;
    float _265 = fma(_259, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _267 = -_241;
    float _269 = _267 + 1.0;
    float _271 = _261 * _263;
    float _273 = _265 * _263;
    float _275 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].x, _271);
    float _277 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].y, _273);
    float _279 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].x, _275);
    float _281 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].y, _277);
    bool _283 = !_249;
    if (!_283)
    {
        float _285 = in.m_58.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _187 = _299;
    }
    float _301 = _187;
    float _303 = in.m_58.x;
    float _305 = in.m_58.y;
    float _307 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _309 = log2(_307);
    float _311 = in.m_58.z;
    int _313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _315 = _313 != 0;
    int _317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _319 = _317 != 0;
    int _321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _323 = _321 != 0;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _327 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _329 = int(_327);
    bool _331 = !_319;
    int _333 = _331 ? 0 : 1;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _337 = !_315;
    int _339 = _337 ? 0 : 1;
    float _341 = in.m_60.x;
    float _343 = in.m_60.y;
    float _345 = in.m_60.z;
    float _347 = in.m_60.w;
    float _349 = _303 * 2.0;
    float _351 = _305 * 2.0;
    float _353 = _305 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _355 = float(_329);
    float _357 = _311 * 2.0;
    float _359 = floor(_349);
    float _361 = -_325;
    float _363 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[77].x, _361);
    float _365 = fma(_353, -2.0, _335);
    float _367 = _305 + _303;
    float _369 = _311 + _303;
    float _371 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _365);
    float _373 = _367 + (-1.0);
    float _375 = floor(_357);
    float _377 = _369 + (-1.0);
    float _379 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _381 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _383 = _359 > 0.0;
    float _385 = floor(_351);
    bool _387 = _359 >= 0.0;
    bool _389 = isnan(_359);
    bool _391 = _387 || _389;
    bool _393 = isnan(0.0);
    bool _395 = _391 || _393;
    bool _397 = !_323;
    int _399 = _397 ? 0 : 1;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _403 = _401 != 0;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _407 = _405 != 0;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _411 = _409 != 0;
    bool _413 = _375 > 0.0;
    float _415 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _417 = int(_415);
    bool _419 = _375 >= 0.0;
    bool _421 = isnan(_375);
    bool _423 = _419 || _421;
    bool _425 = isnan(0.0);
    bool _427 = _423 || _425;
    bool _429 = !_403;
    int _431 = _429 ? 0 : 1;
    int _433 = _427 ? 0 : 1;
    int _435 = abs(_431);
    float _437 = 1.0 / _355;
    int _439 = ~_433;
    int _441 = _439 + 1;
    int _443 = _441 + 1;
    int _445 = _395 ? 0 : 1;
    int _447 = _443;
    if (!_413)
    {
        int _449 = ~_433;
        int _451 = _449 + 1;
        _447 = _451;
    }
    int _453 = _447;
    float _455 = _309 * _115;
    float _457 = float(_435);
    float _459 = float(_453);
    float _461 = exp2(_455);
    int _463 = ~_445;
    int _465 = _463 + 1;
    int _467 = _465 + 1;
    bool _469 = _385 > 0.0;
    float _471 = _457 * _459;
    bool _473 = _385 >= 0.0;
    bool _475 = isnan(_385);
    bool _477 = _473 || _475;
    bool _479 = isnan(0.0);
    bool _481 = _477 || _479;
    int _483 = _467;
    if (!_383)
    {
        int _485 = ~_445;
        int _487 = _485 + 1;
        _483 = _487;
    }
    int _489 = _483;
    float _491 = in.m_62.x;
    float _493 = in.m_62.y;
    float _495 = in.m_62.z;
    bool _497 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _499 = isnan(1.0);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _505 = _501 || _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _509 = 1.0 + _507;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _513 = !_407;
    int _515 = _513 ? 0 : 1;
    float _517 = 1.0 / _509;
    float _519 = -_461;
    float _521 = _519 + 1.0;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _525 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[78].z, _511);
    float _527 = -_115;
    float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[76].x, _363);
    int _531 = abs(_515);
    float _533 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[78].w, _523);
    bool _535 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _537 = isnan(0.0);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _543 = _539 || _541;
    float _545 = _437 * _115;
    int _547 = _481 ? 0 : 1;
    float _549 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _525);
    float _551 = float(_489);
    float _553 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _533);
    float _555 = float(_531);
    float _557 = float(_417);
    float _559 = _543 ? _521 : 0.0;
    float _561 = _555 * _551;
    int _563 = ~_547;
    int _565 = _563 + 1;
    int _567 = _565 + 1;
    float _569 = _557 * _115;
    int _571 = _567;
    if (!_469)
    {
        int _573 = ~_547;
        int _575 = _573 + 1;
        _571 = _575;
    }
    int _577 = _571;
    float _579 = _471 * (-2.0);
    bool _581 = !_411;
    int _583 = _581 ? 0 : 1;
    if (_505)
    {
        float _585 = _559 * _517;
        _125 = _585;
    }
    float _587 = _125;
    float _589 = _303 + (-0.5);
    float _591 = fma(_579, _491, _491);
    int _593 = abs(_583);
    float _595 = fma(_379, _579, _379);
    float _597 = _305 + _311;
    float _599 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[196].x, _591);
    float _601 = _561 * (-2.0);
    float _603 = _597 + (-1.0);
    float _605 = float(_577);
    float _607 = fma(_595, _587, _599);
    float _609 = float(_593);
    float _611 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _613 = _305 + (-0.5);
    float _615 = fma(_601, _493, _493);
    float _617 = _607 * 0.15915493667125701904296875;
    float _619 = _609 * _605;
    float _621 = fma(_611, _601, _611);
    float _623 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[196].y, _615);
    float _625 = in.m_46.x;
    float _627 = in.m_46.y;
    float _629 = in.m_46.z;
    float _631 = _619 * (-2.0);
    float _633 = _617 * 6.283185482025146484375;
    float _635 = sin(_633);
    float _637 = fma(_621, _587, _623);
    float _639 = in.m_64.x;
    float _641 = in.m_64.y;
    float _643 = in.m_64.z;
    float _645 = in.m_64.w;
    float _647 = fma(_631, _495, _495);
    float _649 = _311 + (-0.5);
    float _651 = fma(_381, _631, _381);
    float _653 = in.m_66.x;
    float _655 = in.m_66.y;
    float _657 = _637 * 0.15915493667125701904296875;
    float _659 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[196].z, _647);
    float _661 = _617 * 6.283185482025146484375;
    float _663 = cos(_661);
    float _665 = in.m_68.x;
    float _667 = in.m_68.y;
    float _669 = in.m_68.z;
    float _671 = in.m_68.w;
    bool _673 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _675 = isnan(0.5);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _681 = _677 || _679;
    float _683 = fma(_651, _587, _659);
    bool _685 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _687 = isnan(0.5);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _693 = _689 || _691;
    float _695 = _683 * 0.15915493667125701904296875;
    float _697 = _657 * 6.283185482025146484375;
    float _699 = sin(_697);
    float _701 = _627 * _343;
    float _703 = _657 * 6.283185482025146484375;
    float _705 = cos(_703);
    float _707 = _627 * _641;
    float _709 = fma(_625, _341, _701);
    float _711 = _279 * _653;
    float _713 = fma(_625, _639, _707);
    float _715 = _281 * _655;
    float _717 = _695 * 6.283185482025146484375;
    float _719 = cos(_717);
    float _721 = _627 * _667;
    float _723 = fma(_629, _643, _713);
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _727 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _729 = fma(_625, _665, _721);
    float _731 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _733 = _711 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _735 = _695 * 6.283185482025146484375;
    float _737 = sin(_735);
    float _739 = fma(_629, _669, _729);
    float _741 = fma(_629, _345, _709);
    float _743 = _727 * _725;
    float _745 = _635 * _699;
    float _747 = _663 * _705;
    float _749 = _733 * _731;
    float _751 = _635 * _705;
    float _753 = _663 * _719;
    float _755 = _635 * _719;
    float _757 = _705 * _719;
    float _759 = _699 * _719;
    float _761 = _663 * _699;
    float _763 = _753 * _743;
    float _765 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _767 = _739 + _671;
    float _769 = fma(_737, _747, _745);
    float _771 = -_743;
    float _773 = _737 * _771;
    float _775 = -_751;
    float _777 = fma(_737, _761, _775);
    float _779 = -_761;
    float _781 = fma(_737, _751, _779);
    float _783 = fma(_769, _749, _763);
    float _785 = _755 * _743;
    float _787 = fma(_757, _749, _773);
    float _789 = fma(_737, _745, _747);
    float _791 = fma(_777, _765, _783);
    float _793 = fma(_781, _749, _785);
    float _795 = fma(_759, _765, _787);
    float _797 = _723 + _645;
    float _799 = _791 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _801 = fma(_789, _765, _793);
    float _803 = _791 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _805 = _767 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _807 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[26].x, _799);
    float _809 = _741 + _347;
    float _811 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[24].x, _803);
    float _813 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[11].x, _805);
    float _815 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[26].z, _807);
    float _817 = _767 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _819 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[24].z, _811);
    float _821 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[11].z, _813);
    float _823 = _815 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _825 = _819 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _827 = _821 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _829 = _809 + _823;
    float _831 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[10].x, _817);
    float _833 = _797 + _825;
    float _835 = 1.0 / _827;
    float _837 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _839 = _829 + _837;
    float _841 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[10].z, _831);
    float _843 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _845 = _833 + _843;
    float _847 = _839 * _839;
    float _849 = _841 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _851 = fma(_845, _845, _847);
    float _853 = _849 + _827;
    float _855 = _791 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _857 = sqrt(_851);
    float _859 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[25].x, _855);
    float _861 = _853 * _835;
    float _863 = _861 * 0.5;
    float _865 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[25].z, _859);
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _869 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[30].w, _867);
    float _871 = _865 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _873 = 1.0 / _869;
    float _875 = _767 + _871;
    bool _877 = _857 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _879 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _881 = _833;
    float _883 = _829;
    float _885 = _851;
    float _887 = _857;
    float _889 = _835;
    float _891 = _657;
    float _893 = _787;
    if (!_877)
    {
        _879 = _875;
    }
    float _895 = _879;
    bool _897 = !_877;
    float _899 = _895;
    if (!_897)
    {
        float _901 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _903 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _905 = _857 + _903;
        float _907 = rsqrt(_851);
        float _909 = _905 * _901;
        float _911 = _875 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _913 = _909 * 0.15915493667125701904296875;
        float _915 = _913 * 6.283185482025146484375;
        float _917 = cos(_915);
        float _919 = _913 * 6.283185482025146484375;
        float _921 = sin(_919);
        float _923 = _917 + (-1.0);
        float _925 = _923 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _927 = fma(_921, _911, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _929 = fma(_875, _917, _925);
        float _931 = _907 * _927;
        float _933 = fma(_845, _931, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _935 = fma(_839, _931, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _899 = _929;
        _881 = _933;
        _883 = _935;
        _885 = _907;
        _887 = _913;
    }
    float _937 = _899;
    float _939 = _881;
    float _941 = _883;
    float _943 = _885;
    float _945 = _887;
    float _947 = _945;
    float _949 = _937;
    float _951 = _939;
    float _953 = _941;
    float _955 = _943;
    if (_693)
    {
        _947 = 1.0;
    }
    float _957 = _947;
    float _959 = _957;
    if (!_681)
    {
        float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _963 = _767 + _961;
        float _965 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _967 = _797 + _965;
        float _969 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _971 = -_767;
        float _973 = _971 + _937;
        float _975 = _963 * _963;
        float _977 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _979 = _809 + _977;
        float _981 = -_797;
        float _983 = _981 + _939;
        float _985 = -_809;
        float _987 = _985 + _941;
        float _989 = fma(_967, _967, _975);
        float _991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _993 = fma(_979, _979, _989);
        float _995 = sqrt(_993);
        float _997 = _969 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _999 = precise::min(_995, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1001 = _999 * _991;
        float _1003 = _997 * _1001;
        float _1005 = fma(_973, _1003, _767);
        float _1007 = fma(_983, _1003, _797);
        float _1009 = fma(_987, _1003, _809);
        _949 = _1005;
        _951 = _1007;
        _953 = _1009;
    }
    float _1011 = _949;
    float _1013 = _951;
    float _1015 = _953;
    if (_693)
    {
        _889 = 1.0;
    }
    float _1017 = _889;
    float _1019 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1021 = _873 * _1019;
    float _1023 = _1017;
    if (!_693)
    {
        float _1025 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1027 = _1025 * 0.15915493667125701904296875;
        float _1029 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1031 = _1027 * 6.283185482025146484375;
        float _1033 = cos(_1031);
        float _1035 = _1029 * 0.15915493667125701904296875;
        float _1037 = _1027 * 6.283185482025146484375;
        float _1039 = sin(_1037);
        float _1041 = 1.0 / _1033;
        float _1043 = _1035 * 6.283185482025146484375;
        float _1045 = cos(_1043);
        float _1047 = _1039 * _1041;
        float _1049 = _1035 * 6.283185482025146484375;
        float _1051 = sin(_1049);
        float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1055 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1053;
        float _1057 = _1045 * _1047;
        float _1059 = 1.0 / _1057;
        float _1061 = 1.0 / _1055;
        float _1063 = _1051 * _1059;
        float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1067 = fma(_1021, _1063, _1065);
        float _1069 = _1067 * _1061;
        float _1071 = precise::clamp(_1069, 0.0, 1.0);
        _955 = _1027;
        _959 = _1071;
    }
    float _1073 = _955;
    float _1075 = _959;
    if (!_693)
    {
        float _1077 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1079 = _1077 * 0.15915493667125701904296875;
        float _1081 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1083 = _1079 * 6.283185482025146484375;
        float _1085 = cos(_1083);
        float _1087 = _1081 * 0.15915493667125701904296875;
        float _1089 = _1079 * 6.283185482025146484375;
        float _1091 = sin(_1089);
        float _1093 = 1.0 / _1085;
        float _1095 = _1087 * 6.283185482025146484375;
        float _1097 = cos(_1095);
        float _1099 = _1091 * _1093;
        float _1101 = _1087 * 6.283185482025146484375;
        float _1103 = sin(_1101);
        float _1105 = _1097 * _1099;
        float _1107 = 1.0 / _1105;
        float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1111 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1109;
        float _1113 = 1.0 / _1111;
        float _1115 = _1103 * _1107;
        float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1119 = fma(_1021, _1115, _1117);
        float _1121 = _1119 * _1113;
        float _1123 = precise::clamp(_1121, 0.0, 1.0);
        float _1125 = -_1123;
        float _1127 = _1125 + 1.0;
        _1023 = _1127;
    }
    float _1129 = _1023;
    float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1133 = _1011 + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1137 = _1013 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1141 = _1015 + _1139;
    float _1143 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1145 = _1133 * _1133;
    float _1147 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1149 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1143);
    float _1151 = fma(_1137, _1137, _1145);
    float _1153 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1147);
    float _1155 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1149);
    float _1157 = fma(_1141, _1141, _1151);
    float _1159 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1153);
    float _1161 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1163 = rsqrt(_1157);
    float _1165 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1167 = sqrt(_1157);
    float _1169 = _1163 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1171 = _1137 * _1169;
    float _1173 = _1141 * _1169;
    float _1175 = _1171 * _1171;
    float _1177 = _1173 * _1173;
    float _1179 = _1175 + _1177;
    float _1181 = sqrt(_1179);
    bool _1183 = _1181 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1187 = _1181 + _1185;
    float _1189 = _1073;
    float _1191 = _1179;
    float _1193 = _1187;
    float _1195 = _1171;
    float _1197 = _1173;
    float _1199 = _1175;
    float _1201 = _1177;
    if (_1183)
    {
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1189 = _1203;
    }
    float _1205 = _1189;
    if (_1183)
    {
        float _1207 = rsqrt(_1179);
        _1191 = _1207;
    }
    float _1209 = _1191;
    float _1211 = _1209;
    if (_1183)
    {
        float _1213 = _1187 * _1205;
        _1193 = _1213;
    }
    float _1215 = _1193;
    if (_1183)
    {
        float _1217 = _1215 * 0.15915493667125701904296875;
        _891 = _1217;
    }
    float _1219 = _891;
    float _1221 = _869;
    float _1223 = _1219;
    if (_1183)
    {
        float _1225 = _1219 * 6.283185482025146484375;
        float _1227 = sin(_1225);
        _1221 = _1227;
    }
    float _1229 = _1221;
    float _1231 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1233 = precise::max(0.0, _1231);
    float _1235 = _1205;
    float _1237 = _1233;
    if (_1183)
    {
        float _1239 = _1219 * 6.283185482025146484375;
        float _1241 = cos(_1239);
        _1235 = _1241;
    }
    float _1243 = _1235;
    float _1245 = -_1169;
    float _1247 = -_1233;
    float _1249 = fma(_1133, _1245, _1247);
    if (_1183)
    {
        float _1251 = _1249 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1237 = _1251;
    }
    float _1253 = _1237;
    float _1255 = fma(_797, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1257 = _1253;
    float _1259 = _1229;
    if (_1183)
    {
        float _1261 = fma(_1229, _1253, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _893 = _1261;
    }
    float _1263 = _893;
    if (!_1183)
    {
        _1257 = _1249;
    }
    float _1265 = _1257;
    float _1267 = floor(_1255);
    float _1269 = _1265;
    if (_1183)
    {
        float _1271 = _1243 + (-1.0);
        _1259 = _1271;
    }
    float _1273 = _1259;
    if (_1183)
    {
        float _1275 = _1209 * _1263;
        _1223 = _1275;
    }
    float _1277 = _1223;
    if (_1183)
    {
        float _1279 = _1273 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1211 = _1279;
    }
    float _1281 = _1211;
    if (_1183)
    {
        float _1283 = _1171 * _1277;
        _1195 = _1283;
    }
    float _1285 = _1195;
    if (_1183)
    {
        float _1287 = _1173 * _1277;
        _1197 = _1287;
    }
    float _1289 = _1197;
    float _1291 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1183)
    {
        float _1293 = fma(_1249, _1243, _1281);
        _1269 = _1293;
    }
    float _1295 = _1269;
    if (_1183)
    {
        float _1297 = _1285 * _1285;
        _1199 = _1297;
    }
    float _1299 = _1199;
    if (_1183)
    {
        float _1301 = _1289 * _1289;
        _1201 = _1301;
    }
    float _1303 = _1201;
    float _1305 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1291);
    float _1307 = fma(_1295, _1295, _1299);
    float _1309 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1305);
    float _1311 = _1307 + _1303;
    float _1313 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1315 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1317 = _1309 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1319 = fma(_809, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1321 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1323 = fma(_1167, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1321);
    float _1325 = precise::clamp(_1323, 0.0, 1.0);
    float _1327 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1315);
    float _1329 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1331 = rsqrt(_1311);
    float _1333 = -_1325;
    float _1335 = _1333 + 1.0;
    float _1337 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1327);
    float _1339 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1341 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1343 = _1337 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1345 = -_1339;
    float _1347 = fma(_1345, _1313, 1.0);
    float _1349 = abs(_1335);
    float _1351 = log2(_1349);
    float _1353 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1329);
    float _1355 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1341);
    float _1357 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1353);
    float _1359 = _1331 * _1285;
    float _1361 = _1331 * _1289;
    float _1363 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1357);
    float _1365 = _1331 * _1295;
    float _1367 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1369 = floor(_1319);
    float _1371 = -_1367;
    float _1373 = fma(_1365, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1371);
    float _1375 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1377 = -_1361;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1373);
    float _1381 = -_1267;
    float _1383 = _1255 + _1381;
    float _1385 = log2(_1347);
    float _1387 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1389 = fma(_1379, -0.5, 0.5);
    float _1391 = fma(_1379, 0.5, 0.5);
    float _1393 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1387);
    float _1395 = -_1369;
    float _1397 = _1319 + _1395;
    float _1399 = 1.0 / _1363;
    float _1401 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1393);
    float _1403 = fma(_1391, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1405 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1355);
    float _1407 = _1365 + 1.0;
    float _1409 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1401);
    float _1411 = fma(_1391, _1403, -0.212114393711090087890625);
    float _1413 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1405);
    float _1415 = exp2(_1375);
    float _1417 = _1385 * 0.693147182464599609375;
    float _1419 = fma(_1391, _1411, 1.570728778839111328125);
    float _1421 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1423 = sqrt(_1389);
    float _1425 = _1409 * _1399;
    float _1427 = -_1365;
    float _1429 = fma(_1415, _1407, _1427);
    float _1431 = _1413 * _1399;
    float _1433 = fma(_1425, 0.5, 0.5);
    float _1435 = fma(_1429, 0.5, 0.5);
    float _1437 = fma(_1431, -0.5, 0.5);
    float _1439 = _1423 * 0.636619746685028076171875;
    float2 _4740 = float2(_1383, _1397);
    float _1441 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4740, float2(0.0), isnan(_4740)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4740, float2(0.0), isnan(_4740)), level(0.0)).x;
    float3 _4751 = float3(_1433, _1437, _1421);
    float _1443 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4751, float3(0.0), isnan(_4751)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4751, float3(0.0), isnan(_4751)), level(0.0)).x;
    float _1445 = -_1419;
    float _1447 = fma(_1439, _1445, 1.0);
    float3 _4767 = float3(_1433, _1437, _1421);
    float4 _1450 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4767, float3(0.0), isnan(_4767)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4767, float3(0.0), isnan(_4767)), level(0.0)).xyzw;
    float _1452 = _1450.x;
    float _1454 = _1450.y;
    float _1456 = _1450.z;
    float _1458 = _1450.w;
    float2 _4783 = float2(_1447, _1435);
    float3 _1462 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4783, float2(0.0), isnan(_4783)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4783, float2(0.0), isnan(_4783)), level(0.0)).xyz;
    float _1464 = _1462.x;
    float _1466 = _1462.y;
    float _1468 = _1462.z;
    float _1470 = float(uint(_417));
    float _1472 = trunc(_545);
    int _1474 = int(_1472);
    float _1476 = _569 * _163;
    int _1478 = abs(_333);
    float _1480 = -_549;
    float _1482 = _1480 + 1.0;
    bool _1484 = _305 > 0.5;
    float _1486 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1488 = _303 > 0.5;
    float _1490 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1492 = 1.0 / _1470;
    int _1494 = ~_417;
    int _1496 = _1494 + 1;
    float _1498 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1490);
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1502 = _1500 != 0;
    float _1504 = trunc(_1476);
    int _1506 = int(_1504);
    float _1508 = float(uint(_1474));
    float _1510 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1498);
    bool _1512 = !_1502;
    float _1514 = _1512 ? 7.345489978790283203125 : 1.0;
    float _1516 = exp2(_1486);
    int _1518 = as_type<int>(_1492) + (-2);
    float _1520 = _1514 * _303;
    bool _1522 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1524 = isnan(_301);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1530 = _1526 || _1528;
    float _1532 = float(_1530);
    float _1534 = as_type<float>(_1518) * _1508;
    int _1536 = ~_417;
    int _1538 = _1536 + 1;
    float _1540 = floor(_1520);
    float _1542 = trunc(_1534);
    float _1544 = precise::max(_1542, 0.0);
    uint _1547 = uint(_1544);
    float _1549 = -_1516;
    float _1551 = _1549 + 1.0;
    float _1553 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1555 = _1496 * int(_1547);
    int _1557 = _1555 + _1474;
    float _1559 = float(_1474);
    float _1561 = float(uint(_1557));
    float _1563 = as_type<float>(_1518) * _1561;
    float _1565 = trunc(_1563);
    float _1567 = precise::max(_1565, 0.0);
    uint _1569 = uint(_1567);
    int _1571 = int(_1547) + int(_1569);
    bool _1573 = _1559 >= _557;
    bool _1575 = isnan(_1559);
    bool _1577 = _1573 || _1575;
    bool _1579 = isnan(_557);
    bool _1581 = _1577 || _1579;
    float _1583 = float(_1581);
    float _1585 = -_1540;
    float _1587 = _1520 + _1585;
    int _1589 = _1538 * _1571;
    int _1591 = _1589 + _1474;
    float _1593 = trunc(_1583);
    int _1595 = int(_1593);
    bool _1597 = uint(_1591) >= uint(_417);
    bool _1599 = !_1597;
    int _1601 = _1599 ? 0 : (-1);
    bool _1603 = _417 == 0;
    int _1605 = ~_1571;
    int _1607 = _1605 + _1601;
    int _1609 = _1607 + 1;
    float _1611 = _1587 * _557;
    int _1613 = _417 * _1609;
    int _1615 = _1613 + _1474;
    int _1617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1619 = _1617 != 0;
    float _1621 = trunc(_1611);
    int _1623 = int(_1621);
    int _1625 = ~_1595;
    int _1627 = _1625 + 1;
    int _1629 = _1627 + 1;
    bool _1631 = !_1603;
    int _1633 = _1631 ? _1615 : (-1);
    bool _1635 = !_1619;
    int _1637 = _1635 ? 0 : 1;
    int _1639 = _417 + (-1);
    int _1641 = _1633 * _1629;
    int _1643 = abs(_1637);
    float _1645 = -_1532;
    float _1647 = _1645 + 1.0;
    int _1649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1651 = _1649 != 0;
    int _1653 = _1595 * _1639;
    int _1655 = _1653 + _1641;
    int _1657 = abs(_339);
    int _1659 = _1655 * _1478;
    int _1661 = abs(_399);
    float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1665 = _301 + _1663;
    bool _1667 = !_1651;
    int _1669 = _1667 ? 0 : 1;
    int _1671 = _1623 * _1643;
    int _1673 = _1671 + _1474;
    int _1675 = abs(_1669);
    int _1677 = _1506 * _1657;
    int _1679 = _1677 + _1659;
    int _1681 = _1673 * _1661;
    int _1683 = _1681 + _1679;
    int _1685 = ~_417;
    int _1687 = _1685 + 1;
    int _1689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1691 = _1689 != 0;
    int _1693 = _1623 * _1675;
    int _1695 = _1693 + _1683;
    float _1697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1699 = _1697 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1701 = 1.0 / _1699;
    float _1703 = float(uint(_1695));
    float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1711 = _1709 != 0;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1715 = _1713 != 0;
    float _1717 = as_type<float>(_1518) * _1703;
    float _1719 = float(uint(_1673));
    float _1721 = 1.0 / _1707;
    int _1723 = ~_417;
    int _1725 = _1723 + 1;
    float _1727 = trunc(_1717);
    float _1729 = precise::max(_1727, 0.0);
    uint _1731 = uint(_1729);
    float _1733 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1733;
    float _1737 = _1735 * _1721;
    float _1739 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1741 = _301 + _1739;
    int _1743 = _1687 * int(_1731);
    int _1745 = _1743 + _1695;
    float _1747 = float(uint(_1745));
    float _1749 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1751 = _1749 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1753 = as_type<float>(_1518) * _1747;
    float _1755 = _1751 * _1701;
    bool _1757 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1759 = isnan(_301);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1765 = _1761 || _1763;
    float _1767 = float(_1765);
    float _1769 = trunc(_1753);
    float _1771 = precise::max(_1769, 0.0);
    uint _1773 = uint(_1771);
    bool _1775 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1777 = isnan(_301);
    bool _1779 = _1775 || _1777;
    bool _1781 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1783 = _1779 || _1781;
    float _1785 = float(_1783);
    float _1787 = -_1767;
    float _1789 = _1787 + 1.0;
    float _1791 = _1785 * _1647;
    float _1793 = _1532 * _1789;
    float _1795 = fma(_1737, _1741, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1797 = as_type<float>(_1518) * _1719;
    float _1799 = fma(_1755, _1665, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1801 = -_1785;
    float _1803 = _1801 + 1.0;
    float _1805 = _1795 * _1791;
    int _1807 = ~_417;
    int _1809 = _1807 + 1;
    float _1811 = trunc(_1797);
    float _1813 = precise::max(_1811, 0.0);
    uint _1815 = uint(_1813);
    int _1817 = int(_1731) + int(_1773);
    float _1819 = fma(_1803, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1805);
    float _1821 = -_179;
    int _1823 = _1488 ? as_type<int>(_1821) : as_type<int>(_179);
    float _1825 = -_183;
    int _1827 = _1484 ? as_type<int>(_1825) : as_type<int>(_183);
    int _1829 = _1809 * _1817;
    int _1831 = _1829 + _1695;
    bool _1833 = !_1711;
    float _1835 = _1833 ? _179 : as_type<float>(_1823);
    float _1837 = fma(_1799, _1793, _1819);
    bool _1839 = !_1715;
    float _1841 = _1839 ? _183 : as_type<float>(_1827);
    bool _1843 = uint(_1831) >= uint(_417);
    float _1845 = _1835 + 0.5;
    float _1847 = _1841 + (-0.5);
    bool _1849 = !_1843;
    int _1851 = _1849 ? 0 : (-1);
    float _1853 = fma(_1845, (*spvDescriptorSet0.vp_c9)._m0[80].x, _529);
    int _1855 = _1725 * int(_1815);
    int _1857 = _1855 + _1673;
    float _1859 = -_1847;
    float _1861 = -_371;
    float _1863 = fma(_1859, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1861);
    int _1865 = ~_1817;
    int _1867 = _1865 + _1851;
    int _1869 = _1867 + 1;
    float _1871 = -_1482;
    float _1873 = fma(_1835, _1871, _1853);
    float _1875 = -_553;
    float _1877 = _1875 + 1.0;
    float _1879 = abs(_1021);
    float _1881 = log2(_1879);
    float _1883 = float(uint(_1857));
    int _1885 = _417 * _1869;
    int _1887 = _1885 + _1695;
    float _1889 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1837);
    float _1891 = fma(_1841, _1877, _1863);
    float _1893 = as_type<float>(_1518) * _1883;
    float _1895 = _1889 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1897 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1899 = !_1603;
    int _1901 = _1899 ? _1887 : (-1);
    float _1903 = trunc(_1893);
    float _1905 = precise::max(_1903, 0.0);
    uint _1907 = uint(_1905);
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1913 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _1915 = _1901 >> 31;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1919 = _1897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1921 = _1909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1923 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1925 = exp2(_1913);
    out.m_70.x = _1873;
    out.m_70.y = _1891;
    out.m_72.x = _1919;
    out.m_72.y = _1921;
    out.m_72.z = _1923;
    out.m_72.w = _1917;
    int _1927 = _1915 & 3;
    float _1929 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1931 = ~_417;
    int _1933 = _1931 + 1;
    float _1935 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1937 = _1901 + _1927;
    float _1939 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1941 = int(_1815) + int(_1907);
    float _1943 = _753 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1945 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1947 = _1937 >> 2;
    float _1949 = _1935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1951 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1953 = _753 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1955 = _753 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1957 = fma(_1925, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1959 = precise::clamp(_1957, 0.0, 1.0);
    int _1961 = _1947 << 4;
    int _1963 = _1961 + 368;
    int _1965 = _1933 * _1941;
    int _1967 = _1965 + _1673;
    float _1969 = -_737;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1953);
    float _1973 = -_737;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1955);
    float _1977 = -_737;
    float _1979 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1943);
    float _1981 = _769 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_74.x = _1945;
    out.m_74.y = _1949;
    out.m_74.z = _1951;
    out.m_74.w = _1895;
    float _1983 = _769 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1985 = uint(_1967) >= uint(_417);
    float _1987 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1975);
    uint _1989 = uint(int(uint(_1963) >> uint(2)));
    uint _1991 = uint(int(uint(int(_1989)) >> uint(2)));
    int _1993 = int(_1989) & 3;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[int(_1991)][_1993];
    int _1997 = int(_1989) + 1;
    uint _1999 = uint(int(uint(_1997) >> uint(2)));
    int _2001 = _1997 & 3;
    float _2003 = (*spvDescriptorSet0.vp_c9)._m0[int(_1999)][_2001];
    float _2005 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1971);
    float _2007 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1979);
    float _2009 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1981);
    float _2011 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1983);
    int _2013 = _1901 & 3;
    bool _2015 = _2013 != 0;
    float _2017 = _777 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2019 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2009);
    bool _2021 = _1021 <= 8000.0;
    bool _2023 = isnan(_1021);
    bool _2025 = _2021 || _2023;
    bool _2027 = isnan(8000.0);
    bool _2029 = _2025 || _2027;
    float _2031 = float(_2029);
    float _2033 = -_1441;
    float _2035 = _2033 + 1.0;
    float _2037 = _769 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2039 = _1901 & 3;
    bool _2041 = _2039 != 0;
    float _2043 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2017);
    float _2045 = _1553 * _1443;
    float _2047 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2037);
    float _2049 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2051 = _777 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2053 = uint(_2039) > 1u;
    float _2055 = _777 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2057 = _2015 ? 0 : 1;
    float _2059 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2051);
    float _2061 = _2049 * _2005;
    int _2063 = _1963 + 8;
    uint _2065 = uint(int(uint(_2063) >> uint(2)));
    uint _2067 = uint(int(uint(int(_2065)) >> uint(2)));
    int _2069 = int(_2065) & 3;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[int(_2067)][_2069];
    int _2073 = int(_2065) + 1;
    uint _2075 = uint(int(uint(_2073) >> uint(2)));
    int _2077 = _2073 & 3;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[int(_2075)][_2077];
    float _2081 = _2049 * _2007;
    int _2083 = ~_2057;
    int _2085 = _2083 + 1;
    int _2087 = _2085 + 1;
    float _2089 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2055);
    bool _2091 = uint(_2039) >= 2u;
    float _2093 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2011);
    float _2095 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2047);
    bool _2097 = !_1985;
    int _2099 = _2097 ? 0 : (-1);
    float _2101 = _2049 * _1987;
    int _2103 = _2087;
    if (!_2053)
    {
        int _2105 = ~_2057;
        int _2107 = _2105 + 1;
        _2103 = _2107;
    }
    int _2109 = _2103;
    float _2111 = _1959 * _1959;
    bool _2113 = _2039 != 3;
    float _2115 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2059);
    int _2117 = _2091 ? 0 : 1;
    float _2119 = _1458 * _2045;
    int _2121 = abs(_2109);
    float _2123 = -_1553;
    float _2125 = _2123 + 1.0;
    bool _2127 = !_2041;
    int _2129 = _2127 ? 0 : 1;
    int _2131 = ~_2117;
    int _2133 = _2131 + 1;
    int _2135 = _2133 + 1;
    float _2137 = _1468 * _2045;
    bool _2139 = _2039 != 3;
    float _2141 = _1458 * _2125;
    int _2143 = ~_2121;
    int _2145 = _2143 + 1;
    int _2147 = _2145 + 1;
    float _2149 = fma(_1458, _2137, _1456);
    int _2151 = _2135;
    if (_2113)
    {
        int _2153 = ~_2117;
        int _2155 = _2153 + 1;
        _2151 = _2155;
    }
    int _2157 = _2151;
    bool _2159 = !_2139;
    int _2161 = _2159 ? 0 : (-1);
    int _2163 = _2147 * as_type<int>(_2003);
    int _2165 = abs(_2129);
    int _2167 = abs(_2157);
    bool _2169 = !_1691;
    int _2171 = _2169 ? 0 : 1;
    int _2173 = abs(_2161);
    int _2175 = ~_2165;
    int _2177 = _2175 + 1;
    int _2179 = _2177 + 1;
    int _2181 = ~_1941;
    int _2183 = _2181 + _2099;
    int _2185 = _2183 + 1;
    float _2187 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2189 = abs(_2171);
    int _2191 = _2179 * as_type<int>(_1995);
    int _2193 = _2191 + _2163;
    int _2195 = _417 * _2185;
    int _2197 = _2195 + _1673;
    int _2199 = ~_2167;
    int _2201 = _2199 + 1;
    int _2203 = _2201 + 1;
    float _2205 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1510);
    float _2207 = fma(_2187, _2093, _2101);
    int _2209 = ~_2173;
    int _2211 = _2209 + 1;
    int _2213 = _2211 + 1;
    int _2215 = _2203 * as_type<int>(_2071);
    int _2217 = _2215 + _2193;
    float _2219 = _1409 + _1363;
    int _2221 = ~_2189;
    int _2223 = _2221 + 1;
    int _2225 = _2223 + 1;
    int _2227 = _2213 * as_type<int>(_2079);
    int _2229 = _2227 + _2217;
    bool _2231 = !_1603;
    int _2233 = _2231 ? _2197 : (-1);
    float _2235 = fma(_1959, -2.0, 3.0);
    float _2237 = _2205 + _1363;
    int _2239 = _2229 * _2225;
    float _2241 = _2111 * _2235;
    float _2243 = _2237 * 0.5;
    int _2245 = _2233 * _2189;
    int _2247 = _2245 + _2239;
    float _2249 = _1363 * 0.5;
    float _2251 = -_2241;
    float _2253 = _2251 + 1.0;
    float _2255 = in.m_76.x;
    float _2257 = _2219 * 0.5;
    float _2259 = fma(_1413, -0.5, _2249);
    float _2261 = fma(_2253, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2241);
    float _2263 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2043);
    float _2265 = fma(_2187, _2019, _2061);
    float _2267 = _2031 * _2261;
    float _2269 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2089);
    float _2271 = fma(_2187, _2095, _2081);
    out.m_78.x = _2257;
    out.m_78.y = _2259;
    out.m_78.z = _2243;
    out.m_78.w = _1363;
    float _2273 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2275 = _2263 + _2207;
    float _2277 = fma(_1464, _2119, _1452);
    float _2279 = _2115 + _2265;
    float _2281 = _2035 * _2273;
    float _2283 = precise::clamp(_2281, 0.0, 1.0);
    float _2285 = _2269 + _2271;
    float _2287 = fma(_1466, _2119, _1454);
    out.gl_Position.x = _1409;
    out.gl_Position.y = _1413;
    out.gl_Position.z = _2205;
    out.gl_Position.w = _1363;
    float _2289 = -_2283;
    float _2291 = fma(_2289, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2293 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2295 = isnan(_1167);
    bool _2297 = _2293 || _2295;
    bool _2299 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2301 = _2297 || _2299;
    out.m_80.x = _2277;
    out.m_80.y = _2287;
    out.m_80.z = _2149;
    out.m_80.w = _2141;
    float _2303 = float(_2247);
    float _2305 = _2291 * _2255;
    out.m_82.x = _2279;
    out.m_82.y = _2275;
    out.m_82.z = _2285;
    float _2307 = _2305 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_84.x = _2303;
    float _2309 = _2243;
    float _2311 = _2259;
    float _2313 = _2257;
    float _2315 = _2305;
    float _2317 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2301)
    {
        _2309 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2319 = _2309;
    out.m_86.x = _2307;
    float _2321 = _2319;
    float _2323 = _2319;
    if (!_2301)
    {
        _2311 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2325 = _2311;
    float _2327 = _2325;
    float _2329 = _2325;
    if (!_2301)
    {
        _2313 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2331 = _2313;
    float _2333 = _1075 * _1129;
    float _2335 = _2333;
    float _2337 = _2331;
    float _2339 = _2331;
    if (!_2301)
    {
        _2315 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2341 = _2315;
    float _2343 = _2341;
    float _2345 = _2341;
    if (!_2301)
    {
        _2317 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2347 = _2317;
    float _2349 = _2333 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2351 = _2347;
    float _2353 = _2347;
    if (!_2301)
    {
        _2335 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2355 = _2335;
    bool _2357 = !_2301;
    float _2359 = _2355;
    float _2361 = _2355;
    if (!_2357)
    {
        bool _2363 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2365 = isnan(_1167);
        bool _2367 = _2363 || _2365;
        bool _2369 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2371 = _2367 || _2369;
        if (!_2371)
        {
            float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2375 = _1167 + _2373;
            float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2379 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2377;
            float _2381 = 1.0 / _2379;
            float _2383 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2385 = _2383 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2389 = _2387 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2403 = _2375 * _2381;
            float _2405 = precise::clamp(_2403, 0.0, 1.0);
            float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2411 = fma(_2405, _2385, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2413 = fma(_2405, _2409, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2415 = fma(_2405, _2389, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2417 = fma(_2405, _2393, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2419 = fma(_2405, _2397, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2421 = fma(_2405, _2401, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2329 = _2413;
            _2353 = _2419;
            _2323 = _2411;
            _2345 = _2417;
            _2339 = _2415;
            _2361 = _2421;
            _2423 = true;
        }
        else
        {
            bool _2425 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2427 = isnan(_1167);
            bool _2429 = _2425 || _2427;
            bool _2431 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2433 = _2429 || _2431;
            if (!_2433)
            {
                _2321 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2435 = _2321;
            _2323 = _2435;
            if (!_2433)
            {
                _2327 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2437 = _2327;
            _2329 = _2437;
            if (!_2433)
            {
                _2337 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2439 = _2337;
            _2339 = _2439;
            if (!_2433)
            {
                _2343 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2441 = _2343;
            _2345 = _2441;
            if (!_2433)
            {
                _2351 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2443 = _2351;
            _2353 = _2443;
            if (!_2433)
            {
                _2359 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2445 = _2359;
            bool _2447 = !_2433;
            _2361 = _2445;
            if (!_2447)
            {
                bool _2449 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2451 = isnan(_1167);
                bool _2453 = _2449 || _2451;
                bool _2455 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2457 = _2453 || _2455;
                if (!_2457)
                {
                    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2461 = _1167 + _2459;
                    float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2465 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2463;
                    float _2467 = 1.0 / _2465;
                    float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2489 = _2461 * _2467;
                    float _2491 = precise::clamp(_2489, 0.0, 1.0);
                    float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2497 = fma(_2491, _2471, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2499 = fma(_2491, _2495, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2501 = fma(_2491, _2475, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2503 = fma(_2491, _2479, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2505 = fma(_2491, _2483, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2507 = fma(_2491, _2487, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2329 = _2499;
                    _2353 = _2505;
                    _2323 = _2497;
                    _2345 = _2503;
                    _2339 = _2501;
                    _2361 = _2507;
                    _2423 = true;
                }
                else
                {
                    _2329 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2353 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2323 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2345 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2339 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2361 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2423 = false;
    float _2509 = _2329;
    float _2511 = _2353;
    float _2513 = _2323;
    float _2515 = _2345;
    float _2517 = _2339;
    float _2519 = _2361;
    float _2521 = _2349 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2523 = fma(_2275, -0.5, 0.5);
    float _2525 = precise::clamp(_2523, 0.0, 1.0);
    float _2527 = -_2509;
    float _2529 = _2527 + _2511;
    float _2531 = -_2513;
    float _2533 = _2531 + _2515;
    out.m_53.x = _2521;
    float _2535 = -_2517;
    float _2537 = _2535 + _2519;
    float _2539 = fma(_2525, _2529, _2509);
    float _2541 = fma(_2525, _2533, _2513);
    bool _2543 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2545 = _2539 * 0.586610972881317138671875;
    float _2547 = fma(_2525, _2537, _2517);
    out.m_88.x = 0.0;
    bool _2549 = _1075 > 0.0;
    bool _2551 = isnan(_1075);
    bool _2553 = _2549 || _2551;
    bool _2555 = isnan(0.0);
    bool _2557 = _2553 || _2555;
    float _2559 = fma(_2541, 0.298911988735198974609375, _2545);
    bool _2561 = _1129 <= 0.0;
    bool _2563 = !_2557;
    bool _2565 = _2561 || _2563;
    float _2567 = fma(_2547, 0.114477999508380889892578125, _2559);
    float _2569 = -_2567;
    float _2571 = _2541 + _2569;
    float _2573 = -_2567;
    float _2575 = _2539 + _2573;
    float _2577 = -_2567;
    float _2579 = _2547 + _2577;
    float _2581 = fma(_2571, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2567);
    float _2583 = fma(_2575, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2567);
    float _2585 = fma(_2579, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2567);
    bool _2587 = !_2543;
    if (!_2587)
    {
        float _2589 = -_1011;
        float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2593 = -_1013;
        float _2595 = _2593 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2597 = -_1015;
        float _2599 = _2597 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2601 = _2591 * _2591;
        float _2603 = fma(_2595, _2595, _2601);
        float _2605 = fma(_2599, _2599, _2603);
        float _2607 = sqrt(_2605);
        float _2609 = rsqrt(_2605);
        float _2611 = -_2607;
        float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2615 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2617 = precise::clamp(_2615, 0.0, 1.0);
        float _2619 = _2595 * _2609;
        float _2621 = _2591 * _2609;
        float _2623 = abs(_2617);
        float _2625 = log2(_2623);
        float _2627 = _2599 * _2609;
        float _2629 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2631 = _2275 * _2621;
        float _2633 = -_2621;
        float _2635 = -_2629;
        float _2637 = fma(_2633, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2635);
        float _2639 = fma(_2279, _2619, _2631);
        float _2641 = -_2627;
        float _2643 = fma(_2641, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2637);
        float _2645 = fma(_2285, _2627, _2639);
        float _2647 = precise::clamp(_2645, 0.0, 1.0);
        float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2651 = _2643 + _2649;
        float _2653 = _2625 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2655 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2657 = precise::clamp(_2655, 0.0, 1.0);
        float _2659 = exp2(_2653);
        float _2661 = _2659 * _2657;
        float _2663 = _2647 * _2661;
        float _2665 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2667 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2669 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2665;
        out.m_88.y = _2667;
        out.m_88.z = _2669;
    }
    out.m_90.x = _2581;
    out.m_90.y = _2583;
    out.m_90.z = _2585;
    if (!_2565)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2671 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2671;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2423 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
    float _106 = in.m_48.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_111);
    float _125 = _115;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _121;
    if (!_119)
    {
        out.m_53.x = 0.0;
    }
    int _129 = 0;
    if (!_119)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2740 = as_type<float>(_133);
        out.gl_Position.z = _2740;
    }
    if (!_119)
    {
        return out;
    }
    bool _137 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_106);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = float(_111);
    bool _149 = _115 >= _147;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    if (_153)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _123;
    if (_153)
    {
        out.m_53.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _135 = as_type<int>(_157);
    }
    int _159 = _135;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2795 = as_type<float>(_159);
        out.gl_Position.z = _2795;
    }
    if (_153)
    {
        return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = 1.0 / _147;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _115 * _163;
    int _169 = as_type<int>(_161) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_161) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_165;
    float _187 = _167;
    float _205;
    if (!_185)
    {
        float _189 = in.m_58.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        _205 = _167;
    }
    _207 = false;
    float _209 = _205;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    bool _215 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _217 = isnan(_209);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    bool _231 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _233 = isnan(_209);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = 1.0 / _229;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _245;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _251 = _213 * _243;
    float _253 = -_225;
    float _255 = _253 + 1.0;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _257;
    float _261 = fma(_247, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _263 = _241 * _255;
    float _265 = fma(_259, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _267 = -_241;
    float _269 = _267 + 1.0;
    float _271 = _261 * _263;
    float _273 = _265 * _263;
    float _275 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].x, _271);
    float _277 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].y, _273);
    float _279 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].x, _275);
    float _281 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].y, _277);
    bool _283 = !_249;
    if (!_283)
    {
        float _285 = in.m_58.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _187 = _299;
    }
    float _301 = _187;
    float _303 = in.m_58.x;
    float _305 = in.m_58.y;
    float _307 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _309 = log2(_307);
    float _311 = in.m_58.z;
    int _313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _315 = _313 != 0;
    int _317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _319 = _317 != 0;
    int _321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _323 = _321 != 0;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _327 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _329 = int(_327);
    bool _331 = !_319;
    int _333 = _331 ? 0 : 1;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _337 = !_315;
    int _339 = _337 ? 0 : 1;
    float _341 = in.m_60.x;
    float _343 = in.m_60.y;
    float _345 = in.m_60.z;
    float _347 = in.m_60.w;
    float _349 = _303 * 2.0;
    float _351 = _305 * 2.0;
    float _353 = _305 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _355 = float(_329);
    float _357 = _311 * 2.0;
    float _359 = floor(_349);
    float _361 = -_325;
    float _363 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[77].x, _361);
    float _365 = fma(_353, -2.0, _335);
    float _367 = _305 + _303;
    float _369 = _311 + _303;
    float _371 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _365);
    float _373 = _367 + (-1.0);
    float _375 = floor(_357);
    float _377 = _369 + (-1.0);
    float _379 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _381 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _383 = _359 > 0.0;
    float _385 = floor(_351);
    bool _387 = _359 >= 0.0;
    bool _389 = isnan(_359);
    bool _391 = _387 || _389;
    bool _393 = isnan(0.0);
    bool _395 = _391 || _393;
    bool _397 = !_323;
    int _399 = _397 ? 0 : 1;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _403 = _401 != 0;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _407 = _405 != 0;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _411 = _409 != 0;
    bool _413 = _375 > 0.0;
    float _415 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _417 = int(_415);
    bool _419 = _375 >= 0.0;
    bool _421 = isnan(_375);
    bool _423 = _419 || _421;
    bool _425 = isnan(0.0);
    bool _427 = _423 || _425;
    bool _429 = !_403;
    int _431 = _429 ? 0 : 1;
    int _433 = _427 ? 0 : 1;
    int _435 = abs(_431);
    float _437 = 1.0 / _355;
    int _439 = ~_433;
    int _441 = _439 + 1;
    int _443 = _441 + 1;
    int _445 = _395 ? 0 : 1;
    int _447 = _443;
    if (!_413)
    {
        int _449 = ~_433;
        int _451 = _449 + 1;
        _447 = _451;
    }
    int _453 = _447;
    float _455 = _309 * _115;
    float _457 = float(_435);
    float _459 = float(_453);
    float _461 = exp2(_455);
    int _463 = ~_445;
    int _465 = _463 + 1;
    int _467 = _465 + 1;
    bool _469 = _385 > 0.0;
    float _471 = _457 * _459;
    bool _473 = _385 >= 0.0;
    bool _475 = isnan(_385);
    bool _477 = _473 || _475;
    bool _479 = isnan(0.0);
    bool _481 = _477 || _479;
    int _483 = _467;
    if (!_383)
    {
        int _485 = ~_445;
        int _487 = _485 + 1;
        _483 = _487;
    }
    int _489 = _483;
    float _491 = in.m_62.x;
    float _493 = in.m_62.y;
    float _495 = in.m_62.z;
    bool _497 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _499 = isnan(1.0);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _505 = _501 || _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _509 = 1.0 + _507;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _513 = !_407;
    int _515 = _513 ? 0 : 1;
    float _517 = 1.0 / _509;
    float _519 = -_461;
    float _521 = _519 + 1.0;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _525 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[78].z, _511);
    float _527 = -_115;
    float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[76].x, _363);
    int _531 = abs(_515);
    float _533 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[78].w, _523);
    bool _535 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _537 = isnan(0.0);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _543 = _539 || _541;
    float _545 = _437 * _115;
    int _547 = _481 ? 0 : 1;
    float _549 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _525);
    float _551 = float(_489);
    float _553 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _533);
    float _555 = float(_531);
    float _557 = float(_417);
    float _559 = _543 ? _521 : 0.0;
    float _561 = _555 * _551;
    int _563 = ~_547;
    int _565 = _563 + 1;
    int _567 = _565 + 1;
    float _569 = _557 * _115;
    int _571 = _567;
    if (!_469)
    {
        int _573 = ~_547;
        int _575 = _573 + 1;
        _571 = _575;
    }
    int _577 = _571;
    float _579 = _471 * (-2.0);
    bool _581 = !_411;
    int _583 = _581 ? 0 : 1;
    if (_505)
    {
        float _585 = _559 * _517;
        _125 = _585;
    }
    float _587 = _125;
    float _589 = _303 + (-0.5);
    float _591 = fma(_579, _491, _491);
    int _593 = abs(_583);
    float _595 = fma(_379, _579, _379);
    float _597 = _305 + _311;
    float _599 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[196].x, _591);
    float _601 = _561 * (-2.0);
    float _603 = _597 + (-1.0);
    float _605 = float(_577);
    float _607 = fma(_595, _587, _599);
    float _609 = float(_593);
    float _611 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _613 = _305 + (-0.5);
    float _615 = fma(_601, _493, _493);
    float _617 = _607 * 0.15915493667125701904296875;
    float _619 = _609 * _605;
    float _621 = fma(_611, _601, _611);
    float _623 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[196].y, _615);
    float _625 = in.m_46.x;
    float _627 = in.m_46.y;
    float _629 = in.m_46.z;
    float _631 = _619 * (-2.0);
    float _633 = _617 * 6.283185482025146484375;
    float _635 = sin(_633);
    float _637 = fma(_621, _587, _623);
    float _639 = in.m_64.x;
    float _641 = in.m_64.y;
    float _643 = in.m_64.z;
    float _645 = in.m_64.w;
    float _647 = fma(_631, _495, _495);
    float _649 = _311 + (-0.5);
    float _651 = fma(_381, _631, _381);
    float _653 = in.m_66.x;
    float _655 = in.m_66.y;
    float _657 = _637 * 0.15915493667125701904296875;
    float _659 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[196].z, _647);
    float _661 = _617 * 6.283185482025146484375;
    float _663 = cos(_661);
    float _665 = in.m_68.x;
    float _667 = in.m_68.y;
    float _669 = in.m_68.z;
    float _671 = in.m_68.w;
    bool _673 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _675 = isnan(0.5);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _681 = _677 || _679;
    float _683 = fma(_651, _587, _659);
    bool _685 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _687 = isnan(0.5);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _693 = _689 || _691;
    float _695 = _683 * 0.15915493667125701904296875;
    float _697 = _657 * 6.283185482025146484375;
    float _699 = sin(_697);
    float _701 = _627 * _343;
    float _703 = _657 * 6.283185482025146484375;
    float _705 = cos(_703);
    float _707 = _627 * _641;
    float _709 = fma(_625, _341, _701);
    float _711 = _279 * _653;
    float _713 = fma(_625, _639, _707);
    float _715 = _281 * _655;
    float _717 = _695 * 6.283185482025146484375;
    float _719 = cos(_717);
    float _721 = _627 * _667;
    float _723 = fma(_629, _643, _713);
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _727 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _729 = fma(_625, _665, _721);
    float _731 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _733 = _711 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _735 = _695 * 6.283185482025146484375;
    float _737 = sin(_735);
    float _739 = fma(_629, _669, _729);
    float _741 = fma(_629, _345, _709);
    float _743 = _727 * _725;
    float _745 = _635 * _699;
    float _747 = _663 * _705;
    float _749 = _733 * _731;
    float _751 = _635 * _705;
    float _753 = _663 * _719;
    float _755 = _635 * _719;
    float _757 = _705 * _719;
    float _759 = _699 * _719;
    float _761 = _663 * _699;
    float _763 = _753 * _743;
    float _765 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _767 = _739 + _671;
    float _769 = fma(_737, _747, _745);
    float _771 = -_743;
    float _773 = _737 * _771;
    float _775 = -_751;
    float _777 = fma(_737, _761, _775);
    float _779 = -_761;
    float _781 = fma(_737, _751, _779);
    float _783 = fma(_769, _749, _763);
    float _785 = _755 * _743;
    float _787 = fma(_757, _749, _773);
    float _789 = fma(_737, _745, _747);
    float _791 = fma(_777, _765, _783);
    float _793 = fma(_781, _749, _785);
    float _795 = fma(_759, _765, _787);
    float _797 = _723 + _645;
    float _799 = _791 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _801 = fma(_789, _765, _793);
    float _803 = _791 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _805 = _767 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _807 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[26].x, _799);
    float _809 = _741 + _347;
    float _811 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[24].x, _803);
    float _813 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[11].x, _805);
    float _815 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[26].z, _807);
    float _817 = _767 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _819 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[24].z, _811);
    float _821 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[11].z, _813);
    float _823 = _815 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _825 = _819 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _827 = _821 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _829 = _809 + _823;
    float _831 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[10].x, _817);
    float _833 = _797 + _825;
    float _835 = 1.0 / _827;
    float _837 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _839 = _829 + _837;
    float _841 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[10].z, _831);
    float _843 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _845 = _833 + _843;
    float _847 = _839 * _839;
    float _849 = _841 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _851 = fma(_845, _845, _847);
    float _853 = _849 + _827;
    float _855 = _791 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _857 = sqrt(_851);
    float _859 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[25].x, _855);
    float _861 = _853 * _835;
    float _863 = _861 * 0.5;
    float _865 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[25].z, _859);
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _869 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[30].w, _867);
    float _871 = _865 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _873 = 1.0 / _869;
    float _875 = _767 + _871;
    bool _877 = _857 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _879 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _881 = _833;
    float _883 = _829;
    float _885 = _851;
    float _887 = _857;
    float _889 = _835;
    float _891 = _657;
    float _893 = _787;
    if (!_877)
    {
        _879 = _875;
    }
    float _895 = _879;
    bool _897 = !_877;
    float _899 = _895;
    if (!_897)
    {
        float _901 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _903 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _905 = _857 + _903;
        float _907 = rsqrt(_851);
        float _909 = _905 * _901;
        float _911 = _875 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _913 = _909 * 0.15915493667125701904296875;
        float _915 = _913 * 6.283185482025146484375;
        float _917 = cos(_915);
        float _919 = _913 * 6.283185482025146484375;
        float _921 = sin(_919);
        float _923 = _917 + (-1.0);
        float _925 = _923 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _927 = fma(_921, _911, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _929 = fma(_875, _917, _925);
        float _931 = _907 * _927;
        float _933 = fma(_845, _931, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _935 = fma(_839, _931, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _899 = _929;
        _881 = _933;
        _883 = _935;
        _885 = _907;
        _887 = _913;
    }
    float _937 = _899;
    float _939 = _881;
    float _941 = _883;
    float _943 = _885;
    float _945 = _887;
    float _947 = _945;
    float _949 = _937;
    float _951 = _939;
    float _953 = _941;
    float _955 = _943;
    if (_693)
    {
        _947 = 1.0;
    }
    float _957 = _947;
    float _959 = _957;
    if (!_681)
    {
        float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _963 = _767 + _961;
        float _965 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _967 = _797 + _965;
        float _969 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _971 = -_767;
        float _973 = _971 + _937;
        float _975 = _963 * _963;
        float _977 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _979 = _809 + _977;
        float _981 = -_797;
        float _983 = _981 + _939;
        float _985 = -_809;
        float _987 = _985 + _941;
        float _989 = fma(_967, _967, _975);
        float _991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _993 = fma(_979, _979, _989);
        float _995 = sqrt(_993);
        float _997 = _969 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _999 = precise::min(_995, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1001 = _999 * _991;
        float _1003 = _997 * _1001;
        float _1005 = fma(_973, _1003, _767);
        float _1007 = fma(_983, _1003, _797);
        float _1009 = fma(_987, _1003, _809);
        _949 = _1005;
        _951 = _1007;
        _953 = _1009;
    }
    float _1011 = _949;
    float _1013 = _951;
    float _1015 = _953;
    if (_693)
    {
        _889 = 1.0;
    }
    float _1017 = _889;
    float _1019 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1021 = _873 * _1019;
    float _1023 = _1017;
    if (!_693)
    {
        float _1025 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1027 = _1025 * 0.15915493667125701904296875;
        float _1029 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1031 = _1027 * 6.283185482025146484375;
        float _1033 = cos(_1031);
        float _1035 = _1029 * 0.15915493667125701904296875;
        float _1037 = _1027 * 6.283185482025146484375;
        float _1039 = sin(_1037);
        float _1041 = 1.0 / _1033;
        float _1043 = _1035 * 6.283185482025146484375;
        float _1045 = cos(_1043);
        float _1047 = _1039 * _1041;
        float _1049 = _1035 * 6.283185482025146484375;
        float _1051 = sin(_1049);
        float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1055 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1053;
        float _1057 = _1045 * _1047;
        float _1059 = 1.0 / _1057;
        float _1061 = 1.0 / _1055;
        float _1063 = _1051 * _1059;
        float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1067 = fma(_1021, _1063, _1065);
        float _1069 = _1067 * _1061;
        float _1071 = precise::clamp(_1069, 0.0, 1.0);
        _955 = _1027;
        _959 = _1071;
    }
    float _1073 = _955;
    float _1075 = _959;
    if (!_693)
    {
        float _1077 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1079 = _1077 * 0.15915493667125701904296875;
        float _1081 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1083 = _1079 * 6.283185482025146484375;
        float _1085 = cos(_1083);
        float _1087 = _1081 * 0.15915493667125701904296875;
        float _1089 = _1079 * 6.283185482025146484375;
        float _1091 = sin(_1089);
        float _1093 = 1.0 / _1085;
        float _1095 = _1087 * 6.283185482025146484375;
        float _1097 = cos(_1095);
        float _1099 = _1091 * _1093;
        float _1101 = _1087 * 6.283185482025146484375;
        float _1103 = sin(_1101);
        float _1105 = _1097 * _1099;
        float _1107 = 1.0 / _1105;
        float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1111 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1109;
        float _1113 = 1.0 / _1111;
        float _1115 = _1103 * _1107;
        float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1119 = fma(_1021, _1115, _1117);
        float _1121 = _1119 * _1113;
        float _1123 = precise::clamp(_1121, 0.0, 1.0);
        float _1125 = -_1123;
        float _1127 = _1125 + 1.0;
        _1023 = _1127;
    }
    float _1129 = _1023;
    float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1133 = _1011 + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1137 = _1013 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1141 = _1015 + _1139;
    float _1143 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1145 = _1133 * _1133;
    float _1147 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1149 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1143);
    float _1151 = fma(_1137, _1137, _1145);
    float _1153 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1147);
    float _1155 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1149);
    float _1157 = fma(_1141, _1141, _1151);
    float _1159 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1153);
    float _1161 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1163 = rsqrt(_1157);
    float _1165 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1167 = sqrt(_1157);
    float _1169 = _1163 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1171 = _1137 * _1169;
    float _1173 = _1141 * _1169;
    float _1175 = _1171 * _1171;
    float _1177 = _1173 * _1173;
    float _1179 = _1175 + _1177;
    float _1181 = sqrt(_1179);
    bool _1183 = _1181 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1187 = _1181 + _1185;
    float _1189 = _1073;
    float _1191 = _1179;
    float _1193 = _1187;
    float _1195 = _1171;
    float _1197 = _1173;
    float _1199 = _1175;
    float _1201 = _1177;
    if (_1183)
    {
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1189 = _1203;
    }
    float _1205 = _1189;
    if (_1183)
    {
        float _1207 = rsqrt(_1179);
        _1191 = _1207;
    }
    float _1209 = _1191;
    float _1211 = _1209;
    if (_1183)
    {
        float _1213 = _1187 * _1205;
        _1193 = _1213;
    }
    float _1215 = _1193;
    if (_1183)
    {
        float _1217 = _1215 * 0.15915493667125701904296875;
        _891 = _1217;
    }
    float _1219 = _891;
    float _1221 = _869;
    float _1223 = _1219;
    if (_1183)
    {
        float _1225 = _1219 * 6.283185482025146484375;
        float _1227 = sin(_1225);
        _1221 = _1227;
    }
    float _1229 = _1221;
    float _1231 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1233 = precise::max(0.0, _1231);
    float _1235 = _1205;
    float _1237 = _1233;
    if (_1183)
    {
        float _1239 = _1219 * 6.283185482025146484375;
        float _1241 = cos(_1239);
        _1235 = _1241;
    }
    float _1243 = _1235;
    float _1245 = -_1169;
    float _1247 = -_1233;
    float _1249 = fma(_1133, _1245, _1247);
    if (_1183)
    {
        float _1251 = _1249 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1237 = _1251;
    }
    float _1253 = _1237;
    float _1255 = fma(_797, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1257 = _1253;
    float _1259 = _1229;
    if (_1183)
    {
        float _1261 = fma(_1229, _1253, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _893 = _1261;
    }
    float _1263 = _893;
    if (!_1183)
    {
        _1257 = _1249;
    }
    float _1265 = _1257;
    float _1267 = floor(_1255);
    float _1269 = _1265;
    if (_1183)
    {
        float _1271 = _1243 + (-1.0);
        _1259 = _1271;
    }
    float _1273 = _1259;
    if (_1183)
    {
        float _1275 = _1209 * _1263;
        _1223 = _1275;
    }
    float _1277 = _1223;
    if (_1183)
    {
        float _1279 = _1273 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1211 = _1279;
    }
    float _1281 = _1211;
    if (_1183)
    {
        float _1283 = _1171 * _1277;
        _1195 = _1283;
    }
    float _1285 = _1195;
    if (_1183)
    {
        float _1287 = _1173 * _1277;
        _1197 = _1287;
    }
    float _1289 = _1197;
    float _1291 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1183)
    {
        float _1293 = fma(_1249, _1243, _1281);
        _1269 = _1293;
    }
    float _1295 = _1269;
    if (_1183)
    {
        float _1297 = _1285 * _1285;
        _1199 = _1297;
    }
    float _1299 = _1199;
    if (_1183)
    {
        float _1301 = _1289 * _1289;
        _1201 = _1301;
    }
    float _1303 = _1201;
    float _1305 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1291);
    float _1307 = fma(_1295, _1295, _1299);
    float _1309 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1305);
    float _1311 = _1307 + _1303;
    float _1313 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1315 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1317 = _1309 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1319 = fma(_809, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1321 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1323 = fma(_1167, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1321);
    float _1325 = precise::clamp(_1323, 0.0, 1.0);
    float _1327 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1315);
    float _1329 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1331 = rsqrt(_1311);
    float _1333 = -_1325;
    float _1335 = _1333 + 1.0;
    float _1337 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1327);
    float _1339 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1341 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1343 = _1337 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1345 = -_1339;
    float _1347 = fma(_1345, _1313, 1.0);
    float _1349 = abs(_1335);
    float _1351 = log2(_1349);
    float _1353 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1329);
    float _1355 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1341);
    float _1357 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1353);
    float _1359 = _1331 * _1285;
    float _1361 = _1331 * _1289;
    float _1363 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1357);
    float _1365 = _1331 * _1295;
    float _1367 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1369 = floor(_1319);
    float _1371 = -_1367;
    float _1373 = fma(_1365, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1371);
    float _1375 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1377 = -_1361;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1373);
    float _1381 = -_1267;
    float _1383 = _1255 + _1381;
    float _1385 = log2(_1347);
    float _1387 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1389 = fma(_1379, -0.5, 0.5);
    float _1391 = fma(_1379, 0.5, 0.5);
    float _1393 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1387);
    float _1395 = -_1369;
    float _1397 = _1319 + _1395;
    float _1399 = 1.0 / _1363;
    float _1401 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1393);
    float _1403 = fma(_1391, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1405 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1355);
    float _1407 = _1365 + 1.0;
    float _1409 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1401);
    float _1411 = fma(_1391, _1403, -0.212114393711090087890625);
    float _1413 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1405);
    float _1415 = exp2(_1375);
    float _1417 = _1385 * 0.693147182464599609375;
    float _1419 = fma(_1391, _1411, 1.570728778839111328125);
    float _1421 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1423 = sqrt(_1389);
    float _1425 = _1409 * _1399;
    float _1427 = -_1365;
    float _1429 = fma(_1415, _1407, _1427);
    float _1431 = _1413 * _1399;
    float _1433 = fma(_1425, 0.5, 0.5);
    float _1435 = fma(_1429, 0.5, 0.5);
    float _1437 = fma(_1431, -0.5, 0.5);
    float _1439 = _1423 * 0.636619746685028076171875;
    float2 _4740 = float2(_1383, _1397);
    float _1441 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4740, float2(0.0), isnan(_4740)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4740, float2(0.0), isnan(_4740)), level(0.0)).x;
    float3 _4751 = float3(_1433, _1437, _1421);
    float _1443 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4751, float3(0.0), isnan(_4751)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4751, float3(0.0), isnan(_4751)), level(0.0)).x;
    float _1445 = -_1419;
    float _1447 = fma(_1439, _1445, 1.0);
    float3 _4767 = float3(_1433, _1437, _1421);
    float4 _1450 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4767, float3(0.0), isnan(_4767)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4767, float3(0.0), isnan(_4767)), level(0.0)).xyzw;
    float _1452 = _1450.x;
    float _1454 = _1450.y;
    float _1456 = _1450.z;
    float _1458 = _1450.w;
    float2 _4783 = float2(_1447, _1435);
    float3 _1462 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4783, float2(0.0), isnan(_4783)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4783, float2(0.0), isnan(_4783)), level(0.0)).xyz;
    float _1464 = _1462.x;
    float _1466 = _1462.y;
    float _1468 = _1462.z;
    float _1470 = float(uint(_417));
    float _1472 = trunc(_545);
    int _1474 = int(_1472);
    float _1476 = _569 * _163;
    int _1478 = abs(_333);
    float _1480 = -_549;
    float _1482 = _1480 + 1.0;
    bool _1484 = _305 > 0.5;
    float _1486 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1488 = _303 > 0.5;
    float _1490 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1492 = 1.0 / _1470;
    int _1494 = ~_417;
    int _1496 = _1494 + 1;
    float _1498 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1490);
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1502 = _1500 != 0;
    float _1504 = trunc(_1476);
    int _1506 = int(_1504);
    float _1508 = float(uint(_1474));
    float _1510 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1498);
    bool _1512 = !_1502;
    float _1514 = _1512 ? 7.345489978790283203125 : 1.0;
    float _1516 = exp2(_1486);
    int _1518 = as_type<int>(_1492) + (-2);
    float _1520 = _1514 * _303;
    bool _1522 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1524 = isnan(_301);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1530 = _1526 || _1528;
    float _1532 = float(_1530);
    float _1534 = as_type<float>(_1518) * _1508;
    int _1536 = ~_417;
    int _1538 = _1536 + 1;
    float _1540 = floor(_1520);
    float _1542 = trunc(_1534);
    float _1544 = precise::max(_1542, 0.0);
    uint _1547 = uint(_1544);
    float _1549 = -_1516;
    float _1551 = _1549 + 1.0;
    float _1553 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1555 = _1496 * int(_1547);
    int _1557 = _1555 + _1474;
    float _1559 = float(_1474);
    float _1561 = float(uint(_1557));
    float _1563 = as_type<float>(_1518) * _1561;
    float _1565 = trunc(_1563);
    float _1567 = precise::max(_1565, 0.0);
    uint _1569 = uint(_1567);
    int _1571 = int(_1547) + int(_1569);
    bool _1573 = _1559 >= _557;
    bool _1575 = isnan(_1559);
    bool _1577 = _1573 || _1575;
    bool _1579 = isnan(_557);
    bool _1581 = _1577 || _1579;
    float _1583 = float(_1581);
    float _1585 = -_1540;
    float _1587 = _1520 + _1585;
    int _1589 = _1538 * _1571;
    int _1591 = _1589 + _1474;
    float _1593 = trunc(_1583);
    int _1595 = int(_1593);
    bool _1597 = uint(_1591) >= uint(_417);
    bool _1599 = !_1597;
    int _1601 = _1599 ? 0 : (-1);
    bool _1603 = _417 == 0;
    int _1605 = ~_1571;
    int _1607 = _1605 + _1601;
    int _1609 = _1607 + 1;
    float _1611 = _1587 * _557;
    int _1613 = _417 * _1609;
    int _1615 = _1613 + _1474;
    int _1617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1619 = _1617 != 0;
    float _1621 = trunc(_1611);
    int _1623 = int(_1621);
    int _1625 = ~_1595;
    int _1627 = _1625 + 1;
    int _1629 = _1627 + 1;
    bool _1631 = !_1603;
    int _1633 = _1631 ? _1615 : (-1);
    bool _1635 = !_1619;
    int _1637 = _1635 ? 0 : 1;
    int _1639 = _417 + (-1);
    int _1641 = _1633 * _1629;
    int _1643 = abs(_1637);
    float _1645 = -_1532;
    float _1647 = _1645 + 1.0;
    int _1649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1651 = _1649 != 0;
    int _1653 = _1595 * _1639;
    int _1655 = _1653 + _1641;
    int _1657 = abs(_339);
    int _1659 = _1655 * _1478;
    int _1661 = abs(_399);
    float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1665 = _301 + _1663;
    bool _1667 = !_1651;
    int _1669 = _1667 ? 0 : 1;
    int _1671 = _1623 * _1643;
    int _1673 = _1671 + _1474;
    int _1675 = abs(_1669);
    int _1677 = _1506 * _1657;
    int _1679 = _1677 + _1659;
    int _1681 = _1673 * _1661;
    int _1683 = _1681 + _1679;
    int _1685 = ~_417;
    int _1687 = _1685 + 1;
    int _1689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1691 = _1689 != 0;
    int _1693 = _1623 * _1675;
    int _1695 = _1693 + _1683;
    float _1697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1699 = _1697 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1701 = 1.0 / _1699;
    float _1703 = float(uint(_1695));
    float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1711 = _1709 != 0;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1715 = _1713 != 0;
    float _1717 = as_type<float>(_1518) * _1703;
    float _1719 = float(uint(_1673));
    float _1721 = 1.0 / _1707;
    int _1723 = ~_417;
    int _1725 = _1723 + 1;
    float _1727 = trunc(_1717);
    float _1729 = precise::max(_1727, 0.0);
    uint _1731 = uint(_1729);
    float _1733 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1733;
    float _1737 = _1735 * _1721;
    float _1739 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1741 = _301 + _1739;
    int _1743 = _1687 * int(_1731);
    int _1745 = _1743 + _1695;
    float _1747 = float(uint(_1745));
    float _1749 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1751 = _1749 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1753 = as_type<float>(_1518) * _1747;
    float _1755 = _1751 * _1701;
    bool _1757 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1759 = isnan(_301);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1765 = _1761 || _1763;
    float _1767 = float(_1765);
    float _1769 = trunc(_1753);
    float _1771 = precise::max(_1769, 0.0);
    uint _1773 = uint(_1771);
    bool _1775 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1777 = isnan(_301);
    bool _1779 = _1775 || _1777;
    bool _1781 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1783 = _1779 || _1781;
    float _1785 = float(_1783);
    float _1787 = -_1767;
    float _1789 = _1787 + 1.0;
    float _1791 = _1785 * _1647;
    float _1793 = _1532 * _1789;
    float _1795 = fma(_1737, _1741, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1797 = as_type<float>(_1518) * _1719;
    float _1799 = fma(_1755, _1665, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1801 = -_1785;
    float _1803 = _1801 + 1.0;
    float _1805 = _1795 * _1791;
    int _1807 = ~_417;
    int _1809 = _1807 + 1;
    float _1811 = trunc(_1797);
    float _1813 = precise::max(_1811, 0.0);
    uint _1815 = uint(_1813);
    int _1817 = int(_1731) + int(_1773);
    float _1819 = fma(_1803, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1805);
    float _1821 = -_179;
    int _1823 = _1488 ? as_type<int>(_1821) : as_type<int>(_179);
    float _1825 = -_183;
    int _1827 = _1484 ? as_type<int>(_1825) : as_type<int>(_183);
    int _1829 = _1809 * _1817;
    int _1831 = _1829 + _1695;
    bool _1833 = !_1711;
    float _1835 = _1833 ? _179 : as_type<float>(_1823);
    float _1837 = fma(_1799, _1793, _1819);
    bool _1839 = !_1715;
    float _1841 = _1839 ? _183 : as_type<float>(_1827);
    bool _1843 = uint(_1831) >= uint(_417);
    float _1845 = _1835 + 0.5;
    float _1847 = _1841 + (-0.5);
    bool _1849 = !_1843;
    int _1851 = _1849 ? 0 : (-1);
    float _1853 = fma(_1845, (*spvDescriptorSet0.vp_c9)._m0[80].x, _529);
    int _1855 = _1725 * int(_1815);
    int _1857 = _1855 + _1673;
    float _1859 = -_1847;
    float _1861 = -_371;
    float _1863 = fma(_1859, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1861);
    int _1865 = ~_1817;
    int _1867 = _1865 + _1851;
    int _1869 = _1867 + 1;
    float _1871 = -_1482;
    float _1873 = fma(_1835, _1871, _1853);
    float _1875 = -_553;
    float _1877 = _1875 + 1.0;
    float _1879 = abs(_1021);
    float _1881 = log2(_1879);
    float _1883 = float(uint(_1857));
    int _1885 = _417 * _1869;
    int _1887 = _1885 + _1695;
    float _1889 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1837);
    float _1891 = fma(_1841, _1877, _1863);
    float _1893 = as_type<float>(_1518) * _1883;
    float _1895 = _1889 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1897 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1899 = !_1603;
    int _1901 = _1899 ? _1887 : (-1);
    float _1903 = trunc(_1893);
    float _1905 = precise::max(_1903, 0.0);
    uint _1907 = uint(_1905);
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1913 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _1915 = _1901 >> 31;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1919 = _1897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1921 = _1909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1923 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1925 = exp2(_1913);
    out.m_70.x = _1873;
    out.m_70.y = _1891;
    out.m_72.x = _1919;
    out.m_72.y = _1921;
    out.m_72.z = _1923;
    out.m_72.w = _1917;
    int _1927 = _1915 & 3;
    float _1929 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1931 = ~_417;
    int _1933 = _1931 + 1;
    float _1935 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1937 = _1901 + _1927;
    float _1939 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1941 = int(_1815) + int(_1907);
    float _1943 = _753 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1945 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1947 = _1937 >> 2;
    float _1949 = _1935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1951 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1953 = _753 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1955 = _753 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1957 = fma(_1925, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1959 = precise::clamp(_1957, 0.0, 1.0);
    int _1961 = _1947 << 4;
    int _1963 = _1961 + 368;
    int _1965 = _1933 * _1941;
    int _1967 = _1965 + _1673;
    float _1969 = -_737;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1953);
    float _1973 = -_737;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1955);
    float _1977 = -_737;
    float _1979 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1943);
    float _1981 = _769 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_74.x = _1945;
    out.m_74.y = _1949;
    out.m_74.z = _1951;
    out.m_74.w = _1895;
    float _1983 = _769 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1985 = uint(_1967) >= uint(_417);
    float _1987 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1975);
    uint _1989 = uint(int(uint(_1963) >> uint(2)));
    uint _1991 = uint(int(uint(int(_1989)) >> uint(2)));
    int _1993 = int(_1989) & 3;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[int(_1991)][_1993];
    int _1997 = int(_1989) + 1;
    uint _1999 = uint(int(uint(_1997) >> uint(2)));
    int _2001 = _1997 & 3;
    float _2003 = (*spvDescriptorSet0.vp_c9)._m0[int(_1999)][_2001];
    float _2005 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1971);
    float _2007 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1979);
    float _2009 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1981);
    float _2011 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1983);
    int _2013 = _1901 & 3;
    bool _2015 = _2013 != 0;
    float _2017 = _777 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2019 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2009);
    bool _2021 = _1021 <= 8000.0;
    bool _2023 = isnan(_1021);
    bool _2025 = _2021 || _2023;
    bool _2027 = isnan(8000.0);
    bool _2029 = _2025 || _2027;
    float _2031 = float(_2029);
    float _2033 = -_1441;
    float _2035 = _2033 + 1.0;
    float _2037 = _769 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2039 = _1901 & 3;
    bool _2041 = _2039 != 0;
    float _2043 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2017);
    float _2045 = _1553 * _1443;
    float _2047 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2037);
    float _2049 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2051 = _777 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2053 = uint(_2039) > 1u;
    float _2055 = _777 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2057 = _2015 ? 0 : 1;
    float _2059 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2051);
    float _2061 = _2049 * _2005;
    int _2063 = _1963 + 8;
    uint _2065 = uint(int(uint(_2063) >> uint(2)));
    uint _2067 = uint(int(uint(int(_2065)) >> uint(2)));
    int _2069 = int(_2065) & 3;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[int(_2067)][_2069];
    int _2073 = int(_2065) + 1;
    uint _2075 = uint(int(uint(_2073) >> uint(2)));
    int _2077 = _2073 & 3;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[int(_2075)][_2077];
    float _2081 = _2049 * _2007;
    int _2083 = ~_2057;
    int _2085 = _2083 + 1;
    int _2087 = _2085 + 1;
    float _2089 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2055);
    bool _2091 = uint(_2039) >= 2u;
    float _2093 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2011);
    float _2095 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2047);
    bool _2097 = !_1985;
    int _2099 = _2097 ? 0 : (-1);
    float _2101 = _2049 * _1987;
    int _2103 = _2087;
    if (!_2053)
    {
        int _2105 = ~_2057;
        int _2107 = _2105 + 1;
        _2103 = _2107;
    }
    int _2109 = _2103;
    float _2111 = _1959 * _1959;
    bool _2113 = _2039 != 3;
    float _2115 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2059);
    int _2117 = _2091 ? 0 : 1;
    float _2119 = _1458 * _2045;
    int _2121 = abs(_2109);
    float _2123 = -_1553;
    float _2125 = _2123 + 1.0;
    bool _2127 = !_2041;
    int _2129 = _2127 ? 0 : 1;
    int _2131 = ~_2117;
    int _2133 = _2131 + 1;
    int _2135 = _2133 + 1;
    float _2137 = _1468 * _2045;
    bool _2139 = _2039 != 3;
    float _2141 = _1458 * _2125;
    int _2143 = ~_2121;
    int _2145 = _2143 + 1;
    int _2147 = _2145 + 1;
    float _2149 = fma(_1458, _2137, _1456);
    int _2151 = _2135;
    if (_2113)
    {
        int _2153 = ~_2117;
        int _2155 = _2153 + 1;
        _2151 = _2155;
    }
    int _2157 = _2151;
    bool _2159 = !_2139;
    int _2161 = _2159 ? 0 : (-1);
    int _2163 = _2147 * as_type<int>(_2003);
    int _2165 = abs(_2129);
    int _2167 = abs(_2157);
    bool _2169 = !_1691;
    int _2171 = _2169 ? 0 : 1;
    int _2173 = abs(_2161);
    int _2175 = ~_2165;
    int _2177 = _2175 + 1;
    int _2179 = _2177 + 1;
    int _2181 = ~_1941;
    int _2183 = _2181 + _2099;
    int _2185 = _2183 + 1;
    float _2187 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2189 = abs(_2171);
    int _2191 = _2179 * as_type<int>(_1995);
    int _2193 = _2191 + _2163;
    int _2195 = _417 * _2185;
    int _2197 = _2195 + _1673;
    int _2199 = ~_2167;
    int _2201 = _2199 + 1;
    int _2203 = _2201 + 1;
    float _2205 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1510);
    float _2207 = fma(_2187, _2093, _2101);
    int _2209 = ~_2173;
    int _2211 = _2209 + 1;
    int _2213 = _2211 + 1;
    int _2215 = _2203 * as_type<int>(_2071);
    int _2217 = _2215 + _2193;
    float _2219 = _1409 + _1363;
    int _2221 = ~_2189;
    int _2223 = _2221 + 1;
    int _2225 = _2223 + 1;
    int _2227 = _2213 * as_type<int>(_2079);
    int _2229 = _2227 + _2217;
    bool _2231 = !_1603;
    int _2233 = _2231 ? _2197 : (-1);
    float _2235 = fma(_1959, -2.0, 3.0);
    float _2237 = _2205 + _1363;
    int _2239 = _2229 * _2225;
    float _2241 = _2111 * _2235;
    float _2243 = _2237 * 0.5;
    int _2245 = _2233 * _2189;
    int _2247 = _2245 + _2239;
    float _2249 = _1363 * 0.5;
    float _2251 = -_2241;
    float _2253 = _2251 + 1.0;
    float _2255 = in.m_76.x;
    float _2257 = _2219 * 0.5;
    float _2259 = fma(_1413, -0.5, _2249);
    float _2261 = fma(_2253, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2241);
    float _2263 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2043);
    float _2265 = fma(_2187, _2019, _2061);
    float _2267 = _2031 * _2261;
    float _2269 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2089);
    float _2271 = fma(_2187, _2095, _2081);
    out.m_78.x = _2257;
    out.m_78.y = _2259;
    out.m_78.z = _2243;
    out.m_78.w = _1363;
    float _2273 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2275 = _2263 + _2207;
    float _2277 = fma(_1464, _2119, _1452);
    float _2279 = _2115 + _2265;
    float _2281 = _2035 * _2273;
    float _2283 = precise::clamp(_2281, 0.0, 1.0);
    float _2285 = _2269 + _2271;
    float _2287 = fma(_1466, _2119, _1454);
    out.gl_Position.x = _1409;
    out.gl_Position.y = _1413;
    out.gl_Position.z = _2205;
    out.gl_Position.w = _1363;
    float _2289 = -_2283;
    float _2291 = fma(_2289, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2293 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2295 = isnan(_1167);
    bool _2297 = _2293 || _2295;
    bool _2299 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2301 = _2297 || _2299;
    out.m_80.x = _2277;
    out.m_80.y = _2287;
    out.m_80.z = _2149;
    out.m_80.w = _2141;
    float _2303 = float(_2247);
    float _2305 = _2291 * _2255;
    out.m_82.x = _2279;
    out.m_82.y = _2275;
    out.m_82.z = _2285;
    float _2307 = _2305 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_84.x = _2303;
    float _2309 = _2243;
    float _2311 = _2259;
    float _2313 = _2257;
    float _2315 = _2305;
    float _2317 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2301)
    {
        _2309 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2319 = _2309;
    out.m_86.x = _2307;
    float _2321 = _2319;
    float _2323 = _2319;
    if (!_2301)
    {
        _2311 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2325 = _2311;
    float _2327 = _2325;
    float _2329 = _2325;
    if (!_2301)
    {
        _2313 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2331 = _2313;
    float _2333 = _1075 * _1129;
    float _2335 = _2333;
    float _2337 = _2331;
    float _2339 = _2331;
    if (!_2301)
    {
        _2315 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2341 = _2315;
    float _2343 = _2341;
    float _2345 = _2341;
    if (!_2301)
    {
        _2317 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2347 = _2317;
    float _2349 = _2333 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2351 = _2347;
    float _2353 = _2347;
    if (!_2301)
    {
        _2335 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2355 = _2335;
    bool _2357 = !_2301;
    float _2359 = _2355;
    float _2361 = _2355;
    if (!_2357)
    {
        bool _2363 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2365 = isnan(_1167);
        bool _2367 = _2363 || _2365;
        bool _2369 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2371 = _2367 || _2369;
        if (!_2371)
        {
            float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2375 = _1167 + _2373;
            float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2379 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2377;
            float _2381 = 1.0 / _2379;
            float _2383 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2385 = _2383 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2389 = _2387 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2403 = _2375 * _2381;
            float _2405 = precise::clamp(_2403, 0.0, 1.0);
            float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2411 = fma(_2405, _2385, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2413 = fma(_2405, _2409, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2415 = fma(_2405, _2389, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2417 = fma(_2405, _2393, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2419 = fma(_2405, _2397, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2421 = fma(_2405, _2401, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2329 = _2413;
            _2353 = _2419;
            _2323 = _2411;
            _2345 = _2417;
            _2339 = _2415;
            _2361 = _2421;
            _2423 = true;
        }
        else
        {
            bool _2425 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2427 = isnan(_1167);
            bool _2429 = _2425 || _2427;
            bool _2431 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2433 = _2429 || _2431;
            if (!_2433)
            {
                _2321 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2435 = _2321;
            _2323 = _2435;
            if (!_2433)
            {
                _2327 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2437 = _2327;
            _2329 = _2437;
            if (!_2433)
            {
                _2337 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2439 = _2337;
            _2339 = _2439;
            if (!_2433)
            {
                _2343 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2441 = _2343;
            _2345 = _2441;
            if (!_2433)
            {
                _2351 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2443 = _2351;
            _2353 = _2443;
            if (!_2433)
            {
                _2359 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2445 = _2359;
            bool _2447 = !_2433;
            _2361 = _2445;
            if (!_2447)
            {
                bool _2449 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2451 = isnan(_1167);
                bool _2453 = _2449 || _2451;
                bool _2455 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2457 = _2453 || _2455;
                if (!_2457)
                {
                    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2461 = _1167 + _2459;
                    float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2465 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2463;
                    float _2467 = 1.0 / _2465;
                    float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2489 = _2461 * _2467;
                    float _2491 = precise::clamp(_2489, 0.0, 1.0);
                    float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2497 = fma(_2491, _2471, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2499 = fma(_2491, _2495, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2501 = fma(_2491, _2475, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2503 = fma(_2491, _2479, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2505 = fma(_2491, _2483, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2507 = fma(_2491, _2487, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2329 = _2499;
                    _2353 = _2505;
                    _2323 = _2497;
                    _2345 = _2503;
                    _2339 = _2501;
                    _2361 = _2507;
                    _2423 = true;
                }
                else
                {
                    _2329 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2353 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2323 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2345 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2339 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2361 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2423 = false;
    float _2509 = _2329;
    float _2511 = _2353;
    float _2513 = _2323;
    float _2515 = _2345;
    float _2517 = _2339;
    float _2519 = _2361;
    float _2521 = _2349 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2523 = fma(_2275, -0.5, 0.5);
    float _2525 = precise::clamp(_2523, 0.0, 1.0);
    float _2527 = -_2509;
    float _2529 = _2527 + _2511;
    float _2531 = -_2513;
    float _2533 = _2531 + _2515;
    out.m_53.x = _2521;
    float _2535 = -_2517;
    float _2537 = _2535 + _2519;
    float _2539 = fma(_2525, _2529, _2509);
    float _2541 = fma(_2525, _2533, _2513);
    bool _2543 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2545 = _2539 * 0.586610972881317138671875;
    float _2547 = fma(_2525, _2537, _2517);
    out.m_88.x = 0.0;
    bool _2549 = _1075 > 0.0;
    bool _2551 = isnan(_1075);
    bool _2553 = _2549 || _2551;
    bool _2555 = isnan(0.0);
    bool _2557 = _2553 || _2555;
    float _2559 = fma(_2541, 0.298911988735198974609375, _2545);
    bool _2561 = _1129 <= 0.0;
    bool _2563 = !_2557;
    bool _2565 = _2561 || _2563;
    float _2567 = fma(_2547, 0.114477999508380889892578125, _2559);
    float _2569 = -_2567;
    float _2571 = _2541 + _2569;
    float _2573 = -_2567;
    float _2575 = _2539 + _2573;
    float _2577 = -_2567;
    float _2579 = _2547 + _2577;
    float _2581 = fma(_2571, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2567);
    float _2583 = fma(_2575, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2567);
    float _2585 = fma(_2579, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2567);
    bool _2587 = !_2543;
    if (!_2587)
    {
        float _2589 = -_1011;
        float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2593 = -_1013;
        float _2595 = _2593 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2597 = -_1015;
        float _2599 = _2597 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2601 = _2591 * _2591;
        float _2603 = fma(_2595, _2595, _2601);
        float _2605 = fma(_2599, _2599, _2603);
        float _2607 = sqrt(_2605);
        float _2609 = rsqrt(_2605);
        float _2611 = -_2607;
        float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2615 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2617 = precise::clamp(_2615, 0.0, 1.0);
        float _2619 = _2595 * _2609;
        float _2621 = _2591 * _2609;
        float _2623 = abs(_2617);
        float _2625 = log2(_2623);
        float _2627 = _2599 * _2609;
        float _2629 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2631 = _2275 * _2621;
        float _2633 = -_2621;
        float _2635 = -_2629;
        float _2637 = fma(_2633, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2635);
        float _2639 = fma(_2279, _2619, _2631);
        float _2641 = -_2627;
        float _2643 = fma(_2641, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2637);
        float _2645 = fma(_2285, _2627, _2639);
        float _2647 = precise::clamp(_2645, 0.0, 1.0);
        float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2651 = _2643 + _2649;
        float _2653 = _2625 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2655 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2657 = precise::clamp(_2655, 0.0, 1.0);
        float _2659 = exp2(_2653);
        float _2661 = _2659 * _2657;
        float _2663 = _2647 * _2661;
        float _2665 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2667 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2669 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2665;
        out.m_88.y = _2667;
        out.m_88.z = _2669;
    }
    out.m_90.x = _2581;
    out.m_90.y = _2583;
    out.m_90.z = _2585;
    if (!_2565)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2671 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2671;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2423 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
    float _106 = in.m_48.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_111);
    float _125 = _115;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _121;
    if (!_119)
    {
        out.m_53.x = 0.0;
    }
    int _129 = 0;
    if (!_119)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2740 = as_type<float>(_133);
        out.gl_Position.z = _2740;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _137 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_106);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = float(_111);
    bool _149 = _115 >= _147;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    if (_153)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _123;
    if (_153)
    {
        out.m_53.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _135 = as_type<int>(_157);
    }
    int _159 = _135;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2795 = as_type<float>(_159);
        out.gl_Position.z = _2795;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = 1.0 / _147;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _115 * _163;
    int _169 = as_type<int>(_161) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_161) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_165;
    float _187 = _167;
    float _205;
    if (!_185)
    {
        float _189 = in.m_58.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        _205 = _167;
    }
    _207 = false;
    float _209 = _205;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    bool _215 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _217 = isnan(_209);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    bool _231 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _233 = isnan(_209);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = 1.0 / _229;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _245;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _251 = _213 * _243;
    float _253 = -_225;
    float _255 = _253 + 1.0;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _257;
    float _261 = fma(_247, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _263 = _241 * _255;
    float _265 = fma(_259, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _267 = -_241;
    float _269 = _267 + 1.0;
    float _271 = _261 * _263;
    float _273 = _265 * _263;
    float _275 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].x, _271);
    float _277 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].y, _273);
    float _279 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].x, _275);
    float _281 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].y, _277);
    bool _283 = !_249;
    if (!_283)
    {
        float _285 = in.m_58.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _187 = _299;
    }
    float _301 = _187;
    float _303 = in.m_58.x;
    float _305 = in.m_58.y;
    float _307 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _309 = log2(_307);
    float _311 = in.m_58.z;
    int _313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _315 = _313 != 0;
    int _317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _319 = _317 != 0;
    int _321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _323 = _321 != 0;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _327 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _329 = int(_327);
    bool _331 = !_319;
    int _333 = _331 ? 0 : 1;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _337 = !_315;
    int _339 = _337 ? 0 : 1;
    float _341 = in.m_60.x;
    float _343 = in.m_60.y;
    float _345 = in.m_60.z;
    float _347 = in.m_60.w;
    float _349 = _303 * 2.0;
    float _351 = _305 * 2.0;
    float _353 = _305 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _355 = float(_329);
    float _357 = _311 * 2.0;
    float _359 = floor(_349);
    float _361 = -_325;
    float _363 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[77].x, _361);
    float _365 = fma(_353, -2.0, _335);
    float _367 = _305 + _303;
    float _369 = _311 + _303;
    float _371 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _365);
    float _373 = _367 + (-1.0);
    float _375 = floor(_357);
    float _377 = _369 + (-1.0);
    float _379 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _381 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _383 = _359 > 0.0;
    float _385 = floor(_351);
    bool _387 = _359 >= 0.0;
    bool _389 = isnan(_359);
    bool _391 = _387 || _389;
    bool _393 = isnan(0.0);
    bool _395 = _391 || _393;
    bool _397 = !_323;
    int _399 = _397 ? 0 : 1;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _403 = _401 != 0;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _407 = _405 != 0;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _411 = _409 != 0;
    bool _413 = _375 > 0.0;
    float _415 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _417 = int(_415);
    bool _419 = _375 >= 0.0;
    bool _421 = isnan(_375);
    bool _423 = _419 || _421;
    bool _425 = isnan(0.0);
    bool _427 = _423 || _425;
    bool _429 = !_403;
    int _431 = _429 ? 0 : 1;
    int _433 = _427 ? 0 : 1;
    int _435 = abs(_431);
    float _437 = 1.0 / _355;
    int _439 = ~_433;
    int _441 = _439 + 1;
    int _443 = _441 + 1;
    int _445 = _395 ? 0 : 1;
    int _447 = _443;
    if (!_413)
    {
        int _449 = ~_433;
        int _451 = _449 + 1;
        _447 = _451;
    }
    int _453 = _447;
    float _455 = _309 * _115;
    float _457 = float(_435);
    float _459 = float(_453);
    float _461 = exp2(_455);
    int _463 = ~_445;
    int _465 = _463 + 1;
    int _467 = _465 + 1;
    bool _469 = _385 > 0.0;
    float _471 = _457 * _459;
    bool _473 = _385 >= 0.0;
    bool _475 = isnan(_385);
    bool _477 = _473 || _475;
    bool _479 = isnan(0.0);
    bool _481 = _477 || _479;
    int _483 = _467;
    if (!_383)
    {
        int _485 = ~_445;
        int _487 = _485 + 1;
        _483 = _487;
    }
    int _489 = _483;
    float _491 = in.m_62.x;
    float _493 = in.m_62.y;
    float _495 = in.m_62.z;
    bool _497 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _499 = isnan(1.0);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _505 = _501 || _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _509 = 1.0 + _507;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _513 = !_407;
    int _515 = _513 ? 0 : 1;
    float _517 = 1.0 / _509;
    float _519 = -_461;
    float _521 = _519 + 1.0;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _525 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[78].z, _511);
    float _527 = -_115;
    float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[76].x, _363);
    int _531 = abs(_515);
    float _533 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[78].w, _523);
    bool _535 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _537 = isnan(0.0);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _543 = _539 || _541;
    float _545 = _437 * _115;
    int _547 = _481 ? 0 : 1;
    float _549 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _525);
    float _551 = float(_489);
    float _553 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _533);
    float _555 = float(_531);
    float _557 = float(_417);
    float _559 = _543 ? _521 : 0.0;
    float _561 = _555 * _551;
    int _563 = ~_547;
    int _565 = _563 + 1;
    int _567 = _565 + 1;
    float _569 = _557 * _115;
    int _571 = _567;
    if (!_469)
    {
        int _573 = ~_547;
        int _575 = _573 + 1;
        _571 = _575;
    }
    int _577 = _571;
    float _579 = _471 * (-2.0);
    bool _581 = !_411;
    int _583 = _581 ? 0 : 1;
    if (_505)
    {
        float _585 = _559 * _517;
        _125 = _585;
    }
    float _587 = _125;
    float _589 = _303 + (-0.5);
    float _591 = fma(_579, _491, _491);
    int _593 = abs(_583);
    float _595 = fma(_379, _579, _379);
    float _597 = _305 + _311;
    float _599 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[196].x, _591);
    float _601 = _561 * (-2.0);
    float _603 = _597 + (-1.0);
    float _605 = float(_577);
    float _607 = fma(_595, _587, _599);
    float _609 = float(_593);
    float _611 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _613 = _305 + (-0.5);
    float _615 = fma(_601, _493, _493);
    float _617 = _607 * 0.15915493667125701904296875;
    float _619 = _609 * _605;
    float _621 = fma(_611, _601, _611);
    float _623 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[196].y, _615);
    float _625 = in.m_46.x;
    float _627 = in.m_46.y;
    float _629 = in.m_46.z;
    float _631 = _619 * (-2.0);
    float _633 = _617 * 6.283185482025146484375;
    float _635 = sin(_633);
    float _637 = fma(_621, _587, _623);
    float _639 = in.m_64.x;
    float _641 = in.m_64.y;
    float _643 = in.m_64.z;
    float _645 = in.m_64.w;
    float _647 = fma(_631, _495, _495);
    float _649 = _311 + (-0.5);
    float _651 = fma(_381, _631, _381);
    float _653 = in.m_66.x;
    float _655 = in.m_66.y;
    float _657 = _637 * 0.15915493667125701904296875;
    float _659 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[196].z, _647);
    float _661 = _617 * 6.283185482025146484375;
    float _663 = cos(_661);
    float _665 = in.m_68.x;
    float _667 = in.m_68.y;
    float _669 = in.m_68.z;
    float _671 = in.m_68.w;
    bool _673 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _675 = isnan(0.5);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _681 = _677 || _679;
    float _683 = fma(_651, _587, _659);
    bool _685 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _687 = isnan(0.5);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _693 = _689 || _691;
    float _695 = _683 * 0.15915493667125701904296875;
    float _697 = _657 * 6.283185482025146484375;
    float _699 = sin(_697);
    float _701 = _627 * _343;
    float _703 = _657 * 6.283185482025146484375;
    float _705 = cos(_703);
    float _707 = _627 * _641;
    float _709 = fma(_625, _341, _701);
    float _711 = _279 * _653;
    float _713 = fma(_625, _639, _707);
    float _715 = _281 * _655;
    float _717 = _695 * 6.283185482025146484375;
    float _719 = cos(_717);
    float _721 = _627 * _667;
    float _723 = fma(_629, _643, _713);
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _727 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _729 = fma(_625, _665, _721);
    float _731 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _733 = _711 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _735 = _695 * 6.283185482025146484375;
    float _737 = sin(_735);
    float _739 = fma(_629, _669, _729);
    float _741 = fma(_629, _345, _709);
    float _743 = _727 * _725;
    float _745 = _635 * _699;
    float _747 = _663 * _705;
    float _749 = _733 * _731;
    float _751 = _635 * _705;
    float _753 = _663 * _719;
    float _755 = _635 * _719;
    float _757 = _705 * _719;
    float _759 = _699 * _719;
    float _761 = _663 * _699;
    float _763 = _753 * _743;
    float _765 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _767 = _739 + _671;
    float _769 = fma(_737, _747, _745);
    float _771 = -_743;
    float _773 = _737 * _771;
    float _775 = -_751;
    float _777 = fma(_737, _761, _775);
    float _779 = -_761;
    float _781 = fma(_737, _751, _779);
    float _783 = fma(_769, _749, _763);
    float _785 = _755 * _743;
    float _787 = fma(_757, _749, _773);
    float _789 = fma(_737, _745, _747);
    float _791 = fma(_777, _765, _783);
    float _793 = fma(_781, _749, _785);
    float _795 = fma(_759, _765, _787);
    float _797 = _723 + _645;
    float _799 = _791 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _801 = fma(_789, _765, _793);
    float _803 = _791 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _805 = _767 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _807 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[26].x, _799);
    float _809 = _741 + _347;
    float _811 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[24].x, _803);
    float _813 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[11].x, _805);
    float _815 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[26].z, _807);
    float _817 = _767 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _819 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[24].z, _811);
    float _821 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[11].z, _813);
    float _823 = _815 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _825 = _819 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _827 = _821 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _829 = _809 + _823;
    float _831 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[10].x, _817);
    float _833 = _797 + _825;
    float _835 = 1.0 / _827;
    float _837 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _839 = _829 + _837;
    float _841 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[10].z, _831);
    float _843 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _845 = _833 + _843;
    float _847 = _839 * _839;
    float _849 = _841 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _851 = fma(_845, _845, _847);
    float _853 = _849 + _827;
    float _855 = _791 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _857 = sqrt(_851);
    float _859 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[25].x, _855);
    float _861 = _853 * _835;
    float _863 = _861 * 0.5;
    float _865 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[25].z, _859);
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _869 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[30].w, _867);
    float _871 = _865 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _873 = 1.0 / _869;
    float _875 = _767 + _871;
    bool _877 = _857 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _879 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _881 = _833;
    float _883 = _829;
    float _885 = _851;
    float _887 = _857;
    float _889 = _835;
    float _891 = _657;
    float _893 = _787;
    if (!_877)
    {
        _879 = _875;
    }
    float _895 = _879;
    bool _897 = !_877;
    float _899 = _895;
    if (!_897)
    {
        float _901 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _903 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _905 = _857 + _903;
        float _907 = rsqrt(_851);
        float _909 = _905 * _901;
        float _911 = _875 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _913 = _909 * 0.15915493667125701904296875;
        float _915 = _913 * 6.283185482025146484375;
        float _917 = cos(_915);
        float _919 = _913 * 6.283185482025146484375;
        float _921 = sin(_919);
        float _923 = _917 + (-1.0);
        float _925 = _923 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _927 = fma(_921, _911, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _929 = fma(_875, _917, _925);
        float _931 = _907 * _927;
        float _933 = fma(_845, _931, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _935 = fma(_839, _931, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _899 = _929;
        _881 = _933;
        _883 = _935;
        _885 = _907;
        _887 = _913;
    }
    float _937 = _899;
    float _939 = _881;
    float _941 = _883;
    float _943 = _885;
    float _945 = _887;
    float _947 = _945;
    float _949 = _937;
    float _951 = _939;
    float _953 = _941;
    float _955 = _943;
    if (_693)
    {
        _947 = 1.0;
    }
    float _957 = _947;
    float _959 = _957;
    if (!_681)
    {
        float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _963 = _767 + _961;
        float _965 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _967 = _797 + _965;
        float _969 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _971 = -_767;
        float _973 = _971 + _937;
        float _975 = _963 * _963;
        float _977 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _979 = _809 + _977;
        float _981 = -_797;
        float _983 = _981 + _939;
        float _985 = -_809;
        float _987 = _985 + _941;
        float _989 = fma(_967, _967, _975);
        float _991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _993 = fma(_979, _979, _989);
        float _995 = sqrt(_993);
        float _997 = _969 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _999 = precise::min(_995, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1001 = _999 * _991;
        float _1003 = _997 * _1001;
        float _1005 = fma(_973, _1003, _767);
        float _1007 = fma(_983, _1003, _797);
        float _1009 = fma(_987, _1003, _809);
        _949 = _1005;
        _951 = _1007;
        _953 = _1009;
    }
    float _1011 = _949;
    float _1013 = _951;
    float _1015 = _953;
    if (_693)
    {
        _889 = 1.0;
    }
    float _1017 = _889;
    float _1019 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1021 = _873 * _1019;
    float _1023 = _1017;
    if (!_693)
    {
        float _1025 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1027 = _1025 * 0.15915493667125701904296875;
        float _1029 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1031 = _1027 * 6.283185482025146484375;
        float _1033 = cos(_1031);
        float _1035 = _1029 * 0.15915493667125701904296875;
        float _1037 = _1027 * 6.283185482025146484375;
        float _1039 = sin(_1037);
        float _1041 = 1.0 / _1033;
        float _1043 = _1035 * 6.283185482025146484375;
        float _1045 = cos(_1043);
        float _1047 = _1039 * _1041;
        float _1049 = _1035 * 6.283185482025146484375;
        float _1051 = sin(_1049);
        float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1055 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1053;
        float _1057 = _1045 * _1047;
        float _1059 = 1.0 / _1057;
        float _1061 = 1.0 / _1055;
        float _1063 = _1051 * _1059;
        float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1067 = fma(_1021, _1063, _1065);
        float _1069 = _1067 * _1061;
        float _1071 = precise::clamp(_1069, 0.0, 1.0);
        _955 = _1027;
        _959 = _1071;
    }
    float _1073 = _955;
    float _1075 = _959;
    if (!_693)
    {
        float _1077 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1079 = _1077 * 0.15915493667125701904296875;
        float _1081 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1083 = _1079 * 6.283185482025146484375;
        float _1085 = cos(_1083);
        float _1087 = _1081 * 0.15915493667125701904296875;
        float _1089 = _1079 * 6.283185482025146484375;
        float _1091 = sin(_1089);
        float _1093 = 1.0 / _1085;
        float _1095 = _1087 * 6.283185482025146484375;
        float _1097 = cos(_1095);
        float _1099 = _1091 * _1093;
        float _1101 = _1087 * 6.283185482025146484375;
        float _1103 = sin(_1101);
        float _1105 = _1097 * _1099;
        float _1107 = 1.0 / _1105;
        float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1111 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1109;
        float _1113 = 1.0 / _1111;
        float _1115 = _1103 * _1107;
        float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1119 = fma(_1021, _1115, _1117);
        float _1121 = _1119 * _1113;
        float _1123 = precise::clamp(_1121, 0.0, 1.0);
        float _1125 = -_1123;
        float _1127 = _1125 + 1.0;
        _1023 = _1127;
    }
    float _1129 = _1023;
    float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1133 = _1011 + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1137 = _1013 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1141 = _1015 + _1139;
    float _1143 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1145 = _1133 * _1133;
    float _1147 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1149 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1143);
    float _1151 = fma(_1137, _1137, _1145);
    float _1153 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1147);
    float _1155 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1149);
    float _1157 = fma(_1141, _1141, _1151);
    float _1159 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1153);
    float _1161 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1163 = rsqrt(_1157);
    float _1165 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1167 = sqrt(_1157);
    float _1169 = _1163 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1171 = _1137 * _1169;
    float _1173 = _1141 * _1169;
    float _1175 = _1171 * _1171;
    float _1177 = _1173 * _1173;
    float _1179 = _1175 + _1177;
    float _1181 = sqrt(_1179);
    bool _1183 = _1181 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1187 = _1181 + _1185;
    float _1189 = _1073;
    float _1191 = _1179;
    float _1193 = _1187;
    float _1195 = _1171;
    float _1197 = _1173;
    float _1199 = _1175;
    float _1201 = _1177;
    if (_1183)
    {
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1189 = _1203;
    }
    float _1205 = _1189;
    if (_1183)
    {
        float _1207 = rsqrt(_1179);
        _1191 = _1207;
    }
    float _1209 = _1191;
    float _1211 = _1209;
    if (_1183)
    {
        float _1213 = _1187 * _1205;
        _1193 = _1213;
    }
    float _1215 = _1193;
    if (_1183)
    {
        float _1217 = _1215 * 0.15915493667125701904296875;
        _891 = _1217;
    }
    float _1219 = _891;
    float _1221 = _869;
    float _1223 = _1219;
    if (_1183)
    {
        float _1225 = _1219 * 6.283185482025146484375;
        float _1227 = sin(_1225);
        _1221 = _1227;
    }
    float _1229 = _1221;
    float _1231 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1233 = precise::max(0.0, _1231);
    float _1235 = _1205;
    float _1237 = _1233;
    if (_1183)
    {
        float _1239 = _1219 * 6.283185482025146484375;
        float _1241 = cos(_1239);
        _1235 = _1241;
    }
    float _1243 = _1235;
    float _1245 = -_1169;
    float _1247 = -_1233;
    float _1249 = fma(_1133, _1245, _1247);
    if (_1183)
    {
        float _1251 = _1249 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1237 = _1251;
    }
    float _1253 = _1237;
    float _1255 = fma(_797, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1257 = _1253;
    float _1259 = _1229;
    if (_1183)
    {
        float _1261 = fma(_1229, _1253, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _893 = _1261;
    }
    float _1263 = _893;
    if (!_1183)
    {
        _1257 = _1249;
    }
    float _1265 = _1257;
    float _1267 = floor(_1255);
    float _1269 = _1265;
    if (_1183)
    {
        float _1271 = _1243 + (-1.0);
        _1259 = _1271;
    }
    float _1273 = _1259;
    if (_1183)
    {
        float _1275 = _1209 * _1263;
        _1223 = _1275;
    }
    float _1277 = _1223;
    if (_1183)
    {
        float _1279 = _1273 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1211 = _1279;
    }
    float _1281 = _1211;
    if (_1183)
    {
        float _1283 = _1171 * _1277;
        _1195 = _1283;
    }
    float _1285 = _1195;
    if (_1183)
    {
        float _1287 = _1173 * _1277;
        _1197 = _1287;
    }
    float _1289 = _1197;
    float _1291 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1183)
    {
        float _1293 = fma(_1249, _1243, _1281);
        _1269 = _1293;
    }
    float _1295 = _1269;
    if (_1183)
    {
        float _1297 = _1285 * _1285;
        _1199 = _1297;
    }
    float _1299 = _1199;
    if (_1183)
    {
        float _1301 = _1289 * _1289;
        _1201 = _1301;
    }
    float _1303 = _1201;
    float _1305 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1291);
    float _1307 = fma(_1295, _1295, _1299);
    float _1309 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1305);
    float _1311 = _1307 + _1303;
    float _1313 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1315 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1317 = _1309 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1319 = fma(_809, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1321 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1323 = fma(_1167, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1321);
    float _1325 = precise::clamp(_1323, 0.0, 1.0);
    float _1327 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1315);
    float _1329 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1331 = rsqrt(_1311);
    float _1333 = -_1325;
    float _1335 = _1333 + 1.0;
    float _1337 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1327);
    float _1339 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1341 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1343 = _1337 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1345 = -_1339;
    float _1347 = fma(_1345, _1313, 1.0);
    float _1349 = abs(_1335);
    float _1351 = log2(_1349);
    float _1353 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1329);
    float _1355 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1341);
    float _1357 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1353);
    float _1359 = _1331 * _1285;
    float _1361 = _1331 * _1289;
    float _1363 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1357);
    float _1365 = _1331 * _1295;
    float _1367 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1369 = floor(_1319);
    float _1371 = -_1367;
    float _1373 = fma(_1365, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1371);
    float _1375 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1377 = -_1361;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1373);
    float _1381 = -_1267;
    float _1383 = _1255 + _1381;
    float _1385 = log2(_1347);
    float _1387 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1389 = fma(_1379, -0.5, 0.5);
    float _1391 = fma(_1379, 0.5, 0.5);
    float _1393 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1387);
    float _1395 = -_1369;
    float _1397 = _1319 + _1395;
    float _1399 = 1.0 / _1363;
    float _1401 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1393);
    float _1403 = fma(_1391, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1405 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1355);
    float _1407 = _1365 + 1.0;
    float _1409 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1401);
    float _1411 = fma(_1391, _1403, -0.212114393711090087890625);
    float _1413 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1405);
    float _1415 = exp2(_1375);
    float _1417 = _1385 * 0.693147182464599609375;
    float _1419 = fma(_1391, _1411, 1.570728778839111328125);
    float _1421 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1423 = sqrt(_1389);
    float _1425 = _1409 * _1399;
    float _1427 = -_1365;
    float _1429 = fma(_1415, _1407, _1427);
    float _1431 = _1413 * _1399;
    float _1433 = fma(_1425, 0.5, 0.5);
    float _1435 = fma(_1429, 0.5, 0.5);
    float _1437 = fma(_1431, -0.5, 0.5);
    float _1439 = _1423 * 0.636619746685028076171875;
    float2 _4740 = float2(_1383, _1397);
    float _1441 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4740, float2(0.0), isnan(_4740)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4740, float2(0.0), isnan(_4740)), level(0.0)).x;
    float3 _4751 = float3(_1433, _1437, _1421);
    float _1443 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4751, float3(0.0), isnan(_4751)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4751, float3(0.0), isnan(_4751)), level(0.0)).x;
    float _1445 = -_1419;
    float _1447 = fma(_1439, _1445, 1.0);
    float3 _4767 = float3(_1433, _1437, _1421);
    float4 _1450 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4767, float3(0.0), isnan(_4767)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4767, float3(0.0), isnan(_4767)), level(0.0)).xyzw;
    float _1452 = _1450.x;
    float _1454 = _1450.y;
    float _1456 = _1450.z;
    float _1458 = _1450.w;
    float2 _4783 = float2(_1447, _1435);
    float3 _1462 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4783, float2(0.0), isnan(_4783)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4783, float2(0.0), isnan(_4783)), level(0.0)).xyz;
    float _1464 = _1462.x;
    float _1466 = _1462.y;
    float _1468 = _1462.z;
    float _1470 = float(uint(_417));
    float _1472 = trunc(_545);
    int _1474 = int(_1472);
    float _1476 = _569 * _163;
    int _1478 = abs(_333);
    float _1480 = -_549;
    float _1482 = _1480 + 1.0;
    bool _1484 = _305 > 0.5;
    float _1486 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1488 = _303 > 0.5;
    float _1490 = _1317 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1492 = 1.0 / _1470;
    int _1494 = ~_417;
    int _1496 = _1494 + 1;
    float _1498 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1490);
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1502 = _1500 != 0;
    float _1504 = trunc(_1476);
    int _1506 = int(_1504);
    float _1508 = float(uint(_1474));
    float _1510 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1498);
    bool _1512 = !_1502;
    float _1514 = _1512 ? 7.345489978790283203125 : 1.0;
    float _1516 = exp2(_1486);
    int _1518 = as_type<int>(_1492) + (-2);
    float _1520 = _1514 * _303;
    bool _1522 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1524 = isnan(_301);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1530 = _1526 || _1528;
    float _1532 = float(_1530);
    float _1534 = as_type<float>(_1518) * _1508;
    int _1536 = ~_417;
    int _1538 = _1536 + 1;
    float _1540 = floor(_1520);
    float _1542 = trunc(_1534);
    float _1544 = precise::max(_1542, 0.0);
    uint _1547 = uint(_1544);
    float _1549 = -_1516;
    float _1551 = _1549 + 1.0;
    float _1553 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1555 = _1496 * int(_1547);
    int _1557 = _1555 + _1474;
    float _1559 = float(_1474);
    float _1561 = float(uint(_1557));
    float _1563 = as_type<float>(_1518) * _1561;
    float _1565 = trunc(_1563);
    float _1567 = precise::max(_1565, 0.0);
    uint _1569 = uint(_1567);
    int _1571 = int(_1547) + int(_1569);
    bool _1573 = _1559 >= _557;
    bool _1575 = isnan(_1559);
    bool _1577 = _1573 || _1575;
    bool _1579 = isnan(_557);
    bool _1581 = _1577 || _1579;
    float _1583 = float(_1581);
    float _1585 = -_1540;
    float _1587 = _1520 + _1585;
    int _1589 = _1538 * _1571;
    int _1591 = _1589 + _1474;
    float _1593 = trunc(_1583);
    int _1595 = int(_1593);
    bool _1597 = uint(_1591) >= uint(_417);
    bool _1599 = !_1597;
    int _1601 = _1599 ? 0 : (-1);
    bool _1603 = _417 == 0;
    int _1605 = ~_1571;
    int _1607 = _1605 + _1601;
    int _1609 = _1607 + 1;
    float _1611 = _1587 * _557;
    int _1613 = _417 * _1609;
    int _1615 = _1613 + _1474;
    int _1617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1619 = _1617 != 0;
    float _1621 = trunc(_1611);
    int _1623 = int(_1621);
    int _1625 = ~_1595;
    int _1627 = _1625 + 1;
    int _1629 = _1627 + 1;
    bool _1631 = !_1603;
    int _1633 = _1631 ? _1615 : (-1);
    bool _1635 = !_1619;
    int _1637 = _1635 ? 0 : 1;
    int _1639 = _417 + (-1);
    int _1641 = _1633 * _1629;
    int _1643 = abs(_1637);
    float _1645 = -_1532;
    float _1647 = _1645 + 1.0;
    int _1649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1651 = _1649 != 0;
    int _1653 = _1595 * _1639;
    int _1655 = _1653 + _1641;
    int _1657 = abs(_339);
    int _1659 = _1655 * _1478;
    int _1661 = abs(_399);
    float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1665 = _301 + _1663;
    bool _1667 = !_1651;
    int _1669 = _1667 ? 0 : 1;
    int _1671 = _1623 * _1643;
    int _1673 = _1671 + _1474;
    int _1675 = abs(_1669);
    int _1677 = _1506 * _1657;
    int _1679 = _1677 + _1659;
    int _1681 = _1673 * _1661;
    int _1683 = _1681 + _1679;
    int _1685 = ~_417;
    int _1687 = _1685 + 1;
    int _1689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1691 = _1689 != 0;
    int _1693 = _1623 * _1675;
    int _1695 = _1693 + _1683;
    float _1697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1699 = _1697 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1701 = 1.0 / _1699;
    float _1703 = float(uint(_1695));
    float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1711 = _1709 != 0;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1715 = _1713 != 0;
    float _1717 = as_type<float>(_1518) * _1703;
    float _1719 = float(uint(_1673));
    float _1721 = 1.0 / _1707;
    int _1723 = ~_417;
    int _1725 = _1723 + 1;
    float _1727 = trunc(_1717);
    float _1729 = precise::max(_1727, 0.0);
    uint _1731 = uint(_1729);
    float _1733 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1733;
    float _1737 = _1735 * _1721;
    float _1739 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1741 = _301 + _1739;
    int _1743 = _1687 * int(_1731);
    int _1745 = _1743 + _1695;
    float _1747 = float(uint(_1745));
    float _1749 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1751 = _1749 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1753 = as_type<float>(_1518) * _1747;
    float _1755 = _1751 * _1701;
    bool _1757 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1759 = isnan(_301);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1765 = _1761 || _1763;
    float _1767 = float(_1765);
    float _1769 = trunc(_1753);
    float _1771 = precise::max(_1769, 0.0);
    uint _1773 = uint(_1771);
    bool _1775 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1777 = isnan(_301);
    bool _1779 = _1775 || _1777;
    bool _1781 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1783 = _1779 || _1781;
    float _1785 = float(_1783);
    float _1787 = -_1767;
    float _1789 = _1787 + 1.0;
    float _1791 = _1785 * _1647;
    float _1793 = _1532 * _1789;
    float _1795 = fma(_1737, _1741, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1797 = as_type<float>(_1518) * _1719;
    float _1799 = fma(_1755, _1665, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1801 = -_1785;
    float _1803 = _1801 + 1.0;
    float _1805 = _1795 * _1791;
    int _1807 = ~_417;
    int _1809 = _1807 + 1;
    float _1811 = trunc(_1797);
    float _1813 = precise::max(_1811, 0.0);
    uint _1815 = uint(_1813);
    int _1817 = int(_1731) + int(_1773);
    float _1819 = fma(_1803, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1805);
    float _1821 = -_179;
    int _1823 = _1488 ? as_type<int>(_1821) : as_type<int>(_179);
    float _1825 = -_183;
    int _1827 = _1484 ? as_type<int>(_1825) : as_type<int>(_183);
    int _1829 = _1809 * _1817;
    int _1831 = _1829 + _1695;
    bool _1833 = !_1711;
    float _1835 = _1833 ? _179 : as_type<float>(_1823);
    float _1837 = fma(_1799, _1793, _1819);
    bool _1839 = !_1715;
    float _1841 = _1839 ? _183 : as_type<float>(_1827);
    bool _1843 = uint(_1831) >= uint(_417);
    float _1845 = _1835 + 0.5;
    float _1847 = _1841 + (-0.5);
    bool _1849 = !_1843;
    int _1851 = _1849 ? 0 : (-1);
    float _1853 = fma(_1845, (*spvDescriptorSet0.vp_c9)._m0[80].x, _529);
    int _1855 = _1725 * int(_1815);
    int _1857 = _1855 + _1673;
    float _1859 = -_1847;
    float _1861 = -_371;
    float _1863 = fma(_1859, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1861);
    int _1865 = ~_1817;
    int _1867 = _1865 + _1851;
    int _1869 = _1867 + 1;
    float _1871 = -_1482;
    float _1873 = fma(_1835, _1871, _1853);
    float _1875 = -_553;
    float _1877 = _1875 + 1.0;
    float _1879 = abs(_1021);
    float _1881 = log2(_1879);
    float _1883 = float(uint(_1857));
    int _1885 = _417 * _1869;
    int _1887 = _1885 + _1695;
    float _1889 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1837);
    float _1891 = fma(_1841, _1877, _1863);
    float _1893 = as_type<float>(_1518) * _1883;
    float _1895 = _1889 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1897 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1899 = !_1603;
    int _1901 = _1899 ? _1887 : (-1);
    float _1903 = trunc(_1893);
    float _1905 = precise::max(_1903, 0.0);
    uint _1907 = uint(_1905);
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1913 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _1915 = _1901 >> 31;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1919 = _1897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1921 = _1909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1923 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1925 = exp2(_1913);
    out.m_70.x = _1873;
    out.m_70.y = _1891;
    out.m_72.x = _1919;
    out.m_72.y = _1921;
    out.m_72.z = _1923;
    out.m_72.w = _1917;
    int _1927 = _1915 & 3;
    float _1929 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1931 = ~_417;
    int _1933 = _1931 + 1;
    float _1935 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1937 = _1901 + _1927;
    float _1939 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1941 = int(_1815) + int(_1907);
    float _1943 = _753 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1945 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1947 = _1937 >> 2;
    float _1949 = _1935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1951 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1953 = _753 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1955 = _753 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1957 = fma(_1925, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1959 = precise::clamp(_1957, 0.0, 1.0);
    int _1961 = _1947 << 4;
    int _1963 = _1961 + 368;
    int _1965 = _1933 * _1941;
    int _1967 = _1965 + _1673;
    float _1969 = -_737;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1953);
    float _1973 = -_737;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1955);
    float _1977 = -_737;
    float _1979 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1943);
    float _1981 = _769 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_74.x = _1945;
    out.m_74.y = _1949;
    out.m_74.z = _1951;
    out.m_74.w = _1895;
    float _1983 = _769 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1985 = uint(_1967) >= uint(_417);
    float _1987 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1975);
    uint _1989 = uint(int(uint(_1963) >> uint(2)));
    uint _1991 = uint(int(uint(int(_1989)) >> uint(2)));
    int _1993 = int(_1989) & 3;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[int(_1991)][_1993];
    int _1997 = int(_1989) + 1;
    uint _1999 = uint(int(uint(_1997) >> uint(2)));
    int _2001 = _1997 & 3;
    float _2003 = (*spvDescriptorSet0.vp_c9)._m0[int(_1999)][_2001];
    float _2005 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1971);
    float _2007 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1979);
    float _2009 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1981);
    float _2011 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1983);
    int _2013 = _1901 & 3;
    bool _2015 = _2013 != 0;
    float _2017 = _777 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2019 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2009);
    bool _2021 = _1021 <= 8000.0;
    bool _2023 = isnan(_1021);
    bool _2025 = _2021 || _2023;
    bool _2027 = isnan(8000.0);
    bool _2029 = _2025 || _2027;
    float _2031 = float(_2029);
    float _2033 = -_1441;
    float _2035 = _2033 + 1.0;
    float _2037 = _769 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2039 = _1901 & 3;
    bool _2041 = _2039 != 0;
    float _2043 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2017);
    float _2045 = _1553 * _1443;
    float _2047 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2037);
    float _2049 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2051 = _777 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2053 = uint(_2039) > 1u;
    float _2055 = _777 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2057 = _2015 ? 0 : 1;
    float _2059 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2051);
    float _2061 = _2049 * _2005;
    int _2063 = _1963 + 8;
    uint _2065 = uint(int(uint(_2063) >> uint(2)));
    uint _2067 = uint(int(uint(int(_2065)) >> uint(2)));
    int _2069 = int(_2065) & 3;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[int(_2067)][_2069];
    int _2073 = int(_2065) + 1;
    uint _2075 = uint(int(uint(_2073) >> uint(2)));
    int _2077 = _2073 & 3;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[int(_2075)][_2077];
    float _2081 = _2049 * _2007;
    int _2083 = ~_2057;
    int _2085 = _2083 + 1;
    int _2087 = _2085 + 1;
    float _2089 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2055);
    bool _2091 = uint(_2039) >= 2u;
    float _2093 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2011);
    float _2095 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2047);
    bool _2097 = !_1985;
    int _2099 = _2097 ? 0 : (-1);
    float _2101 = _2049 * _1987;
    int _2103 = _2087;
    if (!_2053)
    {
        int _2105 = ~_2057;
        int _2107 = _2105 + 1;
        _2103 = _2107;
    }
    int _2109 = _2103;
    float _2111 = _1959 * _1959;
    bool _2113 = _2039 != 3;
    float _2115 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2059);
    int _2117 = _2091 ? 0 : 1;
    float _2119 = _1458 * _2045;
    int _2121 = abs(_2109);
    float _2123 = -_1553;
    float _2125 = _2123 + 1.0;
    bool _2127 = !_2041;
    int _2129 = _2127 ? 0 : 1;
    int _2131 = ~_2117;
    int _2133 = _2131 + 1;
    int _2135 = _2133 + 1;
    float _2137 = _1468 * _2045;
    bool _2139 = _2039 != 3;
    float _2141 = _1458 * _2125;
    int _2143 = ~_2121;
    int _2145 = _2143 + 1;
    int _2147 = _2145 + 1;
    float _2149 = fma(_1458, _2137, _1456);
    int _2151 = _2135;
    if (_2113)
    {
        int _2153 = ~_2117;
        int _2155 = _2153 + 1;
        _2151 = _2155;
    }
    int _2157 = _2151;
    bool _2159 = !_2139;
    int _2161 = _2159 ? 0 : (-1);
    int _2163 = _2147 * as_type<int>(_2003);
    int _2165 = abs(_2129);
    int _2167 = abs(_2157);
    bool _2169 = !_1691;
    int _2171 = _2169 ? 0 : 1;
    int _2173 = abs(_2161);
    int _2175 = ~_2165;
    int _2177 = _2175 + 1;
    int _2179 = _2177 + 1;
    int _2181 = ~_1941;
    int _2183 = _2181 + _2099;
    int _2185 = _2183 + 1;
    float _2187 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2189 = abs(_2171);
    int _2191 = _2179 * as_type<int>(_1995);
    int _2193 = _2191 + _2163;
    int _2195 = _417 * _2185;
    int _2197 = _2195 + _1673;
    int _2199 = ~_2167;
    int _2201 = _2199 + 1;
    int _2203 = _2201 + 1;
    float _2205 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1510);
    float _2207 = fma(_2187, _2093, _2101);
    int _2209 = ~_2173;
    int _2211 = _2209 + 1;
    int _2213 = _2211 + 1;
    int _2215 = _2203 * as_type<int>(_2071);
    int _2217 = _2215 + _2193;
    float _2219 = _1409 + _1363;
    int _2221 = ~_2189;
    int _2223 = _2221 + 1;
    int _2225 = _2223 + 1;
    int _2227 = _2213 * as_type<int>(_2079);
    int _2229 = _2227 + _2217;
    bool _2231 = !_1603;
    int _2233 = _2231 ? _2197 : (-1);
    float _2235 = fma(_1959, -2.0, 3.0);
    float _2237 = _2205 + _1363;
    int _2239 = _2229 * _2225;
    float _2241 = _2111 * _2235;
    float _2243 = _2237 * 0.5;
    int _2245 = _2233 * _2189;
    int _2247 = _2245 + _2239;
    float _2249 = _1363 * 0.5;
    float _2251 = -_2241;
    float _2253 = _2251 + 1.0;
    float _2255 = in.m_76.x;
    float _2257 = _2219 * 0.5;
    float _2259 = fma(_1413, -0.5, _2249);
    float _2261 = fma(_2253, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2241);
    float _2263 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2043);
    float _2265 = fma(_2187, _2019, _2061);
    float _2267 = _2031 * _2261;
    float _2269 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2089);
    float _2271 = fma(_2187, _2095, _2081);
    out.m_78.x = _2257;
    out.m_78.y = _2259;
    out.m_78.z = _2243;
    out.m_78.w = _1363;
    float _2273 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2275 = _2263 + _2207;
    float _2277 = fma(_1464, _2119, _1452);
    float _2279 = _2115 + _2265;
    float _2281 = _2035 * _2273;
    float _2283 = precise::clamp(_2281, 0.0, 1.0);
    float _2285 = _2269 + _2271;
    float _2287 = fma(_1466, _2119, _1454);
    out.gl_Position.x = _1409;
    out.gl_Position.y = _1413;
    out.gl_Position.z = _2205;
    out.gl_Position.w = _1363;
    float _2289 = -_2283;
    float _2291 = fma(_2289, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2293 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2295 = isnan(_1167);
    bool _2297 = _2293 || _2295;
    bool _2299 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2301 = _2297 || _2299;
    out.m_80.x = _2277;
    out.m_80.y = _2287;
    out.m_80.z = _2149;
    out.m_80.w = _2141;
    float _2303 = float(_2247);
    float _2305 = _2291 * _2255;
    out.m_82.x = _2279;
    out.m_82.y = _2275;
    out.m_82.z = _2285;
    float _2307 = _2305 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_84.x = _2303;
    float _2309 = _2243;
    float _2311 = _2259;
    float _2313 = _2257;
    float _2315 = _2305;
    float _2317 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2301)
    {
        _2309 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2319 = _2309;
    out.m_86.x = _2307;
    float _2321 = _2319;
    float _2323 = _2319;
    if (!_2301)
    {
        _2311 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2325 = _2311;
    float _2327 = _2325;
    float _2329 = _2325;
    if (!_2301)
    {
        _2313 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2331 = _2313;
    float _2333 = _1075 * _1129;
    float _2335 = _2333;
    float _2337 = _2331;
    float _2339 = _2331;
    if (!_2301)
    {
        _2315 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2341 = _2315;
    float _2343 = _2341;
    float _2345 = _2341;
    if (!_2301)
    {
        _2317 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2347 = _2317;
    float _2349 = _2333 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2351 = _2347;
    float _2353 = _2347;
    if (!_2301)
    {
        _2335 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2355 = _2335;
    bool _2357 = !_2301;
    float _2359 = _2355;
    float _2361 = _2355;
    if (!_2357)
    {
        bool _2363 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2365 = isnan(_1167);
        bool _2367 = _2363 || _2365;
        bool _2369 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2371 = _2367 || _2369;
        if (!_2371)
        {
            float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2375 = _1167 + _2373;
            float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2379 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2377;
            float _2381 = 1.0 / _2379;
            float _2383 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2385 = _2383 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2389 = _2387 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2403 = _2375 * _2381;
            float _2405 = precise::clamp(_2403, 0.0, 1.0);
            float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2411 = fma(_2405, _2385, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2413 = fma(_2405, _2409, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2415 = fma(_2405, _2389, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2417 = fma(_2405, _2393, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2419 = fma(_2405, _2397, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2421 = fma(_2405, _2401, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2329 = _2413;
            _2353 = _2419;
            _2323 = _2411;
            _2345 = _2417;
            _2339 = _2415;
            _2361 = _2421;
            _2423 = true;
        }
        else
        {
            bool _2425 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2427 = isnan(_1167);
            bool _2429 = _2425 || _2427;
            bool _2431 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2433 = _2429 || _2431;
            if (!_2433)
            {
                _2321 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2435 = _2321;
            _2323 = _2435;
            if (!_2433)
            {
                _2327 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2437 = _2327;
            _2329 = _2437;
            if (!_2433)
            {
                _2337 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2439 = _2337;
            _2339 = _2439;
            if (!_2433)
            {
                _2343 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2441 = _2343;
            _2345 = _2441;
            if (!_2433)
            {
                _2351 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2443 = _2351;
            _2353 = _2443;
            if (!_2433)
            {
                _2359 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2445 = _2359;
            bool _2447 = !_2433;
            _2361 = _2445;
            if (!_2447)
            {
                bool _2449 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2451 = isnan(_1167);
                bool _2453 = _2449 || _2451;
                bool _2455 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2457 = _2453 || _2455;
                if (!_2457)
                {
                    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2461 = _1167 + _2459;
                    float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2465 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2463;
                    float _2467 = 1.0 / _2465;
                    float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2489 = _2461 * _2467;
                    float _2491 = precise::clamp(_2489, 0.0, 1.0);
                    float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2497 = fma(_2491, _2471, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2499 = fma(_2491, _2495, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2501 = fma(_2491, _2475, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2503 = fma(_2491, _2479, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2505 = fma(_2491, _2483, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2507 = fma(_2491, _2487, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2329 = _2499;
                    _2353 = _2505;
                    _2323 = _2497;
                    _2345 = _2503;
                    _2339 = _2501;
                    _2361 = _2507;
                    _2423 = true;
                }
                else
                {
                    _2329 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2353 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2323 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2345 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2339 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2361 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2423 = false;
    float _2509 = _2329;
    float _2511 = _2353;
    float _2513 = _2323;
    float _2515 = _2345;
    float _2517 = _2339;
    float _2519 = _2361;
    float _2521 = _2349 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2523 = fma(_2275, -0.5, 0.5);
    float _2525 = precise::clamp(_2523, 0.0, 1.0);
    float _2527 = -_2509;
    float _2529 = _2527 + _2511;
    float _2531 = -_2513;
    float _2533 = _2531 + _2515;
    out.m_53.x = _2521;
    float _2535 = -_2517;
    float _2537 = _2535 + _2519;
    float _2539 = fma(_2525, _2529, _2509);
    float _2541 = fma(_2525, _2533, _2513);
    bool _2543 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2545 = _2539 * 0.586610972881317138671875;
    float _2547 = fma(_2525, _2537, _2517);
    out.m_88.x = 0.0;
    bool _2549 = _1075 > 0.0;
    bool _2551 = isnan(_1075);
    bool _2553 = _2549 || _2551;
    bool _2555 = isnan(0.0);
    bool _2557 = _2553 || _2555;
    float _2559 = fma(_2541, 0.298911988735198974609375, _2545);
    bool _2561 = _1129 <= 0.0;
    bool _2563 = !_2557;
    bool _2565 = _2561 || _2563;
    float _2567 = fma(_2547, 0.114477999508380889892578125, _2559);
    float _2569 = -_2567;
    float _2571 = _2541 + _2569;
    float _2573 = -_2567;
    float _2575 = _2539 + _2573;
    float _2577 = -_2567;
    float _2579 = _2547 + _2577;
    float _2581 = fma(_2571, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2567);
    float _2583 = fma(_2575, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2567);
    float _2585 = fma(_2579, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2567);
    bool _2587 = !_2543;
    if (!_2587)
    {
        float _2589 = -_1011;
        float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2593 = -_1013;
        float _2595 = _2593 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2597 = -_1015;
        float _2599 = _2597 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2601 = _2591 * _2591;
        float _2603 = fma(_2595, _2595, _2601);
        float _2605 = fma(_2599, _2599, _2603);
        float _2607 = sqrt(_2605);
        float _2609 = rsqrt(_2605);
        float _2611 = -_2607;
        float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2615 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2617 = precise::clamp(_2615, 0.0, 1.0);
        float _2619 = _2595 * _2609;
        float _2621 = _2591 * _2609;
        float _2623 = abs(_2617);
        float _2625 = log2(_2623);
        float _2627 = _2599 * _2609;
        float _2629 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2631 = _2275 * _2621;
        float _2633 = -_2621;
        float _2635 = -_2629;
        float _2637 = fma(_2633, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2635);
        float _2639 = fma(_2279, _2619, _2631);
        float _2641 = -_2627;
        float _2643 = fma(_2641, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2637);
        float _2645 = fma(_2285, _2627, _2639);
        float _2647 = precise::clamp(_2645, 0.0, 1.0);
        float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2651 = _2643 + _2649;
        float _2653 = _2625 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2655 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2657 = precise::clamp(_2655, 0.0, 1.0);
        float _2659 = exp2(_2653);
        float _2661 = _2659 * _2657;
        float _2663 = _2647 * _2661;
        float _2665 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2667 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2669 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2665;
        out.m_88.y = _2667;
        out.m_88.z = _2669;
    }
    out.m_90.x = _2581;
    out.m_90.y = _2583;
    out.m_90.z = _2585;
    if (!_2565)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2671 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2671;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

