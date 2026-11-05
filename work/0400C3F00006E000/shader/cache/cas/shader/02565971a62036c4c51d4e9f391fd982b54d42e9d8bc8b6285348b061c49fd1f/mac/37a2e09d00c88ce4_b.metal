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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
};

struct main0_out
{
    float4 m_31 [[color(0)]];
};

struct main0_in
{
    float4 m_28 [[user(locn0)]];
    float4 m_26 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _38 = gl_FragCoord.w;
    float _40 = in.m_26.y;
    float _42 = gl_FragCoord.w;
    float _44 = _40 * _42;
    float _46 = in.m_26.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_28.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_28.y;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_28.z;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_28.w;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _78 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _80 = 1.0 / _38;
    float _82 = _80 * _44;
    float _84 = _80 * _50;
    bool _88 = _82 >= 0.5;
    bool _90 = isnan(_82);
    bool _92 = _88 || _90;
    bool _94 = isnan(0.5);
    bool _96 = _92 || _94;
    bool _98 = _84 >= 0.5;
    bool _100 = isnan(_84);
    bool _102 = _98 || _100;
    bool _104 = isnan(0.5);
    bool _106 = _102 || _104;
    float _108 = float(_106);
    bool _110 = !_96;
    float _112 = _110 ? 0.0 : 2.0;
    float _114 = _108 + _112;
    float _116 = fma(_84, 2.0, -1.0);
    float _118 = fma(_82, 2.0, -1.0);
    float _120 = _80 * _62;
    float _122 = trunc(_114);
    int _125 = int(_122);
    float _127 = _120 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    int _129 = _125 << 4;
    int _131 = _129 + 16;
    float _133 = _80 * _68;
    int _135 = _131 + 4;
    uint _138 = uint(int(uint(_135) >> uint(2)));
    uint _140 = uint(int(uint(int(_138)) >> uint(2)));
    int _142 = int(_138) & 3;
    float _144 = (*spvDescriptorSet0.fp_c4)._m0[int(_140)][_142];
    float _146 = _133 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    int _148 = _131 + 8;
    uint _150 = uint(int(uint(_148) >> uint(2)));
    uint _152 = uint(int(uint(int(_150)) >> uint(2)));
    int _154 = int(_150) & 3;
    float _156 = (*spvDescriptorSet0.fp_c4)._m0[int(_152)][_154];
    int _158 = int(_150) + 1;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    int _162 = _158 & 3;
    float _164 = (*spvDescriptorSet0.fp_c4)._m0[int(_160)][_162];
    float _166 = precise::max(0.0, _144);
    bool _168 = _166 >= 0.00999999977648258209228515625;
    bool _170 = isnan(_166);
    bool _172 = _168 || _170;
    bool _174 = isnan(0.00999999977648258209228515625);
    bool _176 = _172 || _174;
    float _178 = abs(_116);
    float _180 = -_156;
    float _182 = _178 + _180;
    float _184 = abs(_118);
    float _186 = -_164;
    float _188 = _184 + _186;
    float _190 = _182 * _76;
    float _192 = _188 * _78;
    float _194 = _80 * _56;
    float _196 = _80 * _74;
    float _198 = precise::max(_190, _192);
    float _200 = _194 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _202 = _196 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _204 = _78;
    if (!_176)
    {
        bool _206 = _198 <= 0.0;
        float _208 = float(_206);
        _204 = _208;
    }
    float _210 = _204;
    bool _212 = !_176;
    float _214 = _210;
    float _216 = _210;
    if (!_212)
    {
        bool _218 = _190 > 0.001000000047497451305389404296875;
        bool _220 = isnan(_190);
        bool _222 = _218 || _220;
        bool _224 = isnan(0.001000000047497451305389404296875);
        bool _226 = _222 || _224;
        bool _228 = _192 <= 0.001000000047497451305389404296875;
        bool _230 = !_226;
        bool _232 = _228 || _230;
        float _234 = _56;
        if (_232)
        {
            float _236 = 1.0 / _166;
            _234 = _236;
        }
        float _238 = _234;
        if (_232)
        {
            float _240 = abs(_198);
            float _242 = _198 * _240;
            _214 = _242;
        }
        float _244 = _214;
        float _246 = _244;
        if (_232)
        {
            float _248 = -_244;
            float _250 = fma(_248, _238, _166);
            float _252 = precise::clamp(_250, 0.0, 1.0);
            _246 = _252;
        }
        float _254 = _246;
        _216 = _254;
        if (!_232)
        {
            uint _256 = uint(int(uint(_131) >> uint(2)));
            uint _258 = uint(int(uint(int(_256)) >> uint(2)));
            int _260 = int(_256) & 3;
            float _262 = (*spvDescriptorSet0.fp_c4)._m0[int(_258)][_260];
            bool _264 = _190 > _192;
            bool _266 = isnan(_190);
            bool _268 = _264 || _266;
            bool _270 = isnan(_192);
            bool _272 = _268 || _270;
            bool _274 = _262 < 1.0;
            bool _276 = !_272;
            bool _278 = _274 != _276;
            float _280 = 1.0 / _262;
            float _282 = _278 ? _192 : _190;
            float _284 = _278 ? _190 : _192;
            float _286 = _262 + (-1.0);
            float _288 = abs(_282);
            float _290 = log2(_288);
            float _292 = abs(_284);
            float _294 = log2(_292);
            float _296 = _286 * _290;
            float _298 = exp2(_296);
            float _300 = _286 * _294;
            float _302 = exp2(_300);
            float _304 = _282 * _298;
            float _306 = 1.0 / _298;
            float _308 = fma(_284, _302, _304);
            float _310 = abs(_308);
            float _312 = log2(_310);
            float _314 = _312 * _280;
            float _316 = -_314;
            float _318 = exp2(_316);
            float _320 = _166 * _318;
            float _322 = _302 + _298;
            float _324 = -_282;
            float _326 = fma(_282, _320, _324);
            float _328 = -_284;
            float _330 = fma(_284, _320, _328);
            float _332 = _322 * 0.5;
            float _334 = _302 * _306;
            float _336 = _298 * _326;
            float _338 = fma(_302, _330, _336);
            float _340 = _298 * 0.5;
            float _342 = abs(_338);
            bool _344 = _332 > _342;
            bool _346 = isnan(_332);
            bool _348 = _344 || _346;
            bool _350 = isnan(_342);
            bool _352 = _348 || _350;
            float _354 = fma(_302, -0.5, _340);
            bool _356 = _338 >= 0.0;
            float _358 = _340;
            float _360 = _306;
            float _362 = _312;
            float _364 = _332;
            float _366 = _334;
            float _368 = _338;
            if (!_352)
            {
                _358 = 1.0;
            }
            float _370 = _358;
            bool _372 = !_352;
            float _374 = _370;
            if (!_372)
            {
                float _376 = abs(_338);
                bool _378 = _376 >= _354;
                bool _380 = isnan(_376);
                bool _382 = _378 || _380;
                bool _384 = isnan(_354);
                bool _386 = _382 || _384;
                if (_386)
                {
                    float _388 = -_332;
                    float _390 = _388 + _354;
                    _360 = _390;
                }
                float _392 = _360;
                float _394 = _370;
                if (!_386)
                {
                    float _396 = 1.0 / _354;
                    _394 = _396;
                }
                float _398 = _394;
                if (!_386)
                {
                    float _400 = -_334;
                    float _402 = _400 + 1.0;
                    _362 = _402;
                }
                float _404 = _362;
                float _406 = _404;
                if (_386)
                {
                    float _408 = abs(_338);
                    float _410 = -_332;
                    float _412 = _408 + _410;
                    _364 = _412;
                }
                float _414 = _364;
                float _416 = _414;
                if (_386)
                {
                    float _418 = _334 * 0.5;
                    _366 = _418;
                }
                float _420 = _366;
                if (!_386)
                {
                    float _422 = abs(_338);
                    float _424 = _422 * _404;
                    _406 = _424;
                }
                float _426 = _406;
                float _428 = _426;
                if (!_386)
                {
                    _368 = 0.5;
                }
                float _430 = _368;
                float _432 = _392;
                float _434 = _430;
                if (_386)
                {
                    float _436 = 1.0 / _392;
                    _432 = _436;
                }
                float _438 = _432;
                float _440 = _398;
                if (!_386)
                {
                    float _442 = _426 * _398;
                    _428 = _442;
                }
                float _444 = _428;
                if (!_386)
                {
                    float _446 = fma(_444, _430, 0.5);
                    _440 = _446;
                }
                float _448 = _440;
                _374 = _448;
                if (_386)
                {
                    float _450 = _414 * _438;
                    _416 = _450;
                }
                float _452 = _416;
                if (_386)
                {
                    float _454 = _452 * _452;
                    _434 = _454;
                }
                float _456 = _434;
                if (_386)
                {
                    float _458 = -_420;
                    float _460 = fma(_458, _456, 1.0);
                    _374 = _460;
                }
            }
            float _462 = _374;
            _216 = _462;
            if (!_356)
            {
                float _464 = -_462;
                float _466 = _464 + 1.0;
                _216 = _466;
            }
        }
    }
    float _468 = _216;
    float _470 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _472 = 1.0 + _470;
    float _474 = _472 * _468;
    float _476 = _202 * _474;
    float _478 = precise::clamp(_476, 0.0, 1.0);
    bool _480 = _478 != 0.0;
    bool _482 = isnan(_478);
    bool _484 = _480 || _482;
    bool _486 = isnan(0.0);
    bool _488 = _484 || _486;
    if (_488)
    {
        out.m_31.x = _200;
        out.m_31.y = _127;
        out.m_31.z = _146;
        out.m_31.w = _478;
        return out;
    }
    discard_fragment();
    return out;
}

