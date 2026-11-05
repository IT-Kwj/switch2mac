#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_52 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_43 [[attribute(1)]];
    float4 m_41 [[attribute(2)]];
    float4 m_45 [[attribute(3)]];
    float4 m_32 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
    float4 m_50 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1877 = false;
    bool _1297 = false;
    bool _915 = false;
    bool _813 = false;
    bool _567 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_32.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    float _87 = _85;
    if (!_81)
    {
        out.m_35.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _85 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2204 = as_type<float>(_93);
        out.gl_Position.z = _2204;
    }
    if (!_81)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _97 = in.m_37.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_107)
    {
        float _113 = float(_77);
        _87 = _113;
    }
    float _115 = _87;
    bool _117 = _111 >= _115;
    bool _119 = !_107;
    bool _121 = _117 || _119;
    float _123 = _115;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (_121)
    {
        out.m_35.x = 0.0;
    }
    if (_121)
    {
        float _127 = _125 * 5.0;
        _95 = as_type<int>(_127);
    }
    int _129 = _95;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2273 = as_type<float>(_129);
        out.gl_Position.z = _2273;
    }
    if (_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_39.x;
    float _133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _135 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _137 = in.m_41.x;
    float _139 = in.m_41.y;
    float _141 = in.m_41.z;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_43.x;
    float _155 = in.m_43.y;
    float _157 = in.m_43.z;
    float _159 = in.m_45.x;
    float _161 = in.m_45.y;
    float _163 = in.m_45.z;
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = _135 * _133;
    float _169 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _171 = _139 * _139;
    float _173 = _141 * _141;
    float _175 = _137 * _137;
    float _177 = floor(_169);
    float _179 = fma(_155, _155, _171);
    float _181 = fma(_157, _157, _173);
    float _183 = fma(_153, _153, _175);
    float _185 = fma(_161, _161, _179);
    float _187 = fma(_163, _163, _181);
    float _189 = fma(_159, _159, _183);
    float _191 = _169 * 6.283185482025146484375;
    float _193 = sqrt(_185);
    float _195 = _191 * 0.15915493667125701904296875;
    float _197 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _199 = -_177;
    float _201 = _169 + _199;
    float _203 = sqrt(_189);
    float _205 = 0.0;
    float _207 = _185;
    float _209 = _197;
    float _211 = _177;
    if (!_151)
    {
        float _213 = _197 * _197;
        float _215 = _213 * 0.5;
        _205 = _215;
    }
    float _217 = _205;
    float _219 = _217;
    if (!_151)
    {
        float _221 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _221;
    }
    float _223 = _219;
    bool _225 = _193 > 0.0;
    float _227 = sqrt(_187);
    bool _229 = _203 > 0.0;
    float _231 = _195 * 6.283185482025146484375;
    float _233 = cos(_231);
    int _235 = as_type<int>(_165) & 1;
    bool _237 = _235 != 0;
    int _239 = as_type<int>(_165) & 2;
    bool _241 = _239 != 0;
    int _243 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _245 = _243 != 0;
    float _247 = 0.0;
    float _249 = _223;
    float _251 = _193;
    if (_225)
    {
        float _253 = rsqrt(_185);
        _247 = _253;
    }
    float _255 = _247;
    bool _257 = _227 > 0.0;
    bool _259 = !_237;
    float _261 = _259 ? (-0.5) : 0.5;
    float _263 = 0.0;
    float _265 = _227;
    if (_229)
    {
        float _267 = rsqrt(_189);
        _263 = _267;
    }
    float _269 = _263;
    bool _271 = !_241;
    float _273 = _271 ? (-0.5) : 0.5;
    bool _275 = !_151;
    float _277 = _269;
    if (!_275)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _197 * _281;
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _197);
        float _305 = _303 * _291;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _297;
        _249 = _307;
        _251 = _291;
        _265 = _295;
    }
    float _309 = _207;
    float _311 = _249;
    float _313 = _251;
    float _315 = _265;
    bool _317 = !_151;
    float _319 = _309;
    float _321 = _315;
    float _323 = _313;
    if (!_317)
    {
        float _325 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _327 = log2(_325);
        float _329 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _331 = _329 + 1.0;
        float _333 = 1.0 / _331;
        float _335 = _197 * _327;
        float _337 = exp2(_335);
        float _339 = -_337;
        float _341 = _339 + 1.0;
        float _343 = _341 * _333;
        _319 = _337;
        _209 = _343;
    }
    float _345 = _319;
    float _347 = _209;
    float _349 = 0.0;
    float _351 = _345;
    if (_257)
    {
        float _353 = rsqrt(_187);
        _349 = _353;
    }
    float _355 = _349;
    float _357 = 0.0;
    float _359 = 0.0;
    if (!_229)
    {
        _357 = 0.0;
        _359 = 0.0;
    }
    float _361 = _357;
    float _363 = _359;
    float _365 = _363;
    float _367 = _361;
    if (_229)
    {
        float _369 = _269 * _153;
        _365 = _369;
    }
    float _371 = _365;
    float _373 = 0.0;
    if (!_229)
    {
        _373 = 0.0;
    }
    float _375 = _373;
    float _377 = _375;
    if (_229)
    {
        float _379 = _269 * _137;
        _367 = _379;
    }
    float _381 = _367;
    if (!_225)
    {
        _321 = 0.0;
    }
    float _383 = _321;
    float _385 = _383;
    if (_229)
    {
        float _387 = _269 * _159;
        _377 = _387;
    }
    float _389 = _377;
    if (!_225)
    {
        _323 = 0.0;
    }
    float _391 = _323;
    float _393 = _391;
    if (_225)
    {
        float _395 = _255 * _155;
        _385 = _395;
    }
    float _397 = _385;
    float _399 = 0.0;
    if (!_225)
    {
        _399 = 0.0;
    }
    float _401 = _399;
    float _403 = _401;
    if (_225)
    {
        float _405 = _255 * _139;
        _393 = _405;
    }
    float _407 = _393;
    if (_225)
    {
        float _409 = _255 * _161;
        _403 = _409;
    }
    float _411 = _403;
    if (!_257)
    {
        _277 = 0.0;
    }
    float _413 = _277;
    float _415 = fma(_233, 0.5, 0.5);
    float _417 = _413;
    if (!_257)
    {
        _351 = 0.0;
    }
    float _419 = _351;
    float _421 = _419;
    if (_257)
    {
        float _423 = _355 * _157;
        _417 = _423;
    }
    float _425 = _417;
    if (!_257)
    {
        _211 = 0.0;
    }
    float _427 = _211;
    float _429 = _427;
    if (_257)
    {
        float _431 = _355 * _141;
        _421 = _431;
    }
    float _433 = _421;
    bool _435 = _201 < 0.5;
    float _437 = float(_435);
    if (_257)
    {
        float _439 = _355 * _163;
        _429 = _439;
    }
    float _441 = _429;
    float _443 = -_201;
    float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _447 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _449 = in.m_37.x;
    float _451 = in.m_37.y;
    float _453 = in.m_37.z;
    float _455 = -_437;
    float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _459 = -_415;
    float _461 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _463 = _447 * _381;
    float _465 = _447 * _407;
    float _467 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _469 = _447 * _433;
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _473 = _471 != 0;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _477 = _475 != 0;
    float _479 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _481 = fma(_467, _371, _463);
    float _483 = fma(_467, _397, _465);
    float _485 = in.m_50.w;
    bool _487 = !_473;
    int _489 = _487 ? 0 : 1;
    float _491 = fma(_467, _425, _469);
    bool _493 = !_245;
    int _495 = _493 ? 0 : 1;
    float _497 = in.m_32.x;
    float _499 = in.m_32.y;
    float _501 = in.m_32.z;
    float _503 = fma(_479, _389, _481);
    int _505 = abs(_489);
    float _507 = fma(_479, _411, _483);
    int _509 = abs(_495);
    float _511 = fma(_479, _441, _491);
    bool _513 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _515 = !_477;
    int _517 = _515 ? 0 : 1;
    float _519 = fma(_347, _449, _503);
    float _521 = fma(_347, _451, _507);
    float _523 = float(_505);
    float _525 = fma(_347, _453, _511);
    int _527 = abs(_517);
    float _529 = float(_509);
    float _531 = abs(_445);
    float _533 = _523 * _531;
    float _535 = float(_527);
    float _537 = fma(_529, _461, _533);
    float _539 = fma(_519, _485, _497);
    float _541 = fma(_521, _485, _499);
    float _543 = fma(_525, _485, _501);
    float _545 = abs(_457);
    float _547 = fma(_535, _545, _537);
    bool _549 = !_513;
    float _565;
    if (!_549)
    {
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _553 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _563;
        _567 = true;
    }
    else
    {
        float _569 = float(_77);
        float _571 = 1.0 / _569;
        float _573 = _111 * _571;
        _565 = _573;
    }
    _567 = false;
    float _575 = _565;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _579 = _575 + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _583 = _575 + _581;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _585;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _601 = 1.0 / _587;
    bool _603 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _605 = isnan(_575);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    bool _615 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _617 = 1.0 / _591;
    float _619 = 1.0 / _595;
    float _621 = _579 * _601;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _625 = _575 + _623;
    bool _627 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _629 = isnan(_575);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = 1.0 / _599;
    float _641 = _583 * _617;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _645 = _575 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _647;
    float _651 = -_637;
    float _653 = _651 + 1.0;
    float _655 = _625 * _619;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _657;
    float _661 = fma(_649, _621, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _663 = _613 * _653;
    bool _665 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _667 = isnan(_575);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = fma(_659, _621, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _679 = -_613;
    float _681 = _679 + 1.0;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _687 = _645 * _639;
    bool _689 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _691 = isnan(_575);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _705 = -_699;
    float _707 = _705 + 1.0;
    float _709 = _699 * _681;
    float _711 = fma(_685, _641, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _713 = fma(_703, _641, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _715 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _717 = isnan(_575);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = _675 * _707;
    float _729 = -_675;
    float _731 = _729 + 1.0;
    float _733 = in.m_50.x;
    float _735 = in.m_50.y;
    float _737 = -_725;
    float _739 = _737 + 1.0;
    float _741 = _725 * _731;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _747;
    float _751 = _677 * _741;
    float _753 = _661 * _741;
    float _755 = fma(_745, _655, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _757 = fma(_749, _655, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _759 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[143].x, _751);
    float _761 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[143].y, _753);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _771 = fma(_711, _727, _759);
    float _773 = fma(_713, _727, _761);
    float _775 = fma(_765, _687, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _777 = fma(_769, _687, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _779 = fma(_755, _709, _771);
    float _781 = fma(_757, _709, _773);
    float _783 = fma(_775, _663, _779);
    float _785 = fma(_777, _663, _781);
    float _787 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[147].x, _783);
    float _789 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[147].y, _785);
    float _791 = _787 * _733;
    float _793 = _789 * _735;
    bool _795 = !_615;
    float _811;
    if (!_795)
    {
        float _797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _799 = _131 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _801 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _803 = _801 * _797;
        float _805 = floor(_803);
        float _807 = -_805;
        float _809 = _803 + _807;
        _811 = _809;
        _813 = true;
    }
    else
    {
        float _815 = float(_77);
        float _817 = 1.0 / _815;
        float _819 = _111 * _817;
        _811 = _819;
    }
    _813 = false;
    float _821 = _811;
    bool _823 = _821 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _825 = isnan(_821);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _839 = _821 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _841 = isnan(_821);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _851;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _857 = _821 + _855;
    float _859 = -_833;
    float _861 = _859 + 1.0;
    bool _863 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _865 = 1.0 / _837;
    float _867 = _849 * _861;
    float _869 = -_849;
    float _871 = _869 + 1.0;
    float _873 = _853 * _865;
    float _875 = fma(_873, _857, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _877 = _875 * _867;
    float _879 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[115].x, _877);
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _887 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[116].x, _879);
    float _889 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = _887 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_52.x = _889;
    out.m_52.y = _891;
    out.m_52.z = _893;
    out.m_52.w = _895;
    bool _897 = !_863;
    float _913;
    if (!_897)
    {
        float _899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _901 = _131 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _903 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[11].z, _111);
        float _905 = _903 * _899;
        float _907 = floor(_905);
        float _909 = -_907;
        float _911 = _905 + _909;
        _913 = _911;
        _915 = true;
    }
    else
    {
        float _917 = float(_77);
        float _919 = 1.0 / _917;
        float _921 = _111 * _919;
        _913 = _921;
    }
    _915 = false;
    float _923 = _913;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _927 = _923 + _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _929;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _937;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _945 = 1.0 / _931;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _947;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _953 = _951 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _955 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _957 = isnan(_923);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _963 = _959 || _961;
    float _965 = float(_963);
    float _967 = 1.0 / _939;
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _971 = _923 + _969;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _973;
    float _977 = -_965;
    float _979 = _977 + 1.0;
    float _981 = 1.0 / _935;
    float _983 = _971 * _945;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _987 = _923 + _985;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _991 = _923 + _989;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _993;
    float _997 = fma(_975, _983, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _999 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1001 = 1.0 / _949;
    float _1003 = _987 * _967;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1007 = _923 + _1005;
    bool _1009 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1011 = isnan(_923);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1017 = _1013 || _1015;
    float _1019 = float(_1017);
    float _1021 = 1.0 / _953;
    float _1023 = _1007 * _981;
    float _1025 = -_1019;
    float _1027 = _1025 + 1.0;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1031 = _923 + _1029;
    float _1033 = 1.0 / _943;
    bool _1035 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1037 = isnan(_923);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = _927 * _1001;
    float _1049 = _1045 * _1027;
    float _1051 = -_1045;
    float _1053 = _1051 + 1.0;
    float _1055 = _991 * _1021;
    bool _1057 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1059 = isnan(_923);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(_1065);
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1075 = _1073 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1081 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1083 = isnan(_923);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1089 = _1085 || _1087;
    float _1091 = float(_1089);
    float _1093 = _1067 * _1053;
    float _1095 = -_1067;
    float _1097 = _1095 + 1.0;
    float _1099 = _1031 * _1033;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1101;
    float _1105 = fma(_1071, _983, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1107 = _965 * _1097;
    bool _1109 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1111 = isnan(_923);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1117 = _1113 || _1115;
    float _1119 = float(_1117);
    float _1121 = fma(_1103, _983, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1123 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1125 = isnan(_923);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1131 = _1127 || _1129;
    float _1133 = float(_1131);
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1139 = fma(_1075, _1023, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1141 = -_1119;
    float _1143 = _1141 + 1.0;
    float _1145 = fma(_1079, _1023, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1147 = _1133 * _979;
    float _1149 = fma(_1137, _1023, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1151 = -_1133;
    float _1153 = _1151 + 1.0;
    float _1155 = _1091 * _1143;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1157;
    float _1161 = fma(_995, _1047, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1163 = _1119 * _1153;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1165;
    float _1169 = _1121 * _1155;
    float _1171 = _1105 * _1155;
    float _1173 = _997 * _1155;
    float _1175 = -_1091;
    float _1177 = _1175 + 1.0;
    float _1179 = fma(_1159, _1047, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1181 = fma(_1167, _1047, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1189 = _1187 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1191 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1169);
    float _1193 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1171);
    float _1195 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1173);
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1199 = _1197 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1201 = fma(_1185, _1055, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1203 = fma(_1189, _1055, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1205 = fma(_1149, _1163, _1191);
    float _1207 = fma(_1139, _1163, _1193);
    float _1209 = fma(_1145, _1163, _1195);
    float _1211 = fma(_1199, _1055, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1213 = fma(_1179, _1147, _1205);
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1215;
    float _1219 = fma(_1181, _1147, _1209);
    float _1221 = fma(_1161, _1147, _1207);
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1227;
    float _1231 = fma(_1217, _1003, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1233 = fma(_1203, _1107, _1213);
    float _1235 = fma(_1211, _1107, _1219);
    float _1237 = fma(_1225, _1003, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1239 = fma(_1201, _1107, _1221);
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1243 = _1241 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1249 = fma(_1229, _1003, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1255 = fma(_1231, _1093, _1233);
    float _1257 = fma(_1243, _1099, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1259 = fma(_1247, _1099, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1261 = fma(_1237, _1093, _1239);
    float _1263 = fma(_1253, _1099, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1265 = fma(_1249, _1093, _1235);
    float _1267 = fma(_1257, _1049, _1255);
    float _1269 = fma(_1259, _1049, _1261);
    float _1271 = fma(_1263, _1049, _1265);
    float _1273 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1267);
    float _1275 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1269);
    float _1277 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1271);
    bool _1279 = !_999;
    float _1295;
    if (!_1279)
    {
        float _1281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1283 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1285 = fma(_1283, (*spvDescriptorSet0.vp_c9)._m0[11].w, _111);
        float _1287 = _1285 * _1281;
        float _1289 = floor(_1287);
        float _1291 = -_1289;
        float _1293 = _1287 + _1291;
        _1295 = _1293;
        _1297 = true;
    }
    else
    {
        float _1299 = float(_77);
        float _1301 = 1.0 / _1299;
        float _1303 = _111 * _1301;
        _1295 = _1303;
    }
    _1297 = false;
    float _1305 = _1295;
    float _1307 = in.m_39.w;
    float _1309 = _541 * _155;
    float _1311 = _541 * _139;
    float _1313 = _541 * _161;
    float _1315 = in.m_39.z;
    float _1317 = fma(_539, _153, _1309);
    float _1319 = fma(_539, _137, _1311);
    float _1321 = fma(_539, _159, _1313);
    float _1323 = in.m_39.y;
    float _1325 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1327 = fma(_543, _141, _1319);
    int _1329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1331 = _1329 != 0;
    float _1333 = fma(_543, _157, _1317);
    int _1335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1337 = _1335 != 0;
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1343 = _1341 != 0;
    float _1345 = fma(_543, _163, _1321);
    int _1347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1349 = _1347 != 0;
    float _1351 = -_1339;
    float _1353 = fma(_1325, 2.0, _1351);
    float _1355 = in.m_41.w;
    float _1357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1359 = _1307 > 0.5;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1363 = _1361 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1365 = in.m_43.w;
    bool _1367 = _1315 > 0.5;
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1371 = in.m_45.w;
    float _1373 = 1.0 / _1363;
    float _1375 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1379 = _131 > 0.5;
    float _1381 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1369);
    float _1383 = fma(_1375, -2.0, _1377);
    float _1385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1389 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1381);
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1391;
    float _1395 = -_261;
    int _1397 = _1379 ? as_type<int>(_1395) : as_type<int>(_261);
    float _1399 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1387);
    bool _1401 = _1323 > 0.5;
    float _1403 = -_111;
    float _1405 = fma(_1403, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1353);
    float _1407 = _1393 * _1373;
    float _1409 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1383);
    float _1411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1413 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1399);
    bool _1415 = _1305 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1417 = isnan(_1305);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1423 = _1419 || _1421;
    float _1425 = float(_1423);
    float _1427 = _1333 + _1365;
    bool _1429 = !_1331;
    float _1431 = _1429 ? _261 : as_type<float>(_1397);
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1435 = _1305 + _1433;
    float _1437 = _1327 + _1355;
    bool _1439 = _1305 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1441 = isnan(_1305);
    bool _1443 = _1439 || _1441;
    bool _1445 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1447 = _1443 || _1445;
    float _1449 = float(_1447);
    float _1451 = -_1425;
    float _1453 = _1451 + 1.0;
    float _1455 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1457 = -_273;
    int _1459 = _1401 ? as_type<int>(_1457) : as_type<int>(_273);
    float _1461 = _1431 + 0.5;
    float _1463 = fma(_1407, _1435, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1465 = _1449 * _1453;
    bool _1467 = !_1337;
    float _1469 = _1467 ? _273 : as_type<float>(_1459);
    float _1471 = fma(_1455, _1461, _1405);
    float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1475 = _1437 + _1473;
    float _1477 = _1463 * _1465;
    float _1479 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1481 = _1469 + (-0.5);
    float _1483 = _1345 + _1371;
    float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1487 = _1427 + _1485;
    float _1489 = _1475 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1491 = -_1449;
    float _1493 = _1491 + 1.0;
    float _1495 = -_1479;
    float _1497 = -_1409;
    float _1499 = fma(_1495, _1481, _1497);
    float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1503 = _1483 + _1501;
    float _1505 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1489);
    float _1507 = -_273;
    int _1509 = _1359 ? as_type<int>(_1507) : as_type<int>(_273);
    float _1511 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1477);
    float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1515 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1505);
    bool _1517 = !_1349;
    float _1519 = _1517 ? _273 : as_type<float>(_1509);
    float _1521 = -_1389;
    float _1523 = _1521 + 1.0;
    float _1525 = fma(_1425, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1511);
    float _1527 = _1475 * _1475;
    float _1529 = -_261;
    int _1531 = _1367 ? as_type<int>(_1529) : as_type<int>(_261);
    float _1533 = -_1523;
    float _1535 = fma(_1431, _1533, _1471);
    bool _1537 = _1515 >= 0.0;
    float _1539 = -_1519;
    float _1541 = _1539 + 0.5;
    float _1543 = fma(_1487, _1487, _1527);
    bool _1545 = !_1343;
    float _1547 = _1545 ? _261 : as_type<float>(_1531);
    float _1549 = -_1413;
    float _1551 = _1549 + 1.0;
    float _1553 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1555 = fma(_1503, _1503, _1543);
    float _1557 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1559 = _1547 + 0.5;
    float _1561 = _1553 * _1513;
    float _1563 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1565 = rsqrt(_1555);
    float _1567 = _1559 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1569 = _1277 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1571 = _1541;
    int _1573 = as_type<int>(_1569);
    if (_1537)
    {
        _1571 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1575 = _1571;
    float _1577 = _1557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1579 = fma(_1469, _1551, _1499);
    float _1581 = _1563 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1583 = _1567 * _1357;
    float _1585 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1587 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1537)
    {
        float _1589 = _1575 * 5.0;
        _1573 = as_type<int>(_1589);
    }
    int _1591 = _1573;
    out.m_54.x = _1535;
    out.m_54.y = _1579;
    out.m_54.z = _1583;
    out.m_54.w = _1561;
    out.m_56.x = _1577;
    out.m_56.y = _1581;
    out.m_56.z = _1585;
    out.m_56.w = _1587;
    float _1593 = _1475 * _1565;
    float _1595 = _1487 * _1565;
    if (_1537)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4605 = as_type<float>(_1591);
        out.gl_Position.z = _4605;
    }
    if (_1537)
    {
        out.m_35.x = 0.0;
    }
    if (_1537)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1597 = -_1593;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1437);
    float _1601 = _1503 * _1565;
    float _1603 = -_1595;
    float _1605 = fma(_1603, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1427);
    float _1607 = -_1593;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1475);
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1613 = _1599 + _1611;
    float _1615 = -_1601;
    float _1617 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1483);
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1621 = _1605 + _1619;
    float _1623 = -_1595;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1487);
    float _1627 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1631 = _1617 + _1629;
    float _1633 = _1609 * _1609;
    float _1635 = -_1601;
    float _1637 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1503);
    float _1639 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1627);
    float _1641 = _547 * _791;
    float _1643 = fma(_1625, _1625, _1633);
    float _1645 = _547 * _793;
    float _1647 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1639);
    float _1649 = fma(_1637, _1637, _1643);
    bool _1651 = _1647 >= 0.0;
    float _1653 = sqrt(_1649);
    float _1655 = _1647;
    if (_1651)
    {
        _1655 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1657 = _1655;
    int _1659 = as_type<int>(_1657);
    if (_1651)
    {
        out.m_35.x = 0.0;
    }
    if (_1651)
    {
        float _1661 = _1657 * 5.0;
        _1659 = as_type<int>(_1661);
    }
    int _1663 = _1659;
    float _1665 = _1565 * _1653;
    if (_1651)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4743 = as_type<float>(_1663);
        out.gl_Position.z = _4743;
    }
    if (_1651)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1667 = _1645 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1669 = _1641 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1671 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _273);
    float _1673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _261);
    float _1675 = _1665 * _1667;
    float _1677 = _1665 * _1669;
    float _1679 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1681 = _1679 * 0.5;
    float _1683 = _1671 * _1675;
    float _1685 = _1673 * _1677;
    float _1687 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1689 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1691 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1687);
    float _1693 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1689);
    float _1695 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1691);
    float _1697 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1693);
    float _1699 = _1695 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1701 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1703 = _1427 + _1699;
    float _1705 = _1483 + _1701;
    float _1707 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1711 = _1703 + _1709;
    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1715 = _1705 + _1713;
    float _1717 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1707);
    float _1719 = _1711 * _1711;
    float _1721 = _1715 * _1715;
    float _1723 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1717);
    float _1725 = _1719 + _1721;
    float _1727 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1729 = sqrt(_1725);
    float _1731 = _1437 + _1727;
    bool _1733 = _1729 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1735 = _1727;
    float _1737 = _1707;
    float _1739 = _1681;
    float _1741 = _1683;
    float _1743 = _1721;
    if (!_1733)
    {
        _1735 = _1719;
    }
    float _1745 = _1735;
    float _1747 = _1745;
    if (!_1733)
    {
        _1737 = _1703;
    }
    float _1749 = _1737;
    float _1751 = _1749;
    if (!_1733)
    {
        _1739 = _1705;
    }
    float _1753 = _1739;
    float _1755 = _1753;
    if (!_1733)
    {
        _1741 = _1731;
    }
    float _1757 = _1741;
    bool _1759 = !_1733;
    float _1761 = _1757;
    if (!_1759)
    {
        float _1763 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1767 = _1729 + _1765;
        float _1769 = rsqrt(_1725);
        float _1771 = _1767 * _1763;
        float _1773 = _1731 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1775 = _1771 * 0.15915493667125701904296875;
        float _1777 = _1775 * 6.283185482025146484375;
        float _1779 = sin(_1777);
        float _1781 = _1775 * 6.283185482025146484375;
        float _1783 = cos(_1781);
        float _1785 = fma(_1779, _1773, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1787 = _1769 * _1785;
        float _1789 = _1783 + (-1.0);
        float _1791 = fma(_1711, _1787, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1793 = fma(_1715, _1787, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1795 = _1789 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1799 = _1791 + _1797;
        float _1801 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1803 = _1793 + _1801;
        float _1805 = fma(_1731, _1783, _1795);
        float _1807 = _1799 * _1799;
        float _1809 = _1803 * _1803;
        _1761 = _1805;
        _1747 = _1807;
        _1743 = _1809;
        _1751 = _1791;
        _1755 = _1793;
    }
    float _1811 = _1761;
    float _1813 = _1747;
    float _1815 = _1743;
    float _1817 = _1751;
    float _1819 = _1755;
    float _1821 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1823 = _1811 + _1821;
    float _1825 = fma(_1823, _1823, _1813);
    float _1827 = _1825 + _1815;
    float _1829 = sqrt(_1827);
    bool _1831 = _1829 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1833 = isnan(_1829);
    bool _1835 = _1831 || _1833;
    bool _1837 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1839 = _1835 || _1837;
    float _1841 = _1825;
    if (!_1839)
    {
        _1841 = 1.0;
    }
    float _1843 = _1841;
    bool _1845 = !_1839;
    float _1847 = _1843;
    if (!_1845)
    {
        bool _1849 = _1829 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1851 = isnan(_1829);
        bool _1853 = _1849 || _1851;
        bool _1855 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1857 = _1853 || _1855;
        if (!_1857)
        {
            float _1859 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1861 = _1829 + _1859;
            float _1863 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1865 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1863;
            float _1867 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1869 = _1867 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1871 = 1.0 / _1865;
            float _1873 = _1861 * _1871;
            float _1875 = fma(_1873, _1869, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1847 = _1875;
            _1877 = true;
        }
        else
        {
            bool _1879 = _1829 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1881 = isnan(_1829);
            bool _1883 = _1879 || _1881;
            bool _1885 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1887 = _1883 || _1885;
            if (!_1887)
            {
                float _1889 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1891 = _1829 + _1889;
                float _1893 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1895 = _1893 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1897 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1899 = _1897 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1901 = 1.0 / _1895;
                float _1903 = _1891 * _1901;
                float _1905 = fma(_1903, _1899, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1847 = _1905;
                _1877 = true;
            }
            else
            {
                _1847 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1877 = false;
    float _1907 = _1847;
    float _1909 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1911 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1913 = _1817 + _1911;
    float _1915 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1917 = _1819 + _1915;
    float _1919 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1909);
    bool _1921 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1923 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1925 = _1921 || _1923;
    bool _1927 = isnan(0.5);
    bool _1929 = _1925 || _1927;
    float _1931 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1933 = _1811 + _1931;
    float _1935 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1937 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1919);
    float _1939 = fma(_1913, _1907, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1941 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1935);
    float _1943 = _1937 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1945 = -_1595;
    float _1947 = fma(_1945, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1939);
    float _1949 = fma(_1933, _1907, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1951 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1941);
    float _1953 = 1.0 / _1943;
    float _1955 = fma(_1917, _1907, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1957 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1959 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan(0.5);
    bool _1965 = _1961 || _1963;
    float _1967 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1969 = -_1593;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1949);
    float _1973 = -_1601;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1955);
    float _1977 = _1967 + _1943;
    float _1979 = _1967;
    float _1981 = _1971;
    float _1983 = _1975;
    if (_1929)
    {
        _1979 = _1947;
    }
    float _1985 = _1979;
    float _1987 = _1985;
    if (!_1929)
    {
        float _1989 = _1613 * _1613;
        float _1991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1993 = -_1427;
        float _1995 = _1993 + _1939;
        float _1997 = -_1437;
        float _1999 = _1997 + _1949;
        float _2001 = fma(_1621, _1621, _1989);
        float _2003 = -_1483;
        float _2005 = _2003 + _1955;
        float _2007 = fma(_1631, _1631, _2001);
        float _2009 = 1.0 / _1665;
        float _2011 = sqrt(_2007);
        float _2013 = precise::min(_2011, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2015 = _2013 * _1991;
        float _2017 = _2015 * _2009;
        float _2019 = fma(_1995, _2017, _1605);
        float _2021 = fma(_1999, _2017, _1599);
        float _2023 = fma(_2005, _2017, _1617);
        _1981 = _2021;
        _1987 = _2019;
        _1983 = _2023;
    }
    float _2025 = _1981;
    float _2027 = _1987;
    float _2029 = _1983;
    float _2031 = _2025 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2033 = _1977 * _1953;
    float _2035 = _2033 * 0.5;
    float _2037 = _2025 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2039 = _2025 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2041 = _2025 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2043 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2031);
    float _2045 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2037);
    float _2047 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2039);
    float _2049 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2041);
    float _2051 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2043);
    float _2053 = _2043;
    if (_1965)
    {
        _2053 = 1.0;
    }
    float _2055 = _2053;
    float _2057 = _2055;
    if (!_1965)
    {
        float _2059 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2061 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2059);
        float _2063 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2065 = _2063 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _2067 = 1.0 / _2061;
        float _2069 = 1.0 / _2065;
        float _2071 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2073 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2075 = fma(_2067, _2071, _2073);
        float _2077 = _2075 * _2069;
        float _2079 = precise::clamp(_2077, 0.0, 1.0);
        _2057 = _2079;
    }
    float _2081 = _2057;
    float _2083 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2045);
    float _2085 = _2051 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2087 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2047);
    float _2089 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2049);
    float _2091 = _2083 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2093 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2095 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2097 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2099 = _2087 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2101 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2093);
    float _2103 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2095);
    float _2105 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2107 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2097);
    float _2109 = _2089 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2111 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2101);
    float _2113 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2103);
    float _2115 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2105);
    float _2117 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2107);
    float _2119 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2111);
    float _2121 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2113);
    bool _2123 = _2081 > 0.0;
    bool _2125 = isnan(_2081);
    bool _2127 = _2123 || _2125;
    bool _2129 = isnan(0.0);
    bool _2131 = _2127 || _2129;
    float _2133 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2115);
    float _2135 = _2081 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2137 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2117);
    float _2139 = _2119 + _2121;
    float _2141 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2133);
    float _2143 = _2135 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2145 = _2139 * 0.5;
    out.m_35.x = _2143;
    out.gl_Position.x = _2137;
    out.gl_Position.y = _2141;
    out.gl_Position.z = _2119;
    out.gl_Position.w = _2121;
    out.m_58.z = _2145;
    out.m_58.w = _2121;
    if (_2131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _2147 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2147;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1877 = false;
    bool _1297 = false;
    bool _915 = false;
    bool _813 = false;
    bool _567 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_32.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    float _87 = _85;
    if (!_81)
    {
        out.m_35.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _85 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2204 = as_type<float>(_93);
        out.gl_Position.z = _2204;
    }
    if (!_81)
    {
        return out;
    }
    float _97 = in.m_37.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_107)
    {
        float _113 = float(_77);
        _87 = _113;
    }
    float _115 = _87;
    bool _117 = _111 >= _115;
    bool _119 = !_107;
    bool _121 = _117 || _119;
    float _123 = _115;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (_121)
    {
        out.m_35.x = 0.0;
    }
    if (_121)
    {
        float _127 = _125 * 5.0;
        _95 = as_type<int>(_127);
    }
    int _129 = _95;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2273 = as_type<float>(_129);
        out.gl_Position.z = _2273;
    }
    if (_121)
    {
        return out;
    }
    float _131 = in.m_39.x;
    float _133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _135 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _137 = in.m_41.x;
    float _139 = in.m_41.y;
    float _141 = in.m_41.z;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_43.x;
    float _155 = in.m_43.y;
    float _157 = in.m_43.z;
    float _159 = in.m_45.x;
    float _161 = in.m_45.y;
    float _163 = in.m_45.z;
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = _135 * _133;
    float _169 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _171 = _139 * _139;
    float _173 = _141 * _141;
    float _175 = _137 * _137;
    float _177 = floor(_169);
    float _179 = fma(_155, _155, _171);
    float _181 = fma(_157, _157, _173);
    float _183 = fma(_153, _153, _175);
    float _185 = fma(_161, _161, _179);
    float _187 = fma(_163, _163, _181);
    float _189 = fma(_159, _159, _183);
    float _191 = _169 * 6.283185482025146484375;
    float _193 = sqrt(_185);
    float _195 = _191 * 0.15915493667125701904296875;
    float _197 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _199 = -_177;
    float _201 = _169 + _199;
    float _203 = sqrt(_189);
    float _205 = 0.0;
    float _207 = _185;
    float _209 = _197;
    float _211 = _177;
    if (!_151)
    {
        float _213 = _197 * _197;
        float _215 = _213 * 0.5;
        _205 = _215;
    }
    float _217 = _205;
    float _219 = _217;
    if (!_151)
    {
        float _221 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _221;
    }
    float _223 = _219;
    bool _225 = _193 > 0.0;
    float _227 = sqrt(_187);
    bool _229 = _203 > 0.0;
    float _231 = _195 * 6.283185482025146484375;
    float _233 = cos(_231);
    int _235 = as_type<int>(_165) & 1;
    bool _237 = _235 != 0;
    int _239 = as_type<int>(_165) & 2;
    bool _241 = _239 != 0;
    int _243 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _245 = _243 != 0;
    float _247 = 0.0;
    float _249 = _223;
    float _251 = _193;
    if (_225)
    {
        float _253 = rsqrt(_185);
        _247 = _253;
    }
    float _255 = _247;
    bool _257 = _227 > 0.0;
    bool _259 = !_237;
    float _261 = _259 ? (-0.5) : 0.5;
    float _263 = 0.0;
    float _265 = _227;
    if (_229)
    {
        float _267 = rsqrt(_189);
        _263 = _267;
    }
    float _269 = _263;
    bool _271 = !_241;
    float _273 = _271 ? (-0.5) : 0.5;
    bool _275 = !_151;
    float _277 = _269;
    if (!_275)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _197 * _281;
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _197);
        float _305 = _303 * _291;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _297;
        _249 = _307;
        _251 = _291;
        _265 = _295;
    }
    float _309 = _207;
    float _311 = _249;
    float _313 = _251;
    float _315 = _265;
    bool _317 = !_151;
    float _319 = _309;
    float _321 = _315;
    float _323 = _313;
    if (!_317)
    {
        float _325 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _327 = log2(_325);
        float _329 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _331 = _329 + 1.0;
        float _333 = 1.0 / _331;
        float _335 = _197 * _327;
        float _337 = exp2(_335);
        float _339 = -_337;
        float _341 = _339 + 1.0;
        float _343 = _341 * _333;
        _319 = _337;
        _209 = _343;
    }
    float _345 = _319;
    float _347 = _209;
    float _349 = 0.0;
    float _351 = _345;
    if (_257)
    {
        float _353 = rsqrt(_187);
        _349 = _353;
    }
    float _355 = _349;
    float _357 = 0.0;
    float _359 = 0.0;
    if (!_229)
    {
        _357 = 0.0;
        _359 = 0.0;
    }
    float _361 = _357;
    float _363 = _359;
    float _365 = _363;
    float _367 = _361;
    if (_229)
    {
        float _369 = _269 * _153;
        _365 = _369;
    }
    float _371 = _365;
    float _373 = 0.0;
    if (!_229)
    {
        _373 = 0.0;
    }
    float _375 = _373;
    float _377 = _375;
    if (_229)
    {
        float _379 = _269 * _137;
        _367 = _379;
    }
    float _381 = _367;
    if (!_225)
    {
        _321 = 0.0;
    }
    float _383 = _321;
    float _385 = _383;
    if (_229)
    {
        float _387 = _269 * _159;
        _377 = _387;
    }
    float _389 = _377;
    if (!_225)
    {
        _323 = 0.0;
    }
    float _391 = _323;
    float _393 = _391;
    if (_225)
    {
        float _395 = _255 * _155;
        _385 = _395;
    }
    float _397 = _385;
    float _399 = 0.0;
    if (!_225)
    {
        _399 = 0.0;
    }
    float _401 = _399;
    float _403 = _401;
    if (_225)
    {
        float _405 = _255 * _139;
        _393 = _405;
    }
    float _407 = _393;
    if (_225)
    {
        float _409 = _255 * _161;
        _403 = _409;
    }
    float _411 = _403;
    if (!_257)
    {
        _277 = 0.0;
    }
    float _413 = _277;
    float _415 = fma(_233, 0.5, 0.5);
    float _417 = _413;
    if (!_257)
    {
        _351 = 0.0;
    }
    float _419 = _351;
    float _421 = _419;
    if (_257)
    {
        float _423 = _355 * _157;
        _417 = _423;
    }
    float _425 = _417;
    if (!_257)
    {
        _211 = 0.0;
    }
    float _427 = _211;
    float _429 = _427;
    if (_257)
    {
        float _431 = _355 * _141;
        _421 = _431;
    }
    float _433 = _421;
    bool _435 = _201 < 0.5;
    float _437 = float(_435);
    if (_257)
    {
        float _439 = _355 * _163;
        _429 = _439;
    }
    float _441 = _429;
    float _443 = -_201;
    float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _447 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _449 = in.m_37.x;
    float _451 = in.m_37.y;
    float _453 = in.m_37.z;
    float _455 = -_437;
    float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _459 = -_415;
    float _461 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _463 = _447 * _381;
    float _465 = _447 * _407;
    float _467 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _469 = _447 * _433;
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _473 = _471 != 0;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _477 = _475 != 0;
    float _479 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _481 = fma(_467, _371, _463);
    float _483 = fma(_467, _397, _465);
    float _485 = in.m_50.w;
    bool _487 = !_473;
    int _489 = _487 ? 0 : 1;
    float _491 = fma(_467, _425, _469);
    bool _493 = !_245;
    int _495 = _493 ? 0 : 1;
    float _497 = in.m_32.x;
    float _499 = in.m_32.y;
    float _501 = in.m_32.z;
    float _503 = fma(_479, _389, _481);
    int _505 = abs(_489);
    float _507 = fma(_479, _411, _483);
    int _509 = abs(_495);
    float _511 = fma(_479, _441, _491);
    bool _513 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _515 = !_477;
    int _517 = _515 ? 0 : 1;
    float _519 = fma(_347, _449, _503);
    float _521 = fma(_347, _451, _507);
    float _523 = float(_505);
    float _525 = fma(_347, _453, _511);
    int _527 = abs(_517);
    float _529 = float(_509);
    float _531 = abs(_445);
    float _533 = _523 * _531;
    float _535 = float(_527);
    float _537 = fma(_529, _461, _533);
    float _539 = fma(_519, _485, _497);
    float _541 = fma(_521, _485, _499);
    float _543 = fma(_525, _485, _501);
    float _545 = abs(_457);
    float _547 = fma(_535, _545, _537);
    bool _549 = !_513;
    float _565;
    if (!_549)
    {
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _553 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _563;
        _567 = true;
    }
    else
    {
        float _569 = float(_77);
        float _571 = 1.0 / _569;
        float _573 = _111 * _571;
        _565 = _573;
    }
    _567 = false;
    float _575 = _565;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _579 = _575 + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _583 = _575 + _581;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _585;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _601 = 1.0 / _587;
    bool _603 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _605 = isnan(_575);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    bool _615 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _617 = 1.0 / _591;
    float _619 = 1.0 / _595;
    float _621 = _579 * _601;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _625 = _575 + _623;
    bool _627 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _629 = isnan(_575);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = 1.0 / _599;
    float _641 = _583 * _617;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _645 = _575 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _647;
    float _651 = -_637;
    float _653 = _651 + 1.0;
    float _655 = _625 * _619;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _657;
    float _661 = fma(_649, _621, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _663 = _613 * _653;
    bool _665 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _667 = isnan(_575);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = fma(_659, _621, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _679 = -_613;
    float _681 = _679 + 1.0;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _687 = _645 * _639;
    bool _689 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _691 = isnan(_575);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _705 = -_699;
    float _707 = _705 + 1.0;
    float _709 = _699 * _681;
    float _711 = fma(_685, _641, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _713 = fma(_703, _641, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _715 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _717 = isnan(_575);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = _675 * _707;
    float _729 = -_675;
    float _731 = _729 + 1.0;
    float _733 = in.m_50.x;
    float _735 = in.m_50.y;
    float _737 = -_725;
    float _739 = _737 + 1.0;
    float _741 = _725 * _731;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _747;
    float _751 = _677 * _741;
    float _753 = _661 * _741;
    float _755 = fma(_745, _655, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _757 = fma(_749, _655, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _759 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[143].x, _751);
    float _761 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[143].y, _753);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _771 = fma(_711, _727, _759);
    float _773 = fma(_713, _727, _761);
    float _775 = fma(_765, _687, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _777 = fma(_769, _687, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _779 = fma(_755, _709, _771);
    float _781 = fma(_757, _709, _773);
    float _783 = fma(_775, _663, _779);
    float _785 = fma(_777, _663, _781);
    float _787 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[147].x, _783);
    float _789 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[147].y, _785);
    float _791 = _787 * _733;
    float _793 = _789 * _735;
    bool _795 = !_615;
    float _811;
    if (!_795)
    {
        float _797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _799 = _131 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _801 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _803 = _801 * _797;
        float _805 = floor(_803);
        float _807 = -_805;
        float _809 = _803 + _807;
        _811 = _809;
        _813 = true;
    }
    else
    {
        float _815 = float(_77);
        float _817 = 1.0 / _815;
        float _819 = _111 * _817;
        _811 = _819;
    }
    _813 = false;
    float _821 = _811;
    bool _823 = _821 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _825 = isnan(_821);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _839 = _821 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _841 = isnan(_821);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _851;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _857 = _821 + _855;
    float _859 = -_833;
    float _861 = _859 + 1.0;
    bool _863 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _865 = 1.0 / _837;
    float _867 = _849 * _861;
    float _869 = -_849;
    float _871 = _869 + 1.0;
    float _873 = _853 * _865;
    float _875 = fma(_873, _857, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _877 = _875 * _867;
    float _879 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[115].x, _877);
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _887 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[116].x, _879);
    float _889 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = _887 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_52.x = _889;
    out.m_52.y = _891;
    out.m_52.z = _893;
    out.m_52.w = _895;
    bool _897 = !_863;
    float _913;
    if (!_897)
    {
        float _899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _901 = _131 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _903 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[11].z, _111);
        float _905 = _903 * _899;
        float _907 = floor(_905);
        float _909 = -_907;
        float _911 = _905 + _909;
        _913 = _911;
        _915 = true;
    }
    else
    {
        float _917 = float(_77);
        float _919 = 1.0 / _917;
        float _921 = _111 * _919;
        _913 = _921;
    }
    _915 = false;
    float _923 = _913;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _927 = _923 + _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _929;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _937;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _945 = 1.0 / _931;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _947;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _953 = _951 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _955 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _957 = isnan(_923);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _963 = _959 || _961;
    float _965 = float(_963);
    float _967 = 1.0 / _939;
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _971 = _923 + _969;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _973;
    float _977 = -_965;
    float _979 = _977 + 1.0;
    float _981 = 1.0 / _935;
    float _983 = _971 * _945;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _987 = _923 + _985;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _991 = _923 + _989;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _993;
    float _997 = fma(_975, _983, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _999 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1001 = 1.0 / _949;
    float _1003 = _987 * _967;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1007 = _923 + _1005;
    bool _1009 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1011 = isnan(_923);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1017 = _1013 || _1015;
    float _1019 = float(_1017);
    float _1021 = 1.0 / _953;
    float _1023 = _1007 * _981;
    float _1025 = -_1019;
    float _1027 = _1025 + 1.0;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1031 = _923 + _1029;
    float _1033 = 1.0 / _943;
    bool _1035 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1037 = isnan(_923);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = _927 * _1001;
    float _1049 = _1045 * _1027;
    float _1051 = -_1045;
    float _1053 = _1051 + 1.0;
    float _1055 = _991 * _1021;
    bool _1057 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1059 = isnan(_923);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(_1065);
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1075 = _1073 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1081 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1083 = isnan(_923);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1089 = _1085 || _1087;
    float _1091 = float(_1089);
    float _1093 = _1067 * _1053;
    float _1095 = -_1067;
    float _1097 = _1095 + 1.0;
    float _1099 = _1031 * _1033;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1101;
    float _1105 = fma(_1071, _983, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1107 = _965 * _1097;
    bool _1109 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1111 = isnan(_923);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1117 = _1113 || _1115;
    float _1119 = float(_1117);
    float _1121 = fma(_1103, _983, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1123 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1125 = isnan(_923);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1131 = _1127 || _1129;
    float _1133 = float(_1131);
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1139 = fma(_1075, _1023, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1141 = -_1119;
    float _1143 = _1141 + 1.0;
    float _1145 = fma(_1079, _1023, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1147 = _1133 * _979;
    float _1149 = fma(_1137, _1023, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1151 = -_1133;
    float _1153 = _1151 + 1.0;
    float _1155 = _1091 * _1143;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1157;
    float _1161 = fma(_995, _1047, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1163 = _1119 * _1153;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1165;
    float _1169 = _1121 * _1155;
    float _1171 = _1105 * _1155;
    float _1173 = _997 * _1155;
    float _1175 = -_1091;
    float _1177 = _1175 + 1.0;
    float _1179 = fma(_1159, _1047, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1181 = fma(_1167, _1047, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1189 = _1187 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1191 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1169);
    float _1193 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1171);
    float _1195 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1173);
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1199 = _1197 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1201 = fma(_1185, _1055, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1203 = fma(_1189, _1055, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1205 = fma(_1149, _1163, _1191);
    float _1207 = fma(_1139, _1163, _1193);
    float _1209 = fma(_1145, _1163, _1195);
    float _1211 = fma(_1199, _1055, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1213 = fma(_1179, _1147, _1205);
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1215;
    float _1219 = fma(_1181, _1147, _1209);
    float _1221 = fma(_1161, _1147, _1207);
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1227;
    float _1231 = fma(_1217, _1003, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1233 = fma(_1203, _1107, _1213);
    float _1235 = fma(_1211, _1107, _1219);
    float _1237 = fma(_1225, _1003, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1239 = fma(_1201, _1107, _1221);
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1243 = _1241 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1249 = fma(_1229, _1003, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1255 = fma(_1231, _1093, _1233);
    float _1257 = fma(_1243, _1099, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1259 = fma(_1247, _1099, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1261 = fma(_1237, _1093, _1239);
    float _1263 = fma(_1253, _1099, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1265 = fma(_1249, _1093, _1235);
    float _1267 = fma(_1257, _1049, _1255);
    float _1269 = fma(_1259, _1049, _1261);
    float _1271 = fma(_1263, _1049, _1265);
    float _1273 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1267);
    float _1275 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1269);
    float _1277 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1271);
    bool _1279 = !_999;
    float _1295;
    if (!_1279)
    {
        float _1281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1283 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1285 = fma(_1283, (*spvDescriptorSet0.vp_c9)._m0[11].w, _111);
        float _1287 = _1285 * _1281;
        float _1289 = floor(_1287);
        float _1291 = -_1289;
        float _1293 = _1287 + _1291;
        _1295 = _1293;
        _1297 = true;
    }
    else
    {
        float _1299 = float(_77);
        float _1301 = 1.0 / _1299;
        float _1303 = _111 * _1301;
        _1295 = _1303;
    }
    _1297 = false;
    float _1305 = _1295;
    float _1307 = in.m_39.w;
    float _1309 = _541 * _155;
    float _1311 = _541 * _139;
    float _1313 = _541 * _161;
    float _1315 = in.m_39.z;
    float _1317 = fma(_539, _153, _1309);
    float _1319 = fma(_539, _137, _1311);
    float _1321 = fma(_539, _159, _1313);
    float _1323 = in.m_39.y;
    float _1325 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1327 = fma(_543, _141, _1319);
    int _1329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1331 = _1329 != 0;
    float _1333 = fma(_543, _157, _1317);
    int _1335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1337 = _1335 != 0;
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1343 = _1341 != 0;
    float _1345 = fma(_543, _163, _1321);
    int _1347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1349 = _1347 != 0;
    float _1351 = -_1339;
    float _1353 = fma(_1325, 2.0, _1351);
    float _1355 = in.m_41.w;
    float _1357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1359 = _1307 > 0.5;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1363 = _1361 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1365 = in.m_43.w;
    bool _1367 = _1315 > 0.5;
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1371 = in.m_45.w;
    float _1373 = 1.0 / _1363;
    float _1375 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1379 = _131 > 0.5;
    float _1381 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1369);
    float _1383 = fma(_1375, -2.0, _1377);
    float _1385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1389 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1381);
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1391;
    float _1395 = -_261;
    int _1397 = _1379 ? as_type<int>(_1395) : as_type<int>(_261);
    float _1399 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1387);
    bool _1401 = _1323 > 0.5;
    float _1403 = -_111;
    float _1405 = fma(_1403, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1353);
    float _1407 = _1393 * _1373;
    float _1409 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1383);
    float _1411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1413 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1399);
    bool _1415 = _1305 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1417 = isnan(_1305);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1423 = _1419 || _1421;
    float _1425 = float(_1423);
    float _1427 = _1333 + _1365;
    bool _1429 = !_1331;
    float _1431 = _1429 ? _261 : as_type<float>(_1397);
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1435 = _1305 + _1433;
    float _1437 = _1327 + _1355;
    bool _1439 = _1305 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1441 = isnan(_1305);
    bool _1443 = _1439 || _1441;
    bool _1445 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1447 = _1443 || _1445;
    float _1449 = float(_1447);
    float _1451 = -_1425;
    float _1453 = _1451 + 1.0;
    float _1455 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1457 = -_273;
    int _1459 = _1401 ? as_type<int>(_1457) : as_type<int>(_273);
    float _1461 = _1431 + 0.5;
    float _1463 = fma(_1407, _1435, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1465 = _1449 * _1453;
    bool _1467 = !_1337;
    float _1469 = _1467 ? _273 : as_type<float>(_1459);
    float _1471 = fma(_1455, _1461, _1405);
    float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1475 = _1437 + _1473;
    float _1477 = _1463 * _1465;
    float _1479 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1481 = _1469 + (-0.5);
    float _1483 = _1345 + _1371;
    float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1487 = _1427 + _1485;
    float _1489 = _1475 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1491 = -_1449;
    float _1493 = _1491 + 1.0;
    float _1495 = -_1479;
    float _1497 = -_1409;
    float _1499 = fma(_1495, _1481, _1497);
    float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1503 = _1483 + _1501;
    float _1505 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1489);
    float _1507 = -_273;
    int _1509 = _1359 ? as_type<int>(_1507) : as_type<int>(_273);
    float _1511 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1477);
    float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1515 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1505);
    bool _1517 = !_1349;
    float _1519 = _1517 ? _273 : as_type<float>(_1509);
    float _1521 = -_1389;
    float _1523 = _1521 + 1.0;
    float _1525 = fma(_1425, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1511);
    float _1527 = _1475 * _1475;
    float _1529 = -_261;
    int _1531 = _1367 ? as_type<int>(_1529) : as_type<int>(_261);
    float _1533 = -_1523;
    float _1535 = fma(_1431, _1533, _1471);
    bool _1537 = _1515 >= 0.0;
    float _1539 = -_1519;
    float _1541 = _1539 + 0.5;
    float _1543 = fma(_1487, _1487, _1527);
    bool _1545 = !_1343;
    float _1547 = _1545 ? _261 : as_type<float>(_1531);
    float _1549 = -_1413;
    float _1551 = _1549 + 1.0;
    float _1553 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1555 = fma(_1503, _1503, _1543);
    float _1557 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1559 = _1547 + 0.5;
    float _1561 = _1553 * _1513;
    float _1563 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1565 = rsqrt(_1555);
    float _1567 = _1559 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1569 = _1277 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1571 = _1541;
    int _1573 = as_type<int>(_1569);
    if (_1537)
    {
        _1571 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1575 = _1571;
    float _1577 = _1557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1579 = fma(_1469, _1551, _1499);
    float _1581 = _1563 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1583 = _1567 * _1357;
    float _1585 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1587 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1537)
    {
        float _1589 = _1575 * 5.0;
        _1573 = as_type<int>(_1589);
    }
    int _1591 = _1573;
    out.m_54.x = _1535;
    out.m_54.y = _1579;
    out.m_54.z = _1583;
    out.m_54.w = _1561;
    out.m_56.x = _1577;
    out.m_56.y = _1581;
    out.m_56.z = _1585;
    out.m_56.w = _1587;
    float _1593 = _1475 * _1565;
    float _1595 = _1487 * _1565;
    if (_1537)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4605 = as_type<float>(_1591);
        out.gl_Position.z = _4605;
    }
    if (_1537)
    {
        out.m_35.x = 0.0;
    }
    if (_1537)
    {
        return out;
    }
    float _1597 = -_1593;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1437);
    float _1601 = _1503 * _1565;
    float _1603 = -_1595;
    float _1605 = fma(_1603, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1427);
    float _1607 = -_1593;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1475);
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1613 = _1599 + _1611;
    float _1615 = -_1601;
    float _1617 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1483);
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1621 = _1605 + _1619;
    float _1623 = -_1595;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1487);
    float _1627 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1631 = _1617 + _1629;
    float _1633 = _1609 * _1609;
    float _1635 = -_1601;
    float _1637 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1503);
    float _1639 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1627);
    float _1641 = _547 * _791;
    float _1643 = fma(_1625, _1625, _1633);
    float _1645 = _547 * _793;
    float _1647 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1639);
    float _1649 = fma(_1637, _1637, _1643);
    bool _1651 = _1647 >= 0.0;
    float _1653 = sqrt(_1649);
    float _1655 = _1647;
    if (_1651)
    {
        _1655 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1657 = _1655;
    int _1659 = as_type<int>(_1657);
    if (_1651)
    {
        out.m_35.x = 0.0;
    }
    if (_1651)
    {
        float _1661 = _1657 * 5.0;
        _1659 = as_type<int>(_1661);
    }
    int _1663 = _1659;
    float _1665 = _1565 * _1653;
    if (_1651)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4743 = as_type<float>(_1663);
        out.gl_Position.z = _4743;
    }
    if (_1651)
    {
        return out;
    }
    float _1667 = _1645 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1669 = _1641 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1671 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _273);
    float _1673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _261);
    float _1675 = _1665 * _1667;
    float _1677 = _1665 * _1669;
    float _1679 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1681 = _1679 * 0.5;
    float _1683 = _1671 * _1675;
    float _1685 = _1673 * _1677;
    float _1687 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1689 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1691 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1687);
    float _1693 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1689);
    float _1695 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1691);
    float _1697 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1693);
    float _1699 = _1695 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1701 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1703 = _1427 + _1699;
    float _1705 = _1483 + _1701;
    float _1707 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1711 = _1703 + _1709;
    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1715 = _1705 + _1713;
    float _1717 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1707);
    float _1719 = _1711 * _1711;
    float _1721 = _1715 * _1715;
    float _1723 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1717);
    float _1725 = _1719 + _1721;
    float _1727 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1729 = sqrt(_1725);
    float _1731 = _1437 + _1727;
    bool _1733 = _1729 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1735 = _1727;
    float _1737 = _1707;
    float _1739 = _1681;
    float _1741 = _1683;
    float _1743 = _1721;
    if (!_1733)
    {
        _1735 = _1719;
    }
    float _1745 = _1735;
    float _1747 = _1745;
    if (!_1733)
    {
        _1737 = _1703;
    }
    float _1749 = _1737;
    float _1751 = _1749;
    if (!_1733)
    {
        _1739 = _1705;
    }
    float _1753 = _1739;
    float _1755 = _1753;
    if (!_1733)
    {
        _1741 = _1731;
    }
    float _1757 = _1741;
    bool _1759 = !_1733;
    float _1761 = _1757;
    if (!_1759)
    {
        float _1763 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1767 = _1729 + _1765;
        float _1769 = rsqrt(_1725);
        float _1771 = _1767 * _1763;
        float _1773 = _1731 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1775 = _1771 * 0.15915493667125701904296875;
        float _1777 = _1775 * 6.283185482025146484375;
        float _1779 = sin(_1777);
        float _1781 = _1775 * 6.283185482025146484375;
        float _1783 = cos(_1781);
        float _1785 = fma(_1779, _1773, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1787 = _1769 * _1785;
        float _1789 = _1783 + (-1.0);
        float _1791 = fma(_1711, _1787, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1793 = fma(_1715, _1787, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1795 = _1789 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1799 = _1791 + _1797;
        float _1801 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1803 = _1793 + _1801;
        float _1805 = fma(_1731, _1783, _1795);
        float _1807 = _1799 * _1799;
        float _1809 = _1803 * _1803;
        _1761 = _1805;
        _1747 = _1807;
        _1743 = _1809;
        _1751 = _1791;
        _1755 = _1793;
    }
    float _1811 = _1761;
    float _1813 = _1747;
    float _1815 = _1743;
    float _1817 = _1751;
    float _1819 = _1755;
    float _1821 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1823 = _1811 + _1821;
    float _1825 = fma(_1823, _1823, _1813);
    float _1827 = _1825 + _1815;
    float _1829 = sqrt(_1827);
    bool _1831 = _1829 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1833 = isnan(_1829);
    bool _1835 = _1831 || _1833;
    bool _1837 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1839 = _1835 || _1837;
    float _1841 = _1825;
    if (!_1839)
    {
        _1841 = 1.0;
    }
    float _1843 = _1841;
    bool _1845 = !_1839;
    float _1847 = _1843;
    if (!_1845)
    {
        bool _1849 = _1829 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1851 = isnan(_1829);
        bool _1853 = _1849 || _1851;
        bool _1855 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1857 = _1853 || _1855;
        if (!_1857)
        {
            float _1859 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1861 = _1829 + _1859;
            float _1863 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1865 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1863;
            float _1867 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1869 = _1867 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1871 = 1.0 / _1865;
            float _1873 = _1861 * _1871;
            float _1875 = fma(_1873, _1869, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1847 = _1875;
            _1877 = true;
        }
        else
        {
            bool _1879 = _1829 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1881 = isnan(_1829);
            bool _1883 = _1879 || _1881;
            bool _1885 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1887 = _1883 || _1885;
            if (!_1887)
            {
                float _1889 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1891 = _1829 + _1889;
                float _1893 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1895 = _1893 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1897 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1899 = _1897 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1901 = 1.0 / _1895;
                float _1903 = _1891 * _1901;
                float _1905 = fma(_1903, _1899, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1847 = _1905;
                _1877 = true;
            }
            else
            {
                _1847 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1877 = false;
    float _1907 = _1847;
    float _1909 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1911 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1913 = _1817 + _1911;
    float _1915 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1917 = _1819 + _1915;
    float _1919 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1909);
    bool _1921 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1923 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1925 = _1921 || _1923;
    bool _1927 = isnan(0.5);
    bool _1929 = _1925 || _1927;
    float _1931 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1933 = _1811 + _1931;
    float _1935 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1937 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1919);
    float _1939 = fma(_1913, _1907, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1941 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1935);
    float _1943 = _1937 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1945 = -_1595;
    float _1947 = fma(_1945, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1939);
    float _1949 = fma(_1933, _1907, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1951 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1941);
    float _1953 = 1.0 / _1943;
    float _1955 = fma(_1917, _1907, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1957 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1959 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan(0.5);
    bool _1965 = _1961 || _1963;
    float _1967 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1969 = -_1593;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1949);
    float _1973 = -_1601;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1955);
    float _1977 = _1967 + _1943;
    float _1979 = _1967;
    float _1981 = _1971;
    float _1983 = _1975;
    if (_1929)
    {
        _1979 = _1947;
    }
    float _1985 = _1979;
    float _1987 = _1985;
    if (!_1929)
    {
        float _1989 = _1613 * _1613;
        float _1991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1993 = -_1427;
        float _1995 = _1993 + _1939;
        float _1997 = -_1437;
        float _1999 = _1997 + _1949;
        float _2001 = fma(_1621, _1621, _1989);
        float _2003 = -_1483;
        float _2005 = _2003 + _1955;
        float _2007 = fma(_1631, _1631, _2001);
        float _2009 = 1.0 / _1665;
        float _2011 = sqrt(_2007);
        float _2013 = precise::min(_2011, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2015 = _2013 * _1991;
        float _2017 = _2015 * _2009;
        float _2019 = fma(_1995, _2017, _1605);
        float _2021 = fma(_1999, _2017, _1599);
        float _2023 = fma(_2005, _2017, _1617);
        _1981 = _2021;
        _1987 = _2019;
        _1983 = _2023;
    }
    float _2025 = _1981;
    float _2027 = _1987;
    float _2029 = _1983;
    float _2031 = _2025 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2033 = _1977 * _1953;
    float _2035 = _2033 * 0.5;
    float _2037 = _2025 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2039 = _2025 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2041 = _2025 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2043 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2031);
    float _2045 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2037);
    float _2047 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2039);
    float _2049 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2041);
    float _2051 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2043);
    float _2053 = _2043;
    if (_1965)
    {
        _2053 = 1.0;
    }
    float _2055 = _2053;
    float _2057 = _2055;
    if (!_1965)
    {
        float _2059 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2061 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2059);
        float _2063 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2065 = _2063 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _2067 = 1.0 / _2061;
        float _2069 = 1.0 / _2065;
        float _2071 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2073 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2075 = fma(_2067, _2071, _2073);
        float _2077 = _2075 * _2069;
        float _2079 = precise::clamp(_2077, 0.0, 1.0);
        _2057 = _2079;
    }
    float _2081 = _2057;
    float _2083 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2045);
    float _2085 = _2051 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2087 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2047);
    float _2089 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2049);
    float _2091 = _2083 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2093 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2095 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2097 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2099 = _2087 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2101 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2093);
    float _2103 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2095);
    float _2105 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2107 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2097);
    float _2109 = _2089 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2111 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2101);
    float _2113 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2103);
    float _2115 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2105);
    float _2117 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2107);
    float _2119 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2111);
    float _2121 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2113);
    bool _2123 = _2081 > 0.0;
    bool _2125 = isnan(_2081);
    bool _2127 = _2123 || _2125;
    bool _2129 = isnan(0.0);
    bool _2131 = _2127 || _2129;
    float _2133 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2115);
    float _2135 = _2081 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2137 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2117);
    float _2139 = _2119 + _2121;
    float _2141 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2133);
    float _2143 = _2135 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2145 = _2139 * 0.5;
    out.m_35.x = _2143;
    out.gl_Position.x = _2137;
    out.gl_Position.y = _2141;
    out.gl_Position.z = _2119;
    out.gl_Position.w = _2121;
    out.m_58.z = _2145;
    out.m_58.w = _2121;
    if (_2131)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _2147 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2147;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1877 = false;
    bool _1297 = false;
    bool _915 = false;
    bool _813 = false;
    bool _567 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_32.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    float _87 = _85;
    if (!_81)
    {
        out.m_35.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _85 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2204 = as_type<float>(_93);
        out.gl_Position.z = _2204;
    }
    if (!_81)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _97 = in.m_37.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_107)
    {
        float _113 = float(_77);
        _87 = _113;
    }
    float _115 = _87;
    bool _117 = _111 >= _115;
    bool _119 = !_107;
    bool _121 = _117 || _119;
    float _123 = _115;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (_121)
    {
        out.m_35.x = 0.0;
    }
    if (_121)
    {
        float _127 = _125 * 5.0;
        _95 = as_type<int>(_127);
    }
    int _129 = _95;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2273 = as_type<float>(_129);
        out.gl_Position.z = _2273;
    }
    if (_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_39.x;
    float _133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _135 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _137 = in.m_41.x;
    float _139 = in.m_41.y;
    float _141 = in.m_41.z;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_43.x;
    float _155 = in.m_43.y;
    float _157 = in.m_43.z;
    float _159 = in.m_45.x;
    float _161 = in.m_45.y;
    float _163 = in.m_45.z;
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = _135 * _133;
    float _169 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _171 = _139 * _139;
    float _173 = _141 * _141;
    float _175 = _137 * _137;
    float _177 = floor(_169);
    float _179 = fma(_155, _155, _171);
    float _181 = fma(_157, _157, _173);
    float _183 = fma(_153, _153, _175);
    float _185 = fma(_161, _161, _179);
    float _187 = fma(_163, _163, _181);
    float _189 = fma(_159, _159, _183);
    float _191 = _169 * 6.283185482025146484375;
    float _193 = sqrt(_185);
    float _195 = _191 * 0.15915493667125701904296875;
    float _197 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _199 = -_177;
    float _201 = _169 + _199;
    float _203 = sqrt(_189);
    float _205 = 0.0;
    float _207 = _185;
    float _209 = _197;
    float _211 = _177;
    if (!_151)
    {
        float _213 = _197 * _197;
        float _215 = _213 * 0.5;
        _205 = _215;
    }
    float _217 = _205;
    float _219 = _217;
    if (!_151)
    {
        float _221 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _221;
    }
    float _223 = _219;
    bool _225 = _193 > 0.0;
    float _227 = sqrt(_187);
    bool _229 = _203 > 0.0;
    float _231 = _195 * 6.283185482025146484375;
    float _233 = cos(_231);
    int _235 = as_type<int>(_165) & 1;
    bool _237 = _235 != 0;
    int _239 = as_type<int>(_165) & 2;
    bool _241 = _239 != 0;
    int _243 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _245 = _243 != 0;
    float _247 = 0.0;
    float _249 = _223;
    float _251 = _193;
    if (_225)
    {
        float _253 = rsqrt(_185);
        _247 = _253;
    }
    float _255 = _247;
    bool _257 = _227 > 0.0;
    bool _259 = !_237;
    float _261 = _259 ? (-0.5) : 0.5;
    float _263 = 0.0;
    float _265 = _227;
    if (_229)
    {
        float _267 = rsqrt(_189);
        _263 = _267;
    }
    float _269 = _263;
    bool _271 = !_241;
    float _273 = _271 ? (-0.5) : 0.5;
    bool _275 = !_151;
    float _277 = _269;
    if (!_275)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _197 * _281;
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _197);
        float _305 = _303 * _291;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _297;
        _249 = _307;
        _251 = _291;
        _265 = _295;
    }
    float _309 = _207;
    float _311 = _249;
    float _313 = _251;
    float _315 = _265;
    bool _317 = !_151;
    float _319 = _309;
    float _321 = _315;
    float _323 = _313;
    if (!_317)
    {
        float _325 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _327 = log2(_325);
        float _329 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _331 = _329 + 1.0;
        float _333 = 1.0 / _331;
        float _335 = _197 * _327;
        float _337 = exp2(_335);
        float _339 = -_337;
        float _341 = _339 + 1.0;
        float _343 = _341 * _333;
        _319 = _337;
        _209 = _343;
    }
    float _345 = _319;
    float _347 = _209;
    float _349 = 0.0;
    float _351 = _345;
    if (_257)
    {
        float _353 = rsqrt(_187);
        _349 = _353;
    }
    float _355 = _349;
    float _357 = 0.0;
    float _359 = 0.0;
    if (!_229)
    {
        _357 = 0.0;
        _359 = 0.0;
    }
    float _361 = _357;
    float _363 = _359;
    float _365 = _363;
    float _367 = _361;
    if (_229)
    {
        float _369 = _269 * _153;
        _365 = _369;
    }
    float _371 = _365;
    float _373 = 0.0;
    if (!_229)
    {
        _373 = 0.0;
    }
    float _375 = _373;
    float _377 = _375;
    if (_229)
    {
        float _379 = _269 * _137;
        _367 = _379;
    }
    float _381 = _367;
    if (!_225)
    {
        _321 = 0.0;
    }
    float _383 = _321;
    float _385 = _383;
    if (_229)
    {
        float _387 = _269 * _159;
        _377 = _387;
    }
    float _389 = _377;
    if (!_225)
    {
        _323 = 0.0;
    }
    float _391 = _323;
    float _393 = _391;
    if (_225)
    {
        float _395 = _255 * _155;
        _385 = _395;
    }
    float _397 = _385;
    float _399 = 0.0;
    if (!_225)
    {
        _399 = 0.0;
    }
    float _401 = _399;
    float _403 = _401;
    if (_225)
    {
        float _405 = _255 * _139;
        _393 = _405;
    }
    float _407 = _393;
    if (_225)
    {
        float _409 = _255 * _161;
        _403 = _409;
    }
    float _411 = _403;
    if (!_257)
    {
        _277 = 0.0;
    }
    float _413 = _277;
    float _415 = fma(_233, 0.5, 0.5);
    float _417 = _413;
    if (!_257)
    {
        _351 = 0.0;
    }
    float _419 = _351;
    float _421 = _419;
    if (_257)
    {
        float _423 = _355 * _157;
        _417 = _423;
    }
    float _425 = _417;
    if (!_257)
    {
        _211 = 0.0;
    }
    float _427 = _211;
    float _429 = _427;
    if (_257)
    {
        float _431 = _355 * _141;
        _421 = _431;
    }
    float _433 = _421;
    bool _435 = _201 < 0.5;
    float _437 = float(_435);
    if (_257)
    {
        float _439 = _355 * _163;
        _429 = _439;
    }
    float _441 = _429;
    float _443 = -_201;
    float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _447 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _449 = in.m_37.x;
    float _451 = in.m_37.y;
    float _453 = in.m_37.z;
    float _455 = -_437;
    float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _459 = -_415;
    float _461 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _463 = _447 * _381;
    float _465 = _447 * _407;
    float _467 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _469 = _447 * _433;
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _473 = _471 != 0;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _477 = _475 != 0;
    float _479 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _481 = fma(_467, _371, _463);
    float _483 = fma(_467, _397, _465);
    float _485 = in.m_50.w;
    bool _487 = !_473;
    int _489 = _487 ? 0 : 1;
    float _491 = fma(_467, _425, _469);
    bool _493 = !_245;
    int _495 = _493 ? 0 : 1;
    float _497 = in.m_32.x;
    float _499 = in.m_32.y;
    float _501 = in.m_32.z;
    float _503 = fma(_479, _389, _481);
    int _505 = abs(_489);
    float _507 = fma(_479, _411, _483);
    int _509 = abs(_495);
    float _511 = fma(_479, _441, _491);
    bool _513 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _515 = !_477;
    int _517 = _515 ? 0 : 1;
    float _519 = fma(_347, _449, _503);
    float _521 = fma(_347, _451, _507);
    float _523 = float(_505);
    float _525 = fma(_347, _453, _511);
    int _527 = abs(_517);
    float _529 = float(_509);
    float _531 = abs(_445);
    float _533 = _523 * _531;
    float _535 = float(_527);
    float _537 = fma(_529, _461, _533);
    float _539 = fma(_519, _485, _497);
    float _541 = fma(_521, _485, _499);
    float _543 = fma(_525, _485, _501);
    float _545 = abs(_457);
    float _547 = fma(_535, _545, _537);
    bool _549 = !_513;
    float _565;
    if (!_549)
    {
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _553 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _563;
        _567 = true;
    }
    else
    {
        float _569 = float(_77);
        float _571 = 1.0 / _569;
        float _573 = _111 * _571;
        _565 = _573;
    }
    _567 = false;
    float _575 = _565;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _579 = _575 + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _583 = _575 + _581;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _585;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _601 = 1.0 / _587;
    bool _603 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _605 = isnan(_575);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    bool _615 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _617 = 1.0 / _591;
    float _619 = 1.0 / _595;
    float _621 = _579 * _601;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _625 = _575 + _623;
    bool _627 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _629 = isnan(_575);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = 1.0 / _599;
    float _641 = _583 * _617;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _645 = _575 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _647;
    float _651 = -_637;
    float _653 = _651 + 1.0;
    float _655 = _625 * _619;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _657;
    float _661 = fma(_649, _621, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _663 = _613 * _653;
    bool _665 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _667 = isnan(_575);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = fma(_659, _621, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _679 = -_613;
    float _681 = _679 + 1.0;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _687 = _645 * _639;
    bool _689 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _691 = isnan(_575);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _705 = -_699;
    float _707 = _705 + 1.0;
    float _709 = _699 * _681;
    float _711 = fma(_685, _641, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _713 = fma(_703, _641, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _715 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _717 = isnan(_575);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = _675 * _707;
    float _729 = -_675;
    float _731 = _729 + 1.0;
    float _733 = in.m_50.x;
    float _735 = in.m_50.y;
    float _737 = -_725;
    float _739 = _737 + 1.0;
    float _741 = _725 * _731;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _747;
    float _751 = _677 * _741;
    float _753 = _661 * _741;
    float _755 = fma(_745, _655, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _757 = fma(_749, _655, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _759 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[143].x, _751);
    float _761 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[143].y, _753);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _771 = fma(_711, _727, _759);
    float _773 = fma(_713, _727, _761);
    float _775 = fma(_765, _687, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _777 = fma(_769, _687, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _779 = fma(_755, _709, _771);
    float _781 = fma(_757, _709, _773);
    float _783 = fma(_775, _663, _779);
    float _785 = fma(_777, _663, _781);
    float _787 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[147].x, _783);
    float _789 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[147].y, _785);
    float _791 = _787 * _733;
    float _793 = _789 * _735;
    bool _795 = !_615;
    float _811;
    if (!_795)
    {
        float _797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _799 = _131 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _801 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _803 = _801 * _797;
        float _805 = floor(_803);
        float _807 = -_805;
        float _809 = _803 + _807;
        _811 = _809;
        _813 = true;
    }
    else
    {
        float _815 = float(_77);
        float _817 = 1.0 / _815;
        float _819 = _111 * _817;
        _811 = _819;
    }
    _813 = false;
    float _821 = _811;
    bool _823 = _821 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _825 = isnan(_821);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _839 = _821 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _841 = isnan(_821);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _851;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _857 = _821 + _855;
    float _859 = -_833;
    float _861 = _859 + 1.0;
    bool _863 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _865 = 1.0 / _837;
    float _867 = _849 * _861;
    float _869 = -_849;
    float _871 = _869 + 1.0;
    float _873 = _853 * _865;
    float _875 = fma(_873, _857, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _877 = _875 * _867;
    float _879 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[115].x, _877);
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _887 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[116].x, _879);
    float _889 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = _887 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_52.x = _889;
    out.m_52.y = _891;
    out.m_52.z = _893;
    out.m_52.w = _895;
    bool _897 = !_863;
    float _913;
    if (!_897)
    {
        float _899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _901 = _131 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _903 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[11].z, _111);
        float _905 = _903 * _899;
        float _907 = floor(_905);
        float _909 = -_907;
        float _911 = _905 + _909;
        _913 = _911;
        _915 = true;
    }
    else
    {
        float _917 = float(_77);
        float _919 = 1.0 / _917;
        float _921 = _111 * _919;
        _913 = _921;
    }
    _915 = false;
    float _923 = _913;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _927 = _923 + _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _929;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _937;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _945 = 1.0 / _931;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _947;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _953 = _951 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _955 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _957 = isnan(_923);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _963 = _959 || _961;
    float _965 = float(_963);
    float _967 = 1.0 / _939;
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _971 = _923 + _969;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _973;
    float _977 = -_965;
    float _979 = _977 + 1.0;
    float _981 = 1.0 / _935;
    float _983 = _971 * _945;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _987 = _923 + _985;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _991 = _923 + _989;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _993;
    float _997 = fma(_975, _983, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _999 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1001 = 1.0 / _949;
    float _1003 = _987 * _967;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1007 = _923 + _1005;
    bool _1009 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1011 = isnan(_923);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1017 = _1013 || _1015;
    float _1019 = float(_1017);
    float _1021 = 1.0 / _953;
    float _1023 = _1007 * _981;
    float _1025 = -_1019;
    float _1027 = _1025 + 1.0;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1031 = _923 + _1029;
    float _1033 = 1.0 / _943;
    bool _1035 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1037 = isnan(_923);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = _927 * _1001;
    float _1049 = _1045 * _1027;
    float _1051 = -_1045;
    float _1053 = _1051 + 1.0;
    float _1055 = _991 * _1021;
    bool _1057 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1059 = isnan(_923);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(_1065);
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1075 = _1073 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1081 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1083 = isnan(_923);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1089 = _1085 || _1087;
    float _1091 = float(_1089);
    float _1093 = _1067 * _1053;
    float _1095 = -_1067;
    float _1097 = _1095 + 1.0;
    float _1099 = _1031 * _1033;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1101;
    float _1105 = fma(_1071, _983, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1107 = _965 * _1097;
    bool _1109 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1111 = isnan(_923);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1117 = _1113 || _1115;
    float _1119 = float(_1117);
    float _1121 = fma(_1103, _983, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1123 = _923 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1125 = isnan(_923);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1131 = _1127 || _1129;
    float _1133 = float(_1131);
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1139 = fma(_1075, _1023, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1141 = -_1119;
    float _1143 = _1141 + 1.0;
    float _1145 = fma(_1079, _1023, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1147 = _1133 * _979;
    float _1149 = fma(_1137, _1023, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1151 = -_1133;
    float _1153 = _1151 + 1.0;
    float _1155 = _1091 * _1143;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1157;
    float _1161 = fma(_995, _1047, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1163 = _1119 * _1153;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1165;
    float _1169 = _1121 * _1155;
    float _1171 = _1105 * _1155;
    float _1173 = _997 * _1155;
    float _1175 = -_1091;
    float _1177 = _1175 + 1.0;
    float _1179 = fma(_1159, _1047, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1181 = fma(_1167, _1047, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1189 = _1187 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1191 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1169);
    float _1193 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1171);
    float _1195 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1173);
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1199 = _1197 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1201 = fma(_1185, _1055, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1203 = fma(_1189, _1055, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1205 = fma(_1149, _1163, _1191);
    float _1207 = fma(_1139, _1163, _1193);
    float _1209 = fma(_1145, _1163, _1195);
    float _1211 = fma(_1199, _1055, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1213 = fma(_1179, _1147, _1205);
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1215;
    float _1219 = fma(_1181, _1147, _1209);
    float _1221 = fma(_1161, _1147, _1207);
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1227;
    float _1231 = fma(_1217, _1003, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1233 = fma(_1203, _1107, _1213);
    float _1235 = fma(_1211, _1107, _1219);
    float _1237 = fma(_1225, _1003, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1239 = fma(_1201, _1107, _1221);
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1243 = _1241 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1249 = fma(_1229, _1003, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1255 = fma(_1231, _1093, _1233);
    float _1257 = fma(_1243, _1099, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1259 = fma(_1247, _1099, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1261 = fma(_1237, _1093, _1239);
    float _1263 = fma(_1253, _1099, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1265 = fma(_1249, _1093, _1235);
    float _1267 = fma(_1257, _1049, _1255);
    float _1269 = fma(_1259, _1049, _1261);
    float _1271 = fma(_1263, _1049, _1265);
    float _1273 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1267);
    float _1275 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1269);
    float _1277 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1271);
    bool _1279 = !_999;
    float _1295;
    if (!_1279)
    {
        float _1281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1283 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1285 = fma(_1283, (*spvDescriptorSet0.vp_c9)._m0[11].w, _111);
        float _1287 = _1285 * _1281;
        float _1289 = floor(_1287);
        float _1291 = -_1289;
        float _1293 = _1287 + _1291;
        _1295 = _1293;
        _1297 = true;
    }
    else
    {
        float _1299 = float(_77);
        float _1301 = 1.0 / _1299;
        float _1303 = _111 * _1301;
        _1295 = _1303;
    }
    _1297 = false;
    float _1305 = _1295;
    float _1307 = in.m_39.w;
    float _1309 = _541 * _155;
    float _1311 = _541 * _139;
    float _1313 = _541 * _161;
    float _1315 = in.m_39.z;
    float _1317 = fma(_539, _153, _1309);
    float _1319 = fma(_539, _137, _1311);
    float _1321 = fma(_539, _159, _1313);
    float _1323 = in.m_39.y;
    float _1325 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1327 = fma(_543, _141, _1319);
    int _1329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1331 = _1329 != 0;
    float _1333 = fma(_543, _157, _1317);
    int _1335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1337 = _1335 != 0;
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1343 = _1341 != 0;
    float _1345 = fma(_543, _163, _1321);
    int _1347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1349 = _1347 != 0;
    float _1351 = -_1339;
    float _1353 = fma(_1325, 2.0, _1351);
    float _1355 = in.m_41.w;
    float _1357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1359 = _1307 > 0.5;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1363 = _1361 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1365 = in.m_43.w;
    bool _1367 = _1315 > 0.5;
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1371 = in.m_45.w;
    float _1373 = 1.0 / _1363;
    float _1375 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1379 = _131 > 0.5;
    float _1381 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1369);
    float _1383 = fma(_1375, -2.0, _1377);
    float _1385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1389 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1381);
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1391;
    float _1395 = -_261;
    int _1397 = _1379 ? as_type<int>(_1395) : as_type<int>(_261);
    float _1399 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1387);
    bool _1401 = _1323 > 0.5;
    float _1403 = -_111;
    float _1405 = fma(_1403, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1353);
    float _1407 = _1393 * _1373;
    float _1409 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1383);
    float _1411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1413 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1399);
    bool _1415 = _1305 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1417 = isnan(_1305);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1423 = _1419 || _1421;
    float _1425 = float(_1423);
    float _1427 = _1333 + _1365;
    bool _1429 = !_1331;
    float _1431 = _1429 ? _261 : as_type<float>(_1397);
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1435 = _1305 + _1433;
    float _1437 = _1327 + _1355;
    bool _1439 = _1305 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1441 = isnan(_1305);
    bool _1443 = _1439 || _1441;
    bool _1445 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1447 = _1443 || _1445;
    float _1449 = float(_1447);
    float _1451 = -_1425;
    float _1453 = _1451 + 1.0;
    float _1455 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1457 = -_273;
    int _1459 = _1401 ? as_type<int>(_1457) : as_type<int>(_273);
    float _1461 = _1431 + 0.5;
    float _1463 = fma(_1407, _1435, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1465 = _1449 * _1453;
    bool _1467 = !_1337;
    float _1469 = _1467 ? _273 : as_type<float>(_1459);
    float _1471 = fma(_1455, _1461, _1405);
    float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1475 = _1437 + _1473;
    float _1477 = _1463 * _1465;
    float _1479 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1481 = _1469 + (-0.5);
    float _1483 = _1345 + _1371;
    float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1487 = _1427 + _1485;
    float _1489 = _1475 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1491 = -_1449;
    float _1493 = _1491 + 1.0;
    float _1495 = -_1479;
    float _1497 = -_1409;
    float _1499 = fma(_1495, _1481, _1497);
    float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1503 = _1483 + _1501;
    float _1505 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1489);
    float _1507 = -_273;
    int _1509 = _1359 ? as_type<int>(_1507) : as_type<int>(_273);
    float _1511 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1477);
    float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1515 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1505);
    bool _1517 = !_1349;
    float _1519 = _1517 ? _273 : as_type<float>(_1509);
    float _1521 = -_1389;
    float _1523 = _1521 + 1.0;
    float _1525 = fma(_1425, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1511);
    float _1527 = _1475 * _1475;
    float _1529 = -_261;
    int _1531 = _1367 ? as_type<int>(_1529) : as_type<int>(_261);
    float _1533 = -_1523;
    float _1535 = fma(_1431, _1533, _1471);
    bool _1537 = _1515 >= 0.0;
    float _1539 = -_1519;
    float _1541 = _1539 + 0.5;
    float _1543 = fma(_1487, _1487, _1527);
    bool _1545 = !_1343;
    float _1547 = _1545 ? _261 : as_type<float>(_1531);
    float _1549 = -_1413;
    float _1551 = _1549 + 1.0;
    float _1553 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1555 = fma(_1503, _1503, _1543);
    float _1557 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1559 = _1547 + 0.5;
    float _1561 = _1553 * _1513;
    float _1563 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1565 = rsqrt(_1555);
    float _1567 = _1559 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1569 = _1277 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1571 = _1541;
    int _1573 = as_type<int>(_1569);
    if (_1537)
    {
        _1571 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1575 = _1571;
    float _1577 = _1557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1579 = fma(_1469, _1551, _1499);
    float _1581 = _1563 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1583 = _1567 * _1357;
    float _1585 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1587 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1537)
    {
        float _1589 = _1575 * 5.0;
        _1573 = as_type<int>(_1589);
    }
    int _1591 = _1573;
    out.m_54.x = _1535;
    out.m_54.y = _1579;
    out.m_54.z = _1583;
    out.m_54.w = _1561;
    out.m_56.x = _1577;
    out.m_56.y = _1581;
    out.m_56.z = _1585;
    out.m_56.w = _1587;
    float _1593 = _1475 * _1565;
    float _1595 = _1487 * _1565;
    if (_1537)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4605 = as_type<float>(_1591);
        out.gl_Position.z = _4605;
    }
    if (_1537)
    {
        out.m_35.x = 0.0;
    }
    if (_1537)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1597 = -_1593;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1437);
    float _1601 = _1503 * _1565;
    float _1603 = -_1595;
    float _1605 = fma(_1603, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1427);
    float _1607 = -_1593;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1475);
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1613 = _1599 + _1611;
    float _1615 = -_1601;
    float _1617 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1483);
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1621 = _1605 + _1619;
    float _1623 = -_1595;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1487);
    float _1627 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1631 = _1617 + _1629;
    float _1633 = _1609 * _1609;
    float _1635 = -_1601;
    float _1637 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1503);
    float _1639 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1627);
    float _1641 = _547 * _791;
    float _1643 = fma(_1625, _1625, _1633);
    float _1645 = _547 * _793;
    float _1647 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1639);
    float _1649 = fma(_1637, _1637, _1643);
    bool _1651 = _1647 >= 0.0;
    float _1653 = sqrt(_1649);
    float _1655 = _1647;
    if (_1651)
    {
        _1655 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1657 = _1655;
    int _1659 = as_type<int>(_1657);
    if (_1651)
    {
        out.m_35.x = 0.0;
    }
    if (_1651)
    {
        float _1661 = _1657 * 5.0;
        _1659 = as_type<int>(_1661);
    }
    int _1663 = _1659;
    float _1665 = _1565 * _1653;
    if (_1651)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4743 = as_type<float>(_1663);
        out.gl_Position.z = _4743;
    }
    if (_1651)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1667 = _1645 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1669 = _1641 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1671 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _273);
    float _1673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _261);
    float _1675 = _1665 * _1667;
    float _1677 = _1665 * _1669;
    float _1679 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1681 = _1679 * 0.5;
    float _1683 = _1671 * _1675;
    float _1685 = _1673 * _1677;
    float _1687 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1689 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1691 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1687);
    float _1693 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1689);
    float _1695 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1691);
    float _1697 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1693);
    float _1699 = _1695 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1701 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1703 = _1427 + _1699;
    float _1705 = _1483 + _1701;
    float _1707 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1711 = _1703 + _1709;
    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1715 = _1705 + _1713;
    float _1717 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1707);
    float _1719 = _1711 * _1711;
    float _1721 = _1715 * _1715;
    float _1723 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1717);
    float _1725 = _1719 + _1721;
    float _1727 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1729 = sqrt(_1725);
    float _1731 = _1437 + _1727;
    bool _1733 = _1729 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1735 = _1727;
    float _1737 = _1707;
    float _1739 = _1681;
    float _1741 = _1683;
    float _1743 = _1721;
    if (!_1733)
    {
        _1735 = _1719;
    }
    float _1745 = _1735;
    float _1747 = _1745;
    if (!_1733)
    {
        _1737 = _1703;
    }
    float _1749 = _1737;
    float _1751 = _1749;
    if (!_1733)
    {
        _1739 = _1705;
    }
    float _1753 = _1739;
    float _1755 = _1753;
    if (!_1733)
    {
        _1741 = _1731;
    }
    float _1757 = _1741;
    bool _1759 = !_1733;
    float _1761 = _1757;
    if (!_1759)
    {
        float _1763 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1767 = _1729 + _1765;
        float _1769 = rsqrt(_1725);
        float _1771 = _1767 * _1763;
        float _1773 = _1731 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1775 = _1771 * 0.15915493667125701904296875;
        float _1777 = _1775 * 6.283185482025146484375;
        float _1779 = sin(_1777);
        float _1781 = _1775 * 6.283185482025146484375;
        float _1783 = cos(_1781);
        float _1785 = fma(_1779, _1773, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1787 = _1769 * _1785;
        float _1789 = _1783 + (-1.0);
        float _1791 = fma(_1711, _1787, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1793 = fma(_1715, _1787, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1795 = _1789 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1799 = _1791 + _1797;
        float _1801 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1803 = _1793 + _1801;
        float _1805 = fma(_1731, _1783, _1795);
        float _1807 = _1799 * _1799;
        float _1809 = _1803 * _1803;
        _1761 = _1805;
        _1747 = _1807;
        _1743 = _1809;
        _1751 = _1791;
        _1755 = _1793;
    }
    float _1811 = _1761;
    float _1813 = _1747;
    float _1815 = _1743;
    float _1817 = _1751;
    float _1819 = _1755;
    float _1821 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1823 = _1811 + _1821;
    float _1825 = fma(_1823, _1823, _1813);
    float _1827 = _1825 + _1815;
    float _1829 = sqrt(_1827);
    bool _1831 = _1829 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1833 = isnan(_1829);
    bool _1835 = _1831 || _1833;
    bool _1837 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1839 = _1835 || _1837;
    float _1841 = _1825;
    if (!_1839)
    {
        _1841 = 1.0;
    }
    float _1843 = _1841;
    bool _1845 = !_1839;
    float _1847 = _1843;
    if (!_1845)
    {
        bool _1849 = _1829 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1851 = isnan(_1829);
        bool _1853 = _1849 || _1851;
        bool _1855 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1857 = _1853 || _1855;
        if (!_1857)
        {
            float _1859 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1861 = _1829 + _1859;
            float _1863 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1865 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1863;
            float _1867 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1869 = _1867 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1871 = 1.0 / _1865;
            float _1873 = _1861 * _1871;
            float _1875 = fma(_1873, _1869, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1847 = _1875;
            _1877 = true;
        }
        else
        {
            bool _1879 = _1829 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1881 = isnan(_1829);
            bool _1883 = _1879 || _1881;
            bool _1885 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1887 = _1883 || _1885;
            if (!_1887)
            {
                float _1889 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1891 = _1829 + _1889;
                float _1893 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1895 = _1893 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1897 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1899 = _1897 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1901 = 1.0 / _1895;
                float _1903 = _1891 * _1901;
                float _1905 = fma(_1903, _1899, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1847 = _1905;
                _1877 = true;
            }
            else
            {
                _1847 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1877 = false;
    float _1907 = _1847;
    float _1909 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1911 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1913 = _1817 + _1911;
    float _1915 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1917 = _1819 + _1915;
    float _1919 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1909);
    bool _1921 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1923 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1925 = _1921 || _1923;
    bool _1927 = isnan(0.5);
    bool _1929 = _1925 || _1927;
    float _1931 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1933 = _1811 + _1931;
    float _1935 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1937 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1919);
    float _1939 = fma(_1913, _1907, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1941 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1935);
    float _1943 = _1937 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1945 = -_1595;
    float _1947 = fma(_1945, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1939);
    float _1949 = fma(_1933, _1907, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1951 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1941);
    float _1953 = 1.0 / _1943;
    float _1955 = fma(_1917, _1907, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1957 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1959 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan(0.5);
    bool _1965 = _1961 || _1963;
    float _1967 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1969 = -_1593;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1949);
    float _1973 = -_1601;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1955);
    float _1977 = _1967 + _1943;
    float _1979 = _1967;
    float _1981 = _1971;
    float _1983 = _1975;
    if (_1929)
    {
        _1979 = _1947;
    }
    float _1985 = _1979;
    float _1987 = _1985;
    if (!_1929)
    {
        float _1989 = _1613 * _1613;
        float _1991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1993 = -_1427;
        float _1995 = _1993 + _1939;
        float _1997 = -_1437;
        float _1999 = _1997 + _1949;
        float _2001 = fma(_1621, _1621, _1989);
        float _2003 = -_1483;
        float _2005 = _2003 + _1955;
        float _2007 = fma(_1631, _1631, _2001);
        float _2009 = 1.0 / _1665;
        float _2011 = sqrt(_2007);
        float _2013 = precise::min(_2011, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2015 = _2013 * _1991;
        float _2017 = _2015 * _2009;
        float _2019 = fma(_1995, _2017, _1605);
        float _2021 = fma(_1999, _2017, _1599);
        float _2023 = fma(_2005, _2017, _1617);
        _1981 = _2021;
        _1987 = _2019;
        _1983 = _2023;
    }
    float _2025 = _1981;
    float _2027 = _1987;
    float _2029 = _1983;
    float _2031 = _2025 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2033 = _1977 * _1953;
    float _2035 = _2033 * 0.5;
    float _2037 = _2025 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2039 = _2025 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2041 = _2025 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2043 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2031);
    float _2045 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2037);
    float _2047 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2039);
    float _2049 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2041);
    float _2051 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2043);
    float _2053 = _2043;
    if (_1965)
    {
        _2053 = 1.0;
    }
    float _2055 = _2053;
    float _2057 = _2055;
    if (!_1965)
    {
        float _2059 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2061 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2059);
        float _2063 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2065 = _2063 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _2067 = 1.0 / _2061;
        float _2069 = 1.0 / _2065;
        float _2071 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2073 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2075 = fma(_2067, _2071, _2073);
        float _2077 = _2075 * _2069;
        float _2079 = precise::clamp(_2077, 0.0, 1.0);
        _2057 = _2079;
    }
    float _2081 = _2057;
    float _2083 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2045);
    float _2085 = _2051 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2087 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2047);
    float _2089 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2049);
    float _2091 = _2083 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2093 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2095 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2097 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2099 = _2087 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2101 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2093);
    float _2103 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2095);
    float _2105 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2107 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2097);
    float _2109 = _2089 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2111 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2101);
    float _2113 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2103);
    float _2115 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2105);
    float _2117 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2107);
    float _2119 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2111);
    float _2121 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2113);
    bool _2123 = _2081 > 0.0;
    bool _2125 = isnan(_2081);
    bool _2127 = _2123 || _2125;
    bool _2129 = isnan(0.0);
    bool _2131 = _2127 || _2129;
    float _2133 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2115);
    float _2135 = _2081 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2137 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2117);
    float _2139 = _2119 + _2121;
    float _2141 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2133);
    float _2143 = _2135 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2145 = _2139 * 0.5;
    out.m_35.x = _2143;
    out.gl_Position.x = _2137;
    out.gl_Position.y = _2141;
    out.gl_Position.z = _2119;
    out.gl_Position.w = _2121;
    out.m_58.z = _2145;
    out.m_58.w = _2121;
    if (_2131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _2147 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2147;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

