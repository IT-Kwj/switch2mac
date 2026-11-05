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
int _40(thread const int& _778, thread const int& _779, constant _10& support_buffer)
{
    int _782 = 1 + _779;
    float _784 = support_buffer._m5[_782].x;
    float _786 = abs(_784);
    bool _788 = _786 == 1.0;
    if (_788)
    {
        return _778;
    }
    float _790 = float(_778);
    float _792 = _790 / _786;
    int _794 = int(_792);
    return _794;
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
    float2 _376 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_376, float2(0.0), isnan(_376))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_376, float2(0.0), isnan(_376))).x;
    float _66 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _68 = precise::clamp(_66, 0.0, 1.0);
    bool _72 = _68 != 0.0;
    bool _74 = isnan(_68);
    bool _76 = _72 || _74;
    bool _78 = isnan(0.0);
    bool _80 = _76 || _78;
    bool _82 = !_80;
    if (!_82)
    {
        float _84 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _86 = fma(_68, _84, 1.0);
        float _88 = log2(_86);
        float _90 = _88 + (-1.0);
        float _92 = trunc(_90);
        int _94 = int(_92);
        int _96 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_94), spvDescriptorSet0.fp_t_tcb_A.get_height(_94)).x;
        int _98 = _96;
        int _100 = 1;
        int _102 = _40(_98, _100, (*spvDescriptorSet0.support_buffer));
        int _104 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_94), spvDescriptorSet0.fp_t_tcb_A.get_height(_94)).y;
        int _106 = _104;
        int _108 = 1;
        int _110 = _40(_106, _108, (*spvDescriptorSet0.support_buffer));
        float _112 = float(_102);
        float _114 = float(_110);
        float _116 = fma(_60, _112, -0.5);
        float _118 = fma(_62, _114, -0.5);
        float _120 = 1.0 / _112;
        float _122 = floor(_116);
        float _124 = floor(_118);
        float _126 = -_122;
        float _128 = _116 + _126;
        float _130 = 1.0 / _114;
        float _132 = -_128;
        float _134 = _132 + 1.0;
        float _136 = -_128;
        float _138 = _136 + 2.0;
        float _140 = -_124;
        float _142 = _118 + _140;
        float _144 = _134 * _134;
        float _146 = -_142;
        float _148 = _146 + 1.0;
        float _150 = _134 * _144;
        float _152 = -_142;
        float _154 = _152 + 2.0;
        float _156 = _138 * _138;
        float _158 = _148 * _148;
        float _160 = _150 * 4.0;
        float _162 = _148 * _158;
        float _164 = _154 * _154;
        float _166 = -_160;
        float _168 = fma(_138, _156, _166);
        float _170 = -_150;
        float _172 = _170 + 6.0;
        float _174 = _162 * 4.0;
        float _176 = -_162;
        float _178 = _176 + 6.0;
        float _180 = _128 * _128;
        float _182 = -_168;
        float _184 = _182 + _172;
        float _186 = -_174;
        float _188 = fma(_154, _164, _186);
        float _190 = _142 * _142;
        float _192 = _128 * _180;
        float _194 = _184 * 0.16666667163372039794921875;
        float _196 = -_188;
        float _198 = _196 + _178;
        float _200 = _150 + _168;
        float _202 = _142 * _190;
        float _204 = _124 + (-0.5);
        float _206 = _198 * 0.16666667163372039794921875;
        float _208 = _162 + _188;
        float _210 = _200 * 0.16666667163372039794921875;
        float _212 = 1.0 / _194;
        float _214 = _188 * 0.16666667163372039794921875;
        float _216 = _208 * 0.16666667163372039794921875;
        float _218 = _122 + (-0.5);
        float _220 = _168 * 0.16666667163372039794921875;
        float _222 = _122 + 1.5;
        float _224 = _124 + 1.5;
        float _226 = _192 * 0.16666667163372039794921875;
        float _228 = 1.0 / _216;
        float _230 = _202 * 0.16666667163372039794921875;
        float _232 = 1.0 / _210;
        float _234 = fma(_226, _212, _222);
        float _236 = 1.0 / _206;
        float _238 = fma(_214, _228, _204);
        float _240 = _234 * _120;
        float _242 = _238 * _130;
        float _244 = fma(_220, _232, _218);
        float _246 = _244 * _120;
        float _248 = fma(_230, _236, _224);
        float _250 = _248 * _130;
        float2 _625 = float2(_246, _242);
        float3 _254 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_625, float2(0.0), isnan(_625)), level(_90)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_625, float2(0.0), isnan(_625)), level(_90)).xyz;
        float _256 = _254.x;
        float _258 = _254.y;
        float _260 = _254.z;
        float2 _640 = float2(_240, _242);
        float3 _262 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_640, float2(0.0), isnan(_640)), level(_90)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_640, float2(0.0), isnan(_640)), level(_90)).xyz;
        float _264 = _262.x;
        float _266 = _262.y;
        float _268 = _262.z;
        float2 _655 = float2(_246, _250);
        float3 _270 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_655, float2(0.0), isnan(_655)), level(_90)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_655, float2(0.0), isnan(_655)), level(_90)).xyz;
        float _272 = _270.x;
        float _274 = _270.y;
        float _276 = _270.z;
        float2 _670 = float2(_240, _250);
        float3 _278 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_670, float2(0.0), isnan(_670)), level(_90)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_670, float2(0.0), isnan(_670)), level(_90)).xyz;
        float _280 = _278.x;
        float _282 = _278.y;
        float _284 = _278.z;
        float _286 = 0.0 + _88;
        float _288 = precise::clamp(_286, 0.0, 1.0);
        float _290 = -_264;
        float _292 = _256 + _290;
        float _294 = -_266;
        float _296 = _258 + _294;
        float _298 = -_268;
        float _300 = _260 + _298;
        float _302 = fma(_210, _292, _264);
        float _304 = fma(_210, _296, _266);
        float _306 = fma(_210, _300, _268);
        float _308 = -_280;
        float _310 = _272 + _308;
        float _312 = -_282;
        float _314 = _274 + _312;
        float _316 = -_284;
        float _318 = _276 + _316;
        float _320 = fma(_210, _310, _280);
        float _322 = fma(_210, _314, _282);
        float _324 = fma(_210, _318, _284);
        float _326 = -_320;
        float _328 = _326 + _302;
        float _330 = -_322;
        float _332 = _330 + _304;
        float _334 = -_324;
        float _336 = _334 + _306;
        float _338 = fma(_216, _328, _320);
        float _340 = fma(_216, _332, _322);
        float _342 = fma(_216, _336, _324);
        out.m_34.x = _338;
        out.m_34.y = _340;
        out.m_34.z = _342;
        out.m_34.w = _288;
        return out;
    }
    discard_fragment();
    return out;
}

