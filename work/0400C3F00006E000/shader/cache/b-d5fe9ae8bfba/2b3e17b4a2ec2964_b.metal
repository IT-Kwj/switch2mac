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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_46 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_53 [[user(locn9)]];
    float4 m_59 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_40.z;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_40.w;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_40.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = 1.0 / _68;
    float _96 = _94 * _74;
    float _98 = _94 * _80;
    float _100 = _94 * _86;
    float _102 = _94 * _92;
    float2 _507 = float2(_96, _98);
    float _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_507, float2(0.0), isnan(_507))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_507, float2(0.0), isnan(_507))).w;
    float2 _518 = float2(_100, _102);
    float _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_518, float2(0.0), isnan(_518))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_518, float2(0.0), isnan(_518))).w;
    float _108 = in.m_42.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_44.w;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_46.x;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = _94 * _112;
    float _128 = _94 * _124;
    float _130 = in.m_44.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = -_104;
    float _138 = _136 + 1.0;
    float _140 = _106 * _138;
    float _142 = _94 * _118;
    float _144 = _140 * _126;
    float _146 = _142 * _144;
    float _148 = 0.0 + _146;
    float _150 = precise::clamp(_148, 0.0, 1.0);
    float _152 = _150 * _128;
    bool _156 = _152 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _158 = isnan(_152);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _164 = _160 || _162;
    float _166 = in.m_42.x;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    if (!_164)
    {
        discard_fragment();
    }
    float _172 = _94 * _134;
    float _174 = in.m_42.z;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = _94 * _170;
    float _182 = in.m_42.y;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = _172 * _180;
    float _190 = in.m_44.y;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = _94 * _186;
    float _198 = in.m_44.z;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = _94 * _194;
    float _206 = _204 * _196;
    float _208 = _94 * _202;
    float _210 = _94 * _178;
    float _212 = _208 * _210;
    if (!_164)
    {
        out.m_49.x = _188;
        out.m_49.y = _206;
        out.m_49.z = _212;
        out.m_49.w = _146;
        return out;
    }
    float _214 = in.m_51.y;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_51.x;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_51.z;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_53.x;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = _94 * _218;
    float _240 = _94 * _224;
    float _242 = _94 * _230;
    float _244 = _238 * _238;
    float _246 = fma(_240, _240, _244);
    float _248 = fma(_242, _242, _246);
    float _250 = rsqrt(_248);
    float _252 = _240 * _250;
    float _254 = _238 * _250;
    float _256 = _242 * _250;
    float _258 = _94 * _236;
    float _260 = abs(_252);
    float _262 = abs(_254);
    float _264 = precise::max(_260, _262);
    float _266 = precise::min(_258, 1.0);
    float _268 = abs(_256);
    float _270 = precise::max(_268, _264);
    float _272 = 1.0 / _270;
    float _274 = -_272;
    float _276 = _256 * _274;
    float _278 = _252 * _272;
    float _280 = _254 * _272;
    float3 _770 = float3(_278, _280, _276);
    float3 _284 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_770, float3(0.0), isnan(_770)), level(_266)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_770, float3(0.0), isnan(_770)), level(_266)).xyz;
    float _286 = _284.x;
    float _288 = _284.y;
    float _290 = _284.z;
    float _292 = in.m_55.y;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = in.m_55.z;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = in.m_55.x;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = in.m_57.z;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = in.m_57.x;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = in.m_57.y;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = in.m_59.x;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = in.m_59.w;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_59.y;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = in.m_59.z;
    float _348 = gl_FragCoord.w;
    float _350 = _346 * _348;
    float _352 = _94 * _296;
    float _354 = _94 * _302;
    float _356 = _94 * _308;
    bool _358 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _360 = _94 * _338;
    float _362 = fma(_290, 0.20999999344348907470703125, _354);
    float _364 = fma(_286, 0.20999999344348907470703125, _356);
    float _366 = _94 * _314;
    float _368 = fma(_288, 0.20999999344348907470703125, _352);
    float _370 = _94 * _320;
    float _372 = _94 * _326;
    float _374 = _362 + _366;
    float _376 = _364 + _370;
    float _378 = _368 + _372;
    float _380 = _212 * _374;
    float _382 = 0.0 + _152;
    float _384 = precise::clamp(_382, 0.0, 1.0);
    float _386 = _188 * _376;
    float _388 = _94 * _332;
    float _390 = _206 * _378;
    float _392 = _94 * _344;
    float _394 = _94 * _350;
    float _396 = fma(_386, _360, _388);
    float _398 = _388;
    if (!_358)
    {
        _398 = _384;
    }
    float _400 = _398;
    float _402 = fma(_390, _360, _392);
    float _404 = fma(_380, _360, _394);
    bool _406 = !_358;
    float _408 = _400;
    if (!_406)
    {
        float _410 = in.m_61.w;
        float _412 = gl_FragCoord.w;
        float _414 = _410 * _412;
        float _416 = in.m_61.z;
        float _418 = gl_FragCoord.w;
        float _420 = _416 * _418;
        float _422 = _94 * _414;
        float _424 = _94 * _420;
        float _426 = 1.0 / _422;
        float _428 = _424 * _426;
        float _430 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _432 = fma(_428, (*spvDescriptorSet0.fp_c8)._m0[30].w, _430);
        float _434 = 1.0 / _432;
        float _436 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _438 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _440 = fma(_434, _436, _438);
        float _442 = _440 * 8.0;
        float _444 = precise::clamp(_442, 0.0, 1.0);
        float _446 = _384 * _444;
        _408 = _446;
    }
    float _448 = _408;
    float _450 = 0.0 + _448;
    float _452 = precise::clamp(_450, 0.0, 1.0);
    out.m_49.x = _396;
    out.m_49.y = _402;
    out.m_49.z = _404;
    out.m_49.w = _452;
    return out;
}

