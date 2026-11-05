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
    texture2d_array<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texturecube<float> fp_t_tcb_1E [[id(5)]];
    sampler fp_t_tcb_1ESmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_1ESmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_38 [[user(locn6), flat]];
    float4 m_49 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = gl_FragCoord.w;
    float _68 = in.m_38.x;
    float _70 = in.m_40.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_40.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = 1.0 / _66;
    float _84 = rint(_68);
    float _86 = precise::max(_84, 0.0);
    uint _89 = uint(_86);
    uint _91 = clamp(_89, 0u, 65535u);
    float _93 = _82 * _74;
    float _95 = _82 * _80;
    float3 _514 = float3(_93, _95, float(int(_91)));
    float3 _518 = select(_514, float3(0.0), isnan(_514));
    float4 _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _518.xy, uint(rint(_518.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _518.xy, uint(rint(_518.z))).xyzw;
    float _100 = _98.x;
    float _102 = _98.y;
    float _104 = _98.z;
    float _106 = _98.w;
    float _108 = in.m_42.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_44.x;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = _82 * _112;
    float _122 = _106 * _120;
    float _124 = _82 * _118;
    float _126 = 0.0 + _122;
    float _128 = precise::clamp(_126, 0.0, 1.0);
    float _130 = _128 * _124;
    bool _134 = _130 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _136 = isnan(_130);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _142 = _138 || _140;
    if (!_142)
    {
        discard_fragment();
    }
    if (!_142)
    {
        out.m_47.x = 0.006000000052154064178466796875;
        out.m_47.y = 0.00200000009499490261077880859375;
        out.m_47.z = 0.001000000047497451305389404296875;
        out.m_47.w = _122;
        return out;
    }
    float _144 = in.m_49.y;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_49.x;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_49.z;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = _82 * _148;
    float _164 = _82 * _154;
    float _166 = _82 * _160;
    float _168 = _162 * _162;
    float _170 = fma(_164, _164, _168);
    float _172 = fma(_166, _166, _170);
    float _174 = rsqrt(_172);
    float _176 = _164 * _174;
    float _178 = _162 * _174;
    float _180 = _166 * _174;
    float _182 = abs(_176);
    float _184 = abs(_178);
    float _186 = precise::max(_182, _184);
    float _188 = abs(_180);
    float _190 = precise::max(_188, _186);
    float _192 = 1.0 / _190;
    float _194 = -_192;
    float _196 = _180 * _194;
    float _198 = _176 * _192;
    float _200 = _178 * _192;
    float3 _675 = float3(_198, _200, _196);
    float3 _204 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_675, float3(0.0), isnan(_675)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_675, float3(0.0), isnan(_675)), level(0.0)).xyz;
    float _206 = _204.x;
    float _208 = _204.y;
    float _210 = _204.z;
    float _212 = in.m_51.x;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_51.y;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_51.z;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_42.y;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_42.x;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_42.z;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = -_100;
    float _250 = _248 + 1.0;
    float _252 = -_102;
    float _254 = _252 + 1.0;
    float _256 = -_104;
    float _258 = _256 + 1.0;
    float _260 = in.m_53.z;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = in.m_55.z;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = in.m_55.x;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_55.y;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = 0.0 + _130;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = _82 * _216;
    float _290 = _82 * _222;
    float _292 = _82 * _228;
    float _294 = _288 * _250;
    float _296 = _290 * _254;
    float _298 = _82 * _234;
    float _300 = _82 * _240;
    float _302 = _292 * _258;
    float _304 = _82 * _246;
    float _306 = fma(_102, _298, _296);
    float _308 = fma(_100, _300, _294);
    float _310 = in.m_53.y;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = fma(_104, _304, _302);
    float _318 = _306 * 0.715200006961822509765625;
    float _320 = in.m_53.x;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_57.w;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = in.m_57.x;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = fma(_308, 0.2125999927520751953125, _318);
    float _340 = in.m_57.y;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = fma(_316, 0.072200000286102294921875, _338);
    float _348 = in.m_57.z;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = 1.0 / _346;
    float _356 = _354 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _358 = precise::clamp(_356, 0.0, 1.0);
    float _360 = fma(_358, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _362 = _82 * _314;
    float _364 = _82 * _264;
    float _366 = _82 * _324;
    float _368 = _308 * _360;
    float _370 = _306 * _360;
    float _372 = _316 * _360;
    float _374 = _82 * _276;
    float _376 = _82 * _330;
    float _378 = _82 * _352;
    bool _380 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _382 = _82 * _336;
    float _384 = fma(_206, 0.20999999344348907470703125, _366);
    float _386 = fma(_208, 0.20999999344348907470703125, _362);
    float _388 = fma(_210, 0.20999999344348907470703125, _364);
    float _390 = _82 * _270;
    float _392 = _82 * _282;
    float _394 = _384 + _374;
    float _396 = _388 + _390;
    float _398 = _386 + _392;
    float _400 = fma(_394, 0.006000000052154064178466796875, _368);
    float _402 = _82 * _344;
    float _404 = fma(_396, 0.001000000047497451305389404296875, _372);
    float _406 = fma(_398, 0.00200000009499490261077880859375, _370);
    float _408 = fma(_400, _376, _382);
    float _410 = fma(_404, _376, _378);
    float _412 = fma(_406, _376, _402);
    float _414 = _378;
    if (!_380)
    {
        _414 = _286;
    }
    float _416 = _414;
    bool _418 = !_380;
    float _420 = _416;
    if (!_418)
    {
        float _422 = in.m_59.w;
        float _424 = gl_FragCoord.w;
        float _426 = _422 * _424;
        float _428 = in.m_59.z;
        float _430 = gl_FragCoord.w;
        float _432 = _428 * _430;
        float _434 = _82 * _426;
        float _436 = _82 * _432;
        float _438 = 1.0 / _434;
        float _440 = _436 * _438;
        float _442 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _444 = fma(_440, (*spvDescriptorSet0.fp_c8)._m0[30].w, _442);
        float _446 = 1.0 / _444;
        float _448 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _450 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _452 = fma(_446, _448, _450);
        float _454 = _452 * 8.0;
        float _456 = precise::clamp(_454, 0.0, 1.0);
        float _458 = _286 * _456;
        _420 = _458;
    }
    float _460 = _420;
    float _462 = 0.0 + _460;
    float _464 = precise::clamp(_462, 0.0, 1.0);
    out.m_47.x = _408;
    out.m_47.y = _412;
    out.m_47.z = _410;
    out.m_47.w = _464;
    return out;
}

