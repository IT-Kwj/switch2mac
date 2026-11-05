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
    constant _16* vp_c5 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c11 [[id(3)]];
    constant _16* vp_c4 [[id(4)]];
};

struct main0_out
{
    float4 m_47 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_34 [[attribute(0)]];
    float4 m_38 [[attribute(1)]];
    uint4 m_31 [[attribute(6)]];
    float4 m_40 [[attribute(10)]];
    float4 m_36 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _379 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = as_type<float>(in.m_31.x);
    float _73 = in.m_34.x;
    float _75 = in.m_34.y;
    float _77 = in.m_34.z;
    float _79 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _81 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _79;
    float _83 = in.m_36.x;
    float _85 = in.m_36.y;
    float _87 = in.m_36.z;
    float _89 = in.m_36.w;
    float _91 = in.m_38.x;
    float _93 = in.m_38.y;
    float _95 = in.m_38.z;
    int _98 = as_type<int>(_71) * 48;
    uint _101 = uint(int(uint(_98) >> uint(2)));
    uint _103 = uint(int(uint(int(_101)) >> uint(2)));
    int _105 = int(_101) & 3;
    float _107 = (*spvDescriptorSet0.vp_c5)._m0[int(_103)][_105];
    int _109 = int(_101) + 1;
    uint _111 = uint(int(uint(_109) >> uint(2)));
    int _113 = _109 & 3;
    float _115 = (*spvDescriptorSet0.vp_c5)._m0[int(_111)][_113];
    float _117 = _77 + (-0.2599999904632568359375);
    float _119 = _89 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _121 = _117 * _117;
    float _123 = _87 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _125 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _127 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _125;
    int _129 = _98 + 16;
    uint _131 = uint(int(uint(_129) >> uint(2)));
    uint _133 = uint(int(uint(int(_131)) >> uint(2)));
    int _135 = int(_131) & 3;
    float _137 = (*spvDescriptorSet0.vp_c5)._m0[int(_133)][_135];
    int _139 = int(_131) + 1;
    uint _141 = uint(int(uint(_139) >> uint(2)));
    int _143 = _139 & 3;
    float _145 = (*spvDescriptorSet0.vp_c5)._m0[int(_141)][_143];
    float _147 = fma(_73, _73, _121);
    float _149 = _81 * _81;
    float _151 = fma(_85, (*spvDescriptorSet0.vp_c11)._m0[21].y, _119);
    float _153 = fma(_83, (*spvDescriptorSet0.vp_c11)._m0[21].x, _123);
    float _155 = fma(_127, _127, _149);
    float _157 = rsqrt(_147);
    int _159 = _98 + 32;
    uint _161 = uint(int(uint(_159) >> uint(2)));
    uint _163 = uint(int(uint(int(_161)) >> uint(2)));
    int _165 = int(_161) & 3;
    float _167 = (*spvDescriptorSet0.vp_c5)._m0[int(_163)][_165];
    int _169 = int(_161) + 1;
    uint _171 = uint(int(uint(_169) >> uint(2)));
    int _173 = _169 & 3;
    float _175 = (*spvDescriptorSet0.vp_c5)._m0[int(_171)][_173];
    float _177 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _179 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _177;
    float _181 = _151 + _75;
    float _183 = fma(_179, _179, _155);
    int _185 = _98 + 24;
    uint _187 = uint(int(uint(_185) >> uint(2)));
    uint _189 = uint(int(uint(int(_187)) >> uint(2)));
    int _191 = int(_187) & 3;
    float _193 = (*spvDescriptorSet0.vp_c5)._m0[int(_189)][_191];
    int _195 = int(_187) + 1;
    uint _197 = uint(int(uint(_195) >> uint(2)));
    int _199 = _195 & 3;
    float _201 = (*spvDescriptorSet0.vp_c5)._m0[int(_197)][_199];
    int _203 = _98 + 8;
    uint _205 = uint(int(uint(_203) >> uint(2)));
    uint _207 = uint(int(uint(int(_205)) >> uint(2)));
    int _209 = int(_205) & 3;
    float _211 = (*spvDescriptorSet0.vp_c5)._m0[int(_207)][_209];
    int _213 = int(_205) + 1;
    uint _215 = uint(int(uint(_213) >> uint(2)));
    int _217 = _213 & 3;
    float _219 = (*spvDescriptorSet0.vp_c5)._m0[int(_215)][_217];
    int _221 = _98 + 40;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    uint _225 = uint(int(uint(int(_223)) >> uint(2)));
    int _227 = int(_223) & 3;
    float _229 = (*spvDescriptorSet0.vp_c5)._m0[int(_225)][_227];
    int _231 = int(_223) + 1;
    uint _233 = uint(int(uint(_231) >> uint(2)));
    int _235 = _231 & 3;
    float _237 = (*spvDescriptorSet0.vp_c5)._m0[int(_233)][_235];
    float _239 = _93 * _115;
    float _241 = _181 * _115;
    float _243 = fma(_91, _107, _239);
    float _245 = _93 * _145;
    float _247 = fma(_91, _137, _245);
    float _249 = _93 * _175;
    float _251 = _181 * _175;
    float _253 = fma(_91, _167, _249);
    float _255 = _117 * _157;
    float _257 = _157 * _73;
    float _259 = sqrt(_183);
    float _261 = fma(_95, _193, _247);
    float _263 = _181 * _145;
    float _265 = fma(_257, _153, _73);
    float _267 = fma(_255, _123, _77);
    float _269 = _261 * _261;
    float _271 = fma(_265, _137, _263);
    float _273 = fma(_265, _107, _241);
    float _275 = fma(_95, _211, _243);
    float _277 = fma(_265, _167, _251);
    float _279 = fma(_267, _193, _271);
    float _281 = fma(_267, _211, _273);
    float _283 = fma(_275, _275, _269);
    float _285 = _279 + _201;
    bool _289 = _259 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _291 = isnan(_259);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _297 = _293 || _295;
    float _299 = fma(_95, _229, _253);
    float _301 = fma(_267, _229, _277);
    float _303 = _281 + _219;
    float _305 = _285 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _307 = fma(_299, _299, _283);
    float _309 = _285 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _311 = _285 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _313 = _301 + _237;
    float _315 = rsqrt(_307);
    float _317 = fma(_303, (*spvDescriptorSet0.vp_c6)._m0[3].x, _305);
    float _319 = fma(_303, (*spvDescriptorSet0.vp_c6)._m0[4].x, _309);
    float _321 = fma(_303, (*spvDescriptorSet0.vp_c6)._m0[5].x, _311);
    float _323 = fma(_313, (*spvDescriptorSet0.vp_c6)._m0[3].z, _317);
    float _325 = fma(_313, (*spvDescriptorSet0.vp_c6)._m0[5].z, _321);
    float _327 = fma(_313, (*spvDescriptorSet0.vp_c6)._m0[4].z, _319);
    float _329 = _319;
    float _331 = _73;
    if (!_297)
    {
        _329 = 1.0;
    }
    float _333 = _329;
    float _335 = _323 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _337 = _325 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    float _339 = _275 * _315;
    float _341 = _261 * _315;
    float _343 = _299 * _315;
    float _345 = _327 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    bool _347 = !_297;
    float _349 = _333;
    if (!_347)
    {
        bool _351 = _259 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _353 = isnan(_259);
        bool _355 = _351 || _353;
        bool _357 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _359 = _355 || _357;
        if (!_359)
        {
            float _361 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _363 = _259 + _361;
            float _365 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _367 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _365;
            float _369 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _371 = _369 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _373 = 1.0 / _367;
            float _375 = _363 * _373;
            float _377 = fma(_375, _371, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _349 = _377;
            _379 = true;
        }
        else
        {
            bool _381 = _259 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _383 = isnan(_259);
            bool _385 = _381 || _383;
            bool _387 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _389 = _385 || _387;
            if (!_389)
            {
                float _391 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _393 = _259 + _391;
                float _395 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _397 = _395 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _399 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _401 = _399 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _403 = 1.0 / _397;
                float _405 = _393 * _403;
                float _407 = fma(_405, _401, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _349 = _407;
                _379 = true;
            }
            else
            {
                _349 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _379 = false;
    float _409 = _349;
    float _411 = _409 + (-1.0);
    float _413 = in.m_40.x;
    float _415 = _411 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _417 = _411 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _419 = _411 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _421 = in.m_40.y;
    float _423 = fma(_345, _409, _415);
    float _425 = fma(_335, _409, _417);
    float _427 = fma(_337, _409, _419);
    out.m_43.x = _339;
    out.m_43.y = _341;
    out.m_43.z = _343;
    float _429 = _423 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _431 = _423 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _433 = _423 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    out.m_45.x = _73;
    out.m_45.y = _75;
    out.m_45.z = _77;
    float _435 = fma(_425, (*spvDescriptorSet0.vp_c6)._m0[2].x, _429);
    float _437 = fma(_425, (*spvDescriptorSet0.vp_c6)._m0[0].x, _431);
    float _439 = fma(_425, (*spvDescriptorSet0.vp_c6)._m0[1].x, _433);
    float _441 = fma(_427, (*spvDescriptorSet0.vp_c6)._m0[2].z, _435);
    float _443 = fma(_427, (*spvDescriptorSet0.vp_c6)._m0[0].z, _437);
    float _445 = fma(_427, (*spvDescriptorSet0.vp_c6)._m0[1].z, _439);
    float _447 = _441 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _449 = _443 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _451 = _445 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    out.m_47.z = _413;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _455 = _447 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _459 = _449 + _457;
    float _461 = _451 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _463 = _455 * _455;
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[2].x, _461);
    float _467 = fma(_459, _459, _463);
    float _469 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[2].z, _465);
    float _471 = sqrt(_467);
    float _473 = _469 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _475 = _471 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _477 = _423;
    float _479 = _439;
    float _481 = _463;
    if (!_475)
    {
        _477 = _473;
    }
    float _483 = _477;
    float _485 = _483;
    if (!_475)
    {
        _479 = _449;
    }
    float _487 = _479;
    float _489 = _487;
    if (!_475)
    {
        _481 = _451;
    }
    float _491 = _481;
    float _493 = _491;
    if (!_475)
    {
        _331 = _447;
    }
    float _495 = _331;
    bool _497 = !_475;
    float _499 = _495;
    if (!_497)
    {
        float _501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _503 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _505 = _471 + _503;
        float _507 = _451 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _509 = rsqrt(_467);
        float _511 = _505 * _501;
        float _513 = _511 * 0.15915493667125701904296875;
        float _515 = _513 * 6.283185482025146484375;
        float _517 = cos(_515);
        float _519 = _513 * 6.283185482025146484375;
        float _521 = sin(_519);
        float _523 = _517 + (-1.0);
        float _525 = _523 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _527 = fma(_521, _507, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _529 = fma(_451, _517, _525);
        float _531 = _509 * _527;
        float _533 = _529 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _535 = fma(_459, _531, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _537 = fma(_455, _531, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _539 = fma(_535, (*spvDescriptorSet0.vp_c4)._m0[2].x, _533);
        float _541 = fma(_537, (*spvDescriptorSet0.vp_c4)._m0[2].z, _539);
        float _543 = _541 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _493 = _529;
        _489 = _535;
        _499 = _537;
        _485 = _543;
    }
    float _545 = _493;
    float _547 = _489;
    float _549 = _499;
    float _551 = _485;
    float _553 = _545 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _555 = _545 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_49.x = _449;
    out.m_49.y = _451;
    out.m_49.z = _447;
    float _557 = _451 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _559 = fma(_547, (*spvDescriptorSet0.vp_c4)._m0[0].x, _553);
    float _561 = fma(_547, (*spvDescriptorSet0.vp_c4)._m0[1].x, _555);
    float _563 = _451 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _565 = _451 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _567 = _451 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _569 = _451 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _571 = _451 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _573 = _451 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _575 = _451 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _577 = _451 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _579 = _451 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _581 = _451 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _583 = _451 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _585 = fma(_549, (*spvDescriptorSet0.vp_c4)._m0[0].z, _559);
    float _587 = fma(_549, (*spvDescriptorSet0.vp_c4)._m0[1].z, _561);
    float _589 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[42].x, _557);
    float _591 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[43].x, _563);
    float _593 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[44].x, _565);
    float _595 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[45].x, _567);
    float _597 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[46].x, _569);
    float _599 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[47].x, _571);
    float _601 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[48].x, _573);
    float _603 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[49].x, _575);
    float _605 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[50].x, _577);
    float _607 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[51].x, _579);
    float _609 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[52].x, _581);
    float _611 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[53].x, _583);
    float _613 = _587 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _615 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[42].z, _589);
    float _617 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[43].z, _591);
    float _619 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[44].z, _593);
    float _621 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[45].z, _595);
    float _623 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[46].z, _597);
    float _625 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[47].z, _599);
    float _627 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[48].z, _601);
    float _629 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[49].z, _603);
    float _631 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[50].z, _605);
    float _633 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[51].z, _607);
    float _635 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[52].z, _609);
    float _637 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[53].z, _611);
    float _639 = _613 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _641 = _613 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _643 = _613 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _645 = _585 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _647 = _613 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _649 = _615 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _651 = _617 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _653 = fma(_645, (*spvDescriptorSet0.vp_c4)._m0[7].x, _639);
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c4)._m0[8].x, _641);
    float _657 = fma(_645, (*spvDescriptorSet0.vp_c4)._m0[9].x, _643);
    float _659 = fma(_645, (*spvDescriptorSet0.vp_c4)._m0[10].x, _647);
    float _661 = _619 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _663 = _621 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _665 = fma(_551, (*spvDescriptorSet0.vp_c4)._m0[7].z, _653);
    float _667 = fma(_551, (*spvDescriptorSet0.vp_c4)._m0[8].z, _655);
    float _669 = fma(_551, (*spvDescriptorSet0.vp_c4)._m0[9].z, _657);
    float _671 = fma(_551, (*spvDescriptorSet0.vp_c4)._m0[10].z, _659);
    float _673 = -_473;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _677 = _673 + _675;
    out.m_51.x = _649;
    out.m_51.y = _651;
    out.m_51.z = _661;
    out.m_51.w = _663;
    float _679 = _631 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _681 = _633 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _683 = _635 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _685 = _637 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _687 = _677 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _689 = _665 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _691 = _667 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _693 = _669 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _695 = _671 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_47.w = _421;
    float _697 = _623 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _699 = _625 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _701 = _627 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _703 = _629 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    out.m_53.x = _697;
    out.m_53.y = _699;
    out.m_53.z = _701;
    out.m_53.w = _703;
    out.m_55.x = _679;
    out.m_55.y = _681;
    out.m_55.z = _683;
    out.m_55.w = _685;
    out.m_57.w = _473;
    out.m_43.w = _687;
    out.gl_Position.x = _689;
    out.gl_Position.y = _691;
    out.gl_Position.z = _693;
    out.gl_Position.w = _695;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _379 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = as_type<float>(in.m_31.x);
    float _73 = in.m_34.x;
    float _75 = in.m_34.y;
    float _77 = in.m_34.z;
    float _79 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _81 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _79;
    float _83 = in.m_36.x;
    float _85 = in.m_36.y;
    float _87 = in.m_36.z;
    float _89 = in.m_36.w;
    float _91 = in.m_38.x;
    float _93 = in.m_38.y;
    float _95 = in.m_38.z;
    int _98 = as_type<int>(_71) * 48;
    uint _101 = uint(int(uint(_98) >> uint(2)));
    uint _103 = uint(int(uint(int(_101)) >> uint(2)));
    int _105 = int(_101) & 3;
    float _107 = (*spvDescriptorSet0.vp_c5)._m0[int(_103)][_105];
    int _109 = int(_101) + 1;
    uint _111 = uint(int(uint(_109) >> uint(2)));
    int _113 = _109 & 3;
    float _115 = (*spvDescriptorSet0.vp_c5)._m0[int(_111)][_113];
    float _117 = _77 + (-0.2599999904632568359375);
    float _119 = _89 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _121 = _117 * _117;
    float _123 = _87 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _125 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _127 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _125;
    int _129 = _98 + 16;
    uint _131 = uint(int(uint(_129) >> uint(2)));
    uint _133 = uint(int(uint(int(_131)) >> uint(2)));
    int _135 = int(_131) & 3;
    float _137 = (*spvDescriptorSet0.vp_c5)._m0[int(_133)][_135];
    int _139 = int(_131) + 1;
    uint _141 = uint(int(uint(_139) >> uint(2)));
    int _143 = _139 & 3;
    float _145 = (*spvDescriptorSet0.vp_c5)._m0[int(_141)][_143];
    float _147 = fma(_73, _73, _121);
    float _149 = _81 * _81;
    float _151 = fma(_85, (*spvDescriptorSet0.vp_c11)._m0[21].y, _119);
    float _153 = fma(_83, (*spvDescriptorSet0.vp_c11)._m0[21].x, _123);
    float _155 = fma(_127, _127, _149);
    float _157 = rsqrt(_147);
    int _159 = _98 + 32;
    uint _161 = uint(int(uint(_159) >> uint(2)));
    uint _163 = uint(int(uint(int(_161)) >> uint(2)));
    int _165 = int(_161) & 3;
    float _167 = (*spvDescriptorSet0.vp_c5)._m0[int(_163)][_165];
    int _169 = int(_161) + 1;
    uint _171 = uint(int(uint(_169) >> uint(2)));
    int _173 = _169 & 3;
    float _175 = (*spvDescriptorSet0.vp_c5)._m0[int(_171)][_173];
    float _177 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _179 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _177;
    float _181 = _151 + _75;
    float _183 = fma(_179, _179, _155);
    int _185 = _98 + 24;
    uint _187 = uint(int(uint(_185) >> uint(2)));
    uint _189 = uint(int(uint(int(_187)) >> uint(2)));
    int _191 = int(_187) & 3;
    float _193 = (*spvDescriptorSet0.vp_c5)._m0[int(_189)][_191];
    int _195 = int(_187) + 1;
    uint _197 = uint(int(uint(_195) >> uint(2)));
    int _199 = _195 & 3;
    float _201 = (*spvDescriptorSet0.vp_c5)._m0[int(_197)][_199];
    int _203 = _98 + 8;
    uint _205 = uint(int(uint(_203) >> uint(2)));
    uint _207 = uint(int(uint(int(_205)) >> uint(2)));
    int _209 = int(_205) & 3;
    float _211 = (*spvDescriptorSet0.vp_c5)._m0[int(_207)][_209];
    int _213 = int(_205) + 1;
    uint _215 = uint(int(uint(_213) >> uint(2)));
    int _217 = _213 & 3;
    float _219 = (*spvDescriptorSet0.vp_c5)._m0[int(_215)][_217];
    int _221 = _98 + 40;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    uint _225 = uint(int(uint(int(_223)) >> uint(2)));
    int _227 = int(_223) & 3;
    float _229 = (*spvDescriptorSet0.vp_c5)._m0[int(_225)][_227];
    int _231 = int(_223) + 1;
    uint _233 = uint(int(uint(_231) >> uint(2)));
    int _235 = _231 & 3;
    float _237 = (*spvDescriptorSet0.vp_c5)._m0[int(_233)][_235];
    float _239 = _93 * _115;
    float _241 = _181 * _115;
    float _243 = fma(_91, _107, _239);
    float _245 = _93 * _145;
    float _247 = fma(_91, _137, _245);
    float _249 = _93 * _175;
    float _251 = _181 * _175;
    float _253 = fma(_91, _167, _249);
    float _255 = _117 * _157;
    float _257 = _157 * _73;
    float _259 = sqrt(_183);
    float _261 = fma(_95, _193, _247);
    float _263 = _181 * _145;
    float _265 = fma(_257, _153, _73);
    float _267 = fma(_255, _123, _77);
    float _269 = _261 * _261;
    float _271 = fma(_265, _137, _263);
    float _273 = fma(_265, _107, _241);
    float _275 = fma(_95, _211, _243);
    float _277 = fma(_265, _167, _251);
    float _279 = fma(_267, _193, _271);
    float _281 = fma(_267, _211, _273);
    float _283 = fma(_275, _275, _269);
    float _285 = _279 + _201;
    bool _289 = _259 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _291 = isnan(_259);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _297 = _293 || _295;
    float _299 = fma(_95, _229, _253);
    float _301 = fma(_267, _229, _277);
    float _303 = _281 + _219;
    float _305 = _285 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _307 = fma(_299, _299, _283);
    float _309 = _285 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _311 = _285 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _313 = _301 + _237;
    float _315 = rsqrt(_307);
    float _317 = fma(_303, (*spvDescriptorSet0.vp_c6)._m0[3].x, _305);
    float _319 = fma(_303, (*spvDescriptorSet0.vp_c6)._m0[4].x, _309);
    float _321 = fma(_303, (*spvDescriptorSet0.vp_c6)._m0[5].x, _311);
    float _323 = fma(_313, (*spvDescriptorSet0.vp_c6)._m0[3].z, _317);
    float _325 = fma(_313, (*spvDescriptorSet0.vp_c6)._m0[5].z, _321);
    float _327 = fma(_313, (*spvDescriptorSet0.vp_c6)._m0[4].z, _319);
    float _329 = _319;
    float _331 = _73;
    if (!_297)
    {
        _329 = 1.0;
    }
    float _333 = _329;
    float _335 = _323 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _337 = _325 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    float _339 = _275 * _315;
    float _341 = _261 * _315;
    float _343 = _299 * _315;
    float _345 = _327 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    bool _347 = !_297;
    float _349 = _333;
    if (!_347)
    {
        bool _351 = _259 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _353 = isnan(_259);
        bool _355 = _351 || _353;
        bool _357 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _359 = _355 || _357;
        if (!_359)
        {
            float _361 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _363 = _259 + _361;
            float _365 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _367 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _365;
            float _369 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _371 = _369 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _373 = 1.0 / _367;
            float _375 = _363 * _373;
            float _377 = fma(_375, _371, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _349 = _377;
            _379 = true;
        }
        else
        {
            bool _381 = _259 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _383 = isnan(_259);
            bool _385 = _381 || _383;
            bool _387 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _389 = _385 || _387;
            if (!_389)
            {
                float _391 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _393 = _259 + _391;
                float _395 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _397 = _395 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _399 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _401 = _399 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _403 = 1.0 / _397;
                float _405 = _393 * _403;
                float _407 = fma(_405, _401, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _349 = _407;
                _379 = true;
            }
            else
            {
                _349 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _379 = false;
    float _409 = _349;
    float _411 = _409 + (-1.0);
    float _413 = in.m_40.x;
    float _415 = _411 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _417 = _411 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _419 = _411 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _421 = in.m_40.y;
    float _423 = fma(_345, _409, _415);
    float _425 = fma(_335, _409, _417);
    float _427 = fma(_337, _409, _419);
    out.m_43.x = _339;
    out.m_43.y = _341;
    out.m_43.z = _343;
    float _429 = _423 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _431 = _423 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _433 = _423 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    out.m_45.x = _73;
    out.m_45.y = _75;
    out.m_45.z = _77;
    float _435 = fma(_425, (*spvDescriptorSet0.vp_c6)._m0[2].x, _429);
    float _437 = fma(_425, (*spvDescriptorSet0.vp_c6)._m0[0].x, _431);
    float _439 = fma(_425, (*spvDescriptorSet0.vp_c6)._m0[1].x, _433);
    float _441 = fma(_427, (*spvDescriptorSet0.vp_c6)._m0[2].z, _435);
    float _443 = fma(_427, (*spvDescriptorSet0.vp_c6)._m0[0].z, _437);
    float _445 = fma(_427, (*spvDescriptorSet0.vp_c6)._m0[1].z, _439);
    float _447 = _441 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _449 = _443 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _451 = _445 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    out.m_47.z = _413;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _455 = _447 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _459 = _449 + _457;
    float _461 = _451 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _463 = _455 * _455;
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[2].x, _461);
    float _467 = fma(_459, _459, _463);
    float _469 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[2].z, _465);
    float _471 = sqrt(_467);
    float _473 = _469 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _475 = _471 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _477 = _423;
    float _479 = _439;
    float _481 = _463;
    if (!_475)
    {
        _477 = _473;
    }
    float _483 = _477;
    float _485 = _483;
    if (!_475)
    {
        _479 = _449;
    }
    float _487 = _479;
    float _489 = _487;
    if (!_475)
    {
        _481 = _451;
    }
    float _491 = _481;
    float _493 = _491;
    if (!_475)
    {
        _331 = _447;
    }
    float _495 = _331;
    bool _497 = !_475;
    float _499 = _495;
    if (!_497)
    {
        float _501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _503 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _505 = _471 + _503;
        float _507 = _451 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _509 = rsqrt(_467);
        float _511 = _505 * _501;
        float _513 = _511 * 0.15915493667125701904296875;
        float _515 = _513 * 6.283185482025146484375;
        float _517 = cos(_515);
        float _519 = _513 * 6.283185482025146484375;
        float _521 = sin(_519);
        float _523 = _517 + (-1.0);
        float _525 = _523 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _527 = fma(_521, _507, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _529 = fma(_451, _517, _525);
        float _531 = _509 * _527;
        float _533 = _529 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _535 = fma(_459, _531, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _537 = fma(_455, _531, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _539 = fma(_535, (*spvDescriptorSet0.vp_c4)._m0[2].x, _533);
        float _541 = fma(_537, (*spvDescriptorSet0.vp_c4)._m0[2].z, _539);
        float _543 = _541 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _493 = _529;
        _489 = _535;
        _499 = _537;
        _485 = _543;
    }
    float _545 = _493;
    float _547 = _489;
    float _549 = _499;
    float _551 = _485;
    float _553 = _545 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _555 = _545 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_49.x = _449;
    out.m_49.y = _451;
    out.m_49.z = _447;
    float _557 = _451 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _559 = fma(_547, (*spvDescriptorSet0.vp_c4)._m0[0].x, _553);
    float _561 = fma(_547, (*spvDescriptorSet0.vp_c4)._m0[1].x, _555);
    float _563 = _451 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _565 = _451 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _567 = _451 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _569 = _451 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _571 = _451 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _573 = _451 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _575 = _451 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _577 = _451 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _579 = _451 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _581 = _451 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _583 = _451 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _585 = fma(_549, (*spvDescriptorSet0.vp_c4)._m0[0].z, _559);
    float _587 = fma(_549, (*spvDescriptorSet0.vp_c4)._m0[1].z, _561);
    float _589 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[42].x, _557);
    float _591 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[43].x, _563);
    float _593 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[44].x, _565);
    float _595 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[45].x, _567);
    float _597 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[46].x, _569);
    float _599 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[47].x, _571);
    float _601 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[48].x, _573);
    float _603 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[49].x, _575);
    float _605 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[50].x, _577);
    float _607 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[51].x, _579);
    float _609 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[52].x, _581);
    float _611 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[53].x, _583);
    float _613 = _587 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _615 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[42].z, _589);
    float _617 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[43].z, _591);
    float _619 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[44].z, _593);
    float _621 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[45].z, _595);
    float _623 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[46].z, _597);
    float _625 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[47].z, _599);
    float _627 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[48].z, _601);
    float _629 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[49].z, _603);
    float _631 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[50].z, _605);
    float _633 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[51].z, _607);
    float _635 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[52].z, _609);
    float _637 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[53].z, _611);
    float _639 = _613 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _641 = _613 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _643 = _613 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _645 = _585 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _647 = _613 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _649 = _615 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _651 = _617 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _653 = fma(_645, (*spvDescriptorSet0.vp_c4)._m0[7].x, _639);
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c4)._m0[8].x, _641);
    float _657 = fma(_645, (*spvDescriptorSet0.vp_c4)._m0[9].x, _643);
    float _659 = fma(_645, (*spvDescriptorSet0.vp_c4)._m0[10].x, _647);
    float _661 = _619 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _663 = _621 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _665 = fma(_551, (*spvDescriptorSet0.vp_c4)._m0[7].z, _653);
    float _667 = fma(_551, (*spvDescriptorSet0.vp_c4)._m0[8].z, _655);
    float _669 = fma(_551, (*spvDescriptorSet0.vp_c4)._m0[9].z, _657);
    float _671 = fma(_551, (*spvDescriptorSet0.vp_c4)._m0[10].z, _659);
    float _673 = -_473;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _677 = _673 + _675;
    out.m_51.x = _649;
    out.m_51.y = _651;
    out.m_51.z = _661;
    out.m_51.w = _663;
    float _679 = _631 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _681 = _633 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _683 = _635 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _685 = _637 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _687 = _677 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _689 = _665 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _691 = _667 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _693 = _669 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _695 = _671 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_47.w = _421;
    float _697 = _623 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _699 = _625 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _701 = _627 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _703 = _629 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    out.m_53.x = _697;
    out.m_53.y = _699;
    out.m_53.z = _701;
    out.m_53.w = _703;
    out.m_55.x = _679;
    out.m_55.y = _681;
    out.m_55.z = _683;
    out.m_55.w = _685;
    out.m_57.w = _473;
    out.m_43.w = _687;
    out.gl_Position.x = _689;
    out.gl_Position.y = _691;
    out.gl_Position.z = _693;
    out.gl_Position.w = _695;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _379 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = as_type<float>(in.m_31.x);
    float _73 = in.m_34.x;
    float _75 = in.m_34.y;
    float _77 = in.m_34.z;
    float _79 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _81 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _79;
    float _83 = in.m_36.x;
    float _85 = in.m_36.y;
    float _87 = in.m_36.z;
    float _89 = in.m_36.w;
    float _91 = in.m_38.x;
    float _93 = in.m_38.y;
    float _95 = in.m_38.z;
    int _98 = as_type<int>(_71) * 48;
    uint _101 = uint(int(uint(_98) >> uint(2)));
    uint _103 = uint(int(uint(int(_101)) >> uint(2)));
    int _105 = int(_101) & 3;
    float _107 = (*spvDescriptorSet0.vp_c5)._m0[int(_103)][_105];
    int _109 = int(_101) + 1;
    uint _111 = uint(int(uint(_109) >> uint(2)));
    int _113 = _109 & 3;
    float _115 = (*spvDescriptorSet0.vp_c5)._m0[int(_111)][_113];
    float _117 = _77 + (-0.2599999904632568359375);
    float _119 = _89 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _121 = _117 * _117;
    float _123 = _87 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _125 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _127 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _125;
    int _129 = _98 + 16;
    uint _131 = uint(int(uint(_129) >> uint(2)));
    uint _133 = uint(int(uint(int(_131)) >> uint(2)));
    int _135 = int(_131) & 3;
    float _137 = (*spvDescriptorSet0.vp_c5)._m0[int(_133)][_135];
    int _139 = int(_131) + 1;
    uint _141 = uint(int(uint(_139) >> uint(2)));
    int _143 = _139 & 3;
    float _145 = (*spvDescriptorSet0.vp_c5)._m0[int(_141)][_143];
    float _147 = fma(_73, _73, _121);
    float _149 = _81 * _81;
    float _151 = fma(_85, (*spvDescriptorSet0.vp_c11)._m0[21].y, _119);
    float _153 = fma(_83, (*spvDescriptorSet0.vp_c11)._m0[21].x, _123);
    float _155 = fma(_127, _127, _149);
    float _157 = rsqrt(_147);
    int _159 = _98 + 32;
    uint _161 = uint(int(uint(_159) >> uint(2)));
    uint _163 = uint(int(uint(int(_161)) >> uint(2)));
    int _165 = int(_161) & 3;
    float _167 = (*spvDescriptorSet0.vp_c5)._m0[int(_163)][_165];
    int _169 = int(_161) + 1;
    uint _171 = uint(int(uint(_169) >> uint(2)));
    int _173 = _169 & 3;
    float _175 = (*spvDescriptorSet0.vp_c5)._m0[int(_171)][_173];
    float _177 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _179 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _177;
    float _181 = _151 + _75;
    float _183 = fma(_179, _179, _155);
    int _185 = _98 + 24;
    uint _187 = uint(int(uint(_185) >> uint(2)));
    uint _189 = uint(int(uint(int(_187)) >> uint(2)));
    int _191 = int(_187) & 3;
    float _193 = (*spvDescriptorSet0.vp_c5)._m0[int(_189)][_191];
    int _195 = int(_187) + 1;
    uint _197 = uint(int(uint(_195) >> uint(2)));
    int _199 = _195 & 3;
    float _201 = (*spvDescriptorSet0.vp_c5)._m0[int(_197)][_199];
    int _203 = _98 + 8;
    uint _205 = uint(int(uint(_203) >> uint(2)));
    uint _207 = uint(int(uint(int(_205)) >> uint(2)));
    int _209 = int(_205) & 3;
    float _211 = (*spvDescriptorSet0.vp_c5)._m0[int(_207)][_209];
    int _213 = int(_205) + 1;
    uint _215 = uint(int(uint(_213) >> uint(2)));
    int _217 = _213 & 3;
    float _219 = (*spvDescriptorSet0.vp_c5)._m0[int(_215)][_217];
    int _221 = _98 + 40;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    uint _225 = uint(int(uint(int(_223)) >> uint(2)));
    int _227 = int(_223) & 3;
    float _229 = (*spvDescriptorSet0.vp_c5)._m0[int(_225)][_227];
    int _231 = int(_223) + 1;
    uint _233 = uint(int(uint(_231) >> uint(2)));
    int _235 = _231 & 3;
    float _237 = (*spvDescriptorSet0.vp_c5)._m0[int(_233)][_235];
    float _239 = _93 * _115;
    float _241 = _181 * _115;
    float _243 = fma(_91, _107, _239);
    float _245 = _93 * _145;
    float _247 = fma(_91, _137, _245);
    float _249 = _93 * _175;
    float _251 = _181 * _175;
    float _253 = fma(_91, _167, _249);
    float _255 = _117 * _157;
    float _257 = _157 * _73;
    float _259 = sqrt(_183);
    float _261 = fma(_95, _193, _247);
    float _263 = _181 * _145;
    float _265 = fma(_257, _153, _73);
    float _267 = fma(_255, _123, _77);
    float _269 = _261 * _261;
    float _271 = fma(_265, _137, _263);
    float _273 = fma(_265, _107, _241);
    float _275 = fma(_95, _211, _243);
    float _277 = fma(_265, _167, _251);
    float _279 = fma(_267, _193, _271);
    float _281 = fma(_267, _211, _273);
    float _283 = fma(_275, _275, _269);
    float _285 = _279 + _201;
    bool _289 = _259 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _291 = isnan(_259);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _297 = _293 || _295;
    float _299 = fma(_95, _229, _253);
    float _301 = fma(_267, _229, _277);
    float _303 = _281 + _219;
    float _305 = _285 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _307 = fma(_299, _299, _283);
    float _309 = _285 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _311 = _285 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _313 = _301 + _237;
    float _315 = rsqrt(_307);
    float _317 = fma(_303, (*spvDescriptorSet0.vp_c6)._m0[3].x, _305);
    float _319 = fma(_303, (*spvDescriptorSet0.vp_c6)._m0[4].x, _309);
    float _321 = fma(_303, (*spvDescriptorSet0.vp_c6)._m0[5].x, _311);
    float _323 = fma(_313, (*spvDescriptorSet0.vp_c6)._m0[3].z, _317);
    float _325 = fma(_313, (*spvDescriptorSet0.vp_c6)._m0[5].z, _321);
    float _327 = fma(_313, (*spvDescriptorSet0.vp_c6)._m0[4].z, _319);
    float _329 = _319;
    float _331 = _73;
    if (!_297)
    {
        _329 = 1.0;
    }
    float _333 = _329;
    float _335 = _323 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _337 = _325 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    float _339 = _275 * _315;
    float _341 = _261 * _315;
    float _343 = _299 * _315;
    float _345 = _327 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    bool _347 = !_297;
    float _349 = _333;
    if (!_347)
    {
        bool _351 = _259 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _353 = isnan(_259);
        bool _355 = _351 || _353;
        bool _357 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _359 = _355 || _357;
        if (!_359)
        {
            float _361 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _363 = _259 + _361;
            float _365 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _367 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _365;
            float _369 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _371 = _369 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _373 = 1.0 / _367;
            float _375 = _363 * _373;
            float _377 = fma(_375, _371, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _349 = _377;
            _379 = true;
        }
        else
        {
            bool _381 = _259 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _383 = isnan(_259);
            bool _385 = _381 || _383;
            bool _387 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _389 = _385 || _387;
            if (!_389)
            {
                float _391 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _393 = _259 + _391;
                float _395 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _397 = _395 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _399 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _401 = _399 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _403 = 1.0 / _397;
                float _405 = _393 * _403;
                float _407 = fma(_405, _401, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _349 = _407;
                _379 = true;
            }
            else
            {
                _349 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _379 = false;
    float _409 = _349;
    float _411 = _409 + (-1.0);
    float _413 = in.m_40.x;
    float _415 = _411 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _417 = _411 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _419 = _411 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _421 = in.m_40.y;
    float _423 = fma(_345, _409, _415);
    float _425 = fma(_335, _409, _417);
    float _427 = fma(_337, _409, _419);
    out.m_43.x = _339;
    out.m_43.y = _341;
    out.m_43.z = _343;
    float _429 = _423 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _431 = _423 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _433 = _423 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    out.m_45.x = _73;
    out.m_45.y = _75;
    out.m_45.z = _77;
    float _435 = fma(_425, (*spvDescriptorSet0.vp_c6)._m0[2].x, _429);
    float _437 = fma(_425, (*spvDescriptorSet0.vp_c6)._m0[0].x, _431);
    float _439 = fma(_425, (*spvDescriptorSet0.vp_c6)._m0[1].x, _433);
    float _441 = fma(_427, (*spvDescriptorSet0.vp_c6)._m0[2].z, _435);
    float _443 = fma(_427, (*spvDescriptorSet0.vp_c6)._m0[0].z, _437);
    float _445 = fma(_427, (*spvDescriptorSet0.vp_c6)._m0[1].z, _439);
    float _447 = _441 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _449 = _443 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _451 = _445 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    out.m_47.z = _413;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _455 = _447 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _459 = _449 + _457;
    float _461 = _451 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _463 = _455 * _455;
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[2].x, _461);
    float _467 = fma(_459, _459, _463);
    float _469 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[2].z, _465);
    float _471 = sqrt(_467);
    float _473 = _469 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _475 = _471 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _477 = _423;
    float _479 = _439;
    float _481 = _463;
    if (!_475)
    {
        _477 = _473;
    }
    float _483 = _477;
    float _485 = _483;
    if (!_475)
    {
        _479 = _449;
    }
    float _487 = _479;
    float _489 = _487;
    if (!_475)
    {
        _481 = _451;
    }
    float _491 = _481;
    float _493 = _491;
    if (!_475)
    {
        _331 = _447;
    }
    float _495 = _331;
    bool _497 = !_475;
    float _499 = _495;
    if (!_497)
    {
        float _501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _503 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _505 = _471 + _503;
        float _507 = _451 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _509 = rsqrt(_467);
        float _511 = _505 * _501;
        float _513 = _511 * 0.15915493667125701904296875;
        float _515 = _513 * 6.283185482025146484375;
        float _517 = cos(_515);
        float _519 = _513 * 6.283185482025146484375;
        float _521 = sin(_519);
        float _523 = _517 + (-1.0);
        float _525 = _523 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _527 = fma(_521, _507, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _529 = fma(_451, _517, _525);
        float _531 = _509 * _527;
        float _533 = _529 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _535 = fma(_459, _531, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _537 = fma(_455, _531, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _539 = fma(_535, (*spvDescriptorSet0.vp_c4)._m0[2].x, _533);
        float _541 = fma(_537, (*spvDescriptorSet0.vp_c4)._m0[2].z, _539);
        float _543 = _541 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _493 = _529;
        _489 = _535;
        _499 = _537;
        _485 = _543;
    }
    float _545 = _493;
    float _547 = _489;
    float _549 = _499;
    float _551 = _485;
    float _553 = _545 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _555 = _545 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_49.x = _449;
    out.m_49.y = _451;
    out.m_49.z = _447;
    float _557 = _451 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _559 = fma(_547, (*spvDescriptorSet0.vp_c4)._m0[0].x, _553);
    float _561 = fma(_547, (*spvDescriptorSet0.vp_c4)._m0[1].x, _555);
    float _563 = _451 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _565 = _451 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _567 = _451 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _569 = _451 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _571 = _451 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _573 = _451 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _575 = _451 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _577 = _451 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _579 = _451 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _581 = _451 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _583 = _451 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _585 = fma(_549, (*spvDescriptorSet0.vp_c4)._m0[0].z, _559);
    float _587 = fma(_549, (*spvDescriptorSet0.vp_c4)._m0[1].z, _561);
    float _589 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[42].x, _557);
    float _591 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[43].x, _563);
    float _593 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[44].x, _565);
    float _595 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[45].x, _567);
    float _597 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[46].x, _569);
    float _599 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[47].x, _571);
    float _601 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[48].x, _573);
    float _603 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[49].x, _575);
    float _605 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[50].x, _577);
    float _607 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[51].x, _579);
    float _609 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[52].x, _581);
    float _611 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[53].x, _583);
    float _613 = _587 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _615 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[42].z, _589);
    float _617 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[43].z, _591);
    float _619 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[44].z, _593);
    float _621 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[45].z, _595);
    float _623 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[46].z, _597);
    float _625 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[47].z, _599);
    float _627 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[48].z, _601);
    float _629 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[49].z, _603);
    float _631 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[50].z, _605);
    float _633 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[51].z, _607);
    float _635 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[52].z, _609);
    float _637 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[53].z, _611);
    float _639 = _613 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _641 = _613 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _643 = _613 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _645 = _585 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _647 = _613 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _649 = _615 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _651 = _617 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _653 = fma(_645, (*spvDescriptorSet0.vp_c4)._m0[7].x, _639);
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c4)._m0[8].x, _641);
    float _657 = fma(_645, (*spvDescriptorSet0.vp_c4)._m0[9].x, _643);
    float _659 = fma(_645, (*spvDescriptorSet0.vp_c4)._m0[10].x, _647);
    float _661 = _619 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _663 = _621 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _665 = fma(_551, (*spvDescriptorSet0.vp_c4)._m0[7].z, _653);
    float _667 = fma(_551, (*spvDescriptorSet0.vp_c4)._m0[8].z, _655);
    float _669 = fma(_551, (*spvDescriptorSet0.vp_c4)._m0[9].z, _657);
    float _671 = fma(_551, (*spvDescriptorSet0.vp_c4)._m0[10].z, _659);
    float _673 = -_473;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _677 = _673 + _675;
    out.m_51.x = _649;
    out.m_51.y = _651;
    out.m_51.z = _661;
    out.m_51.w = _663;
    float _679 = _631 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _681 = _633 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _683 = _635 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _685 = _637 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _687 = _677 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _689 = _665 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _691 = _667 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _693 = _669 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _695 = _671 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_47.w = _421;
    float _697 = _623 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _699 = _625 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _701 = _627 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _703 = _629 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    out.m_53.x = _697;
    out.m_53.y = _699;
    out.m_53.z = _701;
    out.m_53.w = _703;
    out.m_55.x = _679;
    out.m_55.y = _681;
    out.m_55.z = _683;
    out.m_55.w = _685;
    out.m_57.w = _473;
    out.m_43.w = _687;
    out.gl_Position.x = _689;
    out.gl_Position.y = _691;
    out.gl_Position.z = _693;
    out.gl_Position.w = _695;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

