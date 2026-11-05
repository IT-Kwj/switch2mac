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
int _40(thread const int& _944, thread const int& _945, constant _10& support_buffer)
{
    int _948 = 1 + _945;
    float _950 = support_buffer._m5[_948].x;
    float _952 = abs(_950);
    bool _954 = _952 == 1.0;
    if (_954)
    {
        return _944;
    }
    float _956 = float(_944);
    float _958 = _956 / _952;
    int _960 = int(_958);
    return _960;
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
    float2 _436 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_436, float2(0.0), isnan(_436))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_436, float2(0.0), isnan(_436))).x;
    float _66 = -_64;
    float _68 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _70 = 1.0 / _68;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _74 = precise::clamp(_72, 0.0, 1.0);
    float _76 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _78 = precise::clamp(_76, 0.0, 1.0);
    float _80 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _82 = precise::clamp(_80, 0.0, 1.0);
    bool _86 = _74 != 0.0;
    bool _88 = isnan(_74);
    bool _90 = _86 || _88;
    bool _92 = isnan(0.0);
    bool _94 = _90 || _92;
    bool _96 = !_94;
    if (!_96)
    {
        float _98 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _100 = fma(_74, _98, 1.0);
        float _102 = log2(_100);
        float _104 = _102 + (-1.0);
        float _106 = trunc(_104);
        int _108 = int(_106);
        int _110 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_108), spvDescriptorSet0.fp_t_tcb_A.get_height(_108)).x;
        int _112 = _110;
        int _114 = 1;
        int _116 = _40(_112, _114, (*spvDescriptorSet0.support_buffer));
        int _118 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_108), spvDescriptorSet0.fp_t_tcb_A.get_height(_108)).y;
        int _120 = _118;
        int _122 = 1;
        int _124 = _40(_120, _122, (*spvDescriptorSet0.support_buffer));
        float _126 = float(_116);
        float _128 = float(_124);
        float _130 = fma(_60, _126, -0.5);
        float _132 = fma(_62, _128, -0.5);
        float _134 = floor(_130);
        float _136 = floor(_132);
        float _138 = -_134;
        float _140 = _130 + _138;
        float _142 = -_140;
        float _144 = _142 + 1.0;
        float _146 = -_140;
        float _148 = _146 + 2.0;
        float _150 = -_136;
        float _152 = _132 + _150;
        float _154 = _144 * _144;
        float _156 = -_152;
        float _158 = _156 + 1.0;
        float _160 = _144 * _154;
        float _162 = -_152;
        float _164 = _162 + 2.0;
        float _166 = _148 * _148;
        float _168 = _158 * _158;
        float _170 = -_160;
        float _172 = _170 + 6.0;
        float _174 = _164 * _164;
        float _176 = _158 * _168;
        float _178 = _160 * 4.0;
        float _180 = _176 * 4.0;
        float _182 = -_178;
        float _184 = fma(_148, _166, _182);
        float _186 = _140 * _140;
        float _188 = 1.0 / _128;
        float _190 = -_180;
        float _192 = fma(_164, _174, _190);
        float _194 = -_184;
        float _196 = _194 + _172;
        float _198 = -_176;
        float _200 = _198 + 6.0;
        float _202 = _140 * _186;
        float _204 = _176 + _192;
        float _206 = _196 * 0.16666667163372039794921875;
        float _208 = -_192;
        float _210 = _208 + _200;
        float _212 = _192 * 0.16666667163372039794921875;
        float _214 = _204 * 0.16666667163372039794921875;
        float _216 = 1.0 / _206;
        float _218 = _210 * 0.16666667163372039794921875;
        float _220 = _160 + _184;
        float _222 = _152 * _152;
        float _224 = _134 + (-0.5);
        float _226 = _184 * 0.16666667163372039794921875;
        float _228 = _220 * 0.16666667163372039794921875;
        float _230 = _152 * _222;
        float _232 = 1.0 / _214;
        float _234 = _134 + 1.5;
        float _236 = _202 * 0.16666667163372039794921875;
        float _238 = _230 * 0.16666667163372039794921875;
        float _240 = 1.0 / _228;
        float _242 = fma(_236, _216, _234);
        float _244 = 1.0 / _218;
        float _246 = 1.0 / _126;
        float _248 = _136 + (-0.5);
        float _250 = _136 + 1.5;
        float _252 = fma(_226, _240, _224);
        float _254 = fma(_212, _232, _248);
        float _256 = fma(_238, _244, _250);
        float _258 = _254 * _188;
        float _260 = _252 * _246;
        float _262 = _242 * _246;
        float _264 = _256 * _188;
        float2 _713 = float2(_260, _258);
        float3 _268 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_713, float2(0.0), isnan(_713)), level(_104)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_713, float2(0.0), isnan(_713)), level(_104)).xyz;
        float _270 = _268.x;
        float _272 = _268.y;
        float _274 = _268.z;
        float2 _728 = float2(_262, _258);
        float3 _276 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_728, float2(0.0), isnan(_728)), level(_104)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_728, float2(0.0), isnan(_728)), level(_104)).xyz;
        float _278 = _276.x;
        float _280 = _276.y;
        float _282 = _276.z;
        float2 _743 = float2(_260, _264);
        float3 _284 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_743, float2(0.0), isnan(_743)), level(_104)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_743, float2(0.0), isnan(_743)), level(_104)).xyz;
        float _286 = _284.x;
        float _288 = _284.y;
        float _290 = _284.z;
        float2 _758 = float2(_262, _264);
        float3 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_758, float2(0.0), isnan(_758)), level(_104)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_758, float2(0.0), isnan(_758)), level(_104)).xyz;
        float _294 = _292.x;
        float _296 = _292.y;
        float _298 = _292.z;
        float _300 = precise::min(_78, _82);
        float _302 = 0.0 + _102;
        float _304 = precise::clamp(_302, 0.0, 1.0);
        float _306 = -_278;
        float _308 = _270 + _306;
        float _310 = -_280;
        float _312 = _272 + _310;
        float _314 = -_282;
        float _316 = _274 + _314;
        float _318 = fma(_228, _308, _278);
        float _320 = -_296;
        float _322 = _288 + _320;
        float _324 = -_294;
        float _326 = _286 + _324;
        float _328 = fma(_228, _312, _280);
        float _330 = -_298;
        float _332 = _290 + _330;
        float _334 = fma(_228, _322, _296);
        float _336 = fma(_228, _326, _294);
        float _338 = fma(_228, _316, _282);
        float _340 = fma(_228, _332, _298);
        float _342 = -_334;
        float _344 = _342 + _328;
        float _346 = -_336;
        float _348 = _346 + _318;
        float _350 = -_340;
        float _352 = _350 + _338;
        float _354 = fma(_214, _344, _334);
        float _356 = fma(_214, _348, _336);
        float _358 = _300 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _360 = fma(_214, _352, _340);
        float _362 = _354 * 0.586600005626678466796875;
        float _364 = fma(_356, 0.29890000820159912109375, _362);
        float _366 = fma(_360, 0.1143999993801116943359375, _364);
        float _368 = -_356;
        float _370 = _368 + _366;
        float _372 = -_354;
        float _374 = _372 + _366;
        float _376 = -_360;
        float _378 = _376 + _366;
        float _380 = fma(_358, _370, _356);
        float _382 = fma(_358, _374, _354);
        float _384 = fma(_358, _378, _360);
        float _386 = -_380;
        float _388 = fma(_380, (*spvDescriptorSet0.fp_c3)._m0[13].x, _386);
        float _390 = -_382;
        float _392 = fma(_382, (*spvDescriptorSet0.fp_c3)._m0[13].y, _390);
        float _394 = -_384;
        float _396 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[13].z, _394);
        float _398 = fma(_300, _388, _380);
        float _400 = fma(_300, _392, _382);
        float _402 = fma(_300, _396, _384);
        out.m_34.x = _398;
        out.m_34.y = _400;
        out.m_34.z = _402;
        out.m_34.w = _304;
        return out;
    }
    discard_fragment();
    return out;
}

