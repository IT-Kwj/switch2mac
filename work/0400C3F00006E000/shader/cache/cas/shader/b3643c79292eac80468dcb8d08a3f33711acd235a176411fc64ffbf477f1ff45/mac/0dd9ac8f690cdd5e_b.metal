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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    constant _16* fp_c8 [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_1ESmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_44 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = gl_FragCoord.w;
    float _68 = in.m_40.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_40.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _66;
    float _82 = _80 * _72;
    float _84 = _80 * _78;
    float2 _494 = float2(_82, _84);
    float _86 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_494, float2(0.0), isnan(_494))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_494, float2(0.0), isnan(_494))).x;
    float _88 = in.m_42.w;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_44.w;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_42.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_42.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_42.z;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_46.x;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = _80 * _92;
    float _126 = _80 * _98;
    float _128 = _124 * (*spvDescriptorSet0.fp_c10)._m0[3].x;
    float _130 = _128 * _126;
    float _132 = _80 * _104;
    float _134 = _80 * _110;
    float _136 = _80 * _116;
    float _138 = _80 * _122;
    bool _142 = _130 != 1.0;
    bool _144 = isnan(_130);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    bool _152 = !_150;
    if (!_152)
    {
        float _154 = gl_FragCoord.x;
        float _156 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _158 = _154 / _156;
        float _160 = gl_FragCoord.y;
        float _162 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _164 = _160 / _162;
        float _166 = _130 * 256.0;
        float _168 = trunc(_166);
        int _171 = int(_168);
        float _173 = trunc(_158);
        int _175 = int(_173);
        float _177 = trunc(_164);
        int _179 = int(_177);
        int _181 = _175 + 2;
        int _183 = _181 >> 1;
        uint _186 = uint(int(uint(_179) >> uint(1)));
        int _188 = _183 ^ int(_186);
        int _190 = _188 << 16;
        int _192 = _190 ^ _183;
        int _194 = 983055 & _192;
        int _196 = _194 << 6;
        int _198 = _196 + _194;
        int _200 = _198 & 13369548;
        uint _202 = uint(int(uint(_200) >> uint(3)));
        int _204 = _200 | int(_202);
        uint _206 = uint(int(uint(_171) >> uint(7)));
        int _208 = int(_206) + _171;
        int _210 = _204 & 5570560;
        int _212 = _204 & 85;
        uint _214 = uint(int(uint(_210) >> uint(15)));
        int _216 = int(_214) + _212;
        bool _218 = uint(_208) > uint(_216);
        if (!_218)
        {
            discard_fragment();
        }
        if (!_218)
        {
            out.m_49.x = _132;
            out.m_49.y = _134;
            out.m_49.z = _136;
            out.m_49.w = _138;
            return out;
        }
    }
    float _220 = in.m_51.y;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_51.x;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_51.z;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = _80 * _224;
    float _240 = _80 * _230;
    float _242 = _80 * _236;
    float _244 = _238 * _238;
    float _246 = fma(_240, _240, _244);
    float _248 = fma(_242, _242, _246);
    float _250 = rsqrt(_248);
    float _252 = _240 * _250;
    float _254 = _238 * _250;
    float _256 = _242 * _250;
    float _258 = abs(_252);
    float _260 = abs(_254);
    float _262 = precise::max(_258, _260);
    float _264 = abs(_256);
    float _266 = precise::max(_264, _262);
    float _268 = 1.0 / _266;
    float _270 = -_268;
    float _272 = _256 * _270;
    float _274 = _252 * _268;
    float _276 = _254 * _268;
    float3 _780 = float3(_274, _276, _272);
    float3 _280 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_780, float3(0.0), isnan(_780)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_780, float3(0.0), isnan(_780)), level(0.0)).xyz;
    float _282 = _280.x;
    float _284 = _280.y;
    float _286 = _280.z;
    float _288 = in.m_53.x;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_53.y;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_53.z;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = in.m_55.y;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_55.x;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_55.z;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = in.m_57.x;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = in.m_57.w;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = in.m_57.y;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_57.z;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = _86 * _86;
    float _350 = _348 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    bool _352 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _354 = _80 * _292;
    float _356 = _80 * _298;
    float _358 = _80 * _304;
    float _360 = _80 * _334;
    float _362 = _80 * _340;
    float _364 = fma(_282, 0.20999999344348907470703125, _354);
    float _366 = _350 * 0.02624999918043613433837890625;
    float _368 = fma(_284, 0.20999999344348907470703125, _356);
    float _370 = fma(_286, 0.20999999344348907470703125, _358);
    float _372 = _80 * _310;
    float _374 = fma(_366, (*spvDescriptorSet0.fp_c15)._m0[17].x, _364);
    float _376 = fma(_366, (*spvDescriptorSet0.fp_c15)._m0[17].y, _368);
    float _378 = fma(_366, (*spvDescriptorSet0.fp_c15)._m0[17].z, _370);
    float _380 = _80 * _316;
    float _382 = _80 * _322;
    float _384 = _376 + _372;
    float _386 = _374 + _380;
    float _388 = _378 + _382;
    float _390 = _134 * _384;
    float _392 = 0.0 + _138;
    float _394 = precise::clamp(_392, 0.0, 1.0);
    float _396 = _132 * _386;
    float _398 = _136 * _388;
    float _400 = _80 * _328;
    float _402 = _80 * _346;
    float _404 = fma(_390, _360, _362);
    float _406 = fma(_396, _360, _400);
    float _408 = fma(_398, _360, _402);
    float _410 = _400;
    if (!_352)
    {
        _410 = _394;
    }
    float _412 = _410;
    bool _414 = !_352;
    float _416 = _412;
    if (!_414)
    {
        float _418 = in.m_59.w;
        float _420 = gl_FragCoord.w;
        float _422 = _418 * _420;
        float _424 = in.m_59.z;
        float _426 = gl_FragCoord.w;
        float _428 = _424 * _426;
        float _430 = _80 * _422;
        float _432 = _80 * _428;
        float _434 = 1.0 / _430;
        float _436 = _432 * _434;
        float _438 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _440 = fma(_436, (*spvDescriptorSet0.fp_c8)._m0[30].w, _438);
        float _442 = 1.0 / _440;
        float _444 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _446 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _448 = fma(_442, _444, _446);
        float _450 = _448 * 8.0;
        float _452 = precise::clamp(_450, 0.0, 1.0);
        float _454 = _394 * _452;
        _416 = _454;
    }
    float _456 = _416;
    float _458 = 0.0 + _456;
    float _460 = precise::clamp(_458, 0.0, 1.0);
    out.m_49.x = _406;
    out.m_49.y = _404;
    out.m_49.z = _408;
    out.m_49.w = _460;
    return out;
}

