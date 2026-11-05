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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_59 [[user(locn2)]];
    float4 m_46 [[user(locn3), flat]];
    float4 m_42 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_52 [[user(locn6)]];
    float4 m_48 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_42.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_42.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = 1.0 / _70;
    float _86 = _84 * _76;
    float _88 = _84 * _82;
    float2 _537 = float2(_88, _86);
    float2 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_537, float2(0.0), isnan(_537))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_537, float2(0.0), isnan(_537))).xy;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = in.m_44.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_44.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_44.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_42.z;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_46.x;
    float _124 = in.m_42.w;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = _84 * _102;
    float _132 = _84 * _108;
    float _134 = _84 * _114;
    float _136 = 1.0 / _130;
    float _138 = _122 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _140 = _122 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _142 = _132 * _136;
    float _144 = _134 * _136;
    float _146 = fma(_94, -2.0, 1.0);
    float _148 = _84 * _120;
    float _150 = fma(_96, -2.0, 1.0);
    float _152 = _84 * _128;
    float _154 = fma(_138, _146, _148);
    float2 _633 = float2(_142, _144);
    float _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_633, float2(0.0), isnan(_633))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_633, float2(0.0), isnan(_633))).x;
    float _158 = fma(_140, _150, _152);
    float2 _645 = float2(_154, _158);
    float _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_645, float2(0.0), isnan(_645))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_645, float2(0.0), isnan(_645))).w;
    float _162 = in.m_44.z;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_48.w;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_50.w;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_52.x;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _188 = _84 * _166;
    float _190 = _188 * _136;
    float _192 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _194 = fma(_190, (*spvDescriptorSet0.fp_c8)._m0[30].w, _192);
    float _196 = 1.0 / _194;
    float _198 = _84 * _172;
    float _200 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _202 = _196 * _200;
    float _204 = in.m_50.x;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _212 = fma(_156, (*spvDescriptorSet0.fp_c8)._m0[30].w, _210);
    float _214 = 1.0 / _212;
    float _216 = _160 * _198;
    float _218 = _84 * _178;
    float _220 = _84 * _184;
    float _222 = _218 * _216;
    float _224 = 0.0 + _222;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _230 = -_202;
    float _232 = fma(_214, _228, _230);
    float _234 = _232 * _186;
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = _226 * _236;
    float _240 = _238 * _220;
    bool _244 = _240 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _246 = isnan(_240);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _252 = _248 || _250;
    float _254 = in.m_48.x;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = _202;
    if (!_252)
    {
        discard_fragment();
    }
    float _262 = _84 * _208;
    float _264 = in.m_48.z;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = _84 * _258;
    float _272 = in.m_48.y;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = _262 * _270;
    float _280 = in.m_50.y;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = _84 * _276;
    float _288 = in.m_50.z;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = _84 * _284;
    float _296 = _294 * _286;
    float _298 = _84 * _292;
    float _300 = _84 * _268;
    float _302 = _298 * _300;
    if (!_252)
    {
        out.m_55.x = _278;
        out.m_55.y = _296;
        out.m_55.z = _302;
        out.m_55.w = _222;
        return out;
    }
    float _304 = in.m_57.y;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = in.m_57.x;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = in.m_57.z;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = _84 * _308;
    float _324 = _84 * _314;
    float _326 = _84 * _320;
    float _328 = _322 * _322;
    float _330 = fma(_324, _324, _328);
    float _332 = fma(_326, _326, _330);
    float _334 = rsqrt(_332);
    float _336 = _324 * _334;
    float _338 = _322 * _334;
    float _340 = _326 * _334;
    float _342 = abs(_336);
    float _344 = abs(_338);
    float _346 = precise::max(_342, _344);
    float _348 = abs(_340);
    float _350 = precise::max(_348, _346);
    float _352 = 1.0 / _350;
    float _354 = _336 * _352;
    float _356 = _338 * _352;
    float _358 = -_352;
    float _360 = _340 * _358;
    float3 _938 = float3(_354, _356, _360);
    float3 _364 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_938, float3(0.0), isnan(_938)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_938, float3(0.0), isnan(_938)), level(0.0)).xyz;
    float _366 = _364.x;
    float _368 = _364.y;
    float _370 = _364.z;
    float _372 = in.m_59.x;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_59.z;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_59.y;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = in.m_61.z;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = in.m_61.x;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = in.m_61.y;
    float _404 = gl_FragCoord.w;
    float _406 = _402 * _404;
    float _408 = in.m_63.x;
    float _410 = gl_FragCoord.w;
    float _412 = _408 * _410;
    float _414 = in.m_63.y;
    float _416 = gl_FragCoord.w;
    float _418 = _414 * _416;
    float _420 = in.m_63.z;
    float _422 = gl_FragCoord.w;
    float _424 = _420 * _422;
    float _426 = in.m_63.w;
    float _428 = gl_FragCoord.w;
    float _430 = _426 * _428;
    bool _432 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_432)
    {
        float _434 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _436 = _202 + _434;
        _260 = _436;
    }
    float _438 = _260;
    float _440 = _438;
    if (_432)
    {
        float _442 = _438 * 8.0;
        float _444 = precise::clamp(_442, 0.0, 1.0);
        _440 = _444;
    }
    float _446 = _440;
    float _448 = _84 * _376;
    float _450 = _84 * _382;
    float _452 = _84 * _394;
    float _454 = _84 * _400;
    float _456 = _84 * _418;
    float _458 = _84 * _424;
    float _460 = fma(_366, 0.20999999344348907470703125, _448);
    float _462 = _84 * _388;
    float _464 = fma(_370, 0.20999999344348907470703125, _450);
    float _466 = _84 * _406;
    float _468 = _460 + _454;
    float _470 = fma(_368, 0.20999999344348907470703125, _462);
    float _472 = _464 + _452;
    float _474 = 0.0 + _240;
    float _476 = precise::clamp(_474, 0.0, 1.0);
    float _478 = _84 * _412;
    float _480 = _470 + _466;
    float _482 = _84 * _430;
    float _484 = _278 * _468;
    float _486 = _302 * _472;
    float _488 = _296 * _480;
    float _490 = _476;
    if (_432)
    {
        float _492 = _476 * _446;
        _490 = _492;
    }
    float _494 = _490;
    float _496 = fma(_484, _482, _478);
    float _498 = fma(_486, _482, _458);
    float _500 = fma(_488, _482, _456);
    float _502 = 0.0 + _494;
    float _504 = precise::clamp(_502, 0.0, 1.0);
    out.m_55.x = _496;
    out.m_55.y = _500;
    out.m_55.z = _498;
    out.m_55.w = _504;
    return out;
}

