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
int _40(thread const int& _876, thread const int& _877, constant _10& support_buffer)
{
    int _880 = 1 + _877;
    float _882 = support_buffer._m5[_880].x;
    float _884 = abs(_882);
    bool _886 = _884 == 1.0;
    if (_886)
    {
        return _876;
    }
    float _888 = float(_876);
    float _890 = _888 / _884;
    int _892 = int(_890);
    return _892;
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
    float2 _410 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_410, float2(0.0), isnan(_410))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_410, float2(0.0), isnan(_410))).x;
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
        float _134 = 1.0 / _126;
        float _136 = floor(_130);
        float _138 = floor(_132);
        float _140 = -_136;
        float _142 = _130 + _140;
        float _144 = -_142;
        float _146 = _144 + 1.0;
        float _148 = -_142;
        float _150 = _148 + 2.0;
        float _152 = -_138;
        float _154 = _132 + _152;
        float _156 = _146 * _146;
        float _158 = _138 + 1.5;
        float _160 = -_154;
        float _162 = _160 + 1.0;
        float _164 = _146 * _156;
        float _166 = -_154;
        float _168 = _166 + 2.0;
        float _170 = _150 * _150;
        float _172 = _162 * _162;
        float _174 = -_164;
        float _176 = _174 + 6.0;
        float _178 = _168 * _168;
        float _180 = _162 * _172;
        float _182 = _164 * 4.0;
        float _184 = _180 * 4.0;
        float _186 = -_182;
        float _188 = fma(_150, _170, _186);
        float _190 = _154 * _154;
        float _192 = 1.0 / _128;
        float _194 = -_184;
        float _196 = fma(_168, _178, _194);
        float _198 = -_188;
        float _200 = _198 + _176;
        float _202 = -_180;
        float _204 = _202 + 6.0;
        float _206 = _154 * _190;
        float _208 = _180 + _196;
        float _210 = _200 * 0.16666667163372039794921875;
        float _212 = -_196;
        float _214 = _212 + _204;
        float _216 = _196 * 0.16666667163372039794921875;
        float _218 = _208 * 0.16666667163372039794921875;
        float _220 = 1.0 / _210;
        float _222 = _214 * 0.16666667163372039794921875;
        float _224 = _164 + _188;
        float _226 = _142 * _142;
        float _228 = _136 + (-0.5);
        float _230 = _136 + 1.5;
        float _232 = _224 * 0.16666667163372039794921875;
        float _234 = _142 * _226;
        float _236 = 1.0 / _218;
        float _238 = _188 * 0.16666667163372039794921875;
        float _240 = _206 * 0.16666667163372039794921875;
        float _242 = _234 * 0.16666667163372039794921875;
        float _244 = 1.0 / _232;
        float _246 = fma(_242, _220, _230);
        float _248 = 1.0 / _222;
        float _250 = fma(_238, _244, _228);
        float _252 = _138 + (-0.5);
        float _254 = _246 * _134;
        float _256 = fma(_216, _236, _252);
        float _258 = fma(_240, _248, _158);
        float _260 = _256 * _192;
        float _262 = _250 * _134;
        float _264 = _258 * _192;
        float2 _687 = float2(_262, _260);
        float3 _268 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_687, float2(0.0), isnan(_687)), level(_104)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_687, float2(0.0), isnan(_687)), level(_104)).xyz;
        float _270 = _268.x;
        float _272 = _268.y;
        float _274 = _268.z;
        float2 _702 = float2(_254, _260);
        float3 _276 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_702, float2(0.0), isnan(_702)), level(_104)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_702, float2(0.0), isnan(_702)), level(_104)).xyz;
        float _278 = _276.x;
        float _280 = _276.y;
        float _282 = _276.z;
        float2 _717 = float2(_262, _264);
        float3 _284 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_717, float2(0.0), isnan(_717)), level(_104)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_717, float2(0.0), isnan(_717)), level(_104)).xyz;
        float _286 = _284.x;
        float _288 = _284.y;
        float _290 = _284.z;
        float2 _732 = float2(_254, _264);
        float3 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_732, float2(0.0), isnan(_732)), level(_104)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_732, float2(0.0), isnan(_732)), level(_104)).xyz;
        float _294 = _292.x;
        float _296 = _292.y;
        float _298 = _292.z;
        float _300 = precise::min(_78, _82);
        float _302 = 0.0 + _102;
        float _304 = precise::clamp(_302, 0.0, 1.0);
        float _306 = -_280;
        float _308 = _272 + _306;
        float _310 = -_282;
        float _312 = _274 + _310;
        float _314 = -_278;
        float _316 = _270 + _314;
        float _318 = fma(_232, _308, _280);
        float _320 = -_294;
        float _322 = _286 + _320;
        float _324 = -_296;
        float _326 = _288 + _324;
        float _328 = -_298;
        float _330 = _290 + _328;
        float _332 = fma(_232, _316, _278);
        float _334 = fma(_232, _312, _282);
        float _336 = fma(_232, _322, _294);
        float _338 = fma(_232, _326, _296);
        float _340 = fma(_232, _330, _298);
        float _342 = -_336;
        float _344 = _342 + _332;
        float _346 = -_338;
        float _348 = _346 + _318;
        float _350 = -_340;
        float _352 = _350 + _334;
        float _354 = fma(_218, _344, _336);
        float _356 = fma(_218, _348, _338);
        float _358 = fma(_218, _352, _340);
        float _360 = -_354;
        float _362 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[13].x, _360);
        float _364 = -_356;
        float _366 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[13].y, _364);
        float _368 = -_358;
        float _370 = fma(_358, (*spvDescriptorSet0.fp_c3)._m0[13].z, _368);
        float _372 = fma(_300, _362, _354);
        float _374 = fma(_300, _366, _356);
        float _376 = fma(_300, _370, _358);
        out.m_34.x = _372;
        out.m_34.y = _374;
        out.m_34.z = _376;
        out.m_34.w = _304;
        return out;
    }
    discard_fragment();
    return out;
}

