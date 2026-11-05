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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_35.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_35.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _540 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_540, float2(0.0), isnan(_540))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_540, float2(0.0), isnan(_540))).x;
    float2 _551 = float2(_65, _67);
    float4 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_551, float2(0.0), isnan(_551))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_551, float2(0.0), isnan(_551))).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    float2 _567 = float2(_65, _67);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_567, float2(0.0), isnan(_567)), int2(0), component::x).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = in.m_37.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_37.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_37.y;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_39.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_39.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_39.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = _63 * _96;
    float _130 = _63 * _102;
    float _132 = _63 * _108;
    float _134 = _63 * _114;
    float _136 = _63 * _120;
    float _138 = _63 * _126;
    float _140 = -_69;
    float _142 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _144 = _140 + _142;
    float _146 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[12].y, (*spvDescriptorSet0.fp_c3)._m0[12].w);
    float _148 = _138 * _146;
    float _150 = _134 * _146;
    float _152 = _136 * _146;
    float _154 = fma(_130, _144, _148);
    float _156 = fma(_128, _144, _150);
    float _158 = fma(_132, _144, _152);
    float _160 = 1.0 / _154;
    float _162 = _156 * _160;
    float _164 = _158 * _160;
    float2 _690 = float2(_162, _164);
    float4 _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_690, float2(0.0), isnan(_690))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_690, float2(0.0), isnan(_690))).xyzw;
    float _168 = _166.x;
    float _170 = _166.y;
    float _172 = _166.z;
    float _174 = _166.w;
    float _176 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _178 = precise::min(_84, _90);
    float _180 = precise::min(_86, _88);
    float _182 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].x, _176);
    float _184 = precise::max(_84, _90);
    float _186 = precise::max(_86, _88);
    float _188 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].z, _182);
    float _190 = precise::min(_178, _180);
    float _192 = precise::max(_184, _186);
    float _194 = precise::min(_188, _190);
    float _196 = precise::max(_188, _192);
    float _198 = _192 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _200 = -_194;
    float _202 = _200 + _196;
    float _204 = precise::max(_198, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _206 = -_67;
    float _208 = _206 + _164;
    float _210 = -_65;
    float _212 = _210 + _162;
    bool _216 = _202 > _204;
    float _218 = _208 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _220 = _212 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _222 = _218 * _218;
    float _224 = fma(_220, _220, _222);
    float _226 = _218;
    float _228 = _202;
    float _230 = _204;
    float _232 = _220;
    if (!_216)
    {
        _226 = _74;
    }
    float _234 = _226;
    float _236 = _234;
    if (!_216)
    {
        _228 = _76;
    }
    float _238 = _228;
    float _240 = _238;
    if (!_216)
    {
        _230 = _78;
    }
    float _242 = _230;
    float _244 = _242;
    if (!_216)
    {
        _232 = _80;
    }
    float _246 = _232;
    bool _248 = !_216;
    float _250 = _246;
    if (!_248)
    {
        float _252 = _88 + _90;
        float _254 = -_88;
        float _256 = _84 + _254;
        float _258 = -_90;
        float _260 = _86 + _258;
        float _262 = _84 + _252;
        float _264 = _256 + _260;
        float _266 = -_260;
        float _268 = _256 + _266;
        float _270 = _86 + _262;
        float _272 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
        float _274 = abs(_264);
        float _276 = abs(_268);
        float _278 = precise::min(_274, _276);
        float _280 = fma(_270, _272, (*spvDescriptorSet0.fp_c3)._m0[4].w);
        float _282 = precise::max(_280, _278);
        float _284 = 1.0 / _282;
        float _286 = _264 * _284;
        float _288 = _268 * _284;
        float _290 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _292 = precise::max(_286, _290);
        float _294 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _296 = precise::max(_288, _294);
        float _298 = precise::min(_292, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _300 = precise::min(_296, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _302 = -_298;
        float _304 = fma(_302, (*spvDescriptorSet0.fp_c3)._m0[1].x, _65);
        float _306 = -_298;
        float _308 = fma(_306, (*spvDescriptorSet0.fp_c3)._m0[1].z, _65);
        float _310 = fma(_298, (*spvDescriptorSet0.fp_c3)._m0[1].z, _65);
        float _312 = fma(_298, (*spvDescriptorSet0.fp_c3)._m0[1].x, _65);
        float _314 = -_300;
        float _316 = fma(_314, (*spvDescriptorSet0.fp_c3)._m0[1].w, _67);
        float _318 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[1].w, _67);
        float _320 = -_300;
        float _322 = fma(_320, (*spvDescriptorSet0.fp_c3)._m0[1].y, _67);
        float _324 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[1].y, _67);
        float2 _946 = float2(_308, _316);
        float4 _326 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_946, float2(0.0), isnan(_946))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_946, float2(0.0), isnan(_946))).xyzw;
        float _328 = _326.x;
        float _330 = _326.y;
        float _332 = _326.z;
        float _334 = _326.w;
        float2 _962 = float2(_310, _318);
        float4 _336 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_962, float2(0.0), isnan(_962))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_962, float2(0.0), isnan(_962))).xyzw;
        float _338 = _336.x;
        float _340 = _336.y;
        float _342 = _336.z;
        float _344 = _336.w;
        float2 _978 = float2(_304, _322);
        float4 _346 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_978, float2(0.0), isnan(_978))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_978, float2(0.0), isnan(_978))).xyzw;
        float _348 = _346.x;
        float _350 = _346.y;
        float _352 = _346.z;
        float _354 = _346.w;
        float2 _994 = float2(_312, _324);
        float4 _356 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_994, float2(0.0), isnan(_994))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_994, float2(0.0), isnan(_994))).xyzw;
        float _358 = _356.x;
        float _360 = _356.y;
        float _362 = _356.z;
        float _364 = _356.w;
        float _366 = _330 + _340;
        float _368 = _328 + _338;
        float _370 = _350 + _360;
        float _372 = _348 + _358;
        float _374 = _332 + _342;
        float _376 = _334 + _344;
        float _378 = _366 + _370;
        float _380 = _352 + _362;
        float _382 = _368 + _372;
        float _384 = _378 * 0.25;
        float _386 = _374 + _380;
        float _388 = _382 * 0.25;
        float _390 = _384 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _392 = _386 * 0.25;
        float _394 = fma(_388, (*spvDescriptorSet0.fp_c3)._m0[2].x, _390);
        float _396 = fma(_392, (*spvDescriptorSet0.fp_c3)._m0[2].z, _394);
        float _398 = _376 * 0.5;
        bool _400 = _396 > _192;
        bool _402 = isnan(_396);
        bool _404 = _400 || _402;
        bool _406 = isnan(_192);
        bool _408 = _404 || _406;
        float _410 = _354 + _364;
        bool _412 = _190 <= _396;
        bool _414 = !_408;
        bool _416 = _412 && _414;
        float _418 = _376 + _410;
        float _420 = _388;
        float _422 = _384;
        float _424 = _392;
        float _426 = _398;
        if (!_416)
        {
            float _428 = _368 * 0.5;
            _420 = _428;
        }
        float _430 = _420;
        if (!_416)
        {
            float _432 = _366 * 0.5;
            _422 = _432;
        }
        float _434 = _422;
        if (!_416)
        {
            float _436 = _374 * 0.5;
            _424 = _436;
        }
        float _438 = _424;
        if (_416)
        {
            float _440 = _418 * 0.25;
            _426 = _440;
        }
        float _442 = _426;
        float _444 = -_430;
        float _446 = _74 + _444;
        float _448 = -_434;
        float _450 = _76 + _448;
        float _452 = -_438;
        float _454 = _78 + _452;
        float _456 = -_442;
        float _458 = _80 + _456;
        float _460 = fma(_446, (*spvDescriptorSet0.fp_c3)._m0[5].x, _430);
        float _462 = fma(_450, (*spvDescriptorSet0.fp_c3)._m0[5].x, _434);
        float _464 = fma(_454, (*spvDescriptorSet0.fp_c3)._m0[5].x, _438);
        float _466 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[5].x, _442);
        _236 = _460;
        _244 = _464;
        _250 = _466;
        _240 = _462;
    }
    float _468 = _236;
    float _470 = _244;
    float _472 = _250;
    float _474 = _240;
    float _476 = sqrt(_224);
    float _478 = -_468;
    float _480 = _168 + _478;
    float _482 = -_470;
    float _484 = _172 + _482;
    float _486 = -_472;
    float _488 = _174 + _486;
    float _490 = 0.0 + _476;
    float _492 = precise::clamp(_490, 0.0, 1.0);
    float _494 = fma(_492, -0.5, 0.5);
    float _496 = -_474;
    float _498 = _170 + _496;
    float _500 = fma(_494, _480, _468);
    float _502 = fma(_494, _498, _474);
    float _504 = fma(_494, _484, _470);
    float _506 = fma(_494, _488, _472);
    out.m_42.x = _500;
    out.m_42.y = _502;
    out.m_42.z = _504;
    out.m_42.w = _506;
    return out;
}

