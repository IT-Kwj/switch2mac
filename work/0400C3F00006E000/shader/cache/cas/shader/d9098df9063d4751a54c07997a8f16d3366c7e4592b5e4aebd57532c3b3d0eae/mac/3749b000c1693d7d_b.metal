#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn1)]];
    float4 m_33 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _522 = float2(_59, _61);
    float4 _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_522, float2(0.0), isnan(_522))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_522, float2(0.0), isnan(_522))).xyzw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float _72 = _64.w;
    float _74 = in.m_33.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _88 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _90 = _57 * _78;
    float _92 = _57 * _84;
    bool _96 = _90 >= 0.5;
    bool _98 = isnan(_90);
    bool _100 = _96 || _98;
    bool _102 = isnan(0.5);
    bool _104 = _100 || _102;
    bool _106 = _92 >= 0.5;
    bool _108 = isnan(_92);
    bool _110 = _106 || _108;
    bool _112 = isnan(0.5);
    bool _114 = _110 || _112;
    float _116 = float(_114);
    bool _118 = !_104;
    float _120 = _118 ? 0.0 : 2.0;
    float _122 = _116 + _120;
    float _124 = fma(_92, 2.0, -1.0);
    float _126 = fma(_90, 2.0, -1.0);
    float _128 = trunc(_122);
    int _131 = int(_128);
    int _133 = _131 << 4;
    int _135 = _133 + 16;
    int _137 = _135 + 4;
    uint _140 = uint(int(uint(_137) >> uint(2)));
    uint _142 = uint(int(uint(int(_140)) >> uint(2)));
    int _144 = int(_140) & 3;
    float _146 = (*spvDescriptorSet0.fp_c4)._m0[int(_142)][_144];
    int _148 = _135 + 8;
    uint _150 = uint(int(uint(_148) >> uint(2)));
    uint _152 = uint(int(uint(int(_150)) >> uint(2)));
    int _154 = int(_150) & 3;
    float _156 = (*spvDescriptorSet0.fp_c4)._m0[int(_152)][_154];
    int _158 = int(_150) + 1;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    int _162 = _158 & 3;
    float _164 = (*spvDescriptorSet0.fp_c4)._m0[int(_160)][_162];
    float _166 = precise::max(0.0, _146);
    bool _168 = _166 >= 0.00999999977648258209228515625;
    bool _170 = isnan(_166);
    bool _172 = _168 || _170;
    bool _174 = isnan(0.00999999977648258209228515625);
    bool _176 = _172 || _174;
    float _178 = abs(_124);
    float _180 = -_156;
    float _182 = _178 + _180;
    float _184 = abs(_126);
    float _186 = -_164;
    float _188 = _184 + _186;
    float _190 = _182 * _86;
    float _192 = _188 * _88;
    float _194 = precise::max(_190, _192);
    float _196 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _198 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _200 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _202 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _204 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    if (!_176)
    {
        bool _206 = _194 <= 0.0;
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
        float _234 = (*spvDescriptorSet0.fp_c3)._m0[0].y;
        if (_232)
        {
            float _236 = 1.0 / _166;
            _234 = _236;
        }
        float _238 = _234;
        if (_232)
        {
            float _240 = abs(_194);
            float _242 = _194 * _240;
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
            uint _256 = uint(int(uint(_135) >> uint(2)));
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
            float _280 = _262 + (-1.0);
            float _282 = 1.0 / _262;
            float _284 = _278 ? _192 : _190;
            float _286 = _278 ? _190 : _192;
            float _288 = abs(_284);
            float _290 = log2(_288);
            float _292 = abs(_286);
            float _294 = log2(_292);
            float _296 = _280 * _290;
            float _298 = exp2(_296);
            float _300 = _280 * _294;
            float _302 = exp2(_300);
            float _304 = _284 * _298;
            float _306 = 1.0 / _298;
            float _308 = fma(_286, _302, _304);
            float _310 = _302 + _298;
            float _312 = _310 * 0.5;
            float _314 = abs(_308);
            float _316 = log2(_314);
            float _318 = _316 * _282;
            float _320 = -_318;
            float _322 = exp2(_320);
            float _324 = _166 * _322;
            float _326 = -_284;
            float _328 = fma(_284, _324, _326);
            float _330 = -_286;
            float _332 = fma(_286, _324, _330);
            float _334 = _302 * _306;
            float _336 = _298 * _328;
            float _338 = fma(_302, _332, _336);
            float _340 = _298 * 0.5;
            float _342 = abs(_338);
            bool _344 = _312 > _342;
            bool _346 = isnan(_312);
            bool _348 = _344 || _346;
            bool _350 = isnan(_342);
            bool _352 = _348 || _350;
            float _354 = fma(_302, -0.5, _340);
            bool _356 = _338 >= 0.0;
            float _358 = _340;
            float _360 = _306;
            float _362 = _316;
            float _364 = _300;
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
                    float _388 = -_312;
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
                if (!_386)
                {
                    _364 = 0.5;
                }
                float _408 = _364;
                if (_386)
                {
                    float _410 = _334 * 0.5;
                    _366 = _410;
                }
                float _412 = _366;
                if (!_386)
                {
                    float _414 = abs(_338);
                    float _416 = _414 * _404;
                    _406 = _416;
                }
                float _418 = _406;
                float _420 = _418;
                if (_386)
                {
                    float _422 = abs(_338);
                    float _424 = -_312;
                    float _426 = _422 + _424;
                    _368 = _426;
                }
                float _428 = _368;
                float _430 = _318;
                float _432 = _428;
                if (_386)
                {
                    float _434 = 1.0 / _392;
                    _430 = _434;
                }
                float _436 = _430;
                float _438 = _398;
                if (!_386)
                {
                    float _440 = _418 * _398;
                    _420 = _440;
                }
                float _442 = _420;
                if (!_386)
                {
                    float _444 = fma(_442, _408, 0.5);
                    _438 = _444;
                }
                float _446 = _438;
                _374 = _446;
                if (_386)
                {
                    float _448 = _428 * _436;
                    _432 = _448;
                }
                float _450 = _432;
                float _452 = _450;
                if (_386)
                {
                    float _454 = _450 * _450;
                    _452 = _454;
                }
                float _456 = _452;
                if (_386)
                {
                    float _458 = -_412;
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
        out.m_36.x = _196;
        out.m_36.y = _198;
        out.m_36.z = _200;
        out.m_36.w = _478;
        return out;
    }
    discard_fragment();
    return out;
}

