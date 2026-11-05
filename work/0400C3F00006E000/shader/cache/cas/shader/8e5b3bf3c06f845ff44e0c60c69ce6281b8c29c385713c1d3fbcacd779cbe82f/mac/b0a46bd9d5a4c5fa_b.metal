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
int _40(thread const int& _943, thread const int& _944, constant _10& support_buffer)
{
    int _947 = 1 + _944;
    float _949 = support_buffer._m5[_947].x;
    float _951 = abs(_949);
    bool _953 = _951 == 1.0;
    if (_953)
    {
        return _943;
    }
    float _955 = float(_943);
    float _957 = _955 / _951;
    int _959 = int(_957);
    return _959;
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
    float2 _432 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_432, float2(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_432, float2(0.0), isnan(_432))).x;
    bool _68 = _64 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_68)
    {
        discard_fragment();
    }
    if (_68)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _70 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _72 = precise::clamp(_70, 0.0, 1.0);
    float _74 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _76 = precise::clamp(_74, 0.0, 1.0);
    float _78 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _80 = precise::clamp(_78, 0.0, 1.0);
    bool _82 = _72 != 0.0;
    bool _84 = isnan(_72);
    bool _86 = _82 || _84;
    bool _88 = isnan(0.0);
    bool _90 = _86 || _88;
    bool _92 = !_90;
    if (!_92)
    {
        float _94 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _96 = fma(_72, _94, 1.0);
        float _98 = log2(_96);
        float _100 = _98 + (-1.0);
        float _102 = trunc(_100);
        int _104 = int(_102);
        int _106 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_104), spvDescriptorSet0.fp_t_tcb_A.get_height(_104)).x;
        int _108 = _106;
        int _110 = 1;
        int _112 = _40(_108, _110, (*spvDescriptorSet0.support_buffer));
        int _114 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_104), spvDescriptorSet0.fp_t_tcb_A.get_height(_104)).y;
        int _116 = _114;
        int _118 = 1;
        int _120 = _40(_116, _118, (*spvDescriptorSet0.support_buffer));
        float _122 = float(_112);
        float _124 = float(_120);
        float _126 = fma(_60, _122, -0.5);
        float _128 = fma(_62, _124, -0.5);
        float _130 = floor(_126);
        float _132 = floor(_128);
        float _134 = -_130;
        float _136 = _126 + _134;
        float _138 = -_136;
        float _140 = _138 + 1.0;
        float _142 = -_136;
        float _144 = _142 + 2.0;
        float _146 = -_132;
        float _148 = _128 + _146;
        float _150 = _140 * _140;
        float _152 = -_148;
        float _154 = _152 + 1.0;
        float _156 = _140 * _150;
        float _158 = -_148;
        float _160 = _158 + 2.0;
        float _162 = _144 * _144;
        float _164 = _154 * _154;
        float _166 = -_156;
        float _168 = _166 + 6.0;
        float _170 = _160 * _160;
        float _172 = _154 * _164;
        float _174 = _156 * 4.0;
        float _176 = _172 * 4.0;
        float _178 = -_174;
        float _180 = fma(_144, _162, _178);
        float _182 = _136 * _136;
        float _184 = 1.0 / _124;
        float _186 = -_176;
        float _188 = fma(_160, _170, _186);
        float _190 = -_180;
        float _192 = _190 + _168;
        float _194 = -_172;
        float _196 = _194 + 6.0;
        float _198 = _136 * _182;
        float _200 = _172 + _188;
        float _202 = _192 * 0.16666667163372039794921875;
        float _204 = -_188;
        float _206 = _204 + _196;
        float _208 = _188 * 0.16666667163372039794921875;
        float _210 = _200 * 0.16666667163372039794921875;
        float _212 = 1.0 / _202;
        float _214 = _206 * 0.16666667163372039794921875;
        float _216 = _156 + _180;
        float _218 = _148 * _148;
        float _220 = _130 + (-0.5);
        float _222 = _180 * 0.16666667163372039794921875;
        float _224 = _216 * 0.16666667163372039794921875;
        float _226 = _148 * _218;
        float _228 = 1.0 / _210;
        float _230 = _130 + 1.5;
        float _232 = _198 * 0.16666667163372039794921875;
        float _234 = _226 * 0.16666667163372039794921875;
        float _236 = 1.0 / _224;
        float _238 = fma(_232, _212, _230);
        float _240 = 1.0 / _214;
        float _242 = 1.0 / _122;
        float _244 = _132 + (-0.5);
        float _246 = _132 + 1.5;
        float _248 = fma(_222, _236, _220);
        float _250 = fma(_208, _228, _244);
        float _252 = fma(_234, _240, _246);
        float _254 = _250 * _184;
        float _256 = _248 * _242;
        float _258 = _238 * _242;
        float _260 = _252 * _184;
        float2 _713 = float2(_256, _254);
        float3 _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_713, float2(0.0), isnan(_713)), level(_100)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_713, float2(0.0), isnan(_713)), level(_100)).xyz;
        float _266 = _264.x;
        float _268 = _264.y;
        float _270 = _264.z;
        float2 _728 = float2(_258, _254);
        float3 _272 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_728, float2(0.0), isnan(_728)), level(_100)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_728, float2(0.0), isnan(_728)), level(_100)).xyz;
        float _274 = _272.x;
        float _276 = _272.y;
        float _278 = _272.z;
        float2 _743 = float2(_256, _260);
        float3 _280 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_743, float2(0.0), isnan(_743)), level(_100)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_743, float2(0.0), isnan(_743)), level(_100)).xyz;
        float _282 = _280.x;
        float _284 = _280.y;
        float _286 = _280.z;
        float2 _758 = float2(_258, _260);
        float3 _288 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_758, float2(0.0), isnan(_758)), level(_100)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_758, float2(0.0), isnan(_758)), level(_100)).xyz;
        float _290 = _288.x;
        float _292 = _288.y;
        float _294 = _288.z;
        float _296 = precise::min(_76, _80);
        float _298 = 0.0 + _98;
        float _300 = precise::clamp(_298, 0.0, 1.0);
        float _302 = -_274;
        float _304 = _266 + _302;
        float _306 = -_276;
        float _308 = _268 + _306;
        float _310 = -_278;
        float _312 = _270 + _310;
        float _314 = fma(_224, _304, _274);
        float _316 = -_292;
        float _318 = _284 + _316;
        float _320 = -_290;
        float _322 = _282 + _320;
        float _324 = fma(_224, _308, _276);
        float _326 = -_294;
        float _328 = _286 + _326;
        float _330 = fma(_224, _318, _292);
        float _332 = fma(_224, _322, _290);
        float _334 = fma(_224, _312, _278);
        float _336 = fma(_224, _328, _294);
        float _338 = -_330;
        float _340 = _338 + _324;
        float _342 = -_332;
        float _344 = _342 + _314;
        float _346 = -_336;
        float _348 = _346 + _334;
        float _350 = fma(_210, _340, _330);
        float _352 = fma(_210, _344, _332);
        float _354 = _296 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _356 = fma(_210, _348, _336);
        float _358 = _350 * 0.586600005626678466796875;
        float _360 = fma(_352, 0.29890000820159912109375, _358);
        float _362 = fma(_356, 0.1143999993801116943359375, _360);
        float _364 = -_352;
        float _366 = _364 + _362;
        float _368 = -_350;
        float _370 = _368 + _362;
        float _372 = -_356;
        float _374 = _372 + _362;
        float _376 = fma(_354, _366, _352);
        float _378 = fma(_354, _370, _350);
        float _380 = fma(_354, _374, _356);
        float _382 = -_376;
        float _384 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[13].x, _382);
        float _386 = -_378;
        float _388 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[13].y, _386);
        float _390 = -_380;
        float _392 = fma(_380, (*spvDescriptorSet0.fp_c3)._m0[13].z, _390);
        float _394 = fma(_296, _384, _376);
        float _396 = fma(_296, _388, _378);
        float _398 = fma(_296, _392, _380);
        out.m_34.x = _394;
        out.m_34.y = _396;
        out.m_34.z = _398;
        out.m_34.w = _300;
        return out;
    }
    discard_fragment();
    return out;
}

