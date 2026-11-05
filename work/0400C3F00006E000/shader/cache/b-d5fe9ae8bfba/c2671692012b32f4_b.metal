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
    texture2d<float> fp_t_tcb_C [[id(2)]];
    sampler fp_t_tcb_CSmplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_CSmplr_w [[id(6)]];
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
int _40(thread const int& _764, thread const int& _765, constant _10& support_buffer)
{
    int _768 = 1 + _765;
    float _770 = support_buffer._m5[_768].x;
    float _772 = abs(_770);
    bool _774 = _772 == 1.0;
    if (_774)
    {
        return _764;
    }
    float _776 = float(_764);
    float _778 = _776 / _772;
    int _780 = int(_778);
    return _780;
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
    float2 _372 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_372, float2(0.0), isnan(_372))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_372, float2(0.0), isnan(_372))).x;
    bool _68 = _64 != 0.0;
    bool _70 = isnan(_64);
    bool _72 = _68 || _70;
    bool _74 = isnan(0.0);
    bool _76 = _72 || _74;
    bool _78 = !_76;
    if (!_78)
    {
        float _80 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _82 = fma(_64, _80, 1.0);
        float _84 = log2(_82);
        float _86 = _84 + (-1.0);
        float _88 = trunc(_86);
        int _90 = int(_88);
        int _92 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_90), spvDescriptorSet0.fp_t_tcb_A.get_height(_90)).x;
        int _94 = _92;
        int _96 = 1;
        int _98 = _40(_94, _96, (*spvDescriptorSet0.support_buffer));
        int _100 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_90), spvDescriptorSet0.fp_t_tcb_A.get_height(_90)).y;
        int _102 = _100;
        int _104 = 1;
        int _106 = _40(_102, _104, (*spvDescriptorSet0.support_buffer));
        float _108 = float(_98);
        float _110 = float(_106);
        float _112 = fma(_60, _108, -0.5);
        float _114 = fma(_62, _110, -0.5);
        float _116 = 1.0 / _108;
        float _118 = floor(_112);
        float _120 = floor(_114);
        float _122 = -_118;
        float _124 = _112 + _122;
        float _126 = 1.0 / _110;
        float _128 = -_124;
        float _130 = _128 + 1.0;
        float _132 = -_124;
        float _134 = _132 + 2.0;
        float _136 = -_120;
        float _138 = _114 + _136;
        float _140 = _130 * _130;
        float _142 = -_138;
        float _144 = _142 + 1.0;
        float _146 = _130 * _140;
        float _148 = -_138;
        float _150 = _148 + 2.0;
        float _152 = _134 * _134;
        float _154 = _144 * _144;
        float _156 = _146 * 4.0;
        float _158 = _144 * _154;
        float _160 = _150 * _150;
        float _162 = -_156;
        float _164 = fma(_134, _152, _162);
        float _166 = -_146;
        float _168 = _166 + 6.0;
        float _170 = _158 * 4.0;
        float _172 = -_158;
        float _174 = _172 + 6.0;
        float _176 = _124 * _124;
        float _178 = -_164;
        float _180 = _178 + _168;
        float _182 = -_170;
        float _184 = fma(_150, _160, _182);
        float _186 = _138 * _138;
        float _188 = _124 * _176;
        float _190 = _180 * 0.16666667163372039794921875;
        float _192 = -_184;
        float _194 = _192 + _174;
        float _196 = _146 + _164;
        float _198 = _138 * _186;
        float _200 = _120 + (-0.5);
        float _202 = _194 * 0.16666667163372039794921875;
        float _204 = _158 + _184;
        float _206 = _196 * 0.16666667163372039794921875;
        float _208 = 1.0 / _190;
        float _210 = _184 * 0.16666667163372039794921875;
        float _212 = _204 * 0.16666667163372039794921875;
        float _214 = _118 + (-0.5);
        float _216 = _164 * 0.16666667163372039794921875;
        float _218 = _118 + 1.5;
        float _220 = _120 + 1.5;
        float _222 = _188 * 0.16666667163372039794921875;
        float _224 = 1.0 / _212;
        float _226 = _198 * 0.16666667163372039794921875;
        float _228 = 1.0 / _206;
        float _230 = fma(_222, _208, _218);
        float _232 = 1.0 / _202;
        float _234 = fma(_210, _224, _200);
        float _236 = _230 * _116;
        float _238 = _234 * _126;
        float _240 = fma(_216, _228, _214);
        float _242 = _240 * _116;
        float _244 = fma(_226, _232, _220);
        float _246 = _244 * _126;
        float2 _611 = float2(_242, _238);
        float3 _250 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_611, float2(0.0), isnan(_611)), level(_86)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_611, float2(0.0), isnan(_611)), level(_86)).xyz;
        float _252 = _250.x;
        float _254 = _250.y;
        float _256 = _250.z;
        float2 _626 = float2(_236, _238);
        float3 _258 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_626, float2(0.0), isnan(_626)), level(_86)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_626, float2(0.0), isnan(_626)), level(_86)).xyz;
        float _260 = _258.x;
        float _262 = _258.y;
        float _264 = _258.z;
        float2 _641 = float2(_242, _246);
        float3 _266 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_641, float2(0.0), isnan(_641)), level(_86)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_641, float2(0.0), isnan(_641)), level(_86)).xyz;
        float _268 = _266.x;
        float _270 = _266.y;
        float _272 = _266.z;
        float2 _656 = float2(_236, _246);
        float3 _274 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_656, float2(0.0), isnan(_656)), level(_86)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_656, float2(0.0), isnan(_656)), level(_86)).xyz;
        float _276 = _274.x;
        float _278 = _274.y;
        float _280 = _274.z;
        float _282 = 0.0 + _84;
        float _284 = precise::clamp(_282, 0.0, 1.0);
        float _286 = -_260;
        float _288 = _252 + _286;
        float _290 = -_262;
        float _292 = _254 + _290;
        float _294 = -_264;
        float _296 = _256 + _294;
        float _298 = fma(_206, _288, _260);
        float _300 = fma(_206, _292, _262);
        float _302 = fma(_206, _296, _264);
        float _304 = -_276;
        float _306 = _268 + _304;
        float _308 = -_278;
        float _310 = _270 + _308;
        float _312 = -_280;
        float _314 = _272 + _312;
        float _316 = fma(_206, _306, _276);
        float _318 = fma(_206, _310, _278);
        float _320 = fma(_206, _314, _280);
        float _322 = -_316;
        float _324 = _322 + _298;
        float _326 = -_318;
        float _328 = _326 + _300;
        float _330 = -_320;
        float _332 = _330 + _302;
        float _334 = fma(_212, _324, _316);
        float _336 = fma(_212, _328, _318);
        float _338 = fma(_212, _332, _320);
        out.m_34.x = _334;
        out.m_34.y = _336;
        out.m_34.z = _338;
        out.m_34.w = _284;
        return out;
    }
    discard_fragment();
    return out;
}

