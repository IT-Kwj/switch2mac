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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_42 [[user(locn5), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _60 = gl_FragCoord.w;
    float _62 = in.m_40.w;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_40.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_40.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_42.x;
    float _82 = in.m_44.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_44.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_44.z;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_44.w;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = 1.0 / _60;
    float _108 = rint(_80);
    float _110 = precise::max(_108, 0.0);
    uint _113 = uint(_110);
    uint _115 = clamp(_113, 0u, 65535u);
    float _117 = _106 * _66;
    float _119 = _106 * _72;
    float _121 = _106 * _78;
    float _123 = _106 * _86;
    float _125 = _106 * _92;
    float _127 = _106 * _98;
    float _129 = 1.0 / _117;
    float _131 = _106 * _104;
    float _133 = _119 * _129;
    float _135 = _121 * _129;
    float2 _489 = float2(_135, _133);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_489, float2(0.0), isnan(_489))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_489, float2(0.0), isnan(_489))).x;
    float3 _503 = float3(_125, _123, float(int(_115)));
    float3 _507 = select(_503, float3(0.0), isnan(_503));
    float4 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _507.xy, uint(rint(_507.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _507.xy, uint(rint(_507.z))).xyzw;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    float _148 = _140.w;
    float2 _521 = float2(_127, _131);
    float4 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_521, float2(0.0), isnan(_521))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_521, float2(0.0), isnan(_521))).xyzw;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    float _158 = _150.w;
    float _160 = in.m_40.z;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_46.w;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_48.w;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_50.x;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _186 = _106 * _164;
    float _188 = _186 * _129;
    float _190 = _106 * _176;
    float _192 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _194 = fma(_188, (*spvDescriptorSet0.fp_c8)._m0[30].w, _192);
    float _196 = _106 * _170;
    float _198 = 1.0 / _194;
    float _200 = in.m_46.x;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_48.x;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_46.z;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = _106 * _204;
    float _220 = _106 * _210;
    float _222 = _106 * _216;
    float _224 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _226 = fma(_137, (*spvDescriptorSet0.fp_c8)._m0[30].w, _224);
    float _228 = 1.0 / _226;
    float _230 = -_196;
    float _232 = fma(_148, _158, _230);
    float _234 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _236 = _198 * _234;
    float _238 = _190 * _232;
    float _240 = 0.0 + _238;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _246 = -_236;
    float _248 = fma(_228, _244, _246);
    float _250 = _248 * _184;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = _106 * _182;
    float _256 = _242 * _252;
    float _258 = _256 * _254;
    bool _262 = _258 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _264 = isnan(_258);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _270 = _266 || _268;
    float _272 = in.m_46.y;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_48.y;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = in.m_48.z;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = _236;
    float _292 = _142;
    if (!_270)
    {
        discard_fragment();
    }
    float _294 = -_144;
    float _296 = _294 + 1.0;
    float _298 = -_146;
    float _300 = _298 + 1.0;
    float _302 = _296 * _154;
    float _304 = -_220;
    float _306 = _218 + _304;
    float _308 = _300 * _156;
    float _310 = _106 * _276;
    float _312 = -_142;
    float _314 = _312 + 1.0;
    float _316 = _106 * _282;
    float _318 = _106 * _288;
    float _320 = _314 * _152;
    float _322 = -_316;
    float _324 = _310 + _322;
    float _326 = -_318;
    float _328 = _222 + _326;
    float _330 = fma(_320, _306, _220);
    float _332 = fma(_302, _324, _316);
    float _334 = fma(_308, _328, _318);
    if (!_270)
    {
        out.m_53.x = _330;
        out.m_53.y = _332;
        out.m_53.z = _334;
        out.m_53.w = _238;
        return out;
    }
    float _336 = _332 * 0.715200006961822509765625;
    float _338 = fma(_330, 0.2125999927520751953125, _336);
    float _340 = fma(_334, 0.072200000286102294921875, _338);
    bool _342 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _344 = 1.0 / _340;
    float _346 = 0.0 + _258;
    float _348 = precise::clamp(_346, 0.0, 1.0);
    float _350 = _348;
    if (_342)
    {
        float _352 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _354 = _236 + _352;
        _290 = _354;
    }
    float _356 = _290;
    float _358 = _344 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _360 = precise::clamp(_358, 0.0, 1.0);
    if (_342)
    {
        float _362 = _356 * 8.0;
        float _364 = precise::clamp(_362, 0.0, 1.0);
        _292 = _364;
    }
    float _366 = _292;
    float _368 = fma(_360, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_342)
    {
        float _370 = _348 * _366;
        _350 = _370;
    }
    float _372 = _350;
    float _374 = _330 * _368;
    float _376 = _332 * _368;
    float _378 = _334 * _368;
    float _380 = 0.0 + _372;
    float _382 = precise::clamp(_380, 0.0, 1.0);
    out.m_53.x = _374;
    out.m_53.y = _376;
    out.m_53.z = _378;
    out.m_53.w = _382;
    return out;
}

