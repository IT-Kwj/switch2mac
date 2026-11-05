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
    constant _16* vp_c3 [[id(0)]];
};

struct main0_out
{
    float4 m_25 [[user(locn1)]];
    float4 m_27 [[user(locn2)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad0 [[user(locn0)]];
};

struct main0_in
{
    float4 m_22 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad0 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _539 = false;
    bool _361 = false;
    bool _138 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_22.x;
    float _43 = in.m_22.y;
    float _45 = -_43;
    float _47 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _49 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _51 = _47 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _53 = _47 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _55 = _47 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _57 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _51);
    float _59 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].x, _53);
    float _61 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _55);
    float _63 = _57 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _69 = _63 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _71 = _63 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _73 = _63 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _75 = _63 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _77 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[0].x, _69);
    float _79 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[1].x, _71);
    float _81 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[2].x, _73);
    float _83 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[3].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].z, _77);
    float _87 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].z, _79);
    float _89 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].z, _81);
    float _91 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].z, _83);
    float _93 = _85 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _93;
    out.gl_Position.y = _95;
    out.gl_Position.z = _97;
    out.gl_Position.w = _99;
    int _102 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _106 = _102 != 0;
    bool _108 = !_106;
    float _110 = _63;
    float _112 = _85;
    float _114 = _63;
    float _116 = _85;
    float _118 = _43;
    float _120 = _41;
    bool _126;
    float _132;
    float _136;
    if (!_108)
    {
        int _122 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _124 = _122 != 0;
        _126 = _124;
        if (_124)
        {
            _110 = _41;
        }
        float _128 = _110;
        float _130 = _128;
        _132 = _128;
        if (_124)
        {
            _112 = _43;
        }
        float _134 = _112;
        _136 = _134;
        _138 = _124;
        if (!_138)
        {
            float _140 = trunc(_41);
            int _142 = int(_140);
            float _144 = trunc(_43);
            int _146 = int(_144);
            int _148 = _146 * 2;
            int _150 = _148 + _142;
            int _152 = _150 << 4;
            bool _154 = _152 == 0;
            bool _156 = _152 == 16;
            bool _158 = _152 == 32;
            bool _160 = _152 == 48;
            float _162 = as_type<float>(_146);
            float _164 = as_type<float>(_152);
            float _166 = as_type<float>(_142);
            if (_154)
            {
                _130 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _168 = _130;
            float _170 = _168;
            if (_154)
            {
                _162 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _172 = _162;
            float _174 = _172;
            if (_154)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _176 = _164;
            float _178 = _176;
            if (_154)
            {
                _166 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _180 = _166;
            float _182 = _180;
            if (_156)
            {
                _170 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _184 = _170;
            float _186 = _184;
            if (_158)
            {
                _186 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _188 = _186;
            float _190 = _188;
            if (_156)
            {
                _178 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _192 = _178;
            float _194 = _192;
            if (_156)
            {
                _182 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _196 = _182;
            float _198 = _196;
            if (_156)
            {
                _174 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _200 = _174;
            float _202 = _200;
            if (_158)
            {
                _194 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _204 = _194;
            float _206 = _204;
            if (_160)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _208 = _206;
            _136 = _208;
            if (_158)
            {
                _198 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _210 = _198;
            float _212 = _210;
            if (_158)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _214 = _202;
            float _216 = _214;
            if (_160)
            {
                _190 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _218 = _190;
            _132 = _218;
            if (_160)
            {
                _212 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _220 = _212;
            _120 = _220;
            if (_160)
            {
                _216 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _222 = _216;
            _118 = _222;
            _138 = true;
        }
    }
    else
    {
        int _224 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _226 = _224 != 0;
        _126 = _226;
        if (_226)
        {
            _114 = _41;
        }
        float _228 = _114;
        _132 = _228;
        if (_226)
        {
            _116 = _43;
        }
        float _230 = _116;
        _136 = _230;
        if (!_226)
        {
            float _232 = trunc(_41);
            int _234 = int(_232);
            float _236 = trunc(_43);
            int _238 = int(_236);
            int _240 = _238 * 2;
            int _242 = _240 + _234;
            int _244 = _242 << 4;
            uint _247 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _249 = _244 == 0;
            bool _251 = _244 == 16;
            bool _253 = _244 == 32;
            bool _255 = _244 == 48;
            int _257 = int(_247) & 15;
            float _259 = as_type<float>(_244);
            float _261 = as_type<float>(_257);
            float _263 = as_type<float>(_234);
            float _265 = as_type<float>(_238);
            if (_249)
            {
                _259 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _267 = _259;
            float _269 = _267;
            if (_251)
            {
                _269 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _271 = _269;
            float _273 = _271;
            if (_249)
            {
                _261 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _275 = _261;
            float _277 = _275;
            if (_249)
            {
                _263 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _279 = _263;
            float _281 = _279;
            if (_249)
            {
                _265 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _283 = _265;
            float _285 = _283;
            if (_251)
            {
                _277 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _287 = _277;
            float _289 = _287;
            if (_251)
            {
                _281 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _291 = _281;
            float _293 = _291;
            if (_253)
            {
                _293 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _295 = _293;
            float _297 = _295;
            if (_251)
            {
                _285 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _299 = _285;
            float _301 = _299;
            if (_253)
            {
                _273 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _303 = _273;
            float _305 = _303;
            if (_253)
            {
                _289 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _307 = _289;
            float _309 = _307;
            if (_253)
            {
                _301 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _311 = _301;
            _118 = _311;
            if (_255)
            {
                _305 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _313 = _305;
            _132 = _313;
            if (_255)
            {
                _309 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _315 = _309;
            _136 = _315;
            if (_255)
            {
                _297 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _317 = _297;
            _120 = _317;
            if (_255)
            {
                _118 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
        }
    }
    _138 = false;
    float _319 = _118;
    float _321 = _120;
    float _323 = _132;
    float _325 = _136;
    bool _327 = _126;
    bool _329 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _331 = !_329;
    float _333 = _319;
    float _335 = _321;
    float _337 = _323;
    float _339 = _325;
    float _341 = _321;
    float _343 = _319;
    float _357;
    float _359;
    if (!_331)
    {
        float _345 = _47 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _347 = _47 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _349 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].x, _345);
        float _351 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].x, _347);
        float _353 = _349 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _355 = _351 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _357 = _355;
        _359 = _353;
        _361 = true;
    }
    else
    {
        int _363 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _365 = _363 != 0;
        if (!_365)
        {
            _333 = _323;
        }
        float _367 = _333;
        float _369 = _367;
        _359 = _367;
        if (!_365)
        {
            _335 = _325;
        }
        float _371 = _335;
        bool _373 = !_365;
        float _375 = _371;
        _357 = _371;
        if (!_373)
        {
            if (!_327)
            {
                _369 = _323;
            }
            float _377 = _369;
            float _379 = _377;
            float _381 = _377;
            if (!_327)
            {
                _375 = _325;
            }
            float _383 = _375;
            bool _385 = !_327;
            float _387 = _383;
            float _389 = _383;
            if (!_385)
            {
                int _391 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _393 = _391 != 0;
                int _395 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _397 = _395 != 0;
                int _399 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _401 = _399 != 0;
                int _403 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _405 = _403 != 0;
                int _407 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _409 = _407 != 0;
                if (_393)
                {
                    _379 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _411 = _379;
                float _413 = _411;
                if (_393)
                {
                    _387 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _415 = _387;
                float _417 = _415;
                if (!_393)
                {
                    _413 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _419 = _413;
                if (!_393)
                {
                    _417 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _421 = _417;
                float _423 = _419 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _425 = _421 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_405)
                {
                    float _427 = _423 * _323;
                    _337 = _427;
                }
                float _429 = _337;
                float _431 = -_423;
                float _433 = _431 + 1.0;
                float _435 = _429;
                if (_409)
                {
                    float _437 = _425 * _325;
                    _339 = _437;
                }
                float _439 = _339;
                float _441 = -_425;
                float _443 = _441 + 1.0;
                float _445 = _439;
                if (_397)
                {
                    float _447 = _429 + _433;
                    _435 = _447;
                }
                float _449 = _435;
                if (_401)
                {
                    float _451 = _439 + _443;
                    _445 = _451;
                }
                float _453 = _445;
                _381 = _449;
                _389 = _453;
            }
            float _455 = _381;
            float _457 = _389;
            int _459 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _461 = _459 != 0;
            int _463 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _465 = _463 != 0;
            int _467 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _469 = _467 != 0;
            int _471 = as_type<int>(_455);
            int _473 = as_type<int>(_457);
            if (_465)
            {
                float _475 = -_455;
                float _477 = _475 + 1.0;
                _471 = as_type<int>(_477);
            }
            int _479 = _471;
            if (_469)
            {
                float _481 = -_457;
                float _483 = _481 + 1.0;
                _473 = as_type<int>(_483);
            }
            int _485 = _473;
            bool _487 = !_461;
            float _489 = _487 ? as_type<float>(_479) : as_type<float>(_485);
            bool _491 = !_461;
            float _493 = _491 ? as_type<float>(_485) : as_type<float>(_479);
            _357 = _493;
            _359 = _489;
        }
    }
    _361 = false;
    float _495 = _357;
    float _497 = _359;
    float _499 = _495 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _501 = _495 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _503 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _505 = fma(_497, (*spvDescriptorSet0.vp_c3)._m0[8].x, _499);
    float _507 = fma(_497, (*spvDescriptorSet0.vp_c3)._m0[7].x, _501);
    float _509 = _505 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _511 = _507 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _513 = -_509;
    float _515 = _513 + 1.0;
    out.m_25.x = _511;
    out.m_25.y = _515;
    bool _517 = !_503;
    float _519 = _515;
    float _521 = _511;
    float _535;
    float _537;
    if (!_517)
    {
        float _523 = _47 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _525 = _47 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _527 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].x, _523);
        float _529 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].x, _525);
        float _531 = _527 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _533 = _529 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _535 = _533;
        _537 = _531;
        _539 = true;
    }
    else
    {
        int _541 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _543 = _541 != 0;
        if (!_543)
        {
            _519 = _321;
        }
        float _545 = _519;
        float _547 = _545;
        _537 = _545;
        if (!_543)
        {
            _521 = _319;
        }
        float _549 = _521;
        bool _551 = !_543;
        float _553 = _549;
        _535 = _549;
        if (!_551)
        {
            if (!_327)
            {
                _547 = _321;
            }
            float _555 = _547;
            float _557 = _555;
            int _559 = as_type<int>(_555);
            if (!_327)
            {
                _553 = _319;
            }
            float _561 = _553;
            bool _563 = !_327;
            float _565 = _561;
            float _567 = _561;
            if (!_563)
            {
                int _569 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _571 = _569 != 0;
                int _573 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _575 = _573 != 0;
                int _577 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _579 = _577 != 0;
                int _581 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _583 = _581 != 0;
                int _585 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _587 = _585 != 0;
                if (_571)
                {
                    _557 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _589 = _557;
                float _591 = _589;
                if (_571)
                {
                    _565 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _593 = _565;
                float _595 = _593;
                if (!_571)
                {
                    _591 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _597 = _591;
                if (!_571)
                {
                    _595 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _599 = _595;
                float _601 = _597 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _603 = _599 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_583)
                {
                    float _605 = _601 * _321;
                    _341 = _605;
                }
                float _607 = _341;
                float _609 = -_601;
                float _611 = _609 + 1.0;
                int _613 = as_type<int>(_607);
                if (_587)
                {
                    float _615 = _603 * _319;
                    _343 = _615;
                }
                float _617 = _343;
                float _619 = -_603;
                float _621 = _619 + 1.0;
                float _623 = _617;
                if (_575)
                {
                    float _625 = _607 + _611;
                    _613 = as_type<int>(_625);
                }
                int _627 = _613;
                if (_579)
                {
                    float _629 = _617 + _621;
                    _623 = _629;
                }
                float _631 = _623;
                _559 = _627;
                _567 = _631;
            }
            int _633 = _559;
            float _635 = _567;
            int _637 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _639 = _637 != 0;
            int _641 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _643 = _641 != 0;
            int _645 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _647 = _645 != 0;
            int _649 = _633;
            int _651 = as_type<int>(_635);
            if (_643)
            {
                float _653 = -as_type<float>(_633);
                float _655 = _653 + 1.0;
                _649 = as_type<int>(_655);
            }
            int _657 = _649;
            if (_647)
            {
                float _659 = -_635;
                float _661 = _659 + 1.0;
                _651 = as_type<int>(_661);
            }
            int _663 = _651;
            bool _665 = !_639;
            float _667 = _665 ? as_type<float>(_657) : as_type<float>(_663);
            bool _669 = !_639;
            float _671 = _669 ? as_type<float>(_663) : as_type<float>(_657);
            _535 = _671;
            _537 = _667;
        }
    }
    _539 = false;
    float _673 = _535;
    float _675 = _537;
    float _677 = _673 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _679 = _673 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _681 = fma(_675, (*spvDescriptorSet0.vp_c3)._m0[10].x, _677);
    float _683 = fma(_675, (*spvDescriptorSet0.vp_c3)._m0[9].x, _679);
    float _685 = _681 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _687 = _683 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _689 = -_685;
    float _691 = _689 + 1.0;
    out.m_27.x = _687;
    out.m_27.y = _691;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad0 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _539 = false;
    bool _361 = false;
    bool _138 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_22.x;
    float _43 = in.m_22.y;
    float _45 = -_43;
    float _47 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _49 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _51 = _47 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _53 = _47 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _55 = _47 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _57 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _51);
    float _59 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].x, _53);
    float _61 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _55);
    float _63 = _57 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _69 = _63 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _71 = _63 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _73 = _63 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _75 = _63 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _77 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[0].x, _69);
    float _79 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[1].x, _71);
    float _81 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[2].x, _73);
    float _83 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[3].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].z, _77);
    float _87 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].z, _79);
    float _89 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].z, _81);
    float _91 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].z, _83);
    float _93 = _85 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _93;
    out.gl_Position.y = _95;
    out.gl_Position.z = _97;
    out.gl_Position.w = _99;
    int _102 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _106 = _102 != 0;
    bool _108 = !_106;
    float _110 = _63;
    float _112 = _85;
    float _114 = _63;
    float _116 = _85;
    float _118 = _43;
    float _120 = _41;
    bool _126;
    float _132;
    float _136;
    if (!_108)
    {
        int _122 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _124 = _122 != 0;
        _126 = _124;
        if (_124)
        {
            _110 = _41;
        }
        float _128 = _110;
        float _130 = _128;
        _132 = _128;
        if (_124)
        {
            _112 = _43;
        }
        float _134 = _112;
        _136 = _134;
        _138 = _124;
        if (!_138)
        {
            float _140 = trunc(_41);
            int _142 = int(_140);
            float _144 = trunc(_43);
            int _146 = int(_144);
            int _148 = _146 * 2;
            int _150 = _148 + _142;
            int _152 = _150 << 4;
            bool _154 = _152 == 0;
            bool _156 = _152 == 16;
            bool _158 = _152 == 32;
            bool _160 = _152 == 48;
            float _162 = as_type<float>(_146);
            float _164 = as_type<float>(_152);
            float _166 = as_type<float>(_142);
            if (_154)
            {
                _130 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _168 = _130;
            float _170 = _168;
            if (_154)
            {
                _162 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _172 = _162;
            float _174 = _172;
            if (_154)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _176 = _164;
            float _178 = _176;
            if (_154)
            {
                _166 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _180 = _166;
            float _182 = _180;
            if (_156)
            {
                _170 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _184 = _170;
            float _186 = _184;
            if (_158)
            {
                _186 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _188 = _186;
            float _190 = _188;
            if (_156)
            {
                _178 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _192 = _178;
            float _194 = _192;
            if (_156)
            {
                _182 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _196 = _182;
            float _198 = _196;
            if (_156)
            {
                _174 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _200 = _174;
            float _202 = _200;
            if (_158)
            {
                _194 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _204 = _194;
            float _206 = _204;
            if (_160)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _208 = _206;
            _136 = _208;
            if (_158)
            {
                _198 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _210 = _198;
            float _212 = _210;
            if (_158)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _214 = _202;
            float _216 = _214;
            if (_160)
            {
                _190 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _218 = _190;
            _132 = _218;
            if (_160)
            {
                _212 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _220 = _212;
            _120 = _220;
            if (_160)
            {
                _216 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _222 = _216;
            _118 = _222;
            _138 = true;
        }
    }
    else
    {
        int _224 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _226 = _224 != 0;
        _126 = _226;
        if (_226)
        {
            _114 = _41;
        }
        float _228 = _114;
        _132 = _228;
        if (_226)
        {
            _116 = _43;
        }
        float _230 = _116;
        _136 = _230;
        if (!_226)
        {
            float _232 = trunc(_41);
            int _234 = int(_232);
            float _236 = trunc(_43);
            int _238 = int(_236);
            int _240 = _238 * 2;
            int _242 = _240 + _234;
            int _244 = _242 << 4;
            uint _247 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _249 = _244 == 0;
            bool _251 = _244 == 16;
            bool _253 = _244 == 32;
            bool _255 = _244 == 48;
            int _257 = int(_247) & 15;
            float _259 = as_type<float>(_244);
            float _261 = as_type<float>(_257);
            float _263 = as_type<float>(_234);
            float _265 = as_type<float>(_238);
            if (_249)
            {
                _259 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _267 = _259;
            float _269 = _267;
            if (_251)
            {
                _269 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _271 = _269;
            float _273 = _271;
            if (_249)
            {
                _261 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _275 = _261;
            float _277 = _275;
            if (_249)
            {
                _263 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _279 = _263;
            float _281 = _279;
            if (_249)
            {
                _265 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _283 = _265;
            float _285 = _283;
            if (_251)
            {
                _277 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _287 = _277;
            float _289 = _287;
            if (_251)
            {
                _281 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _291 = _281;
            float _293 = _291;
            if (_253)
            {
                _293 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _295 = _293;
            float _297 = _295;
            if (_251)
            {
                _285 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _299 = _285;
            float _301 = _299;
            if (_253)
            {
                _273 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _303 = _273;
            float _305 = _303;
            if (_253)
            {
                _289 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _307 = _289;
            float _309 = _307;
            if (_253)
            {
                _301 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _311 = _301;
            _118 = _311;
            if (_255)
            {
                _305 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _313 = _305;
            _132 = _313;
            if (_255)
            {
                _309 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _315 = _309;
            _136 = _315;
            if (_255)
            {
                _297 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _317 = _297;
            _120 = _317;
            if (_255)
            {
                _118 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
        }
    }
    _138 = false;
    float _319 = _118;
    float _321 = _120;
    float _323 = _132;
    float _325 = _136;
    bool _327 = _126;
    bool _329 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _331 = !_329;
    float _333 = _319;
    float _335 = _321;
    float _337 = _323;
    float _339 = _325;
    float _341 = _321;
    float _343 = _319;
    float _357;
    float _359;
    if (!_331)
    {
        float _345 = _47 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _347 = _47 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _349 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].x, _345);
        float _351 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].x, _347);
        float _353 = _349 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _355 = _351 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _357 = _355;
        _359 = _353;
        _361 = true;
    }
    else
    {
        int _363 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _365 = _363 != 0;
        if (!_365)
        {
            _333 = _323;
        }
        float _367 = _333;
        float _369 = _367;
        _359 = _367;
        if (!_365)
        {
            _335 = _325;
        }
        float _371 = _335;
        bool _373 = !_365;
        float _375 = _371;
        _357 = _371;
        if (!_373)
        {
            if (!_327)
            {
                _369 = _323;
            }
            float _377 = _369;
            float _379 = _377;
            float _381 = _377;
            if (!_327)
            {
                _375 = _325;
            }
            float _383 = _375;
            bool _385 = !_327;
            float _387 = _383;
            float _389 = _383;
            if (!_385)
            {
                int _391 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _393 = _391 != 0;
                int _395 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _397 = _395 != 0;
                int _399 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _401 = _399 != 0;
                int _403 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _405 = _403 != 0;
                int _407 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _409 = _407 != 0;
                if (_393)
                {
                    _379 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _411 = _379;
                float _413 = _411;
                if (_393)
                {
                    _387 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _415 = _387;
                float _417 = _415;
                if (!_393)
                {
                    _413 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _419 = _413;
                if (!_393)
                {
                    _417 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _421 = _417;
                float _423 = _419 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _425 = _421 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_405)
                {
                    float _427 = _423 * _323;
                    _337 = _427;
                }
                float _429 = _337;
                float _431 = -_423;
                float _433 = _431 + 1.0;
                float _435 = _429;
                if (_409)
                {
                    float _437 = _425 * _325;
                    _339 = _437;
                }
                float _439 = _339;
                float _441 = -_425;
                float _443 = _441 + 1.0;
                float _445 = _439;
                if (_397)
                {
                    float _447 = _429 + _433;
                    _435 = _447;
                }
                float _449 = _435;
                if (_401)
                {
                    float _451 = _439 + _443;
                    _445 = _451;
                }
                float _453 = _445;
                _381 = _449;
                _389 = _453;
            }
            float _455 = _381;
            float _457 = _389;
            int _459 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _461 = _459 != 0;
            int _463 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _465 = _463 != 0;
            int _467 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _469 = _467 != 0;
            int _471 = as_type<int>(_455);
            int _473 = as_type<int>(_457);
            if (_465)
            {
                float _475 = -_455;
                float _477 = _475 + 1.0;
                _471 = as_type<int>(_477);
            }
            int _479 = _471;
            if (_469)
            {
                float _481 = -_457;
                float _483 = _481 + 1.0;
                _473 = as_type<int>(_483);
            }
            int _485 = _473;
            bool _487 = !_461;
            float _489 = _487 ? as_type<float>(_479) : as_type<float>(_485);
            bool _491 = !_461;
            float _493 = _491 ? as_type<float>(_485) : as_type<float>(_479);
            _357 = _493;
            _359 = _489;
        }
    }
    _361 = false;
    float _495 = _357;
    float _497 = _359;
    float _499 = _495 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _501 = _495 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _503 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _505 = fma(_497, (*spvDescriptorSet0.vp_c3)._m0[8].x, _499);
    float _507 = fma(_497, (*spvDescriptorSet0.vp_c3)._m0[7].x, _501);
    float _509 = _505 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _511 = _507 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _513 = -_509;
    float _515 = _513 + 1.0;
    out.m_25.x = _511;
    out.m_25.y = _515;
    bool _517 = !_503;
    float _519 = _515;
    float _521 = _511;
    float _535;
    float _537;
    if (!_517)
    {
        float _523 = _47 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _525 = _47 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _527 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].x, _523);
        float _529 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].x, _525);
        float _531 = _527 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _533 = _529 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _535 = _533;
        _537 = _531;
        _539 = true;
    }
    else
    {
        int _541 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _543 = _541 != 0;
        if (!_543)
        {
            _519 = _321;
        }
        float _545 = _519;
        float _547 = _545;
        _537 = _545;
        if (!_543)
        {
            _521 = _319;
        }
        float _549 = _521;
        bool _551 = !_543;
        float _553 = _549;
        _535 = _549;
        if (!_551)
        {
            if (!_327)
            {
                _547 = _321;
            }
            float _555 = _547;
            float _557 = _555;
            int _559 = as_type<int>(_555);
            if (!_327)
            {
                _553 = _319;
            }
            float _561 = _553;
            bool _563 = !_327;
            float _565 = _561;
            float _567 = _561;
            if (!_563)
            {
                int _569 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _571 = _569 != 0;
                int _573 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _575 = _573 != 0;
                int _577 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _579 = _577 != 0;
                int _581 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _583 = _581 != 0;
                int _585 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _587 = _585 != 0;
                if (_571)
                {
                    _557 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _589 = _557;
                float _591 = _589;
                if (_571)
                {
                    _565 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _593 = _565;
                float _595 = _593;
                if (!_571)
                {
                    _591 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _597 = _591;
                if (!_571)
                {
                    _595 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _599 = _595;
                float _601 = _597 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _603 = _599 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_583)
                {
                    float _605 = _601 * _321;
                    _341 = _605;
                }
                float _607 = _341;
                float _609 = -_601;
                float _611 = _609 + 1.0;
                int _613 = as_type<int>(_607);
                if (_587)
                {
                    float _615 = _603 * _319;
                    _343 = _615;
                }
                float _617 = _343;
                float _619 = -_603;
                float _621 = _619 + 1.0;
                float _623 = _617;
                if (_575)
                {
                    float _625 = _607 + _611;
                    _613 = as_type<int>(_625);
                }
                int _627 = _613;
                if (_579)
                {
                    float _629 = _617 + _621;
                    _623 = _629;
                }
                float _631 = _623;
                _559 = _627;
                _567 = _631;
            }
            int _633 = _559;
            float _635 = _567;
            int _637 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _639 = _637 != 0;
            int _641 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _643 = _641 != 0;
            int _645 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _647 = _645 != 0;
            int _649 = _633;
            int _651 = as_type<int>(_635);
            if (_643)
            {
                float _653 = -as_type<float>(_633);
                float _655 = _653 + 1.0;
                _649 = as_type<int>(_655);
            }
            int _657 = _649;
            if (_647)
            {
                float _659 = -_635;
                float _661 = _659 + 1.0;
                _651 = as_type<int>(_661);
            }
            int _663 = _651;
            bool _665 = !_639;
            float _667 = _665 ? as_type<float>(_657) : as_type<float>(_663);
            bool _669 = !_639;
            float _671 = _669 ? as_type<float>(_663) : as_type<float>(_657);
            _535 = _671;
            _537 = _667;
        }
    }
    _539 = false;
    float _673 = _535;
    float _675 = _537;
    float _677 = _673 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _679 = _673 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _681 = fma(_675, (*spvDescriptorSet0.vp_c3)._m0[10].x, _677);
    float _683 = fma(_675, (*spvDescriptorSet0.vp_c3)._m0[9].x, _679);
    float _685 = _681 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _687 = _683 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _689 = -_685;
    float _691 = _689 + 1.0;
    out.m_27.x = _687;
    out.m_27.y = _691;
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
    out.dm_pad0 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _539 = false;
    bool _361 = false;
    bool _138 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_22.x;
    float _43 = in.m_22.y;
    float _45 = -_43;
    float _47 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _49 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _51 = _47 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _53 = _47 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _55 = _47 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _57 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _51);
    float _59 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].x, _53);
    float _61 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _55);
    float _63 = _57 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _69 = _63 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _71 = _63 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _73 = _63 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _75 = _63 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _77 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[0].x, _69);
    float _79 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[1].x, _71);
    float _81 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[2].x, _73);
    float _83 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[3].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].z, _77);
    float _87 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].z, _79);
    float _89 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].z, _81);
    float _91 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].z, _83);
    float _93 = _85 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _93;
    out.gl_Position.y = _95;
    out.gl_Position.z = _97;
    out.gl_Position.w = _99;
    int _102 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _106 = _102 != 0;
    bool _108 = !_106;
    float _110 = _63;
    float _112 = _85;
    float _114 = _63;
    float _116 = _85;
    float _118 = _43;
    float _120 = _41;
    bool _126;
    float _132;
    float _136;
    if (!_108)
    {
        int _122 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _124 = _122 != 0;
        _126 = _124;
        if (_124)
        {
            _110 = _41;
        }
        float _128 = _110;
        float _130 = _128;
        _132 = _128;
        if (_124)
        {
            _112 = _43;
        }
        float _134 = _112;
        _136 = _134;
        _138 = _124;
        if (!_138)
        {
            float _140 = trunc(_41);
            int _142 = int(_140);
            float _144 = trunc(_43);
            int _146 = int(_144);
            int _148 = _146 * 2;
            int _150 = _148 + _142;
            int _152 = _150 << 4;
            bool _154 = _152 == 0;
            bool _156 = _152 == 16;
            bool _158 = _152 == 32;
            bool _160 = _152 == 48;
            float _162 = as_type<float>(_146);
            float _164 = as_type<float>(_152);
            float _166 = as_type<float>(_142);
            if (_154)
            {
                _130 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _168 = _130;
            float _170 = _168;
            if (_154)
            {
                _162 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _172 = _162;
            float _174 = _172;
            if (_154)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _176 = _164;
            float _178 = _176;
            if (_154)
            {
                _166 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _180 = _166;
            float _182 = _180;
            if (_156)
            {
                _170 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _184 = _170;
            float _186 = _184;
            if (_158)
            {
                _186 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _188 = _186;
            float _190 = _188;
            if (_156)
            {
                _178 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _192 = _178;
            float _194 = _192;
            if (_156)
            {
                _182 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _196 = _182;
            float _198 = _196;
            if (_156)
            {
                _174 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _200 = _174;
            float _202 = _200;
            if (_158)
            {
                _194 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _204 = _194;
            float _206 = _204;
            if (_160)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _208 = _206;
            _136 = _208;
            if (_158)
            {
                _198 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _210 = _198;
            float _212 = _210;
            if (_158)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _214 = _202;
            float _216 = _214;
            if (_160)
            {
                _190 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _218 = _190;
            _132 = _218;
            if (_160)
            {
                _212 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _220 = _212;
            _120 = _220;
            if (_160)
            {
                _216 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _222 = _216;
            _118 = _222;
            _138 = true;
        }
    }
    else
    {
        int _224 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _226 = _224 != 0;
        _126 = _226;
        if (_226)
        {
            _114 = _41;
        }
        float _228 = _114;
        _132 = _228;
        if (_226)
        {
            _116 = _43;
        }
        float _230 = _116;
        _136 = _230;
        if (!_226)
        {
            float _232 = trunc(_41);
            int _234 = int(_232);
            float _236 = trunc(_43);
            int _238 = int(_236);
            int _240 = _238 * 2;
            int _242 = _240 + _234;
            int _244 = _242 << 4;
            uint _247 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _249 = _244 == 0;
            bool _251 = _244 == 16;
            bool _253 = _244 == 32;
            bool _255 = _244 == 48;
            int _257 = int(_247) & 15;
            float _259 = as_type<float>(_244);
            float _261 = as_type<float>(_257);
            float _263 = as_type<float>(_234);
            float _265 = as_type<float>(_238);
            if (_249)
            {
                _259 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _267 = _259;
            float _269 = _267;
            if (_251)
            {
                _269 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _271 = _269;
            float _273 = _271;
            if (_249)
            {
                _261 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _275 = _261;
            float _277 = _275;
            if (_249)
            {
                _263 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _279 = _263;
            float _281 = _279;
            if (_249)
            {
                _265 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _283 = _265;
            float _285 = _283;
            if (_251)
            {
                _277 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _287 = _277;
            float _289 = _287;
            if (_251)
            {
                _281 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _291 = _281;
            float _293 = _291;
            if (_253)
            {
                _293 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _295 = _293;
            float _297 = _295;
            if (_251)
            {
                _285 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _299 = _285;
            float _301 = _299;
            if (_253)
            {
                _273 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _303 = _273;
            float _305 = _303;
            if (_253)
            {
                _289 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _307 = _289;
            float _309 = _307;
            if (_253)
            {
                _301 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _311 = _301;
            _118 = _311;
            if (_255)
            {
                _305 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _313 = _305;
            _132 = _313;
            if (_255)
            {
                _309 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _315 = _309;
            _136 = _315;
            if (_255)
            {
                _297 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _317 = _297;
            _120 = _317;
            if (_255)
            {
                _118 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
        }
    }
    _138 = false;
    float _319 = _118;
    float _321 = _120;
    float _323 = _132;
    float _325 = _136;
    bool _327 = _126;
    bool _329 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _331 = !_329;
    float _333 = _319;
    float _335 = _321;
    float _337 = _323;
    float _339 = _325;
    float _341 = _321;
    float _343 = _319;
    float _357;
    float _359;
    if (!_331)
    {
        float _345 = _47 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _347 = _47 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _349 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].x, _345);
        float _351 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].x, _347);
        float _353 = _349 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _355 = _351 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _357 = _355;
        _359 = _353;
        _361 = true;
    }
    else
    {
        int _363 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _365 = _363 != 0;
        if (!_365)
        {
            _333 = _323;
        }
        float _367 = _333;
        float _369 = _367;
        _359 = _367;
        if (!_365)
        {
            _335 = _325;
        }
        float _371 = _335;
        bool _373 = !_365;
        float _375 = _371;
        _357 = _371;
        if (!_373)
        {
            if (!_327)
            {
                _369 = _323;
            }
            float _377 = _369;
            float _379 = _377;
            float _381 = _377;
            if (!_327)
            {
                _375 = _325;
            }
            float _383 = _375;
            bool _385 = !_327;
            float _387 = _383;
            float _389 = _383;
            if (!_385)
            {
                int _391 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _393 = _391 != 0;
                int _395 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _397 = _395 != 0;
                int _399 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _401 = _399 != 0;
                int _403 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _405 = _403 != 0;
                int _407 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _409 = _407 != 0;
                if (_393)
                {
                    _379 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _411 = _379;
                float _413 = _411;
                if (_393)
                {
                    _387 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _415 = _387;
                float _417 = _415;
                if (!_393)
                {
                    _413 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _419 = _413;
                if (!_393)
                {
                    _417 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _421 = _417;
                float _423 = _419 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _425 = _421 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_405)
                {
                    float _427 = _423 * _323;
                    _337 = _427;
                }
                float _429 = _337;
                float _431 = -_423;
                float _433 = _431 + 1.0;
                float _435 = _429;
                if (_409)
                {
                    float _437 = _425 * _325;
                    _339 = _437;
                }
                float _439 = _339;
                float _441 = -_425;
                float _443 = _441 + 1.0;
                float _445 = _439;
                if (_397)
                {
                    float _447 = _429 + _433;
                    _435 = _447;
                }
                float _449 = _435;
                if (_401)
                {
                    float _451 = _439 + _443;
                    _445 = _451;
                }
                float _453 = _445;
                _381 = _449;
                _389 = _453;
            }
            float _455 = _381;
            float _457 = _389;
            int _459 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _461 = _459 != 0;
            int _463 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _465 = _463 != 0;
            int _467 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _469 = _467 != 0;
            int _471 = as_type<int>(_455);
            int _473 = as_type<int>(_457);
            if (_465)
            {
                float _475 = -_455;
                float _477 = _475 + 1.0;
                _471 = as_type<int>(_477);
            }
            int _479 = _471;
            if (_469)
            {
                float _481 = -_457;
                float _483 = _481 + 1.0;
                _473 = as_type<int>(_483);
            }
            int _485 = _473;
            bool _487 = !_461;
            float _489 = _487 ? as_type<float>(_479) : as_type<float>(_485);
            bool _491 = !_461;
            float _493 = _491 ? as_type<float>(_485) : as_type<float>(_479);
            _357 = _493;
            _359 = _489;
        }
    }
    _361 = false;
    float _495 = _357;
    float _497 = _359;
    float _499 = _495 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _501 = _495 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _503 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _505 = fma(_497, (*spvDescriptorSet0.vp_c3)._m0[8].x, _499);
    float _507 = fma(_497, (*spvDescriptorSet0.vp_c3)._m0[7].x, _501);
    float _509 = _505 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _511 = _507 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _513 = -_509;
    float _515 = _513 + 1.0;
    out.m_25.x = _511;
    out.m_25.y = _515;
    bool _517 = !_503;
    float _519 = _515;
    float _521 = _511;
    float _535;
    float _537;
    if (!_517)
    {
        float _523 = _47 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _525 = _47 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _527 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].x, _523);
        float _529 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].x, _525);
        float _531 = _527 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _533 = _529 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _535 = _533;
        _537 = _531;
        _539 = true;
    }
    else
    {
        int _541 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _543 = _541 != 0;
        if (!_543)
        {
            _519 = _321;
        }
        float _545 = _519;
        float _547 = _545;
        _537 = _545;
        if (!_543)
        {
            _521 = _319;
        }
        float _549 = _521;
        bool _551 = !_543;
        float _553 = _549;
        _535 = _549;
        if (!_551)
        {
            if (!_327)
            {
                _547 = _321;
            }
            float _555 = _547;
            float _557 = _555;
            int _559 = as_type<int>(_555);
            if (!_327)
            {
                _553 = _319;
            }
            float _561 = _553;
            bool _563 = !_327;
            float _565 = _561;
            float _567 = _561;
            if (!_563)
            {
                int _569 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _571 = _569 != 0;
                int _573 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _575 = _573 != 0;
                int _577 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _579 = _577 != 0;
                int _581 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _583 = _581 != 0;
                int _585 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _587 = _585 != 0;
                if (_571)
                {
                    _557 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _589 = _557;
                float _591 = _589;
                if (_571)
                {
                    _565 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _593 = _565;
                float _595 = _593;
                if (!_571)
                {
                    _591 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _597 = _591;
                if (!_571)
                {
                    _595 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _599 = _595;
                float _601 = _597 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _603 = _599 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_583)
                {
                    float _605 = _601 * _321;
                    _341 = _605;
                }
                float _607 = _341;
                float _609 = -_601;
                float _611 = _609 + 1.0;
                int _613 = as_type<int>(_607);
                if (_587)
                {
                    float _615 = _603 * _319;
                    _343 = _615;
                }
                float _617 = _343;
                float _619 = -_603;
                float _621 = _619 + 1.0;
                float _623 = _617;
                if (_575)
                {
                    float _625 = _607 + _611;
                    _613 = as_type<int>(_625);
                }
                int _627 = _613;
                if (_579)
                {
                    float _629 = _617 + _621;
                    _623 = _629;
                }
                float _631 = _623;
                _559 = _627;
                _567 = _631;
            }
            int _633 = _559;
            float _635 = _567;
            int _637 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _639 = _637 != 0;
            int _641 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _643 = _641 != 0;
            int _645 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _647 = _645 != 0;
            int _649 = _633;
            int _651 = as_type<int>(_635);
            if (_643)
            {
                float _653 = -as_type<float>(_633);
                float _655 = _653 + 1.0;
                _649 = as_type<int>(_655);
            }
            int _657 = _649;
            if (_647)
            {
                float _659 = -_635;
                float _661 = _659 + 1.0;
                _651 = as_type<int>(_661);
            }
            int _663 = _651;
            bool _665 = !_639;
            float _667 = _665 ? as_type<float>(_657) : as_type<float>(_663);
            bool _669 = !_639;
            float _671 = _669 ? as_type<float>(_663) : as_type<float>(_657);
            _535 = _671;
            _537 = _667;
        }
    }
    _539 = false;
    float _673 = _535;
    float _675 = _537;
    float _677 = _673 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _679 = _673 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _681 = fma(_675, (*spvDescriptorSet0.vp_c3)._m0[10].x, _677);
    float _683 = fma(_675, (*spvDescriptorSet0.vp_c3)._m0[9].x, _679);
    float _685 = _681 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _687 = _683 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _689 = -_685;
    float _691 = _689 + 1.0;
    out.m_27.x = _687;
    out.m_27.y = _691;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.dm_pad0.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.dm_pad0.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.dm_pad0.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.dm_pad0.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

