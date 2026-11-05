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
    constant _16* vp_c4 [[id(3)]];
};

struct main0_out
{
    float4 m_45 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_57 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(0)]];
    float4 m_34 [[attribute(1)]];
    float4 m_36 [[attribute(2)]];
    uint4 m_29 [[attribute(6)]];
    float4 m_38 [[attribute(8)]];
    float4 m_40 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _389 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = as_type<float>(in.m_29.x);
    float _75 = in.m_32.x;
    float _77 = in.m_32.y;
    float _79 = in.m_32.z;
    float _81 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _83 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _81;
    float _85 = in.m_34.x;
    float _87 = in.m_34.y;
    float _89 = in.m_34.z;
    float _91 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _93 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _91;
    float _95 = _83 * _83;
    float _97 = in.m_36.x;
    float _99 = in.m_36.y;
    float _101 = in.m_36.z;
    float _103 = fma(_93, _93, _95);
    int _106 = as_type<int>(_73) * 48;
    uint _109 = uint(int(uint(_106) >> uint(2)));
    uint _111 = uint(int(uint(int(_109)) >> uint(2)));
    int _113 = int(_109) & 3;
    float _115 = (*spvDescriptorSet0.vp_c5)._m0[int(_111)][_113];
    int _117 = int(_109) + 1;
    uint _119 = uint(int(uint(_117) >> uint(2)));
    int _121 = _117 & 3;
    float _123 = (*spvDescriptorSet0.vp_c5)._m0[int(_119)][_121];
    int _125 = _106 + 16;
    uint _127 = uint(int(uint(_125) >> uint(2)));
    uint _129 = uint(int(uint(int(_127)) >> uint(2)));
    int _131 = int(_127) & 3;
    float _133 = (*spvDescriptorSet0.vp_c5)._m0[int(_129)][_131];
    int _135 = int(_127) + 1;
    uint _137 = uint(int(uint(_135) >> uint(2)));
    int _139 = _135 & 3;
    float _141 = (*spvDescriptorSet0.vp_c5)._m0[int(_137)][_139];
    int _143 = _106 + 32;
    uint _145 = uint(int(uint(_143) >> uint(2)));
    uint _147 = uint(int(uint(int(_145)) >> uint(2)));
    int _149 = int(_145) & 3;
    float _151 = (*spvDescriptorSet0.vp_c5)._m0[int(_147)][_149];
    int _153 = int(_145) + 1;
    uint _155 = uint(int(uint(_153) >> uint(2)));
    int _157 = _153 & 3;
    float _159 = (*spvDescriptorSet0.vp_c5)._m0[int(_155)][_157];
    int _161 = _106 + 24;
    uint _163 = uint(int(uint(_161) >> uint(2)));
    uint _165 = uint(int(uint(int(_163)) >> uint(2)));
    int _167 = int(_163) & 3;
    float _169 = (*spvDescriptorSet0.vp_c5)._m0[int(_165)][_167];
    int _171 = int(_163) + 1;
    uint _173 = uint(int(uint(_171) >> uint(2)));
    int _175 = _171 & 3;
    float _177 = (*spvDescriptorSet0.vp_c5)._m0[int(_173)][_175];
    int _179 = _106 + 8;
    uint _181 = uint(int(uint(_179) >> uint(2)));
    uint _183 = uint(int(uint(int(_181)) >> uint(2)));
    int _185 = int(_181) & 3;
    float _187 = (*spvDescriptorSet0.vp_c5)._m0[int(_183)][_185];
    int _189 = int(_181) + 1;
    uint _191 = uint(int(uint(_189) >> uint(2)));
    int _193 = _189 & 3;
    float _195 = (*spvDescriptorSet0.vp_c5)._m0[int(_191)][_193];
    int _197 = _106 + 40;
    uint _199 = uint(int(uint(_197) >> uint(2)));
    uint _201 = uint(int(uint(int(_199)) >> uint(2)));
    int _203 = int(_199) & 3;
    float _205 = (*spvDescriptorSet0.vp_c5)._m0[int(_201)][_203];
    int _207 = int(_199) + 1;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    int _211 = _207 & 3;
    float _213 = (*spvDescriptorSet0.vp_c5)._m0[int(_209)][_211];
    float _215 = _77 * _123;
    float _217 = _87 * _123;
    float _219 = _99 * _123;
    float _221 = fma(_75, _115, _215);
    float _223 = fma(_85, _115, _217);
    float _225 = fma(_97, _115, _219);
    float _227 = _77 * _141;
    float _229 = _87 * _141;
    float _231 = _99 * _141;
    float _233 = fma(_75, _133, _227);
    float _235 = fma(_85, _133, _229);
    float _237 = fma(_97, _133, _231);
    float _239 = _77 * _159;
    float _241 = _87 * _159;
    float _243 = _99 * _159;
    float _245 = fma(_75, _151, _239);
    float _247 = fma(_85, _151, _241);
    float _249 = fma(_97, _151, _243);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _253 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _251;
    float _255 = fma(_89, _169, _235);
    float _257 = fma(_101, _169, _237);
    float _259 = fma(_79, _169, _233);
    float _261 = fma(_253, _253, _103);
    float _263 = _255 * _255;
    float _265 = _257 * _257;
    float _267 = _259 + _177;
    float _269 = fma(_89, _187, _223);
    float _271 = fma(_101, _187, _225);
    float _273 = sqrt(_261);
    float _275 = fma(_79, _187, _221);
    float _277 = fma(_269, _269, _263);
    float _279 = _267 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _281 = _267 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _283 = _275 + _195;
    float _285 = fma(_89, _205, _247);
    float _287 = fma(_101, _205, _249);
    float _289 = fma(_271, _271, _265);
    float _291 = fma(_79, _205, _245);
    float _293 = fma(_285, _285, _277);
    float _295 = _267 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _297 = fma(_287, _287, _289);
    float _299 = _291 + _213;
    float _301 = fma(_283, (*spvDescriptorSet0.vp_c6)._m0[4].x, _279);
    float _303 = fma(_283, (*spvDescriptorSet0.vp_c6)._m0[3].x, _295);
    float _305 = rsqrt(_293);
    bool _309 = _273 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _311 = isnan(_273);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _317 = _313 || _315;
    float _319 = fma(_283, (*spvDescriptorSet0.vp_c6)._m0[5].x, _281);
    float _321 = fma(_299, (*spvDescriptorSet0.vp_c6)._m0[3].z, _303);
    float _323 = fma(_299, (*spvDescriptorSet0.vp_c6)._m0[4].z, _301);
    float _325 = fma(_299, (*spvDescriptorSet0.vp_c6)._m0[5].z, _319);
    float _327 = rsqrt(_297);
    float _329 = _323 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _331 = _301;
    if (!_317)
    {
        _331 = 1.0;
    }
    float _333 = _331;
    float _335 = _269 * _305;
    float _337 = _255 * _305;
    float _339 = _285 * _305;
    float _341 = _321 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _343 = _271 * _327;
    float _345 = _257 * _327;
    float _347 = _287 * _327;
    float _349 = _325 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _351 = !_317;
    float _353 = _333;
    float _355 = _339;
    float _357 = _337;
    float _359 = _335;
    if (!_351)
    {
        bool _361 = _273 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _363 = isnan(_273);
        bool _365 = _361 || _363;
        bool _367 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _369 = _365 || _367;
        if (!_369)
        {
            float _371 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _373 = _273 + _371;
            float _375 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _377 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _375;
            float _379 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _381 = _379 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _383 = 1.0 / _377;
            float _385 = _373 * _383;
            float _387 = fma(_385, _381, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _353 = _387;
            _389 = true;
        }
        else
        {
            bool _391 = _273 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _393 = isnan(_273);
            bool _395 = _391 || _393;
            bool _397 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _399 = _395 || _397;
            if (!_399)
            {
                float _401 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _403 = _273 + _401;
                float _405 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _407 = _405 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _409 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _411 = _409 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _413 = 1.0 / _407;
                float _415 = _403 * _413;
                float _417 = fma(_415, _411, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _353 = _417;
                _389 = true;
            }
            else
            {
                _353 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _389 = false;
    float _419 = _353;
    float _421 = _419 + (-1.0);
    float _423 = in.m_38.x;
    float _425 = _421 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _427 = _421 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _429 = _421 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _431 = in.m_38.y;
    float _433 = fma(_329, _419, _425);
    float _435 = fma(_341, _419, _427);
    float _437 = fma(_349, _419, _429);
    float _439 = in.m_40.x;
    float _441 = _433 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _443 = _433 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _445 = in.m_36.w;
    float _447 = fma(_435, (*spvDescriptorSet0.vp_c6)._m0[2].x, _441);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c6)._m0[0].x, _443);
    float _451 = fma(_437, (*spvDescriptorSet0.vp_c6)._m0[2].z, _447);
    float _453 = fma(_437, (*spvDescriptorSet0.vp_c6)._m0[0].z, _449);
    float _455 = _433 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _457 = _451 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _459 = _453 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _461 = fma(_435, (*spvDescriptorSet0.vp_c6)._m0[1].x, _455);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _465 = _457 + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _469 = _459 + _467;
    float _471 = fma(_437, (*spvDescriptorSet0.vp_c6)._m0[1].z, _461);
    float _473 = _465 * _465;
    float _475 = in.m_40.y;
    float _477 = _471 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _479 = fma(_469, _469, _473);
    out.m_43.x = _343;
    out.m_43.y = _345;
    out.m_43.z = _347;
    float _481 = _477 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _483 = sqrt(_479);
    out.m_45.x = _423;
    float _485 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[2].x, _481);
    out.m_45.y = _431;
    float _487 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[2].z, _485);
    out.m_47.z = _439;
    float _489 = _487 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    out.m_49.x = _335;
    out.m_49.y = _337;
    out.m_49.z = _339;
    bool _491 = _483 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _493 = _433;
    if (!_491)
    {
        _493 = _489;
    }
    float _495 = _493;
    float _497 = _495;
    if (!_491)
    {
        _355 = _459;
    }
    float _499 = _355;
    float _501 = _499;
    if (!_491)
    {
        _357 = _477;
    }
    float _503 = _357;
    float _505 = _503;
    if (!_491)
    {
        _359 = _457;
    }
    float _507 = _359;
    bool _509 = !_491;
    float _511 = _507;
    if (!_509)
    {
        float _513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _515 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _517 = _483 + _515;
        float _519 = _477 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _521 = rsqrt(_479);
        float _523 = _517 * _513;
        float _525 = _523 * 0.15915493667125701904296875;
        float _527 = _525 * 6.283185482025146484375;
        float _529 = cos(_527);
        float _531 = _525 * 6.283185482025146484375;
        float _533 = sin(_531);
        float _535 = _529 + (-1.0);
        float _537 = _535 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _539 = fma(_533, _519, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _541 = fma(_477, _529, _537);
        float _543 = _521 * _539;
        float _545 = _541 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _547 = fma(_469, _543, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _549 = fma(_465, _543, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _551 = fma(_547, (*spvDescriptorSet0.vp_c4)._m0[2].x, _545);
        float _553 = fma(_549, (*spvDescriptorSet0.vp_c4)._m0[2].z, _551);
        float _555 = _553 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _505 = _541;
        _501 = _547;
        _511 = _549;
        _497 = _555;
    }
    float _557 = _505;
    float _559 = _501;
    float _561 = _511;
    float _563 = _497;
    float _565 = _557 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _567 = _557 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_51.x = _459;
    out.m_51.y = _477;
    out.m_51.z = _457;
    float _569 = _477 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _571 = fma(_559, (*spvDescriptorSet0.vp_c4)._m0[0].x, _565);
    float _573 = fma(_559, (*spvDescriptorSet0.vp_c4)._m0[1].x, _567);
    float _575 = _477 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _577 = _477 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _579 = _477 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _581 = _477 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _583 = _477 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _585 = _477 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _587 = _477 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _589 = _477 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _591 = _477 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _593 = _477 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _595 = _477 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _597 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[42].x, _575);
    float _599 = fma(_561, (*spvDescriptorSet0.vp_c4)._m0[0].z, _571);
    float _601 = fma(_561, (*spvDescriptorSet0.vp_c4)._m0[1].z, _573);
    float _603 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[43].x, _569);
    float _605 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[44].x, _577);
    float _607 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[45].x, _579);
    float _609 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[46].x, _581);
    float _611 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[47].x, _583);
    float _613 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[48].x, _585);
    float _615 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[49].x, _587);
    float _617 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[50].x, _589);
    float _619 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[51].x, _591);
    float _621 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[52].x, _593);
    float _623 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[53].x, _595);
    float _625 = _601 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _627 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[43].z, _603);
    float _629 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[44].z, _605);
    float _631 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[42].z, _597);
    float _633 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[45].z, _607);
    float _635 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[46].z, _609);
    float _637 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[47].z, _611);
    float _639 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[48].z, _613);
    float _641 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[49].z, _615);
    float _643 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[50].z, _617);
    float _645 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[51].z, _619);
    float _647 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[52].z, _621);
    float _649 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[53].z, _623);
    float _651 = _625 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _653 = _625 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _655 = _625 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _657 = _599 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _659 = _625 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _661 = _631 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _663 = _627 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _665 = fma(_657, (*spvDescriptorSet0.vp_c4)._m0[7].x, _651);
    float _667 = fma(_657, (*spvDescriptorSet0.vp_c4)._m0[8].x, _653);
    float _669 = fma(_657, (*spvDescriptorSet0.vp_c4)._m0[9].x, _655);
    float _671 = fma(_657, (*spvDescriptorSet0.vp_c4)._m0[10].x, _659);
    float _673 = _629 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _675 = _633 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _677 = fma(_563, (*spvDescriptorSet0.vp_c4)._m0[7].z, _665);
    float _679 = fma(_563, (*spvDescriptorSet0.vp_c4)._m0[8].z, _667);
    float _681 = fma(_563, (*spvDescriptorSet0.vp_c4)._m0[9].z, _669);
    float _683 = fma(_563, (*spvDescriptorSet0.vp_c4)._m0[10].z, _671);
    float _685 = -_489;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _689 = _685 + _687;
    out.m_47.w = _475;
    float _691 = _645 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _693 = _647 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _695 = _649 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    out.m_53.x = _661;
    out.m_53.y = _663;
    out.m_53.z = _673;
    out.m_53.w = _675;
    float _697 = _689 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _699 = _677 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _701 = _679 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _703 = _643 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _705 = _681 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _707 = _683 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_43.w = _445;
    out.m_55.x = _703;
    out.m_55.y = _691;
    out.m_55.z = _693;
    out.m_55.w = _695;
    float _709 = _635 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _711 = _637 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _713 = _639 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _715 = _641 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    out.m_57.w = _489;
    out.m_59.x = _709;
    out.m_59.y = _711;
    out.m_59.z = _713;
    out.m_59.w = _715;
    out.m_49.w = _697;
    out.gl_Position.x = _699;
    out.gl_Position.y = _701;
    out.gl_Position.z = _705;
    out.gl_Position.w = _707;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _389 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = as_type<float>(in.m_29.x);
    float _75 = in.m_32.x;
    float _77 = in.m_32.y;
    float _79 = in.m_32.z;
    float _81 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _83 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _81;
    float _85 = in.m_34.x;
    float _87 = in.m_34.y;
    float _89 = in.m_34.z;
    float _91 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _93 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _91;
    float _95 = _83 * _83;
    float _97 = in.m_36.x;
    float _99 = in.m_36.y;
    float _101 = in.m_36.z;
    float _103 = fma(_93, _93, _95);
    int _106 = as_type<int>(_73) * 48;
    uint _109 = uint(int(uint(_106) >> uint(2)));
    uint _111 = uint(int(uint(int(_109)) >> uint(2)));
    int _113 = int(_109) & 3;
    float _115 = (*spvDescriptorSet0.vp_c5)._m0[int(_111)][_113];
    int _117 = int(_109) + 1;
    uint _119 = uint(int(uint(_117) >> uint(2)));
    int _121 = _117 & 3;
    float _123 = (*spvDescriptorSet0.vp_c5)._m0[int(_119)][_121];
    int _125 = _106 + 16;
    uint _127 = uint(int(uint(_125) >> uint(2)));
    uint _129 = uint(int(uint(int(_127)) >> uint(2)));
    int _131 = int(_127) & 3;
    float _133 = (*spvDescriptorSet0.vp_c5)._m0[int(_129)][_131];
    int _135 = int(_127) + 1;
    uint _137 = uint(int(uint(_135) >> uint(2)));
    int _139 = _135 & 3;
    float _141 = (*spvDescriptorSet0.vp_c5)._m0[int(_137)][_139];
    int _143 = _106 + 32;
    uint _145 = uint(int(uint(_143) >> uint(2)));
    uint _147 = uint(int(uint(int(_145)) >> uint(2)));
    int _149 = int(_145) & 3;
    float _151 = (*spvDescriptorSet0.vp_c5)._m0[int(_147)][_149];
    int _153 = int(_145) + 1;
    uint _155 = uint(int(uint(_153) >> uint(2)));
    int _157 = _153 & 3;
    float _159 = (*spvDescriptorSet0.vp_c5)._m0[int(_155)][_157];
    int _161 = _106 + 24;
    uint _163 = uint(int(uint(_161) >> uint(2)));
    uint _165 = uint(int(uint(int(_163)) >> uint(2)));
    int _167 = int(_163) & 3;
    float _169 = (*spvDescriptorSet0.vp_c5)._m0[int(_165)][_167];
    int _171 = int(_163) + 1;
    uint _173 = uint(int(uint(_171) >> uint(2)));
    int _175 = _171 & 3;
    float _177 = (*spvDescriptorSet0.vp_c5)._m0[int(_173)][_175];
    int _179 = _106 + 8;
    uint _181 = uint(int(uint(_179) >> uint(2)));
    uint _183 = uint(int(uint(int(_181)) >> uint(2)));
    int _185 = int(_181) & 3;
    float _187 = (*spvDescriptorSet0.vp_c5)._m0[int(_183)][_185];
    int _189 = int(_181) + 1;
    uint _191 = uint(int(uint(_189) >> uint(2)));
    int _193 = _189 & 3;
    float _195 = (*spvDescriptorSet0.vp_c5)._m0[int(_191)][_193];
    int _197 = _106 + 40;
    uint _199 = uint(int(uint(_197) >> uint(2)));
    uint _201 = uint(int(uint(int(_199)) >> uint(2)));
    int _203 = int(_199) & 3;
    float _205 = (*spvDescriptorSet0.vp_c5)._m0[int(_201)][_203];
    int _207 = int(_199) + 1;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    int _211 = _207 & 3;
    float _213 = (*spvDescriptorSet0.vp_c5)._m0[int(_209)][_211];
    float _215 = _77 * _123;
    float _217 = _87 * _123;
    float _219 = _99 * _123;
    float _221 = fma(_75, _115, _215);
    float _223 = fma(_85, _115, _217);
    float _225 = fma(_97, _115, _219);
    float _227 = _77 * _141;
    float _229 = _87 * _141;
    float _231 = _99 * _141;
    float _233 = fma(_75, _133, _227);
    float _235 = fma(_85, _133, _229);
    float _237 = fma(_97, _133, _231);
    float _239 = _77 * _159;
    float _241 = _87 * _159;
    float _243 = _99 * _159;
    float _245 = fma(_75, _151, _239);
    float _247 = fma(_85, _151, _241);
    float _249 = fma(_97, _151, _243);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _253 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _251;
    float _255 = fma(_89, _169, _235);
    float _257 = fma(_101, _169, _237);
    float _259 = fma(_79, _169, _233);
    float _261 = fma(_253, _253, _103);
    float _263 = _255 * _255;
    float _265 = _257 * _257;
    float _267 = _259 + _177;
    float _269 = fma(_89, _187, _223);
    float _271 = fma(_101, _187, _225);
    float _273 = sqrt(_261);
    float _275 = fma(_79, _187, _221);
    float _277 = fma(_269, _269, _263);
    float _279 = _267 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _281 = _267 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _283 = _275 + _195;
    float _285 = fma(_89, _205, _247);
    float _287 = fma(_101, _205, _249);
    float _289 = fma(_271, _271, _265);
    float _291 = fma(_79, _205, _245);
    float _293 = fma(_285, _285, _277);
    float _295 = _267 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _297 = fma(_287, _287, _289);
    float _299 = _291 + _213;
    float _301 = fma(_283, (*spvDescriptorSet0.vp_c6)._m0[4].x, _279);
    float _303 = fma(_283, (*spvDescriptorSet0.vp_c6)._m0[3].x, _295);
    float _305 = rsqrt(_293);
    bool _309 = _273 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _311 = isnan(_273);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _317 = _313 || _315;
    float _319 = fma(_283, (*spvDescriptorSet0.vp_c6)._m0[5].x, _281);
    float _321 = fma(_299, (*spvDescriptorSet0.vp_c6)._m0[3].z, _303);
    float _323 = fma(_299, (*spvDescriptorSet0.vp_c6)._m0[4].z, _301);
    float _325 = fma(_299, (*spvDescriptorSet0.vp_c6)._m0[5].z, _319);
    float _327 = rsqrt(_297);
    float _329 = _323 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _331 = _301;
    if (!_317)
    {
        _331 = 1.0;
    }
    float _333 = _331;
    float _335 = _269 * _305;
    float _337 = _255 * _305;
    float _339 = _285 * _305;
    float _341 = _321 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _343 = _271 * _327;
    float _345 = _257 * _327;
    float _347 = _287 * _327;
    float _349 = _325 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _351 = !_317;
    float _353 = _333;
    float _355 = _339;
    float _357 = _337;
    float _359 = _335;
    if (!_351)
    {
        bool _361 = _273 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _363 = isnan(_273);
        bool _365 = _361 || _363;
        bool _367 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _369 = _365 || _367;
        if (!_369)
        {
            float _371 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _373 = _273 + _371;
            float _375 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _377 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _375;
            float _379 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _381 = _379 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _383 = 1.0 / _377;
            float _385 = _373 * _383;
            float _387 = fma(_385, _381, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _353 = _387;
            _389 = true;
        }
        else
        {
            bool _391 = _273 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _393 = isnan(_273);
            bool _395 = _391 || _393;
            bool _397 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _399 = _395 || _397;
            if (!_399)
            {
                float _401 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _403 = _273 + _401;
                float _405 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _407 = _405 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _409 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _411 = _409 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _413 = 1.0 / _407;
                float _415 = _403 * _413;
                float _417 = fma(_415, _411, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _353 = _417;
                _389 = true;
            }
            else
            {
                _353 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _389 = false;
    float _419 = _353;
    float _421 = _419 + (-1.0);
    float _423 = in.m_38.x;
    float _425 = _421 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _427 = _421 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _429 = _421 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _431 = in.m_38.y;
    float _433 = fma(_329, _419, _425);
    float _435 = fma(_341, _419, _427);
    float _437 = fma(_349, _419, _429);
    float _439 = in.m_40.x;
    float _441 = _433 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _443 = _433 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _445 = in.m_36.w;
    float _447 = fma(_435, (*spvDescriptorSet0.vp_c6)._m0[2].x, _441);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c6)._m0[0].x, _443);
    float _451 = fma(_437, (*spvDescriptorSet0.vp_c6)._m0[2].z, _447);
    float _453 = fma(_437, (*spvDescriptorSet0.vp_c6)._m0[0].z, _449);
    float _455 = _433 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _457 = _451 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _459 = _453 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _461 = fma(_435, (*spvDescriptorSet0.vp_c6)._m0[1].x, _455);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _465 = _457 + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _469 = _459 + _467;
    float _471 = fma(_437, (*spvDescriptorSet0.vp_c6)._m0[1].z, _461);
    float _473 = _465 * _465;
    float _475 = in.m_40.y;
    float _477 = _471 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _479 = fma(_469, _469, _473);
    out.m_43.x = _343;
    out.m_43.y = _345;
    out.m_43.z = _347;
    float _481 = _477 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _483 = sqrt(_479);
    out.m_45.x = _423;
    float _485 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[2].x, _481);
    out.m_45.y = _431;
    float _487 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[2].z, _485);
    out.m_47.z = _439;
    float _489 = _487 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    out.m_49.x = _335;
    out.m_49.y = _337;
    out.m_49.z = _339;
    bool _491 = _483 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _493 = _433;
    if (!_491)
    {
        _493 = _489;
    }
    float _495 = _493;
    float _497 = _495;
    if (!_491)
    {
        _355 = _459;
    }
    float _499 = _355;
    float _501 = _499;
    if (!_491)
    {
        _357 = _477;
    }
    float _503 = _357;
    float _505 = _503;
    if (!_491)
    {
        _359 = _457;
    }
    float _507 = _359;
    bool _509 = !_491;
    float _511 = _507;
    if (!_509)
    {
        float _513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _515 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _517 = _483 + _515;
        float _519 = _477 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _521 = rsqrt(_479);
        float _523 = _517 * _513;
        float _525 = _523 * 0.15915493667125701904296875;
        float _527 = _525 * 6.283185482025146484375;
        float _529 = cos(_527);
        float _531 = _525 * 6.283185482025146484375;
        float _533 = sin(_531);
        float _535 = _529 + (-1.0);
        float _537 = _535 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _539 = fma(_533, _519, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _541 = fma(_477, _529, _537);
        float _543 = _521 * _539;
        float _545 = _541 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _547 = fma(_469, _543, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _549 = fma(_465, _543, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _551 = fma(_547, (*spvDescriptorSet0.vp_c4)._m0[2].x, _545);
        float _553 = fma(_549, (*spvDescriptorSet0.vp_c4)._m0[2].z, _551);
        float _555 = _553 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _505 = _541;
        _501 = _547;
        _511 = _549;
        _497 = _555;
    }
    float _557 = _505;
    float _559 = _501;
    float _561 = _511;
    float _563 = _497;
    float _565 = _557 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _567 = _557 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_51.x = _459;
    out.m_51.y = _477;
    out.m_51.z = _457;
    float _569 = _477 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _571 = fma(_559, (*spvDescriptorSet0.vp_c4)._m0[0].x, _565);
    float _573 = fma(_559, (*spvDescriptorSet0.vp_c4)._m0[1].x, _567);
    float _575 = _477 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _577 = _477 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _579 = _477 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _581 = _477 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _583 = _477 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _585 = _477 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _587 = _477 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _589 = _477 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _591 = _477 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _593 = _477 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _595 = _477 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _597 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[42].x, _575);
    float _599 = fma(_561, (*spvDescriptorSet0.vp_c4)._m0[0].z, _571);
    float _601 = fma(_561, (*spvDescriptorSet0.vp_c4)._m0[1].z, _573);
    float _603 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[43].x, _569);
    float _605 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[44].x, _577);
    float _607 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[45].x, _579);
    float _609 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[46].x, _581);
    float _611 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[47].x, _583);
    float _613 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[48].x, _585);
    float _615 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[49].x, _587);
    float _617 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[50].x, _589);
    float _619 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[51].x, _591);
    float _621 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[52].x, _593);
    float _623 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[53].x, _595);
    float _625 = _601 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _627 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[43].z, _603);
    float _629 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[44].z, _605);
    float _631 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[42].z, _597);
    float _633 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[45].z, _607);
    float _635 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[46].z, _609);
    float _637 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[47].z, _611);
    float _639 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[48].z, _613);
    float _641 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[49].z, _615);
    float _643 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[50].z, _617);
    float _645 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[51].z, _619);
    float _647 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[52].z, _621);
    float _649 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[53].z, _623);
    float _651 = _625 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _653 = _625 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _655 = _625 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _657 = _599 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _659 = _625 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _661 = _631 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _663 = _627 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _665 = fma(_657, (*spvDescriptorSet0.vp_c4)._m0[7].x, _651);
    float _667 = fma(_657, (*spvDescriptorSet0.vp_c4)._m0[8].x, _653);
    float _669 = fma(_657, (*spvDescriptorSet0.vp_c4)._m0[9].x, _655);
    float _671 = fma(_657, (*spvDescriptorSet0.vp_c4)._m0[10].x, _659);
    float _673 = _629 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _675 = _633 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _677 = fma(_563, (*spvDescriptorSet0.vp_c4)._m0[7].z, _665);
    float _679 = fma(_563, (*spvDescriptorSet0.vp_c4)._m0[8].z, _667);
    float _681 = fma(_563, (*spvDescriptorSet0.vp_c4)._m0[9].z, _669);
    float _683 = fma(_563, (*spvDescriptorSet0.vp_c4)._m0[10].z, _671);
    float _685 = -_489;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _689 = _685 + _687;
    out.m_47.w = _475;
    float _691 = _645 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _693 = _647 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _695 = _649 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    out.m_53.x = _661;
    out.m_53.y = _663;
    out.m_53.z = _673;
    out.m_53.w = _675;
    float _697 = _689 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _699 = _677 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _701 = _679 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _703 = _643 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _705 = _681 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _707 = _683 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_43.w = _445;
    out.m_55.x = _703;
    out.m_55.y = _691;
    out.m_55.z = _693;
    out.m_55.w = _695;
    float _709 = _635 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _711 = _637 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _713 = _639 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _715 = _641 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    out.m_57.w = _489;
    out.m_59.x = _709;
    out.m_59.y = _711;
    out.m_59.z = _713;
    out.m_59.w = _715;
    out.m_49.w = _697;
    out.gl_Position.x = _699;
    out.gl_Position.y = _701;
    out.gl_Position.z = _705;
    out.gl_Position.w = _707;
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _389 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = as_type<float>(in.m_29.x);
    float _75 = in.m_32.x;
    float _77 = in.m_32.y;
    float _79 = in.m_32.z;
    float _81 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _83 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _81;
    float _85 = in.m_34.x;
    float _87 = in.m_34.y;
    float _89 = in.m_34.z;
    float _91 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _93 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _91;
    float _95 = _83 * _83;
    float _97 = in.m_36.x;
    float _99 = in.m_36.y;
    float _101 = in.m_36.z;
    float _103 = fma(_93, _93, _95);
    int _106 = as_type<int>(_73) * 48;
    uint _109 = uint(int(uint(_106) >> uint(2)));
    uint _111 = uint(int(uint(int(_109)) >> uint(2)));
    int _113 = int(_109) & 3;
    float _115 = (*spvDescriptorSet0.vp_c5)._m0[int(_111)][_113];
    int _117 = int(_109) + 1;
    uint _119 = uint(int(uint(_117) >> uint(2)));
    int _121 = _117 & 3;
    float _123 = (*spvDescriptorSet0.vp_c5)._m0[int(_119)][_121];
    int _125 = _106 + 16;
    uint _127 = uint(int(uint(_125) >> uint(2)));
    uint _129 = uint(int(uint(int(_127)) >> uint(2)));
    int _131 = int(_127) & 3;
    float _133 = (*spvDescriptorSet0.vp_c5)._m0[int(_129)][_131];
    int _135 = int(_127) + 1;
    uint _137 = uint(int(uint(_135) >> uint(2)));
    int _139 = _135 & 3;
    float _141 = (*spvDescriptorSet0.vp_c5)._m0[int(_137)][_139];
    int _143 = _106 + 32;
    uint _145 = uint(int(uint(_143) >> uint(2)));
    uint _147 = uint(int(uint(int(_145)) >> uint(2)));
    int _149 = int(_145) & 3;
    float _151 = (*spvDescriptorSet0.vp_c5)._m0[int(_147)][_149];
    int _153 = int(_145) + 1;
    uint _155 = uint(int(uint(_153) >> uint(2)));
    int _157 = _153 & 3;
    float _159 = (*spvDescriptorSet0.vp_c5)._m0[int(_155)][_157];
    int _161 = _106 + 24;
    uint _163 = uint(int(uint(_161) >> uint(2)));
    uint _165 = uint(int(uint(int(_163)) >> uint(2)));
    int _167 = int(_163) & 3;
    float _169 = (*spvDescriptorSet0.vp_c5)._m0[int(_165)][_167];
    int _171 = int(_163) + 1;
    uint _173 = uint(int(uint(_171) >> uint(2)));
    int _175 = _171 & 3;
    float _177 = (*spvDescriptorSet0.vp_c5)._m0[int(_173)][_175];
    int _179 = _106 + 8;
    uint _181 = uint(int(uint(_179) >> uint(2)));
    uint _183 = uint(int(uint(int(_181)) >> uint(2)));
    int _185 = int(_181) & 3;
    float _187 = (*spvDescriptorSet0.vp_c5)._m0[int(_183)][_185];
    int _189 = int(_181) + 1;
    uint _191 = uint(int(uint(_189) >> uint(2)));
    int _193 = _189 & 3;
    float _195 = (*spvDescriptorSet0.vp_c5)._m0[int(_191)][_193];
    int _197 = _106 + 40;
    uint _199 = uint(int(uint(_197) >> uint(2)));
    uint _201 = uint(int(uint(int(_199)) >> uint(2)));
    int _203 = int(_199) & 3;
    float _205 = (*spvDescriptorSet0.vp_c5)._m0[int(_201)][_203];
    int _207 = int(_199) + 1;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    int _211 = _207 & 3;
    float _213 = (*spvDescriptorSet0.vp_c5)._m0[int(_209)][_211];
    float _215 = _77 * _123;
    float _217 = _87 * _123;
    float _219 = _99 * _123;
    float _221 = fma(_75, _115, _215);
    float _223 = fma(_85, _115, _217);
    float _225 = fma(_97, _115, _219);
    float _227 = _77 * _141;
    float _229 = _87 * _141;
    float _231 = _99 * _141;
    float _233 = fma(_75, _133, _227);
    float _235 = fma(_85, _133, _229);
    float _237 = fma(_97, _133, _231);
    float _239 = _77 * _159;
    float _241 = _87 * _159;
    float _243 = _99 * _159;
    float _245 = fma(_75, _151, _239);
    float _247 = fma(_85, _151, _241);
    float _249 = fma(_97, _151, _243);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _253 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _251;
    float _255 = fma(_89, _169, _235);
    float _257 = fma(_101, _169, _237);
    float _259 = fma(_79, _169, _233);
    float _261 = fma(_253, _253, _103);
    float _263 = _255 * _255;
    float _265 = _257 * _257;
    float _267 = _259 + _177;
    float _269 = fma(_89, _187, _223);
    float _271 = fma(_101, _187, _225);
    float _273 = sqrt(_261);
    float _275 = fma(_79, _187, _221);
    float _277 = fma(_269, _269, _263);
    float _279 = _267 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _281 = _267 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _283 = _275 + _195;
    float _285 = fma(_89, _205, _247);
    float _287 = fma(_101, _205, _249);
    float _289 = fma(_271, _271, _265);
    float _291 = fma(_79, _205, _245);
    float _293 = fma(_285, _285, _277);
    float _295 = _267 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _297 = fma(_287, _287, _289);
    float _299 = _291 + _213;
    float _301 = fma(_283, (*spvDescriptorSet0.vp_c6)._m0[4].x, _279);
    float _303 = fma(_283, (*spvDescriptorSet0.vp_c6)._m0[3].x, _295);
    float _305 = rsqrt(_293);
    bool _309 = _273 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _311 = isnan(_273);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _317 = _313 || _315;
    float _319 = fma(_283, (*spvDescriptorSet0.vp_c6)._m0[5].x, _281);
    float _321 = fma(_299, (*spvDescriptorSet0.vp_c6)._m0[3].z, _303);
    float _323 = fma(_299, (*spvDescriptorSet0.vp_c6)._m0[4].z, _301);
    float _325 = fma(_299, (*spvDescriptorSet0.vp_c6)._m0[5].z, _319);
    float _327 = rsqrt(_297);
    float _329 = _323 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _331 = _301;
    if (!_317)
    {
        _331 = 1.0;
    }
    float _333 = _331;
    float _335 = _269 * _305;
    float _337 = _255 * _305;
    float _339 = _285 * _305;
    float _341 = _321 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _343 = _271 * _327;
    float _345 = _257 * _327;
    float _347 = _287 * _327;
    float _349 = _325 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _351 = !_317;
    float _353 = _333;
    float _355 = _339;
    float _357 = _337;
    float _359 = _335;
    if (!_351)
    {
        bool _361 = _273 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _363 = isnan(_273);
        bool _365 = _361 || _363;
        bool _367 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _369 = _365 || _367;
        if (!_369)
        {
            float _371 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _373 = _273 + _371;
            float _375 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _377 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _375;
            float _379 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _381 = _379 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _383 = 1.0 / _377;
            float _385 = _373 * _383;
            float _387 = fma(_385, _381, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _353 = _387;
            _389 = true;
        }
        else
        {
            bool _391 = _273 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _393 = isnan(_273);
            bool _395 = _391 || _393;
            bool _397 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _399 = _395 || _397;
            if (!_399)
            {
                float _401 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _403 = _273 + _401;
                float _405 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _407 = _405 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _409 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _411 = _409 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _413 = 1.0 / _407;
                float _415 = _403 * _413;
                float _417 = fma(_415, _411, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _353 = _417;
                _389 = true;
            }
            else
            {
                _353 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _389 = false;
    float _419 = _353;
    float _421 = _419 + (-1.0);
    float _423 = in.m_38.x;
    float _425 = _421 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _427 = _421 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _429 = _421 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _431 = in.m_38.y;
    float _433 = fma(_329, _419, _425);
    float _435 = fma(_341, _419, _427);
    float _437 = fma(_349, _419, _429);
    float _439 = in.m_40.x;
    float _441 = _433 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _443 = _433 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _445 = in.m_36.w;
    float _447 = fma(_435, (*spvDescriptorSet0.vp_c6)._m0[2].x, _441);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c6)._m0[0].x, _443);
    float _451 = fma(_437, (*spvDescriptorSet0.vp_c6)._m0[2].z, _447);
    float _453 = fma(_437, (*spvDescriptorSet0.vp_c6)._m0[0].z, _449);
    float _455 = _433 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _457 = _451 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _459 = _453 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _461 = fma(_435, (*spvDescriptorSet0.vp_c6)._m0[1].x, _455);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _465 = _457 + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _469 = _459 + _467;
    float _471 = fma(_437, (*spvDescriptorSet0.vp_c6)._m0[1].z, _461);
    float _473 = _465 * _465;
    float _475 = in.m_40.y;
    float _477 = _471 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _479 = fma(_469, _469, _473);
    out.m_43.x = _343;
    out.m_43.y = _345;
    out.m_43.z = _347;
    float _481 = _477 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _483 = sqrt(_479);
    out.m_45.x = _423;
    float _485 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[2].x, _481);
    out.m_45.y = _431;
    float _487 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[2].z, _485);
    out.m_47.z = _439;
    float _489 = _487 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    out.m_49.x = _335;
    out.m_49.y = _337;
    out.m_49.z = _339;
    bool _491 = _483 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _493 = _433;
    if (!_491)
    {
        _493 = _489;
    }
    float _495 = _493;
    float _497 = _495;
    if (!_491)
    {
        _355 = _459;
    }
    float _499 = _355;
    float _501 = _499;
    if (!_491)
    {
        _357 = _477;
    }
    float _503 = _357;
    float _505 = _503;
    if (!_491)
    {
        _359 = _457;
    }
    float _507 = _359;
    bool _509 = !_491;
    float _511 = _507;
    if (!_509)
    {
        float _513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _515 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _517 = _483 + _515;
        float _519 = _477 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _521 = rsqrt(_479);
        float _523 = _517 * _513;
        float _525 = _523 * 0.15915493667125701904296875;
        float _527 = _525 * 6.283185482025146484375;
        float _529 = cos(_527);
        float _531 = _525 * 6.283185482025146484375;
        float _533 = sin(_531);
        float _535 = _529 + (-1.0);
        float _537 = _535 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _539 = fma(_533, _519, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _541 = fma(_477, _529, _537);
        float _543 = _521 * _539;
        float _545 = _541 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _547 = fma(_469, _543, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _549 = fma(_465, _543, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _551 = fma(_547, (*spvDescriptorSet0.vp_c4)._m0[2].x, _545);
        float _553 = fma(_549, (*spvDescriptorSet0.vp_c4)._m0[2].z, _551);
        float _555 = _553 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _505 = _541;
        _501 = _547;
        _511 = _549;
        _497 = _555;
    }
    float _557 = _505;
    float _559 = _501;
    float _561 = _511;
    float _563 = _497;
    float _565 = _557 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _567 = _557 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_51.x = _459;
    out.m_51.y = _477;
    out.m_51.z = _457;
    float _569 = _477 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _571 = fma(_559, (*spvDescriptorSet0.vp_c4)._m0[0].x, _565);
    float _573 = fma(_559, (*spvDescriptorSet0.vp_c4)._m0[1].x, _567);
    float _575 = _477 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _577 = _477 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _579 = _477 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _581 = _477 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _583 = _477 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _585 = _477 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _587 = _477 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _589 = _477 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _591 = _477 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _593 = _477 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _595 = _477 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _597 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[42].x, _575);
    float _599 = fma(_561, (*spvDescriptorSet0.vp_c4)._m0[0].z, _571);
    float _601 = fma(_561, (*spvDescriptorSet0.vp_c4)._m0[1].z, _573);
    float _603 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[43].x, _569);
    float _605 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[44].x, _577);
    float _607 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[45].x, _579);
    float _609 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[46].x, _581);
    float _611 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[47].x, _583);
    float _613 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[48].x, _585);
    float _615 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[49].x, _587);
    float _617 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[50].x, _589);
    float _619 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[51].x, _591);
    float _621 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[52].x, _593);
    float _623 = fma(_459, (*spvDescriptorSet0.vp_c4)._m0[53].x, _595);
    float _625 = _601 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _627 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[43].z, _603);
    float _629 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[44].z, _605);
    float _631 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[42].z, _597);
    float _633 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[45].z, _607);
    float _635 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[46].z, _609);
    float _637 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[47].z, _611);
    float _639 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[48].z, _613);
    float _641 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[49].z, _615);
    float _643 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[50].z, _617);
    float _645 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[51].z, _619);
    float _647 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[52].z, _621);
    float _649 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[53].z, _623);
    float _651 = _625 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _653 = _625 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _655 = _625 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _657 = _599 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _659 = _625 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _661 = _631 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _663 = _627 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _665 = fma(_657, (*spvDescriptorSet0.vp_c4)._m0[7].x, _651);
    float _667 = fma(_657, (*spvDescriptorSet0.vp_c4)._m0[8].x, _653);
    float _669 = fma(_657, (*spvDescriptorSet0.vp_c4)._m0[9].x, _655);
    float _671 = fma(_657, (*spvDescriptorSet0.vp_c4)._m0[10].x, _659);
    float _673 = _629 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _675 = _633 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _677 = fma(_563, (*spvDescriptorSet0.vp_c4)._m0[7].z, _665);
    float _679 = fma(_563, (*spvDescriptorSet0.vp_c4)._m0[8].z, _667);
    float _681 = fma(_563, (*spvDescriptorSet0.vp_c4)._m0[9].z, _669);
    float _683 = fma(_563, (*spvDescriptorSet0.vp_c4)._m0[10].z, _671);
    float _685 = -_489;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _689 = _685 + _687;
    out.m_47.w = _475;
    float _691 = _645 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _693 = _647 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _695 = _649 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    out.m_53.x = _661;
    out.m_53.y = _663;
    out.m_53.z = _673;
    out.m_53.w = _675;
    float _697 = _689 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _699 = _677 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _701 = _679 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _703 = _643 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _705 = _681 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _707 = _683 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_43.w = _445;
    out.m_55.x = _703;
    out.m_55.y = _691;
    out.m_55.z = _693;
    out.m_55.w = _695;
    float _709 = _635 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _711 = _637 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _713 = _639 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _715 = _641 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    out.m_57.w = _489;
    out.m_59.x = _709;
    out.m_59.y = _711;
    out.m_59.z = _713;
    out.m_59.w = _715;
    out.m_49.w = _697;
    out.gl_Position.x = _699;
    out.gl_Position.y = _701;
    out.gl_Position.z = _705;
    out.gl_Position.w = _707;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

