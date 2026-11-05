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
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _830, thread const int& _831, constant _10& support_buffer)
{
    int _834 = 1 + _831;
    float _836 = support_buffer._m5[_834].x;
    float _838 = abs(_836);
    bool _840 = _838 == 1.0;
    if (_840)
    {
        return _830;
    }
    float _842 = float(_830);
    float _844 = _842 / _838;
    int _846 = int(_844);
    return _846;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_31.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_31.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _398 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_398, float2(0.0), isnan(_398))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_398, float2(0.0), isnan(_398))).x;
    float _70 = in.m_33.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_35.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = _62 * _74;
    float _84 = _62 * _80;
    bool _88 = _68 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_88)
    {
        discard_fragment();
    }
    float _90 = fma(_68, _82, _84);
    float _92 = precise::clamp(_90, 0.0, 1.0);
    if (_88)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return out;
    }
    bool _94 = _92 != 0.0;
    bool _96 = isnan(_92);
    bool _98 = _94 || _96;
    bool _100 = isnan(0.0);
    bool _102 = _98 || _100;
    bool _104 = !_102;
    if (!_104)
    {
        float _106 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _108 = fma(_92, _106, 1.0);
        float _110 = log2(_108);
        float _112 = _110 + (-1.0);
        float _114 = trunc(_112);
        int _116 = int(_114);
        int _118 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_116), spvDescriptorSet0.fp_t_tcb_A.get_height(_116)).x;
        int _120 = _118;
        int _122 = 1;
        int _124 = _44(_120, _122, (*spvDescriptorSet0.support_buffer));
        int _126 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_116), spvDescriptorSet0.fp_t_tcb_A.get_height(_116)).y;
        int _128 = _126;
        int _130 = 1;
        int _132 = _44(_128, _130, (*spvDescriptorSet0.support_buffer));
        float _134 = float(_124);
        float _136 = float(_132);
        float _138 = fma(_64, _134, -0.5);
        float _140 = fma(_66, _136, -0.5);
        float _142 = 1.0 / _134;
        float _144 = floor(_138);
        float _146 = floor(_140);
        float _148 = -_144;
        float _150 = _138 + _148;
        float _152 = 1.0 / _136;
        float _154 = -_150;
        float _156 = _154 + 1.0;
        float _158 = -_150;
        float _160 = _158 + 2.0;
        float _162 = -_146;
        float _164 = _140 + _162;
        float _166 = _156 * _156;
        float _168 = -_164;
        float _170 = _168 + 1.0;
        float _172 = _156 * _166;
        float _174 = -_164;
        float _176 = _174 + 2.0;
        float _178 = _160 * _160;
        float _180 = _170 * _170;
        float _182 = _172 * 4.0;
        float _184 = _170 * _180;
        float _186 = _176 * _176;
        float _188 = -_182;
        float _190 = fma(_160, _178, _188);
        float _192 = -_172;
        float _194 = _192 + 6.0;
        float _196 = _184 * 4.0;
        float _198 = -_184;
        float _200 = _198 + 6.0;
        float _202 = _150 * _150;
        float _204 = -_190;
        float _206 = _204 + _194;
        float _208 = -_196;
        float _210 = fma(_176, _186, _208);
        float _212 = _164 * _164;
        float _214 = _150 * _202;
        float _216 = _206 * 0.16666667163372039794921875;
        float _218 = -_210;
        float _220 = _218 + _200;
        float _222 = _172 + _190;
        float _224 = _164 * _212;
        float _226 = _146 + (-0.5);
        float _228 = _220 * 0.16666667163372039794921875;
        float _230 = _184 + _210;
        float _232 = _222 * 0.16666667163372039794921875;
        float _234 = 1.0 / _216;
        float _236 = _210 * 0.16666667163372039794921875;
        float _238 = _230 * 0.16666667163372039794921875;
        float _240 = _144 + (-0.5);
        float _242 = _190 * 0.16666667163372039794921875;
        float _244 = _144 + 1.5;
        float _246 = _146 + 1.5;
        float _248 = _214 * 0.16666667163372039794921875;
        float _250 = 1.0 / _238;
        float _252 = _224 * 0.16666667163372039794921875;
        float _254 = 1.0 / _232;
        float _256 = fma(_248, _234, _244);
        float _258 = 1.0 / _228;
        float _260 = fma(_236, _250, _226);
        float _262 = _256 * _142;
        float _264 = _260 * _152;
        float _266 = fma(_242, _254, _240);
        float _268 = _266 * _142;
        float _270 = fma(_252, _258, _246);
        float _272 = _270 * _152;
        float2 _679 = float2(_268, _264);
        float3 _276 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_679, float2(0.0), isnan(_679)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_679, float2(0.0), isnan(_679)), level(_112)).xyz;
        float _278 = _276.x;
        float _280 = _276.y;
        float _282 = _276.z;
        float2 _694 = float2(_262, _264);
        float3 _284 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_694, float2(0.0), isnan(_694)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_694, float2(0.0), isnan(_694)), level(_112)).xyz;
        float _286 = _284.x;
        float _288 = _284.y;
        float _290 = _284.z;
        float2 _709 = float2(_268, _272);
        float3 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_709, float2(0.0), isnan(_709)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_709, float2(0.0), isnan(_709)), level(_112)).xyz;
        float _294 = _292.x;
        float _296 = _292.y;
        float _298 = _292.z;
        float2 _724 = float2(_262, _272);
        float3 _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_724, float2(0.0), isnan(_724)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_724, float2(0.0), isnan(_724)), level(_112)).xyz;
        float _302 = _300.x;
        float _304 = _300.y;
        float _306 = _300.z;
        float _308 = 0.0 + _110;
        float _310 = precise::clamp(_308, 0.0, 1.0);
        float _312 = -_286;
        float _314 = _278 + _312;
        float _316 = -_288;
        float _318 = _280 + _316;
        float _320 = -_290;
        float _322 = _282 + _320;
        float _324 = fma(_232, _314, _286);
        float _326 = fma(_232, _318, _288);
        float _328 = fma(_232, _322, _290);
        float _330 = -_302;
        float _332 = _294 + _330;
        float _334 = -_304;
        float _336 = _296 + _334;
        float _338 = -_306;
        float _340 = _298 + _338;
        float _342 = fma(_232, _332, _302);
        float _344 = fma(_232, _336, _304);
        float _346 = fma(_232, _340, _306);
        float _348 = -_342;
        float _350 = _348 + _324;
        float _352 = -_344;
        float _354 = _352 + _326;
        float _356 = -_346;
        float _358 = _356 + _328;
        float _360 = fma(_238, _350, _342);
        float _362 = fma(_238, _354, _344);
        float _364 = fma(_238, _358, _346);
        out.m_38.x = _360;
        out.m_38.y = _362;
        out.m_38.z = _364;
        out.m_38.w = _310;
        return out;
    }
    discard_fragment();
    return out;
}

