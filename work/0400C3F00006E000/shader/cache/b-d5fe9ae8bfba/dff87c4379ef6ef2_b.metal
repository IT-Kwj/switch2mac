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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_40 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _567 = false;
    bool _405 = false;
    bool _165 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _79 = 0;
    if (!_73)
    {
        float _81 = _77 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1292 = as_type<float>(_83);
        out.gl_Position.z = _1292;
    }
    if (!_73)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _87 = in.m_35.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _103 = 0.0;
    if (_97)
    {
        float _105 = float(_69);
        _103 = _105;
    }
    float _107 = _103;
    bool _109 = _101 >= _107;
    bool _111 = !_97;
    bool _113 = _109 || _111;
    float _115 = 0.0;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _85 = as_type<int>(_119);
    }
    int _121 = _85;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1360 = as_type<float>(_121);
        out.gl_Position.z = _1360;
    }
    if (_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    bool _125 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _127 = as_type<int>(_123) & 1;
    bool _129 = _127 != 0;
    int _131 = as_type<int>(_123) & 2;
    bool _133 = _131 != 0;
    bool _135 = !_129;
    float _137 = _135 ? (-0.5) : 0.5;
    bool _139 = !_133;
    float _141 = _139 ? (-0.5) : 0.5;
    bool _143 = !_125;
    float _145 = 0.5;
    float _163;
    if (!_143)
    {
        float _147 = in.m_40.x;
        float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _151 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _153 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _155 = _153 * _149;
        float _157 = floor(_155);
        float _159 = -_157;
        float _161 = _155 + _159;
        _163 = _161;
        _165 = true;
    }
    else
    {
        float _167 = float(_69);
        float _169 = 1.0 / _167;
        float _171 = _101 * _169;
        _163 = _171;
    }
    _165 = false;
    float _173 = _163;
    float _175 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _177 = _173 + _175;
    float _179 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _181 = _173 + _179;
    float _183 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _185 = _173 + _183;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _187;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _193 = _191 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _195;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _201 = _199 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _203 = 1.0 / _189;
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _207 = 1.0 / _197;
    float _209 = 1.0 / _193;
    float _211 = _185 * _203;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _215 = _173 + _213;
    float _217 = 1.0 / _201;
    float _219 = _177 * _207;
    bool _221 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _223 = isnan(_173);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -_231;
    float _235 = _233 + 1.0;
    float _237 = _181 * _209;
    bool _239 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _241 = isnan(_173);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    bool _251 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _253 = isnan(_173);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -_249;
    float _265 = _263 + 1.0;
    float _267 = _249 * _235;
    bool _269 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _271 = isnan(_173);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = _215 * _217;
    float _283 = _261 * _265;
    float _285 = -_261;
    float _287 = _285 + 1.0;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _289;
    bool _293 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _295 = isnan(_173);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _309 = _279 * _287;
    float _311 = -_279;
    float _313 = _311 + 1.0;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = fma(_291, _211, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _325 = _303 * _313;
    float _327 = fma(_317, _211, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _329 = -_303;
    float _331 = _329 + 1.0;
    float _333 = fma(_307, _237, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _335 = _319 * _325;
    float _337 = _327 * _325;
    float _339 = fma(_323, _237, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _345;
    float _349 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[143].x, _335);
    float _351 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[143].y, _337);
    float _353 = fma(_343, _219, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _355 = fma(_347, _219, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _365 = fma(_333, _309, _349);
    float _367 = fma(_339, _309, _351);
    float _369 = fma(_359, _281, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _371 = fma(_363, _281, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _373 = fma(_353, _283, _365);
    float _375 = fma(_355, _283, _367);
    float _377 = fma(_369, _267, _373);
    float _379 = fma(_371, _267, _375);
    float _381 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[147].x, _377);
    float _383 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[147].y, _379);
    bool _385 = !_205;
    float _403;
    if (!_385)
    {
        float _387 = in.m_40.x;
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _401;
        _405 = true;
    }
    else
    {
        float _407 = float(_69);
        float _409 = 1.0 / _407;
        float _411 = _101 * _409;
        _403 = _411;
    }
    _405 = false;
    float _413 = _403;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _417 = _413 + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _423 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _425 = isnan(_413);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _439 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _441 = isnan(_413);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _451;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _457 = 1.0 / _421;
    float _459 = -_433;
    float _461 = _459 + 1.0;
    float _463 = 1.0 / _437;
    float _465 = _453 * _457;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _471 = _449 * _461;
    float _473 = -_449;
    float _475 = _473 + 1.0;
    float _477 = fma(_465, _417, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _479 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _481 = isnan(_413);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = _469 * _463;
    float _493 = _477 * _471;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _497 = _413 + _495;
    float _499 = -_489;
    float _501 = _499 + 1.0;
    float _503 = in.m_40.x;
    float _505 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[115].x, _493);
    float _507 = fma(_491, _497, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _509 = _433 * _501;
    float _511 = fma(_507, _509, _505);
    float _513 = in.m_42.x;
    float _515 = in.m_42.y;
    float _517 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _519 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[117].x, _511);
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _527 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _529 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _531 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_44.x = _531;
    out.m_44.y = _529;
    out.m_44.z = _533;
    out.m_44.w = _527;
    float _535 = _517 * _503;
    float _537 = trunc(_535);
    int _539 = int(_537);
    float _541 = _383 * _515;
    float _543 = _381 * _513;
    int _545 = _539 << 4;
    int _547 = _545 + 1968;
    bool _549 = !_455;
    float _565;
    if (!_549)
    {
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _553 = _503 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[11].w, _101);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _563;
        _567 = true;
    }
    else
    {
        float _569 = float(_69);
        float _571 = 1.0 / _569;
        float _573 = _101 * _571;
        _565 = _573;
    }
    _567 = false;
    float _575 = _565;
    float _577 = in.m_40.z;
    float _579 = _503 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _581 = in.m_40.w;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _589 = _587 != 0;
    float _591 = in.m_40.y;
    int _593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _595 = _593 != 0;
    float _597 = 1.0 / _585;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _601 = _599 != 0;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _607 = _605 != 0;
    float _609 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[78].z, _603);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _613 = _575 + _611;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _617 = _503 > 0.5;
    float _619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _621 = -_615;
    float _623 = fma(_579, 2.0, _621);
    bool _625 = _577 > 0.5;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _629;
    bool _633 = _581 > 0.5;
    float _635 = -_101;
    float _637 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[76].x, _623);
    float _639 = in.m_30.x;
    float _641 = in.m_30.y;
    float _643 = in.m_30.z;
    float _645 = -_137;
    int _647 = _617 ? as_type<int>(_645) : as_type<int>(_137);
    float _649 = _591 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _651 = _591 > 0.5;
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _655 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _609);
    float _657 = fma(_649, -2.0, _627);
    float _659 = _631 * _597;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _663 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _665 = isnan(_575);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    uint _676 = uint(int(uint(_547) >> uint(2)));
    uint _678 = uint(int(uint(int(_676)) >> uint(2)));
    int _680 = int(_676) & 3;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[int(_678)][_680];
    int _684 = int(_676) + 1;
    uint _686 = uint(int(uint(_684) >> uint(2)));
    int _688 = _684 & 3;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[int(_686)][_688];
    float _692 = fma(_659, _613, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _694 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[78].w, _661);
    bool _696 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _698 = isnan(_575);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = -_673;
    float _710 = _708 + 1.0;
    float _712 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _657);
    float _714 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _694);
    float _716 = -_137;
    int _718 = _625 ? as_type<int>(_716) : as_type<int>(_137);
    float _720 = _653 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _722 = _641 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _724 = _641 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _726 = _641 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _728 = _706 * _710;
    float _730 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[4].x, _722);
    float _732 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[5].x, _724);
    float _734 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[6].x, _726);
    float _736 = _692 * _728;
    float _738 = fma(_643, (*spvDescriptorSet0.vp_c10)._m0[4].z, _730);
    float _740 = fma(_643, (*spvDescriptorSet0.vp_c10)._m0[5].z, _732);
    float _742 = fma(_643, (*spvDescriptorSet0.vp_c10)._m0[6].z, _734);
    float _744 = -_706;
    float _746 = _744 + 1.0;
    int _748 = _547 + 8;
    uint _750 = uint(int(uint(_748) >> uint(2)));
    uint _752 = uint(int(uint(int(_750)) >> uint(2)));
    int _754 = int(_750) & 3;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[int(_752)][_754];
    bool _758 = !_589;
    float _760 = _758 ? _137 : as_type<float>(_647);
    float _762 = _738 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _764 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[131].x, _736);
    float _766 = _740 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _768 = _619 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _770 = -_141;
    int _772 = _651 ? as_type<int>(_770) : as_type<int>(_141);
    float _774 = _760 + 0.5;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _778 = _766 + _776;
    float _780 = _742 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _782 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _784 = _762 + _782;
    bool _786 = !_595;
    float _788 = _786 ? _141 : as_type<float>(_772);
    float _790 = _778 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _792 = fma(_768, _774, _637);
    float _794 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _796 = _780 + _794;
    float _798 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[132].x, _764);
    float _800 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[28].x, _790);
    bool _802 = !_601;
    float _804 = _802 ? _137 : as_type<float>(_718);
    float _806 = -_655;
    float _808 = _806 + 1.0;
    float _810 = _778 * _778;
    float _812 = _788 + (-0.5);
    float _814 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[28].z, _800);
    float _816 = -_808;
    float _818 = fma(_760, _816, _792);
    float _820 = fma(_784, _784, _810);
    float _822 = _682 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _826 = -_720;
    float _828 = -_712;
    float _830 = fma(_826, _812, _828);
    bool _832 = _814 >= 0.0;
    float _834 = fma(_796, _796, _820);
    float _836 = -_141;
    int _838 = _633 ? as_type<int>(_836) : as_type<int>(_141);
    float _840 = _690 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _842 = _804 + 0.5;
    float _844 = -_714;
    float _846 = _844 + 1.0;
    float _848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _850 = !_607;
    float _852 = _850 ? _141 : as_type<float>(_838);
    float _854 = _842 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _856 = fma(_788, _846, _830);
    float _858 = _543 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _860 = _822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _862 = -_852;
    float _864 = _862 + 0.5;
    float _866 = _830;
    if (_832)
    {
        _866 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _868 = _866;
    float _870 = rsqrt(_834);
    float _872 = _840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = _864 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _876 = _854 * _824;
    float _878 = _858 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _880 = _798 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _882 = _876;
    if (_832)
    {
        out.m_33.x = 0.0;
    }
    float _884 = _756 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _886 = _874 * _848;
    float _888 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _890 = as_type<int>(_884);
    if (_832)
    {
        float _892 = _868 * 5.0;
        _890 = as_type<int>(_892);
    }
    int _894 = _890;
    out.m_46.x = _818;
    out.m_46.y = _856;
    out.m_46.z = _876;
    out.m_46.w = _886;
    float _896 = _878 * _870;
    out.m_48.x = _860;
    out.m_48.y = _872;
    out.m_48.z = _888;
    out.m_48.w = _880;
    float _898 = _784 * _896;
    if (_832)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2662 = as_type<float>(_894);
        out.gl_Position.z = _2662;
    }
    float _900 = _778 * _896;
    if (_832)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _902 = -_900;
    float _904 = _766 + _902;
    float _906 = _796 * _896;
    float _908 = -_898;
    float _910 = _762 + _908;
    float _912 = -_900;
    float _914 = _778 + _912;
    float _916 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _918 = _904 + _916;
    float _920 = -_906;
    float _922 = _780 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _926 = _910 + _924;
    float _928 = -_898;
    float _930 = _784 + _928;
    float _932 = _918 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _936 = _922 + _934;
    float _938 = _914 * _914;
    float _940 = -_906;
    float _942 = _796 + _940;
    float _944 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[28].x, _932);
    float _946 = fma(_930, _930, _938);
    float _948 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[28].z, _944);
    float _950 = fma(_942, _942, _946);
    bool _952 = _948 >= 0.0;
    float _954 = sqrt(_950);
    if (_952)
    {
        _882 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _956 = _882;
    int _958 = as_type<int>(_956);
    if (_952)
    {
        out.m_33.x = 0.0;
    }
    if (_952)
    {
        float _960 = _956 * 5.0;
        _958 = as_type<int>(_960);
    }
    int _962 = _958;
    float _964 = _870 * _954;
    if (_952)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2779 = as_type<float>(_962);
        out.gl_Position.z = _2779;
    }
    if (_952)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _966 = _541 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _968 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _141);
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _137);
    float _972 = _858 * _964;
    float _974 = _964 * _966;
    float _976 = _964 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _978 = _976 * 0.5;
    float _980 = _970 * _972;
    float _982 = _968 * _974;
    bool _984 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _986 = isnan(0.5);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _992 = _988 || _990;
    float _994 = _982 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _996 = _982 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _998 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[26].x, _994);
    float _1000 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[24].x, _996);
    float _1002 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[26].z, _998);
    float _1004 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1000);
    float _1006 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1008 = _1004 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1010 = _780 + _1006;
    float _1012 = _762 + _1008;
    float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1016 = _1010 + _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1020 = _1012 + _1018;
    float _1022 = _1016 * _1016;
    float _1024 = fma(_1020, _1020, _1022);
    float _1026 = _982 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1028 = sqrt(_1024);
    float _1030 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1026);
    float _1032 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1030);
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1036 = _766 + _1034;
    bool _1038 = _1028 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1040 = _1026;
    float _1042 = _1012;
    if (!_1038)
    {
        _1040 = _1012;
    }
    float _1044 = _1040;
    float _1046 = _1044;
    if (!_1038)
    {
        _145 = _1010;
    }
    float _1048 = _145;
    float _1050 = _1048;
    if (!_1038)
    {
        _1042 = _1036;
    }
    float _1052 = _1042;
    bool _1054 = !_1038;
    float _1056 = _1052;
    if (!_1054)
    {
        float _1058 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1060 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1062 = _1028 + _1060;
        float _1064 = _1036 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1066 = rsqrt(_1024);
        float _1068 = _1062 * _1058;
        float _1070 = _1068 * 0.15915493667125701904296875;
        float _1072 = _1070 * 6.283185482025146484375;
        float _1074 = sin(_1072);
        float _1076 = _1070 * 6.283185482025146484375;
        float _1078 = cos(_1076);
        float _1080 = fma(_1074, _1064, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1082 = _1066 * _1080;
        float _1084 = _1078 + (-1.0);
        float _1086 = fma(_1020, _1082, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1088 = fma(_1016, _1082, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1090 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1092 = fma(_1036, _1078, _1090);
        _1046 = _1086;
        _1056 = _1092;
        _1050 = _1088;
    }
    float _1094 = _1046;
    float _1096 = _1056;
    float _1098 = _1050;
    float _1100 = -_898;
    float _1102 = _1100 + _1094;
    float _1104 = -_900;
    float _1106 = _1104 + _1096;
    float _1108 = -_906;
    float _1110 = _1108 + _1098;
    float _1112 = _1106;
    float _1114 = _1102;
    float _1116 = _1110;
    if (!_992)
    {
        float _1118 = _918 * _918;
        float _1120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1122 = -_780;
        float _1124 = _1122 + _1098;
        float _1126 = -_762;
        float _1128 = _1126 + _1094;
        float _1130 = fma(_926, _926, _1118);
        float _1132 = -_766;
        float _1134 = _1132 + _1096;
        float _1136 = fma(_936, _936, _1130);
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1140 = sqrt(_1136);
        float _1142 = 1.0 / _964;
        float _1144 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1146 = precise::min(_1140, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1148 = _1146 * _1120;
        float _1150 = _1148 * _1142;
        float _1152 = _1144 * _1150;
        float _1154 = _1124 * _1150;
        float _1156 = fma(_1128, _1152, _910);
        float _1158 = fma(_1134, _1152, _904);
        float _1160 = fma(_1144, _1154, _922);
        _1112 = _1158;
        _1114 = _1156;
        _1116 = _1160;
    }
    float _1162 = _1112;
    float _1164 = _1114;
    float _1166 = _1116;
    float _1168 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1170 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1172 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1174 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1176 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1168);
    float _1178 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1170);
    float _1180 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1172);
    float _1182 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1174);
    float _1184 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1176);
    float _1186 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1178);
    float _1188 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1180);
    float _1190 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1182);
    float _1192 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1194 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1196 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1198 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1200 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1202 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1204 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1206 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1208 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1200);
    float _1210 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1202);
    float _1212 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1204);
    float _1214 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1206);
    float _1216 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1208);
    float _1218 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1210);
    float _1220 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1212);
    float _1222 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1214);
    float _1224 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1216);
    float _1226 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1218);
    float _1228 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1220);
    float _1230 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1222);
    float _1232 = _1224 + _1226;
    float _1234 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1236 = _1232 * 0.5;
    out.m_33.x = _1234;
    out.gl_Position.x = _1228;
    out.gl_Position.y = _1230;
    out.gl_Position.z = _1224;
    out.gl_Position.w = _1226;
    out.m_50.z = _1236;
    out.m_50.w = _1226;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _567 = false;
    bool _405 = false;
    bool _165 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _79 = 0;
    if (!_73)
    {
        float _81 = _77 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1292 = as_type<float>(_83);
        out.gl_Position.z = _1292;
    }
    if (!_73)
    {
        return out;
    }
    float _87 = in.m_35.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _103 = 0.0;
    if (_97)
    {
        float _105 = float(_69);
        _103 = _105;
    }
    float _107 = _103;
    bool _109 = _101 >= _107;
    bool _111 = !_97;
    bool _113 = _109 || _111;
    float _115 = 0.0;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _85 = as_type<int>(_119);
    }
    int _121 = _85;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1360 = as_type<float>(_121);
        out.gl_Position.z = _1360;
    }
    if (_113)
    {
        return out;
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    bool _125 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _127 = as_type<int>(_123) & 1;
    bool _129 = _127 != 0;
    int _131 = as_type<int>(_123) & 2;
    bool _133 = _131 != 0;
    bool _135 = !_129;
    float _137 = _135 ? (-0.5) : 0.5;
    bool _139 = !_133;
    float _141 = _139 ? (-0.5) : 0.5;
    bool _143 = !_125;
    float _145 = 0.5;
    float _163;
    if (!_143)
    {
        float _147 = in.m_40.x;
        float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _151 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _153 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _155 = _153 * _149;
        float _157 = floor(_155);
        float _159 = -_157;
        float _161 = _155 + _159;
        _163 = _161;
        _165 = true;
    }
    else
    {
        float _167 = float(_69);
        float _169 = 1.0 / _167;
        float _171 = _101 * _169;
        _163 = _171;
    }
    _165 = false;
    float _173 = _163;
    float _175 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _177 = _173 + _175;
    float _179 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _181 = _173 + _179;
    float _183 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _185 = _173 + _183;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _187;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _193 = _191 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _195;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _201 = _199 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _203 = 1.0 / _189;
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _207 = 1.0 / _197;
    float _209 = 1.0 / _193;
    float _211 = _185 * _203;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _215 = _173 + _213;
    float _217 = 1.0 / _201;
    float _219 = _177 * _207;
    bool _221 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _223 = isnan(_173);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -_231;
    float _235 = _233 + 1.0;
    float _237 = _181 * _209;
    bool _239 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _241 = isnan(_173);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    bool _251 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _253 = isnan(_173);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -_249;
    float _265 = _263 + 1.0;
    float _267 = _249 * _235;
    bool _269 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _271 = isnan(_173);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = _215 * _217;
    float _283 = _261 * _265;
    float _285 = -_261;
    float _287 = _285 + 1.0;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _289;
    bool _293 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _295 = isnan(_173);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _309 = _279 * _287;
    float _311 = -_279;
    float _313 = _311 + 1.0;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = fma(_291, _211, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _325 = _303 * _313;
    float _327 = fma(_317, _211, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _329 = -_303;
    float _331 = _329 + 1.0;
    float _333 = fma(_307, _237, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _335 = _319 * _325;
    float _337 = _327 * _325;
    float _339 = fma(_323, _237, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _345;
    float _349 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[143].x, _335);
    float _351 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[143].y, _337);
    float _353 = fma(_343, _219, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _355 = fma(_347, _219, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _365 = fma(_333, _309, _349);
    float _367 = fma(_339, _309, _351);
    float _369 = fma(_359, _281, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _371 = fma(_363, _281, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _373 = fma(_353, _283, _365);
    float _375 = fma(_355, _283, _367);
    float _377 = fma(_369, _267, _373);
    float _379 = fma(_371, _267, _375);
    float _381 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[147].x, _377);
    float _383 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[147].y, _379);
    bool _385 = !_205;
    float _403;
    if (!_385)
    {
        float _387 = in.m_40.x;
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _401;
        _405 = true;
    }
    else
    {
        float _407 = float(_69);
        float _409 = 1.0 / _407;
        float _411 = _101 * _409;
        _403 = _411;
    }
    _405 = false;
    float _413 = _403;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _417 = _413 + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _423 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _425 = isnan(_413);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _439 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _441 = isnan(_413);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _451;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _457 = 1.0 / _421;
    float _459 = -_433;
    float _461 = _459 + 1.0;
    float _463 = 1.0 / _437;
    float _465 = _453 * _457;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _471 = _449 * _461;
    float _473 = -_449;
    float _475 = _473 + 1.0;
    float _477 = fma(_465, _417, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _479 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _481 = isnan(_413);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = _469 * _463;
    float _493 = _477 * _471;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _497 = _413 + _495;
    float _499 = -_489;
    float _501 = _499 + 1.0;
    float _503 = in.m_40.x;
    float _505 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[115].x, _493);
    float _507 = fma(_491, _497, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _509 = _433 * _501;
    float _511 = fma(_507, _509, _505);
    float _513 = in.m_42.x;
    float _515 = in.m_42.y;
    float _517 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _519 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[117].x, _511);
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _527 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _529 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _531 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_44.x = _531;
    out.m_44.y = _529;
    out.m_44.z = _533;
    out.m_44.w = _527;
    float _535 = _517 * _503;
    float _537 = trunc(_535);
    int _539 = int(_537);
    float _541 = _383 * _515;
    float _543 = _381 * _513;
    int _545 = _539 << 4;
    int _547 = _545 + 1968;
    bool _549 = !_455;
    float _565;
    if (!_549)
    {
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _553 = _503 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[11].w, _101);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _563;
        _567 = true;
    }
    else
    {
        float _569 = float(_69);
        float _571 = 1.0 / _569;
        float _573 = _101 * _571;
        _565 = _573;
    }
    _567 = false;
    float _575 = _565;
    float _577 = in.m_40.z;
    float _579 = _503 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _581 = in.m_40.w;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _589 = _587 != 0;
    float _591 = in.m_40.y;
    int _593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _595 = _593 != 0;
    float _597 = 1.0 / _585;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _601 = _599 != 0;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _607 = _605 != 0;
    float _609 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[78].z, _603);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _613 = _575 + _611;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _617 = _503 > 0.5;
    float _619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _621 = -_615;
    float _623 = fma(_579, 2.0, _621);
    bool _625 = _577 > 0.5;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _629;
    bool _633 = _581 > 0.5;
    float _635 = -_101;
    float _637 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[76].x, _623);
    float _639 = in.m_30.x;
    float _641 = in.m_30.y;
    float _643 = in.m_30.z;
    float _645 = -_137;
    int _647 = _617 ? as_type<int>(_645) : as_type<int>(_137);
    float _649 = _591 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _651 = _591 > 0.5;
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _655 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _609);
    float _657 = fma(_649, -2.0, _627);
    float _659 = _631 * _597;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _663 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _665 = isnan(_575);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    uint _676 = uint(int(uint(_547) >> uint(2)));
    uint _678 = uint(int(uint(int(_676)) >> uint(2)));
    int _680 = int(_676) & 3;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[int(_678)][_680];
    int _684 = int(_676) + 1;
    uint _686 = uint(int(uint(_684) >> uint(2)));
    int _688 = _684 & 3;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[int(_686)][_688];
    float _692 = fma(_659, _613, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _694 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[78].w, _661);
    bool _696 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _698 = isnan(_575);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = -_673;
    float _710 = _708 + 1.0;
    float _712 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _657);
    float _714 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _694);
    float _716 = -_137;
    int _718 = _625 ? as_type<int>(_716) : as_type<int>(_137);
    float _720 = _653 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _722 = _641 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _724 = _641 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _726 = _641 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _728 = _706 * _710;
    float _730 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[4].x, _722);
    float _732 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[5].x, _724);
    float _734 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[6].x, _726);
    float _736 = _692 * _728;
    float _738 = fma(_643, (*spvDescriptorSet0.vp_c10)._m0[4].z, _730);
    float _740 = fma(_643, (*spvDescriptorSet0.vp_c10)._m0[5].z, _732);
    float _742 = fma(_643, (*spvDescriptorSet0.vp_c10)._m0[6].z, _734);
    float _744 = -_706;
    float _746 = _744 + 1.0;
    int _748 = _547 + 8;
    uint _750 = uint(int(uint(_748) >> uint(2)));
    uint _752 = uint(int(uint(int(_750)) >> uint(2)));
    int _754 = int(_750) & 3;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[int(_752)][_754];
    bool _758 = !_589;
    float _760 = _758 ? _137 : as_type<float>(_647);
    float _762 = _738 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _764 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[131].x, _736);
    float _766 = _740 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _768 = _619 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _770 = -_141;
    int _772 = _651 ? as_type<int>(_770) : as_type<int>(_141);
    float _774 = _760 + 0.5;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _778 = _766 + _776;
    float _780 = _742 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _782 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _784 = _762 + _782;
    bool _786 = !_595;
    float _788 = _786 ? _141 : as_type<float>(_772);
    float _790 = _778 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _792 = fma(_768, _774, _637);
    float _794 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _796 = _780 + _794;
    float _798 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[132].x, _764);
    float _800 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[28].x, _790);
    bool _802 = !_601;
    float _804 = _802 ? _137 : as_type<float>(_718);
    float _806 = -_655;
    float _808 = _806 + 1.0;
    float _810 = _778 * _778;
    float _812 = _788 + (-0.5);
    float _814 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[28].z, _800);
    float _816 = -_808;
    float _818 = fma(_760, _816, _792);
    float _820 = fma(_784, _784, _810);
    float _822 = _682 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _826 = -_720;
    float _828 = -_712;
    float _830 = fma(_826, _812, _828);
    bool _832 = _814 >= 0.0;
    float _834 = fma(_796, _796, _820);
    float _836 = -_141;
    int _838 = _633 ? as_type<int>(_836) : as_type<int>(_141);
    float _840 = _690 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _842 = _804 + 0.5;
    float _844 = -_714;
    float _846 = _844 + 1.0;
    float _848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _850 = !_607;
    float _852 = _850 ? _141 : as_type<float>(_838);
    float _854 = _842 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _856 = fma(_788, _846, _830);
    float _858 = _543 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _860 = _822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _862 = -_852;
    float _864 = _862 + 0.5;
    float _866 = _830;
    if (_832)
    {
        _866 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _868 = _866;
    float _870 = rsqrt(_834);
    float _872 = _840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = _864 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _876 = _854 * _824;
    float _878 = _858 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _880 = _798 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _882 = _876;
    if (_832)
    {
        out.m_33.x = 0.0;
    }
    float _884 = _756 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _886 = _874 * _848;
    float _888 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _890 = as_type<int>(_884);
    if (_832)
    {
        float _892 = _868 * 5.0;
        _890 = as_type<int>(_892);
    }
    int _894 = _890;
    out.m_46.x = _818;
    out.m_46.y = _856;
    out.m_46.z = _876;
    out.m_46.w = _886;
    float _896 = _878 * _870;
    out.m_48.x = _860;
    out.m_48.y = _872;
    out.m_48.z = _888;
    out.m_48.w = _880;
    float _898 = _784 * _896;
    if (_832)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2662 = as_type<float>(_894);
        out.gl_Position.z = _2662;
    }
    float _900 = _778 * _896;
    if (_832)
    {
        return out;
    }
    float _902 = -_900;
    float _904 = _766 + _902;
    float _906 = _796 * _896;
    float _908 = -_898;
    float _910 = _762 + _908;
    float _912 = -_900;
    float _914 = _778 + _912;
    float _916 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _918 = _904 + _916;
    float _920 = -_906;
    float _922 = _780 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _926 = _910 + _924;
    float _928 = -_898;
    float _930 = _784 + _928;
    float _932 = _918 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _936 = _922 + _934;
    float _938 = _914 * _914;
    float _940 = -_906;
    float _942 = _796 + _940;
    float _944 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[28].x, _932);
    float _946 = fma(_930, _930, _938);
    float _948 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[28].z, _944);
    float _950 = fma(_942, _942, _946);
    bool _952 = _948 >= 0.0;
    float _954 = sqrt(_950);
    if (_952)
    {
        _882 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _956 = _882;
    int _958 = as_type<int>(_956);
    if (_952)
    {
        out.m_33.x = 0.0;
    }
    if (_952)
    {
        float _960 = _956 * 5.0;
        _958 = as_type<int>(_960);
    }
    int _962 = _958;
    float _964 = _870 * _954;
    if (_952)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2779 = as_type<float>(_962);
        out.gl_Position.z = _2779;
    }
    if (_952)
    {
        return out;
    }
    float _966 = _541 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _968 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _141);
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _137);
    float _972 = _858 * _964;
    float _974 = _964 * _966;
    float _976 = _964 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _978 = _976 * 0.5;
    float _980 = _970 * _972;
    float _982 = _968 * _974;
    bool _984 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _986 = isnan(0.5);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _992 = _988 || _990;
    float _994 = _982 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _996 = _982 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _998 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[26].x, _994);
    float _1000 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[24].x, _996);
    float _1002 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[26].z, _998);
    float _1004 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1000);
    float _1006 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1008 = _1004 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1010 = _780 + _1006;
    float _1012 = _762 + _1008;
    float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1016 = _1010 + _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1020 = _1012 + _1018;
    float _1022 = _1016 * _1016;
    float _1024 = fma(_1020, _1020, _1022);
    float _1026 = _982 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1028 = sqrt(_1024);
    float _1030 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1026);
    float _1032 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1030);
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1036 = _766 + _1034;
    bool _1038 = _1028 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1040 = _1026;
    float _1042 = _1012;
    if (!_1038)
    {
        _1040 = _1012;
    }
    float _1044 = _1040;
    float _1046 = _1044;
    if (!_1038)
    {
        _145 = _1010;
    }
    float _1048 = _145;
    float _1050 = _1048;
    if (!_1038)
    {
        _1042 = _1036;
    }
    float _1052 = _1042;
    bool _1054 = !_1038;
    float _1056 = _1052;
    if (!_1054)
    {
        float _1058 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1060 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1062 = _1028 + _1060;
        float _1064 = _1036 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1066 = rsqrt(_1024);
        float _1068 = _1062 * _1058;
        float _1070 = _1068 * 0.15915493667125701904296875;
        float _1072 = _1070 * 6.283185482025146484375;
        float _1074 = sin(_1072);
        float _1076 = _1070 * 6.283185482025146484375;
        float _1078 = cos(_1076);
        float _1080 = fma(_1074, _1064, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1082 = _1066 * _1080;
        float _1084 = _1078 + (-1.0);
        float _1086 = fma(_1020, _1082, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1088 = fma(_1016, _1082, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1090 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1092 = fma(_1036, _1078, _1090);
        _1046 = _1086;
        _1056 = _1092;
        _1050 = _1088;
    }
    float _1094 = _1046;
    float _1096 = _1056;
    float _1098 = _1050;
    float _1100 = -_898;
    float _1102 = _1100 + _1094;
    float _1104 = -_900;
    float _1106 = _1104 + _1096;
    float _1108 = -_906;
    float _1110 = _1108 + _1098;
    float _1112 = _1106;
    float _1114 = _1102;
    float _1116 = _1110;
    if (!_992)
    {
        float _1118 = _918 * _918;
        float _1120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1122 = -_780;
        float _1124 = _1122 + _1098;
        float _1126 = -_762;
        float _1128 = _1126 + _1094;
        float _1130 = fma(_926, _926, _1118);
        float _1132 = -_766;
        float _1134 = _1132 + _1096;
        float _1136 = fma(_936, _936, _1130);
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1140 = sqrt(_1136);
        float _1142 = 1.0 / _964;
        float _1144 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1146 = precise::min(_1140, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1148 = _1146 * _1120;
        float _1150 = _1148 * _1142;
        float _1152 = _1144 * _1150;
        float _1154 = _1124 * _1150;
        float _1156 = fma(_1128, _1152, _910);
        float _1158 = fma(_1134, _1152, _904);
        float _1160 = fma(_1144, _1154, _922);
        _1112 = _1158;
        _1114 = _1156;
        _1116 = _1160;
    }
    float _1162 = _1112;
    float _1164 = _1114;
    float _1166 = _1116;
    float _1168 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1170 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1172 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1174 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1176 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1168);
    float _1178 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1170);
    float _1180 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1172);
    float _1182 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1174);
    float _1184 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1176);
    float _1186 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1178);
    float _1188 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1180);
    float _1190 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1182);
    float _1192 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1194 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1196 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1198 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1200 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1202 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1204 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1206 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1208 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1200);
    float _1210 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1202);
    float _1212 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1204);
    float _1214 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1206);
    float _1216 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1208);
    float _1218 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1210);
    float _1220 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1212);
    float _1222 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1214);
    float _1224 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1216);
    float _1226 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1218);
    float _1228 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1220);
    float _1230 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1222);
    float _1232 = _1224 + _1226;
    float _1234 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1236 = _1232 * 0.5;
    out.m_33.x = _1234;
    out.gl_Position.x = _1228;
    out.gl_Position.y = _1230;
    out.gl_Position.z = _1224;
    out.gl_Position.w = _1226;
    out.m_50.z = _1236;
    out.m_50.w = _1226;
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _567 = false;
    bool _405 = false;
    bool _165 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _79 = 0;
    if (!_73)
    {
        float _81 = _77 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1292 = as_type<float>(_83);
        out.gl_Position.z = _1292;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _87 = in.m_35.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _103 = 0.0;
    if (_97)
    {
        float _105 = float(_69);
        _103 = _105;
    }
    float _107 = _103;
    bool _109 = _101 >= _107;
    bool _111 = !_97;
    bool _113 = _109 || _111;
    float _115 = 0.0;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _85 = as_type<int>(_119);
    }
    int _121 = _85;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1360 = as_type<float>(_121);
        out.gl_Position.z = _1360;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    bool _125 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _127 = as_type<int>(_123) & 1;
    bool _129 = _127 != 0;
    int _131 = as_type<int>(_123) & 2;
    bool _133 = _131 != 0;
    bool _135 = !_129;
    float _137 = _135 ? (-0.5) : 0.5;
    bool _139 = !_133;
    float _141 = _139 ? (-0.5) : 0.5;
    bool _143 = !_125;
    float _145 = 0.5;
    float _163;
    if (!_143)
    {
        float _147 = in.m_40.x;
        float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _151 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _153 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _155 = _153 * _149;
        float _157 = floor(_155);
        float _159 = -_157;
        float _161 = _155 + _159;
        _163 = _161;
        _165 = true;
    }
    else
    {
        float _167 = float(_69);
        float _169 = 1.0 / _167;
        float _171 = _101 * _169;
        _163 = _171;
    }
    _165 = false;
    float _173 = _163;
    float _175 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _177 = _173 + _175;
    float _179 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _181 = _173 + _179;
    float _183 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _185 = _173 + _183;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _187;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _193 = _191 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _195;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _201 = _199 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _203 = 1.0 / _189;
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _207 = 1.0 / _197;
    float _209 = 1.0 / _193;
    float _211 = _185 * _203;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _215 = _173 + _213;
    float _217 = 1.0 / _201;
    float _219 = _177 * _207;
    bool _221 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _223 = isnan(_173);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -_231;
    float _235 = _233 + 1.0;
    float _237 = _181 * _209;
    bool _239 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _241 = isnan(_173);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    bool _251 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _253 = isnan(_173);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -_249;
    float _265 = _263 + 1.0;
    float _267 = _249 * _235;
    bool _269 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _271 = isnan(_173);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = _215 * _217;
    float _283 = _261 * _265;
    float _285 = -_261;
    float _287 = _285 + 1.0;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _289;
    bool _293 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _295 = isnan(_173);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _309 = _279 * _287;
    float _311 = -_279;
    float _313 = _311 + 1.0;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = fma(_291, _211, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _325 = _303 * _313;
    float _327 = fma(_317, _211, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _329 = -_303;
    float _331 = _329 + 1.0;
    float _333 = fma(_307, _237, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _335 = _319 * _325;
    float _337 = _327 * _325;
    float _339 = fma(_323, _237, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _345;
    float _349 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[143].x, _335);
    float _351 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[143].y, _337);
    float _353 = fma(_343, _219, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _355 = fma(_347, _219, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _365 = fma(_333, _309, _349);
    float _367 = fma(_339, _309, _351);
    float _369 = fma(_359, _281, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _371 = fma(_363, _281, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _373 = fma(_353, _283, _365);
    float _375 = fma(_355, _283, _367);
    float _377 = fma(_369, _267, _373);
    float _379 = fma(_371, _267, _375);
    float _381 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[147].x, _377);
    float _383 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[147].y, _379);
    bool _385 = !_205;
    float _403;
    if (!_385)
    {
        float _387 = in.m_40.x;
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _401;
        _405 = true;
    }
    else
    {
        float _407 = float(_69);
        float _409 = 1.0 / _407;
        float _411 = _101 * _409;
        _403 = _411;
    }
    _405 = false;
    float _413 = _403;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _417 = _413 + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _423 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _425 = isnan(_413);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _439 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _441 = isnan(_413);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _451;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _457 = 1.0 / _421;
    float _459 = -_433;
    float _461 = _459 + 1.0;
    float _463 = 1.0 / _437;
    float _465 = _453 * _457;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _471 = _449 * _461;
    float _473 = -_449;
    float _475 = _473 + 1.0;
    float _477 = fma(_465, _417, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _479 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _481 = isnan(_413);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = _469 * _463;
    float _493 = _477 * _471;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _497 = _413 + _495;
    float _499 = -_489;
    float _501 = _499 + 1.0;
    float _503 = in.m_40.x;
    float _505 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[115].x, _493);
    float _507 = fma(_491, _497, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _509 = _433 * _501;
    float _511 = fma(_507, _509, _505);
    float _513 = in.m_42.x;
    float _515 = in.m_42.y;
    float _517 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _519 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[117].x, _511);
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _527 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _529 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _531 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_44.x = _531;
    out.m_44.y = _529;
    out.m_44.z = _533;
    out.m_44.w = _527;
    float _535 = _517 * _503;
    float _537 = trunc(_535);
    int _539 = int(_537);
    float _541 = _383 * _515;
    float _543 = _381 * _513;
    int _545 = _539 << 4;
    int _547 = _545 + 1968;
    bool _549 = !_455;
    float _565;
    if (!_549)
    {
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _553 = _503 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[11].w, _101);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _563;
        _567 = true;
    }
    else
    {
        float _569 = float(_69);
        float _571 = 1.0 / _569;
        float _573 = _101 * _571;
        _565 = _573;
    }
    _567 = false;
    float _575 = _565;
    float _577 = in.m_40.z;
    float _579 = _503 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _581 = in.m_40.w;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _589 = _587 != 0;
    float _591 = in.m_40.y;
    int _593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _595 = _593 != 0;
    float _597 = 1.0 / _585;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _601 = _599 != 0;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _607 = _605 != 0;
    float _609 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[78].z, _603);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _613 = _575 + _611;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _617 = _503 > 0.5;
    float _619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _621 = -_615;
    float _623 = fma(_579, 2.0, _621);
    bool _625 = _577 > 0.5;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _629;
    bool _633 = _581 > 0.5;
    float _635 = -_101;
    float _637 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[76].x, _623);
    float _639 = in.m_30.x;
    float _641 = in.m_30.y;
    float _643 = in.m_30.z;
    float _645 = -_137;
    int _647 = _617 ? as_type<int>(_645) : as_type<int>(_137);
    float _649 = _591 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _651 = _591 > 0.5;
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _655 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _609);
    float _657 = fma(_649, -2.0, _627);
    float _659 = _631 * _597;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _663 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _665 = isnan(_575);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    uint _676 = uint(int(uint(_547) >> uint(2)));
    uint _678 = uint(int(uint(int(_676)) >> uint(2)));
    int _680 = int(_676) & 3;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[int(_678)][_680];
    int _684 = int(_676) + 1;
    uint _686 = uint(int(uint(_684) >> uint(2)));
    int _688 = _684 & 3;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[int(_686)][_688];
    float _692 = fma(_659, _613, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _694 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[78].w, _661);
    bool _696 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _698 = isnan(_575);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = -_673;
    float _710 = _708 + 1.0;
    float _712 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _657);
    float _714 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _694);
    float _716 = -_137;
    int _718 = _625 ? as_type<int>(_716) : as_type<int>(_137);
    float _720 = _653 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _722 = _641 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _724 = _641 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _726 = _641 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _728 = _706 * _710;
    float _730 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[4].x, _722);
    float _732 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[5].x, _724);
    float _734 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[6].x, _726);
    float _736 = _692 * _728;
    float _738 = fma(_643, (*spvDescriptorSet0.vp_c10)._m0[4].z, _730);
    float _740 = fma(_643, (*spvDescriptorSet0.vp_c10)._m0[5].z, _732);
    float _742 = fma(_643, (*spvDescriptorSet0.vp_c10)._m0[6].z, _734);
    float _744 = -_706;
    float _746 = _744 + 1.0;
    int _748 = _547 + 8;
    uint _750 = uint(int(uint(_748) >> uint(2)));
    uint _752 = uint(int(uint(int(_750)) >> uint(2)));
    int _754 = int(_750) & 3;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[int(_752)][_754];
    bool _758 = !_589;
    float _760 = _758 ? _137 : as_type<float>(_647);
    float _762 = _738 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _764 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[131].x, _736);
    float _766 = _740 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _768 = _619 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _770 = -_141;
    int _772 = _651 ? as_type<int>(_770) : as_type<int>(_141);
    float _774 = _760 + 0.5;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _778 = _766 + _776;
    float _780 = _742 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _782 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _784 = _762 + _782;
    bool _786 = !_595;
    float _788 = _786 ? _141 : as_type<float>(_772);
    float _790 = _778 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _792 = fma(_768, _774, _637);
    float _794 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _796 = _780 + _794;
    float _798 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[132].x, _764);
    float _800 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[28].x, _790);
    bool _802 = !_601;
    float _804 = _802 ? _137 : as_type<float>(_718);
    float _806 = -_655;
    float _808 = _806 + 1.0;
    float _810 = _778 * _778;
    float _812 = _788 + (-0.5);
    float _814 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[28].z, _800);
    float _816 = -_808;
    float _818 = fma(_760, _816, _792);
    float _820 = fma(_784, _784, _810);
    float _822 = _682 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _826 = -_720;
    float _828 = -_712;
    float _830 = fma(_826, _812, _828);
    bool _832 = _814 >= 0.0;
    float _834 = fma(_796, _796, _820);
    float _836 = -_141;
    int _838 = _633 ? as_type<int>(_836) : as_type<int>(_141);
    float _840 = _690 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _842 = _804 + 0.5;
    float _844 = -_714;
    float _846 = _844 + 1.0;
    float _848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _850 = !_607;
    float _852 = _850 ? _141 : as_type<float>(_838);
    float _854 = _842 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _856 = fma(_788, _846, _830);
    float _858 = _543 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _860 = _822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _862 = -_852;
    float _864 = _862 + 0.5;
    float _866 = _830;
    if (_832)
    {
        _866 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _868 = _866;
    float _870 = rsqrt(_834);
    float _872 = _840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = _864 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _876 = _854 * _824;
    float _878 = _858 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _880 = _798 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _882 = _876;
    if (_832)
    {
        out.m_33.x = 0.0;
    }
    float _884 = _756 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _886 = _874 * _848;
    float _888 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _890 = as_type<int>(_884);
    if (_832)
    {
        float _892 = _868 * 5.0;
        _890 = as_type<int>(_892);
    }
    int _894 = _890;
    out.m_46.x = _818;
    out.m_46.y = _856;
    out.m_46.z = _876;
    out.m_46.w = _886;
    float _896 = _878 * _870;
    out.m_48.x = _860;
    out.m_48.y = _872;
    out.m_48.z = _888;
    out.m_48.w = _880;
    float _898 = _784 * _896;
    if (_832)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2662 = as_type<float>(_894);
        out.gl_Position.z = _2662;
    }
    float _900 = _778 * _896;
    if (_832)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _902 = -_900;
    float _904 = _766 + _902;
    float _906 = _796 * _896;
    float _908 = -_898;
    float _910 = _762 + _908;
    float _912 = -_900;
    float _914 = _778 + _912;
    float _916 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _918 = _904 + _916;
    float _920 = -_906;
    float _922 = _780 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _926 = _910 + _924;
    float _928 = -_898;
    float _930 = _784 + _928;
    float _932 = _918 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _936 = _922 + _934;
    float _938 = _914 * _914;
    float _940 = -_906;
    float _942 = _796 + _940;
    float _944 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[28].x, _932);
    float _946 = fma(_930, _930, _938);
    float _948 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[28].z, _944);
    float _950 = fma(_942, _942, _946);
    bool _952 = _948 >= 0.0;
    float _954 = sqrt(_950);
    if (_952)
    {
        _882 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _956 = _882;
    int _958 = as_type<int>(_956);
    if (_952)
    {
        out.m_33.x = 0.0;
    }
    if (_952)
    {
        float _960 = _956 * 5.0;
        _958 = as_type<int>(_960);
    }
    int _962 = _958;
    float _964 = _870 * _954;
    if (_952)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2779 = as_type<float>(_962);
        out.gl_Position.z = _2779;
    }
    if (_952)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _966 = _541 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _968 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _141);
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _137);
    float _972 = _858 * _964;
    float _974 = _964 * _966;
    float _976 = _964 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _978 = _976 * 0.5;
    float _980 = _970 * _972;
    float _982 = _968 * _974;
    bool _984 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _986 = isnan(0.5);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _992 = _988 || _990;
    float _994 = _982 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _996 = _982 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _998 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[26].x, _994);
    float _1000 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[24].x, _996);
    float _1002 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[26].z, _998);
    float _1004 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1000);
    float _1006 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1008 = _1004 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1010 = _780 + _1006;
    float _1012 = _762 + _1008;
    float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1016 = _1010 + _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1020 = _1012 + _1018;
    float _1022 = _1016 * _1016;
    float _1024 = fma(_1020, _1020, _1022);
    float _1026 = _982 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1028 = sqrt(_1024);
    float _1030 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1026);
    float _1032 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1030);
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1036 = _766 + _1034;
    bool _1038 = _1028 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1040 = _1026;
    float _1042 = _1012;
    if (!_1038)
    {
        _1040 = _1012;
    }
    float _1044 = _1040;
    float _1046 = _1044;
    if (!_1038)
    {
        _145 = _1010;
    }
    float _1048 = _145;
    float _1050 = _1048;
    if (!_1038)
    {
        _1042 = _1036;
    }
    float _1052 = _1042;
    bool _1054 = !_1038;
    float _1056 = _1052;
    if (!_1054)
    {
        float _1058 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1060 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1062 = _1028 + _1060;
        float _1064 = _1036 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1066 = rsqrt(_1024);
        float _1068 = _1062 * _1058;
        float _1070 = _1068 * 0.15915493667125701904296875;
        float _1072 = _1070 * 6.283185482025146484375;
        float _1074 = sin(_1072);
        float _1076 = _1070 * 6.283185482025146484375;
        float _1078 = cos(_1076);
        float _1080 = fma(_1074, _1064, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1082 = _1066 * _1080;
        float _1084 = _1078 + (-1.0);
        float _1086 = fma(_1020, _1082, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1088 = fma(_1016, _1082, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1090 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1092 = fma(_1036, _1078, _1090);
        _1046 = _1086;
        _1056 = _1092;
        _1050 = _1088;
    }
    float _1094 = _1046;
    float _1096 = _1056;
    float _1098 = _1050;
    float _1100 = -_898;
    float _1102 = _1100 + _1094;
    float _1104 = -_900;
    float _1106 = _1104 + _1096;
    float _1108 = -_906;
    float _1110 = _1108 + _1098;
    float _1112 = _1106;
    float _1114 = _1102;
    float _1116 = _1110;
    if (!_992)
    {
        float _1118 = _918 * _918;
        float _1120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1122 = -_780;
        float _1124 = _1122 + _1098;
        float _1126 = -_762;
        float _1128 = _1126 + _1094;
        float _1130 = fma(_926, _926, _1118);
        float _1132 = -_766;
        float _1134 = _1132 + _1096;
        float _1136 = fma(_936, _936, _1130);
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1140 = sqrt(_1136);
        float _1142 = 1.0 / _964;
        float _1144 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1146 = precise::min(_1140, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1148 = _1146 * _1120;
        float _1150 = _1148 * _1142;
        float _1152 = _1144 * _1150;
        float _1154 = _1124 * _1150;
        float _1156 = fma(_1128, _1152, _910);
        float _1158 = fma(_1134, _1152, _904);
        float _1160 = fma(_1144, _1154, _922);
        _1112 = _1158;
        _1114 = _1156;
        _1116 = _1160;
    }
    float _1162 = _1112;
    float _1164 = _1114;
    float _1166 = _1116;
    float _1168 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1170 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1172 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1174 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1176 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1168);
    float _1178 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1170);
    float _1180 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1172);
    float _1182 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1174);
    float _1184 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1176);
    float _1186 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1178);
    float _1188 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1180);
    float _1190 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1182);
    float _1192 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1194 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1196 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1198 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1200 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1202 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1204 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1206 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1208 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1200);
    float _1210 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1202);
    float _1212 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1204);
    float _1214 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1206);
    float _1216 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1208);
    float _1218 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1210);
    float _1220 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1212);
    float _1222 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1214);
    float _1224 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1216);
    float _1226 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1218);
    float _1228 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1220);
    float _1230 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1222);
    float _1232 = _1224 + _1226;
    float _1234 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1236 = _1232 * 0.5;
    out.m_33.x = _1234;
    out.gl_Position.x = _1228;
    out.gl_Position.y = _1230;
    out.gl_Position.z = _1224;
    out.gl_Position.w = _1226;
    out.m_50.z = _1236;
    out.m_50.w = _1226;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

