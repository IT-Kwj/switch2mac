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
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_82 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_86 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_92 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_70 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_55 [[user(locn13)]];
    float4 m_84 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3187 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = in.m_46.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = _108;
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3483 = as_type<float>(_135);
        out.gl_Position.z = _3483;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _139 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_108);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = in.m_53.x;
    float _151 = float(_113);
    float _153 = in.m_53.y;
    bool _155 = _117 >= _151;
    bool _157 = !_147;
    bool _159 = _155 || _157;
    float _161 = in.m_53.z;
    if (_159)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _125;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _137 = as_type<int>(_165);
    }
    int _167 = _137;
    out.m_55.x = _149;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3546 = as_type<float>(_167);
        out.gl_Position.z = _3546;
    }
    out.m_55.y = _153;
    out.m_55.z = _161;
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = in.m_57.x;
    float _171 = in.m_57.y;
    float _173 = in.m_57.z;
    float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _177 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _179 = in.m_59.x;
    float _181 = in.m_59.y;
    float _183 = in.m_59.z;
    bool _185 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _187 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _189 = _185 || _187;
    bool _191 = isnan(1.0);
    bool _193 = _189 || _191;
    float _195 = in.m_61.x;
    float _197 = in.m_61.y;
    float _199 = in.m_61.z;
    float _201 = as_type<float>(int(gl_VertexIndex));
    float _203 = _177 * _175;
    float _205 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[20].x, _203);
    float _207 = _171 * _171;
    float _209 = _173 * _173;
    float _211 = _169 * _169;
    float _213 = _205 * 6.283185482025146484375;
    float _215 = fma(_181, _181, _207);
    float _217 = fma(_183, _183, _209);
    float _219 = fma(_179, _179, _211);
    float _221 = _213 * 0.15915493667125701904296875;
    float _223 = fma(_197, _197, _215);
    float _225 = fma(_199, _199, _217);
    float _227 = fma(_195, _195, _219);
    float _229 = floor(_205);
    float _231 = sqrt(_223);
    float _233 = sqrt(_227);
    float _235 = -_229;
    float _237 = _205 + _235;
    bool _239 = _231 > 0.0;
    float _241 = sqrt(_225);
    bool _243 = _233 > 0.0;
    float _245 = _221 * 6.283185482025146484375;
    float _247 = cos(_245);
    int _249 = as_type<int>(_201) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_201) & 2;
    bool _255 = _253 != 0;
    float _257 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _259 = _213;
    float _261 = _231;
    float _263 = _227;
    float _265 = _223;
    float _267 = _205;
    float _269 = _257;
    float _271 = _229;
    float _273 = _225;
    float _275 = _173;
    float _277 = _171;
    if (_239)
    {
        float _279 = rsqrt(_223);
        _259 = _279;
    }
    float _281 = _259;
    if (!_193)
    {
        float _283 = _257 * _257;
        float _285 = _283 * 0.5;
        _261 = _285;
    }
    float _287 = _261;
    bool _289 = _241 > 0.0;
    bool _291 = !_251;
    float _293 = _291 ? (-0.5) : 0.5;
    float _295 = _287;
    float _297 = _241;
    if (!_193)
    {
        float _299 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _299;
    }
    float _301 = _295;
    bool _303 = !_255;
    float _305 = _303 ? (-0.5) : 0.5;
    float _307 = 0.0;
    float _309 = _301;
    if (_243)
    {
        float _311 = rsqrt(_227);
        _307 = _311;
    }
    float _313 = _307;
    if (!_193)
    {
        _263 = _257;
    }
    float _315 = _263;
    bool _317 = !_193;
    float _319 = _315;
    float _321 = _281;
    if (!_317)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = _257 * _325;
        float _335 = 1.0 / _329;
        float _337 = _331 * 0.693147182464599609375;
        float _339 = exp2(_333);
        float _341 = 1.0 / _337;
        float _343 = _339 + (-1.0);
        float _345 = -_343;
        float _347 = fma(_345, _341, _257);
        float _349 = _347 * _335;
        float _351 = _349 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _309 = _351;
        _297 = _339;
        _265 = _341;
        _267 = _335;
    }
    float _353 = _309;
    float _355 = _297;
    float _357 = _265;
    float _359 = _267;
    bool _361 = !_193;
    float _363 = _355;
    float _365 = _357;
    float _367 = _359;
    if (!_361)
    {
        float _369 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _371 = log2(_369);
        float _373 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _375 = _373 + 1.0;
        float _377 = 1.0 / _375;
        float _379 = _257 * _371;
        float _381 = exp2(_379);
        float _383 = -_381;
        float _385 = _383 + 1.0;
        float _387 = _385 * _377;
        _269 = _379;
        _319 = _387;
    }
    float _389 = _269;
    float _391 = _319;
    float _393 = 0.0;
    float _395 = _389;
    if (_289)
    {
        float _397 = rsqrt(_225);
        _393 = _397;
    }
    float _399 = _393;
    float _401 = 0.0;
    if (!_243)
    {
        _401 = 0.0;
    }
    float _403 = _401;
    float _405 = _403;
    if (_243)
    {
        float _407 = _313 * _179;
        _405 = _407;
    }
    float _409 = _405;
    if (!_243)
    {
        _395 = 0.0;
    }
    float _411 = _395;
    float _413 = _411;
    if (_243)
    {
        float _415 = _313 * _169;
        _413 = _415;
    }
    float _417 = _413;
    float _419 = 0.0;
    if (!_243)
    {
        _419 = 0.0;
    }
    float _421 = _419;
    float _423 = _421;
    if (_243)
    {
        float _425 = _313 * _195;
        _423 = _425;
    }
    float _427 = _423;
    float _429 = fma(_247, 0.5, 0.5);
    bool _431 = _237 < 0.5;
    float _433 = float(_431);
    float _435 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (!_239)
    {
        _363 = 0.0;
    }
    float _437 = _363;
    float _439 = _437;
    if (_239)
    {
        float _441 = _281 * _171;
        _439 = _441;
    }
    float _443 = _439;
    if (!_289)
    {
        _365 = 0.0;
    }
    float _445 = _365;
    float _447 = -_433;
    float _449 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _451 = -_429;
    float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _455 = _445;
    if (_289)
    {
        float _457 = _399 * _173;
        _455 = _457;
    }
    float _459 = _455;
    float _461 = _435 * _417;
    float _463 = _435 * _443;
    float _465 = _435 * _459;
    if (!_239)
    {
        _367 = 0.0;
    }
    float _467 = _367;
    float _469 = in.m_46.x;
    float _471 = in.m_46.y;
    float _473 = in.m_46.z;
    float _475 = _467;
    if (!_239)
    {
        _271 = 0.0;
    }
    float _477 = _271;
    float _479 = _477;
    if (_239)
    {
        float _481 = _281 * _181;
        _475 = _481;
    }
    float _483 = _475;
    if (_239)
    {
        float _485 = _281 * _197;
        _479 = _485;
    }
    float _487 = _479;
    float _489 = -_237;
    float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    if (!_289)
    {
        _321 = 0.0;
    }
    float _493 = _321;
    float _495 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _497 = _493;
    if (_289)
    {
        float _499 = _399 * _183;
        _497 = _499;
    }
    float _501 = _497;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _505 = _503 != 0;
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _509 = _507 != 0;
    float _511 = fma(_495, _409, _461);
    if (!_289)
    {
        _273 = 0.0;
    }
    float _513 = _273;
    float _515 = fma(_495, _483, _463);
    int _517 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _519 = _517 != 0;
    float _521 = fma(_495, _501, _465);
    float _523 = _513;
    if (_289)
    {
        float _525 = _399 * _199;
        _523 = _525;
    }
    float _527 = _523;
    bool _529 = !_505;
    int _531 = _529 ? 0 : 1;
    float _533 = in.m_66.w;
    float _535 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _537 = !_519;
    int _539 = _537 ? 0 : 1;
    float _541 = in.m_44.x;
    float _543 = in.m_44.y;
    float _545 = in.m_44.z;
    int _547 = abs(_531);
    float _549 = fma(_535, _427, _511);
    float _551 = fma(_535, _487, _515);
    float _553 = fma(_535, _527, _521);
    int _555 = abs(_539);
    float _557 = 1.0 / _151;
    bool _559 = !_509;
    int _561 = _559 ? 0 : 1;
    bool _563 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _565 = abs(_561);
    float _567 = fma(_391, _469, _549);
    float _569 = float(_547);
    float _571 = fma(_391, _471, _551);
    float _573 = float(_555);
    float _575 = abs(_491);
    float _577 = _569 * _575;
    float _579 = fma(_391, _473, _553);
    float _581 = _117 * _557;
    float _583 = float(_565);
    float _585 = fma(_573, _453, _577);
    float _587 = fma(_567, _533, _541);
    float _589 = fma(_571, _533, _543);
    float _591 = fma(_579, _533, _545);
    float _593 = abs(_449);
    float _595 = fma(_583, _593, _585);
    bool _597 = !_563;
    float _599 = _581;
    float _601 = _591;
    float _603 = _595;
    if (!_597)
    {
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _607 = _149 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _599 = _617;
    }
    float _619 = _599;
    float _621 = _153 * 2.0;
    float _623 = _149 * 2.0;
    float _625 = _149 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _627 = floor(_621);
    float _629 = _161 * 2.0;
    float _631 = _153 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _635 = floor(_623);
    float _637 = _149 + _153;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _641 = _639 != 0;
    float _643 = -_633;
    float _645 = fma(_625, 2.0, _643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _651 = _637 + (-1.0);
    float _653 = _153 + (-0.5);
    float _655 = 1.0 / _649;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _657;
    float _661 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _675 = 1.0 / _659;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _679 = _619 + _677;
    bool _681 = _635 >= 0.0;
    bool _683 = isnan(_635);
    bool _685 = _681 || _683;
    bool _687 = isnan(0.0);
    bool _689 = _685 || _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _699 = _627 > 0.0;
    float _701 = -_117;
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[76].x, _645);
    float _705 = 1.0 / _665;
    float _707 = _153 + _161;
    bool _709 = _635 > 0.0;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _713 = _707 + (-1.0);
    float _715 = floor(_629);
    bool _717 = _627 >= 0.0;
    bool _719 = isnan(_627);
    bool _721 = _717 || _719;
    bool _723 = isnan(0.0);
    bool _725 = _721 || _723;
    float _727 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _731 = _619 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _737;
    float _741 = fma(_631, -2.0, _711);
    float _743 = _731 * _675;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _747 = _619 + _745;
    float _749 = _679 * _705;
    int _751 = as_type<int>(_705);
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_641)
    {
        _751 = 0;
    }
    int _755 = _751;
    float _757 = _149 + _161;
    float _759 = _747 * _655;
    int _761 = _755;
    if (!_641)
    {
        _761 = 1;
    }
    int _763 = _761;
    float _765 = fma(_735, _749, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _767 = fma(_739, _749, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _769 = fma(_673, _759, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _771 = fma(_697, _759, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _773 = _689 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _775 = _757 + (-1.0);
    bool _777 = _763 != 1;
    float _779 = fma(_669, _743, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _781 = _715 >= 0.0;
    bool _783 = isnan(_715);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    float _791 = fma(_693, _743, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _793 = _715 > 0.0;
    float _795 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _797 = int(_795);
    int _799 = _725 ? 0 : 1;
    float _801 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _741);
    int _803 = _789 ? 0 : 1;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _807 = _805 != 0;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _815 = _813 != 0;
    float _817 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _819 = log2(_817);
    int _821 = ~_799;
    int _823 = _821 + 1;
    int _825 = _823 + 1;
    int _827 = ~as_type<int>(_773);
    int _829 = _827 + 1;
    int _831 = _829 + 1;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _835 = _825;
    int _837 = _831;
    float _839 = _773;
    float _841 = as_type<float>(_797);
    if (!_699)
    {
        int _843 = ~_799;
        int _845 = _843 + 1;
        _835 = _845;
    }
    int _847 = _835;
    float _849 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _851 = int(_849);
    if (!_709)
    {
        int _853 = ~as_type<int>(_773);
        int _855 = _853 + 1;
        _837 = _855;
    }
    int _857 = _837;
    bool _859 = !_811;
    int _861 = _859 ? 0 : 1;
    float _863 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _865 = !_807;
    int _867 = _865 ? 0 : 1;
    bool _869 = !_815;
    int _871 = _869 ? 0 : 1;
    float _873 = _819 * _117;
    if (!_777)
    {
        _839 = _153;
    }
    float _875 = _839;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _883 = _881 != 0;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _887 = _885 != 0;
    float _889 = _875;
    if (_777)
    {
        _889 = _149;
    }
    float _891 = _889;
    int _893 = ~_803;
    int _895 = _893 + 1;
    int _897 = _895 + 1;
    bool _899 = !_883;
    int _901 = _899 ? 0 : 1;
    float _903 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[83].z, _833);
    int _905 = _897;
    if (!_793)
    {
        int _907 = ~_803;
        int _909 = _907 + 1;
        _905 = _909;
    }
    int _911 = _905;
    float _913 = in.m_68.x;
    float _915 = in.m_68.y;
    float _917 = in.m_68.z;
    bool _919 = !_887;
    int _921 = _919 ? 0 : 1;
    float _923 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _903);
    int _925 = abs(_901);
    int _927 = abs(_921);
    bool _929 = !_879;
    float _931 = _929 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _933 = float(_857);
    float _935 = float(_925);
    int _937 = abs(as_type<int>(_931));
    float _939 = _935 * _933;
    float _941 = _931;
    float _943 = _935;
    if (!_777)
    {
        _941 = _161;
    }
    float _945 = _941;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _949 = _945;
    if (_777)
    {
        _949 = _153;
    }
    float _951 = _949;
    float _953 = float(_847);
    float _955 = float(_927);
    float _957 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[83].w, _947);
    if (!_777)
    {
        _943 = _153;
    }
    float _959 = _943;
    float _961 = _959;
    if (_777)
    {
        _961 = _149;
    }
    float _963 = _961;
    float _965 = _955 * _953;
    float _967 = float(_797);
    float _969 = _963 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_777)
    {
        _841 = _161;
    }
    float _971 = _841;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _975 = _939 * (-2.0);
    float _977 = _971;
    if (_777)
    {
        _977 = _153;
    }
    float _979 = _977;
    float _981 = -_973;
    float _983 = fma(_969, 2.0, _981);
    float _985 = float(_937);
    float _987 = fma(_727, _975, _727);
    float _989 = fma(_975, _915, _915);
    float _991 = exp2(_873);
    float _993 = float(_851);
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _997 = _979 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _999 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].y, _989);
    float _1001 = float(_911);
    float _1003 = fma(_997, -2.0, _995);
    float _1005 = 1.0 / _993;
    float _1007 = _985 * _1001;
    bool _1009 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1011 = isnan(1.0);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1017 = _1013 || _1015;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1021 = _557 * _117;
    float _1023 = 1.0 / _967;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1027 = 1.0 + _1025;
    bool _1029 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1031 = isnan(_619);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1019);
    float _1043 = -_991;
    float _1045 = _1043 + 1.0;
    bool _1047 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1049 = isnan(0.0);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1055 = _1051 || _1053;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1059 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1061 = isnan(_619);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = 1.0 / _1027;
    float _1073 = -_1039;
    float _1075 = _1073 + 1.0;
    float _1077 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1057);
    float _1079 = _1055 ? _1045 : 0.0;
    float _1081 = -_117;
    float _1083 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[81].x, _983);
    float _1085 = _1069 * _1075;
    float _1087 = -_1069;
    float _1089 = _1087 + 1.0;
    float _1091 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1041);
    float _1093 = _1023 * _117;
    float _1095 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _957);
    float _1097 = _1005 * _117;
    float _1099 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1077);
    float _1101 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1003);
    float _1103 = _1007 * (-2.0);
    if (_1017)
    {
        float _1105 = _1079 * _1071;
        _127 = _1105;
    }
    float _1107 = _127;
    bool _1109 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1111 = isnan(_619);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1117 = _1113 || _1115;
    float _1119 = float(_1117);
    float _1121 = fma(_661, _1103, _661);
    float _1123 = fma(_1103, _913, _913);
    float _1125 = fma(_987, _1107, _999);
    float _1127 = _149 + (-0.5);
    bool _1129 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1131 = isnan(_619);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1137 = _1133 || _1135;
    float _1139 = float(_1137);
    float _1141 = _1119 * _1089;
    float _1143 = -_1119;
    float _1145 = _1143 + 1.0;
    float _1147 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1123);
    float _1149 = _1125 * 0.15915493667125701904296875;
    float _1151 = in.m_66.x;
    float _1153 = in.m_66.y;
    float _1155 = _1139 * _1145;
    float _1157 = _965 * (-2.0);
    float _1159 = -_1139;
    float _1161 = _1159 + 1.0;
    float _1163 = fma(_1121, _1107, _1147);
    float _1165 = _779 * _1155;
    float _1167 = _791 * _1155;
    float _1169 = fma(_1157, _917, _917);
    float _1171 = _161 + (-0.5);
    float _1173 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1165);
    float _1175 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1167);
    float _1177 = fma(_863, _1157, _863);
    float _1179 = fma(_1171, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1169);
    float _1181 = fma(_769, _1141, _1173);
    float _1183 = fma(_771, _1141, _1175);
    float _1185 = _1163 * 0.15915493667125701904296875;
    float _1187 = fma(_1177, _1107, _1179);
    float _1189 = fma(_765, _1085, _1181);
    float _1191 = fma(_767, _1085, _1183);
    float _1193 = _1149 * 6.283185482025146484375;
    float _1195 = sin(_1193);
    float _1197 = _1187 * 0.15915493667125701904296875;
    float _1199 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1189);
    float _1201 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1191);
    float _1203 = _589 * _197;
    float _1205 = in.m_61.w;
    float _1207 = _1199 * _1151;
    float _1209 = _1201 * _1153;
    float _1211 = _1149 * 6.283185482025146484375;
    float _1213 = cos(_1211);
    float _1215 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _305);
    float _1217 = _595 * _1207;
    float _1219 = _595 * _1209;
    float _1221 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _293);
    float _1223 = fma(_587, _195, _1203);
    float _1225 = _1217 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1227 = _1219 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1229 = _1185 * 6.283185482025146484375;
    float _1231 = sin(_1229);
    float _1233 = in.m_59.w;
    float _1235 = _1225 * _1221;
    float _1237 = _1227 * _1215;
    float _1239 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1241 = fma(_591, _199, _1223);
    float _1243 = in.m_57.w;
    float _1245 = _1197 * 6.283185482025146484375;
    float _1247 = cos(_1245);
    float _1249 = _1241 + _1205;
    float _1251 = _1185 * 6.283185482025146484375;
    float _1253 = cos(_1251);
    float _1255 = _1231 * _1195;
    float _1257 = _1231 * _1213;
    float _1259 = _1197 * 6.283185482025146484375;
    float _1261 = sin(_1259);
    float _1263 = _1231 * _1247;
    float _1265 = _1195 * _1247;
    float _1267 = _1263 * _1237;
    float _1269 = _1253 * _1213;
    float _1271 = _1253 * _1195;
    float _1273 = _1253 * _1247;
    float _1275 = _1213 * _1247;
    float _1277 = _1273 * _1237;
    float _1279 = fma(_1261, _1269, _1255);
    float _1281 = -_1237;
    float _1283 = _1261 * _1281;
    float _1285 = -_1257;
    float _1287 = fma(_1261, _1271, _1285);
    float _1289 = -_1271;
    float _1291 = fma(_1261, _1257, _1289);
    float _1293 = fma(_1279, _1235, _1277);
    float _1295 = fma(_1275, _1235, _1283);
    float _1297 = fma(_1261, _1255, _1269);
    float _1299 = fma(_1291, _1235, _1267);
    float _1301 = fma(_1287, _1239, _1293);
    float _1303 = fma(_1265, _1239, _1295);
    float _1305 = _589 * _181;
    float _1307 = fma(_1297, _1239, _1299);
    float _1309 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1311 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1313 = fma(_587, _179, _1305);
    float _1315 = _589 * _171;
    float _1317 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1309);
    float _1319 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1311);
    float _1321 = fma(_591, _183, _1313);
    float _1323 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1325 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1317);
    float _1327 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1319);
    float _1329 = _1321 + _1233;
    float _1331 = fma(_587, _169, _1315);
    float _1333 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1335 = _1327 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1337 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1323);
    float _1339 = fma(_591, _173, _1331);
    float _1341 = _1249 + _1333;
    float _1343 = _1329 + _1335;
    float _1345 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1337);
    float _1347 = _1339 + _1243;
    float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1351 = _1341 + _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1355 = _1343 + _1353;
    float _1357 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1359 = _1351 * _1351;
    float _1361 = _1347 + _1357;
    float _1363 = fma(_1355, _1355, _1359);
    float _1365 = sqrt(_1363);
    bool _1367 = _1365 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1371 = _1369 != 0;
    int _1373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1375 = _1373 != 0;
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1379 = _1377 != 0;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1383 = _1381 != 0;
    bool _1385 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1387 = isnan(0.5);
    bool _1389 = _1385 || _1387;
    bool _1391 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1393 = _1389 || _1391;
    bool _1395 = !_1375;
    int _1397 = _1395 ? 0 : 1;
    bool _1399 = !_1371;
    int _1401 = _1399 ? 0 : 1;
    bool _1403 = !_1379;
    int _1405 = _1403 ? 0 : 1;
    bool _1407 = !_1383;
    int _1409 = _1407 ? 0 : 1;
    float _1411 = _1357;
    float _1413 = _1243;
    float _1415 = _1293;
    if (!_1367)
    {
        _1411 = _1343;
    }
    float _1417 = _1411;
    float _1419 = _1417;
    if (!_1367)
    {
        _275 = _1341;
    }
    float _1421 = _275;
    float _1423 = _1421;
    if (!_1367)
    {
        _277 = _1361;
    }
    float _1425 = _277;
    bool _1427 = !_1367;
    float _1429 = _1425;
    if (!_1427)
    {
        float _1431 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1435 = _1365 + _1433;
        float _1437 = _1361 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1439 = rsqrt(_1363);
        float _1441 = _1435 * _1431;
        float _1443 = _1441 * 0.15915493667125701904296875;
        float _1445 = _1443 * 6.283185482025146484375;
        float _1447 = cos(_1445);
        float _1449 = _1443 * 6.283185482025146484375;
        float _1451 = sin(_1449);
        float _1453 = _1447 + (-1.0);
        float _1455 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1457 = fma(_1451, _1437, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1459 = fma(_1361, _1447, _1455);
        float _1461 = _1439 * _1457;
        float _1463 = fma(_1355, _1461, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1465 = fma(_1351, _1461, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1419 = _1463;
        _1429 = _1459;
        _1423 = _1465;
    }
    float _1467 = _1419;
    float _1469 = _1429;
    float _1471 = _1423;
    float _1473 = _1469;
    float _1475 = _1467;
    float _1477 = _1471;
    if (!_1393)
    {
        float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1481 = _1347 + _1479;
        float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1485 = _1329 + _1483;
        float _1487 = _1481 * _1481;
        float _1489 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1491 = _1249 + _1489;
        float _1493 = fma(_1485, _1485, _1487);
        float _1495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1497 = fma(_1491, _1491, _1493);
        float _1499 = -_1329;
        float _1501 = _1499 + _1467;
        float _1503 = sqrt(_1497);
        float _1505 = precise::min(_1503, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1507 = _1505 * _1495;
        float _1509 = -_1347;
        float _1511 = _1509 + _1469;
        float _1513 = -_1249;
        float _1515 = _1513 + _1471;
        float _1517 = fma(_1501, _1507, _1329);
        float _1519 = fma(_1511, _1507, _1347);
        float _1521 = fma(_1515, _1507, _1249);
        _1473 = _1519;
        _1475 = _1517;
        _1477 = _1521;
    }
    float _1523 = _1473;
    float _1525 = _1475;
    float _1527 = _1477;
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1531 = _1523 + _1529;
    float _1533 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1535 = _1525 + _1533;
    float _1537 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1539 = _1527 + _1537;
    float _1541 = _1531 * _1531;
    float _1543 = fma(_1535, _1535, _1541);
    float _1545 = fma(_1539, _1539, _1543);
    float _1547 = rsqrt(_1545);
    float _1549 = sqrt(_1545);
    float _1551 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1553 = _1535 * _1551;
    float _1555 = _1539 * _1551;
    float _1557 = _1553 * _1553;
    float _1559 = _1555 * _1555;
    float _1561 = _1557 + _1559;
    float _1563 = sqrt(_1561);
    bool _1565 = _1563 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1567 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1569 = _1563 + _1567;
    float _1571 = _1547;
    float _1573 = _1561;
    float _1575 = _1569;
    float _1577 = _1551;
    float _1579 = _1531;
    if (_1565)
    {
        float _1581 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1571 = _1581;
    }
    float _1583 = _1571;
    if (_1565)
    {
        float _1585 = rsqrt(_1561);
        _1573 = _1585;
    }
    float _1587 = _1573;
    if (_1565)
    {
        float _1589 = _1569 * _1583;
        _1575 = _1589;
    }
    float _1591 = _1575;
    if (_1565)
    {
        float _1593 = _1591 * 0.15915493667125701904296875;
        _1413 = _1593;
    }
    float _1595 = _1413;
    float _1597 = _1583;
    if (_1565)
    {
        float _1599 = _1595 * 6.283185482025146484375;
        float _1601 = sin(_1599);
        _1597 = _1601;
    }
    float _1603 = _1597;
    float _1605 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1607 = precise::max(0.0, _1605);
    float _1609 = _1539;
    float _1611 = _1607;
    if (_1565)
    {
        float _1613 = _1595 * 6.283185482025146484375;
        float _1615 = cos(_1613);
        _1609 = _1615;
    }
    float _1617 = _1609;
    float _1619 = -_1551;
    float _1621 = -_1607;
    float _1623 = fma(_1531, _1619, _1621);
    if (_1565)
    {
        float _1625 = _1623 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1611 = _1625;
    }
    float _1627 = _1611;
    float _1629 = _1603;
    float _1631 = _1627;
    if (_1565)
    {
        float _1633 = fma(_1603, _1627, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1577 = _1633;
    }
    float _1635 = _1577;
    float _1637 = _1635;
    if (!_1565)
    {
        _1629 = _1553;
    }
    float _1639 = _1629;
    float _1641 = _1639;
    if (!_1565)
    {
        _1631 = _1623;
    }
    float _1643 = _1631;
    float _1645 = _1643;
    float _1647 = _1617;
    if (_1565)
    {
        float _1649 = _1617 + (-1.0);
        _1579 = _1649;
    }
    float _1651 = _1579;
    float _1653 = _1651;
    if (_1565)
    {
        float _1655 = _1587 * _1635;
        _1415 = _1655;
    }
    float _1657 = _1415;
    if (!_1565)
    {
        _1637 = _1557;
    }
    float _1659 = _1637;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1663 = fma(_1549, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1661);
    float _1665 = precise::clamp(_1663, 0.0, 1.0);
    float _1667 = _1659;
    if (_1565)
    {
        float _1669 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _601 = _1669;
    }
    float _1671 = _601;
    if (_1565)
    {
        float _1673 = _1553 * _1657;
        _1641 = _1673;
    }
    float _1675 = _1641;
    if (!_1565)
    {
        _1653 = _1555;
    }
    float _1677 = _1653;
    float _1679 = _1677;
    if (_1565)
    {
        float _1681 = _1555 * _1657;
        _1679 = _1681;
    }
    float _1683 = _1679;
    if (_1565)
    {
        float _1685 = fma(_1623, _1617, _1671);
        _1645 = _1685;
    }
    float _1687 = _1645;
    if (_1565)
    {
        float _1689 = _1675 * _1675;
        _1667 = _1689;
    }
    float _1691 = _1667;
    if (!_1565)
    {
        _1647 = _1559;
    }
    float _1693 = _1647;
    float _1695 = _1693;
    if (_1565)
    {
        float _1697 = _1683 * _1683;
        _1695 = _1697;
    }
    float _1699 = _1695;
    float _1701 = _1523 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1703 = fma(_1687, _1687, _1691);
    float _1705 = -_1665;
    float _1707 = _1705 + 1.0;
    float _1709 = _1523 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1711 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1701);
    float _1713 = _1703 + _1699;
    float _1715 = _1523 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1717 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1709);
    float _1719 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1711);
    float _1721 = abs(_1707);
    float _1723 = log2(_1721);
    float _1725 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1715);
    float _1727 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1717);
    float _1729 = _1719 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1731 = _1523 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1733 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1725);
    float _1735 = _1727 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1737 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1739 = rsqrt(_1713);
    float _1741 = _1733 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1743 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1745 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1731);
    float _1747 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1749 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1751 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1743);
    float _1753 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1745);
    float _1755 = -_1747;
    float _1757 = fma(_1755, _1737, 1.0);
    float _1759 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1751);
    float _1761 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1763 = log2(_1757);
    float _1765 = _1739 * _1675;
    float _1767 = _1739 * _1687;
    float _1769 = _1739 * _1683;
    float _1771 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1773 = _1765 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1775 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1759);
    float _1777 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1749);
    float _1779 = -_1773;
    float _1781 = fma(_1767, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1779);
    float _1783 = exp2(_1771);
    float _1785 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1777);
    float _1787 = -_1769;
    float _1789 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1781);
    float _1791 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1793 = _1763 * 0.693147182464599609375;
    float _1795 = fma(_1789, -0.5, 0.5);
    float _1797 = 1.0 / _1775;
    float _1799 = fma(_1789, 0.5, 0.5);
    float _1801 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1791);
    float _1803 = _1767 + 1.0;
    float _1805 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1807 = fma(_1799, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1809 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1801);
    float _1811 = sqrt(_1795);
    float _1813 = fma(_1799, _1807, -0.212114393711090087890625);
    float _1815 = -_1767;
    float _1817 = fma(_1783, _1803, _1815);
    float _1819 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1809);
    float _1821 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1785);
    float _1823 = fma(_1799, _1813, 1.570728778839111328125);
    float _1825 = fma(_1817, 0.5, 0.5);
    float _1827 = _1819 * _1797;
    float _1829 = _1821 * _1797;
    float _1831 = fma(_1829, -0.5, 0.5);
    float _1833 = _1811 * 0.636619746685028076171875;
    float _1835 = fma(_1827, 0.5, 0.5);
    float _1837 = -_1823;
    float _1839 = fma(_1833, _1837, 1.0);
    float3 _6109 = float3(_1835, _1831, _1805);
    float _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6109, float3(0.0), isnan(_6109)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6109, float3(0.0), isnan(_6109)), level(0.0)).x;
    float3 _6120 = float3(_1835, _1831, _1805);
    float4 _1844 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6120, float3(0.0), isnan(_6120)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6120, float3(0.0), isnan(_6120)), level(0.0)).xyzw;
    float _1846 = _1844.x;
    float _1848 = _1844.y;
    float _1850 = _1844.z;
    float _1852 = _1844.w;
    float2 _6137 = float2(_1839, _1825);
    float3 _1856 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6137, float2(0.0), isnan(_6137)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6137, float2(0.0), isnan(_6137)), level(0.0)).xyz;
    float _1858 = _1856.x;
    float _1860 = _1856.y;
    float _1862 = _1856.z;
    float _1864 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1866 = int(_1864);
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1870 = _1868 != 0;
    float _1872 = -_1091;
    float _1874 = _1872 + 1.0;
    int _1876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1878 = _1876 != 0;
    out.m_70.x = _1329;
    out.m_70.y = _1347;
    out.m_70.z = _1249;
    bool _1880 = _153 > 0.5;
    float _1882 = -_1099;
    float _1884 = _1882 + 1.0;
    bool _1886 = _149 > 0.5;
    float _1888 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1890 = int(_1888);
    bool _1892 = _161 > 0.5;
    float _1894 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1896 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1898 = _1896 != 0;
    out.m_72.x = _1525;
    out.m_72.y = _1523;
    out.m_72.z = _1527;
    int _1900 = abs(_861);
    float _1902 = _1819;
    if (_1870)
    {
        _753 = 1.0;
    }
    float _1904 = _753;
    float _1906 = trunc(_1093);
    int _1908 = int(_1906);
    float _1910 = float(uint(_1866));
    float _1912 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1914 = ~_1866;
    int _1916 = _1914 + 1;
    float _1918 = _1904;
    if (!_1870)
    {
        _1918 = 7.345489978790283203125;
    }
    float _1920 = _1918;
    float _1922 = float(_1866);
    float _1924 = 1.0 / _1910;
    float _1926 = float(uint(_1890));
    float _1928 = _1920 * _149;
    int _1930 = abs(_867);
    int _1932 = abs(_1397);
    int _1934 = abs(_871);
    float _1936 = 1.0 / _1926;
    float _1938 = trunc(_1097);
    int _1940 = int(_1938);
    float _1942 = float(uint(_1908));
    int _1944 = as_type<int>(_1924) + (-2);
    int _1946 = ~_1890;
    int _1948 = _1946 + 1;
    int _1950 = abs(_1401);
    float _1952 = exp2(_1894);
    int _1954 = as_type<int>(_1936) + (-2);
    int _1956 = abs(_1405);
    float _1958 = as_type<float>(_1954) * _1942;
    float _1960 = float(uint(_1940));
    float _1962 = trunc(_1958);
    float _1964 = precise::max(_1962, 0.0);
    uint _1967 = uint(_1964);
    float _1969 = as_type<float>(_1944) * _1960;
    float _1971 = -_1952;
    float _1973 = _1971 + 1.0;
    float _1975 = trunc(_1969);
    float _1977 = precise::max(_1975, 0.0);
    uint _1979 = uint(_1977);
    float _1981 = _1973 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1983 = _1948 * int(_1967);
    int _1985 = _1983 + _1908;
    float _1987 = float(uint(_1985));
    int _1989 = _1916 * int(_1979);
    int _1991 = _1989 + _1940;
    float _1993 = float(uint(_1991));
    float _1995 = as_type<float>(_1954) * _1987;
    float _1997 = _1987;
    float _1999 = _1993;
    if (_1870)
    {
        _1997 = 1.0;
    }
    float _2001 = _1997;
    float _2003 = _2001;
    if (!_1870)
    {
        _2003 = 1.2345600128173828125;
    }
    float _2005 = _2003;
    float _2007 = as_type<float>(_1944) * _1993;
    if (_1870)
    {
        _1999 = _149;
    }
    float _2009 = _1999;
    float _2011 = trunc(_1995);
    float _2013 = precise::max(_2011, 0.0);
    uint _2015 = uint(_2013);
    float _2017 = _2009;
    if (!_1870)
    {
        _2017 = _153;
    }
    float _2019 = _2017;
    int _2021 = ~_1866;
    int _2023 = _2021 + 1;
    float _2025 = _2005 * _2019;
    float _2027 = trunc(_2007);
    float _2029 = precise::max(_2027, 0.0);
    uint _2031 = uint(_2029);
    int _2033 = int(_1967) + int(_2015);
    float _2035 = floor(_1928);
    int _2037 = ~_1890;
    int _2039 = _2037 + 1;
    float _2041 = float(_1890);
    int _2043 = _2039 * _2033;
    int _2045 = _2043 + _1908;
    int _2047 = int(_1979) + int(_2031);
    float _2049 = floor(_2025);
    float _2051 = float(_1908);
    bool _2053 = uint(_2045) >= uint(_1890);
    int _2055 = _2023 * _2047;
    int _2057 = _2055 + _1940;
    float _2059 = float(_1940);
    bool _2061 = _2051 >= _2041;
    bool _2063 = isnan(_2051);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan(_2041);
    bool _2069 = _2065 || _2067;
    float _2071 = float(_2069);
    float _2073 = -_2035;
    float _2075 = _1928 + _2073;
    bool _2077 = uint(_2057) >= uint(_1866);
    bool _2079 = _2059 >= _1922;
    bool _2081 = isnan(_2059);
    bool _2083 = _2079 || _2081;
    bool _2085 = isnan(_1922);
    bool _2087 = _2083 || _2085;
    float _2089 = float(_2087);
    float _2091 = trunc(_2071);
    int _2093 = int(_2091);
    bool _2095 = !_2053;
    int _2097 = _2095 ? 0 : (-1);
    float _2099 = -_2049;
    float _2101 = _2025 + _2099;
    bool _2103 = !_2077;
    int _2105 = _2103 ? 0 : (-1);
    int _2107 = ~_2033;
    int _2109 = _2107 + _2097;
    int _2111 = _2109 + 1;
    float _2113 = trunc(_2089);
    int _2115 = int(_2113);
    int _2117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2119 = _2117 != 0;
    float _2121 = _2075 * _2041;
    int _2123 = ~_2047;
    int _2125 = _2123 + _2105;
    int _2127 = _2125 + 1;
    int _2129 = _1890 * _2111;
    int _2131 = _2129 + _1908;
    int _2133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2135 = _2133 != 0;
    float _2137 = _2041 * _1021;
    bool _2139 = !_2119;
    int _2141 = _2139 ? 0 : 1;
    int _2143 = _1866 * _2127;
    int _2145 = _2143 + _1940;
    bool _2147 = _1890 == 0;
    float _2149 = trunc(_2121);
    int _2151 = int(_2149);
    bool _2153 = !_2135;
    int _2155 = _2153 ? 0 : 1;
    float _2157 = _1922 * _1021;
    bool _2159 = _1866 == 0;
    float _2161 = _2101 * _1922;
    int _2163 = ~_2093;
    int _2165 = _2163 + 1;
    int _2167 = _2165 + 1;
    bool _2169 = !_2147;
    int _2171 = _2169 ? _2131 : (-1);
    float _2173 = trunc(_2137);
    int _2175 = int(_2173);
    int _2177 = ~_2115;
    int _2179 = _2177 + 1;
    int _2181 = _2179 + 1;
    bool _2183 = !_2159;
    int _2185 = _2183 ? _2145 : (-1);
    int _2187 = _2171 * _2167;
    int _2189 = _1890 + (-1);
    int _2191 = _1866 + (-1);
    int _2193 = _2185 * _2181;
    int _2195 = abs(_2141);
    int _2197 = _2093 * _2189;
    int _2199 = _2197 + _2187;
    float _2201 = trunc(_2161);
    int _2203 = int(_2201);
    int _2205 = _2115 * _2191;
    int _2207 = _2205 + _2193;
    int _2209 = _2199 * _1900;
    int _2211 = abs(_2155);
    int _2213 = _2207 * _1932;
    int _2215 = ~_1866;
    int _2217 = _2215 + 1;
    float _2219 = trunc(_2157);
    int _2221 = int(_2219);
    int _2223 = _2151 * _2195;
    int _2225 = _2223 + _1908;
    int _2227 = _2175 * _1930;
    int _2229 = _2227 + _2209;
    float _2231 = in.m_53.w;
    float _2233 = -_293;
    int _2235 = _1886 ? as_type<int>(_2233) : as_type<int>(_293);
    int _2237 = _2225 * _1934;
    int _2239 = _2237 + _2229;
    bool _2241 = !_1878;
    int _2243 = _2241 ? 0 : 1;
    int _2245 = _2203 * _2211;
    int _2247 = _2245 + _1940;
    float _2249 = float(uint(_2225));
    int _2251 = abs(_2243);
    bool _2253 = !_1898;
    float _2255 = _2253 ? _293 : as_type<float>(_2235);
    float _2257 = as_type<float>(_1954) * _2249;
    int _2259 = _2221 * _1950;
    int _2261 = _2259 + _2213;
    int _2263 = abs(_1409);
    float _2265 = _2255 + 0.5;
    int _2267 = _2247 * _1956;
    int _2269 = _2267 + _2261;
    float _2271 = float(uint(_2247));
    float _2273 = trunc(_2257);
    float _2275 = precise::max(_2273, 0.0);
    uint _2277 = uint(_2275);
    float _2279 = fma(_2265, (*spvDescriptorSet0.vp_c9)._m0[80].x, _703);
    int _2281 = _2203 * _2263;
    int _2283 = _2281 + _2269;
    bool _2285 = _2231 > 0.5;
    int _2287 = _2151 * _2251;
    int _2289 = _2287 + _2239;
    float _2291 = as_type<float>(_1944) * _2271;
    int _2293 = ~_1890;
    int _2295 = _2293 + 1;
    float _2297 = -_1874;
    float _2299 = fma(_2255, _2297, _2279);
    float _2301 = float(uint(_2283));
    float _2303 = float(uint(_2289));
    float _2305 = trunc(_2291);
    float _2307 = precise::max(_2305, 0.0);
    uint _2309 = uint(_2307);
    int _2311 = ~_1866;
    int _2313 = _2311 + 1;
    float _2315 = as_type<float>(_1944) * _2301;
    int _2317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2319 = _2317 != 0;
    float _2321 = as_type<float>(_1954) * _2303;
    int _2323 = _2295 * int(_2277);
    int _2325 = _2323 + _2225;
    float _2327 = -_305;
    int _2329 = _1880 ? as_type<int>(_2327) : as_type<int>(_305);
    float _2331 = trunc(_2315);
    float _2333 = precise::max(_2331, 0.0);
    uint _2335 = uint(_2333);
    int _2337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2339 = _2337 != 0;
    float _2341 = float(uint(_2325));
    int _2343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2345 = _2343 != 0;
    float _2347 = -_293;
    int _2349 = _1892 ? as_type<int>(_2347) : as_type<int>(_293);
    float _2351 = trunc(_2321);
    float _2353 = precise::max(_2351, 0.0);
    uint _2355 = uint(_2353);
    int _2357 = _2313 * int(_2309);
    int _2359 = _2357 + _2247;
    float _2361 = as_type<float>(_1954) * _2341;
    float _2363 = -_305;
    int _2365 = _2285 ? as_type<int>(_2363) : as_type<int>(_305);
    int _2367 = ~_1890;
    int _2369 = _2367 + 1;
    bool _2371 = !_2319;
    float _2373 = _2371 ? _305 : as_type<float>(_2329);
    int _2375 = _2217 * int(_2335);
    int _2377 = _2375 + _2283;
    float _2379 = float(uint(_2359));
    float _2381 = trunc(_2361);
    float _2383 = precise::max(_2381, 0.0);
    uint _2385 = uint(_2383);
    bool _2387 = !_2339;
    float _2389 = _2387 ? _293 : as_type<float>(_2349);
    float _2391 = _2373 + (-0.5);
    bool _2393 = !_2345;
    float _2395 = _2393 ? _305 : as_type<float>(_2365);
    float _2397 = as_type<float>(_1944) * _2379;
    float _2399 = float(uint(_2377));
    int _2401 = _2369 * int(_2355);
    int _2403 = _2401 + _2289;
    float _2405 = _2389 + 0.5;
    float _2407 = _2395 + (-0.5);
    float _2409 = -_2391;
    float _2411 = -_801;
    float _2413 = fma(_2409, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2411);
    float _2415 = as_type<float>(_1944) * _2399;
    float _2417 = float(uint(_2403));
    float _2419 = fma(_2405, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1083);
    float _2421 = -_2407;
    float _2423 = -_1101;
    float _2425 = fma(_2421, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2423);
    float _2427 = -_1095;
    float _2429 = _2427 + 1.0;
    float _2431 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2433 = as_type<float>(_1954) * _2417;
    float _2435 = -_923;
    float _2437 = _2435 + 1.0;
    float _2439 = fma(_2395, _2429, _2425);
    float _2441 = -_1261;
    float _2443 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2431);
    float _2445 = trunc(_2415);
    float _2447 = precise::max(_2445, 0.0);
    uint _2449 = uint(_2447);
    int _2451 = ~_1866;
    int _2453 = _2451 + 1;
    float _2455 = fma(_2373, _1884, _2413);
    int _2457 = ~_1890;
    int _2459 = _2457 + 1;
    float _2461 = -_2437;
    float _2463 = fma(_2389, _2461, _2419);
    float _2465 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2467 = trunc(_2433);
    float _2469 = precise::max(_2467, 0.0);
    uint _2471 = uint(_2469);
    out.m_74.x = _2299;
    out.m_74.y = _2455;
    out.m_74.z = _2463;
    out.m_74.w = _2439;
    float _2473 = -_1261;
    float _2475 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2465);
    int _2477 = int(_2277) + int(_2385);
    float _2479 = _293 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2481 = ~_1890;
    int _2483 = _2481 + 1;
    float _2485 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2489 = _2487 != 0;
    float _2491 = trunc(_2397);
    float _2493 = precise::max(_2491, 0.0);
    uint _2495 = uint(_2493);
    int _2497 = int(_2335) + int(_2449);
    int _2499 = _2483 * _2477;
    int _2501 = _2499 + _2225;
    int _2503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2505 = _2503 != 0;
    float _2507 = -_1261;
    float _2509 = fma(_2507, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2485);
    float _2511 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2513 = _2453 * _2497;
    int _2515 = _2513 + _2283;
    int _2517 = ~_1866;
    int _2519 = _2517 + 1;
    float _2521 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2523 = int(_2355) + int(_2471);
    float _2525 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2527 = uint(_2515) >= uint(_1866);
    float _2529 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2521);
    float _2531 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2443);
    int _2533 = _2459 * _2523;
    int _2535 = _2533 + _2289;
    bool _2537 = !_2527;
    int _2539 = _2537 ? 0 : (-1);
    float _2541 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2525);
    int _2543 = int(_2309) + int(_2495);
    float _2545 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2475);
    bool _2547 = uint(_2535) >= uint(_1890);
    float _2549 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2551 = ~_2497;
    int _2553 = _2551 + _2539;
    int _2555 = _2553 + 1;
    float _2557 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2559 = !_2547;
    int _2561 = _2559 ? 0 : (-1);
    float _2563 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2549);
    bool _2565 = uint(_2501) >= uint(_1890);
    float _2567 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2557);
    int _2569 = ~_2523;
    int _2571 = _2569 + _2561;
    int _2573 = _2571 + 1;
    int _2575 = _2519 * _2543;
    int _2577 = _2575 + _2247;
    float _2579 = _305 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2581 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2567);
    float _2583 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1912);
    int _2585 = _1890 * _2573;
    int _2587 = _2585 + _2289;
    bool _2589 = uint(_2577) >= uint(_1866);
    int _2591 = _1866 * _2555;
    int _2593 = _2591 + _2283;
    float _2595 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2563);
    float _2597 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2529);
    bool _2599 = !_2147;
    int _2601 = _2599 ? _2587 : (-1);
    float _2603 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2541);
    bool _2605 = !_2159;
    int _2607 = _2605 ? _2593 : (-1);
    float _2609 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2509);
    int _2611 = _2601 >> 31;
    float _2613 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2511);
    int _2615 = _2607 >> 31;
    float _2617 = _2579 * _2531;
    int _2619 = _2611 & 3;
    float _2621 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2583);
    int _2623 = _2615 & 3;
    float _2625 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2613);
    int _2627 = _2601 + _2619;
    float _2629 = fma(_2479, _2595, _2617);
    int _2631 = _2601 & 3;
    bool _2633 = _2631 != 0;
    float _2635 = _2579 * _2545;
    int _2637 = _2607 + _2623;
    out.m_76.x = _2595;
    out.m_76.y = _2597;
    out.m_76.z = _2603;
    int _2639 = _2627 >> 2;
    float _2641 = fma(_2479, _2597, _2635);
    int _2643 = _2633 ? 0 : 1;
    float _2645 = _1981 * _1841;
    int _2647 = _2601 & 3;
    bool _2649 = _2647 != 0;
    float _2651 = -_1981;
    float _2653 = _2651 + 1.0;
    int _2655 = _2637 >> 2;
    int _2657 = _2639 << 4;
    int _2659 = _2657 + 368;
    int _2661 = _2655 << 4;
    int _2663 = _2661 + 512;
    float _2665 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    uint _2667 = uint(int(uint(_2659) >> uint(2)));
    uint _2669 = uint(int(uint(int(_2667)) >> uint(2)));
    int _2671 = int(_2667) & 3;
    float _2673 = (*spvDescriptorSet0.vp_c9)._m0[int(_2669)][_2671];
    int _2675 = int(_2667) + 1;
    uint _2677 = uint(int(uint(_2675) >> uint(2)));
    int _2679 = _2675 & 3;
    float _2681 = (*spvDescriptorSet0.vp_c9)._m0[int(_2677)][_2679];
    bool _2683 = !_2565;
    int _2685 = _2683 ? 0 : (-1);
    bool _2687 = uint(_2647) >= 2u;
    float _2689 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2665);
    bool _2691 = !_2589;
    int _2693 = _2691 ? 0 : (-1);
    bool _2695 = uint(_2647) > 1u;
    uint _2697 = uint(int(uint(_2663) >> uint(2)));
    uint _2699 = uint(int(uint(int(_2697)) >> uint(2)));
    int _2701 = int(_2697) & 3;
    float _2703 = (*spvDescriptorSet0.vp_c9)._m0[int(_2699)][_2701];
    int _2705 = int(_2697) + 1;
    uint _2707 = uint(int(uint(_2705) >> uint(2)));
    int _2709 = _2705 & 3;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[int(_2707)][_2709];
    int _2713 = _2687 ? 0 : 1;
    bool _2715 = _2647 != 3;
    int _2717 = ~_2477;
    int _2719 = _2717 + _2685;
    int _2721 = _2719 + 1;
    int _2723 = ~_2643;
    int _2725 = _2723 + 1;
    int _2727 = _2725 + 1;
    int _2729 = _2659 + 8;
    uint _2731 = uint(int(uint(_2729) >> uint(2)));
    uint _2733 = uint(int(uint(int(_2731)) >> uint(2)));
    int _2735 = int(_2731) & 3;
    float _2737 = (*spvDescriptorSet0.vp_c9)._m0[int(_2733)][_2735];
    int _2739 = int(_2731) + 1;
    uint _2741 = uint(int(uint(_2739) >> uint(2)));
    int _2743 = _2739 & 3;
    float _2745 = (*spvDescriptorSet0.vp_c9)._m0[int(_2741)][_2743];
    int _2747 = ~_2543;
    int _2749 = _2747 + _2693;
    int _2751 = _2749 + 1;
    int _2753 = _1890 * _2721;
    int _2755 = _2753 + _2225;
    int _2757 = ~_2713;
    int _2759 = _2757 + 1;
    int _2761 = _2759 + 1;
    int _2763 = _2727;
    int _2765 = _2761;
    if (!_2695)
    {
        int _2767 = ~_2643;
        int _2769 = _2767 + 1;
        _2763 = _2769;
    }
    int _2771 = _2763;
    int _2773 = _1866 * _2751;
    int _2775 = _2773 + _2247;
    int _2777 = _2607 & 3;
    bool _2779 = _2777 != 0;
    int _2781 = _2663 + 8;
    uint _2783 = uint(int(uint(_2781) >> uint(2)));
    uint _2785 = uint(int(uint(int(_2783)) >> uint(2)));
    int _2787 = int(_2783) & 3;
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[int(_2785)][_2787];
    int _2791 = int(_2783) + 1;
    uint _2793 = uint(int(uint(_2791) >> uint(2)));
    int _2795 = _2791 & 3;
    float _2797 = (*spvDescriptorSet0.vp_c9)._m0[int(_2793)][_2795];
    if (_2715)
    {
        int _2799 = ~_2713;
        int _2801 = _2799 + 1;
        _2765 = _2801;
    }
    int _2803 = _2765;
    float _2805 = _2579 * _2609;
    bool _2807 = uint(_2777) > 1u;
    bool _2809 = !_2649;
    int _2811 = _2809 ? 0 : 1;
    float _2813 = fma(_2479, _2603, _2805);
    int _2815 = _2607 & 3;
    bool _2817 = _2815 != 0;
    bool _2819 = !_2779;
    int _2821 = _2819 ? 0 : 1;
    int _2823 = _2817 ? 0 : 1;
    bool _2825 = uint(_2777) >= 2u;
    int _2827 = ~_2823;
    int _2829 = _2827 + 1;
    int _2831 = _2829 + 1;
    int _2833 = _2831;
    if (!_2807)
    {
        int _2835 = ~_2823;
        int _2837 = _2835 + 1;
        _2833 = _2837;
    }
    int _2839 = _2833;
    int _2841 = abs(_2771);
    int _2843 = abs(_2839);
    float _2845 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2689);
    bool _2847 = _2647 != 3;
    int _2849 = abs(_2811);
    float _2851 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2845);
    int _2853 = _2825 ? 0 : 1;
    bool _2855 = _2777 != 3;
    bool _2857 = _2777 != 3;
    float _2859 = _1862 * _2645;
    out.gl_Position.x = _1819;
    out.gl_Position.y = _1821;
    out.gl_Position.z = _2851;
    out.gl_Position.w = _1775;
    int _2861 = ~_2841;
    int _2863 = _2861 + 1;
    int _2865 = _2863 + 1;
    int _2867 = abs(_2821);
    int _2869 = _2865 * as_type<int>(_2681);
    int _2871 = ~_2843;
    int _2873 = _2871 + 1;
    int _2875 = _2873 + 1;
    int _2877 = abs(_2803);
    int _2879 = ~_2849;
    int _2881 = _2879 + 1;
    int _2883 = _2881 + 1;
    int _2885 = _2875 * as_type<int>(_2711);
    int _2887 = ~_2877;
    int _2889 = _2887 + 1;
    int _2891 = _2889 + 1;
    float _2893 = fma(_2579, _2579, 1.0);
    int _2895 = ~_2867;
    int _2897 = _2895 + 1;
    int _2899 = _2897 + 1;
    int _2901 = _2883 * as_type<int>(_2673);
    int _2903 = _2901 + _2869;
    int _2905 = ~_2853;
    int _2907 = _2905 + 1;
    int _2909 = _2907 + 1;
    int _2911 = _2909;
    if (_2855)
    {
        int _2913 = ~_2853;
        int _2915 = _2913 + 1;
        _2911 = _2915;
    }
    int _2917 = _2911;
    int _2919 = _2891 * as_type<int>(_2737);
    int _2921 = _2919 + _2903;
    bool _2923 = !_2489;
    int _2925 = _2923 ? 0 : 1;
    int _2927 = _2899 * as_type<int>(_2703);
    int _2929 = _2927 + _2885;
    bool _2931 = !_2847;
    int _2933 = _2931 ? 0 : (-1);
    float _2935 = rsqrt(_2893);
    bool _2937 = !_2857;
    int _2939 = _2937 ? 0 : (-1);
    int _2941 = abs(_2917);
    int _2943 = abs(_2925);
    int _2945 = abs(_2933);
    int _2947 = abs(_2939);
    bool _2949 = !_2505;
    int _2951 = _2949 ? 0 : 1;
    int _2953 = abs(_2951);
    int _2955 = ~_2941;
    int _2957 = _2955 + 1;
    int _2959 = _2957 + 1;
    int _2961 = ~_2945;
    int _2963 = _2961 + 1;
    int _2965 = _2963 + 1;
    int _2967 = _2959 * as_type<int>(_2789);
    int _2969 = _2967 + _2929;
    int _2971 = _2965 * as_type<int>(_2745);
    int _2973 = _2971 + _2921;
    int _2975 = ~_2947;
    int _2977 = _2975 + 1;
    int _2979 = _2977 + 1;
    int _2981 = ~_2953;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    int _2987 = ~_2943;
    int _2989 = _2987 + 1;
    int _2991 = _2989 + 1;
    int _2993 = _2979 * as_type<int>(_2797);
    int _2995 = _2993 + _2969;
    bool _2997 = !_2147;
    int _2999 = _2997 ? _2755 : (-1);
    bool _3001 = !_2159;
    int _3003 = _3001 ? _2775 : (-1);
    int _3005 = _2995 * _2985;
    float _3007 = _2579 * _2935;
    int _3009 = _2973 * _2991;
    int _3011 = _3003 * _2953;
    int _3013 = _3011 + _3005;
    float _3015 = -_2621;
    float _3017 = _3007 * _3015;
    int _3019 = _2999 * _2943;
    int _3021 = _3019 + _3009;
    float _3023 = -_2581;
    float _3025 = _3007 * _3023;
    float _3027 = -_2625;
    float _3029 = _3007 * _3027;
    float _3031 = fma(_2935, _2545, _3017);
    float _3033 = _1775 * 0.5;
    float _3035 = fma(_2935, _2531, _3025);
    float _3037 = _2851 + _1775;
    float _3039 = _1819 + _1775;
    float _3041 = fma(_1821, -0.5, _3033);
    float _3043 = float(_3021);
    float _3045 = fma(_2935, _2609, _3029);
    float _3047 = float(_3013);
    float _3049 = _2621 + _2641;
    float _3051 = _1852 * _2645;
    float _3053 = _3037 * 0.5;
    float _3055 = _3039 * 0.5;
    out.m_78.x = _3043;
    out.m_78.y = _3047;
    float _3057 = _2581 + _2629;
    float _3059 = _2625 + _2813;
    float _3061 = fma(_1858, _3051, _1846);
    float _3063 = fma(_1860, _3051, _1848);
    out.m_80.x = _3055;
    out.m_80.y = _3041;
    out.m_80.z = _3053;
    out.m_80.w = _1775;
    bool _3065 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3067 = isnan(_1549);
    bool _3069 = _3065 || _3067;
    bool _3071 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3073 = _3069 || _3071;
    float _3075 = _595 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_82.x = _3057;
    out.m_82.y = _3049;
    out.m_82.z = _3059;
    float _3077 = _1852 * _2653;
    float _3079 = fma(_1852, _2859, _1850);
    out.m_84.x = _3035;
    out.m_84.y = _3031;
    out.m_84.z = _3045;
    out.m_86.x = _3061;
    out.m_86.y = _3063;
    out.m_86.z = _3079;
    out.m_86.w = _3077;
    float _3081 = _3051;
    float _3083 = _3045;
    float _3085 = _3031;
    float _3087 = _3035;
    if (!_3073)
    {
        _3081 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3089 = _3081;
    float _3091 = _3089;
    float _3093 = _3089;
    if (!_3073)
    {
        _1902 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3095 = _1902;
    float _3097 = _3095;
    float _3099 = _3095;
    if (!_3073)
    {
        _603 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3101 = _603;
    float _3103 = _3101;
    float _3105 = _3101;
    if (!_3073)
    {
        _3083 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3107 = _3083;
    float _3109 = _3107;
    float _3111 = _3107;
    if (!_3073)
    {
        _3085 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3113 = _3085;
    float _3115 = _3113;
    float _3117 = _3113;
    if (!_3073)
    {
        _3087 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3119 = _3087;
    bool _3121 = !_3073;
    float _3123 = _3119;
    float _3125 = _3119;
    if (!_3121)
    {
        bool _3127 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3129 = isnan(_1549);
        bool _3131 = _3127 || _3129;
        bool _3133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3135 = _3131 || _3133;
        if (!_3135)
        {
            float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3139 = _1549 + _3137;
            float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3143 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3141;
            float _3145 = 1.0 / _3143;
            float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3149 = _3147 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3151 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3167 = _3139 * _3145;
            float _3169 = precise::clamp(_3167, 0.0, 1.0);
            float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3175 = fma(_3169, _3149, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3177 = fma(_3169, _3173, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3179 = fma(_3169, _3153, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3181 = fma(_3169, _3157, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3183 = fma(_3169, _3161, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3185 = fma(_3169, _3165, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3099 = _3177;
            _3117 = _3183;
            _3093 = _3175;
            _3111 = _3181;
            _3105 = _3179;
            _3125 = _3185;
            _3187 = true;
        }
        else
        {
            bool _3189 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3191 = isnan(_1549);
            bool _3193 = _3189 || _3191;
            bool _3195 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3197 = _3193 || _3195;
            if (!_3197)
            {
                _3091 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3199 = _3091;
            _3093 = _3199;
            if (!_3197)
            {
                _3097 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3201 = _3097;
            _3099 = _3201;
            if (!_3197)
            {
                _3103 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3203 = _3103;
            _3105 = _3203;
            if (!_3197)
            {
                _3109 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3205 = _3109;
            _3111 = _3205;
            if (!_3197)
            {
                _3115 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3207 = _3115;
            _3117 = _3207;
            if (!_3197)
            {
                _3123 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3209 = _3123;
            bool _3211 = !_3197;
            _3125 = _3209;
            if (!_3211)
            {
                bool _3213 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3215 = isnan(_1549);
                bool _3217 = _3213 || _3215;
                bool _3219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3221 = _3217 || _3219;
                if (!_3221)
                {
                    float _3223 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3225 = _1549 + _3223;
                    float _3227 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3229 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3227;
                    float _3231 = 1.0 / _3229;
                    float _3233 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3235 = _3233 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3237 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3239 = _3237 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3241 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3243 = _3241 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3245 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3253 = _3225 * _3231;
                    float _3255 = precise::clamp(_3253, 0.0, 1.0);
                    float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3261 = fma(_3255, _3235, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3263 = fma(_3255, _3259, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3265 = fma(_3255, _3239, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3267 = fma(_3255, _3243, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3269 = fma(_3255, _3247, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3271 = fma(_3255, _3251, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3099 = _3263;
                    _3117 = _3269;
                    _3093 = _3261;
                    _3111 = _3267;
                    _3105 = _3265;
                    _3125 = _3271;
                    _3187 = true;
                }
                else
                {
                    _3099 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3117 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3093 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3111 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3105 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3125 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3187 = false;
    float _3273 = _3099;
    float _3275 = _3117;
    float _3277 = _3093;
    float _3279 = _3111;
    float _3281 = _3105;
    float _3283 = _3125;
    float _3285 = fma(_3049, -0.5, 0.5);
    float _3287 = precise::clamp(_3285, 0.0, 1.0);
    float _3289 = -_3273;
    float _3291 = _3289 + _3275;
    float _3293 = -_3277;
    float _3295 = _3293 + _3279;
    float _3297 = -_3281;
    float _3299 = _3297 + _3283;
    bool _3301 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3303 = fma(_3287, _3291, _3273);
    float _3305 = fma(_3287, _3295, _3277);
    float _3307 = fma(_3287, _3299, _3281);
    float _3309 = _3075 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3311 = _3303 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3313 = fma(_3305, 0.298911988735198974609375, _3311);
    out.m_88.w = _3309;
    float _3315 = fma(_3307, 0.114477999508380889892578125, _3313);
    out.m_90.x = 0.0;
    float _3317 = -_3315;
    float _3319 = _3305 + _3317;
    float _3321 = -_3315;
    float _3323 = _3303 + _3321;
    float _3325 = -_3315;
    float _3327 = _3307 + _3325;
    float _3329 = fma(_3319, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3315);
    float _3331 = fma(_3323, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3315);
    float _3333 = fma(_3327, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3315);
    out.m_92.x = _3329;
    out.m_92.y = _3331;
    out.m_92.z = _3333;
    if (!_3301)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3335 = -_1523;
    float _3337 = _3335 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3339 = -_1525;
    float _3341 = _3339 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3343 = -_1527;
    float _3345 = _3343 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3347 = _3337 * _3337;
    float _3349 = fma(_3341, _3341, _3347);
    float _3351 = fma(_3345, _3345, _3349);
    float _3353 = sqrt(_3351);
    float _3355 = rsqrt(_3351);
    float _3357 = -_3353;
    float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3361 = _3359 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3363 = precise::clamp(_3361, 0.0, 1.0);
    float _3365 = _3341 * _3355;
    float _3367 = _3337 * _3355;
    float _3369 = abs(_3363);
    float _3371 = log2(_3369);
    float _3373 = _3345 * _3355;
    float _3375 = _3365 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3377 = _3049 * _3367;
    float _3379 = -_3367;
    float _3381 = -_3375;
    float _3383 = fma(_3379, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3381);
    float _3385 = fma(_3057, _3365, _3377);
    float _3387 = -_3373;
    float _3389 = fma(_3387, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3383);
    float _3391 = fma(_3059, _3373, _3385);
    float _3393 = precise::clamp(_3391, 0.0, 1.0);
    float _3395 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3397 = _3389 + _3395;
    float _3399 = _3371 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3401 = _3397 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3403 = precise::clamp(_3401, 0.0, 1.0);
    float _3405 = exp2(_3399);
    float _3407 = _3405 * _3403;
    float _3409 = _3393 * _3407;
    float _3411 = _3409 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3413 = _3409 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3415 = _3409 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3411;
    out.m_90.y = _3413;
    out.m_90.z = _3415;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3187 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = in.m_46.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = _108;
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3483 = as_type<float>(_135);
        out.gl_Position.z = _3483;
    }
    if (!_121)
    {
        return out;
    }
    bool _139 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_108);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = in.m_53.x;
    float _151 = float(_113);
    float _153 = in.m_53.y;
    bool _155 = _117 >= _151;
    bool _157 = !_147;
    bool _159 = _155 || _157;
    float _161 = in.m_53.z;
    if (_159)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _125;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _137 = as_type<int>(_165);
    }
    int _167 = _137;
    out.m_55.x = _149;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3546 = as_type<float>(_167);
        out.gl_Position.z = _3546;
    }
    out.m_55.y = _153;
    out.m_55.z = _161;
    if (_159)
    {
        return out;
    }
    float _169 = in.m_57.x;
    float _171 = in.m_57.y;
    float _173 = in.m_57.z;
    float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _177 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _179 = in.m_59.x;
    float _181 = in.m_59.y;
    float _183 = in.m_59.z;
    bool _185 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _187 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _189 = _185 || _187;
    bool _191 = isnan(1.0);
    bool _193 = _189 || _191;
    float _195 = in.m_61.x;
    float _197 = in.m_61.y;
    float _199 = in.m_61.z;
    float _201 = as_type<float>(int(gl_VertexIndex));
    float _203 = _177 * _175;
    float _205 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[20].x, _203);
    float _207 = _171 * _171;
    float _209 = _173 * _173;
    float _211 = _169 * _169;
    float _213 = _205 * 6.283185482025146484375;
    float _215 = fma(_181, _181, _207);
    float _217 = fma(_183, _183, _209);
    float _219 = fma(_179, _179, _211);
    float _221 = _213 * 0.15915493667125701904296875;
    float _223 = fma(_197, _197, _215);
    float _225 = fma(_199, _199, _217);
    float _227 = fma(_195, _195, _219);
    float _229 = floor(_205);
    float _231 = sqrt(_223);
    float _233 = sqrt(_227);
    float _235 = -_229;
    float _237 = _205 + _235;
    bool _239 = _231 > 0.0;
    float _241 = sqrt(_225);
    bool _243 = _233 > 0.0;
    float _245 = _221 * 6.283185482025146484375;
    float _247 = cos(_245);
    int _249 = as_type<int>(_201) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_201) & 2;
    bool _255 = _253 != 0;
    float _257 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _259 = _213;
    float _261 = _231;
    float _263 = _227;
    float _265 = _223;
    float _267 = _205;
    float _269 = _257;
    float _271 = _229;
    float _273 = _225;
    float _275 = _173;
    float _277 = _171;
    if (_239)
    {
        float _279 = rsqrt(_223);
        _259 = _279;
    }
    float _281 = _259;
    if (!_193)
    {
        float _283 = _257 * _257;
        float _285 = _283 * 0.5;
        _261 = _285;
    }
    float _287 = _261;
    bool _289 = _241 > 0.0;
    bool _291 = !_251;
    float _293 = _291 ? (-0.5) : 0.5;
    float _295 = _287;
    float _297 = _241;
    if (!_193)
    {
        float _299 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _299;
    }
    float _301 = _295;
    bool _303 = !_255;
    float _305 = _303 ? (-0.5) : 0.5;
    float _307 = 0.0;
    float _309 = _301;
    if (_243)
    {
        float _311 = rsqrt(_227);
        _307 = _311;
    }
    float _313 = _307;
    if (!_193)
    {
        _263 = _257;
    }
    float _315 = _263;
    bool _317 = !_193;
    float _319 = _315;
    float _321 = _281;
    if (!_317)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = _257 * _325;
        float _335 = 1.0 / _329;
        float _337 = _331 * 0.693147182464599609375;
        float _339 = exp2(_333);
        float _341 = 1.0 / _337;
        float _343 = _339 + (-1.0);
        float _345 = -_343;
        float _347 = fma(_345, _341, _257);
        float _349 = _347 * _335;
        float _351 = _349 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _309 = _351;
        _297 = _339;
        _265 = _341;
        _267 = _335;
    }
    float _353 = _309;
    float _355 = _297;
    float _357 = _265;
    float _359 = _267;
    bool _361 = !_193;
    float _363 = _355;
    float _365 = _357;
    float _367 = _359;
    if (!_361)
    {
        float _369 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _371 = log2(_369);
        float _373 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _375 = _373 + 1.0;
        float _377 = 1.0 / _375;
        float _379 = _257 * _371;
        float _381 = exp2(_379);
        float _383 = -_381;
        float _385 = _383 + 1.0;
        float _387 = _385 * _377;
        _269 = _379;
        _319 = _387;
    }
    float _389 = _269;
    float _391 = _319;
    float _393 = 0.0;
    float _395 = _389;
    if (_289)
    {
        float _397 = rsqrt(_225);
        _393 = _397;
    }
    float _399 = _393;
    float _401 = 0.0;
    if (!_243)
    {
        _401 = 0.0;
    }
    float _403 = _401;
    float _405 = _403;
    if (_243)
    {
        float _407 = _313 * _179;
        _405 = _407;
    }
    float _409 = _405;
    if (!_243)
    {
        _395 = 0.0;
    }
    float _411 = _395;
    float _413 = _411;
    if (_243)
    {
        float _415 = _313 * _169;
        _413 = _415;
    }
    float _417 = _413;
    float _419 = 0.0;
    if (!_243)
    {
        _419 = 0.0;
    }
    float _421 = _419;
    float _423 = _421;
    if (_243)
    {
        float _425 = _313 * _195;
        _423 = _425;
    }
    float _427 = _423;
    float _429 = fma(_247, 0.5, 0.5);
    bool _431 = _237 < 0.5;
    float _433 = float(_431);
    float _435 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (!_239)
    {
        _363 = 0.0;
    }
    float _437 = _363;
    float _439 = _437;
    if (_239)
    {
        float _441 = _281 * _171;
        _439 = _441;
    }
    float _443 = _439;
    if (!_289)
    {
        _365 = 0.0;
    }
    float _445 = _365;
    float _447 = -_433;
    float _449 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _451 = -_429;
    float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _455 = _445;
    if (_289)
    {
        float _457 = _399 * _173;
        _455 = _457;
    }
    float _459 = _455;
    float _461 = _435 * _417;
    float _463 = _435 * _443;
    float _465 = _435 * _459;
    if (!_239)
    {
        _367 = 0.0;
    }
    float _467 = _367;
    float _469 = in.m_46.x;
    float _471 = in.m_46.y;
    float _473 = in.m_46.z;
    float _475 = _467;
    if (!_239)
    {
        _271 = 0.0;
    }
    float _477 = _271;
    float _479 = _477;
    if (_239)
    {
        float _481 = _281 * _181;
        _475 = _481;
    }
    float _483 = _475;
    if (_239)
    {
        float _485 = _281 * _197;
        _479 = _485;
    }
    float _487 = _479;
    float _489 = -_237;
    float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    if (!_289)
    {
        _321 = 0.0;
    }
    float _493 = _321;
    float _495 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _497 = _493;
    if (_289)
    {
        float _499 = _399 * _183;
        _497 = _499;
    }
    float _501 = _497;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _505 = _503 != 0;
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _509 = _507 != 0;
    float _511 = fma(_495, _409, _461);
    if (!_289)
    {
        _273 = 0.0;
    }
    float _513 = _273;
    float _515 = fma(_495, _483, _463);
    int _517 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _519 = _517 != 0;
    float _521 = fma(_495, _501, _465);
    float _523 = _513;
    if (_289)
    {
        float _525 = _399 * _199;
        _523 = _525;
    }
    float _527 = _523;
    bool _529 = !_505;
    int _531 = _529 ? 0 : 1;
    float _533 = in.m_66.w;
    float _535 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _537 = !_519;
    int _539 = _537 ? 0 : 1;
    float _541 = in.m_44.x;
    float _543 = in.m_44.y;
    float _545 = in.m_44.z;
    int _547 = abs(_531);
    float _549 = fma(_535, _427, _511);
    float _551 = fma(_535, _487, _515);
    float _553 = fma(_535, _527, _521);
    int _555 = abs(_539);
    float _557 = 1.0 / _151;
    bool _559 = !_509;
    int _561 = _559 ? 0 : 1;
    bool _563 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _565 = abs(_561);
    float _567 = fma(_391, _469, _549);
    float _569 = float(_547);
    float _571 = fma(_391, _471, _551);
    float _573 = float(_555);
    float _575 = abs(_491);
    float _577 = _569 * _575;
    float _579 = fma(_391, _473, _553);
    float _581 = _117 * _557;
    float _583 = float(_565);
    float _585 = fma(_573, _453, _577);
    float _587 = fma(_567, _533, _541);
    float _589 = fma(_571, _533, _543);
    float _591 = fma(_579, _533, _545);
    float _593 = abs(_449);
    float _595 = fma(_583, _593, _585);
    bool _597 = !_563;
    float _599 = _581;
    float _601 = _591;
    float _603 = _595;
    if (!_597)
    {
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _607 = _149 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _599 = _617;
    }
    float _619 = _599;
    float _621 = _153 * 2.0;
    float _623 = _149 * 2.0;
    float _625 = _149 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _627 = floor(_621);
    float _629 = _161 * 2.0;
    float _631 = _153 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _635 = floor(_623);
    float _637 = _149 + _153;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _641 = _639 != 0;
    float _643 = -_633;
    float _645 = fma(_625, 2.0, _643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _651 = _637 + (-1.0);
    float _653 = _153 + (-0.5);
    float _655 = 1.0 / _649;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _657;
    float _661 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _675 = 1.0 / _659;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _679 = _619 + _677;
    bool _681 = _635 >= 0.0;
    bool _683 = isnan(_635);
    bool _685 = _681 || _683;
    bool _687 = isnan(0.0);
    bool _689 = _685 || _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _699 = _627 > 0.0;
    float _701 = -_117;
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[76].x, _645);
    float _705 = 1.0 / _665;
    float _707 = _153 + _161;
    bool _709 = _635 > 0.0;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _713 = _707 + (-1.0);
    float _715 = floor(_629);
    bool _717 = _627 >= 0.0;
    bool _719 = isnan(_627);
    bool _721 = _717 || _719;
    bool _723 = isnan(0.0);
    bool _725 = _721 || _723;
    float _727 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _731 = _619 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _737;
    float _741 = fma(_631, -2.0, _711);
    float _743 = _731 * _675;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _747 = _619 + _745;
    float _749 = _679 * _705;
    int _751 = as_type<int>(_705);
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_641)
    {
        _751 = 0;
    }
    int _755 = _751;
    float _757 = _149 + _161;
    float _759 = _747 * _655;
    int _761 = _755;
    if (!_641)
    {
        _761 = 1;
    }
    int _763 = _761;
    float _765 = fma(_735, _749, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _767 = fma(_739, _749, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _769 = fma(_673, _759, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _771 = fma(_697, _759, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _773 = _689 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _775 = _757 + (-1.0);
    bool _777 = _763 != 1;
    float _779 = fma(_669, _743, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _781 = _715 >= 0.0;
    bool _783 = isnan(_715);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    float _791 = fma(_693, _743, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _793 = _715 > 0.0;
    float _795 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _797 = int(_795);
    int _799 = _725 ? 0 : 1;
    float _801 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _741);
    int _803 = _789 ? 0 : 1;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _807 = _805 != 0;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _815 = _813 != 0;
    float _817 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _819 = log2(_817);
    int _821 = ~_799;
    int _823 = _821 + 1;
    int _825 = _823 + 1;
    int _827 = ~as_type<int>(_773);
    int _829 = _827 + 1;
    int _831 = _829 + 1;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _835 = _825;
    int _837 = _831;
    float _839 = _773;
    float _841 = as_type<float>(_797);
    if (!_699)
    {
        int _843 = ~_799;
        int _845 = _843 + 1;
        _835 = _845;
    }
    int _847 = _835;
    float _849 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _851 = int(_849);
    if (!_709)
    {
        int _853 = ~as_type<int>(_773);
        int _855 = _853 + 1;
        _837 = _855;
    }
    int _857 = _837;
    bool _859 = !_811;
    int _861 = _859 ? 0 : 1;
    float _863 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _865 = !_807;
    int _867 = _865 ? 0 : 1;
    bool _869 = !_815;
    int _871 = _869 ? 0 : 1;
    float _873 = _819 * _117;
    if (!_777)
    {
        _839 = _153;
    }
    float _875 = _839;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _883 = _881 != 0;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _887 = _885 != 0;
    float _889 = _875;
    if (_777)
    {
        _889 = _149;
    }
    float _891 = _889;
    int _893 = ~_803;
    int _895 = _893 + 1;
    int _897 = _895 + 1;
    bool _899 = !_883;
    int _901 = _899 ? 0 : 1;
    float _903 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[83].z, _833);
    int _905 = _897;
    if (!_793)
    {
        int _907 = ~_803;
        int _909 = _907 + 1;
        _905 = _909;
    }
    int _911 = _905;
    float _913 = in.m_68.x;
    float _915 = in.m_68.y;
    float _917 = in.m_68.z;
    bool _919 = !_887;
    int _921 = _919 ? 0 : 1;
    float _923 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _903);
    int _925 = abs(_901);
    int _927 = abs(_921);
    bool _929 = !_879;
    float _931 = _929 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _933 = float(_857);
    float _935 = float(_925);
    int _937 = abs(as_type<int>(_931));
    float _939 = _935 * _933;
    float _941 = _931;
    float _943 = _935;
    if (!_777)
    {
        _941 = _161;
    }
    float _945 = _941;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _949 = _945;
    if (_777)
    {
        _949 = _153;
    }
    float _951 = _949;
    float _953 = float(_847);
    float _955 = float(_927);
    float _957 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[83].w, _947);
    if (!_777)
    {
        _943 = _153;
    }
    float _959 = _943;
    float _961 = _959;
    if (_777)
    {
        _961 = _149;
    }
    float _963 = _961;
    float _965 = _955 * _953;
    float _967 = float(_797);
    float _969 = _963 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_777)
    {
        _841 = _161;
    }
    float _971 = _841;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _975 = _939 * (-2.0);
    float _977 = _971;
    if (_777)
    {
        _977 = _153;
    }
    float _979 = _977;
    float _981 = -_973;
    float _983 = fma(_969, 2.0, _981);
    float _985 = float(_937);
    float _987 = fma(_727, _975, _727);
    float _989 = fma(_975, _915, _915);
    float _991 = exp2(_873);
    float _993 = float(_851);
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _997 = _979 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _999 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].y, _989);
    float _1001 = float(_911);
    float _1003 = fma(_997, -2.0, _995);
    float _1005 = 1.0 / _993;
    float _1007 = _985 * _1001;
    bool _1009 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1011 = isnan(1.0);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1017 = _1013 || _1015;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1021 = _557 * _117;
    float _1023 = 1.0 / _967;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1027 = 1.0 + _1025;
    bool _1029 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1031 = isnan(_619);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1019);
    float _1043 = -_991;
    float _1045 = _1043 + 1.0;
    bool _1047 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1049 = isnan(0.0);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1055 = _1051 || _1053;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1059 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1061 = isnan(_619);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = 1.0 / _1027;
    float _1073 = -_1039;
    float _1075 = _1073 + 1.0;
    float _1077 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1057);
    float _1079 = _1055 ? _1045 : 0.0;
    float _1081 = -_117;
    float _1083 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[81].x, _983);
    float _1085 = _1069 * _1075;
    float _1087 = -_1069;
    float _1089 = _1087 + 1.0;
    float _1091 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1041);
    float _1093 = _1023 * _117;
    float _1095 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _957);
    float _1097 = _1005 * _117;
    float _1099 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1077);
    float _1101 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1003);
    float _1103 = _1007 * (-2.0);
    if (_1017)
    {
        float _1105 = _1079 * _1071;
        _127 = _1105;
    }
    float _1107 = _127;
    bool _1109 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1111 = isnan(_619);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1117 = _1113 || _1115;
    float _1119 = float(_1117);
    float _1121 = fma(_661, _1103, _661);
    float _1123 = fma(_1103, _913, _913);
    float _1125 = fma(_987, _1107, _999);
    float _1127 = _149 + (-0.5);
    bool _1129 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1131 = isnan(_619);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1137 = _1133 || _1135;
    float _1139 = float(_1137);
    float _1141 = _1119 * _1089;
    float _1143 = -_1119;
    float _1145 = _1143 + 1.0;
    float _1147 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1123);
    float _1149 = _1125 * 0.15915493667125701904296875;
    float _1151 = in.m_66.x;
    float _1153 = in.m_66.y;
    float _1155 = _1139 * _1145;
    float _1157 = _965 * (-2.0);
    float _1159 = -_1139;
    float _1161 = _1159 + 1.0;
    float _1163 = fma(_1121, _1107, _1147);
    float _1165 = _779 * _1155;
    float _1167 = _791 * _1155;
    float _1169 = fma(_1157, _917, _917);
    float _1171 = _161 + (-0.5);
    float _1173 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1165);
    float _1175 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1167);
    float _1177 = fma(_863, _1157, _863);
    float _1179 = fma(_1171, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1169);
    float _1181 = fma(_769, _1141, _1173);
    float _1183 = fma(_771, _1141, _1175);
    float _1185 = _1163 * 0.15915493667125701904296875;
    float _1187 = fma(_1177, _1107, _1179);
    float _1189 = fma(_765, _1085, _1181);
    float _1191 = fma(_767, _1085, _1183);
    float _1193 = _1149 * 6.283185482025146484375;
    float _1195 = sin(_1193);
    float _1197 = _1187 * 0.15915493667125701904296875;
    float _1199 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1189);
    float _1201 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1191);
    float _1203 = _589 * _197;
    float _1205 = in.m_61.w;
    float _1207 = _1199 * _1151;
    float _1209 = _1201 * _1153;
    float _1211 = _1149 * 6.283185482025146484375;
    float _1213 = cos(_1211);
    float _1215 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _305);
    float _1217 = _595 * _1207;
    float _1219 = _595 * _1209;
    float _1221 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _293);
    float _1223 = fma(_587, _195, _1203);
    float _1225 = _1217 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1227 = _1219 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1229 = _1185 * 6.283185482025146484375;
    float _1231 = sin(_1229);
    float _1233 = in.m_59.w;
    float _1235 = _1225 * _1221;
    float _1237 = _1227 * _1215;
    float _1239 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1241 = fma(_591, _199, _1223);
    float _1243 = in.m_57.w;
    float _1245 = _1197 * 6.283185482025146484375;
    float _1247 = cos(_1245);
    float _1249 = _1241 + _1205;
    float _1251 = _1185 * 6.283185482025146484375;
    float _1253 = cos(_1251);
    float _1255 = _1231 * _1195;
    float _1257 = _1231 * _1213;
    float _1259 = _1197 * 6.283185482025146484375;
    float _1261 = sin(_1259);
    float _1263 = _1231 * _1247;
    float _1265 = _1195 * _1247;
    float _1267 = _1263 * _1237;
    float _1269 = _1253 * _1213;
    float _1271 = _1253 * _1195;
    float _1273 = _1253 * _1247;
    float _1275 = _1213 * _1247;
    float _1277 = _1273 * _1237;
    float _1279 = fma(_1261, _1269, _1255);
    float _1281 = -_1237;
    float _1283 = _1261 * _1281;
    float _1285 = -_1257;
    float _1287 = fma(_1261, _1271, _1285);
    float _1289 = -_1271;
    float _1291 = fma(_1261, _1257, _1289);
    float _1293 = fma(_1279, _1235, _1277);
    float _1295 = fma(_1275, _1235, _1283);
    float _1297 = fma(_1261, _1255, _1269);
    float _1299 = fma(_1291, _1235, _1267);
    float _1301 = fma(_1287, _1239, _1293);
    float _1303 = fma(_1265, _1239, _1295);
    float _1305 = _589 * _181;
    float _1307 = fma(_1297, _1239, _1299);
    float _1309 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1311 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1313 = fma(_587, _179, _1305);
    float _1315 = _589 * _171;
    float _1317 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1309);
    float _1319 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1311);
    float _1321 = fma(_591, _183, _1313);
    float _1323 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1325 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1317);
    float _1327 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1319);
    float _1329 = _1321 + _1233;
    float _1331 = fma(_587, _169, _1315);
    float _1333 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1335 = _1327 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1337 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1323);
    float _1339 = fma(_591, _173, _1331);
    float _1341 = _1249 + _1333;
    float _1343 = _1329 + _1335;
    float _1345 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1337);
    float _1347 = _1339 + _1243;
    float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1351 = _1341 + _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1355 = _1343 + _1353;
    float _1357 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1359 = _1351 * _1351;
    float _1361 = _1347 + _1357;
    float _1363 = fma(_1355, _1355, _1359);
    float _1365 = sqrt(_1363);
    bool _1367 = _1365 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1371 = _1369 != 0;
    int _1373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1375 = _1373 != 0;
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1379 = _1377 != 0;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1383 = _1381 != 0;
    bool _1385 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1387 = isnan(0.5);
    bool _1389 = _1385 || _1387;
    bool _1391 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1393 = _1389 || _1391;
    bool _1395 = !_1375;
    int _1397 = _1395 ? 0 : 1;
    bool _1399 = !_1371;
    int _1401 = _1399 ? 0 : 1;
    bool _1403 = !_1379;
    int _1405 = _1403 ? 0 : 1;
    bool _1407 = !_1383;
    int _1409 = _1407 ? 0 : 1;
    float _1411 = _1357;
    float _1413 = _1243;
    float _1415 = _1293;
    if (!_1367)
    {
        _1411 = _1343;
    }
    float _1417 = _1411;
    float _1419 = _1417;
    if (!_1367)
    {
        _275 = _1341;
    }
    float _1421 = _275;
    float _1423 = _1421;
    if (!_1367)
    {
        _277 = _1361;
    }
    float _1425 = _277;
    bool _1427 = !_1367;
    float _1429 = _1425;
    if (!_1427)
    {
        float _1431 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1435 = _1365 + _1433;
        float _1437 = _1361 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1439 = rsqrt(_1363);
        float _1441 = _1435 * _1431;
        float _1443 = _1441 * 0.15915493667125701904296875;
        float _1445 = _1443 * 6.283185482025146484375;
        float _1447 = cos(_1445);
        float _1449 = _1443 * 6.283185482025146484375;
        float _1451 = sin(_1449);
        float _1453 = _1447 + (-1.0);
        float _1455 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1457 = fma(_1451, _1437, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1459 = fma(_1361, _1447, _1455);
        float _1461 = _1439 * _1457;
        float _1463 = fma(_1355, _1461, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1465 = fma(_1351, _1461, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1419 = _1463;
        _1429 = _1459;
        _1423 = _1465;
    }
    float _1467 = _1419;
    float _1469 = _1429;
    float _1471 = _1423;
    float _1473 = _1469;
    float _1475 = _1467;
    float _1477 = _1471;
    if (!_1393)
    {
        float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1481 = _1347 + _1479;
        float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1485 = _1329 + _1483;
        float _1487 = _1481 * _1481;
        float _1489 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1491 = _1249 + _1489;
        float _1493 = fma(_1485, _1485, _1487);
        float _1495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1497 = fma(_1491, _1491, _1493);
        float _1499 = -_1329;
        float _1501 = _1499 + _1467;
        float _1503 = sqrt(_1497);
        float _1505 = precise::min(_1503, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1507 = _1505 * _1495;
        float _1509 = -_1347;
        float _1511 = _1509 + _1469;
        float _1513 = -_1249;
        float _1515 = _1513 + _1471;
        float _1517 = fma(_1501, _1507, _1329);
        float _1519 = fma(_1511, _1507, _1347);
        float _1521 = fma(_1515, _1507, _1249);
        _1473 = _1519;
        _1475 = _1517;
        _1477 = _1521;
    }
    float _1523 = _1473;
    float _1525 = _1475;
    float _1527 = _1477;
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1531 = _1523 + _1529;
    float _1533 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1535 = _1525 + _1533;
    float _1537 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1539 = _1527 + _1537;
    float _1541 = _1531 * _1531;
    float _1543 = fma(_1535, _1535, _1541);
    float _1545 = fma(_1539, _1539, _1543);
    float _1547 = rsqrt(_1545);
    float _1549 = sqrt(_1545);
    float _1551 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1553 = _1535 * _1551;
    float _1555 = _1539 * _1551;
    float _1557 = _1553 * _1553;
    float _1559 = _1555 * _1555;
    float _1561 = _1557 + _1559;
    float _1563 = sqrt(_1561);
    bool _1565 = _1563 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1567 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1569 = _1563 + _1567;
    float _1571 = _1547;
    float _1573 = _1561;
    float _1575 = _1569;
    float _1577 = _1551;
    float _1579 = _1531;
    if (_1565)
    {
        float _1581 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1571 = _1581;
    }
    float _1583 = _1571;
    if (_1565)
    {
        float _1585 = rsqrt(_1561);
        _1573 = _1585;
    }
    float _1587 = _1573;
    if (_1565)
    {
        float _1589 = _1569 * _1583;
        _1575 = _1589;
    }
    float _1591 = _1575;
    if (_1565)
    {
        float _1593 = _1591 * 0.15915493667125701904296875;
        _1413 = _1593;
    }
    float _1595 = _1413;
    float _1597 = _1583;
    if (_1565)
    {
        float _1599 = _1595 * 6.283185482025146484375;
        float _1601 = sin(_1599);
        _1597 = _1601;
    }
    float _1603 = _1597;
    float _1605 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1607 = precise::max(0.0, _1605);
    float _1609 = _1539;
    float _1611 = _1607;
    if (_1565)
    {
        float _1613 = _1595 * 6.283185482025146484375;
        float _1615 = cos(_1613);
        _1609 = _1615;
    }
    float _1617 = _1609;
    float _1619 = -_1551;
    float _1621 = -_1607;
    float _1623 = fma(_1531, _1619, _1621);
    if (_1565)
    {
        float _1625 = _1623 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1611 = _1625;
    }
    float _1627 = _1611;
    float _1629 = _1603;
    float _1631 = _1627;
    if (_1565)
    {
        float _1633 = fma(_1603, _1627, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1577 = _1633;
    }
    float _1635 = _1577;
    float _1637 = _1635;
    if (!_1565)
    {
        _1629 = _1553;
    }
    float _1639 = _1629;
    float _1641 = _1639;
    if (!_1565)
    {
        _1631 = _1623;
    }
    float _1643 = _1631;
    float _1645 = _1643;
    float _1647 = _1617;
    if (_1565)
    {
        float _1649 = _1617 + (-1.0);
        _1579 = _1649;
    }
    float _1651 = _1579;
    float _1653 = _1651;
    if (_1565)
    {
        float _1655 = _1587 * _1635;
        _1415 = _1655;
    }
    float _1657 = _1415;
    if (!_1565)
    {
        _1637 = _1557;
    }
    float _1659 = _1637;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1663 = fma(_1549, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1661);
    float _1665 = precise::clamp(_1663, 0.0, 1.0);
    float _1667 = _1659;
    if (_1565)
    {
        float _1669 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _601 = _1669;
    }
    float _1671 = _601;
    if (_1565)
    {
        float _1673 = _1553 * _1657;
        _1641 = _1673;
    }
    float _1675 = _1641;
    if (!_1565)
    {
        _1653 = _1555;
    }
    float _1677 = _1653;
    float _1679 = _1677;
    if (_1565)
    {
        float _1681 = _1555 * _1657;
        _1679 = _1681;
    }
    float _1683 = _1679;
    if (_1565)
    {
        float _1685 = fma(_1623, _1617, _1671);
        _1645 = _1685;
    }
    float _1687 = _1645;
    if (_1565)
    {
        float _1689 = _1675 * _1675;
        _1667 = _1689;
    }
    float _1691 = _1667;
    if (!_1565)
    {
        _1647 = _1559;
    }
    float _1693 = _1647;
    float _1695 = _1693;
    if (_1565)
    {
        float _1697 = _1683 * _1683;
        _1695 = _1697;
    }
    float _1699 = _1695;
    float _1701 = _1523 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1703 = fma(_1687, _1687, _1691);
    float _1705 = -_1665;
    float _1707 = _1705 + 1.0;
    float _1709 = _1523 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1711 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1701);
    float _1713 = _1703 + _1699;
    float _1715 = _1523 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1717 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1709);
    float _1719 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1711);
    float _1721 = abs(_1707);
    float _1723 = log2(_1721);
    float _1725 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1715);
    float _1727 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1717);
    float _1729 = _1719 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1731 = _1523 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1733 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1725);
    float _1735 = _1727 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1737 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1739 = rsqrt(_1713);
    float _1741 = _1733 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1743 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1745 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1731);
    float _1747 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1749 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1751 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1743);
    float _1753 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1745);
    float _1755 = -_1747;
    float _1757 = fma(_1755, _1737, 1.0);
    float _1759 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1751);
    float _1761 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1763 = log2(_1757);
    float _1765 = _1739 * _1675;
    float _1767 = _1739 * _1687;
    float _1769 = _1739 * _1683;
    float _1771 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1773 = _1765 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1775 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1759);
    float _1777 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1749);
    float _1779 = -_1773;
    float _1781 = fma(_1767, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1779);
    float _1783 = exp2(_1771);
    float _1785 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1777);
    float _1787 = -_1769;
    float _1789 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1781);
    float _1791 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1793 = _1763 * 0.693147182464599609375;
    float _1795 = fma(_1789, -0.5, 0.5);
    float _1797 = 1.0 / _1775;
    float _1799 = fma(_1789, 0.5, 0.5);
    float _1801 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1791);
    float _1803 = _1767 + 1.0;
    float _1805 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1807 = fma(_1799, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1809 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1801);
    float _1811 = sqrt(_1795);
    float _1813 = fma(_1799, _1807, -0.212114393711090087890625);
    float _1815 = -_1767;
    float _1817 = fma(_1783, _1803, _1815);
    float _1819 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1809);
    float _1821 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1785);
    float _1823 = fma(_1799, _1813, 1.570728778839111328125);
    float _1825 = fma(_1817, 0.5, 0.5);
    float _1827 = _1819 * _1797;
    float _1829 = _1821 * _1797;
    float _1831 = fma(_1829, -0.5, 0.5);
    float _1833 = _1811 * 0.636619746685028076171875;
    float _1835 = fma(_1827, 0.5, 0.5);
    float _1837 = -_1823;
    float _1839 = fma(_1833, _1837, 1.0);
    float3 _6109 = float3(_1835, _1831, _1805);
    float _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6109, float3(0.0), isnan(_6109)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6109, float3(0.0), isnan(_6109)), level(0.0)).x;
    float3 _6120 = float3(_1835, _1831, _1805);
    float4 _1844 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6120, float3(0.0), isnan(_6120)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6120, float3(0.0), isnan(_6120)), level(0.0)).xyzw;
    float _1846 = _1844.x;
    float _1848 = _1844.y;
    float _1850 = _1844.z;
    float _1852 = _1844.w;
    float2 _6137 = float2(_1839, _1825);
    float3 _1856 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6137, float2(0.0), isnan(_6137)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6137, float2(0.0), isnan(_6137)), level(0.0)).xyz;
    float _1858 = _1856.x;
    float _1860 = _1856.y;
    float _1862 = _1856.z;
    float _1864 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1866 = int(_1864);
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1870 = _1868 != 0;
    float _1872 = -_1091;
    float _1874 = _1872 + 1.0;
    int _1876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1878 = _1876 != 0;
    out.m_70.x = _1329;
    out.m_70.y = _1347;
    out.m_70.z = _1249;
    bool _1880 = _153 > 0.5;
    float _1882 = -_1099;
    float _1884 = _1882 + 1.0;
    bool _1886 = _149 > 0.5;
    float _1888 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1890 = int(_1888);
    bool _1892 = _161 > 0.5;
    float _1894 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1896 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1898 = _1896 != 0;
    out.m_72.x = _1525;
    out.m_72.y = _1523;
    out.m_72.z = _1527;
    int _1900 = abs(_861);
    float _1902 = _1819;
    if (_1870)
    {
        _753 = 1.0;
    }
    float _1904 = _753;
    float _1906 = trunc(_1093);
    int _1908 = int(_1906);
    float _1910 = float(uint(_1866));
    float _1912 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1914 = ~_1866;
    int _1916 = _1914 + 1;
    float _1918 = _1904;
    if (!_1870)
    {
        _1918 = 7.345489978790283203125;
    }
    float _1920 = _1918;
    float _1922 = float(_1866);
    float _1924 = 1.0 / _1910;
    float _1926 = float(uint(_1890));
    float _1928 = _1920 * _149;
    int _1930 = abs(_867);
    int _1932 = abs(_1397);
    int _1934 = abs(_871);
    float _1936 = 1.0 / _1926;
    float _1938 = trunc(_1097);
    int _1940 = int(_1938);
    float _1942 = float(uint(_1908));
    int _1944 = as_type<int>(_1924) + (-2);
    int _1946 = ~_1890;
    int _1948 = _1946 + 1;
    int _1950 = abs(_1401);
    float _1952 = exp2(_1894);
    int _1954 = as_type<int>(_1936) + (-2);
    int _1956 = abs(_1405);
    float _1958 = as_type<float>(_1954) * _1942;
    float _1960 = float(uint(_1940));
    float _1962 = trunc(_1958);
    float _1964 = precise::max(_1962, 0.0);
    uint _1967 = uint(_1964);
    float _1969 = as_type<float>(_1944) * _1960;
    float _1971 = -_1952;
    float _1973 = _1971 + 1.0;
    float _1975 = trunc(_1969);
    float _1977 = precise::max(_1975, 0.0);
    uint _1979 = uint(_1977);
    float _1981 = _1973 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1983 = _1948 * int(_1967);
    int _1985 = _1983 + _1908;
    float _1987 = float(uint(_1985));
    int _1989 = _1916 * int(_1979);
    int _1991 = _1989 + _1940;
    float _1993 = float(uint(_1991));
    float _1995 = as_type<float>(_1954) * _1987;
    float _1997 = _1987;
    float _1999 = _1993;
    if (_1870)
    {
        _1997 = 1.0;
    }
    float _2001 = _1997;
    float _2003 = _2001;
    if (!_1870)
    {
        _2003 = 1.2345600128173828125;
    }
    float _2005 = _2003;
    float _2007 = as_type<float>(_1944) * _1993;
    if (_1870)
    {
        _1999 = _149;
    }
    float _2009 = _1999;
    float _2011 = trunc(_1995);
    float _2013 = precise::max(_2011, 0.0);
    uint _2015 = uint(_2013);
    float _2017 = _2009;
    if (!_1870)
    {
        _2017 = _153;
    }
    float _2019 = _2017;
    int _2021 = ~_1866;
    int _2023 = _2021 + 1;
    float _2025 = _2005 * _2019;
    float _2027 = trunc(_2007);
    float _2029 = precise::max(_2027, 0.0);
    uint _2031 = uint(_2029);
    int _2033 = int(_1967) + int(_2015);
    float _2035 = floor(_1928);
    int _2037 = ~_1890;
    int _2039 = _2037 + 1;
    float _2041 = float(_1890);
    int _2043 = _2039 * _2033;
    int _2045 = _2043 + _1908;
    int _2047 = int(_1979) + int(_2031);
    float _2049 = floor(_2025);
    float _2051 = float(_1908);
    bool _2053 = uint(_2045) >= uint(_1890);
    int _2055 = _2023 * _2047;
    int _2057 = _2055 + _1940;
    float _2059 = float(_1940);
    bool _2061 = _2051 >= _2041;
    bool _2063 = isnan(_2051);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan(_2041);
    bool _2069 = _2065 || _2067;
    float _2071 = float(_2069);
    float _2073 = -_2035;
    float _2075 = _1928 + _2073;
    bool _2077 = uint(_2057) >= uint(_1866);
    bool _2079 = _2059 >= _1922;
    bool _2081 = isnan(_2059);
    bool _2083 = _2079 || _2081;
    bool _2085 = isnan(_1922);
    bool _2087 = _2083 || _2085;
    float _2089 = float(_2087);
    float _2091 = trunc(_2071);
    int _2093 = int(_2091);
    bool _2095 = !_2053;
    int _2097 = _2095 ? 0 : (-1);
    float _2099 = -_2049;
    float _2101 = _2025 + _2099;
    bool _2103 = !_2077;
    int _2105 = _2103 ? 0 : (-1);
    int _2107 = ~_2033;
    int _2109 = _2107 + _2097;
    int _2111 = _2109 + 1;
    float _2113 = trunc(_2089);
    int _2115 = int(_2113);
    int _2117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2119 = _2117 != 0;
    float _2121 = _2075 * _2041;
    int _2123 = ~_2047;
    int _2125 = _2123 + _2105;
    int _2127 = _2125 + 1;
    int _2129 = _1890 * _2111;
    int _2131 = _2129 + _1908;
    int _2133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2135 = _2133 != 0;
    float _2137 = _2041 * _1021;
    bool _2139 = !_2119;
    int _2141 = _2139 ? 0 : 1;
    int _2143 = _1866 * _2127;
    int _2145 = _2143 + _1940;
    bool _2147 = _1890 == 0;
    float _2149 = trunc(_2121);
    int _2151 = int(_2149);
    bool _2153 = !_2135;
    int _2155 = _2153 ? 0 : 1;
    float _2157 = _1922 * _1021;
    bool _2159 = _1866 == 0;
    float _2161 = _2101 * _1922;
    int _2163 = ~_2093;
    int _2165 = _2163 + 1;
    int _2167 = _2165 + 1;
    bool _2169 = !_2147;
    int _2171 = _2169 ? _2131 : (-1);
    float _2173 = trunc(_2137);
    int _2175 = int(_2173);
    int _2177 = ~_2115;
    int _2179 = _2177 + 1;
    int _2181 = _2179 + 1;
    bool _2183 = !_2159;
    int _2185 = _2183 ? _2145 : (-1);
    int _2187 = _2171 * _2167;
    int _2189 = _1890 + (-1);
    int _2191 = _1866 + (-1);
    int _2193 = _2185 * _2181;
    int _2195 = abs(_2141);
    int _2197 = _2093 * _2189;
    int _2199 = _2197 + _2187;
    float _2201 = trunc(_2161);
    int _2203 = int(_2201);
    int _2205 = _2115 * _2191;
    int _2207 = _2205 + _2193;
    int _2209 = _2199 * _1900;
    int _2211 = abs(_2155);
    int _2213 = _2207 * _1932;
    int _2215 = ~_1866;
    int _2217 = _2215 + 1;
    float _2219 = trunc(_2157);
    int _2221 = int(_2219);
    int _2223 = _2151 * _2195;
    int _2225 = _2223 + _1908;
    int _2227 = _2175 * _1930;
    int _2229 = _2227 + _2209;
    float _2231 = in.m_53.w;
    float _2233 = -_293;
    int _2235 = _1886 ? as_type<int>(_2233) : as_type<int>(_293);
    int _2237 = _2225 * _1934;
    int _2239 = _2237 + _2229;
    bool _2241 = !_1878;
    int _2243 = _2241 ? 0 : 1;
    int _2245 = _2203 * _2211;
    int _2247 = _2245 + _1940;
    float _2249 = float(uint(_2225));
    int _2251 = abs(_2243);
    bool _2253 = !_1898;
    float _2255 = _2253 ? _293 : as_type<float>(_2235);
    float _2257 = as_type<float>(_1954) * _2249;
    int _2259 = _2221 * _1950;
    int _2261 = _2259 + _2213;
    int _2263 = abs(_1409);
    float _2265 = _2255 + 0.5;
    int _2267 = _2247 * _1956;
    int _2269 = _2267 + _2261;
    float _2271 = float(uint(_2247));
    float _2273 = trunc(_2257);
    float _2275 = precise::max(_2273, 0.0);
    uint _2277 = uint(_2275);
    float _2279 = fma(_2265, (*spvDescriptorSet0.vp_c9)._m0[80].x, _703);
    int _2281 = _2203 * _2263;
    int _2283 = _2281 + _2269;
    bool _2285 = _2231 > 0.5;
    int _2287 = _2151 * _2251;
    int _2289 = _2287 + _2239;
    float _2291 = as_type<float>(_1944) * _2271;
    int _2293 = ~_1890;
    int _2295 = _2293 + 1;
    float _2297 = -_1874;
    float _2299 = fma(_2255, _2297, _2279);
    float _2301 = float(uint(_2283));
    float _2303 = float(uint(_2289));
    float _2305 = trunc(_2291);
    float _2307 = precise::max(_2305, 0.0);
    uint _2309 = uint(_2307);
    int _2311 = ~_1866;
    int _2313 = _2311 + 1;
    float _2315 = as_type<float>(_1944) * _2301;
    int _2317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2319 = _2317 != 0;
    float _2321 = as_type<float>(_1954) * _2303;
    int _2323 = _2295 * int(_2277);
    int _2325 = _2323 + _2225;
    float _2327 = -_305;
    int _2329 = _1880 ? as_type<int>(_2327) : as_type<int>(_305);
    float _2331 = trunc(_2315);
    float _2333 = precise::max(_2331, 0.0);
    uint _2335 = uint(_2333);
    int _2337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2339 = _2337 != 0;
    float _2341 = float(uint(_2325));
    int _2343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2345 = _2343 != 0;
    float _2347 = -_293;
    int _2349 = _1892 ? as_type<int>(_2347) : as_type<int>(_293);
    float _2351 = trunc(_2321);
    float _2353 = precise::max(_2351, 0.0);
    uint _2355 = uint(_2353);
    int _2357 = _2313 * int(_2309);
    int _2359 = _2357 + _2247;
    float _2361 = as_type<float>(_1954) * _2341;
    float _2363 = -_305;
    int _2365 = _2285 ? as_type<int>(_2363) : as_type<int>(_305);
    int _2367 = ~_1890;
    int _2369 = _2367 + 1;
    bool _2371 = !_2319;
    float _2373 = _2371 ? _305 : as_type<float>(_2329);
    int _2375 = _2217 * int(_2335);
    int _2377 = _2375 + _2283;
    float _2379 = float(uint(_2359));
    float _2381 = trunc(_2361);
    float _2383 = precise::max(_2381, 0.0);
    uint _2385 = uint(_2383);
    bool _2387 = !_2339;
    float _2389 = _2387 ? _293 : as_type<float>(_2349);
    float _2391 = _2373 + (-0.5);
    bool _2393 = !_2345;
    float _2395 = _2393 ? _305 : as_type<float>(_2365);
    float _2397 = as_type<float>(_1944) * _2379;
    float _2399 = float(uint(_2377));
    int _2401 = _2369 * int(_2355);
    int _2403 = _2401 + _2289;
    float _2405 = _2389 + 0.5;
    float _2407 = _2395 + (-0.5);
    float _2409 = -_2391;
    float _2411 = -_801;
    float _2413 = fma(_2409, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2411);
    float _2415 = as_type<float>(_1944) * _2399;
    float _2417 = float(uint(_2403));
    float _2419 = fma(_2405, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1083);
    float _2421 = -_2407;
    float _2423 = -_1101;
    float _2425 = fma(_2421, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2423);
    float _2427 = -_1095;
    float _2429 = _2427 + 1.0;
    float _2431 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2433 = as_type<float>(_1954) * _2417;
    float _2435 = -_923;
    float _2437 = _2435 + 1.0;
    float _2439 = fma(_2395, _2429, _2425);
    float _2441 = -_1261;
    float _2443 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2431);
    float _2445 = trunc(_2415);
    float _2447 = precise::max(_2445, 0.0);
    uint _2449 = uint(_2447);
    int _2451 = ~_1866;
    int _2453 = _2451 + 1;
    float _2455 = fma(_2373, _1884, _2413);
    int _2457 = ~_1890;
    int _2459 = _2457 + 1;
    float _2461 = -_2437;
    float _2463 = fma(_2389, _2461, _2419);
    float _2465 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2467 = trunc(_2433);
    float _2469 = precise::max(_2467, 0.0);
    uint _2471 = uint(_2469);
    out.m_74.x = _2299;
    out.m_74.y = _2455;
    out.m_74.z = _2463;
    out.m_74.w = _2439;
    float _2473 = -_1261;
    float _2475 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2465);
    int _2477 = int(_2277) + int(_2385);
    float _2479 = _293 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2481 = ~_1890;
    int _2483 = _2481 + 1;
    float _2485 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2489 = _2487 != 0;
    float _2491 = trunc(_2397);
    float _2493 = precise::max(_2491, 0.0);
    uint _2495 = uint(_2493);
    int _2497 = int(_2335) + int(_2449);
    int _2499 = _2483 * _2477;
    int _2501 = _2499 + _2225;
    int _2503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2505 = _2503 != 0;
    float _2507 = -_1261;
    float _2509 = fma(_2507, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2485);
    float _2511 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2513 = _2453 * _2497;
    int _2515 = _2513 + _2283;
    int _2517 = ~_1866;
    int _2519 = _2517 + 1;
    float _2521 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2523 = int(_2355) + int(_2471);
    float _2525 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2527 = uint(_2515) >= uint(_1866);
    float _2529 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2521);
    float _2531 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2443);
    int _2533 = _2459 * _2523;
    int _2535 = _2533 + _2289;
    bool _2537 = !_2527;
    int _2539 = _2537 ? 0 : (-1);
    float _2541 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2525);
    int _2543 = int(_2309) + int(_2495);
    float _2545 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2475);
    bool _2547 = uint(_2535) >= uint(_1890);
    float _2549 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2551 = ~_2497;
    int _2553 = _2551 + _2539;
    int _2555 = _2553 + 1;
    float _2557 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2559 = !_2547;
    int _2561 = _2559 ? 0 : (-1);
    float _2563 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2549);
    bool _2565 = uint(_2501) >= uint(_1890);
    float _2567 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2557);
    int _2569 = ~_2523;
    int _2571 = _2569 + _2561;
    int _2573 = _2571 + 1;
    int _2575 = _2519 * _2543;
    int _2577 = _2575 + _2247;
    float _2579 = _305 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2581 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2567);
    float _2583 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1912);
    int _2585 = _1890 * _2573;
    int _2587 = _2585 + _2289;
    bool _2589 = uint(_2577) >= uint(_1866);
    int _2591 = _1866 * _2555;
    int _2593 = _2591 + _2283;
    float _2595 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2563);
    float _2597 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2529);
    bool _2599 = !_2147;
    int _2601 = _2599 ? _2587 : (-1);
    float _2603 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2541);
    bool _2605 = !_2159;
    int _2607 = _2605 ? _2593 : (-1);
    float _2609 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2509);
    int _2611 = _2601 >> 31;
    float _2613 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2511);
    int _2615 = _2607 >> 31;
    float _2617 = _2579 * _2531;
    int _2619 = _2611 & 3;
    float _2621 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2583);
    int _2623 = _2615 & 3;
    float _2625 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2613);
    int _2627 = _2601 + _2619;
    float _2629 = fma(_2479, _2595, _2617);
    int _2631 = _2601 & 3;
    bool _2633 = _2631 != 0;
    float _2635 = _2579 * _2545;
    int _2637 = _2607 + _2623;
    out.m_76.x = _2595;
    out.m_76.y = _2597;
    out.m_76.z = _2603;
    int _2639 = _2627 >> 2;
    float _2641 = fma(_2479, _2597, _2635);
    int _2643 = _2633 ? 0 : 1;
    float _2645 = _1981 * _1841;
    int _2647 = _2601 & 3;
    bool _2649 = _2647 != 0;
    float _2651 = -_1981;
    float _2653 = _2651 + 1.0;
    int _2655 = _2637 >> 2;
    int _2657 = _2639 << 4;
    int _2659 = _2657 + 368;
    int _2661 = _2655 << 4;
    int _2663 = _2661 + 512;
    float _2665 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    uint _2667 = uint(int(uint(_2659) >> uint(2)));
    uint _2669 = uint(int(uint(int(_2667)) >> uint(2)));
    int _2671 = int(_2667) & 3;
    float _2673 = (*spvDescriptorSet0.vp_c9)._m0[int(_2669)][_2671];
    int _2675 = int(_2667) + 1;
    uint _2677 = uint(int(uint(_2675) >> uint(2)));
    int _2679 = _2675 & 3;
    float _2681 = (*spvDescriptorSet0.vp_c9)._m0[int(_2677)][_2679];
    bool _2683 = !_2565;
    int _2685 = _2683 ? 0 : (-1);
    bool _2687 = uint(_2647) >= 2u;
    float _2689 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2665);
    bool _2691 = !_2589;
    int _2693 = _2691 ? 0 : (-1);
    bool _2695 = uint(_2647) > 1u;
    uint _2697 = uint(int(uint(_2663) >> uint(2)));
    uint _2699 = uint(int(uint(int(_2697)) >> uint(2)));
    int _2701 = int(_2697) & 3;
    float _2703 = (*spvDescriptorSet0.vp_c9)._m0[int(_2699)][_2701];
    int _2705 = int(_2697) + 1;
    uint _2707 = uint(int(uint(_2705) >> uint(2)));
    int _2709 = _2705 & 3;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[int(_2707)][_2709];
    int _2713 = _2687 ? 0 : 1;
    bool _2715 = _2647 != 3;
    int _2717 = ~_2477;
    int _2719 = _2717 + _2685;
    int _2721 = _2719 + 1;
    int _2723 = ~_2643;
    int _2725 = _2723 + 1;
    int _2727 = _2725 + 1;
    int _2729 = _2659 + 8;
    uint _2731 = uint(int(uint(_2729) >> uint(2)));
    uint _2733 = uint(int(uint(int(_2731)) >> uint(2)));
    int _2735 = int(_2731) & 3;
    float _2737 = (*spvDescriptorSet0.vp_c9)._m0[int(_2733)][_2735];
    int _2739 = int(_2731) + 1;
    uint _2741 = uint(int(uint(_2739) >> uint(2)));
    int _2743 = _2739 & 3;
    float _2745 = (*spvDescriptorSet0.vp_c9)._m0[int(_2741)][_2743];
    int _2747 = ~_2543;
    int _2749 = _2747 + _2693;
    int _2751 = _2749 + 1;
    int _2753 = _1890 * _2721;
    int _2755 = _2753 + _2225;
    int _2757 = ~_2713;
    int _2759 = _2757 + 1;
    int _2761 = _2759 + 1;
    int _2763 = _2727;
    int _2765 = _2761;
    if (!_2695)
    {
        int _2767 = ~_2643;
        int _2769 = _2767 + 1;
        _2763 = _2769;
    }
    int _2771 = _2763;
    int _2773 = _1866 * _2751;
    int _2775 = _2773 + _2247;
    int _2777 = _2607 & 3;
    bool _2779 = _2777 != 0;
    int _2781 = _2663 + 8;
    uint _2783 = uint(int(uint(_2781) >> uint(2)));
    uint _2785 = uint(int(uint(int(_2783)) >> uint(2)));
    int _2787 = int(_2783) & 3;
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[int(_2785)][_2787];
    int _2791 = int(_2783) + 1;
    uint _2793 = uint(int(uint(_2791) >> uint(2)));
    int _2795 = _2791 & 3;
    float _2797 = (*spvDescriptorSet0.vp_c9)._m0[int(_2793)][_2795];
    if (_2715)
    {
        int _2799 = ~_2713;
        int _2801 = _2799 + 1;
        _2765 = _2801;
    }
    int _2803 = _2765;
    float _2805 = _2579 * _2609;
    bool _2807 = uint(_2777) > 1u;
    bool _2809 = !_2649;
    int _2811 = _2809 ? 0 : 1;
    float _2813 = fma(_2479, _2603, _2805);
    int _2815 = _2607 & 3;
    bool _2817 = _2815 != 0;
    bool _2819 = !_2779;
    int _2821 = _2819 ? 0 : 1;
    int _2823 = _2817 ? 0 : 1;
    bool _2825 = uint(_2777) >= 2u;
    int _2827 = ~_2823;
    int _2829 = _2827 + 1;
    int _2831 = _2829 + 1;
    int _2833 = _2831;
    if (!_2807)
    {
        int _2835 = ~_2823;
        int _2837 = _2835 + 1;
        _2833 = _2837;
    }
    int _2839 = _2833;
    int _2841 = abs(_2771);
    int _2843 = abs(_2839);
    float _2845 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2689);
    bool _2847 = _2647 != 3;
    int _2849 = abs(_2811);
    float _2851 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2845);
    int _2853 = _2825 ? 0 : 1;
    bool _2855 = _2777 != 3;
    bool _2857 = _2777 != 3;
    float _2859 = _1862 * _2645;
    out.gl_Position.x = _1819;
    out.gl_Position.y = _1821;
    out.gl_Position.z = _2851;
    out.gl_Position.w = _1775;
    int _2861 = ~_2841;
    int _2863 = _2861 + 1;
    int _2865 = _2863 + 1;
    int _2867 = abs(_2821);
    int _2869 = _2865 * as_type<int>(_2681);
    int _2871 = ~_2843;
    int _2873 = _2871 + 1;
    int _2875 = _2873 + 1;
    int _2877 = abs(_2803);
    int _2879 = ~_2849;
    int _2881 = _2879 + 1;
    int _2883 = _2881 + 1;
    int _2885 = _2875 * as_type<int>(_2711);
    int _2887 = ~_2877;
    int _2889 = _2887 + 1;
    int _2891 = _2889 + 1;
    float _2893 = fma(_2579, _2579, 1.0);
    int _2895 = ~_2867;
    int _2897 = _2895 + 1;
    int _2899 = _2897 + 1;
    int _2901 = _2883 * as_type<int>(_2673);
    int _2903 = _2901 + _2869;
    int _2905 = ~_2853;
    int _2907 = _2905 + 1;
    int _2909 = _2907 + 1;
    int _2911 = _2909;
    if (_2855)
    {
        int _2913 = ~_2853;
        int _2915 = _2913 + 1;
        _2911 = _2915;
    }
    int _2917 = _2911;
    int _2919 = _2891 * as_type<int>(_2737);
    int _2921 = _2919 + _2903;
    bool _2923 = !_2489;
    int _2925 = _2923 ? 0 : 1;
    int _2927 = _2899 * as_type<int>(_2703);
    int _2929 = _2927 + _2885;
    bool _2931 = !_2847;
    int _2933 = _2931 ? 0 : (-1);
    float _2935 = rsqrt(_2893);
    bool _2937 = !_2857;
    int _2939 = _2937 ? 0 : (-1);
    int _2941 = abs(_2917);
    int _2943 = abs(_2925);
    int _2945 = abs(_2933);
    int _2947 = abs(_2939);
    bool _2949 = !_2505;
    int _2951 = _2949 ? 0 : 1;
    int _2953 = abs(_2951);
    int _2955 = ~_2941;
    int _2957 = _2955 + 1;
    int _2959 = _2957 + 1;
    int _2961 = ~_2945;
    int _2963 = _2961 + 1;
    int _2965 = _2963 + 1;
    int _2967 = _2959 * as_type<int>(_2789);
    int _2969 = _2967 + _2929;
    int _2971 = _2965 * as_type<int>(_2745);
    int _2973 = _2971 + _2921;
    int _2975 = ~_2947;
    int _2977 = _2975 + 1;
    int _2979 = _2977 + 1;
    int _2981 = ~_2953;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    int _2987 = ~_2943;
    int _2989 = _2987 + 1;
    int _2991 = _2989 + 1;
    int _2993 = _2979 * as_type<int>(_2797);
    int _2995 = _2993 + _2969;
    bool _2997 = !_2147;
    int _2999 = _2997 ? _2755 : (-1);
    bool _3001 = !_2159;
    int _3003 = _3001 ? _2775 : (-1);
    int _3005 = _2995 * _2985;
    float _3007 = _2579 * _2935;
    int _3009 = _2973 * _2991;
    int _3011 = _3003 * _2953;
    int _3013 = _3011 + _3005;
    float _3015 = -_2621;
    float _3017 = _3007 * _3015;
    int _3019 = _2999 * _2943;
    int _3021 = _3019 + _3009;
    float _3023 = -_2581;
    float _3025 = _3007 * _3023;
    float _3027 = -_2625;
    float _3029 = _3007 * _3027;
    float _3031 = fma(_2935, _2545, _3017);
    float _3033 = _1775 * 0.5;
    float _3035 = fma(_2935, _2531, _3025);
    float _3037 = _2851 + _1775;
    float _3039 = _1819 + _1775;
    float _3041 = fma(_1821, -0.5, _3033);
    float _3043 = float(_3021);
    float _3045 = fma(_2935, _2609, _3029);
    float _3047 = float(_3013);
    float _3049 = _2621 + _2641;
    float _3051 = _1852 * _2645;
    float _3053 = _3037 * 0.5;
    float _3055 = _3039 * 0.5;
    out.m_78.x = _3043;
    out.m_78.y = _3047;
    float _3057 = _2581 + _2629;
    float _3059 = _2625 + _2813;
    float _3061 = fma(_1858, _3051, _1846);
    float _3063 = fma(_1860, _3051, _1848);
    out.m_80.x = _3055;
    out.m_80.y = _3041;
    out.m_80.z = _3053;
    out.m_80.w = _1775;
    bool _3065 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3067 = isnan(_1549);
    bool _3069 = _3065 || _3067;
    bool _3071 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3073 = _3069 || _3071;
    float _3075 = _595 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_82.x = _3057;
    out.m_82.y = _3049;
    out.m_82.z = _3059;
    float _3077 = _1852 * _2653;
    float _3079 = fma(_1852, _2859, _1850);
    out.m_84.x = _3035;
    out.m_84.y = _3031;
    out.m_84.z = _3045;
    out.m_86.x = _3061;
    out.m_86.y = _3063;
    out.m_86.z = _3079;
    out.m_86.w = _3077;
    float _3081 = _3051;
    float _3083 = _3045;
    float _3085 = _3031;
    float _3087 = _3035;
    if (!_3073)
    {
        _3081 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3089 = _3081;
    float _3091 = _3089;
    float _3093 = _3089;
    if (!_3073)
    {
        _1902 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3095 = _1902;
    float _3097 = _3095;
    float _3099 = _3095;
    if (!_3073)
    {
        _603 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3101 = _603;
    float _3103 = _3101;
    float _3105 = _3101;
    if (!_3073)
    {
        _3083 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3107 = _3083;
    float _3109 = _3107;
    float _3111 = _3107;
    if (!_3073)
    {
        _3085 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3113 = _3085;
    float _3115 = _3113;
    float _3117 = _3113;
    if (!_3073)
    {
        _3087 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3119 = _3087;
    bool _3121 = !_3073;
    float _3123 = _3119;
    float _3125 = _3119;
    if (!_3121)
    {
        bool _3127 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3129 = isnan(_1549);
        bool _3131 = _3127 || _3129;
        bool _3133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3135 = _3131 || _3133;
        if (!_3135)
        {
            float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3139 = _1549 + _3137;
            float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3143 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3141;
            float _3145 = 1.0 / _3143;
            float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3149 = _3147 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3151 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3167 = _3139 * _3145;
            float _3169 = precise::clamp(_3167, 0.0, 1.0);
            float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3175 = fma(_3169, _3149, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3177 = fma(_3169, _3173, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3179 = fma(_3169, _3153, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3181 = fma(_3169, _3157, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3183 = fma(_3169, _3161, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3185 = fma(_3169, _3165, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3099 = _3177;
            _3117 = _3183;
            _3093 = _3175;
            _3111 = _3181;
            _3105 = _3179;
            _3125 = _3185;
            _3187 = true;
        }
        else
        {
            bool _3189 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3191 = isnan(_1549);
            bool _3193 = _3189 || _3191;
            bool _3195 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3197 = _3193 || _3195;
            if (!_3197)
            {
                _3091 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3199 = _3091;
            _3093 = _3199;
            if (!_3197)
            {
                _3097 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3201 = _3097;
            _3099 = _3201;
            if (!_3197)
            {
                _3103 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3203 = _3103;
            _3105 = _3203;
            if (!_3197)
            {
                _3109 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3205 = _3109;
            _3111 = _3205;
            if (!_3197)
            {
                _3115 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3207 = _3115;
            _3117 = _3207;
            if (!_3197)
            {
                _3123 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3209 = _3123;
            bool _3211 = !_3197;
            _3125 = _3209;
            if (!_3211)
            {
                bool _3213 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3215 = isnan(_1549);
                bool _3217 = _3213 || _3215;
                bool _3219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3221 = _3217 || _3219;
                if (!_3221)
                {
                    float _3223 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3225 = _1549 + _3223;
                    float _3227 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3229 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3227;
                    float _3231 = 1.0 / _3229;
                    float _3233 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3235 = _3233 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3237 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3239 = _3237 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3241 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3243 = _3241 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3245 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3253 = _3225 * _3231;
                    float _3255 = precise::clamp(_3253, 0.0, 1.0);
                    float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3261 = fma(_3255, _3235, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3263 = fma(_3255, _3259, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3265 = fma(_3255, _3239, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3267 = fma(_3255, _3243, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3269 = fma(_3255, _3247, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3271 = fma(_3255, _3251, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3099 = _3263;
                    _3117 = _3269;
                    _3093 = _3261;
                    _3111 = _3267;
                    _3105 = _3265;
                    _3125 = _3271;
                    _3187 = true;
                }
                else
                {
                    _3099 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3117 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3093 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3111 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3105 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3125 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3187 = false;
    float _3273 = _3099;
    float _3275 = _3117;
    float _3277 = _3093;
    float _3279 = _3111;
    float _3281 = _3105;
    float _3283 = _3125;
    float _3285 = fma(_3049, -0.5, 0.5);
    float _3287 = precise::clamp(_3285, 0.0, 1.0);
    float _3289 = -_3273;
    float _3291 = _3289 + _3275;
    float _3293 = -_3277;
    float _3295 = _3293 + _3279;
    float _3297 = -_3281;
    float _3299 = _3297 + _3283;
    bool _3301 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3303 = fma(_3287, _3291, _3273);
    float _3305 = fma(_3287, _3295, _3277);
    float _3307 = fma(_3287, _3299, _3281);
    float _3309 = _3075 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3311 = _3303 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3313 = fma(_3305, 0.298911988735198974609375, _3311);
    out.m_88.w = _3309;
    float _3315 = fma(_3307, 0.114477999508380889892578125, _3313);
    out.m_90.x = 0.0;
    float _3317 = -_3315;
    float _3319 = _3305 + _3317;
    float _3321 = -_3315;
    float _3323 = _3303 + _3321;
    float _3325 = -_3315;
    float _3327 = _3307 + _3325;
    float _3329 = fma(_3319, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3315);
    float _3331 = fma(_3323, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3315);
    float _3333 = fma(_3327, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3315);
    out.m_92.x = _3329;
    out.m_92.y = _3331;
    out.m_92.z = _3333;
    if (!_3301)
    {
        return out;
    }
    float _3335 = -_1523;
    float _3337 = _3335 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3339 = -_1525;
    float _3341 = _3339 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3343 = -_1527;
    float _3345 = _3343 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3347 = _3337 * _3337;
    float _3349 = fma(_3341, _3341, _3347);
    float _3351 = fma(_3345, _3345, _3349);
    float _3353 = sqrt(_3351);
    float _3355 = rsqrt(_3351);
    float _3357 = -_3353;
    float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3361 = _3359 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3363 = precise::clamp(_3361, 0.0, 1.0);
    float _3365 = _3341 * _3355;
    float _3367 = _3337 * _3355;
    float _3369 = abs(_3363);
    float _3371 = log2(_3369);
    float _3373 = _3345 * _3355;
    float _3375 = _3365 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3377 = _3049 * _3367;
    float _3379 = -_3367;
    float _3381 = -_3375;
    float _3383 = fma(_3379, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3381);
    float _3385 = fma(_3057, _3365, _3377);
    float _3387 = -_3373;
    float _3389 = fma(_3387, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3383);
    float _3391 = fma(_3059, _3373, _3385);
    float _3393 = precise::clamp(_3391, 0.0, 1.0);
    float _3395 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3397 = _3389 + _3395;
    float _3399 = _3371 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3401 = _3397 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3403 = precise::clamp(_3401, 0.0, 1.0);
    float _3405 = exp2(_3399);
    float _3407 = _3405 * _3403;
    float _3409 = _3393 * _3407;
    float _3411 = _3409 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3413 = _3409 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3415 = _3409 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3411;
    out.m_90.y = _3413;
    out.m_90.z = _3415;
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
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3187 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = in.m_46.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = _108;
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3483 = as_type<float>(_135);
        out.gl_Position.z = _3483;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _139 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_108);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = in.m_53.x;
    float _151 = float(_113);
    float _153 = in.m_53.y;
    bool _155 = _117 >= _151;
    bool _157 = !_147;
    bool _159 = _155 || _157;
    float _161 = in.m_53.z;
    if (_159)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _125;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _137 = as_type<int>(_165);
    }
    int _167 = _137;
    out.m_55.x = _149;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3546 = as_type<float>(_167);
        out.gl_Position.z = _3546;
    }
    out.m_55.y = _153;
    out.m_55.z = _161;
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = in.m_57.x;
    float _171 = in.m_57.y;
    float _173 = in.m_57.z;
    float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _177 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _179 = in.m_59.x;
    float _181 = in.m_59.y;
    float _183 = in.m_59.z;
    bool _185 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _187 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _189 = _185 || _187;
    bool _191 = isnan(1.0);
    bool _193 = _189 || _191;
    float _195 = in.m_61.x;
    float _197 = in.m_61.y;
    float _199 = in.m_61.z;
    float _201 = as_type<float>(int(gl_VertexIndex));
    float _203 = _177 * _175;
    float _205 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[20].x, _203);
    float _207 = _171 * _171;
    float _209 = _173 * _173;
    float _211 = _169 * _169;
    float _213 = _205 * 6.283185482025146484375;
    float _215 = fma(_181, _181, _207);
    float _217 = fma(_183, _183, _209);
    float _219 = fma(_179, _179, _211);
    float _221 = _213 * 0.15915493667125701904296875;
    float _223 = fma(_197, _197, _215);
    float _225 = fma(_199, _199, _217);
    float _227 = fma(_195, _195, _219);
    float _229 = floor(_205);
    float _231 = sqrt(_223);
    float _233 = sqrt(_227);
    float _235 = -_229;
    float _237 = _205 + _235;
    bool _239 = _231 > 0.0;
    float _241 = sqrt(_225);
    bool _243 = _233 > 0.0;
    float _245 = _221 * 6.283185482025146484375;
    float _247 = cos(_245);
    int _249 = as_type<int>(_201) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_201) & 2;
    bool _255 = _253 != 0;
    float _257 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _259 = _213;
    float _261 = _231;
    float _263 = _227;
    float _265 = _223;
    float _267 = _205;
    float _269 = _257;
    float _271 = _229;
    float _273 = _225;
    float _275 = _173;
    float _277 = _171;
    if (_239)
    {
        float _279 = rsqrt(_223);
        _259 = _279;
    }
    float _281 = _259;
    if (!_193)
    {
        float _283 = _257 * _257;
        float _285 = _283 * 0.5;
        _261 = _285;
    }
    float _287 = _261;
    bool _289 = _241 > 0.0;
    bool _291 = !_251;
    float _293 = _291 ? (-0.5) : 0.5;
    float _295 = _287;
    float _297 = _241;
    if (!_193)
    {
        float _299 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _299;
    }
    float _301 = _295;
    bool _303 = !_255;
    float _305 = _303 ? (-0.5) : 0.5;
    float _307 = 0.0;
    float _309 = _301;
    if (_243)
    {
        float _311 = rsqrt(_227);
        _307 = _311;
    }
    float _313 = _307;
    if (!_193)
    {
        _263 = _257;
    }
    float _315 = _263;
    bool _317 = !_193;
    float _319 = _315;
    float _321 = _281;
    if (!_317)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = _257 * _325;
        float _335 = 1.0 / _329;
        float _337 = _331 * 0.693147182464599609375;
        float _339 = exp2(_333);
        float _341 = 1.0 / _337;
        float _343 = _339 + (-1.0);
        float _345 = -_343;
        float _347 = fma(_345, _341, _257);
        float _349 = _347 * _335;
        float _351 = _349 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _309 = _351;
        _297 = _339;
        _265 = _341;
        _267 = _335;
    }
    float _353 = _309;
    float _355 = _297;
    float _357 = _265;
    float _359 = _267;
    bool _361 = !_193;
    float _363 = _355;
    float _365 = _357;
    float _367 = _359;
    if (!_361)
    {
        float _369 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _371 = log2(_369);
        float _373 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _375 = _373 + 1.0;
        float _377 = 1.0 / _375;
        float _379 = _257 * _371;
        float _381 = exp2(_379);
        float _383 = -_381;
        float _385 = _383 + 1.0;
        float _387 = _385 * _377;
        _269 = _379;
        _319 = _387;
    }
    float _389 = _269;
    float _391 = _319;
    float _393 = 0.0;
    float _395 = _389;
    if (_289)
    {
        float _397 = rsqrt(_225);
        _393 = _397;
    }
    float _399 = _393;
    float _401 = 0.0;
    if (!_243)
    {
        _401 = 0.0;
    }
    float _403 = _401;
    float _405 = _403;
    if (_243)
    {
        float _407 = _313 * _179;
        _405 = _407;
    }
    float _409 = _405;
    if (!_243)
    {
        _395 = 0.0;
    }
    float _411 = _395;
    float _413 = _411;
    if (_243)
    {
        float _415 = _313 * _169;
        _413 = _415;
    }
    float _417 = _413;
    float _419 = 0.0;
    if (!_243)
    {
        _419 = 0.0;
    }
    float _421 = _419;
    float _423 = _421;
    if (_243)
    {
        float _425 = _313 * _195;
        _423 = _425;
    }
    float _427 = _423;
    float _429 = fma(_247, 0.5, 0.5);
    bool _431 = _237 < 0.5;
    float _433 = float(_431);
    float _435 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (!_239)
    {
        _363 = 0.0;
    }
    float _437 = _363;
    float _439 = _437;
    if (_239)
    {
        float _441 = _281 * _171;
        _439 = _441;
    }
    float _443 = _439;
    if (!_289)
    {
        _365 = 0.0;
    }
    float _445 = _365;
    float _447 = -_433;
    float _449 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _451 = -_429;
    float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _455 = _445;
    if (_289)
    {
        float _457 = _399 * _173;
        _455 = _457;
    }
    float _459 = _455;
    float _461 = _435 * _417;
    float _463 = _435 * _443;
    float _465 = _435 * _459;
    if (!_239)
    {
        _367 = 0.0;
    }
    float _467 = _367;
    float _469 = in.m_46.x;
    float _471 = in.m_46.y;
    float _473 = in.m_46.z;
    float _475 = _467;
    if (!_239)
    {
        _271 = 0.0;
    }
    float _477 = _271;
    float _479 = _477;
    if (_239)
    {
        float _481 = _281 * _181;
        _475 = _481;
    }
    float _483 = _475;
    if (_239)
    {
        float _485 = _281 * _197;
        _479 = _485;
    }
    float _487 = _479;
    float _489 = -_237;
    float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    if (!_289)
    {
        _321 = 0.0;
    }
    float _493 = _321;
    float _495 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _497 = _493;
    if (_289)
    {
        float _499 = _399 * _183;
        _497 = _499;
    }
    float _501 = _497;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _505 = _503 != 0;
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _509 = _507 != 0;
    float _511 = fma(_495, _409, _461);
    if (!_289)
    {
        _273 = 0.0;
    }
    float _513 = _273;
    float _515 = fma(_495, _483, _463);
    int _517 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _519 = _517 != 0;
    float _521 = fma(_495, _501, _465);
    float _523 = _513;
    if (_289)
    {
        float _525 = _399 * _199;
        _523 = _525;
    }
    float _527 = _523;
    bool _529 = !_505;
    int _531 = _529 ? 0 : 1;
    float _533 = in.m_66.w;
    float _535 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _537 = !_519;
    int _539 = _537 ? 0 : 1;
    float _541 = in.m_44.x;
    float _543 = in.m_44.y;
    float _545 = in.m_44.z;
    int _547 = abs(_531);
    float _549 = fma(_535, _427, _511);
    float _551 = fma(_535, _487, _515);
    float _553 = fma(_535, _527, _521);
    int _555 = abs(_539);
    float _557 = 1.0 / _151;
    bool _559 = !_509;
    int _561 = _559 ? 0 : 1;
    bool _563 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _565 = abs(_561);
    float _567 = fma(_391, _469, _549);
    float _569 = float(_547);
    float _571 = fma(_391, _471, _551);
    float _573 = float(_555);
    float _575 = abs(_491);
    float _577 = _569 * _575;
    float _579 = fma(_391, _473, _553);
    float _581 = _117 * _557;
    float _583 = float(_565);
    float _585 = fma(_573, _453, _577);
    float _587 = fma(_567, _533, _541);
    float _589 = fma(_571, _533, _543);
    float _591 = fma(_579, _533, _545);
    float _593 = abs(_449);
    float _595 = fma(_583, _593, _585);
    bool _597 = !_563;
    float _599 = _581;
    float _601 = _591;
    float _603 = _595;
    if (!_597)
    {
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _607 = _149 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _599 = _617;
    }
    float _619 = _599;
    float _621 = _153 * 2.0;
    float _623 = _149 * 2.0;
    float _625 = _149 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _627 = floor(_621);
    float _629 = _161 * 2.0;
    float _631 = _153 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _635 = floor(_623);
    float _637 = _149 + _153;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _641 = _639 != 0;
    float _643 = -_633;
    float _645 = fma(_625, 2.0, _643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _651 = _637 + (-1.0);
    float _653 = _153 + (-0.5);
    float _655 = 1.0 / _649;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _657;
    float _661 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _675 = 1.0 / _659;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _679 = _619 + _677;
    bool _681 = _635 >= 0.0;
    bool _683 = isnan(_635);
    bool _685 = _681 || _683;
    bool _687 = isnan(0.0);
    bool _689 = _685 || _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _699 = _627 > 0.0;
    float _701 = -_117;
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[76].x, _645);
    float _705 = 1.0 / _665;
    float _707 = _153 + _161;
    bool _709 = _635 > 0.0;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _713 = _707 + (-1.0);
    float _715 = floor(_629);
    bool _717 = _627 >= 0.0;
    bool _719 = isnan(_627);
    bool _721 = _717 || _719;
    bool _723 = isnan(0.0);
    bool _725 = _721 || _723;
    float _727 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _731 = _619 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _737;
    float _741 = fma(_631, -2.0, _711);
    float _743 = _731 * _675;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _747 = _619 + _745;
    float _749 = _679 * _705;
    int _751 = as_type<int>(_705);
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_641)
    {
        _751 = 0;
    }
    int _755 = _751;
    float _757 = _149 + _161;
    float _759 = _747 * _655;
    int _761 = _755;
    if (!_641)
    {
        _761 = 1;
    }
    int _763 = _761;
    float _765 = fma(_735, _749, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _767 = fma(_739, _749, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _769 = fma(_673, _759, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _771 = fma(_697, _759, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _773 = _689 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _775 = _757 + (-1.0);
    bool _777 = _763 != 1;
    float _779 = fma(_669, _743, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _781 = _715 >= 0.0;
    bool _783 = isnan(_715);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    float _791 = fma(_693, _743, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _793 = _715 > 0.0;
    float _795 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _797 = int(_795);
    int _799 = _725 ? 0 : 1;
    float _801 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _741);
    int _803 = _789 ? 0 : 1;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _807 = _805 != 0;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _815 = _813 != 0;
    float _817 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _819 = log2(_817);
    int _821 = ~_799;
    int _823 = _821 + 1;
    int _825 = _823 + 1;
    int _827 = ~as_type<int>(_773);
    int _829 = _827 + 1;
    int _831 = _829 + 1;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _835 = _825;
    int _837 = _831;
    float _839 = _773;
    float _841 = as_type<float>(_797);
    if (!_699)
    {
        int _843 = ~_799;
        int _845 = _843 + 1;
        _835 = _845;
    }
    int _847 = _835;
    float _849 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _851 = int(_849);
    if (!_709)
    {
        int _853 = ~as_type<int>(_773);
        int _855 = _853 + 1;
        _837 = _855;
    }
    int _857 = _837;
    bool _859 = !_811;
    int _861 = _859 ? 0 : 1;
    float _863 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _865 = !_807;
    int _867 = _865 ? 0 : 1;
    bool _869 = !_815;
    int _871 = _869 ? 0 : 1;
    float _873 = _819 * _117;
    if (!_777)
    {
        _839 = _153;
    }
    float _875 = _839;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _883 = _881 != 0;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _887 = _885 != 0;
    float _889 = _875;
    if (_777)
    {
        _889 = _149;
    }
    float _891 = _889;
    int _893 = ~_803;
    int _895 = _893 + 1;
    int _897 = _895 + 1;
    bool _899 = !_883;
    int _901 = _899 ? 0 : 1;
    float _903 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[83].z, _833);
    int _905 = _897;
    if (!_793)
    {
        int _907 = ~_803;
        int _909 = _907 + 1;
        _905 = _909;
    }
    int _911 = _905;
    float _913 = in.m_68.x;
    float _915 = in.m_68.y;
    float _917 = in.m_68.z;
    bool _919 = !_887;
    int _921 = _919 ? 0 : 1;
    float _923 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _903);
    int _925 = abs(_901);
    int _927 = abs(_921);
    bool _929 = !_879;
    float _931 = _929 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _933 = float(_857);
    float _935 = float(_925);
    int _937 = abs(as_type<int>(_931));
    float _939 = _935 * _933;
    float _941 = _931;
    float _943 = _935;
    if (!_777)
    {
        _941 = _161;
    }
    float _945 = _941;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _949 = _945;
    if (_777)
    {
        _949 = _153;
    }
    float _951 = _949;
    float _953 = float(_847);
    float _955 = float(_927);
    float _957 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[83].w, _947);
    if (!_777)
    {
        _943 = _153;
    }
    float _959 = _943;
    float _961 = _959;
    if (_777)
    {
        _961 = _149;
    }
    float _963 = _961;
    float _965 = _955 * _953;
    float _967 = float(_797);
    float _969 = _963 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_777)
    {
        _841 = _161;
    }
    float _971 = _841;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _975 = _939 * (-2.0);
    float _977 = _971;
    if (_777)
    {
        _977 = _153;
    }
    float _979 = _977;
    float _981 = -_973;
    float _983 = fma(_969, 2.0, _981);
    float _985 = float(_937);
    float _987 = fma(_727, _975, _727);
    float _989 = fma(_975, _915, _915);
    float _991 = exp2(_873);
    float _993 = float(_851);
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _997 = _979 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _999 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].y, _989);
    float _1001 = float(_911);
    float _1003 = fma(_997, -2.0, _995);
    float _1005 = 1.0 / _993;
    float _1007 = _985 * _1001;
    bool _1009 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1011 = isnan(1.0);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1017 = _1013 || _1015;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1021 = _557 * _117;
    float _1023 = 1.0 / _967;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1027 = 1.0 + _1025;
    bool _1029 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1031 = isnan(_619);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1019);
    float _1043 = -_991;
    float _1045 = _1043 + 1.0;
    bool _1047 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1049 = isnan(0.0);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1055 = _1051 || _1053;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1059 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1061 = isnan(_619);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = 1.0 / _1027;
    float _1073 = -_1039;
    float _1075 = _1073 + 1.0;
    float _1077 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1057);
    float _1079 = _1055 ? _1045 : 0.0;
    float _1081 = -_117;
    float _1083 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[81].x, _983);
    float _1085 = _1069 * _1075;
    float _1087 = -_1069;
    float _1089 = _1087 + 1.0;
    float _1091 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1041);
    float _1093 = _1023 * _117;
    float _1095 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _957);
    float _1097 = _1005 * _117;
    float _1099 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1077);
    float _1101 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1003);
    float _1103 = _1007 * (-2.0);
    if (_1017)
    {
        float _1105 = _1079 * _1071;
        _127 = _1105;
    }
    float _1107 = _127;
    bool _1109 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1111 = isnan(_619);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1117 = _1113 || _1115;
    float _1119 = float(_1117);
    float _1121 = fma(_661, _1103, _661);
    float _1123 = fma(_1103, _913, _913);
    float _1125 = fma(_987, _1107, _999);
    float _1127 = _149 + (-0.5);
    bool _1129 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1131 = isnan(_619);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1137 = _1133 || _1135;
    float _1139 = float(_1137);
    float _1141 = _1119 * _1089;
    float _1143 = -_1119;
    float _1145 = _1143 + 1.0;
    float _1147 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1123);
    float _1149 = _1125 * 0.15915493667125701904296875;
    float _1151 = in.m_66.x;
    float _1153 = in.m_66.y;
    float _1155 = _1139 * _1145;
    float _1157 = _965 * (-2.0);
    float _1159 = -_1139;
    float _1161 = _1159 + 1.0;
    float _1163 = fma(_1121, _1107, _1147);
    float _1165 = _779 * _1155;
    float _1167 = _791 * _1155;
    float _1169 = fma(_1157, _917, _917);
    float _1171 = _161 + (-0.5);
    float _1173 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1165);
    float _1175 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1167);
    float _1177 = fma(_863, _1157, _863);
    float _1179 = fma(_1171, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1169);
    float _1181 = fma(_769, _1141, _1173);
    float _1183 = fma(_771, _1141, _1175);
    float _1185 = _1163 * 0.15915493667125701904296875;
    float _1187 = fma(_1177, _1107, _1179);
    float _1189 = fma(_765, _1085, _1181);
    float _1191 = fma(_767, _1085, _1183);
    float _1193 = _1149 * 6.283185482025146484375;
    float _1195 = sin(_1193);
    float _1197 = _1187 * 0.15915493667125701904296875;
    float _1199 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1189);
    float _1201 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1191);
    float _1203 = _589 * _197;
    float _1205 = in.m_61.w;
    float _1207 = _1199 * _1151;
    float _1209 = _1201 * _1153;
    float _1211 = _1149 * 6.283185482025146484375;
    float _1213 = cos(_1211);
    float _1215 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _305);
    float _1217 = _595 * _1207;
    float _1219 = _595 * _1209;
    float _1221 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _293);
    float _1223 = fma(_587, _195, _1203);
    float _1225 = _1217 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1227 = _1219 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1229 = _1185 * 6.283185482025146484375;
    float _1231 = sin(_1229);
    float _1233 = in.m_59.w;
    float _1235 = _1225 * _1221;
    float _1237 = _1227 * _1215;
    float _1239 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1241 = fma(_591, _199, _1223);
    float _1243 = in.m_57.w;
    float _1245 = _1197 * 6.283185482025146484375;
    float _1247 = cos(_1245);
    float _1249 = _1241 + _1205;
    float _1251 = _1185 * 6.283185482025146484375;
    float _1253 = cos(_1251);
    float _1255 = _1231 * _1195;
    float _1257 = _1231 * _1213;
    float _1259 = _1197 * 6.283185482025146484375;
    float _1261 = sin(_1259);
    float _1263 = _1231 * _1247;
    float _1265 = _1195 * _1247;
    float _1267 = _1263 * _1237;
    float _1269 = _1253 * _1213;
    float _1271 = _1253 * _1195;
    float _1273 = _1253 * _1247;
    float _1275 = _1213 * _1247;
    float _1277 = _1273 * _1237;
    float _1279 = fma(_1261, _1269, _1255);
    float _1281 = -_1237;
    float _1283 = _1261 * _1281;
    float _1285 = -_1257;
    float _1287 = fma(_1261, _1271, _1285);
    float _1289 = -_1271;
    float _1291 = fma(_1261, _1257, _1289);
    float _1293 = fma(_1279, _1235, _1277);
    float _1295 = fma(_1275, _1235, _1283);
    float _1297 = fma(_1261, _1255, _1269);
    float _1299 = fma(_1291, _1235, _1267);
    float _1301 = fma(_1287, _1239, _1293);
    float _1303 = fma(_1265, _1239, _1295);
    float _1305 = _589 * _181;
    float _1307 = fma(_1297, _1239, _1299);
    float _1309 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1311 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1313 = fma(_587, _179, _1305);
    float _1315 = _589 * _171;
    float _1317 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1309);
    float _1319 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1311);
    float _1321 = fma(_591, _183, _1313);
    float _1323 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1325 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1317);
    float _1327 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1319);
    float _1329 = _1321 + _1233;
    float _1331 = fma(_587, _169, _1315);
    float _1333 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1335 = _1327 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1337 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1323);
    float _1339 = fma(_591, _173, _1331);
    float _1341 = _1249 + _1333;
    float _1343 = _1329 + _1335;
    float _1345 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1337);
    float _1347 = _1339 + _1243;
    float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1351 = _1341 + _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1355 = _1343 + _1353;
    float _1357 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1359 = _1351 * _1351;
    float _1361 = _1347 + _1357;
    float _1363 = fma(_1355, _1355, _1359);
    float _1365 = sqrt(_1363);
    bool _1367 = _1365 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1371 = _1369 != 0;
    int _1373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1375 = _1373 != 0;
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1379 = _1377 != 0;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1383 = _1381 != 0;
    bool _1385 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1387 = isnan(0.5);
    bool _1389 = _1385 || _1387;
    bool _1391 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1393 = _1389 || _1391;
    bool _1395 = !_1375;
    int _1397 = _1395 ? 0 : 1;
    bool _1399 = !_1371;
    int _1401 = _1399 ? 0 : 1;
    bool _1403 = !_1379;
    int _1405 = _1403 ? 0 : 1;
    bool _1407 = !_1383;
    int _1409 = _1407 ? 0 : 1;
    float _1411 = _1357;
    float _1413 = _1243;
    float _1415 = _1293;
    if (!_1367)
    {
        _1411 = _1343;
    }
    float _1417 = _1411;
    float _1419 = _1417;
    if (!_1367)
    {
        _275 = _1341;
    }
    float _1421 = _275;
    float _1423 = _1421;
    if (!_1367)
    {
        _277 = _1361;
    }
    float _1425 = _277;
    bool _1427 = !_1367;
    float _1429 = _1425;
    if (!_1427)
    {
        float _1431 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1435 = _1365 + _1433;
        float _1437 = _1361 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1439 = rsqrt(_1363);
        float _1441 = _1435 * _1431;
        float _1443 = _1441 * 0.15915493667125701904296875;
        float _1445 = _1443 * 6.283185482025146484375;
        float _1447 = cos(_1445);
        float _1449 = _1443 * 6.283185482025146484375;
        float _1451 = sin(_1449);
        float _1453 = _1447 + (-1.0);
        float _1455 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1457 = fma(_1451, _1437, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1459 = fma(_1361, _1447, _1455);
        float _1461 = _1439 * _1457;
        float _1463 = fma(_1355, _1461, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1465 = fma(_1351, _1461, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1419 = _1463;
        _1429 = _1459;
        _1423 = _1465;
    }
    float _1467 = _1419;
    float _1469 = _1429;
    float _1471 = _1423;
    float _1473 = _1469;
    float _1475 = _1467;
    float _1477 = _1471;
    if (!_1393)
    {
        float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1481 = _1347 + _1479;
        float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1485 = _1329 + _1483;
        float _1487 = _1481 * _1481;
        float _1489 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1491 = _1249 + _1489;
        float _1493 = fma(_1485, _1485, _1487);
        float _1495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1497 = fma(_1491, _1491, _1493);
        float _1499 = -_1329;
        float _1501 = _1499 + _1467;
        float _1503 = sqrt(_1497);
        float _1505 = precise::min(_1503, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1507 = _1505 * _1495;
        float _1509 = -_1347;
        float _1511 = _1509 + _1469;
        float _1513 = -_1249;
        float _1515 = _1513 + _1471;
        float _1517 = fma(_1501, _1507, _1329);
        float _1519 = fma(_1511, _1507, _1347);
        float _1521 = fma(_1515, _1507, _1249);
        _1473 = _1519;
        _1475 = _1517;
        _1477 = _1521;
    }
    float _1523 = _1473;
    float _1525 = _1475;
    float _1527 = _1477;
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1531 = _1523 + _1529;
    float _1533 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1535 = _1525 + _1533;
    float _1537 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1539 = _1527 + _1537;
    float _1541 = _1531 * _1531;
    float _1543 = fma(_1535, _1535, _1541);
    float _1545 = fma(_1539, _1539, _1543);
    float _1547 = rsqrt(_1545);
    float _1549 = sqrt(_1545);
    float _1551 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1553 = _1535 * _1551;
    float _1555 = _1539 * _1551;
    float _1557 = _1553 * _1553;
    float _1559 = _1555 * _1555;
    float _1561 = _1557 + _1559;
    float _1563 = sqrt(_1561);
    bool _1565 = _1563 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1567 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1569 = _1563 + _1567;
    float _1571 = _1547;
    float _1573 = _1561;
    float _1575 = _1569;
    float _1577 = _1551;
    float _1579 = _1531;
    if (_1565)
    {
        float _1581 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1571 = _1581;
    }
    float _1583 = _1571;
    if (_1565)
    {
        float _1585 = rsqrt(_1561);
        _1573 = _1585;
    }
    float _1587 = _1573;
    if (_1565)
    {
        float _1589 = _1569 * _1583;
        _1575 = _1589;
    }
    float _1591 = _1575;
    if (_1565)
    {
        float _1593 = _1591 * 0.15915493667125701904296875;
        _1413 = _1593;
    }
    float _1595 = _1413;
    float _1597 = _1583;
    if (_1565)
    {
        float _1599 = _1595 * 6.283185482025146484375;
        float _1601 = sin(_1599);
        _1597 = _1601;
    }
    float _1603 = _1597;
    float _1605 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1607 = precise::max(0.0, _1605);
    float _1609 = _1539;
    float _1611 = _1607;
    if (_1565)
    {
        float _1613 = _1595 * 6.283185482025146484375;
        float _1615 = cos(_1613);
        _1609 = _1615;
    }
    float _1617 = _1609;
    float _1619 = -_1551;
    float _1621 = -_1607;
    float _1623 = fma(_1531, _1619, _1621);
    if (_1565)
    {
        float _1625 = _1623 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1611 = _1625;
    }
    float _1627 = _1611;
    float _1629 = _1603;
    float _1631 = _1627;
    if (_1565)
    {
        float _1633 = fma(_1603, _1627, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1577 = _1633;
    }
    float _1635 = _1577;
    float _1637 = _1635;
    if (!_1565)
    {
        _1629 = _1553;
    }
    float _1639 = _1629;
    float _1641 = _1639;
    if (!_1565)
    {
        _1631 = _1623;
    }
    float _1643 = _1631;
    float _1645 = _1643;
    float _1647 = _1617;
    if (_1565)
    {
        float _1649 = _1617 + (-1.0);
        _1579 = _1649;
    }
    float _1651 = _1579;
    float _1653 = _1651;
    if (_1565)
    {
        float _1655 = _1587 * _1635;
        _1415 = _1655;
    }
    float _1657 = _1415;
    if (!_1565)
    {
        _1637 = _1557;
    }
    float _1659 = _1637;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1663 = fma(_1549, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1661);
    float _1665 = precise::clamp(_1663, 0.0, 1.0);
    float _1667 = _1659;
    if (_1565)
    {
        float _1669 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _601 = _1669;
    }
    float _1671 = _601;
    if (_1565)
    {
        float _1673 = _1553 * _1657;
        _1641 = _1673;
    }
    float _1675 = _1641;
    if (!_1565)
    {
        _1653 = _1555;
    }
    float _1677 = _1653;
    float _1679 = _1677;
    if (_1565)
    {
        float _1681 = _1555 * _1657;
        _1679 = _1681;
    }
    float _1683 = _1679;
    if (_1565)
    {
        float _1685 = fma(_1623, _1617, _1671);
        _1645 = _1685;
    }
    float _1687 = _1645;
    if (_1565)
    {
        float _1689 = _1675 * _1675;
        _1667 = _1689;
    }
    float _1691 = _1667;
    if (!_1565)
    {
        _1647 = _1559;
    }
    float _1693 = _1647;
    float _1695 = _1693;
    if (_1565)
    {
        float _1697 = _1683 * _1683;
        _1695 = _1697;
    }
    float _1699 = _1695;
    float _1701 = _1523 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1703 = fma(_1687, _1687, _1691);
    float _1705 = -_1665;
    float _1707 = _1705 + 1.0;
    float _1709 = _1523 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1711 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1701);
    float _1713 = _1703 + _1699;
    float _1715 = _1523 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1717 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1709);
    float _1719 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1711);
    float _1721 = abs(_1707);
    float _1723 = log2(_1721);
    float _1725 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1715);
    float _1727 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1717);
    float _1729 = _1719 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1731 = _1523 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1733 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1725);
    float _1735 = _1727 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1737 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1739 = rsqrt(_1713);
    float _1741 = _1733 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1743 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1745 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1731);
    float _1747 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1749 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1751 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1743);
    float _1753 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1745);
    float _1755 = -_1747;
    float _1757 = fma(_1755, _1737, 1.0);
    float _1759 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1751);
    float _1761 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1763 = log2(_1757);
    float _1765 = _1739 * _1675;
    float _1767 = _1739 * _1687;
    float _1769 = _1739 * _1683;
    float _1771 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1773 = _1765 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1775 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1759);
    float _1777 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1749);
    float _1779 = -_1773;
    float _1781 = fma(_1767, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1779);
    float _1783 = exp2(_1771);
    float _1785 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1777);
    float _1787 = -_1769;
    float _1789 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1781);
    float _1791 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1793 = _1763 * 0.693147182464599609375;
    float _1795 = fma(_1789, -0.5, 0.5);
    float _1797 = 1.0 / _1775;
    float _1799 = fma(_1789, 0.5, 0.5);
    float _1801 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1791);
    float _1803 = _1767 + 1.0;
    float _1805 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1807 = fma(_1799, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1809 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1801);
    float _1811 = sqrt(_1795);
    float _1813 = fma(_1799, _1807, -0.212114393711090087890625);
    float _1815 = -_1767;
    float _1817 = fma(_1783, _1803, _1815);
    float _1819 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1809);
    float _1821 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1785);
    float _1823 = fma(_1799, _1813, 1.570728778839111328125);
    float _1825 = fma(_1817, 0.5, 0.5);
    float _1827 = _1819 * _1797;
    float _1829 = _1821 * _1797;
    float _1831 = fma(_1829, -0.5, 0.5);
    float _1833 = _1811 * 0.636619746685028076171875;
    float _1835 = fma(_1827, 0.5, 0.5);
    float _1837 = -_1823;
    float _1839 = fma(_1833, _1837, 1.0);
    float3 _6109 = float3(_1835, _1831, _1805);
    float _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6109, float3(0.0), isnan(_6109)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6109, float3(0.0), isnan(_6109)), level(0.0)).x;
    float3 _6120 = float3(_1835, _1831, _1805);
    float4 _1844 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6120, float3(0.0), isnan(_6120)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6120, float3(0.0), isnan(_6120)), level(0.0)).xyzw;
    float _1846 = _1844.x;
    float _1848 = _1844.y;
    float _1850 = _1844.z;
    float _1852 = _1844.w;
    float2 _6137 = float2(_1839, _1825);
    float3 _1856 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6137, float2(0.0), isnan(_6137)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6137, float2(0.0), isnan(_6137)), level(0.0)).xyz;
    float _1858 = _1856.x;
    float _1860 = _1856.y;
    float _1862 = _1856.z;
    float _1864 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1866 = int(_1864);
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1870 = _1868 != 0;
    float _1872 = -_1091;
    float _1874 = _1872 + 1.0;
    int _1876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1878 = _1876 != 0;
    out.m_70.x = _1329;
    out.m_70.y = _1347;
    out.m_70.z = _1249;
    bool _1880 = _153 > 0.5;
    float _1882 = -_1099;
    float _1884 = _1882 + 1.0;
    bool _1886 = _149 > 0.5;
    float _1888 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1890 = int(_1888);
    bool _1892 = _161 > 0.5;
    float _1894 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1896 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1898 = _1896 != 0;
    out.m_72.x = _1525;
    out.m_72.y = _1523;
    out.m_72.z = _1527;
    int _1900 = abs(_861);
    float _1902 = _1819;
    if (_1870)
    {
        _753 = 1.0;
    }
    float _1904 = _753;
    float _1906 = trunc(_1093);
    int _1908 = int(_1906);
    float _1910 = float(uint(_1866));
    float _1912 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1914 = ~_1866;
    int _1916 = _1914 + 1;
    float _1918 = _1904;
    if (!_1870)
    {
        _1918 = 7.345489978790283203125;
    }
    float _1920 = _1918;
    float _1922 = float(_1866);
    float _1924 = 1.0 / _1910;
    float _1926 = float(uint(_1890));
    float _1928 = _1920 * _149;
    int _1930 = abs(_867);
    int _1932 = abs(_1397);
    int _1934 = abs(_871);
    float _1936 = 1.0 / _1926;
    float _1938 = trunc(_1097);
    int _1940 = int(_1938);
    float _1942 = float(uint(_1908));
    int _1944 = as_type<int>(_1924) + (-2);
    int _1946 = ~_1890;
    int _1948 = _1946 + 1;
    int _1950 = abs(_1401);
    float _1952 = exp2(_1894);
    int _1954 = as_type<int>(_1936) + (-2);
    int _1956 = abs(_1405);
    float _1958 = as_type<float>(_1954) * _1942;
    float _1960 = float(uint(_1940));
    float _1962 = trunc(_1958);
    float _1964 = precise::max(_1962, 0.0);
    uint _1967 = uint(_1964);
    float _1969 = as_type<float>(_1944) * _1960;
    float _1971 = -_1952;
    float _1973 = _1971 + 1.0;
    float _1975 = trunc(_1969);
    float _1977 = precise::max(_1975, 0.0);
    uint _1979 = uint(_1977);
    float _1981 = _1973 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1983 = _1948 * int(_1967);
    int _1985 = _1983 + _1908;
    float _1987 = float(uint(_1985));
    int _1989 = _1916 * int(_1979);
    int _1991 = _1989 + _1940;
    float _1993 = float(uint(_1991));
    float _1995 = as_type<float>(_1954) * _1987;
    float _1997 = _1987;
    float _1999 = _1993;
    if (_1870)
    {
        _1997 = 1.0;
    }
    float _2001 = _1997;
    float _2003 = _2001;
    if (!_1870)
    {
        _2003 = 1.2345600128173828125;
    }
    float _2005 = _2003;
    float _2007 = as_type<float>(_1944) * _1993;
    if (_1870)
    {
        _1999 = _149;
    }
    float _2009 = _1999;
    float _2011 = trunc(_1995);
    float _2013 = precise::max(_2011, 0.0);
    uint _2015 = uint(_2013);
    float _2017 = _2009;
    if (!_1870)
    {
        _2017 = _153;
    }
    float _2019 = _2017;
    int _2021 = ~_1866;
    int _2023 = _2021 + 1;
    float _2025 = _2005 * _2019;
    float _2027 = trunc(_2007);
    float _2029 = precise::max(_2027, 0.0);
    uint _2031 = uint(_2029);
    int _2033 = int(_1967) + int(_2015);
    float _2035 = floor(_1928);
    int _2037 = ~_1890;
    int _2039 = _2037 + 1;
    float _2041 = float(_1890);
    int _2043 = _2039 * _2033;
    int _2045 = _2043 + _1908;
    int _2047 = int(_1979) + int(_2031);
    float _2049 = floor(_2025);
    float _2051 = float(_1908);
    bool _2053 = uint(_2045) >= uint(_1890);
    int _2055 = _2023 * _2047;
    int _2057 = _2055 + _1940;
    float _2059 = float(_1940);
    bool _2061 = _2051 >= _2041;
    bool _2063 = isnan(_2051);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan(_2041);
    bool _2069 = _2065 || _2067;
    float _2071 = float(_2069);
    float _2073 = -_2035;
    float _2075 = _1928 + _2073;
    bool _2077 = uint(_2057) >= uint(_1866);
    bool _2079 = _2059 >= _1922;
    bool _2081 = isnan(_2059);
    bool _2083 = _2079 || _2081;
    bool _2085 = isnan(_1922);
    bool _2087 = _2083 || _2085;
    float _2089 = float(_2087);
    float _2091 = trunc(_2071);
    int _2093 = int(_2091);
    bool _2095 = !_2053;
    int _2097 = _2095 ? 0 : (-1);
    float _2099 = -_2049;
    float _2101 = _2025 + _2099;
    bool _2103 = !_2077;
    int _2105 = _2103 ? 0 : (-1);
    int _2107 = ~_2033;
    int _2109 = _2107 + _2097;
    int _2111 = _2109 + 1;
    float _2113 = trunc(_2089);
    int _2115 = int(_2113);
    int _2117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2119 = _2117 != 0;
    float _2121 = _2075 * _2041;
    int _2123 = ~_2047;
    int _2125 = _2123 + _2105;
    int _2127 = _2125 + 1;
    int _2129 = _1890 * _2111;
    int _2131 = _2129 + _1908;
    int _2133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2135 = _2133 != 0;
    float _2137 = _2041 * _1021;
    bool _2139 = !_2119;
    int _2141 = _2139 ? 0 : 1;
    int _2143 = _1866 * _2127;
    int _2145 = _2143 + _1940;
    bool _2147 = _1890 == 0;
    float _2149 = trunc(_2121);
    int _2151 = int(_2149);
    bool _2153 = !_2135;
    int _2155 = _2153 ? 0 : 1;
    float _2157 = _1922 * _1021;
    bool _2159 = _1866 == 0;
    float _2161 = _2101 * _1922;
    int _2163 = ~_2093;
    int _2165 = _2163 + 1;
    int _2167 = _2165 + 1;
    bool _2169 = !_2147;
    int _2171 = _2169 ? _2131 : (-1);
    float _2173 = trunc(_2137);
    int _2175 = int(_2173);
    int _2177 = ~_2115;
    int _2179 = _2177 + 1;
    int _2181 = _2179 + 1;
    bool _2183 = !_2159;
    int _2185 = _2183 ? _2145 : (-1);
    int _2187 = _2171 * _2167;
    int _2189 = _1890 + (-1);
    int _2191 = _1866 + (-1);
    int _2193 = _2185 * _2181;
    int _2195 = abs(_2141);
    int _2197 = _2093 * _2189;
    int _2199 = _2197 + _2187;
    float _2201 = trunc(_2161);
    int _2203 = int(_2201);
    int _2205 = _2115 * _2191;
    int _2207 = _2205 + _2193;
    int _2209 = _2199 * _1900;
    int _2211 = abs(_2155);
    int _2213 = _2207 * _1932;
    int _2215 = ~_1866;
    int _2217 = _2215 + 1;
    float _2219 = trunc(_2157);
    int _2221 = int(_2219);
    int _2223 = _2151 * _2195;
    int _2225 = _2223 + _1908;
    int _2227 = _2175 * _1930;
    int _2229 = _2227 + _2209;
    float _2231 = in.m_53.w;
    float _2233 = -_293;
    int _2235 = _1886 ? as_type<int>(_2233) : as_type<int>(_293);
    int _2237 = _2225 * _1934;
    int _2239 = _2237 + _2229;
    bool _2241 = !_1878;
    int _2243 = _2241 ? 0 : 1;
    int _2245 = _2203 * _2211;
    int _2247 = _2245 + _1940;
    float _2249 = float(uint(_2225));
    int _2251 = abs(_2243);
    bool _2253 = !_1898;
    float _2255 = _2253 ? _293 : as_type<float>(_2235);
    float _2257 = as_type<float>(_1954) * _2249;
    int _2259 = _2221 * _1950;
    int _2261 = _2259 + _2213;
    int _2263 = abs(_1409);
    float _2265 = _2255 + 0.5;
    int _2267 = _2247 * _1956;
    int _2269 = _2267 + _2261;
    float _2271 = float(uint(_2247));
    float _2273 = trunc(_2257);
    float _2275 = precise::max(_2273, 0.0);
    uint _2277 = uint(_2275);
    float _2279 = fma(_2265, (*spvDescriptorSet0.vp_c9)._m0[80].x, _703);
    int _2281 = _2203 * _2263;
    int _2283 = _2281 + _2269;
    bool _2285 = _2231 > 0.5;
    int _2287 = _2151 * _2251;
    int _2289 = _2287 + _2239;
    float _2291 = as_type<float>(_1944) * _2271;
    int _2293 = ~_1890;
    int _2295 = _2293 + 1;
    float _2297 = -_1874;
    float _2299 = fma(_2255, _2297, _2279);
    float _2301 = float(uint(_2283));
    float _2303 = float(uint(_2289));
    float _2305 = trunc(_2291);
    float _2307 = precise::max(_2305, 0.0);
    uint _2309 = uint(_2307);
    int _2311 = ~_1866;
    int _2313 = _2311 + 1;
    float _2315 = as_type<float>(_1944) * _2301;
    int _2317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2319 = _2317 != 0;
    float _2321 = as_type<float>(_1954) * _2303;
    int _2323 = _2295 * int(_2277);
    int _2325 = _2323 + _2225;
    float _2327 = -_305;
    int _2329 = _1880 ? as_type<int>(_2327) : as_type<int>(_305);
    float _2331 = trunc(_2315);
    float _2333 = precise::max(_2331, 0.0);
    uint _2335 = uint(_2333);
    int _2337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2339 = _2337 != 0;
    float _2341 = float(uint(_2325));
    int _2343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2345 = _2343 != 0;
    float _2347 = -_293;
    int _2349 = _1892 ? as_type<int>(_2347) : as_type<int>(_293);
    float _2351 = trunc(_2321);
    float _2353 = precise::max(_2351, 0.0);
    uint _2355 = uint(_2353);
    int _2357 = _2313 * int(_2309);
    int _2359 = _2357 + _2247;
    float _2361 = as_type<float>(_1954) * _2341;
    float _2363 = -_305;
    int _2365 = _2285 ? as_type<int>(_2363) : as_type<int>(_305);
    int _2367 = ~_1890;
    int _2369 = _2367 + 1;
    bool _2371 = !_2319;
    float _2373 = _2371 ? _305 : as_type<float>(_2329);
    int _2375 = _2217 * int(_2335);
    int _2377 = _2375 + _2283;
    float _2379 = float(uint(_2359));
    float _2381 = trunc(_2361);
    float _2383 = precise::max(_2381, 0.0);
    uint _2385 = uint(_2383);
    bool _2387 = !_2339;
    float _2389 = _2387 ? _293 : as_type<float>(_2349);
    float _2391 = _2373 + (-0.5);
    bool _2393 = !_2345;
    float _2395 = _2393 ? _305 : as_type<float>(_2365);
    float _2397 = as_type<float>(_1944) * _2379;
    float _2399 = float(uint(_2377));
    int _2401 = _2369 * int(_2355);
    int _2403 = _2401 + _2289;
    float _2405 = _2389 + 0.5;
    float _2407 = _2395 + (-0.5);
    float _2409 = -_2391;
    float _2411 = -_801;
    float _2413 = fma(_2409, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2411);
    float _2415 = as_type<float>(_1944) * _2399;
    float _2417 = float(uint(_2403));
    float _2419 = fma(_2405, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1083);
    float _2421 = -_2407;
    float _2423 = -_1101;
    float _2425 = fma(_2421, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2423);
    float _2427 = -_1095;
    float _2429 = _2427 + 1.0;
    float _2431 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2433 = as_type<float>(_1954) * _2417;
    float _2435 = -_923;
    float _2437 = _2435 + 1.0;
    float _2439 = fma(_2395, _2429, _2425);
    float _2441 = -_1261;
    float _2443 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2431);
    float _2445 = trunc(_2415);
    float _2447 = precise::max(_2445, 0.0);
    uint _2449 = uint(_2447);
    int _2451 = ~_1866;
    int _2453 = _2451 + 1;
    float _2455 = fma(_2373, _1884, _2413);
    int _2457 = ~_1890;
    int _2459 = _2457 + 1;
    float _2461 = -_2437;
    float _2463 = fma(_2389, _2461, _2419);
    float _2465 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2467 = trunc(_2433);
    float _2469 = precise::max(_2467, 0.0);
    uint _2471 = uint(_2469);
    out.m_74.x = _2299;
    out.m_74.y = _2455;
    out.m_74.z = _2463;
    out.m_74.w = _2439;
    float _2473 = -_1261;
    float _2475 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2465);
    int _2477 = int(_2277) + int(_2385);
    float _2479 = _293 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2481 = ~_1890;
    int _2483 = _2481 + 1;
    float _2485 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2489 = _2487 != 0;
    float _2491 = trunc(_2397);
    float _2493 = precise::max(_2491, 0.0);
    uint _2495 = uint(_2493);
    int _2497 = int(_2335) + int(_2449);
    int _2499 = _2483 * _2477;
    int _2501 = _2499 + _2225;
    int _2503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2505 = _2503 != 0;
    float _2507 = -_1261;
    float _2509 = fma(_2507, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2485);
    float _2511 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2513 = _2453 * _2497;
    int _2515 = _2513 + _2283;
    int _2517 = ~_1866;
    int _2519 = _2517 + 1;
    float _2521 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2523 = int(_2355) + int(_2471);
    float _2525 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2527 = uint(_2515) >= uint(_1866);
    float _2529 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2521);
    float _2531 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2443);
    int _2533 = _2459 * _2523;
    int _2535 = _2533 + _2289;
    bool _2537 = !_2527;
    int _2539 = _2537 ? 0 : (-1);
    float _2541 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2525);
    int _2543 = int(_2309) + int(_2495);
    float _2545 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2475);
    bool _2547 = uint(_2535) >= uint(_1890);
    float _2549 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2551 = ~_2497;
    int _2553 = _2551 + _2539;
    int _2555 = _2553 + 1;
    float _2557 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2559 = !_2547;
    int _2561 = _2559 ? 0 : (-1);
    float _2563 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2549);
    bool _2565 = uint(_2501) >= uint(_1890);
    float _2567 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2557);
    int _2569 = ~_2523;
    int _2571 = _2569 + _2561;
    int _2573 = _2571 + 1;
    int _2575 = _2519 * _2543;
    int _2577 = _2575 + _2247;
    float _2579 = _305 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2581 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2567);
    float _2583 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1912);
    int _2585 = _1890 * _2573;
    int _2587 = _2585 + _2289;
    bool _2589 = uint(_2577) >= uint(_1866);
    int _2591 = _1866 * _2555;
    int _2593 = _2591 + _2283;
    float _2595 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2563);
    float _2597 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2529);
    bool _2599 = !_2147;
    int _2601 = _2599 ? _2587 : (-1);
    float _2603 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2541);
    bool _2605 = !_2159;
    int _2607 = _2605 ? _2593 : (-1);
    float _2609 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2509);
    int _2611 = _2601 >> 31;
    float _2613 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2511);
    int _2615 = _2607 >> 31;
    float _2617 = _2579 * _2531;
    int _2619 = _2611 & 3;
    float _2621 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2583);
    int _2623 = _2615 & 3;
    float _2625 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2613);
    int _2627 = _2601 + _2619;
    float _2629 = fma(_2479, _2595, _2617);
    int _2631 = _2601 & 3;
    bool _2633 = _2631 != 0;
    float _2635 = _2579 * _2545;
    int _2637 = _2607 + _2623;
    out.m_76.x = _2595;
    out.m_76.y = _2597;
    out.m_76.z = _2603;
    int _2639 = _2627 >> 2;
    float _2641 = fma(_2479, _2597, _2635);
    int _2643 = _2633 ? 0 : 1;
    float _2645 = _1981 * _1841;
    int _2647 = _2601 & 3;
    bool _2649 = _2647 != 0;
    float _2651 = -_1981;
    float _2653 = _2651 + 1.0;
    int _2655 = _2637 >> 2;
    int _2657 = _2639 << 4;
    int _2659 = _2657 + 368;
    int _2661 = _2655 << 4;
    int _2663 = _2661 + 512;
    float _2665 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    uint _2667 = uint(int(uint(_2659) >> uint(2)));
    uint _2669 = uint(int(uint(int(_2667)) >> uint(2)));
    int _2671 = int(_2667) & 3;
    float _2673 = (*spvDescriptorSet0.vp_c9)._m0[int(_2669)][_2671];
    int _2675 = int(_2667) + 1;
    uint _2677 = uint(int(uint(_2675) >> uint(2)));
    int _2679 = _2675 & 3;
    float _2681 = (*spvDescriptorSet0.vp_c9)._m0[int(_2677)][_2679];
    bool _2683 = !_2565;
    int _2685 = _2683 ? 0 : (-1);
    bool _2687 = uint(_2647) >= 2u;
    float _2689 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2665);
    bool _2691 = !_2589;
    int _2693 = _2691 ? 0 : (-1);
    bool _2695 = uint(_2647) > 1u;
    uint _2697 = uint(int(uint(_2663) >> uint(2)));
    uint _2699 = uint(int(uint(int(_2697)) >> uint(2)));
    int _2701 = int(_2697) & 3;
    float _2703 = (*spvDescriptorSet0.vp_c9)._m0[int(_2699)][_2701];
    int _2705 = int(_2697) + 1;
    uint _2707 = uint(int(uint(_2705) >> uint(2)));
    int _2709 = _2705 & 3;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[int(_2707)][_2709];
    int _2713 = _2687 ? 0 : 1;
    bool _2715 = _2647 != 3;
    int _2717 = ~_2477;
    int _2719 = _2717 + _2685;
    int _2721 = _2719 + 1;
    int _2723 = ~_2643;
    int _2725 = _2723 + 1;
    int _2727 = _2725 + 1;
    int _2729 = _2659 + 8;
    uint _2731 = uint(int(uint(_2729) >> uint(2)));
    uint _2733 = uint(int(uint(int(_2731)) >> uint(2)));
    int _2735 = int(_2731) & 3;
    float _2737 = (*spvDescriptorSet0.vp_c9)._m0[int(_2733)][_2735];
    int _2739 = int(_2731) + 1;
    uint _2741 = uint(int(uint(_2739) >> uint(2)));
    int _2743 = _2739 & 3;
    float _2745 = (*spvDescriptorSet0.vp_c9)._m0[int(_2741)][_2743];
    int _2747 = ~_2543;
    int _2749 = _2747 + _2693;
    int _2751 = _2749 + 1;
    int _2753 = _1890 * _2721;
    int _2755 = _2753 + _2225;
    int _2757 = ~_2713;
    int _2759 = _2757 + 1;
    int _2761 = _2759 + 1;
    int _2763 = _2727;
    int _2765 = _2761;
    if (!_2695)
    {
        int _2767 = ~_2643;
        int _2769 = _2767 + 1;
        _2763 = _2769;
    }
    int _2771 = _2763;
    int _2773 = _1866 * _2751;
    int _2775 = _2773 + _2247;
    int _2777 = _2607 & 3;
    bool _2779 = _2777 != 0;
    int _2781 = _2663 + 8;
    uint _2783 = uint(int(uint(_2781) >> uint(2)));
    uint _2785 = uint(int(uint(int(_2783)) >> uint(2)));
    int _2787 = int(_2783) & 3;
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[int(_2785)][_2787];
    int _2791 = int(_2783) + 1;
    uint _2793 = uint(int(uint(_2791) >> uint(2)));
    int _2795 = _2791 & 3;
    float _2797 = (*spvDescriptorSet0.vp_c9)._m0[int(_2793)][_2795];
    if (_2715)
    {
        int _2799 = ~_2713;
        int _2801 = _2799 + 1;
        _2765 = _2801;
    }
    int _2803 = _2765;
    float _2805 = _2579 * _2609;
    bool _2807 = uint(_2777) > 1u;
    bool _2809 = !_2649;
    int _2811 = _2809 ? 0 : 1;
    float _2813 = fma(_2479, _2603, _2805);
    int _2815 = _2607 & 3;
    bool _2817 = _2815 != 0;
    bool _2819 = !_2779;
    int _2821 = _2819 ? 0 : 1;
    int _2823 = _2817 ? 0 : 1;
    bool _2825 = uint(_2777) >= 2u;
    int _2827 = ~_2823;
    int _2829 = _2827 + 1;
    int _2831 = _2829 + 1;
    int _2833 = _2831;
    if (!_2807)
    {
        int _2835 = ~_2823;
        int _2837 = _2835 + 1;
        _2833 = _2837;
    }
    int _2839 = _2833;
    int _2841 = abs(_2771);
    int _2843 = abs(_2839);
    float _2845 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2689);
    bool _2847 = _2647 != 3;
    int _2849 = abs(_2811);
    float _2851 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2845);
    int _2853 = _2825 ? 0 : 1;
    bool _2855 = _2777 != 3;
    bool _2857 = _2777 != 3;
    float _2859 = _1862 * _2645;
    out.gl_Position.x = _1819;
    out.gl_Position.y = _1821;
    out.gl_Position.z = _2851;
    out.gl_Position.w = _1775;
    int _2861 = ~_2841;
    int _2863 = _2861 + 1;
    int _2865 = _2863 + 1;
    int _2867 = abs(_2821);
    int _2869 = _2865 * as_type<int>(_2681);
    int _2871 = ~_2843;
    int _2873 = _2871 + 1;
    int _2875 = _2873 + 1;
    int _2877 = abs(_2803);
    int _2879 = ~_2849;
    int _2881 = _2879 + 1;
    int _2883 = _2881 + 1;
    int _2885 = _2875 * as_type<int>(_2711);
    int _2887 = ~_2877;
    int _2889 = _2887 + 1;
    int _2891 = _2889 + 1;
    float _2893 = fma(_2579, _2579, 1.0);
    int _2895 = ~_2867;
    int _2897 = _2895 + 1;
    int _2899 = _2897 + 1;
    int _2901 = _2883 * as_type<int>(_2673);
    int _2903 = _2901 + _2869;
    int _2905 = ~_2853;
    int _2907 = _2905 + 1;
    int _2909 = _2907 + 1;
    int _2911 = _2909;
    if (_2855)
    {
        int _2913 = ~_2853;
        int _2915 = _2913 + 1;
        _2911 = _2915;
    }
    int _2917 = _2911;
    int _2919 = _2891 * as_type<int>(_2737);
    int _2921 = _2919 + _2903;
    bool _2923 = !_2489;
    int _2925 = _2923 ? 0 : 1;
    int _2927 = _2899 * as_type<int>(_2703);
    int _2929 = _2927 + _2885;
    bool _2931 = !_2847;
    int _2933 = _2931 ? 0 : (-1);
    float _2935 = rsqrt(_2893);
    bool _2937 = !_2857;
    int _2939 = _2937 ? 0 : (-1);
    int _2941 = abs(_2917);
    int _2943 = abs(_2925);
    int _2945 = abs(_2933);
    int _2947 = abs(_2939);
    bool _2949 = !_2505;
    int _2951 = _2949 ? 0 : 1;
    int _2953 = abs(_2951);
    int _2955 = ~_2941;
    int _2957 = _2955 + 1;
    int _2959 = _2957 + 1;
    int _2961 = ~_2945;
    int _2963 = _2961 + 1;
    int _2965 = _2963 + 1;
    int _2967 = _2959 * as_type<int>(_2789);
    int _2969 = _2967 + _2929;
    int _2971 = _2965 * as_type<int>(_2745);
    int _2973 = _2971 + _2921;
    int _2975 = ~_2947;
    int _2977 = _2975 + 1;
    int _2979 = _2977 + 1;
    int _2981 = ~_2953;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    int _2987 = ~_2943;
    int _2989 = _2987 + 1;
    int _2991 = _2989 + 1;
    int _2993 = _2979 * as_type<int>(_2797);
    int _2995 = _2993 + _2969;
    bool _2997 = !_2147;
    int _2999 = _2997 ? _2755 : (-1);
    bool _3001 = !_2159;
    int _3003 = _3001 ? _2775 : (-1);
    int _3005 = _2995 * _2985;
    float _3007 = _2579 * _2935;
    int _3009 = _2973 * _2991;
    int _3011 = _3003 * _2953;
    int _3013 = _3011 + _3005;
    float _3015 = -_2621;
    float _3017 = _3007 * _3015;
    int _3019 = _2999 * _2943;
    int _3021 = _3019 + _3009;
    float _3023 = -_2581;
    float _3025 = _3007 * _3023;
    float _3027 = -_2625;
    float _3029 = _3007 * _3027;
    float _3031 = fma(_2935, _2545, _3017);
    float _3033 = _1775 * 0.5;
    float _3035 = fma(_2935, _2531, _3025);
    float _3037 = _2851 + _1775;
    float _3039 = _1819 + _1775;
    float _3041 = fma(_1821, -0.5, _3033);
    float _3043 = float(_3021);
    float _3045 = fma(_2935, _2609, _3029);
    float _3047 = float(_3013);
    float _3049 = _2621 + _2641;
    float _3051 = _1852 * _2645;
    float _3053 = _3037 * 0.5;
    float _3055 = _3039 * 0.5;
    out.m_78.x = _3043;
    out.m_78.y = _3047;
    float _3057 = _2581 + _2629;
    float _3059 = _2625 + _2813;
    float _3061 = fma(_1858, _3051, _1846);
    float _3063 = fma(_1860, _3051, _1848);
    out.m_80.x = _3055;
    out.m_80.y = _3041;
    out.m_80.z = _3053;
    out.m_80.w = _1775;
    bool _3065 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3067 = isnan(_1549);
    bool _3069 = _3065 || _3067;
    bool _3071 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3073 = _3069 || _3071;
    float _3075 = _595 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_82.x = _3057;
    out.m_82.y = _3049;
    out.m_82.z = _3059;
    float _3077 = _1852 * _2653;
    float _3079 = fma(_1852, _2859, _1850);
    out.m_84.x = _3035;
    out.m_84.y = _3031;
    out.m_84.z = _3045;
    out.m_86.x = _3061;
    out.m_86.y = _3063;
    out.m_86.z = _3079;
    out.m_86.w = _3077;
    float _3081 = _3051;
    float _3083 = _3045;
    float _3085 = _3031;
    float _3087 = _3035;
    if (!_3073)
    {
        _3081 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3089 = _3081;
    float _3091 = _3089;
    float _3093 = _3089;
    if (!_3073)
    {
        _1902 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3095 = _1902;
    float _3097 = _3095;
    float _3099 = _3095;
    if (!_3073)
    {
        _603 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3101 = _603;
    float _3103 = _3101;
    float _3105 = _3101;
    if (!_3073)
    {
        _3083 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3107 = _3083;
    float _3109 = _3107;
    float _3111 = _3107;
    if (!_3073)
    {
        _3085 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3113 = _3085;
    float _3115 = _3113;
    float _3117 = _3113;
    if (!_3073)
    {
        _3087 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3119 = _3087;
    bool _3121 = !_3073;
    float _3123 = _3119;
    float _3125 = _3119;
    if (!_3121)
    {
        bool _3127 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3129 = isnan(_1549);
        bool _3131 = _3127 || _3129;
        bool _3133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3135 = _3131 || _3133;
        if (!_3135)
        {
            float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3139 = _1549 + _3137;
            float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3143 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3141;
            float _3145 = 1.0 / _3143;
            float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3149 = _3147 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3151 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3167 = _3139 * _3145;
            float _3169 = precise::clamp(_3167, 0.0, 1.0);
            float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3175 = fma(_3169, _3149, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3177 = fma(_3169, _3173, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3179 = fma(_3169, _3153, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3181 = fma(_3169, _3157, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3183 = fma(_3169, _3161, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3185 = fma(_3169, _3165, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3099 = _3177;
            _3117 = _3183;
            _3093 = _3175;
            _3111 = _3181;
            _3105 = _3179;
            _3125 = _3185;
            _3187 = true;
        }
        else
        {
            bool _3189 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3191 = isnan(_1549);
            bool _3193 = _3189 || _3191;
            bool _3195 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3197 = _3193 || _3195;
            if (!_3197)
            {
                _3091 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3199 = _3091;
            _3093 = _3199;
            if (!_3197)
            {
                _3097 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3201 = _3097;
            _3099 = _3201;
            if (!_3197)
            {
                _3103 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3203 = _3103;
            _3105 = _3203;
            if (!_3197)
            {
                _3109 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3205 = _3109;
            _3111 = _3205;
            if (!_3197)
            {
                _3115 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3207 = _3115;
            _3117 = _3207;
            if (!_3197)
            {
                _3123 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3209 = _3123;
            bool _3211 = !_3197;
            _3125 = _3209;
            if (!_3211)
            {
                bool _3213 = _1549 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3215 = isnan(_1549);
                bool _3217 = _3213 || _3215;
                bool _3219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3221 = _3217 || _3219;
                if (!_3221)
                {
                    float _3223 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3225 = _1549 + _3223;
                    float _3227 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3229 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3227;
                    float _3231 = 1.0 / _3229;
                    float _3233 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3235 = _3233 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3237 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3239 = _3237 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3241 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3243 = _3241 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3245 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3253 = _3225 * _3231;
                    float _3255 = precise::clamp(_3253, 0.0, 1.0);
                    float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3261 = fma(_3255, _3235, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3263 = fma(_3255, _3259, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3265 = fma(_3255, _3239, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3267 = fma(_3255, _3243, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3269 = fma(_3255, _3247, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3271 = fma(_3255, _3251, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3099 = _3263;
                    _3117 = _3269;
                    _3093 = _3261;
                    _3111 = _3267;
                    _3105 = _3265;
                    _3125 = _3271;
                    _3187 = true;
                }
                else
                {
                    _3099 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3117 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3093 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3111 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3105 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3125 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3187 = false;
    float _3273 = _3099;
    float _3275 = _3117;
    float _3277 = _3093;
    float _3279 = _3111;
    float _3281 = _3105;
    float _3283 = _3125;
    float _3285 = fma(_3049, -0.5, 0.5);
    float _3287 = precise::clamp(_3285, 0.0, 1.0);
    float _3289 = -_3273;
    float _3291 = _3289 + _3275;
    float _3293 = -_3277;
    float _3295 = _3293 + _3279;
    float _3297 = -_3281;
    float _3299 = _3297 + _3283;
    bool _3301 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3303 = fma(_3287, _3291, _3273);
    float _3305 = fma(_3287, _3295, _3277);
    float _3307 = fma(_3287, _3299, _3281);
    float _3309 = _3075 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3311 = _3303 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3313 = fma(_3305, 0.298911988735198974609375, _3311);
    out.m_88.w = _3309;
    float _3315 = fma(_3307, 0.114477999508380889892578125, _3313);
    out.m_90.x = 0.0;
    float _3317 = -_3315;
    float _3319 = _3305 + _3317;
    float _3321 = -_3315;
    float _3323 = _3303 + _3321;
    float _3325 = -_3315;
    float _3327 = _3307 + _3325;
    float _3329 = fma(_3319, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3315);
    float _3331 = fma(_3323, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3315);
    float _3333 = fma(_3327, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3315);
    out.m_92.x = _3329;
    out.m_92.y = _3331;
    out.m_92.z = _3333;
    if (!_3301)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3335 = -_1523;
    float _3337 = _3335 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3339 = -_1525;
    float _3341 = _3339 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3343 = -_1527;
    float _3345 = _3343 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3347 = _3337 * _3337;
    float _3349 = fma(_3341, _3341, _3347);
    float _3351 = fma(_3345, _3345, _3349);
    float _3353 = sqrt(_3351);
    float _3355 = rsqrt(_3351);
    float _3357 = -_3353;
    float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3361 = _3359 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3363 = precise::clamp(_3361, 0.0, 1.0);
    float _3365 = _3341 * _3355;
    float _3367 = _3337 * _3355;
    float _3369 = abs(_3363);
    float _3371 = log2(_3369);
    float _3373 = _3345 * _3355;
    float _3375 = _3365 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3377 = _3049 * _3367;
    float _3379 = -_3367;
    float _3381 = -_3375;
    float _3383 = fma(_3379, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3381);
    float _3385 = fma(_3057, _3365, _3377);
    float _3387 = -_3373;
    float _3389 = fma(_3387, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3383);
    float _3391 = fma(_3059, _3373, _3385);
    float _3393 = precise::clamp(_3391, 0.0, 1.0);
    float _3395 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3397 = _3389 + _3395;
    float _3399 = _3371 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3401 = _3397 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3403 = precise::clamp(_3401, 0.0, 1.0);
    float _3405 = exp2(_3399);
    float _3407 = _3405 * _3403;
    float _3409 = _3393 * _3407;
    float _3411 = _3409 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3413 = _3409 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3415 = _3409 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3411;
    out.m_90.y = _3413;
    out.m_90.z = _3415;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

