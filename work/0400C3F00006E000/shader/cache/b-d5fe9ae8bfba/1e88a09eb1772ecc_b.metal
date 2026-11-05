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
    float4 m_55 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_49 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_34 [[attribute(0)]];
    float4 m_38 [[attribute(1)]];
    uint4 m_31 [[attribute(6)]];
    float4 m_40 [[attribute(8)]];
    float4 m_42 [[attribute(9)]];
    float4 m_36 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    bool _385 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = as_type<float>(in.m_31.x);
    float _77 = in.m_34.x;
    float _79 = in.m_34.y;
    float _81 = in.m_34.z;
    float _83 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _85 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _83;
    float _87 = in.m_36.x;
    float _89 = in.m_36.y;
    float _91 = in.m_36.z;
    float _93 = in.m_36.w;
    float _95 = in.m_38.x;
    float _97 = in.m_38.y;
    float _99 = in.m_38.z;
    int _102 = as_type<int>(_75) * 48;
    uint _105 = uint(int(uint(_102) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.vp_c5)._m0[int(_107)][_109];
    int _113 = int(_105) + 1;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    int _117 = _113 & 3;
    float _119 = (*spvDescriptorSet0.vp_c5)._m0[int(_115)][_117];
    float _121 = _81 + (-0.2599999904632568359375);
    float _123 = _93 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _125 = _121 * _121;
    float _127 = _91 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _129 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _131 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _129;
    int _133 = _102 + 16;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    uint _137 = uint(int(uint(int(_135)) >> uint(2)));
    int _139 = int(_135) & 3;
    float _141 = (*spvDescriptorSet0.vp_c5)._m0[int(_137)][_139];
    int _143 = int(_135) + 1;
    uint _145 = uint(int(uint(_143) >> uint(2)));
    int _147 = _143 & 3;
    float _149 = (*spvDescriptorSet0.vp_c5)._m0[int(_145)][_147];
    float _151 = fma(_77, _77, _125);
    float _153 = _85 * _85;
    float _155 = fma(_89, (*spvDescriptorSet0.vp_c11)._m0[21].y, _123);
    float _157 = fma(_87, (*spvDescriptorSet0.vp_c11)._m0[21].x, _127);
    float _159 = fma(_131, _131, _153);
    float _161 = rsqrt(_151);
    int _163 = _102 + 32;
    uint _165 = uint(int(uint(_163) >> uint(2)));
    uint _167 = uint(int(uint(int(_165)) >> uint(2)));
    int _169 = int(_165) & 3;
    float _171 = (*spvDescriptorSet0.vp_c5)._m0[int(_167)][_169];
    int _173 = int(_165) + 1;
    uint _175 = uint(int(uint(_173) >> uint(2)));
    int _177 = _173 & 3;
    float _179 = (*spvDescriptorSet0.vp_c5)._m0[int(_175)][_177];
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _183 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _181;
    float _185 = _155 + _79;
    float _187 = fma(_183, _183, _159);
    int _189 = _102 + 24;
    uint _191 = uint(int(uint(_189) >> uint(2)));
    uint _193 = uint(int(uint(int(_191)) >> uint(2)));
    int _195 = int(_191) & 3;
    float _197 = (*spvDescriptorSet0.vp_c5)._m0[int(_193)][_195];
    int _199 = int(_191) + 1;
    uint _201 = uint(int(uint(_199) >> uint(2)));
    int _203 = _199 & 3;
    float _205 = (*spvDescriptorSet0.vp_c5)._m0[int(_201)][_203];
    int _207 = _102 + 8;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    uint _211 = uint(int(uint(int(_209)) >> uint(2)));
    int _213 = int(_209) & 3;
    float _215 = (*spvDescriptorSet0.vp_c5)._m0[int(_211)][_213];
    int _217 = int(_209) + 1;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    int _221 = _217 & 3;
    float _223 = (*spvDescriptorSet0.vp_c5)._m0[int(_219)][_221];
    int _225 = _102 + 40;
    uint _227 = uint(int(uint(_225) >> uint(2)));
    uint _229 = uint(int(uint(int(_227)) >> uint(2)));
    int _231 = int(_227) & 3;
    float _233 = (*spvDescriptorSet0.vp_c5)._m0[int(_229)][_231];
    int _235 = int(_227) + 1;
    uint _237 = uint(int(uint(_235) >> uint(2)));
    int _239 = _235 & 3;
    float _241 = (*spvDescriptorSet0.vp_c5)._m0[int(_237)][_239];
    float _243 = _97 * _119;
    float _245 = _185 * _119;
    float _247 = fma(_95, _111, _243);
    float _249 = _97 * _149;
    float _251 = fma(_95, _141, _249);
    float _253 = _97 * _179;
    float _255 = _185 * _179;
    float _257 = fma(_95, _171, _253);
    float _259 = _121 * _161;
    float _261 = _161 * _77;
    float _263 = sqrt(_187);
    float _265 = fma(_99, _197, _251);
    float _267 = _185 * _149;
    float _269 = fma(_261, _157, _77);
    float _271 = fma(_259, _127, _81);
    float _273 = _265 * _265;
    float _275 = fma(_269, _141, _267);
    float _277 = fma(_269, _111, _245);
    float _279 = fma(_99, _215, _247);
    float _281 = fma(_269, _171, _255);
    float _283 = fma(_271, _197, _275);
    float _285 = fma(_271, _215, _277);
    float _287 = fma(_279, _279, _273);
    float _289 = _283 + _205;
    bool _293 = _263 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _295 = isnan(_263);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _301 = _297 || _299;
    float _303 = fma(_99, _233, _257);
    float _305 = fma(_271, _233, _281);
    float _307 = _285 + _223;
    float _309 = _289 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _311 = fma(_303, _303, _287);
    float _313 = _289 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _315 = _289 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _317 = _305 + _241;
    float _319 = rsqrt(_311);
    float _321 = fma(_307, (*spvDescriptorSet0.vp_c6)._m0[3].x, _309);
    float _323 = fma(_307, (*spvDescriptorSet0.vp_c6)._m0[4].x, _313);
    float _325 = fma(_307, (*spvDescriptorSet0.vp_c6)._m0[5].x, _315);
    float _327 = fma(_317, (*spvDescriptorSet0.vp_c6)._m0[3].z, _321);
    float _329 = fma(_317, (*spvDescriptorSet0.vp_c6)._m0[5].z, _325);
    float _331 = fma(_317, (*spvDescriptorSet0.vp_c6)._m0[4].z, _323);
    float _333 = _323;
    float _335 = _79;
    float _337 = _77;
    if (!_301)
    {
        _333 = 1.0;
    }
    float _339 = _333;
    float _341 = _327 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _343 = _329 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    float _345 = _279 * _319;
    float _347 = _265 * _319;
    float _349 = _303 * _319;
    float _351 = _331 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    bool _353 = !_301;
    float _355 = _339;
    if (!_353)
    {
        bool _357 = _263 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _359 = isnan(_263);
        bool _361 = _357 || _359;
        bool _363 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _365 = _361 || _363;
        if (!_365)
        {
            float _367 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _369 = _263 + _367;
            float _371 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _373 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _371;
            float _375 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _377 = _375 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _379 = 1.0 / _373;
            float _381 = _369 * _379;
            float _383 = fma(_381, _377, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _355 = _383;
            _385 = true;
        }
        else
        {
            bool _387 = _263 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _389 = isnan(_263);
            bool _391 = _387 || _389;
            bool _393 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _395 = _391 || _393;
            if (!_395)
            {
                float _397 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _399 = _263 + _397;
                float _401 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _403 = _401 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _405 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _407 = _405 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _409 = 1.0 / _403;
                float _411 = _399 * _409;
                float _413 = fma(_411, _407, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _355 = _413;
                _385 = true;
            }
            else
            {
                _355 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _385 = false;
    float _415 = _355;
    float _417 = _415 + (-1.0);
    float _419 = in.m_40.x;
    float _421 = _417 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _423 = _417 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _425 = _417 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _427 = in.m_40.y;
    float _429 = fma(_351, _415, _421);
    float _431 = fma(_341, _415, _423);
    float _433 = fma(_343, _415, _425);
    float _435 = in.m_42.y;
    float _437 = _429 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _439 = _429 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _441 = _429 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _443 = fma(_431, (*spvDescriptorSet0.vp_c6)._m0[2].x, _437);
    float _445 = fma(_431, (*spvDescriptorSet0.vp_c6)._m0[0].x, _439);
    float _447 = fma(_431, (*spvDescriptorSet0.vp_c6)._m0[1].x, _441);
    float _449 = fma(_433, (*spvDescriptorSet0.vp_c6)._m0[2].z, _443);
    float _451 = fma(_433, (*spvDescriptorSet0.vp_c6)._m0[0].z, _445);
    float _453 = fma(_433, (*spvDescriptorSet0.vp_c6)._m0[1].z, _447);
    float _455 = _449 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _457 = _451 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _459 = _453 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _461 = in.m_42.x;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _465 = _455 + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _469 = _457 + _467;
    float _471 = _459 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    out.m_45.x = _345;
    out.m_45.y = _347;
    out.m_45.z = _349;
    float _473 = _465 * _465;
    float _475 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[2].x, _471);
    out.m_47.x = _419;
    float _477 = fma(_469, _469, _473);
    float _479 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[2].z, _475);
    out.m_47.y = _427;
    float _481 = sqrt(_477);
    float _483 = _479 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    out.m_49.x = _77;
    out.m_49.y = _79;
    out.m_49.z = _81;
    bool _485 = _481 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _487 = _429;
    float _489 = _473;
    if (!_485)
    {
        _487 = _483;
    }
    float _491 = _487;
    float _493 = _491;
    if (!_485)
    {
        _489 = _457;
    }
    float _495 = _489;
    float _497 = _495;
    if (!_485)
    {
        _335 = _459;
    }
    float _499 = _335;
    float _501 = _499;
    if (!_485)
    {
        _337 = _455;
    }
    float _503 = _337;
    bool _505 = !_485;
    float _507 = _503;
    if (!_505)
    {
        float _509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _511 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _513 = _481 + _511;
        float _515 = _459 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _517 = rsqrt(_477);
        float _519 = _513 * _509;
        float _521 = _519 * 0.15915493667125701904296875;
        float _523 = _521 * 6.283185482025146484375;
        float _525 = cos(_523);
        float _527 = _521 * 6.283185482025146484375;
        float _529 = sin(_527);
        float _531 = _525 + (-1.0);
        float _533 = _531 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _535 = fma(_529, _515, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _537 = fma(_459, _525, _533);
        float _539 = _517 * _535;
        float _541 = _537 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _543 = fma(_469, _539, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _545 = fma(_465, _539, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _547 = fma(_543, (*spvDescriptorSet0.vp_c4)._m0[2].x, _541);
        float _549 = fma(_545, (*spvDescriptorSet0.vp_c4)._m0[2].z, _547);
        float _551 = _549 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _501 = _537;
        _497 = _543;
        _507 = _545;
        _493 = _551;
    }
    float _553 = _501;
    float _555 = _497;
    float _557 = _507;
    float _559 = _493;
    float _561 = _553 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _563 = _553 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_51.x = _457;
    out.m_51.y = _459;
    out.m_51.z = _455;
    float _565 = _459 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _567 = fma(_555, (*spvDescriptorSet0.vp_c4)._m0[0].x, _561);
    float _569 = fma(_555, (*spvDescriptorSet0.vp_c4)._m0[1].x, _563);
    float _571 = _459 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _573 = _459 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _575 = _459 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _577 = _459 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _579 = _459 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _581 = _459 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _583 = _459 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _585 = _459 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _587 = _459 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _589 = _459 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _591 = _459 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _593 = fma(_557, (*spvDescriptorSet0.vp_c4)._m0[0].z, _567);
    float _595 = fma(_557, (*spvDescriptorSet0.vp_c4)._m0[1].z, _569);
    float _597 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[42].x, _571);
    float _599 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[43].x, _565);
    float _601 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[44].x, _573);
    float _603 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[45].x, _575);
    float _605 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[46].x, _577);
    float _607 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[47].x, _579);
    float _609 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[48].x, _581);
    float _611 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[49].x, _583);
    float _613 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[50].x, _585);
    float _615 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[51].x, _587);
    float _617 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[52].x, _589);
    float _619 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[53].x, _591);
    float _621 = _595 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _623 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[42].z, _597);
    float _625 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[43].z, _599);
    float _627 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[44].z, _601);
    float _629 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[45].z, _603);
    float _631 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[46].z, _605);
    float _633 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[47].z, _607);
    float _635 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[48].z, _609);
    float _637 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[49].z, _611);
    float _639 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[50].z, _613);
    float _641 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[51].z, _615);
    float _643 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[52].z, _617);
    float _645 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[53].z, _619);
    float _647 = _621 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _649 = _621 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _651 = _621 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _653 = _593 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _655 = _621 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _657 = _623 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _659 = _625 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _661 = fma(_653, (*spvDescriptorSet0.vp_c4)._m0[7].x, _647);
    float _663 = fma(_653, (*spvDescriptorSet0.vp_c4)._m0[8].x, _649);
    float _665 = fma(_653, (*spvDescriptorSet0.vp_c4)._m0[9].x, _651);
    float _667 = fma(_653, (*spvDescriptorSet0.vp_c4)._m0[10].x, _655);
    float _669 = _627 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _671 = _629 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _673 = fma(_559, (*spvDescriptorSet0.vp_c4)._m0[7].z, _661);
    float _675 = fma(_559, (*spvDescriptorSet0.vp_c4)._m0[8].z, _663);
    float _677 = fma(_559, (*spvDescriptorSet0.vp_c4)._m0[9].z, _665);
    float _679 = fma(_559, (*spvDescriptorSet0.vp_c4)._m0[10].z, _667);
    float _681 = -_483;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _685 = _681 + _683;
    out.m_53.z = _461;
    float _687 = _641 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _689 = _643 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _691 = _645 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    out.m_55.x = _657;
    out.m_55.y = _659;
    out.m_55.z = _669;
    out.m_55.w = _671;
    float _693 = _685 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _695 = _673 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _697 = _675 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _699 = _639 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _701 = _677 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _703 = _679 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_53.w = _435;
    out.m_57.x = _699;
    out.m_57.y = _687;
    out.m_57.z = _689;
    out.m_57.w = _691;
    float _705 = _631 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _707 = _633 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _709 = _635 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _711 = _637 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    out.m_59.w = _483;
    out.m_61.x = _705;
    out.m_61.y = _707;
    out.m_61.z = _709;
    out.m_61.w = _711;
    out.m_45.w = _693;
    out.gl_Position.x = _695;
    out.gl_Position.y = _697;
    out.gl_Position.z = _701;
    out.gl_Position.w = _703;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    bool _385 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = as_type<float>(in.m_31.x);
    float _77 = in.m_34.x;
    float _79 = in.m_34.y;
    float _81 = in.m_34.z;
    float _83 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _85 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _83;
    float _87 = in.m_36.x;
    float _89 = in.m_36.y;
    float _91 = in.m_36.z;
    float _93 = in.m_36.w;
    float _95 = in.m_38.x;
    float _97 = in.m_38.y;
    float _99 = in.m_38.z;
    int _102 = as_type<int>(_75) * 48;
    uint _105 = uint(int(uint(_102) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.vp_c5)._m0[int(_107)][_109];
    int _113 = int(_105) + 1;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    int _117 = _113 & 3;
    float _119 = (*spvDescriptorSet0.vp_c5)._m0[int(_115)][_117];
    float _121 = _81 + (-0.2599999904632568359375);
    float _123 = _93 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _125 = _121 * _121;
    float _127 = _91 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _129 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _131 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _129;
    int _133 = _102 + 16;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    uint _137 = uint(int(uint(int(_135)) >> uint(2)));
    int _139 = int(_135) & 3;
    float _141 = (*spvDescriptorSet0.vp_c5)._m0[int(_137)][_139];
    int _143 = int(_135) + 1;
    uint _145 = uint(int(uint(_143) >> uint(2)));
    int _147 = _143 & 3;
    float _149 = (*spvDescriptorSet0.vp_c5)._m0[int(_145)][_147];
    float _151 = fma(_77, _77, _125);
    float _153 = _85 * _85;
    float _155 = fma(_89, (*spvDescriptorSet0.vp_c11)._m0[21].y, _123);
    float _157 = fma(_87, (*spvDescriptorSet0.vp_c11)._m0[21].x, _127);
    float _159 = fma(_131, _131, _153);
    float _161 = rsqrt(_151);
    int _163 = _102 + 32;
    uint _165 = uint(int(uint(_163) >> uint(2)));
    uint _167 = uint(int(uint(int(_165)) >> uint(2)));
    int _169 = int(_165) & 3;
    float _171 = (*spvDescriptorSet0.vp_c5)._m0[int(_167)][_169];
    int _173 = int(_165) + 1;
    uint _175 = uint(int(uint(_173) >> uint(2)));
    int _177 = _173 & 3;
    float _179 = (*spvDescriptorSet0.vp_c5)._m0[int(_175)][_177];
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _183 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _181;
    float _185 = _155 + _79;
    float _187 = fma(_183, _183, _159);
    int _189 = _102 + 24;
    uint _191 = uint(int(uint(_189) >> uint(2)));
    uint _193 = uint(int(uint(int(_191)) >> uint(2)));
    int _195 = int(_191) & 3;
    float _197 = (*spvDescriptorSet0.vp_c5)._m0[int(_193)][_195];
    int _199 = int(_191) + 1;
    uint _201 = uint(int(uint(_199) >> uint(2)));
    int _203 = _199 & 3;
    float _205 = (*spvDescriptorSet0.vp_c5)._m0[int(_201)][_203];
    int _207 = _102 + 8;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    uint _211 = uint(int(uint(int(_209)) >> uint(2)));
    int _213 = int(_209) & 3;
    float _215 = (*spvDescriptorSet0.vp_c5)._m0[int(_211)][_213];
    int _217 = int(_209) + 1;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    int _221 = _217 & 3;
    float _223 = (*spvDescriptorSet0.vp_c5)._m0[int(_219)][_221];
    int _225 = _102 + 40;
    uint _227 = uint(int(uint(_225) >> uint(2)));
    uint _229 = uint(int(uint(int(_227)) >> uint(2)));
    int _231 = int(_227) & 3;
    float _233 = (*spvDescriptorSet0.vp_c5)._m0[int(_229)][_231];
    int _235 = int(_227) + 1;
    uint _237 = uint(int(uint(_235) >> uint(2)));
    int _239 = _235 & 3;
    float _241 = (*spvDescriptorSet0.vp_c5)._m0[int(_237)][_239];
    float _243 = _97 * _119;
    float _245 = _185 * _119;
    float _247 = fma(_95, _111, _243);
    float _249 = _97 * _149;
    float _251 = fma(_95, _141, _249);
    float _253 = _97 * _179;
    float _255 = _185 * _179;
    float _257 = fma(_95, _171, _253);
    float _259 = _121 * _161;
    float _261 = _161 * _77;
    float _263 = sqrt(_187);
    float _265 = fma(_99, _197, _251);
    float _267 = _185 * _149;
    float _269 = fma(_261, _157, _77);
    float _271 = fma(_259, _127, _81);
    float _273 = _265 * _265;
    float _275 = fma(_269, _141, _267);
    float _277 = fma(_269, _111, _245);
    float _279 = fma(_99, _215, _247);
    float _281 = fma(_269, _171, _255);
    float _283 = fma(_271, _197, _275);
    float _285 = fma(_271, _215, _277);
    float _287 = fma(_279, _279, _273);
    float _289 = _283 + _205;
    bool _293 = _263 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _295 = isnan(_263);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _301 = _297 || _299;
    float _303 = fma(_99, _233, _257);
    float _305 = fma(_271, _233, _281);
    float _307 = _285 + _223;
    float _309 = _289 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _311 = fma(_303, _303, _287);
    float _313 = _289 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _315 = _289 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _317 = _305 + _241;
    float _319 = rsqrt(_311);
    float _321 = fma(_307, (*spvDescriptorSet0.vp_c6)._m0[3].x, _309);
    float _323 = fma(_307, (*spvDescriptorSet0.vp_c6)._m0[4].x, _313);
    float _325 = fma(_307, (*spvDescriptorSet0.vp_c6)._m0[5].x, _315);
    float _327 = fma(_317, (*spvDescriptorSet0.vp_c6)._m0[3].z, _321);
    float _329 = fma(_317, (*spvDescriptorSet0.vp_c6)._m0[5].z, _325);
    float _331 = fma(_317, (*spvDescriptorSet0.vp_c6)._m0[4].z, _323);
    float _333 = _323;
    float _335 = _79;
    float _337 = _77;
    if (!_301)
    {
        _333 = 1.0;
    }
    float _339 = _333;
    float _341 = _327 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _343 = _329 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    float _345 = _279 * _319;
    float _347 = _265 * _319;
    float _349 = _303 * _319;
    float _351 = _331 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    bool _353 = !_301;
    float _355 = _339;
    if (!_353)
    {
        bool _357 = _263 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _359 = isnan(_263);
        bool _361 = _357 || _359;
        bool _363 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _365 = _361 || _363;
        if (!_365)
        {
            float _367 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _369 = _263 + _367;
            float _371 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _373 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _371;
            float _375 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _377 = _375 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _379 = 1.0 / _373;
            float _381 = _369 * _379;
            float _383 = fma(_381, _377, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _355 = _383;
            _385 = true;
        }
        else
        {
            bool _387 = _263 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _389 = isnan(_263);
            bool _391 = _387 || _389;
            bool _393 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _395 = _391 || _393;
            if (!_395)
            {
                float _397 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _399 = _263 + _397;
                float _401 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _403 = _401 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _405 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _407 = _405 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _409 = 1.0 / _403;
                float _411 = _399 * _409;
                float _413 = fma(_411, _407, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _355 = _413;
                _385 = true;
            }
            else
            {
                _355 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _385 = false;
    float _415 = _355;
    float _417 = _415 + (-1.0);
    float _419 = in.m_40.x;
    float _421 = _417 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _423 = _417 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _425 = _417 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _427 = in.m_40.y;
    float _429 = fma(_351, _415, _421);
    float _431 = fma(_341, _415, _423);
    float _433 = fma(_343, _415, _425);
    float _435 = in.m_42.y;
    float _437 = _429 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _439 = _429 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _441 = _429 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _443 = fma(_431, (*spvDescriptorSet0.vp_c6)._m0[2].x, _437);
    float _445 = fma(_431, (*spvDescriptorSet0.vp_c6)._m0[0].x, _439);
    float _447 = fma(_431, (*spvDescriptorSet0.vp_c6)._m0[1].x, _441);
    float _449 = fma(_433, (*spvDescriptorSet0.vp_c6)._m0[2].z, _443);
    float _451 = fma(_433, (*spvDescriptorSet0.vp_c6)._m0[0].z, _445);
    float _453 = fma(_433, (*spvDescriptorSet0.vp_c6)._m0[1].z, _447);
    float _455 = _449 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _457 = _451 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _459 = _453 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _461 = in.m_42.x;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _465 = _455 + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _469 = _457 + _467;
    float _471 = _459 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    out.m_45.x = _345;
    out.m_45.y = _347;
    out.m_45.z = _349;
    float _473 = _465 * _465;
    float _475 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[2].x, _471);
    out.m_47.x = _419;
    float _477 = fma(_469, _469, _473);
    float _479 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[2].z, _475);
    out.m_47.y = _427;
    float _481 = sqrt(_477);
    float _483 = _479 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    out.m_49.x = _77;
    out.m_49.y = _79;
    out.m_49.z = _81;
    bool _485 = _481 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _487 = _429;
    float _489 = _473;
    if (!_485)
    {
        _487 = _483;
    }
    float _491 = _487;
    float _493 = _491;
    if (!_485)
    {
        _489 = _457;
    }
    float _495 = _489;
    float _497 = _495;
    if (!_485)
    {
        _335 = _459;
    }
    float _499 = _335;
    float _501 = _499;
    if (!_485)
    {
        _337 = _455;
    }
    float _503 = _337;
    bool _505 = !_485;
    float _507 = _503;
    if (!_505)
    {
        float _509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _511 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _513 = _481 + _511;
        float _515 = _459 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _517 = rsqrt(_477);
        float _519 = _513 * _509;
        float _521 = _519 * 0.15915493667125701904296875;
        float _523 = _521 * 6.283185482025146484375;
        float _525 = cos(_523);
        float _527 = _521 * 6.283185482025146484375;
        float _529 = sin(_527);
        float _531 = _525 + (-1.0);
        float _533 = _531 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _535 = fma(_529, _515, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _537 = fma(_459, _525, _533);
        float _539 = _517 * _535;
        float _541 = _537 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _543 = fma(_469, _539, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _545 = fma(_465, _539, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _547 = fma(_543, (*spvDescriptorSet0.vp_c4)._m0[2].x, _541);
        float _549 = fma(_545, (*spvDescriptorSet0.vp_c4)._m0[2].z, _547);
        float _551 = _549 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _501 = _537;
        _497 = _543;
        _507 = _545;
        _493 = _551;
    }
    float _553 = _501;
    float _555 = _497;
    float _557 = _507;
    float _559 = _493;
    float _561 = _553 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _563 = _553 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_51.x = _457;
    out.m_51.y = _459;
    out.m_51.z = _455;
    float _565 = _459 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _567 = fma(_555, (*spvDescriptorSet0.vp_c4)._m0[0].x, _561);
    float _569 = fma(_555, (*spvDescriptorSet0.vp_c4)._m0[1].x, _563);
    float _571 = _459 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _573 = _459 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _575 = _459 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _577 = _459 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _579 = _459 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _581 = _459 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _583 = _459 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _585 = _459 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _587 = _459 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _589 = _459 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _591 = _459 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _593 = fma(_557, (*spvDescriptorSet0.vp_c4)._m0[0].z, _567);
    float _595 = fma(_557, (*spvDescriptorSet0.vp_c4)._m0[1].z, _569);
    float _597 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[42].x, _571);
    float _599 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[43].x, _565);
    float _601 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[44].x, _573);
    float _603 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[45].x, _575);
    float _605 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[46].x, _577);
    float _607 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[47].x, _579);
    float _609 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[48].x, _581);
    float _611 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[49].x, _583);
    float _613 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[50].x, _585);
    float _615 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[51].x, _587);
    float _617 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[52].x, _589);
    float _619 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[53].x, _591);
    float _621 = _595 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _623 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[42].z, _597);
    float _625 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[43].z, _599);
    float _627 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[44].z, _601);
    float _629 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[45].z, _603);
    float _631 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[46].z, _605);
    float _633 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[47].z, _607);
    float _635 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[48].z, _609);
    float _637 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[49].z, _611);
    float _639 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[50].z, _613);
    float _641 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[51].z, _615);
    float _643 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[52].z, _617);
    float _645 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[53].z, _619);
    float _647 = _621 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _649 = _621 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _651 = _621 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _653 = _593 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _655 = _621 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _657 = _623 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _659 = _625 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _661 = fma(_653, (*spvDescriptorSet0.vp_c4)._m0[7].x, _647);
    float _663 = fma(_653, (*spvDescriptorSet0.vp_c4)._m0[8].x, _649);
    float _665 = fma(_653, (*spvDescriptorSet0.vp_c4)._m0[9].x, _651);
    float _667 = fma(_653, (*spvDescriptorSet0.vp_c4)._m0[10].x, _655);
    float _669 = _627 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _671 = _629 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _673 = fma(_559, (*spvDescriptorSet0.vp_c4)._m0[7].z, _661);
    float _675 = fma(_559, (*spvDescriptorSet0.vp_c4)._m0[8].z, _663);
    float _677 = fma(_559, (*spvDescriptorSet0.vp_c4)._m0[9].z, _665);
    float _679 = fma(_559, (*spvDescriptorSet0.vp_c4)._m0[10].z, _667);
    float _681 = -_483;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _685 = _681 + _683;
    out.m_53.z = _461;
    float _687 = _641 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _689 = _643 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _691 = _645 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    out.m_55.x = _657;
    out.m_55.y = _659;
    out.m_55.z = _669;
    out.m_55.w = _671;
    float _693 = _685 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _695 = _673 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _697 = _675 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _699 = _639 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _701 = _677 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _703 = _679 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_53.w = _435;
    out.m_57.x = _699;
    out.m_57.y = _687;
    out.m_57.z = _689;
    out.m_57.w = _691;
    float _705 = _631 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _707 = _633 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _709 = _635 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _711 = _637 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    out.m_59.w = _483;
    out.m_61.x = _705;
    out.m_61.y = _707;
    out.m_61.z = _709;
    out.m_61.w = _711;
    out.m_45.w = _693;
    out.gl_Position.x = _695;
    out.gl_Position.y = _697;
    out.gl_Position.z = _701;
    out.gl_Position.w = _703;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    bool _385 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = as_type<float>(in.m_31.x);
    float _77 = in.m_34.x;
    float _79 = in.m_34.y;
    float _81 = in.m_34.z;
    float _83 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _85 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _83;
    float _87 = in.m_36.x;
    float _89 = in.m_36.y;
    float _91 = in.m_36.z;
    float _93 = in.m_36.w;
    float _95 = in.m_38.x;
    float _97 = in.m_38.y;
    float _99 = in.m_38.z;
    int _102 = as_type<int>(_75) * 48;
    uint _105 = uint(int(uint(_102) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.vp_c5)._m0[int(_107)][_109];
    int _113 = int(_105) + 1;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    int _117 = _113 & 3;
    float _119 = (*spvDescriptorSet0.vp_c5)._m0[int(_115)][_117];
    float _121 = _81 + (-0.2599999904632568359375);
    float _123 = _93 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _125 = _121 * _121;
    float _127 = _91 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _129 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _131 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _129;
    int _133 = _102 + 16;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    uint _137 = uint(int(uint(int(_135)) >> uint(2)));
    int _139 = int(_135) & 3;
    float _141 = (*spvDescriptorSet0.vp_c5)._m0[int(_137)][_139];
    int _143 = int(_135) + 1;
    uint _145 = uint(int(uint(_143) >> uint(2)));
    int _147 = _143 & 3;
    float _149 = (*spvDescriptorSet0.vp_c5)._m0[int(_145)][_147];
    float _151 = fma(_77, _77, _125);
    float _153 = _85 * _85;
    float _155 = fma(_89, (*spvDescriptorSet0.vp_c11)._m0[21].y, _123);
    float _157 = fma(_87, (*spvDescriptorSet0.vp_c11)._m0[21].x, _127);
    float _159 = fma(_131, _131, _153);
    float _161 = rsqrt(_151);
    int _163 = _102 + 32;
    uint _165 = uint(int(uint(_163) >> uint(2)));
    uint _167 = uint(int(uint(int(_165)) >> uint(2)));
    int _169 = int(_165) & 3;
    float _171 = (*spvDescriptorSet0.vp_c5)._m0[int(_167)][_169];
    int _173 = int(_165) + 1;
    uint _175 = uint(int(uint(_173) >> uint(2)));
    int _177 = _173 & 3;
    float _179 = (*spvDescriptorSet0.vp_c5)._m0[int(_175)][_177];
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _183 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _181;
    float _185 = _155 + _79;
    float _187 = fma(_183, _183, _159);
    int _189 = _102 + 24;
    uint _191 = uint(int(uint(_189) >> uint(2)));
    uint _193 = uint(int(uint(int(_191)) >> uint(2)));
    int _195 = int(_191) & 3;
    float _197 = (*spvDescriptorSet0.vp_c5)._m0[int(_193)][_195];
    int _199 = int(_191) + 1;
    uint _201 = uint(int(uint(_199) >> uint(2)));
    int _203 = _199 & 3;
    float _205 = (*spvDescriptorSet0.vp_c5)._m0[int(_201)][_203];
    int _207 = _102 + 8;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    uint _211 = uint(int(uint(int(_209)) >> uint(2)));
    int _213 = int(_209) & 3;
    float _215 = (*spvDescriptorSet0.vp_c5)._m0[int(_211)][_213];
    int _217 = int(_209) + 1;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    int _221 = _217 & 3;
    float _223 = (*spvDescriptorSet0.vp_c5)._m0[int(_219)][_221];
    int _225 = _102 + 40;
    uint _227 = uint(int(uint(_225) >> uint(2)));
    uint _229 = uint(int(uint(int(_227)) >> uint(2)));
    int _231 = int(_227) & 3;
    float _233 = (*spvDescriptorSet0.vp_c5)._m0[int(_229)][_231];
    int _235 = int(_227) + 1;
    uint _237 = uint(int(uint(_235) >> uint(2)));
    int _239 = _235 & 3;
    float _241 = (*spvDescriptorSet0.vp_c5)._m0[int(_237)][_239];
    float _243 = _97 * _119;
    float _245 = _185 * _119;
    float _247 = fma(_95, _111, _243);
    float _249 = _97 * _149;
    float _251 = fma(_95, _141, _249);
    float _253 = _97 * _179;
    float _255 = _185 * _179;
    float _257 = fma(_95, _171, _253);
    float _259 = _121 * _161;
    float _261 = _161 * _77;
    float _263 = sqrt(_187);
    float _265 = fma(_99, _197, _251);
    float _267 = _185 * _149;
    float _269 = fma(_261, _157, _77);
    float _271 = fma(_259, _127, _81);
    float _273 = _265 * _265;
    float _275 = fma(_269, _141, _267);
    float _277 = fma(_269, _111, _245);
    float _279 = fma(_99, _215, _247);
    float _281 = fma(_269, _171, _255);
    float _283 = fma(_271, _197, _275);
    float _285 = fma(_271, _215, _277);
    float _287 = fma(_279, _279, _273);
    float _289 = _283 + _205;
    bool _293 = _263 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _295 = isnan(_263);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _301 = _297 || _299;
    float _303 = fma(_99, _233, _257);
    float _305 = fma(_271, _233, _281);
    float _307 = _285 + _223;
    float _309 = _289 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _311 = fma(_303, _303, _287);
    float _313 = _289 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _315 = _289 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _317 = _305 + _241;
    float _319 = rsqrt(_311);
    float _321 = fma(_307, (*spvDescriptorSet0.vp_c6)._m0[3].x, _309);
    float _323 = fma(_307, (*spvDescriptorSet0.vp_c6)._m0[4].x, _313);
    float _325 = fma(_307, (*spvDescriptorSet0.vp_c6)._m0[5].x, _315);
    float _327 = fma(_317, (*spvDescriptorSet0.vp_c6)._m0[3].z, _321);
    float _329 = fma(_317, (*spvDescriptorSet0.vp_c6)._m0[5].z, _325);
    float _331 = fma(_317, (*spvDescriptorSet0.vp_c6)._m0[4].z, _323);
    float _333 = _323;
    float _335 = _79;
    float _337 = _77;
    if (!_301)
    {
        _333 = 1.0;
    }
    float _339 = _333;
    float _341 = _327 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _343 = _329 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    float _345 = _279 * _319;
    float _347 = _265 * _319;
    float _349 = _303 * _319;
    float _351 = _331 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    bool _353 = !_301;
    float _355 = _339;
    if (!_353)
    {
        bool _357 = _263 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _359 = isnan(_263);
        bool _361 = _357 || _359;
        bool _363 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _365 = _361 || _363;
        if (!_365)
        {
            float _367 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _369 = _263 + _367;
            float _371 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _373 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _371;
            float _375 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _377 = _375 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _379 = 1.0 / _373;
            float _381 = _369 * _379;
            float _383 = fma(_381, _377, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _355 = _383;
            _385 = true;
        }
        else
        {
            bool _387 = _263 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _389 = isnan(_263);
            bool _391 = _387 || _389;
            bool _393 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _395 = _391 || _393;
            if (!_395)
            {
                float _397 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _399 = _263 + _397;
                float _401 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _403 = _401 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _405 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _407 = _405 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _409 = 1.0 / _403;
                float _411 = _399 * _409;
                float _413 = fma(_411, _407, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _355 = _413;
                _385 = true;
            }
            else
            {
                _355 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _385 = false;
    float _415 = _355;
    float _417 = _415 + (-1.0);
    float _419 = in.m_40.x;
    float _421 = _417 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _423 = _417 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _425 = _417 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _427 = in.m_40.y;
    float _429 = fma(_351, _415, _421);
    float _431 = fma(_341, _415, _423);
    float _433 = fma(_343, _415, _425);
    float _435 = in.m_42.y;
    float _437 = _429 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _439 = _429 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _441 = _429 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _443 = fma(_431, (*spvDescriptorSet0.vp_c6)._m0[2].x, _437);
    float _445 = fma(_431, (*spvDescriptorSet0.vp_c6)._m0[0].x, _439);
    float _447 = fma(_431, (*spvDescriptorSet0.vp_c6)._m0[1].x, _441);
    float _449 = fma(_433, (*spvDescriptorSet0.vp_c6)._m0[2].z, _443);
    float _451 = fma(_433, (*spvDescriptorSet0.vp_c6)._m0[0].z, _445);
    float _453 = fma(_433, (*spvDescriptorSet0.vp_c6)._m0[1].z, _447);
    float _455 = _449 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _457 = _451 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _459 = _453 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _461 = in.m_42.x;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _465 = _455 + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _469 = _457 + _467;
    float _471 = _459 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    out.m_45.x = _345;
    out.m_45.y = _347;
    out.m_45.z = _349;
    float _473 = _465 * _465;
    float _475 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[2].x, _471);
    out.m_47.x = _419;
    float _477 = fma(_469, _469, _473);
    float _479 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[2].z, _475);
    out.m_47.y = _427;
    float _481 = sqrt(_477);
    float _483 = _479 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    out.m_49.x = _77;
    out.m_49.y = _79;
    out.m_49.z = _81;
    bool _485 = _481 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _487 = _429;
    float _489 = _473;
    if (!_485)
    {
        _487 = _483;
    }
    float _491 = _487;
    float _493 = _491;
    if (!_485)
    {
        _489 = _457;
    }
    float _495 = _489;
    float _497 = _495;
    if (!_485)
    {
        _335 = _459;
    }
    float _499 = _335;
    float _501 = _499;
    if (!_485)
    {
        _337 = _455;
    }
    float _503 = _337;
    bool _505 = !_485;
    float _507 = _503;
    if (!_505)
    {
        float _509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _511 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _513 = _481 + _511;
        float _515 = _459 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _517 = rsqrt(_477);
        float _519 = _513 * _509;
        float _521 = _519 * 0.15915493667125701904296875;
        float _523 = _521 * 6.283185482025146484375;
        float _525 = cos(_523);
        float _527 = _521 * 6.283185482025146484375;
        float _529 = sin(_527);
        float _531 = _525 + (-1.0);
        float _533 = _531 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _535 = fma(_529, _515, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _537 = fma(_459, _525, _533);
        float _539 = _517 * _535;
        float _541 = _537 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _543 = fma(_469, _539, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _545 = fma(_465, _539, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _547 = fma(_543, (*spvDescriptorSet0.vp_c4)._m0[2].x, _541);
        float _549 = fma(_545, (*spvDescriptorSet0.vp_c4)._m0[2].z, _547);
        float _551 = _549 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _501 = _537;
        _497 = _543;
        _507 = _545;
        _493 = _551;
    }
    float _553 = _501;
    float _555 = _497;
    float _557 = _507;
    float _559 = _493;
    float _561 = _553 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _563 = _553 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_51.x = _457;
    out.m_51.y = _459;
    out.m_51.z = _455;
    float _565 = _459 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _567 = fma(_555, (*spvDescriptorSet0.vp_c4)._m0[0].x, _561);
    float _569 = fma(_555, (*spvDescriptorSet0.vp_c4)._m0[1].x, _563);
    float _571 = _459 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _573 = _459 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _575 = _459 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _577 = _459 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _579 = _459 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _581 = _459 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _583 = _459 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _585 = _459 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _587 = _459 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _589 = _459 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _591 = _459 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _593 = fma(_557, (*spvDescriptorSet0.vp_c4)._m0[0].z, _567);
    float _595 = fma(_557, (*spvDescriptorSet0.vp_c4)._m0[1].z, _569);
    float _597 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[42].x, _571);
    float _599 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[43].x, _565);
    float _601 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[44].x, _573);
    float _603 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[45].x, _575);
    float _605 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[46].x, _577);
    float _607 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[47].x, _579);
    float _609 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[48].x, _581);
    float _611 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[49].x, _583);
    float _613 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[50].x, _585);
    float _615 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[51].x, _587);
    float _617 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[52].x, _589);
    float _619 = fma(_457, (*spvDescriptorSet0.vp_c4)._m0[53].x, _591);
    float _621 = _595 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _623 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[42].z, _597);
    float _625 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[43].z, _599);
    float _627 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[44].z, _601);
    float _629 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[45].z, _603);
    float _631 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[46].z, _605);
    float _633 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[47].z, _607);
    float _635 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[48].z, _609);
    float _637 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[49].z, _611);
    float _639 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[50].z, _613);
    float _641 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[51].z, _615);
    float _643 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[52].z, _617);
    float _645 = fma(_455, (*spvDescriptorSet0.vp_c4)._m0[53].z, _619);
    float _647 = _621 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _649 = _621 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _651 = _621 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _653 = _593 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _655 = _621 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _657 = _623 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _659 = _625 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _661 = fma(_653, (*spvDescriptorSet0.vp_c4)._m0[7].x, _647);
    float _663 = fma(_653, (*spvDescriptorSet0.vp_c4)._m0[8].x, _649);
    float _665 = fma(_653, (*spvDescriptorSet0.vp_c4)._m0[9].x, _651);
    float _667 = fma(_653, (*spvDescriptorSet0.vp_c4)._m0[10].x, _655);
    float _669 = _627 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _671 = _629 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _673 = fma(_559, (*spvDescriptorSet0.vp_c4)._m0[7].z, _661);
    float _675 = fma(_559, (*spvDescriptorSet0.vp_c4)._m0[8].z, _663);
    float _677 = fma(_559, (*spvDescriptorSet0.vp_c4)._m0[9].z, _665);
    float _679 = fma(_559, (*spvDescriptorSet0.vp_c4)._m0[10].z, _667);
    float _681 = -_483;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _685 = _681 + _683;
    out.m_53.z = _461;
    float _687 = _641 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _689 = _643 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _691 = _645 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    out.m_55.x = _657;
    out.m_55.y = _659;
    out.m_55.z = _669;
    out.m_55.w = _671;
    float _693 = _685 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _695 = _673 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _697 = _675 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _699 = _639 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _701 = _677 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _703 = _679 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_53.w = _435;
    out.m_57.x = _699;
    out.m_57.y = _687;
    out.m_57.z = _689;
    out.m_57.w = _691;
    float _705 = _631 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _707 = _633 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _709 = _635 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _711 = _637 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    out.m_59.w = _483;
    out.m_61.x = _705;
    out.m_61.y = _707;
    out.m_61.z = _709;
    out.m_61.w = _711;
    out.m_45.w = _693;
    out.gl_Position.x = _695;
    out.gl_Position.y = _697;
    out.gl_Position.z = _701;
    out.gl_Position.w = _703;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

