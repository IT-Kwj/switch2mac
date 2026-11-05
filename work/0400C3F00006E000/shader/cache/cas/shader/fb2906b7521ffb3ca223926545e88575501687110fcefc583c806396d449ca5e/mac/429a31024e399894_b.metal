#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _40(thread const int& _927, thread const int& _928, constant _10& support_buffer)
{
    int _931 = 1 + _928;
    float _933 = support_buffer._m5[_931].x;
    float _935 = abs(_933);
    bool _937 = _935 == 1.0;
    if (_937)
    {
        return _927;
    }
    float _939 = float(_927);
    float _941 = _939 / _935;
    int _943 = int(_941);
    return _943;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_31.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_31.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float2 _430 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_430, float2(0.0), isnan(_430))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_430, float2(0.0), isnan(_430))).x;
    float _66 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _68 = precise::clamp(_66, 0.0, 1.0);
    float _70 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _72 = precise::clamp(_70, 0.0, 1.0);
    float _74 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _76 = precise::clamp(_74, 0.0, 1.0);
    bool _80 = _68 != 0.0;
    bool _82 = isnan(_68);
    bool _84 = _80 || _82;
    bool _86 = isnan(0.0);
    bool _88 = _84 || _86;
    bool _90 = !_88;
    if (!_90)
    {
        float _92 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _94 = fma(_68, _92, 1.0);
        float _96 = log2(_94);
        float _98 = _96 + (-1.0);
        float _100 = trunc(_98);
        int _102 = int(_100);
        int _104 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_102), spvDescriptorSet0.fp_t_tcb_A.get_height(_102)).x;
        int _106 = _104;
        int _108 = 1;
        int _110 = _40(_106, _108, (*spvDescriptorSet0.support_buffer));
        int _112 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_102), spvDescriptorSet0.fp_t_tcb_A.get_height(_102)).y;
        int _114 = _112;
        int _116 = 1;
        int _118 = _40(_114, _116, (*spvDescriptorSet0.support_buffer));
        float _120 = float(_110);
        float _122 = float(_118);
        float _124 = fma(_60, _120, -0.5);
        float _126 = fma(_62, _122, -0.5);
        float _128 = floor(_124);
        float _130 = floor(_126);
        float _132 = -_128;
        float _134 = _124 + _132;
        float _136 = -_134;
        float _138 = _136 + 1.0;
        float _140 = -_134;
        float _142 = _140 + 2.0;
        float _144 = -_130;
        float _146 = _126 + _144;
        float _148 = _138 * _138;
        float _150 = -_146;
        float _152 = _150 + 1.0;
        float _154 = _138 * _148;
        float _156 = -_146;
        float _158 = _156 + 2.0;
        float _160 = _142 * _142;
        float _162 = _152 * _152;
        float _164 = -_154;
        float _166 = _164 + 6.0;
        float _168 = _158 * _158;
        float _170 = _152 * _162;
        float _172 = _154 * 4.0;
        float _174 = _170 * 4.0;
        float _176 = -_172;
        float _178 = fma(_142, _160, _176);
        float _180 = _134 * _134;
        float _182 = 1.0 / _122;
        float _184 = -_174;
        float _186 = fma(_158, _168, _184);
        float _188 = -_178;
        float _190 = _188 + _166;
        float _192 = -_170;
        float _194 = _192 + 6.0;
        float _196 = _134 * _180;
        float _198 = _170 + _186;
        float _200 = _190 * 0.16666667163372039794921875;
        float _202 = -_186;
        float _204 = _202 + _194;
        float _206 = _186 * 0.16666667163372039794921875;
        float _208 = _198 * 0.16666667163372039794921875;
        float _210 = 1.0 / _200;
        float _212 = _204 * 0.16666667163372039794921875;
        float _214 = _154 + _178;
        float _216 = _146 * _146;
        float _218 = _128 + (-0.5);
        float _220 = _178 * 0.16666667163372039794921875;
        float _222 = _214 * 0.16666667163372039794921875;
        float _224 = _146 * _216;
        float _226 = 1.0 / _208;
        float _228 = _128 + 1.5;
        float _230 = _196 * 0.16666667163372039794921875;
        float _232 = _224 * 0.16666667163372039794921875;
        float _234 = 1.0 / _222;
        float _236 = fma(_230, _210, _228);
        float _238 = 1.0 / _212;
        float _240 = 1.0 / _120;
        float _242 = _130 + (-0.5);
        float _244 = _130 + 1.5;
        float _246 = fma(_220, _234, _218);
        float _248 = fma(_206, _226, _242);
        float _250 = fma(_232, _238, _244);
        float _252 = _248 * _182;
        float _254 = _246 * _240;
        float _256 = _236 * _240;
        float _258 = _250 * _182;
        float2 _696 = float2(_254, _252);
        float3 _262 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_696, float2(0.0), isnan(_696)), level(_98)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_696, float2(0.0), isnan(_696)), level(_98)).xyz;
        float _264 = _262.x;
        float _266 = _262.y;
        float _268 = _262.z;
        float2 _711 = float2(_256, _252);
        float3 _270 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_711, float2(0.0), isnan(_711)), level(_98)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_711, float2(0.0), isnan(_711)), level(_98)).xyz;
        float _272 = _270.x;
        float _274 = _270.y;
        float _276 = _270.z;
        float2 _726 = float2(_254, _258);
        float3 _278 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_726, float2(0.0), isnan(_726)), level(_98)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_726, float2(0.0), isnan(_726)), level(_98)).xyz;
        float _280 = _278.x;
        float _282 = _278.y;
        float _284 = _278.z;
        float2 _741 = float2(_256, _258);
        float3 _286 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_741, float2(0.0), isnan(_741)), level(_98)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_741, float2(0.0), isnan(_741)), level(_98)).xyz;
        float _288 = _286.x;
        float _290 = _286.y;
        float _292 = _286.z;
        float _294 = precise::min(_72, _76);
        float _296 = 0.0 + _96;
        float _298 = precise::clamp(_296, 0.0, 1.0);
        float _300 = -_272;
        float _302 = _264 + _300;
        float _304 = -_274;
        float _306 = _266 + _304;
        float _308 = -_276;
        float _310 = _268 + _308;
        float _312 = fma(_222, _302, _272);
        float _314 = -_290;
        float _316 = _282 + _314;
        float _318 = -_288;
        float _320 = _280 + _318;
        float _322 = fma(_222, _306, _274);
        float _324 = -_292;
        float _326 = _284 + _324;
        float _328 = fma(_222, _316, _290);
        float _330 = fma(_222, _320, _288);
        float _332 = fma(_222, _310, _276);
        float _334 = fma(_222, _326, _292);
        float _336 = -_328;
        float _338 = _336 + _322;
        float _340 = -_330;
        float _342 = _340 + _312;
        float _344 = -_334;
        float _346 = _344 + _332;
        float _348 = fma(_208, _338, _328);
        float _350 = fma(_208, _342, _330);
        float _352 = _294 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _354 = fma(_208, _346, _334);
        float _356 = _348 * 0.586600005626678466796875;
        float _358 = fma(_350, 0.29890000820159912109375, _356);
        float _360 = fma(_354, 0.1143999993801116943359375, _358);
        float _362 = -_350;
        float _364 = _362 + _360;
        float _366 = -_348;
        float _368 = _366 + _360;
        float _370 = -_354;
        float _372 = _370 + _360;
        float _374 = fma(_352, _364, _350);
        float _376 = fma(_352, _368, _348);
        float _378 = fma(_352, _372, _354);
        float _380 = -_374;
        float _382 = fma(_374, (*spvDescriptorSet0.fp_c3)._m0[13].x, _380);
        float _384 = -_376;
        float _386 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[13].y, _384);
        float _388 = -_378;
        float _390 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[13].z, _388);
        float _392 = fma(_294, _382, _374);
        float _394 = fma(_294, _386, _376);
        float _396 = fma(_294, _390, _378);
        out.m_34.x = _392;
        out.m_34.y = _394;
        out.m_34.z = _396;
        out.m_34.w = _298;
        return out;
    }
    discard_fragment();
    return out;
}

