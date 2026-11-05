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
    float4 m_58 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_60 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_41 [[attribute(1)]];
    float4 m_39 [[attribute(2)]];
    float4 m_43 [[attribute(3)]];
    float4 m_52 [[attribute(4)]];
    float4 m_32 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_47 [[attribute(7)]];
    float4 m_45 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1993 = false;
    bool _943 = false;
    bool _765 = false;
    bool _663 = false;
    bool _503 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_32.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    float _91 = as_type<float>(_83);
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _89;
    float _95 = _93;
    if (!_87)
    {
        out.m_35.x = 0.0;
    }
    int _97 = 0;
    if (!_87)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2388 = as_type<float>(_101);
        out.gl_Position.z = _2388;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_37.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    float _123 = _119;
    if (_115)
    {
        float _125 = float(_83);
        _121 = _125;
    }
    float _127 = _121;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _95;
    float _139 = _137;
    if (_133)
    {
        out.m_35.x = 0.0;
    }
    if (_133)
    {
        float _141 = _137 * 5.0;
        _103 = as_type<int>(_141);
    }
    int _143 = _103;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2459 = as_type<float>(_143);
        out.gl_Position.z = _2459;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_37.x;
    float _147 = in.m_37.y;
    float _149 = in.m_37.z;
    float _151 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = 0.0;
    float _165 = _151;
    if (!_161)
    {
        float _167 = _151 * _151;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = 0.0;
    float _175 = _171;
    if (!_161)
    {
        float _177 = _119 * _119;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    if (!_161)
    {
        float _183 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _183;
    }
    float _185 = _175;
    bool _187 = !_161;
    float _189 = _185;
    if (!_187)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _151 * _193;
        float _203 = 1.0 / _197;
        float _205 = _199 * 0.693147182464599609375;
        float _207 = exp2(_201);
        float _209 = 1.0 / _205;
        float _211 = _207 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _209, _151);
        float _217 = _215 * _203;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _139 = _205;
        _189 = _219;
        _135 = _207;
    }
    float _221 = _139;
    float _223 = _189;
    float _225 = _135;
    bool _227 = !_161;
    float _229 = _221;
    float _231 = _225;
    if (!_227)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _151 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _229 = _245;
        _231 = _239;
        _165 = _251;
    }
    float _253 = _229;
    float _255 = _231;
    float _257 = _165;
    float _259 = _255;
    float _261 = _253;
    if (!_161)
    {
        _259 = _119;
    }
    float _263 = _259;
    float _265 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _267 = _263;
    if (!_161)
    {
        float _269 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _261 = _269;
    }
    float _271 = _261;
    bool _273 = !_161;
    float _275 = _271;
    if (!_273)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = _119 * _279;
        float _289 = exp2(_287);
        float _291 = _285 * 0.693147182464599609375;
        float _293 = 1.0 / _291;
        float _295 = 1.0 / _283;
        float _297 = _289 + (-1.0);
        float _299 = -_297;
        float _301 = fma(_299, _293, _119);
        float _303 = _301 * _295;
        float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _305;
    }
    float _307 = _275;
    bool _309 = !_161;
    if (!_309)
    {
        float _311 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = log2(_311);
        float _315 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _317 = _315 + 1.0;
        float _319 = 1.0 / _317;
        float _321 = _119 * _313;
        float _323 = exp2(_321);
        float _325 = -_323;
        float _327 = _325 + 1.0;
        float _329 = _327 * _319;
        _267 = _329;
    }
    float _331 = _267;
    float _333 = fma(_257, _145, _265);
    float _335 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = fma(_257, _147, _335);
    float _345 = fma(_331, _147, _337);
    float _347 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = fma(_257, _149, _339);
    float _351 = fma(_331, _145, _341);
    float _353 = -_345;
    float _355 = _343 + _353;
    float _357 = fma(_331, _149, _347);
    float _359 = in.m_39.y;
    float _361 = -_351;
    float _363 = _333 + _361;
    float _365 = _355 * _355;
    float _367 = -_357;
    float _369 = _349 + _367;
    float _371 = in.m_41.y;
    float _373 = fma(_363, _363, _365);
    float _375 = in.m_43.y;
    float _377 = fma(_369, _369, _373);
    float _379 = in.m_41.x;
    float _381 = in.m_39.x;
    float _383 = sqrt(_377);
    float _385 = in.m_43.x;
    float _387 = in.m_41.z;
    float _389 = _355 * _359;
    float _391 = in.m_39.z;
    float _393 = _355 * _371;
    float _395 = in.m_43.z;
    bool _397 = _383 >= 9.9999999747524270787835121154785e-07;
    bool _399 = isnan(_383);
    bool _401 = _397 || _399;
    bool _403 = isnan(9.9999999747524270787835121154785e-07);
    bool _405 = _401 || _403;
    float _407 = _355 * _375;
    float _409 = _359 * _359;
    float _411 = in.m_45.w;
    float _413 = fma(_363, _379, _393);
    float _415 = fma(_371, _371, _409);
    float _417 = in.m_32.x;
    float _419 = in.m_32.y;
    float _421 = in.m_32.z;
    float _423 = fma(_363, _381, _389);
    float _425 = fma(_375, _375, _415);
    float _427 = fma(_363, _385, _407);
    float _429 = fma(_369, _387, _413);
    float _431 = fma(_369, _391, _423);
    float _433 = fma(_369, _395, _427);
    float _435 = _427;
    float _437 = _343;
    float _439 = _411;
    if (_405)
    {
        _435 = _429;
    }
    float _441 = _435;
    float _443 = fma(_333, _411, _417);
    float _445 = fma(_343, _411, _419);
    float _447 = fma(_349, _411, _421);
    float _449 = _441;
    float _451 = _441;
    if (_405)
    {
        _437 = _431;
    }
    float _453 = _437;
    float _455 = _453;
    float _457 = _453;
    if (_405)
    {
        _439 = _433;
    }
    float _459 = _439;
    float _461 = _459;
    float _463 = _459;
    if (!_405)
    {
        bool _465 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _467 = !_465;
        if (!_467)
        {
            float _469 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _471 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _473 = _375 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _475 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[16].x, _469);
            float _477 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[16].x, _471);
            float _479 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[16].x, _473);
            float _481 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[16].z, _475);
            float _483 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[16].z, _477);
            float _485 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[16].z, _479);
            float _487 = _481 * _481;
            float _489 = fma(_483, _483, _487);
            float _491 = fma(_485, _485, _489);
            float _493 = rsqrt(_491);
            float _495 = _493 * 9.9999999747524270787835121154785e-07;
            float _497 = _483 * _495;
            float _499 = _481 * _495;
            float _501 = _485 * _495;
            _457 = _499;
            _451 = _497;
            _463 = _501;
            _503 = true;
        }
        else
        {
            float _505 = _147 * _147;
            float _507 = fma(_145, _145, _505);
            float _509 = fma(_149, _149, _507);
            float _511 = sqrt(_509);
            bool _513 = _511 >= 9.9999999747524270787835121154785e-07;
            bool _515 = isnan(_511);
            bool _517 = _513 || _515;
            bool _519 = isnan(9.9999999747524270787835121154785e-07);
            bool _521 = _517 || _519;
            if (!_521)
            {
                float _523 = _419 * _419;
                float _525 = fma(_417, _417, _523);
                float _527 = fma(_421, _421, _525);
                float _529 = sqrt(_527);
                bool _531 = _529 >= 9.9999999747524270787835121154785e-07;
                bool _533 = isnan(_529);
                bool _535 = _531 || _533;
                bool _537 = isnan(9.9999999747524270787835121154785e-07);
                bool _539 = _535 || _537;
                float _541 = _425;
                if (!_539)
                {
                    float _543 = rsqrt(_425);
                    _541 = _543;
                }
                float _545 = _541;
                if (!_539)
                {
                    float _547 = _545 * 9.9999999747524270787835121154785e-07;
                    _461 = _547;
                }
                float _549 = _461;
                float _551 = _549;
                if (!_539)
                {
                    float _553 = _371 * _549;
                    _449 = _553;
                }
                float _555 = _449;
                _451 = _555;
                if (!_539)
                {
                    float _557 = _359 * _549;
                    _455 = _557;
                }
                float _559 = _455;
                _457 = _559;
                if (!_539)
                {
                    float _561 = _375 * _549;
                    _551 = _561;
                }
                float _563 = _551;
                bool _565 = !_539;
                _463 = _563;
                _503 = _565;
                if (!_503)
                {
                    float _567 = _359 * _419;
                    float _569 = _371 * _419;
                    float _571 = _375 * _419;
                    float _573 = fma(_417, _381, _567);
                    float _575 = fma(_417, _379, _569);
                    float _577 = fma(_417, _385, _571);
                    float _579 = fma(_421, _391, _573);
                    float _581 = fma(_421, _387, _575);
                    float _583 = fma(_421, _395, _577);
                    float _585 = _579 * _579;
                    float _587 = fma(_581, _581, _585);
                    float _589 = fma(_583, _583, _587);
                    float _591 = rsqrt(_589);
                    float _593 = _591 * 9.9999999747524270787835121154785e-07;
                    float _595 = _581 * _593;
                    float _597 = _579 * _593;
                    float _599 = _583 * _593;
                    _457 = _597;
                    _451 = _595;
                    _463 = _599;
                    _503 = true;
                }
            }
            else
            {
                float _601 = _359 * _147;
                float _603 = _371 * _147;
                float _605 = _375 * _147;
                float _607 = fma(_145, _381, _601);
                float _609 = fma(_145, _379, _603);
                float _611 = fma(_145, _385, _605);
                float _613 = fma(_149, _391, _607);
                float _615 = fma(_149, _387, _609);
                float _617 = fma(_149, _395, _611);
                float _619 = _613 * _613;
                float _621 = fma(_615, _615, _619);
                float _623 = fma(_617, _617, _621);
                float _625 = rsqrt(_623);
                float _627 = _625 * 9.9999999747524270787835121154785e-07;
                float _629 = _615 * _627;
                float _631 = _613 * _627;
                float _633 = _617 * _627;
                _457 = _631;
                _451 = _629;
                _463 = _633;
            }
        }
    }
    _503 = false;
    float _635 = _457;
    float _637 = _451;
    float _639 = _463;
    bool _641 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _643 = !_641;
    float _661;
    if (!_643)
    {
        float _645 = in.m_47.x;
        float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _649 = _645 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _651 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _653 = _651 * _647;
        float _655 = floor(_653);
        float _657 = -_655;
        float _659 = _653 + _657;
        _661 = _659;
        _663 = true;
    }
    else
    {
        float _665 = float(_83);
        float _667 = 1.0 / _665;
        float _669 = _119 * _667;
        _661 = _669;
    }
    _663 = false;
    float _671 = _661;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _675 = _671 + _673;
    bool _677 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _679 = isnan(_671);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _689;
    float _693 = -_687;
    float _695 = _693 + 1.0;
    bool _697 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _699 = isnan(_671);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _709;
    bool _713 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _715 = 1.0 / _691;
    float _717 = _707 * _695;
    float _719 = -_707;
    float _721 = _719 + 1.0;
    float _723 = _675 * _715;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _725;
    float _729 = fma(_711, _723, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _731 = fma(_727, _723, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _733 = _729 * _717;
    float _735 = _731 * _717;
    float _737 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[143].x, _733);
    float _739 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[143].y, _735);
    float _741 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[144].x, _737);
    float _743 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[144].y, _739);
    bool _745 = !_713;
    float _763;
    if (!_745)
    {
        float _747 = in.m_47.x;
        float _749 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _751 = _747 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _753 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _755 = _753 * _749;
        float _757 = floor(_755);
        float _759 = -_757;
        float _761 = _755 + _759;
        _763 = _761;
        _765 = true;
    }
    else
    {
        float _767 = float(_83);
        float _769 = 1.0 / _767;
        float _771 = _119 * _769;
        _763 = _771;
    }
    _765 = false;
    float _773 = _763;
    float _775 = in.m_45.x;
    float _777 = in.m_45.y;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _781 = _773 + _779;
    bool _783 = _773 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _785 = isnan(_773);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _803 = 1.0 / _797;
    bool _805 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _807 = 1.0 / _801;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _809;
    float _813 = _743 * _777;
    float _815 = _781 * _803;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _819 = _773 + _817;
    bool _821 = _773 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _823 = isnan(_773);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = -_793;
    float _835 = _833 + 1.0;
    bool _837 = _773 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _839 = isnan(_773);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = fma(_811, _815, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _851 = _819 * _807;
    float _853 = _847 * _835;
    float _855 = -_847;
    float _857 = _855 + 1.0;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _863;
    float _867 = _831 * _857;
    float _869 = fma(_861, _815, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _871 = fma(_865, _815, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _873 = -_831;
    float _875 = _873 + 1.0;
    float _877 = _869 * _867;
    float _879 = _871 * _867;
    float _881 = _849 * _867;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _895 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[107].x, _877);
    float _897 = fma(_885, _851, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _899 = fma(_889, _851, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _901 = fma(_893, _851, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _903 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[107].y, _879);
    float _905 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[107].z, _881);
    float _907 = fma(_897, _853, _895);
    float _909 = _741 * _775;
    float _911 = fma(_899, _853, _903);
    float _913 = fma(_901, _853, _905);
    float _915 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[109].x, _907);
    float _917 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[109].y, _911);
    float _919 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[109].z, _913);
    bool _921 = !_805;
    float _923 = _899;
    float _941;
    if (!_921)
    {
        float _925 = in.m_47.x;
        float _927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _929 = _925 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _931 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _933 = _931 * _927;
        float _935 = floor(_933);
        float _937 = -_935;
        float _939 = _933 + _937;
        _941 = _939;
        _943 = true;
    }
    else
    {
        float _945 = float(_83);
        float _947 = 1.0 / _945;
        float _949 = _119 * _947;
        _91 = _947;
        _941 = _949;
    }
    _943 = false;
    float _951 = _91;
    float _953 = _941;
    float _955 = in.m_47.z;
    float _957 = _635 * _635;
    float _959 = _445 * _371;
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _963 = _961 != 0;
    float _965 = in.m_47.x;
    float _967 = fma(_637, _637, _957);
    float _969 = _445 * _375;
    float _971 = _445 * _359;
    float _973 = as_type<float>(int(gl_VertexIndex));
    float _975 = fma(_639, _639, _967);
    float _977 = fma(_443, _385, _969);
    float _979 = fma(_443, _379, _959);
    float _981 = fma(_443, _381, _971);
    float _983 = rsqrt(_975);
    float _985 = _951;
    float _987 = _959;
    if (!_963)
    {
        float _989 = in.m_47.y;
        _985 = _989;
    }
    float _991 = _985;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _995 = in.m_47.w;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _999 = _909 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1001 = _955 * 2.0;
    if (!_963)
    {
        _987 = _955;
    }
    float _1003 = _987;
    float _1005 = _813 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1007 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1009 = isnan(_953);
    bool _1011 = _1007 || _1009;
    bool _1013 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1015 = _1011 || _1013;
    float _1017 = float(_1015);
    float _1019 = _965 * 2.0;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1023 = _953 + _1021;
    float _1025 = floor(_1001);
    float _1027 = _983 * _639;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1031 = floor(_1019);
    float _1033 = _1003;
    if (!_963)
    {
        _923 = _991;
    }
    float _1035 = _923;
    float _1037 = _1035;
    float _1039 = _991;
    if (_963)
    {
        float _1041 = in.m_47.x;
        float _1043 = in.m_47.y;
        _1037 = _1041;
        _1039 = _1043;
    }
    float _1045 = _1037;
    float _1047 = _1039;
    bool _1049 = _1025 > 0.0;
    bool _1051 = _1025 >= 0.0;
    bool _1053 = isnan(_1025);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan(0.0);
    bool _1059 = _1055 || _1057;
    float _1061 = _1025;
    if (!_963)
    {
        _1061 = _955;
    }
    float _1063 = _1061;
    int _1065 = _1059 ? 0 : 1;
    int _1067 = as_type<int>(_973) & 1;
    bool _1069 = _1067 != 0;
    int _1071 = as_type<int>(_973) & 2;
    bool _1073 = _1071 != 0;
    int _1075 = ~_1065;
    int _1077 = _1075 + 1;
    int _1079 = _1077 + 1;
    int _1081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1083 = _1081 != 0;
    int _1085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1087 = _1085 != 0;
    int _1089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1091 = _1089 != 0;
    float _1093 = _983 * _635;
    int _1095 = _1079;
    float _1097 = _1063;
    if (!_1049)
    {
        int _1099 = ~_1065;
        int _1101 = _1099 + 1;
        _1095 = _1101;
    }
    int _1103 = _1095;
    float _1105 = _983 * _637;
    bool _1107 = _1031 > 0.0;
    float _1109 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1111 = log2(_1109);
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1115 = _1105 * _1113;
    float _1117 = _1047 * 2.0;
    if (_963)
    {
        _1033 = _1047;
    }
    float _1119 = _1033;
    float _1121 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_963)
    {
        _1097 = _1047;
    }
    float _1123 = _1097;
    float _1125 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[83].z, _997);
    bool _1127 = _1031 >= 0.0;
    bool _1129 = isnan(_1031);
    bool _1131 = _1127 || _1129;
    bool _1133 = isnan(0.0);
    bool _1135 = _1131 || _1133;
    float _1137 = floor(_1117);
    float _1139 = -_993;
    float _1141 = fma(_1121, 2.0, _1139);
    float _1143 = _955 + _1047;
    float _1145 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1029);
    float _1147 = _1111 * _119;
    int _1149 = _1135 ? 0 : 1;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1153 = _965 + _1047;
    float _1155 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1157 = _1143 + (-1.0);
    int _1159 = ~_1149;
    int _1161 = _1159 + 1;
    int _1163 = _1161 + 1;
    float _1165 = _1153 + (-1.0);
    float _1167 = fma(_1155, -2.0, _1151);
    float _1169 = exp2(_1147);
    int _1171 = _1163;
    if (!_1107)
    {
        int _1173 = ~_1149;
        int _1175 = _1173 + 1;
        _1171 = _1175;
    }
    int _1177 = _1171;
    float _1179 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1181 = !_1083;
    int _1183 = _1181 ? 0 : 1;
    float _1185 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1187 = _1137 > 0.0;
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1191 = -_1115;
    float _1193 = fma(_1093, _1189, _1191);
    bool _1195 = _1137 >= 0.0;
    bool _1197 = isnan(_1137);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan(0.0);
    bool _1203 = _1199 || _1201;
    bool _1205 = !_1087;
    int _1207 = _1205 ? 0 : 1;
    int _1209 = abs(_1183);
    int _1211 = abs(_1207);
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1215 = 1.0 + _1213;
    bool _1217 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1219 = isnan(1.0);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1225 = _1221 || _1223;
    float _1227 = in.m_52.x;
    float _1229 = in.m_52.y;
    float _1231 = in.m_52.z;
    float _1233 = float(_1209);
    float _1235 = 1.0 / _1215;
    float _1237 = float(_1103);
    float _1239 = float(_1211);
    float _1241 = _1233 * _1237;
    float _1243 = float(_1177);
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1249 = -_1169;
    float _1251 = _1249 + 1.0;
    bool _1253 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1255 = isnan(0.0);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1261 = _1257 || _1259;
    float _1263 = -_119;
    float _1265 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1141);
    float _1267 = _1239 * _1243;
    float _1269 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1167);
    float _1271 = _1261 ? _1251 : 0.0;
    float _1273 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1125);
    float _1275 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1145);
    float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1279 = _1027 * _1277;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1283 = _1093 * _1281;
    float _1285 = _1241 * (-2.0);
    if (_1225)
    {
        float _1287 = _1271 * _1235;
        _123 = _1287;
    }
    float _1289 = _123;
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1293 = -_1279;
    float _1295 = fma(_1105, _1291, _1293);
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1299 = _1297 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1303 = -_1283;
    float _1305 = fma(_1027, _1301, _1303);
    float _1307 = fma(_1185, _1285, _1185);
    float _1309 = _1295 * _1295;
    float _1311 = fma(_1285, _1227, _1227);
    int _1313 = _1203 ? 0 : 1;
    float _1315 = _965 + (-0.5);
    bool _1317 = !_1091;
    int _1319 = _1317 ? 0 : 1;
    float _1321 = fma(_1305, _1305, _1309);
    int _1323 = ~_1313;
    int _1325 = _1323 + 1;
    int _1327 = _1325 + 1;
    float _1329 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1311);
    int _1331 = abs(_1319);
    float _1333 = fma(_1193, _1193, _1321);
    int _1335 = _1327;
    if (!_1187)
    {
        int _1337 = ~_1313;
        int _1339 = _1337 + 1;
        _1335 = _1339;
    }
    int _1341 = _1335;
    float _1343 = _1267 * (-2.0);
    float _1345 = float(_1331);
    float _1347 = fma(_1307, _1289, _1329);
    float _1349 = float(_1341);
    float _1351 = fma(_1179, _1343, _1179);
    float _1353 = fma(_1343, _1229, _1229);
    float _1355 = _1047 + (-0.5);
    float _1357 = _965 + _955;
    float _1359 = _1345 * _1349;
    float _1361 = fma(_1355, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1353);
    float _1363 = _1357 + (-1.0);
    float _1365 = _1359 * (-2.0);
    float _1367 = 1.0 / _1247;
    float _1369 = fma(_1351, _1289, _1361);
    float _1371 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1373 = fma(_1365, _1231, _1231);
    float _1375 = _955 + (-0.5);
    float _1377 = _1347 * 0.15915493667125701904296875;
    float _1379 = fma(_1371, _1365, _1371);
    float _1381 = _1369 * 0.15915493667125701904296875;
    float _1383 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1373);
    float _1385 = rsqrt(_1333);
    bool _1387 = _955 > 0.5;
    float _1389 = fma(_1379, _1289, _1383);
    bool _1391 = _995 > 0.5;
    bool _1393 = _965 > 0.5;
    float _1395 = _1389 * 0.15915493667125701904296875;
    float _1397 = _1377 * 6.283185482025146484375;
    float _1399 = sin(_1397);
    float _1401 = fma(_447, _387, _979);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1403;
    bool _1407 = !_1069;
    float _1409 = _1407 ? (-0.5) : 0.5;
    float _1411 = _1377 * 6.283185482025146484375;
    float _1413 = cos(_1411);
    bool _1415 = !_1073;
    float _1417 = _1415 ? (-0.5) : 0.5;
    float _1419 = _1405 * _1367;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1423 = _1421 != 0;
    float _1425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1409);
    int _1427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1429 = _1427 != 0;
    float _1431 = _1305 * _1385;
    int _1433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1435 = _1433 != 0;
    float _1437 = _1381 * 6.283185482025146484375;
    float _1439 = sin(_1437);
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1443 = _1441 != 0;
    float _1445 = fma(_447, _391, _981);
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1449 = _953 + _1447;
    float _1451 = fma(_447, _395, _977);
    float _1453 = _1295 * _1385;
    float _1455 = _1193 * _1385;
    float _1457 = fma(_1419, _1449, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1459 = _1381 * 6.283185482025146484375;
    float _1461 = cos(_1459);
    float _1463 = _999 * _1425;
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1467 = _1465 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1469 = _1093 * _1455;
    float _1471 = _1451 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1473 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1475 = isnan(_953);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1481 = _1477 || _1479;
    float _1483 = float(_1481);
    float _1485 = _1027 * _1431;
    float _1487 = _1395 * 6.283185482025146484375;
    float _1489 = sin(_1487);
    float _1491 = _1399 * _1439;
    float _1493 = _1413 * _1439;
    float _1495 = -_1483;
    float _1497 = _1495 + 1.0;
    float _1499 = _1445 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1501 = _1395 * 6.283185482025146484375;
    float _1503 = cos(_1501);
    float _1505 = _1413 * _1461;
    float _1507 = _1399 * _1461;
    float _1509 = 1.0 / _1299;
    float _1511 = fma(_1489, _1505, _1491);
    float _1513 = -_1493;
    float _1515 = fma(_1489, _1507, _1513);
    float _1517 = -_1507;
    float _1519 = fma(_1489, _1493, _1517);
    float _1521 = fma(_1489, _1491, _1505);
    float _1523 = _1511 * _1105;
    float _1525 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1417);
    float _1527 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1529 = _1413 * _1503;
    float _1531 = _1461 * _1503;
    float _1533 = _1439 * _1503;
    float _1535 = _1399 * _1503;
    float _1537 = _1529 * _1105;
    float _1539 = -_1469;
    float _1541 = fma(_1027, _1453, _1539);
    float _1543 = fma(_1531, _1431, _1523);
    float _1545 = _1005 * _1525;
    float _1547 = _1467 * _1509;
    float _1549 = _1519 * _1105;
    float _1551 = -_1489;
    float _1553 = fma(_1551, _1431, _1537);
    float _1555 = _1105 * _1453;
    float _1557 = _1511 * _1027;
    float _1559 = fma(_1533, _1431, _1549);
    float _1561 = fma(_1515, _1541, _1543);
    float _1563 = _1519 * _1027;
    float _1565 = fma(_1535, _1541, _1553);
    float _1567 = fma(_1521, _1541, _1559);
    float _1569 = -_1555;
    float _1571 = fma(_1093, _1431, _1569);
    float _1573 = fma(_1531, _1455, _1557);
    float _1575 = _1529 * _1027;
    bool _1577 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1579 = isnan(_953);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1585 = _1581 || _1583;
    float _1587 = float(_1585);
    float _1589 = fma(_1533, _1455, _1563);
    float _1591 = fma(_1515, _1571, _1573);
    float _1593 = -_1489;
    float _1595 = fma(_1593, _1455, _1575);
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1599 = _1597 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1601 = -_1587;
    float _1603 = _1601 + 1.0;
    bool _1605 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1607 = isnan(_953);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1613 = _1609 || _1611;
    float _1615 = float(_1613);
    float _1617 = fma(_1535, _1571, _1595);
    float _1619 = 1.0 / _1599;
    float _1621 = fma(_1521, _1571, _1589);
    float _1623 = _1483 * _1603;
    float _1625 = _1545 * _1565;
    float _1627 = _1545 * _1617;
    float _1629 = _1615 * _1497;
    float _1631 = -_1615;
    float _1633 = _1631 + 1.0;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1635;
    float _1639 = fma(_1463, _1561, _1625);
    float _1641 = fma(_1463, _1591, _1627);
    float _1643 = _1401 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1645 = _1017 * _1633;
    float _1647 = fma(_1527, _1567, _1639);
    float _1649 = fma(_1527, _1621, _1641);
    float _1651 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1653 = _953 + _1651;
    float _1655 = _1637 * _1619;
    float _1657 = _1643 + _1647;
    float _1659 = _1471 + _1649;
    float _1661 = _1457 * _1645;
    float _1663 = fma(_1547, _1023, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1665 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1667 = _1657 + _1665;
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1671 = _1659 + _1669;
    float _1673 = fma(_1655, _1653, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1675 = _1529 * _1093;
    float _1677 = _1667 * _1667;
    float _1679 = _1671 * _1671;
    float _1681 = -_1485;
    float _1683 = fma(_1105, _1455, _1681);
    float _1685 = _1511 * _1093;
    float _1687 = -_1489;
    float _1689 = fma(_1687, _1453, _1675);
    float _1691 = _1677 + _1679;
    float _1693 = _1519 * _1093;
    float _1695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1697 = fma(_1531, _1453, _1685);
    float _1699 = fma(_1535, _1683, _1689);
    float _1701 = -_1017;
    float _1703 = _1701 + 1.0;
    float _1705 = fma(_1533, _1453, _1693);
    float _1707 = -_1417;
    int _1709 = _1391 ? as_type<int>(_1707) : as_type<int>(_1417);
    float _1711 = fma(_1515, _1683, _1697);
    float _1713 = _1545 * _1699;
    float _1715 = sqrt(_1691);
    float _1717 = fma(_1703, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1661);
    float _1719 = -_1409;
    int _1721 = _1387 ? as_type<int>(_1719) : as_type<int>(_1409);
    float _1723 = fma(_1463, _1711, _1713);
    bool _1725 = !_1429;
    float _1727 = _1725 ? _1417 : as_type<float>(_1709);
    float _1729 = fma(_1521, _1683, _1705);
    bool _1731 = !_1423;
    float _1733 = _1731 ? _1409 : as_type<float>(_1721);
    float _1735 = fma(_1663, _1629, _1717);
    float _1737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1739 = fma(_1527, _1729, _1723);
    bool _1741 = _1047 > 0.5;
    float _1743 = _1695 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1745 = _1733 + 0.5;
    float _1747 = _1499 + _1739;
    float _1749 = fma(_1673, _1623, _1735);
    float _1751 = -_1417;
    int _1753 = _1741 ? as_type<int>(_1751) : as_type<int>(_1417);
    float _1755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1757 = _1715 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1759 = fma(_1743, _1745, _1265);
    float _1761 = _1727 + (-0.5);
    float _1763 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1749);
    float _1765 = _1737 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1767 = -_1765;
    float _1769 = -_1269;
    float _1771 = fma(_1767, _1761, _1769);
    float _1773 = _1761;
    float _1775 = _1677;
    float _1777 = _1679;
    float _1779 = _1659;
    float _1781 = _1657;
    float _1783 = _1621;
    if (!_1757)
    {
        _1773 = _1747;
    }
    float _1785 = _1773;
    bool _1787 = !_1757;
    float _1789 = _1785;
    if (!_1787)
    {
        float _1791 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1795 = _1715 + _1793;
        float _1797 = _1747 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1799 = rsqrt(_1691);
        float _1801 = _1795 * _1791;
        float _1803 = _1801 * 0.15915493667125701904296875;
        float _1805 = _1803 * 6.283185482025146484375;
        float _1807 = sin(_1805);
        float _1809 = _1803 * 6.283185482025146484375;
        float _1811 = cos(_1809);
        float _1813 = fma(_1807, _1797, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1815 = _1799 * _1813;
        float _1817 = fma(_1667, _1815, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1819 = _1811 + (-1.0);
        float _1821 = fma(_1671, _1815, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1823 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1825 = _1817 + _1823;
        float _1827 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1829 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1831 = _1821 + _1829;
        float _1833 = _1825 * _1825;
        float _1835 = fma(_1747, _1811, _1827);
        float _1837 = _1831 * _1831;
        _1789 = _1835;
        _1775 = _1833;
        _1777 = _1837;
        _1779 = _1821;
        _1781 = _1817;
    }
    float _1839 = _1789;
    float _1841 = _1775;
    float _1843 = _1777;
    float _1845 = _1779;
    float _1847 = _1781;
    float _1849 = -_1409;
    int _1851 = _1393 ? as_type<int>(_1849) : as_type<int>(_1409);
    float _1853 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1855 = _1839 + _1853;
    bool _1857 = !_1443;
    float _1859 = _1857 ? _1417 : as_type<float>(_1753);
    float _1861 = _1417 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1863 = !_1435;
    float _1865 = _1863 ? _1409 : as_type<float>(_1851);
    float _1867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1869 = fma(_1855, _1855, _1841);
    float _1871 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1873 = _1699 * _1861;
    float _1875 = _1865 + 0.5;
    float _1877 = _1869 + _1843;
    float _1879 = fma(_1711, _1871, _1873);
    float _1881 = _1875 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1883 = _1565 * _1861;
    float _1885 = _1617 * _1861;
    float _1887 = _1881 * _1755;
    float _1889 = -_1859;
    float _1891 = _1889 + 0.5;
    float _1893 = sqrt(_1877);
    float _1895 = -_1273;
    float _1897 = _1895 + 1.0;
    float _1899 = fma(_1561, _1871, _1883);
    float _1901 = fma(_1591, _1871, _1885);
    float _1903 = -_1275;
    float _1905 = _1903 + 1.0;
    float _1907 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1909 = _915 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1911 = _917 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1913 = _919 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1915 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1921 = -_1897;
    float _1923 = fma(_1733, _1921, _1759);
    float _1925 = fma(_1727, _1905, _1771);
    float _1927 = _1907 * _1867;
    float _1929 = _1567 + _1899;
    float _1931 = _1909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1933 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1935 = _1913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1937 = _1915 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1939 = _1917 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1941 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1943 = _1763 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1945 = _1729 + _1879;
    float _1947 = _1621 + _1901;
    out.m_54.x = _1887;
    out.m_54.y = _1927;
    out.m_54.z = _1923;
    out.m_54.w = _1925;
    bool _1949 = _1893 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1951 = isnan(_1893);
    bool _1953 = _1949 || _1951;
    bool _1955 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1957 = _1953 || _1955;
    out.m_56.x = _1937;
    out.m_56.y = _1939;
    out.m_56.z = _1941;
    out.m_58.x = _1931;
    out.m_58.y = _1933;
    out.m_58.z = _1935;
    out.m_58.w = _1943;
    out.m_60.x = _1929;
    out.m_60.y = _1945;
    out.m_60.z = _1947;
    if (!_1957)
    {
        _1783 = 1.0;
    }
    float _1959 = _1783;
    bool _1961 = !_1957;
    float _1963 = _1959;
    if (!_1961)
    {
        bool _1965 = _1893 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1967 = isnan(_1893);
        bool _1969 = _1965 || _1967;
        bool _1971 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1973 = _1969 || _1971;
        if (!_1973)
        {
            float _1975 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1977 = _1893 + _1975;
            float _1979 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1981 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1979;
            float _1983 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1985 = _1983 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1987 = 1.0 / _1981;
            float _1989 = _1977 * _1987;
            float _1991 = fma(_1989, _1985, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1963 = _1991;
            _1993 = true;
        }
        else
        {
            bool _1995 = _1893 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1997 = isnan(_1893);
            bool _1999 = _1995 || _1997;
            bool _2001 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2003 = _1999 || _2001;
            if (!_2003)
            {
                float _2005 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2007 = _1893 + _2005;
                float _2009 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2011 = _2009 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2013 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2015 = _2013 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2017 = 1.0 / _2011;
                float _2019 = _2007 * _2017;
                float _2021 = fma(_2019, _2015, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1963 = _2021;
                _1993 = true;
            }
            else
            {
                _1963 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1993 = false;
    float _2023 = _1963;
    float _2025 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2027 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2029 = _1839 + _2027;
    float _2031 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2025);
    float _2033 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2035 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2037 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan(0.5);
    bool _2043 = _2039 || _2041;
    float _2045 = fma(_2029, _2023, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2047 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2031);
    float _2049 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2033);
    bool _2051 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(0.5);
    bool _2059 = _2055 || _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2063 = _1845 + _2061;
    float _2065 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2067 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2069 = _1847 + _2067;
    float _2071 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2049);
    float _2073 = fma(_2063, _2023, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2075 = 1.0 / _2065;
    float _2077 = fma(_2069, _2023, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2079 = _2071 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2081 = _2079 + _2065;
    float _2083 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2085 = _2079;
    float _2087 = _2073;
    float _2089 = _2081;
    if (_2059)
    {
        _2083 = _2077;
    }
    float _2091 = _2083;
    float _2093 = _2091;
    if (_2059)
    {
        _2085 = _2045;
    }
    float _2095 = _2085;
    float _2097 = _2095;
    if (!_2059)
    {
        float _2099 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2101 = _1499 + _2099;
        float _2103 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2105 = _1643 + _2103;
        float _2107 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2109 = -_1499;
        float _2111 = _2109 + _2045;
        float _2113 = _2101 * _2101;
        float _2115 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2117 = _1471 + _2115;
        float _2119 = fma(_2105, _2105, _2113);
        float _2121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2123 = fma(_2117, _2117, _2119);
        float _2125 = sqrt(_2123);
        float _2127 = _2107 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2129 = -_1643;
        float _2131 = _2129 + _2077;
        float _2133 = precise::min(_2125, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2135 = _2133 * _2121;
        float _2137 = _2127 * _2135;
        float _2139 = -_1471;
        float _2141 = _2139 + _2073;
        float _2143 = fma(_2131, _2137, _1643);
        float _2145 = fma(_2111, _2137, _1499);
        float _2147 = fma(_2141, _2137, _1471);
        _2097 = _2145;
        _2093 = _2143;
        _2087 = _2147;
    }
    float _2149 = _2097;
    float _2151 = _2093;
    float _2153 = _2087;
    float _2155 = _2081 * _2075;
    float _2157 = _2155 * 0.5;
    float _2159 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2161 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_2043)
    {
        _2089 = 1.0;
    }
    float _2163 = _2089;
    float _2165 = _2163;
    if (!_2043)
    {
        float _2167 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2169 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2171 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2169);
        float _2173 = _2167 * 0.15915493667125701904296875;
        float _2175 = _2173 * 6.283185482025146484375;
        float _2177 = cos(_2175);
        float _2179 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2181 = _2179 * 0.15915493667125701904296875;
        float _2183 = _2173 * 6.283185482025146484375;
        float _2185 = sin(_2183);
        float _2187 = 1.0 / _2177;
        float _2189 = _2181 * 6.283185482025146484375;
        float _2191 = cos(_2189);
        float _2193 = _2185 * _2187;
        float _2195 = 1.0 / _2171;
        float _2197 = _2191 * _2193;
        float _2199 = _2181 * 6.283185482025146484375;
        float _2201 = sin(_2199);
        float _2203 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2205 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2203;
        float _2207 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2209 = _2195 * _2207;
        float _2211 = 1.0 / _2197;
        float _2213 = 1.0 / _2205;
        float _2215 = _2201 * _2211;
        float _2217 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2219 = fma(_2215, _2209, _2217);
        float _2221 = _2219 * _2213;
        float _2223 = precise::clamp(_2221, 0.0, 1.0);
        float _2225 = -_2223;
        float _2227 = _2225 + 1.0;
        _2165 = _2227;
    }
    float _2229 = _2165;
    float _2231 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2161);
    float _2233 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2235 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2159);
    float _2237 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2239 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2231);
    float _2241 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2233);
    float _2243 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2235);
    float _2245 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2237);
    float _2247 = _2239 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2249 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2241);
    float _2251 = _2243 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2253 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2245);
    float _2255 = _2247 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2257 = _2247 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2259 = _2247 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2261 = _2247 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2263 = _2249 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2265 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2255);
    float _2267 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2257);
    float _2269 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2259);
    float _2271 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2261);
    float _2273 = _2253 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2275 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2265);
    float _2277 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2267);
    float _2279 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2269);
    float _2281 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2271);
    bool _2283 = _2229 > 0.0;
    bool _2285 = isnan(_2229);
    bool _2287 = _2283 || _2285;
    bool _2289 = isnan(0.0);
    bool _2291 = _2287 || _2289;
    float _2293 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2275);
    float _2295 = _2229 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2297 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2277);
    float _2299 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2279);
    float _2301 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2281);
    float _2303 = _2295 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2305 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2307 = _2151 + _2305;
    float _2309 = _2297 + _2301;
    float _2311 = _2299 + _2301;
    float _2313 = _2301 * 0.5;
    float _2315 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2317 = _2149 + _2315;
    float _2319 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2321 = _2153 + _2319;
    float _2323 = _2309 * 0.5;
    float _2325 = _2311 * 0.5;
    float _2327 = fma(_2293, -0.5, _2313);
    out.m_62.x = _2307;
    out.m_62.y = _2317;
    out.m_62.z = _2321;
    out.m_35.x = _2303;
    out.gl_Position.x = _2297;
    out.gl_Position.y = _2293;
    out.gl_Position.z = _2299;
    out.gl_Position.w = _2301;
    out.m_64.x = _2323;
    out.m_64.y = _2327;
    out.m_64.z = _2325;
    out.m_64.w = _2301;
    if (_2291)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _2329 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2329;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1993 = false;
    bool _943 = false;
    bool _765 = false;
    bool _663 = false;
    bool _503 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_32.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    float _91 = as_type<float>(_83);
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _89;
    float _95 = _93;
    if (!_87)
    {
        out.m_35.x = 0.0;
    }
    int _97 = 0;
    if (!_87)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2388 = as_type<float>(_101);
        out.gl_Position.z = _2388;
    }
    if (!_87)
    {
        return out;
    }
    float _105 = in.m_37.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    float _123 = _119;
    if (_115)
    {
        float _125 = float(_83);
        _121 = _125;
    }
    float _127 = _121;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _95;
    float _139 = _137;
    if (_133)
    {
        out.m_35.x = 0.0;
    }
    if (_133)
    {
        float _141 = _137 * 5.0;
        _103 = as_type<int>(_141);
    }
    int _143 = _103;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2459 = as_type<float>(_143);
        out.gl_Position.z = _2459;
    }
    if (_133)
    {
        return out;
    }
    float _145 = in.m_37.x;
    float _147 = in.m_37.y;
    float _149 = in.m_37.z;
    float _151 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = 0.0;
    float _165 = _151;
    if (!_161)
    {
        float _167 = _151 * _151;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = 0.0;
    float _175 = _171;
    if (!_161)
    {
        float _177 = _119 * _119;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    if (!_161)
    {
        float _183 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _183;
    }
    float _185 = _175;
    bool _187 = !_161;
    float _189 = _185;
    if (!_187)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _151 * _193;
        float _203 = 1.0 / _197;
        float _205 = _199 * 0.693147182464599609375;
        float _207 = exp2(_201);
        float _209 = 1.0 / _205;
        float _211 = _207 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _209, _151);
        float _217 = _215 * _203;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _139 = _205;
        _189 = _219;
        _135 = _207;
    }
    float _221 = _139;
    float _223 = _189;
    float _225 = _135;
    bool _227 = !_161;
    float _229 = _221;
    float _231 = _225;
    if (!_227)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _151 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _229 = _245;
        _231 = _239;
        _165 = _251;
    }
    float _253 = _229;
    float _255 = _231;
    float _257 = _165;
    float _259 = _255;
    float _261 = _253;
    if (!_161)
    {
        _259 = _119;
    }
    float _263 = _259;
    float _265 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _267 = _263;
    if (!_161)
    {
        float _269 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _261 = _269;
    }
    float _271 = _261;
    bool _273 = !_161;
    float _275 = _271;
    if (!_273)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = _119 * _279;
        float _289 = exp2(_287);
        float _291 = _285 * 0.693147182464599609375;
        float _293 = 1.0 / _291;
        float _295 = 1.0 / _283;
        float _297 = _289 + (-1.0);
        float _299 = -_297;
        float _301 = fma(_299, _293, _119);
        float _303 = _301 * _295;
        float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _305;
    }
    float _307 = _275;
    bool _309 = !_161;
    if (!_309)
    {
        float _311 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = log2(_311);
        float _315 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _317 = _315 + 1.0;
        float _319 = 1.0 / _317;
        float _321 = _119 * _313;
        float _323 = exp2(_321);
        float _325 = -_323;
        float _327 = _325 + 1.0;
        float _329 = _327 * _319;
        _267 = _329;
    }
    float _331 = _267;
    float _333 = fma(_257, _145, _265);
    float _335 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = fma(_257, _147, _335);
    float _345 = fma(_331, _147, _337);
    float _347 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = fma(_257, _149, _339);
    float _351 = fma(_331, _145, _341);
    float _353 = -_345;
    float _355 = _343 + _353;
    float _357 = fma(_331, _149, _347);
    float _359 = in.m_39.y;
    float _361 = -_351;
    float _363 = _333 + _361;
    float _365 = _355 * _355;
    float _367 = -_357;
    float _369 = _349 + _367;
    float _371 = in.m_41.y;
    float _373 = fma(_363, _363, _365);
    float _375 = in.m_43.y;
    float _377 = fma(_369, _369, _373);
    float _379 = in.m_41.x;
    float _381 = in.m_39.x;
    float _383 = sqrt(_377);
    float _385 = in.m_43.x;
    float _387 = in.m_41.z;
    float _389 = _355 * _359;
    float _391 = in.m_39.z;
    float _393 = _355 * _371;
    float _395 = in.m_43.z;
    bool _397 = _383 >= 9.9999999747524270787835121154785e-07;
    bool _399 = isnan(_383);
    bool _401 = _397 || _399;
    bool _403 = isnan(9.9999999747524270787835121154785e-07);
    bool _405 = _401 || _403;
    float _407 = _355 * _375;
    float _409 = _359 * _359;
    float _411 = in.m_45.w;
    float _413 = fma(_363, _379, _393);
    float _415 = fma(_371, _371, _409);
    float _417 = in.m_32.x;
    float _419 = in.m_32.y;
    float _421 = in.m_32.z;
    float _423 = fma(_363, _381, _389);
    float _425 = fma(_375, _375, _415);
    float _427 = fma(_363, _385, _407);
    float _429 = fma(_369, _387, _413);
    float _431 = fma(_369, _391, _423);
    float _433 = fma(_369, _395, _427);
    float _435 = _427;
    float _437 = _343;
    float _439 = _411;
    if (_405)
    {
        _435 = _429;
    }
    float _441 = _435;
    float _443 = fma(_333, _411, _417);
    float _445 = fma(_343, _411, _419);
    float _447 = fma(_349, _411, _421);
    float _449 = _441;
    float _451 = _441;
    if (_405)
    {
        _437 = _431;
    }
    float _453 = _437;
    float _455 = _453;
    float _457 = _453;
    if (_405)
    {
        _439 = _433;
    }
    float _459 = _439;
    float _461 = _459;
    float _463 = _459;
    if (!_405)
    {
        bool _465 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _467 = !_465;
        if (!_467)
        {
            float _469 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _471 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _473 = _375 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _475 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[16].x, _469);
            float _477 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[16].x, _471);
            float _479 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[16].x, _473);
            float _481 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[16].z, _475);
            float _483 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[16].z, _477);
            float _485 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[16].z, _479);
            float _487 = _481 * _481;
            float _489 = fma(_483, _483, _487);
            float _491 = fma(_485, _485, _489);
            float _493 = rsqrt(_491);
            float _495 = _493 * 9.9999999747524270787835121154785e-07;
            float _497 = _483 * _495;
            float _499 = _481 * _495;
            float _501 = _485 * _495;
            _457 = _499;
            _451 = _497;
            _463 = _501;
            _503 = true;
        }
        else
        {
            float _505 = _147 * _147;
            float _507 = fma(_145, _145, _505);
            float _509 = fma(_149, _149, _507);
            float _511 = sqrt(_509);
            bool _513 = _511 >= 9.9999999747524270787835121154785e-07;
            bool _515 = isnan(_511);
            bool _517 = _513 || _515;
            bool _519 = isnan(9.9999999747524270787835121154785e-07);
            bool _521 = _517 || _519;
            if (!_521)
            {
                float _523 = _419 * _419;
                float _525 = fma(_417, _417, _523);
                float _527 = fma(_421, _421, _525);
                float _529 = sqrt(_527);
                bool _531 = _529 >= 9.9999999747524270787835121154785e-07;
                bool _533 = isnan(_529);
                bool _535 = _531 || _533;
                bool _537 = isnan(9.9999999747524270787835121154785e-07);
                bool _539 = _535 || _537;
                float _541 = _425;
                if (!_539)
                {
                    float _543 = rsqrt(_425);
                    _541 = _543;
                }
                float _545 = _541;
                if (!_539)
                {
                    float _547 = _545 * 9.9999999747524270787835121154785e-07;
                    _461 = _547;
                }
                float _549 = _461;
                float _551 = _549;
                if (!_539)
                {
                    float _553 = _371 * _549;
                    _449 = _553;
                }
                float _555 = _449;
                _451 = _555;
                if (!_539)
                {
                    float _557 = _359 * _549;
                    _455 = _557;
                }
                float _559 = _455;
                _457 = _559;
                if (!_539)
                {
                    float _561 = _375 * _549;
                    _551 = _561;
                }
                float _563 = _551;
                bool _565 = !_539;
                _463 = _563;
                _503 = _565;
                if (!_503)
                {
                    float _567 = _359 * _419;
                    float _569 = _371 * _419;
                    float _571 = _375 * _419;
                    float _573 = fma(_417, _381, _567);
                    float _575 = fma(_417, _379, _569);
                    float _577 = fma(_417, _385, _571);
                    float _579 = fma(_421, _391, _573);
                    float _581 = fma(_421, _387, _575);
                    float _583 = fma(_421, _395, _577);
                    float _585 = _579 * _579;
                    float _587 = fma(_581, _581, _585);
                    float _589 = fma(_583, _583, _587);
                    float _591 = rsqrt(_589);
                    float _593 = _591 * 9.9999999747524270787835121154785e-07;
                    float _595 = _581 * _593;
                    float _597 = _579 * _593;
                    float _599 = _583 * _593;
                    _457 = _597;
                    _451 = _595;
                    _463 = _599;
                    _503 = true;
                }
            }
            else
            {
                float _601 = _359 * _147;
                float _603 = _371 * _147;
                float _605 = _375 * _147;
                float _607 = fma(_145, _381, _601);
                float _609 = fma(_145, _379, _603);
                float _611 = fma(_145, _385, _605);
                float _613 = fma(_149, _391, _607);
                float _615 = fma(_149, _387, _609);
                float _617 = fma(_149, _395, _611);
                float _619 = _613 * _613;
                float _621 = fma(_615, _615, _619);
                float _623 = fma(_617, _617, _621);
                float _625 = rsqrt(_623);
                float _627 = _625 * 9.9999999747524270787835121154785e-07;
                float _629 = _615 * _627;
                float _631 = _613 * _627;
                float _633 = _617 * _627;
                _457 = _631;
                _451 = _629;
                _463 = _633;
            }
        }
    }
    _503 = false;
    float _635 = _457;
    float _637 = _451;
    float _639 = _463;
    bool _641 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _643 = !_641;
    float _661;
    if (!_643)
    {
        float _645 = in.m_47.x;
        float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _649 = _645 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _651 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _653 = _651 * _647;
        float _655 = floor(_653);
        float _657 = -_655;
        float _659 = _653 + _657;
        _661 = _659;
        _663 = true;
    }
    else
    {
        float _665 = float(_83);
        float _667 = 1.0 / _665;
        float _669 = _119 * _667;
        _661 = _669;
    }
    _663 = false;
    float _671 = _661;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _675 = _671 + _673;
    bool _677 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _679 = isnan(_671);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _689;
    float _693 = -_687;
    float _695 = _693 + 1.0;
    bool _697 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _699 = isnan(_671);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _709;
    bool _713 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _715 = 1.0 / _691;
    float _717 = _707 * _695;
    float _719 = -_707;
    float _721 = _719 + 1.0;
    float _723 = _675 * _715;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _725;
    float _729 = fma(_711, _723, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _731 = fma(_727, _723, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _733 = _729 * _717;
    float _735 = _731 * _717;
    float _737 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[143].x, _733);
    float _739 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[143].y, _735);
    float _741 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[144].x, _737);
    float _743 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[144].y, _739);
    bool _745 = !_713;
    float _763;
    if (!_745)
    {
        float _747 = in.m_47.x;
        float _749 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _751 = _747 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _753 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _755 = _753 * _749;
        float _757 = floor(_755);
        float _759 = -_757;
        float _761 = _755 + _759;
        _763 = _761;
        _765 = true;
    }
    else
    {
        float _767 = float(_83);
        float _769 = 1.0 / _767;
        float _771 = _119 * _769;
        _763 = _771;
    }
    _765 = false;
    float _773 = _763;
    float _775 = in.m_45.x;
    float _777 = in.m_45.y;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _781 = _773 + _779;
    bool _783 = _773 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _785 = isnan(_773);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _803 = 1.0 / _797;
    bool _805 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _807 = 1.0 / _801;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _809;
    float _813 = _743 * _777;
    float _815 = _781 * _803;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _819 = _773 + _817;
    bool _821 = _773 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _823 = isnan(_773);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = -_793;
    float _835 = _833 + 1.0;
    bool _837 = _773 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _839 = isnan(_773);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = fma(_811, _815, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _851 = _819 * _807;
    float _853 = _847 * _835;
    float _855 = -_847;
    float _857 = _855 + 1.0;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _863;
    float _867 = _831 * _857;
    float _869 = fma(_861, _815, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _871 = fma(_865, _815, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _873 = -_831;
    float _875 = _873 + 1.0;
    float _877 = _869 * _867;
    float _879 = _871 * _867;
    float _881 = _849 * _867;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _895 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[107].x, _877);
    float _897 = fma(_885, _851, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _899 = fma(_889, _851, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _901 = fma(_893, _851, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _903 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[107].y, _879);
    float _905 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[107].z, _881);
    float _907 = fma(_897, _853, _895);
    float _909 = _741 * _775;
    float _911 = fma(_899, _853, _903);
    float _913 = fma(_901, _853, _905);
    float _915 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[109].x, _907);
    float _917 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[109].y, _911);
    float _919 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[109].z, _913);
    bool _921 = !_805;
    float _923 = _899;
    float _941;
    if (!_921)
    {
        float _925 = in.m_47.x;
        float _927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _929 = _925 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _931 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _933 = _931 * _927;
        float _935 = floor(_933);
        float _937 = -_935;
        float _939 = _933 + _937;
        _941 = _939;
        _943 = true;
    }
    else
    {
        float _945 = float(_83);
        float _947 = 1.0 / _945;
        float _949 = _119 * _947;
        _91 = _947;
        _941 = _949;
    }
    _943 = false;
    float _951 = _91;
    float _953 = _941;
    float _955 = in.m_47.z;
    float _957 = _635 * _635;
    float _959 = _445 * _371;
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _963 = _961 != 0;
    float _965 = in.m_47.x;
    float _967 = fma(_637, _637, _957);
    float _969 = _445 * _375;
    float _971 = _445 * _359;
    float _973 = as_type<float>(int(gl_VertexIndex));
    float _975 = fma(_639, _639, _967);
    float _977 = fma(_443, _385, _969);
    float _979 = fma(_443, _379, _959);
    float _981 = fma(_443, _381, _971);
    float _983 = rsqrt(_975);
    float _985 = _951;
    float _987 = _959;
    if (!_963)
    {
        float _989 = in.m_47.y;
        _985 = _989;
    }
    float _991 = _985;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _995 = in.m_47.w;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _999 = _909 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1001 = _955 * 2.0;
    if (!_963)
    {
        _987 = _955;
    }
    float _1003 = _987;
    float _1005 = _813 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1007 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1009 = isnan(_953);
    bool _1011 = _1007 || _1009;
    bool _1013 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1015 = _1011 || _1013;
    float _1017 = float(_1015);
    float _1019 = _965 * 2.0;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1023 = _953 + _1021;
    float _1025 = floor(_1001);
    float _1027 = _983 * _639;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1031 = floor(_1019);
    float _1033 = _1003;
    if (!_963)
    {
        _923 = _991;
    }
    float _1035 = _923;
    float _1037 = _1035;
    float _1039 = _991;
    if (_963)
    {
        float _1041 = in.m_47.x;
        float _1043 = in.m_47.y;
        _1037 = _1041;
        _1039 = _1043;
    }
    float _1045 = _1037;
    float _1047 = _1039;
    bool _1049 = _1025 > 0.0;
    bool _1051 = _1025 >= 0.0;
    bool _1053 = isnan(_1025);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan(0.0);
    bool _1059 = _1055 || _1057;
    float _1061 = _1025;
    if (!_963)
    {
        _1061 = _955;
    }
    float _1063 = _1061;
    int _1065 = _1059 ? 0 : 1;
    int _1067 = as_type<int>(_973) & 1;
    bool _1069 = _1067 != 0;
    int _1071 = as_type<int>(_973) & 2;
    bool _1073 = _1071 != 0;
    int _1075 = ~_1065;
    int _1077 = _1075 + 1;
    int _1079 = _1077 + 1;
    int _1081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1083 = _1081 != 0;
    int _1085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1087 = _1085 != 0;
    int _1089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1091 = _1089 != 0;
    float _1093 = _983 * _635;
    int _1095 = _1079;
    float _1097 = _1063;
    if (!_1049)
    {
        int _1099 = ~_1065;
        int _1101 = _1099 + 1;
        _1095 = _1101;
    }
    int _1103 = _1095;
    float _1105 = _983 * _637;
    bool _1107 = _1031 > 0.0;
    float _1109 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1111 = log2(_1109);
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1115 = _1105 * _1113;
    float _1117 = _1047 * 2.0;
    if (_963)
    {
        _1033 = _1047;
    }
    float _1119 = _1033;
    float _1121 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_963)
    {
        _1097 = _1047;
    }
    float _1123 = _1097;
    float _1125 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[83].z, _997);
    bool _1127 = _1031 >= 0.0;
    bool _1129 = isnan(_1031);
    bool _1131 = _1127 || _1129;
    bool _1133 = isnan(0.0);
    bool _1135 = _1131 || _1133;
    float _1137 = floor(_1117);
    float _1139 = -_993;
    float _1141 = fma(_1121, 2.0, _1139);
    float _1143 = _955 + _1047;
    float _1145 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1029);
    float _1147 = _1111 * _119;
    int _1149 = _1135 ? 0 : 1;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1153 = _965 + _1047;
    float _1155 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1157 = _1143 + (-1.0);
    int _1159 = ~_1149;
    int _1161 = _1159 + 1;
    int _1163 = _1161 + 1;
    float _1165 = _1153 + (-1.0);
    float _1167 = fma(_1155, -2.0, _1151);
    float _1169 = exp2(_1147);
    int _1171 = _1163;
    if (!_1107)
    {
        int _1173 = ~_1149;
        int _1175 = _1173 + 1;
        _1171 = _1175;
    }
    int _1177 = _1171;
    float _1179 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1181 = !_1083;
    int _1183 = _1181 ? 0 : 1;
    float _1185 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1187 = _1137 > 0.0;
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1191 = -_1115;
    float _1193 = fma(_1093, _1189, _1191);
    bool _1195 = _1137 >= 0.0;
    bool _1197 = isnan(_1137);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan(0.0);
    bool _1203 = _1199 || _1201;
    bool _1205 = !_1087;
    int _1207 = _1205 ? 0 : 1;
    int _1209 = abs(_1183);
    int _1211 = abs(_1207);
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1215 = 1.0 + _1213;
    bool _1217 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1219 = isnan(1.0);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1225 = _1221 || _1223;
    float _1227 = in.m_52.x;
    float _1229 = in.m_52.y;
    float _1231 = in.m_52.z;
    float _1233 = float(_1209);
    float _1235 = 1.0 / _1215;
    float _1237 = float(_1103);
    float _1239 = float(_1211);
    float _1241 = _1233 * _1237;
    float _1243 = float(_1177);
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1249 = -_1169;
    float _1251 = _1249 + 1.0;
    bool _1253 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1255 = isnan(0.0);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1261 = _1257 || _1259;
    float _1263 = -_119;
    float _1265 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1141);
    float _1267 = _1239 * _1243;
    float _1269 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1167);
    float _1271 = _1261 ? _1251 : 0.0;
    float _1273 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1125);
    float _1275 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1145);
    float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1279 = _1027 * _1277;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1283 = _1093 * _1281;
    float _1285 = _1241 * (-2.0);
    if (_1225)
    {
        float _1287 = _1271 * _1235;
        _123 = _1287;
    }
    float _1289 = _123;
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1293 = -_1279;
    float _1295 = fma(_1105, _1291, _1293);
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1299 = _1297 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1303 = -_1283;
    float _1305 = fma(_1027, _1301, _1303);
    float _1307 = fma(_1185, _1285, _1185);
    float _1309 = _1295 * _1295;
    float _1311 = fma(_1285, _1227, _1227);
    int _1313 = _1203 ? 0 : 1;
    float _1315 = _965 + (-0.5);
    bool _1317 = !_1091;
    int _1319 = _1317 ? 0 : 1;
    float _1321 = fma(_1305, _1305, _1309);
    int _1323 = ~_1313;
    int _1325 = _1323 + 1;
    int _1327 = _1325 + 1;
    float _1329 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1311);
    int _1331 = abs(_1319);
    float _1333 = fma(_1193, _1193, _1321);
    int _1335 = _1327;
    if (!_1187)
    {
        int _1337 = ~_1313;
        int _1339 = _1337 + 1;
        _1335 = _1339;
    }
    int _1341 = _1335;
    float _1343 = _1267 * (-2.0);
    float _1345 = float(_1331);
    float _1347 = fma(_1307, _1289, _1329);
    float _1349 = float(_1341);
    float _1351 = fma(_1179, _1343, _1179);
    float _1353 = fma(_1343, _1229, _1229);
    float _1355 = _1047 + (-0.5);
    float _1357 = _965 + _955;
    float _1359 = _1345 * _1349;
    float _1361 = fma(_1355, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1353);
    float _1363 = _1357 + (-1.0);
    float _1365 = _1359 * (-2.0);
    float _1367 = 1.0 / _1247;
    float _1369 = fma(_1351, _1289, _1361);
    float _1371 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1373 = fma(_1365, _1231, _1231);
    float _1375 = _955 + (-0.5);
    float _1377 = _1347 * 0.15915493667125701904296875;
    float _1379 = fma(_1371, _1365, _1371);
    float _1381 = _1369 * 0.15915493667125701904296875;
    float _1383 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1373);
    float _1385 = rsqrt(_1333);
    bool _1387 = _955 > 0.5;
    float _1389 = fma(_1379, _1289, _1383);
    bool _1391 = _995 > 0.5;
    bool _1393 = _965 > 0.5;
    float _1395 = _1389 * 0.15915493667125701904296875;
    float _1397 = _1377 * 6.283185482025146484375;
    float _1399 = sin(_1397);
    float _1401 = fma(_447, _387, _979);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1403;
    bool _1407 = !_1069;
    float _1409 = _1407 ? (-0.5) : 0.5;
    float _1411 = _1377 * 6.283185482025146484375;
    float _1413 = cos(_1411);
    bool _1415 = !_1073;
    float _1417 = _1415 ? (-0.5) : 0.5;
    float _1419 = _1405 * _1367;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1423 = _1421 != 0;
    float _1425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1409);
    int _1427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1429 = _1427 != 0;
    float _1431 = _1305 * _1385;
    int _1433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1435 = _1433 != 0;
    float _1437 = _1381 * 6.283185482025146484375;
    float _1439 = sin(_1437);
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1443 = _1441 != 0;
    float _1445 = fma(_447, _391, _981);
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1449 = _953 + _1447;
    float _1451 = fma(_447, _395, _977);
    float _1453 = _1295 * _1385;
    float _1455 = _1193 * _1385;
    float _1457 = fma(_1419, _1449, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1459 = _1381 * 6.283185482025146484375;
    float _1461 = cos(_1459);
    float _1463 = _999 * _1425;
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1467 = _1465 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1469 = _1093 * _1455;
    float _1471 = _1451 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1473 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1475 = isnan(_953);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1481 = _1477 || _1479;
    float _1483 = float(_1481);
    float _1485 = _1027 * _1431;
    float _1487 = _1395 * 6.283185482025146484375;
    float _1489 = sin(_1487);
    float _1491 = _1399 * _1439;
    float _1493 = _1413 * _1439;
    float _1495 = -_1483;
    float _1497 = _1495 + 1.0;
    float _1499 = _1445 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1501 = _1395 * 6.283185482025146484375;
    float _1503 = cos(_1501);
    float _1505 = _1413 * _1461;
    float _1507 = _1399 * _1461;
    float _1509 = 1.0 / _1299;
    float _1511 = fma(_1489, _1505, _1491);
    float _1513 = -_1493;
    float _1515 = fma(_1489, _1507, _1513);
    float _1517 = -_1507;
    float _1519 = fma(_1489, _1493, _1517);
    float _1521 = fma(_1489, _1491, _1505);
    float _1523 = _1511 * _1105;
    float _1525 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1417);
    float _1527 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1529 = _1413 * _1503;
    float _1531 = _1461 * _1503;
    float _1533 = _1439 * _1503;
    float _1535 = _1399 * _1503;
    float _1537 = _1529 * _1105;
    float _1539 = -_1469;
    float _1541 = fma(_1027, _1453, _1539);
    float _1543 = fma(_1531, _1431, _1523);
    float _1545 = _1005 * _1525;
    float _1547 = _1467 * _1509;
    float _1549 = _1519 * _1105;
    float _1551 = -_1489;
    float _1553 = fma(_1551, _1431, _1537);
    float _1555 = _1105 * _1453;
    float _1557 = _1511 * _1027;
    float _1559 = fma(_1533, _1431, _1549);
    float _1561 = fma(_1515, _1541, _1543);
    float _1563 = _1519 * _1027;
    float _1565 = fma(_1535, _1541, _1553);
    float _1567 = fma(_1521, _1541, _1559);
    float _1569 = -_1555;
    float _1571 = fma(_1093, _1431, _1569);
    float _1573 = fma(_1531, _1455, _1557);
    float _1575 = _1529 * _1027;
    bool _1577 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1579 = isnan(_953);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1585 = _1581 || _1583;
    float _1587 = float(_1585);
    float _1589 = fma(_1533, _1455, _1563);
    float _1591 = fma(_1515, _1571, _1573);
    float _1593 = -_1489;
    float _1595 = fma(_1593, _1455, _1575);
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1599 = _1597 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1601 = -_1587;
    float _1603 = _1601 + 1.0;
    bool _1605 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1607 = isnan(_953);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1613 = _1609 || _1611;
    float _1615 = float(_1613);
    float _1617 = fma(_1535, _1571, _1595);
    float _1619 = 1.0 / _1599;
    float _1621 = fma(_1521, _1571, _1589);
    float _1623 = _1483 * _1603;
    float _1625 = _1545 * _1565;
    float _1627 = _1545 * _1617;
    float _1629 = _1615 * _1497;
    float _1631 = -_1615;
    float _1633 = _1631 + 1.0;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1635;
    float _1639 = fma(_1463, _1561, _1625);
    float _1641 = fma(_1463, _1591, _1627);
    float _1643 = _1401 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1645 = _1017 * _1633;
    float _1647 = fma(_1527, _1567, _1639);
    float _1649 = fma(_1527, _1621, _1641);
    float _1651 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1653 = _953 + _1651;
    float _1655 = _1637 * _1619;
    float _1657 = _1643 + _1647;
    float _1659 = _1471 + _1649;
    float _1661 = _1457 * _1645;
    float _1663 = fma(_1547, _1023, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1665 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1667 = _1657 + _1665;
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1671 = _1659 + _1669;
    float _1673 = fma(_1655, _1653, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1675 = _1529 * _1093;
    float _1677 = _1667 * _1667;
    float _1679 = _1671 * _1671;
    float _1681 = -_1485;
    float _1683 = fma(_1105, _1455, _1681);
    float _1685 = _1511 * _1093;
    float _1687 = -_1489;
    float _1689 = fma(_1687, _1453, _1675);
    float _1691 = _1677 + _1679;
    float _1693 = _1519 * _1093;
    float _1695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1697 = fma(_1531, _1453, _1685);
    float _1699 = fma(_1535, _1683, _1689);
    float _1701 = -_1017;
    float _1703 = _1701 + 1.0;
    float _1705 = fma(_1533, _1453, _1693);
    float _1707 = -_1417;
    int _1709 = _1391 ? as_type<int>(_1707) : as_type<int>(_1417);
    float _1711 = fma(_1515, _1683, _1697);
    float _1713 = _1545 * _1699;
    float _1715 = sqrt(_1691);
    float _1717 = fma(_1703, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1661);
    float _1719 = -_1409;
    int _1721 = _1387 ? as_type<int>(_1719) : as_type<int>(_1409);
    float _1723 = fma(_1463, _1711, _1713);
    bool _1725 = !_1429;
    float _1727 = _1725 ? _1417 : as_type<float>(_1709);
    float _1729 = fma(_1521, _1683, _1705);
    bool _1731 = !_1423;
    float _1733 = _1731 ? _1409 : as_type<float>(_1721);
    float _1735 = fma(_1663, _1629, _1717);
    float _1737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1739 = fma(_1527, _1729, _1723);
    bool _1741 = _1047 > 0.5;
    float _1743 = _1695 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1745 = _1733 + 0.5;
    float _1747 = _1499 + _1739;
    float _1749 = fma(_1673, _1623, _1735);
    float _1751 = -_1417;
    int _1753 = _1741 ? as_type<int>(_1751) : as_type<int>(_1417);
    float _1755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1757 = _1715 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1759 = fma(_1743, _1745, _1265);
    float _1761 = _1727 + (-0.5);
    float _1763 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1749);
    float _1765 = _1737 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1767 = -_1765;
    float _1769 = -_1269;
    float _1771 = fma(_1767, _1761, _1769);
    float _1773 = _1761;
    float _1775 = _1677;
    float _1777 = _1679;
    float _1779 = _1659;
    float _1781 = _1657;
    float _1783 = _1621;
    if (!_1757)
    {
        _1773 = _1747;
    }
    float _1785 = _1773;
    bool _1787 = !_1757;
    float _1789 = _1785;
    if (!_1787)
    {
        float _1791 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1795 = _1715 + _1793;
        float _1797 = _1747 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1799 = rsqrt(_1691);
        float _1801 = _1795 * _1791;
        float _1803 = _1801 * 0.15915493667125701904296875;
        float _1805 = _1803 * 6.283185482025146484375;
        float _1807 = sin(_1805);
        float _1809 = _1803 * 6.283185482025146484375;
        float _1811 = cos(_1809);
        float _1813 = fma(_1807, _1797, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1815 = _1799 * _1813;
        float _1817 = fma(_1667, _1815, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1819 = _1811 + (-1.0);
        float _1821 = fma(_1671, _1815, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1823 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1825 = _1817 + _1823;
        float _1827 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1829 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1831 = _1821 + _1829;
        float _1833 = _1825 * _1825;
        float _1835 = fma(_1747, _1811, _1827);
        float _1837 = _1831 * _1831;
        _1789 = _1835;
        _1775 = _1833;
        _1777 = _1837;
        _1779 = _1821;
        _1781 = _1817;
    }
    float _1839 = _1789;
    float _1841 = _1775;
    float _1843 = _1777;
    float _1845 = _1779;
    float _1847 = _1781;
    float _1849 = -_1409;
    int _1851 = _1393 ? as_type<int>(_1849) : as_type<int>(_1409);
    float _1853 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1855 = _1839 + _1853;
    bool _1857 = !_1443;
    float _1859 = _1857 ? _1417 : as_type<float>(_1753);
    float _1861 = _1417 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1863 = !_1435;
    float _1865 = _1863 ? _1409 : as_type<float>(_1851);
    float _1867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1869 = fma(_1855, _1855, _1841);
    float _1871 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1873 = _1699 * _1861;
    float _1875 = _1865 + 0.5;
    float _1877 = _1869 + _1843;
    float _1879 = fma(_1711, _1871, _1873);
    float _1881 = _1875 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1883 = _1565 * _1861;
    float _1885 = _1617 * _1861;
    float _1887 = _1881 * _1755;
    float _1889 = -_1859;
    float _1891 = _1889 + 0.5;
    float _1893 = sqrt(_1877);
    float _1895 = -_1273;
    float _1897 = _1895 + 1.0;
    float _1899 = fma(_1561, _1871, _1883);
    float _1901 = fma(_1591, _1871, _1885);
    float _1903 = -_1275;
    float _1905 = _1903 + 1.0;
    float _1907 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1909 = _915 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1911 = _917 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1913 = _919 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1915 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1921 = -_1897;
    float _1923 = fma(_1733, _1921, _1759);
    float _1925 = fma(_1727, _1905, _1771);
    float _1927 = _1907 * _1867;
    float _1929 = _1567 + _1899;
    float _1931 = _1909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1933 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1935 = _1913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1937 = _1915 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1939 = _1917 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1941 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1943 = _1763 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1945 = _1729 + _1879;
    float _1947 = _1621 + _1901;
    out.m_54.x = _1887;
    out.m_54.y = _1927;
    out.m_54.z = _1923;
    out.m_54.w = _1925;
    bool _1949 = _1893 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1951 = isnan(_1893);
    bool _1953 = _1949 || _1951;
    bool _1955 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1957 = _1953 || _1955;
    out.m_56.x = _1937;
    out.m_56.y = _1939;
    out.m_56.z = _1941;
    out.m_58.x = _1931;
    out.m_58.y = _1933;
    out.m_58.z = _1935;
    out.m_58.w = _1943;
    out.m_60.x = _1929;
    out.m_60.y = _1945;
    out.m_60.z = _1947;
    if (!_1957)
    {
        _1783 = 1.0;
    }
    float _1959 = _1783;
    bool _1961 = !_1957;
    float _1963 = _1959;
    if (!_1961)
    {
        bool _1965 = _1893 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1967 = isnan(_1893);
        bool _1969 = _1965 || _1967;
        bool _1971 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1973 = _1969 || _1971;
        if (!_1973)
        {
            float _1975 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1977 = _1893 + _1975;
            float _1979 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1981 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1979;
            float _1983 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1985 = _1983 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1987 = 1.0 / _1981;
            float _1989 = _1977 * _1987;
            float _1991 = fma(_1989, _1985, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1963 = _1991;
            _1993 = true;
        }
        else
        {
            bool _1995 = _1893 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1997 = isnan(_1893);
            bool _1999 = _1995 || _1997;
            bool _2001 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2003 = _1999 || _2001;
            if (!_2003)
            {
                float _2005 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2007 = _1893 + _2005;
                float _2009 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2011 = _2009 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2013 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2015 = _2013 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2017 = 1.0 / _2011;
                float _2019 = _2007 * _2017;
                float _2021 = fma(_2019, _2015, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1963 = _2021;
                _1993 = true;
            }
            else
            {
                _1963 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1993 = false;
    float _2023 = _1963;
    float _2025 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2027 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2029 = _1839 + _2027;
    float _2031 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2025);
    float _2033 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2035 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2037 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan(0.5);
    bool _2043 = _2039 || _2041;
    float _2045 = fma(_2029, _2023, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2047 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2031);
    float _2049 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2033);
    bool _2051 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(0.5);
    bool _2059 = _2055 || _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2063 = _1845 + _2061;
    float _2065 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2067 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2069 = _1847 + _2067;
    float _2071 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2049);
    float _2073 = fma(_2063, _2023, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2075 = 1.0 / _2065;
    float _2077 = fma(_2069, _2023, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2079 = _2071 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2081 = _2079 + _2065;
    float _2083 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2085 = _2079;
    float _2087 = _2073;
    float _2089 = _2081;
    if (_2059)
    {
        _2083 = _2077;
    }
    float _2091 = _2083;
    float _2093 = _2091;
    if (_2059)
    {
        _2085 = _2045;
    }
    float _2095 = _2085;
    float _2097 = _2095;
    if (!_2059)
    {
        float _2099 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2101 = _1499 + _2099;
        float _2103 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2105 = _1643 + _2103;
        float _2107 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2109 = -_1499;
        float _2111 = _2109 + _2045;
        float _2113 = _2101 * _2101;
        float _2115 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2117 = _1471 + _2115;
        float _2119 = fma(_2105, _2105, _2113);
        float _2121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2123 = fma(_2117, _2117, _2119);
        float _2125 = sqrt(_2123);
        float _2127 = _2107 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2129 = -_1643;
        float _2131 = _2129 + _2077;
        float _2133 = precise::min(_2125, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2135 = _2133 * _2121;
        float _2137 = _2127 * _2135;
        float _2139 = -_1471;
        float _2141 = _2139 + _2073;
        float _2143 = fma(_2131, _2137, _1643);
        float _2145 = fma(_2111, _2137, _1499);
        float _2147 = fma(_2141, _2137, _1471);
        _2097 = _2145;
        _2093 = _2143;
        _2087 = _2147;
    }
    float _2149 = _2097;
    float _2151 = _2093;
    float _2153 = _2087;
    float _2155 = _2081 * _2075;
    float _2157 = _2155 * 0.5;
    float _2159 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2161 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_2043)
    {
        _2089 = 1.0;
    }
    float _2163 = _2089;
    float _2165 = _2163;
    if (!_2043)
    {
        float _2167 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2169 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2171 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2169);
        float _2173 = _2167 * 0.15915493667125701904296875;
        float _2175 = _2173 * 6.283185482025146484375;
        float _2177 = cos(_2175);
        float _2179 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2181 = _2179 * 0.15915493667125701904296875;
        float _2183 = _2173 * 6.283185482025146484375;
        float _2185 = sin(_2183);
        float _2187 = 1.0 / _2177;
        float _2189 = _2181 * 6.283185482025146484375;
        float _2191 = cos(_2189);
        float _2193 = _2185 * _2187;
        float _2195 = 1.0 / _2171;
        float _2197 = _2191 * _2193;
        float _2199 = _2181 * 6.283185482025146484375;
        float _2201 = sin(_2199);
        float _2203 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2205 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2203;
        float _2207 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2209 = _2195 * _2207;
        float _2211 = 1.0 / _2197;
        float _2213 = 1.0 / _2205;
        float _2215 = _2201 * _2211;
        float _2217 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2219 = fma(_2215, _2209, _2217);
        float _2221 = _2219 * _2213;
        float _2223 = precise::clamp(_2221, 0.0, 1.0);
        float _2225 = -_2223;
        float _2227 = _2225 + 1.0;
        _2165 = _2227;
    }
    float _2229 = _2165;
    float _2231 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2161);
    float _2233 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2235 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2159);
    float _2237 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2239 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2231);
    float _2241 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2233);
    float _2243 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2235);
    float _2245 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2237);
    float _2247 = _2239 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2249 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2241);
    float _2251 = _2243 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2253 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2245);
    float _2255 = _2247 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2257 = _2247 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2259 = _2247 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2261 = _2247 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2263 = _2249 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2265 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2255);
    float _2267 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2257);
    float _2269 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2259);
    float _2271 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2261);
    float _2273 = _2253 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2275 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2265);
    float _2277 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2267);
    float _2279 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2269);
    float _2281 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2271);
    bool _2283 = _2229 > 0.0;
    bool _2285 = isnan(_2229);
    bool _2287 = _2283 || _2285;
    bool _2289 = isnan(0.0);
    bool _2291 = _2287 || _2289;
    float _2293 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2275);
    float _2295 = _2229 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2297 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2277);
    float _2299 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2279);
    float _2301 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2281);
    float _2303 = _2295 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2305 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2307 = _2151 + _2305;
    float _2309 = _2297 + _2301;
    float _2311 = _2299 + _2301;
    float _2313 = _2301 * 0.5;
    float _2315 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2317 = _2149 + _2315;
    float _2319 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2321 = _2153 + _2319;
    float _2323 = _2309 * 0.5;
    float _2325 = _2311 * 0.5;
    float _2327 = fma(_2293, -0.5, _2313);
    out.m_62.x = _2307;
    out.m_62.y = _2317;
    out.m_62.z = _2321;
    out.m_35.x = _2303;
    out.gl_Position.x = _2297;
    out.gl_Position.y = _2293;
    out.gl_Position.z = _2299;
    out.gl_Position.w = _2301;
    out.m_64.x = _2323;
    out.m_64.y = _2327;
    out.m_64.z = _2325;
    out.m_64.w = _2301;
    if (_2291)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _2329 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2329;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1993 = false;
    bool _943 = false;
    bool _765 = false;
    bool _663 = false;
    bool _503 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_32.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    float _91 = as_type<float>(_83);
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _89;
    float _95 = _93;
    if (!_87)
    {
        out.m_35.x = 0.0;
    }
    int _97 = 0;
    if (!_87)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2388 = as_type<float>(_101);
        out.gl_Position.z = _2388;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_37.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    float _123 = _119;
    if (_115)
    {
        float _125 = float(_83);
        _121 = _125;
    }
    float _127 = _121;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _95;
    float _139 = _137;
    if (_133)
    {
        out.m_35.x = 0.0;
    }
    if (_133)
    {
        float _141 = _137 * 5.0;
        _103 = as_type<int>(_141);
    }
    int _143 = _103;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2459 = as_type<float>(_143);
        out.gl_Position.z = _2459;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_37.x;
    float _147 = in.m_37.y;
    float _149 = in.m_37.z;
    float _151 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = 0.0;
    float _165 = _151;
    if (!_161)
    {
        float _167 = _151 * _151;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = 0.0;
    float _175 = _171;
    if (!_161)
    {
        float _177 = _119 * _119;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    if (!_161)
    {
        float _183 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _183;
    }
    float _185 = _175;
    bool _187 = !_161;
    float _189 = _185;
    if (!_187)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _151 * _193;
        float _203 = 1.0 / _197;
        float _205 = _199 * 0.693147182464599609375;
        float _207 = exp2(_201);
        float _209 = 1.0 / _205;
        float _211 = _207 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _209, _151);
        float _217 = _215 * _203;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _139 = _205;
        _189 = _219;
        _135 = _207;
    }
    float _221 = _139;
    float _223 = _189;
    float _225 = _135;
    bool _227 = !_161;
    float _229 = _221;
    float _231 = _225;
    if (!_227)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _151 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _229 = _245;
        _231 = _239;
        _165 = _251;
    }
    float _253 = _229;
    float _255 = _231;
    float _257 = _165;
    float _259 = _255;
    float _261 = _253;
    if (!_161)
    {
        _259 = _119;
    }
    float _263 = _259;
    float _265 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _267 = _263;
    if (!_161)
    {
        float _269 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _261 = _269;
    }
    float _271 = _261;
    bool _273 = !_161;
    float _275 = _271;
    if (!_273)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = _119 * _279;
        float _289 = exp2(_287);
        float _291 = _285 * 0.693147182464599609375;
        float _293 = 1.0 / _291;
        float _295 = 1.0 / _283;
        float _297 = _289 + (-1.0);
        float _299 = -_297;
        float _301 = fma(_299, _293, _119);
        float _303 = _301 * _295;
        float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _305;
    }
    float _307 = _275;
    bool _309 = !_161;
    if (!_309)
    {
        float _311 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = log2(_311);
        float _315 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _317 = _315 + 1.0;
        float _319 = 1.0 / _317;
        float _321 = _119 * _313;
        float _323 = exp2(_321);
        float _325 = -_323;
        float _327 = _325 + 1.0;
        float _329 = _327 * _319;
        _267 = _329;
    }
    float _331 = _267;
    float _333 = fma(_257, _145, _265);
    float _335 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = fma(_257, _147, _335);
    float _345 = fma(_331, _147, _337);
    float _347 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = fma(_257, _149, _339);
    float _351 = fma(_331, _145, _341);
    float _353 = -_345;
    float _355 = _343 + _353;
    float _357 = fma(_331, _149, _347);
    float _359 = in.m_39.y;
    float _361 = -_351;
    float _363 = _333 + _361;
    float _365 = _355 * _355;
    float _367 = -_357;
    float _369 = _349 + _367;
    float _371 = in.m_41.y;
    float _373 = fma(_363, _363, _365);
    float _375 = in.m_43.y;
    float _377 = fma(_369, _369, _373);
    float _379 = in.m_41.x;
    float _381 = in.m_39.x;
    float _383 = sqrt(_377);
    float _385 = in.m_43.x;
    float _387 = in.m_41.z;
    float _389 = _355 * _359;
    float _391 = in.m_39.z;
    float _393 = _355 * _371;
    float _395 = in.m_43.z;
    bool _397 = _383 >= 9.9999999747524270787835121154785e-07;
    bool _399 = isnan(_383);
    bool _401 = _397 || _399;
    bool _403 = isnan(9.9999999747524270787835121154785e-07);
    bool _405 = _401 || _403;
    float _407 = _355 * _375;
    float _409 = _359 * _359;
    float _411 = in.m_45.w;
    float _413 = fma(_363, _379, _393);
    float _415 = fma(_371, _371, _409);
    float _417 = in.m_32.x;
    float _419 = in.m_32.y;
    float _421 = in.m_32.z;
    float _423 = fma(_363, _381, _389);
    float _425 = fma(_375, _375, _415);
    float _427 = fma(_363, _385, _407);
    float _429 = fma(_369, _387, _413);
    float _431 = fma(_369, _391, _423);
    float _433 = fma(_369, _395, _427);
    float _435 = _427;
    float _437 = _343;
    float _439 = _411;
    if (_405)
    {
        _435 = _429;
    }
    float _441 = _435;
    float _443 = fma(_333, _411, _417);
    float _445 = fma(_343, _411, _419);
    float _447 = fma(_349, _411, _421);
    float _449 = _441;
    float _451 = _441;
    if (_405)
    {
        _437 = _431;
    }
    float _453 = _437;
    float _455 = _453;
    float _457 = _453;
    if (_405)
    {
        _439 = _433;
    }
    float _459 = _439;
    float _461 = _459;
    float _463 = _459;
    if (!_405)
    {
        bool _465 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _467 = !_465;
        if (!_467)
        {
            float _469 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _471 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _473 = _375 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _475 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[16].x, _469);
            float _477 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[16].x, _471);
            float _479 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[16].x, _473);
            float _481 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[16].z, _475);
            float _483 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[16].z, _477);
            float _485 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[16].z, _479);
            float _487 = _481 * _481;
            float _489 = fma(_483, _483, _487);
            float _491 = fma(_485, _485, _489);
            float _493 = rsqrt(_491);
            float _495 = _493 * 9.9999999747524270787835121154785e-07;
            float _497 = _483 * _495;
            float _499 = _481 * _495;
            float _501 = _485 * _495;
            _457 = _499;
            _451 = _497;
            _463 = _501;
            _503 = true;
        }
        else
        {
            float _505 = _147 * _147;
            float _507 = fma(_145, _145, _505);
            float _509 = fma(_149, _149, _507);
            float _511 = sqrt(_509);
            bool _513 = _511 >= 9.9999999747524270787835121154785e-07;
            bool _515 = isnan(_511);
            bool _517 = _513 || _515;
            bool _519 = isnan(9.9999999747524270787835121154785e-07);
            bool _521 = _517 || _519;
            if (!_521)
            {
                float _523 = _419 * _419;
                float _525 = fma(_417, _417, _523);
                float _527 = fma(_421, _421, _525);
                float _529 = sqrt(_527);
                bool _531 = _529 >= 9.9999999747524270787835121154785e-07;
                bool _533 = isnan(_529);
                bool _535 = _531 || _533;
                bool _537 = isnan(9.9999999747524270787835121154785e-07);
                bool _539 = _535 || _537;
                float _541 = _425;
                if (!_539)
                {
                    float _543 = rsqrt(_425);
                    _541 = _543;
                }
                float _545 = _541;
                if (!_539)
                {
                    float _547 = _545 * 9.9999999747524270787835121154785e-07;
                    _461 = _547;
                }
                float _549 = _461;
                float _551 = _549;
                if (!_539)
                {
                    float _553 = _371 * _549;
                    _449 = _553;
                }
                float _555 = _449;
                _451 = _555;
                if (!_539)
                {
                    float _557 = _359 * _549;
                    _455 = _557;
                }
                float _559 = _455;
                _457 = _559;
                if (!_539)
                {
                    float _561 = _375 * _549;
                    _551 = _561;
                }
                float _563 = _551;
                bool _565 = !_539;
                _463 = _563;
                _503 = _565;
                if (!_503)
                {
                    float _567 = _359 * _419;
                    float _569 = _371 * _419;
                    float _571 = _375 * _419;
                    float _573 = fma(_417, _381, _567);
                    float _575 = fma(_417, _379, _569);
                    float _577 = fma(_417, _385, _571);
                    float _579 = fma(_421, _391, _573);
                    float _581 = fma(_421, _387, _575);
                    float _583 = fma(_421, _395, _577);
                    float _585 = _579 * _579;
                    float _587 = fma(_581, _581, _585);
                    float _589 = fma(_583, _583, _587);
                    float _591 = rsqrt(_589);
                    float _593 = _591 * 9.9999999747524270787835121154785e-07;
                    float _595 = _581 * _593;
                    float _597 = _579 * _593;
                    float _599 = _583 * _593;
                    _457 = _597;
                    _451 = _595;
                    _463 = _599;
                    _503 = true;
                }
            }
            else
            {
                float _601 = _359 * _147;
                float _603 = _371 * _147;
                float _605 = _375 * _147;
                float _607 = fma(_145, _381, _601);
                float _609 = fma(_145, _379, _603);
                float _611 = fma(_145, _385, _605);
                float _613 = fma(_149, _391, _607);
                float _615 = fma(_149, _387, _609);
                float _617 = fma(_149, _395, _611);
                float _619 = _613 * _613;
                float _621 = fma(_615, _615, _619);
                float _623 = fma(_617, _617, _621);
                float _625 = rsqrt(_623);
                float _627 = _625 * 9.9999999747524270787835121154785e-07;
                float _629 = _615 * _627;
                float _631 = _613 * _627;
                float _633 = _617 * _627;
                _457 = _631;
                _451 = _629;
                _463 = _633;
            }
        }
    }
    _503 = false;
    float _635 = _457;
    float _637 = _451;
    float _639 = _463;
    bool _641 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _643 = !_641;
    float _661;
    if (!_643)
    {
        float _645 = in.m_47.x;
        float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _649 = _645 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _651 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _653 = _651 * _647;
        float _655 = floor(_653);
        float _657 = -_655;
        float _659 = _653 + _657;
        _661 = _659;
        _663 = true;
    }
    else
    {
        float _665 = float(_83);
        float _667 = 1.0 / _665;
        float _669 = _119 * _667;
        _661 = _669;
    }
    _663 = false;
    float _671 = _661;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _675 = _671 + _673;
    bool _677 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _679 = isnan(_671);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _689;
    float _693 = -_687;
    float _695 = _693 + 1.0;
    bool _697 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _699 = isnan(_671);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _709;
    bool _713 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _715 = 1.0 / _691;
    float _717 = _707 * _695;
    float _719 = -_707;
    float _721 = _719 + 1.0;
    float _723 = _675 * _715;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _725;
    float _729 = fma(_711, _723, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _731 = fma(_727, _723, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _733 = _729 * _717;
    float _735 = _731 * _717;
    float _737 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[143].x, _733);
    float _739 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[143].y, _735);
    float _741 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[144].x, _737);
    float _743 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[144].y, _739);
    bool _745 = !_713;
    float _763;
    if (!_745)
    {
        float _747 = in.m_47.x;
        float _749 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _751 = _747 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _753 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _755 = _753 * _749;
        float _757 = floor(_755);
        float _759 = -_757;
        float _761 = _755 + _759;
        _763 = _761;
        _765 = true;
    }
    else
    {
        float _767 = float(_83);
        float _769 = 1.0 / _767;
        float _771 = _119 * _769;
        _763 = _771;
    }
    _765 = false;
    float _773 = _763;
    float _775 = in.m_45.x;
    float _777 = in.m_45.y;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _781 = _773 + _779;
    bool _783 = _773 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _785 = isnan(_773);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _803 = 1.0 / _797;
    bool _805 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _807 = 1.0 / _801;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _809;
    float _813 = _743 * _777;
    float _815 = _781 * _803;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _819 = _773 + _817;
    bool _821 = _773 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _823 = isnan(_773);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = -_793;
    float _835 = _833 + 1.0;
    bool _837 = _773 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _839 = isnan(_773);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = fma(_811, _815, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _851 = _819 * _807;
    float _853 = _847 * _835;
    float _855 = -_847;
    float _857 = _855 + 1.0;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _863;
    float _867 = _831 * _857;
    float _869 = fma(_861, _815, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _871 = fma(_865, _815, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _873 = -_831;
    float _875 = _873 + 1.0;
    float _877 = _869 * _867;
    float _879 = _871 * _867;
    float _881 = _849 * _867;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _895 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[107].x, _877);
    float _897 = fma(_885, _851, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _899 = fma(_889, _851, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _901 = fma(_893, _851, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _903 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[107].y, _879);
    float _905 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[107].z, _881);
    float _907 = fma(_897, _853, _895);
    float _909 = _741 * _775;
    float _911 = fma(_899, _853, _903);
    float _913 = fma(_901, _853, _905);
    float _915 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[109].x, _907);
    float _917 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[109].y, _911);
    float _919 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[109].z, _913);
    bool _921 = !_805;
    float _923 = _899;
    float _941;
    if (!_921)
    {
        float _925 = in.m_47.x;
        float _927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _929 = _925 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _931 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _933 = _931 * _927;
        float _935 = floor(_933);
        float _937 = -_935;
        float _939 = _933 + _937;
        _941 = _939;
        _943 = true;
    }
    else
    {
        float _945 = float(_83);
        float _947 = 1.0 / _945;
        float _949 = _119 * _947;
        _91 = _947;
        _941 = _949;
    }
    _943 = false;
    float _951 = _91;
    float _953 = _941;
    float _955 = in.m_47.z;
    float _957 = _635 * _635;
    float _959 = _445 * _371;
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _963 = _961 != 0;
    float _965 = in.m_47.x;
    float _967 = fma(_637, _637, _957);
    float _969 = _445 * _375;
    float _971 = _445 * _359;
    float _973 = as_type<float>(int(gl_VertexIndex));
    float _975 = fma(_639, _639, _967);
    float _977 = fma(_443, _385, _969);
    float _979 = fma(_443, _379, _959);
    float _981 = fma(_443, _381, _971);
    float _983 = rsqrt(_975);
    float _985 = _951;
    float _987 = _959;
    if (!_963)
    {
        float _989 = in.m_47.y;
        _985 = _989;
    }
    float _991 = _985;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _995 = in.m_47.w;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _999 = _909 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1001 = _955 * 2.0;
    if (!_963)
    {
        _987 = _955;
    }
    float _1003 = _987;
    float _1005 = _813 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1007 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1009 = isnan(_953);
    bool _1011 = _1007 || _1009;
    bool _1013 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1015 = _1011 || _1013;
    float _1017 = float(_1015);
    float _1019 = _965 * 2.0;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1023 = _953 + _1021;
    float _1025 = floor(_1001);
    float _1027 = _983 * _639;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1031 = floor(_1019);
    float _1033 = _1003;
    if (!_963)
    {
        _923 = _991;
    }
    float _1035 = _923;
    float _1037 = _1035;
    float _1039 = _991;
    if (_963)
    {
        float _1041 = in.m_47.x;
        float _1043 = in.m_47.y;
        _1037 = _1041;
        _1039 = _1043;
    }
    float _1045 = _1037;
    float _1047 = _1039;
    bool _1049 = _1025 > 0.0;
    bool _1051 = _1025 >= 0.0;
    bool _1053 = isnan(_1025);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan(0.0);
    bool _1059 = _1055 || _1057;
    float _1061 = _1025;
    if (!_963)
    {
        _1061 = _955;
    }
    float _1063 = _1061;
    int _1065 = _1059 ? 0 : 1;
    int _1067 = as_type<int>(_973) & 1;
    bool _1069 = _1067 != 0;
    int _1071 = as_type<int>(_973) & 2;
    bool _1073 = _1071 != 0;
    int _1075 = ~_1065;
    int _1077 = _1075 + 1;
    int _1079 = _1077 + 1;
    int _1081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1083 = _1081 != 0;
    int _1085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1087 = _1085 != 0;
    int _1089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1091 = _1089 != 0;
    float _1093 = _983 * _635;
    int _1095 = _1079;
    float _1097 = _1063;
    if (!_1049)
    {
        int _1099 = ~_1065;
        int _1101 = _1099 + 1;
        _1095 = _1101;
    }
    int _1103 = _1095;
    float _1105 = _983 * _637;
    bool _1107 = _1031 > 0.0;
    float _1109 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1111 = log2(_1109);
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1115 = _1105 * _1113;
    float _1117 = _1047 * 2.0;
    if (_963)
    {
        _1033 = _1047;
    }
    float _1119 = _1033;
    float _1121 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_963)
    {
        _1097 = _1047;
    }
    float _1123 = _1097;
    float _1125 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[83].z, _997);
    bool _1127 = _1031 >= 0.0;
    bool _1129 = isnan(_1031);
    bool _1131 = _1127 || _1129;
    bool _1133 = isnan(0.0);
    bool _1135 = _1131 || _1133;
    float _1137 = floor(_1117);
    float _1139 = -_993;
    float _1141 = fma(_1121, 2.0, _1139);
    float _1143 = _955 + _1047;
    float _1145 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1029);
    float _1147 = _1111 * _119;
    int _1149 = _1135 ? 0 : 1;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1153 = _965 + _1047;
    float _1155 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1157 = _1143 + (-1.0);
    int _1159 = ~_1149;
    int _1161 = _1159 + 1;
    int _1163 = _1161 + 1;
    float _1165 = _1153 + (-1.0);
    float _1167 = fma(_1155, -2.0, _1151);
    float _1169 = exp2(_1147);
    int _1171 = _1163;
    if (!_1107)
    {
        int _1173 = ~_1149;
        int _1175 = _1173 + 1;
        _1171 = _1175;
    }
    int _1177 = _1171;
    float _1179 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1181 = !_1083;
    int _1183 = _1181 ? 0 : 1;
    float _1185 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1187 = _1137 > 0.0;
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1191 = -_1115;
    float _1193 = fma(_1093, _1189, _1191);
    bool _1195 = _1137 >= 0.0;
    bool _1197 = isnan(_1137);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan(0.0);
    bool _1203 = _1199 || _1201;
    bool _1205 = !_1087;
    int _1207 = _1205 ? 0 : 1;
    int _1209 = abs(_1183);
    int _1211 = abs(_1207);
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1215 = 1.0 + _1213;
    bool _1217 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1219 = isnan(1.0);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1225 = _1221 || _1223;
    float _1227 = in.m_52.x;
    float _1229 = in.m_52.y;
    float _1231 = in.m_52.z;
    float _1233 = float(_1209);
    float _1235 = 1.0 / _1215;
    float _1237 = float(_1103);
    float _1239 = float(_1211);
    float _1241 = _1233 * _1237;
    float _1243 = float(_1177);
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1249 = -_1169;
    float _1251 = _1249 + 1.0;
    bool _1253 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1255 = isnan(0.0);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1261 = _1257 || _1259;
    float _1263 = -_119;
    float _1265 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1141);
    float _1267 = _1239 * _1243;
    float _1269 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1167);
    float _1271 = _1261 ? _1251 : 0.0;
    float _1273 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1125);
    float _1275 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1145);
    float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1279 = _1027 * _1277;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1283 = _1093 * _1281;
    float _1285 = _1241 * (-2.0);
    if (_1225)
    {
        float _1287 = _1271 * _1235;
        _123 = _1287;
    }
    float _1289 = _123;
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1293 = -_1279;
    float _1295 = fma(_1105, _1291, _1293);
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1299 = _1297 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1303 = -_1283;
    float _1305 = fma(_1027, _1301, _1303);
    float _1307 = fma(_1185, _1285, _1185);
    float _1309 = _1295 * _1295;
    float _1311 = fma(_1285, _1227, _1227);
    int _1313 = _1203 ? 0 : 1;
    float _1315 = _965 + (-0.5);
    bool _1317 = !_1091;
    int _1319 = _1317 ? 0 : 1;
    float _1321 = fma(_1305, _1305, _1309);
    int _1323 = ~_1313;
    int _1325 = _1323 + 1;
    int _1327 = _1325 + 1;
    float _1329 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1311);
    int _1331 = abs(_1319);
    float _1333 = fma(_1193, _1193, _1321);
    int _1335 = _1327;
    if (!_1187)
    {
        int _1337 = ~_1313;
        int _1339 = _1337 + 1;
        _1335 = _1339;
    }
    int _1341 = _1335;
    float _1343 = _1267 * (-2.0);
    float _1345 = float(_1331);
    float _1347 = fma(_1307, _1289, _1329);
    float _1349 = float(_1341);
    float _1351 = fma(_1179, _1343, _1179);
    float _1353 = fma(_1343, _1229, _1229);
    float _1355 = _1047 + (-0.5);
    float _1357 = _965 + _955;
    float _1359 = _1345 * _1349;
    float _1361 = fma(_1355, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1353);
    float _1363 = _1357 + (-1.0);
    float _1365 = _1359 * (-2.0);
    float _1367 = 1.0 / _1247;
    float _1369 = fma(_1351, _1289, _1361);
    float _1371 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1373 = fma(_1365, _1231, _1231);
    float _1375 = _955 + (-0.5);
    float _1377 = _1347 * 0.15915493667125701904296875;
    float _1379 = fma(_1371, _1365, _1371);
    float _1381 = _1369 * 0.15915493667125701904296875;
    float _1383 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1373);
    float _1385 = rsqrt(_1333);
    bool _1387 = _955 > 0.5;
    float _1389 = fma(_1379, _1289, _1383);
    bool _1391 = _995 > 0.5;
    bool _1393 = _965 > 0.5;
    float _1395 = _1389 * 0.15915493667125701904296875;
    float _1397 = _1377 * 6.283185482025146484375;
    float _1399 = sin(_1397);
    float _1401 = fma(_447, _387, _979);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1403;
    bool _1407 = !_1069;
    float _1409 = _1407 ? (-0.5) : 0.5;
    float _1411 = _1377 * 6.283185482025146484375;
    float _1413 = cos(_1411);
    bool _1415 = !_1073;
    float _1417 = _1415 ? (-0.5) : 0.5;
    float _1419 = _1405 * _1367;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1423 = _1421 != 0;
    float _1425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1409);
    int _1427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1429 = _1427 != 0;
    float _1431 = _1305 * _1385;
    int _1433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1435 = _1433 != 0;
    float _1437 = _1381 * 6.283185482025146484375;
    float _1439 = sin(_1437);
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1443 = _1441 != 0;
    float _1445 = fma(_447, _391, _981);
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1449 = _953 + _1447;
    float _1451 = fma(_447, _395, _977);
    float _1453 = _1295 * _1385;
    float _1455 = _1193 * _1385;
    float _1457 = fma(_1419, _1449, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1459 = _1381 * 6.283185482025146484375;
    float _1461 = cos(_1459);
    float _1463 = _999 * _1425;
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1467 = _1465 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1469 = _1093 * _1455;
    float _1471 = _1451 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1473 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1475 = isnan(_953);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1481 = _1477 || _1479;
    float _1483 = float(_1481);
    float _1485 = _1027 * _1431;
    float _1487 = _1395 * 6.283185482025146484375;
    float _1489 = sin(_1487);
    float _1491 = _1399 * _1439;
    float _1493 = _1413 * _1439;
    float _1495 = -_1483;
    float _1497 = _1495 + 1.0;
    float _1499 = _1445 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1501 = _1395 * 6.283185482025146484375;
    float _1503 = cos(_1501);
    float _1505 = _1413 * _1461;
    float _1507 = _1399 * _1461;
    float _1509 = 1.0 / _1299;
    float _1511 = fma(_1489, _1505, _1491);
    float _1513 = -_1493;
    float _1515 = fma(_1489, _1507, _1513);
    float _1517 = -_1507;
    float _1519 = fma(_1489, _1493, _1517);
    float _1521 = fma(_1489, _1491, _1505);
    float _1523 = _1511 * _1105;
    float _1525 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1417);
    float _1527 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1529 = _1413 * _1503;
    float _1531 = _1461 * _1503;
    float _1533 = _1439 * _1503;
    float _1535 = _1399 * _1503;
    float _1537 = _1529 * _1105;
    float _1539 = -_1469;
    float _1541 = fma(_1027, _1453, _1539);
    float _1543 = fma(_1531, _1431, _1523);
    float _1545 = _1005 * _1525;
    float _1547 = _1467 * _1509;
    float _1549 = _1519 * _1105;
    float _1551 = -_1489;
    float _1553 = fma(_1551, _1431, _1537);
    float _1555 = _1105 * _1453;
    float _1557 = _1511 * _1027;
    float _1559 = fma(_1533, _1431, _1549);
    float _1561 = fma(_1515, _1541, _1543);
    float _1563 = _1519 * _1027;
    float _1565 = fma(_1535, _1541, _1553);
    float _1567 = fma(_1521, _1541, _1559);
    float _1569 = -_1555;
    float _1571 = fma(_1093, _1431, _1569);
    float _1573 = fma(_1531, _1455, _1557);
    float _1575 = _1529 * _1027;
    bool _1577 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1579 = isnan(_953);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1585 = _1581 || _1583;
    float _1587 = float(_1585);
    float _1589 = fma(_1533, _1455, _1563);
    float _1591 = fma(_1515, _1571, _1573);
    float _1593 = -_1489;
    float _1595 = fma(_1593, _1455, _1575);
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1599 = _1597 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1601 = -_1587;
    float _1603 = _1601 + 1.0;
    bool _1605 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1607 = isnan(_953);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1613 = _1609 || _1611;
    float _1615 = float(_1613);
    float _1617 = fma(_1535, _1571, _1595);
    float _1619 = 1.0 / _1599;
    float _1621 = fma(_1521, _1571, _1589);
    float _1623 = _1483 * _1603;
    float _1625 = _1545 * _1565;
    float _1627 = _1545 * _1617;
    float _1629 = _1615 * _1497;
    float _1631 = -_1615;
    float _1633 = _1631 + 1.0;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1635;
    float _1639 = fma(_1463, _1561, _1625);
    float _1641 = fma(_1463, _1591, _1627);
    float _1643 = _1401 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1645 = _1017 * _1633;
    float _1647 = fma(_1527, _1567, _1639);
    float _1649 = fma(_1527, _1621, _1641);
    float _1651 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1653 = _953 + _1651;
    float _1655 = _1637 * _1619;
    float _1657 = _1643 + _1647;
    float _1659 = _1471 + _1649;
    float _1661 = _1457 * _1645;
    float _1663 = fma(_1547, _1023, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1665 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1667 = _1657 + _1665;
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1671 = _1659 + _1669;
    float _1673 = fma(_1655, _1653, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1675 = _1529 * _1093;
    float _1677 = _1667 * _1667;
    float _1679 = _1671 * _1671;
    float _1681 = -_1485;
    float _1683 = fma(_1105, _1455, _1681);
    float _1685 = _1511 * _1093;
    float _1687 = -_1489;
    float _1689 = fma(_1687, _1453, _1675);
    float _1691 = _1677 + _1679;
    float _1693 = _1519 * _1093;
    float _1695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1697 = fma(_1531, _1453, _1685);
    float _1699 = fma(_1535, _1683, _1689);
    float _1701 = -_1017;
    float _1703 = _1701 + 1.0;
    float _1705 = fma(_1533, _1453, _1693);
    float _1707 = -_1417;
    int _1709 = _1391 ? as_type<int>(_1707) : as_type<int>(_1417);
    float _1711 = fma(_1515, _1683, _1697);
    float _1713 = _1545 * _1699;
    float _1715 = sqrt(_1691);
    float _1717 = fma(_1703, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1661);
    float _1719 = -_1409;
    int _1721 = _1387 ? as_type<int>(_1719) : as_type<int>(_1409);
    float _1723 = fma(_1463, _1711, _1713);
    bool _1725 = !_1429;
    float _1727 = _1725 ? _1417 : as_type<float>(_1709);
    float _1729 = fma(_1521, _1683, _1705);
    bool _1731 = !_1423;
    float _1733 = _1731 ? _1409 : as_type<float>(_1721);
    float _1735 = fma(_1663, _1629, _1717);
    float _1737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1739 = fma(_1527, _1729, _1723);
    bool _1741 = _1047 > 0.5;
    float _1743 = _1695 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1745 = _1733 + 0.5;
    float _1747 = _1499 + _1739;
    float _1749 = fma(_1673, _1623, _1735);
    float _1751 = -_1417;
    int _1753 = _1741 ? as_type<int>(_1751) : as_type<int>(_1417);
    float _1755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1757 = _1715 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1759 = fma(_1743, _1745, _1265);
    float _1761 = _1727 + (-0.5);
    float _1763 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1749);
    float _1765 = _1737 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1767 = -_1765;
    float _1769 = -_1269;
    float _1771 = fma(_1767, _1761, _1769);
    float _1773 = _1761;
    float _1775 = _1677;
    float _1777 = _1679;
    float _1779 = _1659;
    float _1781 = _1657;
    float _1783 = _1621;
    if (!_1757)
    {
        _1773 = _1747;
    }
    float _1785 = _1773;
    bool _1787 = !_1757;
    float _1789 = _1785;
    if (!_1787)
    {
        float _1791 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1795 = _1715 + _1793;
        float _1797 = _1747 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1799 = rsqrt(_1691);
        float _1801 = _1795 * _1791;
        float _1803 = _1801 * 0.15915493667125701904296875;
        float _1805 = _1803 * 6.283185482025146484375;
        float _1807 = sin(_1805);
        float _1809 = _1803 * 6.283185482025146484375;
        float _1811 = cos(_1809);
        float _1813 = fma(_1807, _1797, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1815 = _1799 * _1813;
        float _1817 = fma(_1667, _1815, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1819 = _1811 + (-1.0);
        float _1821 = fma(_1671, _1815, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1823 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1825 = _1817 + _1823;
        float _1827 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1829 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1831 = _1821 + _1829;
        float _1833 = _1825 * _1825;
        float _1835 = fma(_1747, _1811, _1827);
        float _1837 = _1831 * _1831;
        _1789 = _1835;
        _1775 = _1833;
        _1777 = _1837;
        _1779 = _1821;
        _1781 = _1817;
    }
    float _1839 = _1789;
    float _1841 = _1775;
    float _1843 = _1777;
    float _1845 = _1779;
    float _1847 = _1781;
    float _1849 = -_1409;
    int _1851 = _1393 ? as_type<int>(_1849) : as_type<int>(_1409);
    float _1853 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1855 = _1839 + _1853;
    bool _1857 = !_1443;
    float _1859 = _1857 ? _1417 : as_type<float>(_1753);
    float _1861 = _1417 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1863 = !_1435;
    float _1865 = _1863 ? _1409 : as_type<float>(_1851);
    float _1867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1869 = fma(_1855, _1855, _1841);
    float _1871 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1873 = _1699 * _1861;
    float _1875 = _1865 + 0.5;
    float _1877 = _1869 + _1843;
    float _1879 = fma(_1711, _1871, _1873);
    float _1881 = _1875 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1883 = _1565 * _1861;
    float _1885 = _1617 * _1861;
    float _1887 = _1881 * _1755;
    float _1889 = -_1859;
    float _1891 = _1889 + 0.5;
    float _1893 = sqrt(_1877);
    float _1895 = -_1273;
    float _1897 = _1895 + 1.0;
    float _1899 = fma(_1561, _1871, _1883);
    float _1901 = fma(_1591, _1871, _1885);
    float _1903 = -_1275;
    float _1905 = _1903 + 1.0;
    float _1907 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1909 = _915 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1911 = _917 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1913 = _919 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1915 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1921 = -_1897;
    float _1923 = fma(_1733, _1921, _1759);
    float _1925 = fma(_1727, _1905, _1771);
    float _1927 = _1907 * _1867;
    float _1929 = _1567 + _1899;
    float _1931 = _1909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1933 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1935 = _1913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1937 = _1915 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1939 = _1917 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1941 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1943 = _1763 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1945 = _1729 + _1879;
    float _1947 = _1621 + _1901;
    out.m_54.x = _1887;
    out.m_54.y = _1927;
    out.m_54.z = _1923;
    out.m_54.w = _1925;
    bool _1949 = _1893 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1951 = isnan(_1893);
    bool _1953 = _1949 || _1951;
    bool _1955 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1957 = _1953 || _1955;
    out.m_56.x = _1937;
    out.m_56.y = _1939;
    out.m_56.z = _1941;
    out.m_58.x = _1931;
    out.m_58.y = _1933;
    out.m_58.z = _1935;
    out.m_58.w = _1943;
    out.m_60.x = _1929;
    out.m_60.y = _1945;
    out.m_60.z = _1947;
    if (!_1957)
    {
        _1783 = 1.0;
    }
    float _1959 = _1783;
    bool _1961 = !_1957;
    float _1963 = _1959;
    if (!_1961)
    {
        bool _1965 = _1893 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1967 = isnan(_1893);
        bool _1969 = _1965 || _1967;
        bool _1971 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1973 = _1969 || _1971;
        if (!_1973)
        {
            float _1975 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1977 = _1893 + _1975;
            float _1979 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1981 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1979;
            float _1983 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1985 = _1983 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1987 = 1.0 / _1981;
            float _1989 = _1977 * _1987;
            float _1991 = fma(_1989, _1985, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1963 = _1991;
            _1993 = true;
        }
        else
        {
            bool _1995 = _1893 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1997 = isnan(_1893);
            bool _1999 = _1995 || _1997;
            bool _2001 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2003 = _1999 || _2001;
            if (!_2003)
            {
                float _2005 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2007 = _1893 + _2005;
                float _2009 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2011 = _2009 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2013 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2015 = _2013 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2017 = 1.0 / _2011;
                float _2019 = _2007 * _2017;
                float _2021 = fma(_2019, _2015, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1963 = _2021;
                _1993 = true;
            }
            else
            {
                _1963 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1993 = false;
    float _2023 = _1963;
    float _2025 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2027 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2029 = _1839 + _2027;
    float _2031 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2025);
    float _2033 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2035 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2037 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan(0.5);
    bool _2043 = _2039 || _2041;
    float _2045 = fma(_2029, _2023, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2047 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2031);
    float _2049 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2033);
    bool _2051 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(0.5);
    bool _2059 = _2055 || _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2063 = _1845 + _2061;
    float _2065 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2067 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2069 = _1847 + _2067;
    float _2071 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2049);
    float _2073 = fma(_2063, _2023, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2075 = 1.0 / _2065;
    float _2077 = fma(_2069, _2023, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2079 = _2071 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2081 = _2079 + _2065;
    float _2083 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2085 = _2079;
    float _2087 = _2073;
    float _2089 = _2081;
    if (_2059)
    {
        _2083 = _2077;
    }
    float _2091 = _2083;
    float _2093 = _2091;
    if (_2059)
    {
        _2085 = _2045;
    }
    float _2095 = _2085;
    float _2097 = _2095;
    if (!_2059)
    {
        float _2099 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2101 = _1499 + _2099;
        float _2103 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2105 = _1643 + _2103;
        float _2107 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2109 = -_1499;
        float _2111 = _2109 + _2045;
        float _2113 = _2101 * _2101;
        float _2115 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2117 = _1471 + _2115;
        float _2119 = fma(_2105, _2105, _2113);
        float _2121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2123 = fma(_2117, _2117, _2119);
        float _2125 = sqrt(_2123);
        float _2127 = _2107 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2129 = -_1643;
        float _2131 = _2129 + _2077;
        float _2133 = precise::min(_2125, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2135 = _2133 * _2121;
        float _2137 = _2127 * _2135;
        float _2139 = -_1471;
        float _2141 = _2139 + _2073;
        float _2143 = fma(_2131, _2137, _1643);
        float _2145 = fma(_2111, _2137, _1499);
        float _2147 = fma(_2141, _2137, _1471);
        _2097 = _2145;
        _2093 = _2143;
        _2087 = _2147;
    }
    float _2149 = _2097;
    float _2151 = _2093;
    float _2153 = _2087;
    float _2155 = _2081 * _2075;
    float _2157 = _2155 * 0.5;
    float _2159 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2161 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_2043)
    {
        _2089 = 1.0;
    }
    float _2163 = _2089;
    float _2165 = _2163;
    if (!_2043)
    {
        float _2167 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2169 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2171 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2169);
        float _2173 = _2167 * 0.15915493667125701904296875;
        float _2175 = _2173 * 6.283185482025146484375;
        float _2177 = cos(_2175);
        float _2179 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2181 = _2179 * 0.15915493667125701904296875;
        float _2183 = _2173 * 6.283185482025146484375;
        float _2185 = sin(_2183);
        float _2187 = 1.0 / _2177;
        float _2189 = _2181 * 6.283185482025146484375;
        float _2191 = cos(_2189);
        float _2193 = _2185 * _2187;
        float _2195 = 1.0 / _2171;
        float _2197 = _2191 * _2193;
        float _2199 = _2181 * 6.283185482025146484375;
        float _2201 = sin(_2199);
        float _2203 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2205 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2203;
        float _2207 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2209 = _2195 * _2207;
        float _2211 = 1.0 / _2197;
        float _2213 = 1.0 / _2205;
        float _2215 = _2201 * _2211;
        float _2217 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2219 = fma(_2215, _2209, _2217);
        float _2221 = _2219 * _2213;
        float _2223 = precise::clamp(_2221, 0.0, 1.0);
        float _2225 = -_2223;
        float _2227 = _2225 + 1.0;
        _2165 = _2227;
    }
    float _2229 = _2165;
    float _2231 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2161);
    float _2233 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2235 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2159);
    float _2237 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2239 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2231);
    float _2241 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2233);
    float _2243 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2235);
    float _2245 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2237);
    float _2247 = _2239 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2249 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2241);
    float _2251 = _2243 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2253 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2245);
    float _2255 = _2247 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2257 = _2247 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2259 = _2247 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2261 = _2247 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2263 = _2249 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2265 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2255);
    float _2267 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2257);
    float _2269 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2259);
    float _2271 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2261);
    float _2273 = _2253 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2275 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2265);
    float _2277 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2267);
    float _2279 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2269);
    float _2281 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2271);
    bool _2283 = _2229 > 0.0;
    bool _2285 = isnan(_2229);
    bool _2287 = _2283 || _2285;
    bool _2289 = isnan(0.0);
    bool _2291 = _2287 || _2289;
    float _2293 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2275);
    float _2295 = _2229 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2297 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2277);
    float _2299 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2279);
    float _2301 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2281);
    float _2303 = _2295 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2305 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2307 = _2151 + _2305;
    float _2309 = _2297 + _2301;
    float _2311 = _2299 + _2301;
    float _2313 = _2301 * 0.5;
    float _2315 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2317 = _2149 + _2315;
    float _2319 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2321 = _2153 + _2319;
    float _2323 = _2309 * 0.5;
    float _2325 = _2311 * 0.5;
    float _2327 = fma(_2293, -0.5, _2313);
    out.m_62.x = _2307;
    out.m_62.y = _2317;
    out.m_62.z = _2321;
    out.m_35.x = _2303;
    out.gl_Position.x = _2297;
    out.gl_Position.y = _2293;
    out.gl_Position.z = _2299;
    out.gl_Position.w = _2301;
    out.m_64.x = _2323;
    out.m_64.y = _2327;
    out.m_64.z = _2325;
    out.m_64.w = _2301;
    if (_2291)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _2329 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2329;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

