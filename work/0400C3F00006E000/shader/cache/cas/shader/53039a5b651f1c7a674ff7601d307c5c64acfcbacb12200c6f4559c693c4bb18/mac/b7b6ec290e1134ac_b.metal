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
    float4 m_29 [[color(0)]];
};

struct main0_in
{
    float4 m_26 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _36 = gl_FragCoord.w;
    float _38 = in.m_26.y;
    float _40 = gl_FragCoord.w;
    float _42 = _38 * _40;
    float _44 = in.m_26.x;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _52 = 1.0 / _36;
    float _54 = _52 * _42;
    float _56 = _52 * _48;
    float _58 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].y;
    bool _62 = _54 >= 0.5;
    bool _64 = isnan(_54);
    bool _66 = _62 || _64;
    bool _68 = isnan(0.5);
    bool _70 = _66 || _68;
    bool _72 = _56 >= 0.5;
    bool _74 = isnan(_56);
    bool _76 = _72 || _74;
    bool _78 = isnan(0.5);
    bool _80 = _76 || _78;
    float _82 = float(_80);
    bool _84 = !_70;
    float _86 = _84 ? 0.0 : 2.0;
    float _88 = _82 + _86;
    float _90 = fma(_56, 2.0, -1.0);
    float _92 = fma(_54, 2.0, -1.0);
    float _94 = trunc(_88);
    int _97 = int(_94);
    int _99 = _97 << 4;
    int _101 = _99 + 16;
    int _103 = _101 + 4;
    uint _106 = uint(int(uint(_103) >> uint(2)));
    uint _108 = uint(int(uint(int(_106)) >> uint(2)));
    int _110 = int(_106) & 3;
    float _112 = (*spvDescriptorSet0.fp_c4)._m0[int(_108)][_110];
    int _114 = _101 + 8;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    uint _118 = uint(int(uint(int(_116)) >> uint(2)));
    int _120 = int(_116) & 3;
    float _122 = (*spvDescriptorSet0.fp_c4)._m0[int(_118)][_120];
    int _124 = int(_116) + 1;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    int _128 = _124 & 3;
    float _130 = (*spvDescriptorSet0.fp_c4)._m0[int(_126)][_128];
    float _132 = precise::max(0.0, _112);
    bool _134 = _132 >= 0.00999999977648258209228515625;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan(0.00999999977648258209228515625);
    bool _142 = _138 || _140;
    float _144 = abs(_90);
    float _146 = -_122;
    float _148 = _144 + _146;
    float _150 = abs(_92);
    float _152 = -_130;
    float _154 = _150 + _152;
    float _156 = _148 * _50;
    float _158 = _154 * _58;
    float _160 = precise::max(_156, _158);
    float _162 = _148;
    float _164 = _160;
    if (!_142)
    {
        bool _166 = _160 <= 0.0;
        float _168 = float(_166);
        _162 = _168;
    }
    float _170 = _162;
    bool _172 = !_142;
    float _174 = _170;
    if (!_172)
    {
        bool _176 = _156 > 0.001000000047497451305389404296875;
        bool _178 = isnan(_156);
        bool _180 = _176 || _178;
        bool _182 = isnan(0.001000000047497451305389404296875);
        bool _184 = _180 || _182;
        bool _186 = _158 <= 0.001000000047497451305389404296875;
        bool _188 = !_184;
        bool _190 = _186 || _188;
        float _192 = _170;
        if (_190)
        {
            float _194 = 1.0 / _132;
            _192 = _194;
        }
        float _196 = _192;
        if (_190)
        {
            float _198 = abs(_160);
            float _200 = _160 * _198;
            _164 = _200;
        }
        float _202 = _164;
        float _204 = _196;
        if (_190)
        {
            float _206 = -_202;
            float _208 = fma(_206, _196, _132);
            float _210 = precise::clamp(_208, 0.0, 1.0);
            _204 = _210;
        }
        float _212 = _204;
        _174 = _212;
        if (!_190)
        {
            uint _214 = uint(int(uint(_101) >> uint(2)));
            uint _216 = uint(int(uint(int(_214)) >> uint(2)));
            int _218 = int(_214) & 3;
            float _220 = (*spvDescriptorSet0.fp_c4)._m0[int(_216)][_218];
            bool _222 = _156 > _158;
            bool _224 = isnan(_156);
            bool _226 = _222 || _224;
            bool _228 = isnan(_158);
            bool _230 = _226 || _228;
            bool _232 = _220 < 1.0;
            bool _234 = !_230;
            bool _236 = _232 != _234;
            float _238 = _220 + (-1.0);
            float _240 = 1.0 / _220;
            float _242 = _236 ? _158 : _156;
            float _244 = _236 ? _156 : _158;
            float _246 = abs(_242);
            float _248 = log2(_246);
            float _250 = abs(_244);
            float _252 = log2(_250);
            float _254 = _238 * _248;
            float _256 = exp2(_254);
            float _258 = _238 * _252;
            float _260 = exp2(_258);
            float _262 = _242 * _256;
            float _264 = 1.0 / _256;
            float _266 = _256 * 0.5;
            float _268 = fma(_244, _260, _262);
            float _270 = fma(_260, -0.5, _266);
            float _272 = abs(_268);
            float _274 = log2(_272);
            float _276 = _274 * _240;
            float _278 = -_276;
            float _280 = exp2(_278);
            float _282 = _132 * _280;
            float _284 = _260 + _256;
            float _286 = -_242;
            float _288 = fma(_242, _282, _286);
            float _290 = -_244;
            float _292 = fma(_244, _282, _290);
            float _294 = _284 * 0.5;
            float _296 = _256 * _288;
            float _298 = fma(_260, _292, _296);
            float _300 = _260 * _264;
            float _302 = abs(_298);
            bool _304 = _294 > _302;
            bool _306 = isnan(_294);
            bool _308 = _304 || _306;
            bool _310 = isnan(_302);
            bool _312 = _308 || _310;
            bool _314 = _298 >= 0.0;
            float _316 = _260;
            float _318 = _274;
            float _320 = _294;
            float _322 = _300;
            float _324 = _298;
            if (!_312)
            {
                _316 = 1.0;
            }
            float _326 = _316;
            bool _328 = !_312;
            float _330 = _326;
            float _332 = _326;
            if (!_328)
            {
                float _334 = abs(_298);
                bool _336 = _334 >= _270;
                bool _338 = isnan(_334);
                bool _340 = _336 || _338;
                bool _342 = isnan(_270);
                bool _344 = _340 || _342;
                if (_344)
                {
                    float _346 = -_294;
                    float _348 = _346 + _270;
                    _318 = _348;
                }
                float _350 = _318;
                float _352 = _264;
                if (!_344)
                {
                    float _354 = 1.0 / _270;
                    _352 = _354;
                }
                float _356 = _352;
                if (!_344)
                {
                    float _358 = -_300;
                    float _360 = _358 + 1.0;
                    _330 = _360;
                }
                float _362 = _330;
                float _364 = _362;
                if (_344)
                {
                    float _366 = abs(_298);
                    float _368 = -_294;
                    float _370 = _366 + _368;
                    _320 = _370;
                }
                float _372 = _320;
                float _374 = _372;
                if (_344)
                {
                    float _376 = _300 * 0.5;
                    _322 = _376;
                }
                float _378 = _322;
                if (!_344)
                {
                    float _380 = abs(_298);
                    float _382 = _380 * _362;
                    _364 = _382;
                }
                float _384 = _364;
                float _386 = _384;
                if (!_344)
                {
                    _324 = 0.5;
                }
                float _388 = _324;
                float _390 = _256;
                if (_344)
                {
                    float _392 = 1.0 / _350;
                    _390 = _392;
                }
                float _394 = _390;
                if (!_344)
                {
                    float _396 = _384 * _356;
                    _386 = _396;
                }
                float _398 = _386;
                float _400 = _398;
                if (!_344)
                {
                    float _402 = fma(_398, _388, 0.5);
                    _400 = _402;
                }
                float _404 = _400;
                _332 = _404;
                if (_344)
                {
                    float _406 = _372 * _394;
                    _374 = _406;
                }
                float _408 = _374;
                float _410 = _408;
                if (_344)
                {
                    float _412 = _408 * _408;
                    _410 = _412;
                }
                float _414 = _410;
                if (_344)
                {
                    float _416 = -_378;
                    float _418 = fma(_416, _414, 1.0);
                    _332 = _418;
                }
            }
            float _420 = _332;
            _174 = _420;
            if (!_314)
            {
                float _422 = -_420;
                float _424 = _422 + 1.0;
                _174 = _424;
            }
        }
    }
    float _426 = _174;
    float _428 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _430 = 1.0 + _428;
    float _432 = _430 * _426;
    float _434 = _432 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _436 = precise::clamp(_434, 0.0, 1.0);
    bool _438 = _436 != 0.0;
    bool _440 = isnan(_436);
    bool _442 = _438 || _440;
    bool _444 = isnan(0.0);
    bool _446 = _442 || _444;
    if (_446)
    {
        out.m_29.x = (*spvDescriptorSet0.fp_c3)._m0[0].x;
        out.m_29.y = (*spvDescriptorSet0.fp_c3)._m0[0].y;
        out.m_29.z = (*spvDescriptorSet0.fp_c3)._m0[0].z;
        out.m_29.w = _436;
        return out;
    }
    discard_fragment();
    return out;
}

