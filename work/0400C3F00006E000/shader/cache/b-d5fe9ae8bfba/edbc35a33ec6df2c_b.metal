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
};

struct main0_in
{
    float4 m_22 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _501 = false;
    bool _327 = false;
    bool _152 = false;
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
    float _110 = _93;
    float _112 = _95;
    float _114 = _85;
    float _116 = _65;
    float _118 = _93;
    float _120 = _95;
    float _122 = _85;
    float _124 = _65;
    float _126 = _47;
    float _128 = _49;
    bool _134;
    float _138;
    float _142;
    float _146;
    float _150;
    if (!_108)
    {
        int _130 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _132 = _130 != 0;
        _134 = _132;
        if (_132)
        {
            _110 = _41;
        }
        float _136 = _110;
        _138 = _136;
        if (_132)
        {
            _112 = _43;
        }
        float _140 = _112;
        _142 = _140;
        if (_132)
        {
            _114 = _41;
        }
        float _144 = _114;
        _146 = _144;
        if (_132)
        {
            _116 = _43;
        }
        float _148 = _116;
        _150 = _148;
        _152 = _132;
        if (!_152)
        {
            float _154 = trunc(_41);
            int _156 = int(_154);
            float _158 = trunc(_43);
            int _160 = int(_158);
            int _162 = _160 << 1;
            int _164 = _162 + _156;
            int _166 = _164 << 4;
            int _168 = _166 + 224;
            uint _171 = uint(int(uint(_168) >> uint(2)));
            uint _173 = uint(int(uint(int(_171)) >> uint(2)));
            int _175 = int(_171) & 3;
            float _177 = (*spvDescriptorSet0.vp_c3)._m0[int(_173)][_175];
            int _179 = int(_171) + 1;
            uint _181 = uint(int(uint(_179) >> uint(2)));
            int _183 = _179 & 3;
            float _185 = (*spvDescriptorSet0.vp_c3)._m0[int(_181)][_183];
            int _187 = _166 + 288;
            uint _189 = uint(int(uint(_187) >> uint(2)));
            uint _191 = uint(int(uint(int(_189)) >> uint(2)));
            int _193 = int(_189) & 3;
            float _195 = (*spvDescriptorSet0.vp_c3)._m0[int(_191)][_193];
            int _197 = int(_189) + 1;
            uint _199 = uint(int(uint(_197) >> uint(2)));
            int _201 = _197 & 3;
            float _203 = (*spvDescriptorSet0.vp_c3)._m0[int(_199)][_201];
            _150 = _203;
            _146 = _195;
            _138 = _177;
            _142 = _185;
            _152 = true;
        }
    }
    else
    {
        int _205 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _207 = _205 != 0;
        _134 = _207;
        if (_207)
        {
            _118 = _41;
        }
        float _209 = _118;
        _138 = _209;
        if (_207)
        {
            _120 = _43;
        }
        float _211 = _120;
        _142 = _211;
        if (_207)
        {
            _122 = _41;
        }
        float _213 = _122;
        _146 = _213;
        if (_207)
        {
            _124 = _43;
        }
        float _215 = _124;
        float _217 = _215;
        _150 = _215;
        if (!_207)
        {
            float _219 = trunc(_41);
            int _221 = int(_219);
            float _223 = trunc(_43);
            int _225 = int(_223);
            int _227 = _225 << 1;
            int _229 = _227 + _221;
            int _231 = _229 << 4;
            uint _233 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            int _235 = _231 + 288;
            uint _237 = uint(int(uint(_235) >> uint(2)));
            uint _239 = uint(int(uint(int(_237)) >> uint(2)));
            int _241 = int(_237) & 3;
            float _243 = (*spvDescriptorSet0.vp_c3)._m0[int(_239)][_241];
            int _245 = int(_237) + 1;
            uint _247 = uint(int(uint(_245) >> uint(2)));
            int _249 = _245 & 3;
            float _251 = (*spvDescriptorSet0.vp_c3)._m0[int(_247)][_249];
            int _253 = int(_233) & 15;
            bool _255 = _253 != 13;
            int _257 = _231 + 224;
            uint _259 = uint(int(uint(_257) >> uint(2)));
            uint _261 = uint(int(uint(int(_259)) >> uint(2)));
            int _263 = int(_259) & 3;
            float _265 = (*spvDescriptorSet0.vp_c3)._m0[int(_261)][_263];
            int _267 = int(_259) + 1;
            uint _269 = uint(int(uint(_267) >> uint(2)));
            int _271 = _267 & 3;
            float _273 = (*spvDescriptorSet0.vp_c3)._m0[int(_269)][_271];
            float _275 = as_type<float>(_253);
            if (!_255)
            {
                _275 = _243;
            }
            float _277 = _275;
            float _279 = _277;
            if (!_255)
            {
                _217 = _251;
            }
            float _281 = _217;
            _150 = _281;
            if (_255)
            {
                _279 = _243;
            }
            float _283 = _279;
            _146 = _283;
            if (_255)
            {
                _150 = _251;
                _138 = _265;
                _142 = _273;
            }
        }
    }
    _152 = false;
    float _285 = _150;
    float _287 = _146;
    float _289 = _138;
    float _291 = _142;
    bool _293 = _134;
    bool _295 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _297 = !_295;
    float _299 = _285;
    float _301 = _287;
    float _303 = _289;
    float _305 = _291;
    float _307 = _287;
    float _309 = _285;
    float _323;
    float _325;
    if (!_297)
    {
        float _311 = _47 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _313 = _47 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _315 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].x, _311);
        float _317 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].x, _313);
        float _319 = _315 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _321 = _317 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _323 = _321;
        _325 = _319;
        _327 = true;
    }
    else
    {
        int _329 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _331 = _329 != 0;
        if (!_331)
        {
            _299 = _289;
        }
        float _333 = _299;
        float _335 = _333;
        _325 = _333;
        if (!_331)
        {
            _301 = _291;
        }
        float _337 = _301;
        bool _339 = !_331;
        float _341 = _337;
        _323 = _337;
        if (!_339)
        {
            if (!_293)
            {
                _335 = _289;
            }
            float _343 = _335;
            float _345 = _343;
            int _347 = as_type<int>(_343);
            if (!_293)
            {
                _341 = _291;
            }
            float _349 = _341;
            bool _351 = !_293;
            float _353 = _349;
            float _355 = _349;
            if (!_351)
            {
                int _357 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _359 = _357 != 0;
                int _361 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _363 = _361 != 0;
                int _365 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _367 = _365 != 0;
                int _369 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _371 = _369 != 0;
                int _373 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _375 = _373 != 0;
                if (_359)
                {
                    _345 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _377 = _345;
                float _379 = _377;
                if (_359)
                {
                    _353 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _381 = _353;
                float _383 = _381;
                if (!_359)
                {
                    _379 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _385 = _379;
                if (!_359)
                {
                    _383 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _387 = _383;
                float _389 = _385 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _391 = _387 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_371)
                {
                    float _393 = _389 * _289;
                    _303 = _393;
                }
                float _395 = _303;
                float _397 = -_389;
                float _399 = _397 + 1.0;
                int _401 = as_type<int>(_395);
                if (_375)
                {
                    float _403 = _391 * _291;
                    _305 = _403;
                }
                float _405 = _305;
                float _407 = -_391;
                float _409 = _407 + 1.0;
                float _411 = _405;
                if (_363)
                {
                    float _413 = _395 + _399;
                    _401 = as_type<int>(_413);
                }
                int _415 = _401;
                if (_367)
                {
                    float _417 = _405 + _409;
                    _411 = _417;
                }
                float _419 = _411;
                _347 = _415;
                _355 = _419;
            }
            int _421 = _347;
            float _423 = _355;
            int _425 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _427 = _425 != 0;
            int _429 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _431 = _429 != 0;
            int _433 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _435 = _433 != 0;
            int _437 = _421;
            int _439 = as_type<int>(_423);
            if (_431)
            {
                float _441 = -as_type<float>(_421);
                float _443 = _441 + 1.0;
                _437 = as_type<int>(_443);
            }
            int _445 = _437;
            if (_435)
            {
                float _447 = -_423;
                float _449 = _447 + 1.0;
                _439 = as_type<int>(_449);
            }
            int _451 = _439;
            bool _453 = !_427;
            float _455 = _453 ? as_type<float>(_445) : as_type<float>(_451);
            bool _457 = !_427;
            float _459 = _457 ? as_type<float>(_451) : as_type<float>(_445);
            _323 = _459;
            _325 = _455;
        }
    }
    _327 = false;
    float _461 = _323;
    float _463 = _325;
    float _465 = _461 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _467 = _461 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _469 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _471 = fma(_463, (*spvDescriptorSet0.vp_c3)._m0[8].x, _465);
    float _473 = fma(_463, (*spvDescriptorSet0.vp_c3)._m0[7].x, _467);
    float _475 = _471 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _477 = _473 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _479 = -_475;
    float _481 = _479 + 1.0;
    out.m_25.x = _477;
    out.m_25.y = _481;
    bool _483 = !_469;
    float _497;
    float _499;
    if (!_483)
    {
        float _485 = _47 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _487 = _47 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _489 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].x, _485);
        float _491 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].x, _487);
        float _493 = _489 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _495 = _491 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _497 = _495;
        _499 = _493;
        _501 = true;
    }
    else
    {
        int _503 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _505 = _503 != 0;
        if (!_505)
        {
            _126 = _287;
        }
        float _507 = _126;
        float _509 = _507;
        _499 = _507;
        if (!_505)
        {
            _128 = _285;
        }
        float _511 = _128;
        bool _513 = !_505;
        float _515 = _511;
        _497 = _511;
        if (!_513)
        {
            if (!_293)
            {
                _509 = _287;
            }
            float _517 = _509;
            float _519 = _517;
            int _521 = as_type<int>(_517);
            if (!_293)
            {
                _515 = _285;
            }
            float _523 = _515;
            bool _525 = !_293;
            float _527 = _523;
            float _529 = _523;
            if (!_525)
            {
                int _531 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _533 = _531 != 0;
                int _535 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _537 = _535 != 0;
                int _539 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _541 = _539 != 0;
                int _543 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _545 = _543 != 0;
                int _547 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _549 = _547 != 0;
                if (_533)
                {
                    _519 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _551 = _519;
                float _553 = _551;
                if (_533)
                {
                    _527 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _555 = _527;
                float _557 = _555;
                if (!_533)
                {
                    _553 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _559 = _553;
                if (!_533)
                {
                    _557 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _561 = _557;
                float _563 = _559 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _565 = _561 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_545)
                {
                    float _567 = _563 * _287;
                    _307 = _567;
                }
                float _569 = _307;
                float _571 = -_563;
                float _573 = _571 + 1.0;
                int _575 = as_type<int>(_569);
                if (_549)
                {
                    float _577 = _565 * _285;
                    _309 = _577;
                }
                float _579 = _309;
                float _581 = -_565;
                float _583 = _581 + 1.0;
                float _585 = _579;
                if (_537)
                {
                    float _587 = _569 + _573;
                    _575 = as_type<int>(_587);
                }
                int _589 = _575;
                if (_541)
                {
                    float _591 = _579 + _583;
                    _585 = _591;
                }
                float _593 = _585;
                _521 = _589;
                _529 = _593;
            }
            int _595 = _521;
            float _597 = _529;
            int _599 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _601 = _599 != 0;
            int _603 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _605 = _603 != 0;
            int _607 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _609 = _607 != 0;
            int _611 = _595;
            int _613 = as_type<int>(_597);
            if (_605)
            {
                float _615 = -as_type<float>(_595);
                float _617 = _615 + 1.0;
                _611 = as_type<int>(_617);
            }
            int _619 = _611;
            if (_609)
            {
                float _621 = -_597;
                float _623 = _621 + 1.0;
                _613 = as_type<int>(_623);
            }
            int _625 = _613;
            bool _627 = !_601;
            float _629 = _627 ? as_type<float>(_619) : as_type<float>(_625);
            bool _631 = !_601;
            float _633 = _631 ? as_type<float>(_625) : as_type<float>(_619);
            _497 = _633;
            _499 = _629;
        }
    }
    _501 = false;
    float _635 = _497;
    float _637 = _499;
    float _639 = _635 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _641 = _635 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _643 = fma(_637, (*spvDescriptorSet0.vp_c3)._m0[10].x, _639);
    float _645 = fma(_637, (*spvDescriptorSet0.vp_c3)._m0[9].x, _641);
    float _647 = _643 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _649 = _645 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _651 = -_647;
    float _653 = _651 + 1.0;
    out.m_27.x = _649;
    out.m_27.y = _653;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _501 = false;
    bool _327 = false;
    bool _152 = false;
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
    float _110 = _93;
    float _112 = _95;
    float _114 = _85;
    float _116 = _65;
    float _118 = _93;
    float _120 = _95;
    float _122 = _85;
    float _124 = _65;
    float _126 = _47;
    float _128 = _49;
    bool _134;
    float _138;
    float _142;
    float _146;
    float _150;
    if (!_108)
    {
        int _130 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _132 = _130 != 0;
        _134 = _132;
        if (_132)
        {
            _110 = _41;
        }
        float _136 = _110;
        _138 = _136;
        if (_132)
        {
            _112 = _43;
        }
        float _140 = _112;
        _142 = _140;
        if (_132)
        {
            _114 = _41;
        }
        float _144 = _114;
        _146 = _144;
        if (_132)
        {
            _116 = _43;
        }
        float _148 = _116;
        _150 = _148;
        _152 = _132;
        if (!_152)
        {
            float _154 = trunc(_41);
            int _156 = int(_154);
            float _158 = trunc(_43);
            int _160 = int(_158);
            int _162 = _160 << 1;
            int _164 = _162 + _156;
            int _166 = _164 << 4;
            int _168 = _166 + 224;
            uint _171 = uint(int(uint(_168) >> uint(2)));
            uint _173 = uint(int(uint(int(_171)) >> uint(2)));
            int _175 = int(_171) & 3;
            float _177 = (*spvDescriptorSet0.vp_c3)._m0[int(_173)][_175];
            int _179 = int(_171) + 1;
            uint _181 = uint(int(uint(_179) >> uint(2)));
            int _183 = _179 & 3;
            float _185 = (*spvDescriptorSet0.vp_c3)._m0[int(_181)][_183];
            int _187 = _166 + 288;
            uint _189 = uint(int(uint(_187) >> uint(2)));
            uint _191 = uint(int(uint(int(_189)) >> uint(2)));
            int _193 = int(_189) & 3;
            float _195 = (*spvDescriptorSet0.vp_c3)._m0[int(_191)][_193];
            int _197 = int(_189) + 1;
            uint _199 = uint(int(uint(_197) >> uint(2)));
            int _201 = _197 & 3;
            float _203 = (*spvDescriptorSet0.vp_c3)._m0[int(_199)][_201];
            _150 = _203;
            _146 = _195;
            _138 = _177;
            _142 = _185;
            _152 = true;
        }
    }
    else
    {
        int _205 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _207 = _205 != 0;
        _134 = _207;
        if (_207)
        {
            _118 = _41;
        }
        float _209 = _118;
        _138 = _209;
        if (_207)
        {
            _120 = _43;
        }
        float _211 = _120;
        _142 = _211;
        if (_207)
        {
            _122 = _41;
        }
        float _213 = _122;
        _146 = _213;
        if (_207)
        {
            _124 = _43;
        }
        float _215 = _124;
        float _217 = _215;
        _150 = _215;
        if (!_207)
        {
            float _219 = trunc(_41);
            int _221 = int(_219);
            float _223 = trunc(_43);
            int _225 = int(_223);
            int _227 = _225 << 1;
            int _229 = _227 + _221;
            int _231 = _229 << 4;
            uint _233 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            int _235 = _231 + 288;
            uint _237 = uint(int(uint(_235) >> uint(2)));
            uint _239 = uint(int(uint(int(_237)) >> uint(2)));
            int _241 = int(_237) & 3;
            float _243 = (*spvDescriptorSet0.vp_c3)._m0[int(_239)][_241];
            int _245 = int(_237) + 1;
            uint _247 = uint(int(uint(_245) >> uint(2)));
            int _249 = _245 & 3;
            float _251 = (*spvDescriptorSet0.vp_c3)._m0[int(_247)][_249];
            int _253 = int(_233) & 15;
            bool _255 = _253 != 13;
            int _257 = _231 + 224;
            uint _259 = uint(int(uint(_257) >> uint(2)));
            uint _261 = uint(int(uint(int(_259)) >> uint(2)));
            int _263 = int(_259) & 3;
            float _265 = (*spvDescriptorSet0.vp_c3)._m0[int(_261)][_263];
            int _267 = int(_259) + 1;
            uint _269 = uint(int(uint(_267) >> uint(2)));
            int _271 = _267 & 3;
            float _273 = (*spvDescriptorSet0.vp_c3)._m0[int(_269)][_271];
            float _275 = as_type<float>(_253);
            if (!_255)
            {
                _275 = _243;
            }
            float _277 = _275;
            float _279 = _277;
            if (!_255)
            {
                _217 = _251;
            }
            float _281 = _217;
            _150 = _281;
            if (_255)
            {
                _279 = _243;
            }
            float _283 = _279;
            _146 = _283;
            if (_255)
            {
                _150 = _251;
                _138 = _265;
                _142 = _273;
            }
        }
    }
    _152 = false;
    float _285 = _150;
    float _287 = _146;
    float _289 = _138;
    float _291 = _142;
    bool _293 = _134;
    bool _295 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _297 = !_295;
    float _299 = _285;
    float _301 = _287;
    float _303 = _289;
    float _305 = _291;
    float _307 = _287;
    float _309 = _285;
    float _323;
    float _325;
    if (!_297)
    {
        float _311 = _47 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _313 = _47 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _315 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].x, _311);
        float _317 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].x, _313);
        float _319 = _315 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _321 = _317 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _323 = _321;
        _325 = _319;
        _327 = true;
    }
    else
    {
        int _329 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _331 = _329 != 0;
        if (!_331)
        {
            _299 = _289;
        }
        float _333 = _299;
        float _335 = _333;
        _325 = _333;
        if (!_331)
        {
            _301 = _291;
        }
        float _337 = _301;
        bool _339 = !_331;
        float _341 = _337;
        _323 = _337;
        if (!_339)
        {
            if (!_293)
            {
                _335 = _289;
            }
            float _343 = _335;
            float _345 = _343;
            int _347 = as_type<int>(_343);
            if (!_293)
            {
                _341 = _291;
            }
            float _349 = _341;
            bool _351 = !_293;
            float _353 = _349;
            float _355 = _349;
            if (!_351)
            {
                int _357 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _359 = _357 != 0;
                int _361 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _363 = _361 != 0;
                int _365 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _367 = _365 != 0;
                int _369 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _371 = _369 != 0;
                int _373 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _375 = _373 != 0;
                if (_359)
                {
                    _345 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _377 = _345;
                float _379 = _377;
                if (_359)
                {
                    _353 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _381 = _353;
                float _383 = _381;
                if (!_359)
                {
                    _379 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _385 = _379;
                if (!_359)
                {
                    _383 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _387 = _383;
                float _389 = _385 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _391 = _387 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_371)
                {
                    float _393 = _389 * _289;
                    _303 = _393;
                }
                float _395 = _303;
                float _397 = -_389;
                float _399 = _397 + 1.0;
                int _401 = as_type<int>(_395);
                if (_375)
                {
                    float _403 = _391 * _291;
                    _305 = _403;
                }
                float _405 = _305;
                float _407 = -_391;
                float _409 = _407 + 1.0;
                float _411 = _405;
                if (_363)
                {
                    float _413 = _395 + _399;
                    _401 = as_type<int>(_413);
                }
                int _415 = _401;
                if (_367)
                {
                    float _417 = _405 + _409;
                    _411 = _417;
                }
                float _419 = _411;
                _347 = _415;
                _355 = _419;
            }
            int _421 = _347;
            float _423 = _355;
            int _425 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _427 = _425 != 0;
            int _429 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _431 = _429 != 0;
            int _433 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _435 = _433 != 0;
            int _437 = _421;
            int _439 = as_type<int>(_423);
            if (_431)
            {
                float _441 = -as_type<float>(_421);
                float _443 = _441 + 1.0;
                _437 = as_type<int>(_443);
            }
            int _445 = _437;
            if (_435)
            {
                float _447 = -_423;
                float _449 = _447 + 1.0;
                _439 = as_type<int>(_449);
            }
            int _451 = _439;
            bool _453 = !_427;
            float _455 = _453 ? as_type<float>(_445) : as_type<float>(_451);
            bool _457 = !_427;
            float _459 = _457 ? as_type<float>(_451) : as_type<float>(_445);
            _323 = _459;
            _325 = _455;
        }
    }
    _327 = false;
    float _461 = _323;
    float _463 = _325;
    float _465 = _461 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _467 = _461 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _469 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _471 = fma(_463, (*spvDescriptorSet0.vp_c3)._m0[8].x, _465);
    float _473 = fma(_463, (*spvDescriptorSet0.vp_c3)._m0[7].x, _467);
    float _475 = _471 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _477 = _473 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _479 = -_475;
    float _481 = _479 + 1.0;
    out.m_25.x = _477;
    out.m_25.y = _481;
    bool _483 = !_469;
    float _497;
    float _499;
    if (!_483)
    {
        float _485 = _47 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _487 = _47 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _489 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].x, _485);
        float _491 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].x, _487);
        float _493 = _489 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _495 = _491 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _497 = _495;
        _499 = _493;
        _501 = true;
    }
    else
    {
        int _503 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _505 = _503 != 0;
        if (!_505)
        {
            _126 = _287;
        }
        float _507 = _126;
        float _509 = _507;
        _499 = _507;
        if (!_505)
        {
            _128 = _285;
        }
        float _511 = _128;
        bool _513 = !_505;
        float _515 = _511;
        _497 = _511;
        if (!_513)
        {
            if (!_293)
            {
                _509 = _287;
            }
            float _517 = _509;
            float _519 = _517;
            int _521 = as_type<int>(_517);
            if (!_293)
            {
                _515 = _285;
            }
            float _523 = _515;
            bool _525 = !_293;
            float _527 = _523;
            float _529 = _523;
            if (!_525)
            {
                int _531 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _533 = _531 != 0;
                int _535 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _537 = _535 != 0;
                int _539 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _541 = _539 != 0;
                int _543 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _545 = _543 != 0;
                int _547 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _549 = _547 != 0;
                if (_533)
                {
                    _519 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _551 = _519;
                float _553 = _551;
                if (_533)
                {
                    _527 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _555 = _527;
                float _557 = _555;
                if (!_533)
                {
                    _553 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _559 = _553;
                if (!_533)
                {
                    _557 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _561 = _557;
                float _563 = _559 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _565 = _561 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_545)
                {
                    float _567 = _563 * _287;
                    _307 = _567;
                }
                float _569 = _307;
                float _571 = -_563;
                float _573 = _571 + 1.0;
                int _575 = as_type<int>(_569);
                if (_549)
                {
                    float _577 = _565 * _285;
                    _309 = _577;
                }
                float _579 = _309;
                float _581 = -_565;
                float _583 = _581 + 1.0;
                float _585 = _579;
                if (_537)
                {
                    float _587 = _569 + _573;
                    _575 = as_type<int>(_587);
                }
                int _589 = _575;
                if (_541)
                {
                    float _591 = _579 + _583;
                    _585 = _591;
                }
                float _593 = _585;
                _521 = _589;
                _529 = _593;
            }
            int _595 = _521;
            float _597 = _529;
            int _599 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _601 = _599 != 0;
            int _603 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _605 = _603 != 0;
            int _607 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _609 = _607 != 0;
            int _611 = _595;
            int _613 = as_type<int>(_597);
            if (_605)
            {
                float _615 = -as_type<float>(_595);
                float _617 = _615 + 1.0;
                _611 = as_type<int>(_617);
            }
            int _619 = _611;
            if (_609)
            {
                float _621 = -_597;
                float _623 = _621 + 1.0;
                _613 = as_type<int>(_623);
            }
            int _625 = _613;
            bool _627 = !_601;
            float _629 = _627 ? as_type<float>(_619) : as_type<float>(_625);
            bool _631 = !_601;
            float _633 = _631 ? as_type<float>(_625) : as_type<float>(_619);
            _497 = _633;
            _499 = _629;
        }
    }
    _501 = false;
    float _635 = _497;
    float _637 = _499;
    float _639 = _635 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _641 = _635 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _643 = fma(_637, (*spvDescriptorSet0.vp_c3)._m0[10].x, _639);
    float _645 = fma(_637, (*spvDescriptorSet0.vp_c3)._m0[9].x, _641);
    float _647 = _643 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _649 = _645 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _651 = -_647;
    float _653 = _651 + 1.0;
    out.m_27.x = _649;
    out.m_27.y = _653;
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
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _501 = false;
    bool _327 = false;
    bool _152 = false;
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
    float _110 = _93;
    float _112 = _95;
    float _114 = _85;
    float _116 = _65;
    float _118 = _93;
    float _120 = _95;
    float _122 = _85;
    float _124 = _65;
    float _126 = _47;
    float _128 = _49;
    bool _134;
    float _138;
    float _142;
    float _146;
    float _150;
    if (!_108)
    {
        int _130 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _132 = _130 != 0;
        _134 = _132;
        if (_132)
        {
            _110 = _41;
        }
        float _136 = _110;
        _138 = _136;
        if (_132)
        {
            _112 = _43;
        }
        float _140 = _112;
        _142 = _140;
        if (_132)
        {
            _114 = _41;
        }
        float _144 = _114;
        _146 = _144;
        if (_132)
        {
            _116 = _43;
        }
        float _148 = _116;
        _150 = _148;
        _152 = _132;
        if (!_152)
        {
            float _154 = trunc(_41);
            int _156 = int(_154);
            float _158 = trunc(_43);
            int _160 = int(_158);
            int _162 = _160 << 1;
            int _164 = _162 + _156;
            int _166 = _164 << 4;
            int _168 = _166 + 224;
            uint _171 = uint(int(uint(_168) >> uint(2)));
            uint _173 = uint(int(uint(int(_171)) >> uint(2)));
            int _175 = int(_171) & 3;
            float _177 = (*spvDescriptorSet0.vp_c3)._m0[int(_173)][_175];
            int _179 = int(_171) + 1;
            uint _181 = uint(int(uint(_179) >> uint(2)));
            int _183 = _179 & 3;
            float _185 = (*spvDescriptorSet0.vp_c3)._m0[int(_181)][_183];
            int _187 = _166 + 288;
            uint _189 = uint(int(uint(_187) >> uint(2)));
            uint _191 = uint(int(uint(int(_189)) >> uint(2)));
            int _193 = int(_189) & 3;
            float _195 = (*spvDescriptorSet0.vp_c3)._m0[int(_191)][_193];
            int _197 = int(_189) + 1;
            uint _199 = uint(int(uint(_197) >> uint(2)));
            int _201 = _197 & 3;
            float _203 = (*spvDescriptorSet0.vp_c3)._m0[int(_199)][_201];
            _150 = _203;
            _146 = _195;
            _138 = _177;
            _142 = _185;
            _152 = true;
        }
    }
    else
    {
        int _205 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _207 = _205 != 0;
        _134 = _207;
        if (_207)
        {
            _118 = _41;
        }
        float _209 = _118;
        _138 = _209;
        if (_207)
        {
            _120 = _43;
        }
        float _211 = _120;
        _142 = _211;
        if (_207)
        {
            _122 = _41;
        }
        float _213 = _122;
        _146 = _213;
        if (_207)
        {
            _124 = _43;
        }
        float _215 = _124;
        float _217 = _215;
        _150 = _215;
        if (!_207)
        {
            float _219 = trunc(_41);
            int _221 = int(_219);
            float _223 = trunc(_43);
            int _225 = int(_223);
            int _227 = _225 << 1;
            int _229 = _227 + _221;
            int _231 = _229 << 4;
            uint _233 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            int _235 = _231 + 288;
            uint _237 = uint(int(uint(_235) >> uint(2)));
            uint _239 = uint(int(uint(int(_237)) >> uint(2)));
            int _241 = int(_237) & 3;
            float _243 = (*spvDescriptorSet0.vp_c3)._m0[int(_239)][_241];
            int _245 = int(_237) + 1;
            uint _247 = uint(int(uint(_245) >> uint(2)));
            int _249 = _245 & 3;
            float _251 = (*spvDescriptorSet0.vp_c3)._m0[int(_247)][_249];
            int _253 = int(_233) & 15;
            bool _255 = _253 != 13;
            int _257 = _231 + 224;
            uint _259 = uint(int(uint(_257) >> uint(2)));
            uint _261 = uint(int(uint(int(_259)) >> uint(2)));
            int _263 = int(_259) & 3;
            float _265 = (*spvDescriptorSet0.vp_c3)._m0[int(_261)][_263];
            int _267 = int(_259) + 1;
            uint _269 = uint(int(uint(_267) >> uint(2)));
            int _271 = _267 & 3;
            float _273 = (*spvDescriptorSet0.vp_c3)._m0[int(_269)][_271];
            float _275 = as_type<float>(_253);
            if (!_255)
            {
                _275 = _243;
            }
            float _277 = _275;
            float _279 = _277;
            if (!_255)
            {
                _217 = _251;
            }
            float _281 = _217;
            _150 = _281;
            if (_255)
            {
                _279 = _243;
            }
            float _283 = _279;
            _146 = _283;
            if (_255)
            {
                _150 = _251;
                _138 = _265;
                _142 = _273;
            }
        }
    }
    _152 = false;
    float _285 = _150;
    float _287 = _146;
    float _289 = _138;
    float _291 = _142;
    bool _293 = _134;
    bool _295 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _297 = !_295;
    float _299 = _285;
    float _301 = _287;
    float _303 = _289;
    float _305 = _291;
    float _307 = _287;
    float _309 = _285;
    float _323;
    float _325;
    if (!_297)
    {
        float _311 = _47 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _313 = _47 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _315 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].x, _311);
        float _317 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].x, _313);
        float _319 = _315 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _321 = _317 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _323 = _321;
        _325 = _319;
        _327 = true;
    }
    else
    {
        int _329 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _331 = _329 != 0;
        if (!_331)
        {
            _299 = _289;
        }
        float _333 = _299;
        float _335 = _333;
        _325 = _333;
        if (!_331)
        {
            _301 = _291;
        }
        float _337 = _301;
        bool _339 = !_331;
        float _341 = _337;
        _323 = _337;
        if (!_339)
        {
            if (!_293)
            {
                _335 = _289;
            }
            float _343 = _335;
            float _345 = _343;
            int _347 = as_type<int>(_343);
            if (!_293)
            {
                _341 = _291;
            }
            float _349 = _341;
            bool _351 = !_293;
            float _353 = _349;
            float _355 = _349;
            if (!_351)
            {
                int _357 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _359 = _357 != 0;
                int _361 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _363 = _361 != 0;
                int _365 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _367 = _365 != 0;
                int _369 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _371 = _369 != 0;
                int _373 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _375 = _373 != 0;
                if (_359)
                {
                    _345 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _377 = _345;
                float _379 = _377;
                if (_359)
                {
                    _353 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _381 = _353;
                float _383 = _381;
                if (!_359)
                {
                    _379 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _385 = _379;
                if (!_359)
                {
                    _383 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _387 = _383;
                float _389 = _385 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _391 = _387 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_371)
                {
                    float _393 = _389 * _289;
                    _303 = _393;
                }
                float _395 = _303;
                float _397 = -_389;
                float _399 = _397 + 1.0;
                int _401 = as_type<int>(_395);
                if (_375)
                {
                    float _403 = _391 * _291;
                    _305 = _403;
                }
                float _405 = _305;
                float _407 = -_391;
                float _409 = _407 + 1.0;
                float _411 = _405;
                if (_363)
                {
                    float _413 = _395 + _399;
                    _401 = as_type<int>(_413);
                }
                int _415 = _401;
                if (_367)
                {
                    float _417 = _405 + _409;
                    _411 = _417;
                }
                float _419 = _411;
                _347 = _415;
                _355 = _419;
            }
            int _421 = _347;
            float _423 = _355;
            int _425 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _427 = _425 != 0;
            int _429 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _431 = _429 != 0;
            int _433 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _435 = _433 != 0;
            int _437 = _421;
            int _439 = as_type<int>(_423);
            if (_431)
            {
                float _441 = -as_type<float>(_421);
                float _443 = _441 + 1.0;
                _437 = as_type<int>(_443);
            }
            int _445 = _437;
            if (_435)
            {
                float _447 = -_423;
                float _449 = _447 + 1.0;
                _439 = as_type<int>(_449);
            }
            int _451 = _439;
            bool _453 = !_427;
            float _455 = _453 ? as_type<float>(_445) : as_type<float>(_451);
            bool _457 = !_427;
            float _459 = _457 ? as_type<float>(_451) : as_type<float>(_445);
            _323 = _459;
            _325 = _455;
        }
    }
    _327 = false;
    float _461 = _323;
    float _463 = _325;
    float _465 = _461 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _467 = _461 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _469 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _471 = fma(_463, (*spvDescriptorSet0.vp_c3)._m0[8].x, _465);
    float _473 = fma(_463, (*spvDescriptorSet0.vp_c3)._m0[7].x, _467);
    float _475 = _471 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _477 = _473 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _479 = -_475;
    float _481 = _479 + 1.0;
    out.m_25.x = _477;
    out.m_25.y = _481;
    bool _483 = !_469;
    float _497;
    float _499;
    if (!_483)
    {
        float _485 = _47 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _487 = _47 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _489 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].x, _485);
        float _491 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].x, _487);
        float _493 = _489 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _495 = _491 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _497 = _495;
        _499 = _493;
        _501 = true;
    }
    else
    {
        int _503 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _505 = _503 != 0;
        if (!_505)
        {
            _126 = _287;
        }
        float _507 = _126;
        float _509 = _507;
        _499 = _507;
        if (!_505)
        {
            _128 = _285;
        }
        float _511 = _128;
        bool _513 = !_505;
        float _515 = _511;
        _497 = _511;
        if (!_513)
        {
            if (!_293)
            {
                _509 = _287;
            }
            float _517 = _509;
            float _519 = _517;
            int _521 = as_type<int>(_517);
            if (!_293)
            {
                _515 = _285;
            }
            float _523 = _515;
            bool _525 = !_293;
            float _527 = _523;
            float _529 = _523;
            if (!_525)
            {
                int _531 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _533 = _531 != 0;
                int _535 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _537 = _535 != 0;
                int _539 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _541 = _539 != 0;
                int _543 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _545 = _543 != 0;
                int _547 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _549 = _547 != 0;
                if (_533)
                {
                    _519 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _551 = _519;
                float _553 = _551;
                if (_533)
                {
                    _527 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _555 = _527;
                float _557 = _555;
                if (!_533)
                {
                    _553 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _559 = _553;
                if (!_533)
                {
                    _557 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _561 = _557;
                float _563 = _559 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _565 = _561 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_545)
                {
                    float _567 = _563 * _287;
                    _307 = _567;
                }
                float _569 = _307;
                float _571 = -_563;
                float _573 = _571 + 1.0;
                int _575 = as_type<int>(_569);
                if (_549)
                {
                    float _577 = _565 * _285;
                    _309 = _577;
                }
                float _579 = _309;
                float _581 = -_565;
                float _583 = _581 + 1.0;
                float _585 = _579;
                if (_537)
                {
                    float _587 = _569 + _573;
                    _575 = as_type<int>(_587);
                }
                int _589 = _575;
                if (_541)
                {
                    float _591 = _579 + _583;
                    _585 = _591;
                }
                float _593 = _585;
                _521 = _589;
                _529 = _593;
            }
            int _595 = _521;
            float _597 = _529;
            int _599 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _601 = _599 != 0;
            int _603 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _605 = _603 != 0;
            int _607 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _609 = _607 != 0;
            int _611 = _595;
            int _613 = as_type<int>(_597);
            if (_605)
            {
                float _615 = -as_type<float>(_595);
                float _617 = _615 + 1.0;
                _611 = as_type<int>(_617);
            }
            int _619 = _611;
            if (_609)
            {
                float _621 = -_597;
                float _623 = _621 + 1.0;
                _613 = as_type<int>(_623);
            }
            int _625 = _613;
            bool _627 = !_601;
            float _629 = _627 ? as_type<float>(_619) : as_type<float>(_625);
            bool _631 = !_601;
            float _633 = _631 ? as_type<float>(_625) : as_type<float>(_619);
            _497 = _633;
            _499 = _629;
        }
    }
    _501 = false;
    float _635 = _497;
    float _637 = _499;
    float _639 = _635 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _641 = _635 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _643 = fma(_637, (*spvDescriptorSet0.vp_c3)._m0[10].x, _639);
    float _645 = fma(_637, (*spvDescriptorSet0.vp_c3)._m0[9].x, _641);
    float _647 = _643 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _649 = _645 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _651 = -_647;
    float _653 = _651 + 1.0;
    out.m_27.x = _649;
    out.m_27.y = _653;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

