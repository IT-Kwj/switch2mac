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
int _40(thread const int& _795, thread const int& _796, constant _10& support_buffer)
{
    int _799 = 1 + _796;
    float _801 = support_buffer._m5[_799].x;
    float _803 = abs(_801);
    bool _805 = _803 == 1.0;
    if (_805)
    {
        return _795;
    }
    float _807 = float(_795);
    float _809 = _807 / _803;
    int _811 = int(_809);
    return _811;
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
    float2 _382 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_382, float2(0.0), isnan(_382))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_382, float2(0.0), isnan(_382))).x;
    float _66 = -_64;
    float _68 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _70 = 1.0 / _68;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _74 = precise::clamp(_72, 0.0, 1.0);
    bool _78 = _74 != 0.0;
    bool _80 = isnan(_74);
    bool _82 = _78 || _80;
    bool _84 = isnan(0.0);
    bool _86 = _82 || _84;
    bool _88 = !_86;
    if (!_88)
    {
        float _90 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _92 = fma(_74, _90, 1.0);
        float _94 = log2(_92);
        float _96 = _94 + (-1.0);
        float _98 = trunc(_96);
        int _100 = int(_98);
        int _102 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_100), spvDescriptorSet0.fp_t_tcb_A.get_height(_100)).x;
        int _104 = _102;
        int _106 = 1;
        int _108 = _40(_104, _106, (*spvDescriptorSet0.support_buffer));
        int _110 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_100), spvDescriptorSet0.fp_t_tcb_A.get_height(_100)).y;
        int _112 = _110;
        int _114 = 1;
        int _116 = _40(_112, _114, (*spvDescriptorSet0.support_buffer));
        float _118 = float(_108);
        float _120 = float(_116);
        float _122 = fma(_60, _118, -0.5);
        float _124 = fma(_62, _120, -0.5);
        float _126 = 1.0 / _118;
        float _128 = floor(_122);
        float _130 = floor(_124);
        float _132 = -_128;
        float _134 = _122 + _132;
        float _136 = 1.0 / _120;
        float _138 = -_134;
        float _140 = _138 + 1.0;
        float _142 = -_134;
        float _144 = _142 + 2.0;
        float _146 = -_130;
        float _148 = _124 + _146;
        float _150 = _140 * _140;
        float _152 = -_148;
        float _154 = _152 + 1.0;
        float _156 = _140 * _150;
        float _158 = -_148;
        float _160 = _158 + 2.0;
        float _162 = _144 * _144;
        float _164 = _154 * _154;
        float _166 = _156 * 4.0;
        float _168 = _154 * _164;
        float _170 = _160 * _160;
        float _172 = -_166;
        float _174 = fma(_144, _162, _172);
        float _176 = -_156;
        float _178 = _176 + 6.0;
        float _180 = _168 * 4.0;
        float _182 = -_168;
        float _184 = _182 + 6.0;
        float _186 = _134 * _134;
        float _188 = -_174;
        float _190 = _188 + _178;
        float _192 = -_180;
        float _194 = fma(_160, _170, _192);
        float _196 = _148 * _148;
        float _198 = _134 * _186;
        float _200 = _190 * 0.16666667163372039794921875;
        float _202 = -_194;
        float _204 = _202 + _184;
        float _206 = _156 + _174;
        float _208 = _148 * _196;
        float _210 = _130 + (-0.5);
        float _212 = _204 * 0.16666667163372039794921875;
        float _214 = _168 + _194;
        float _216 = _206 * 0.16666667163372039794921875;
        float _218 = 1.0 / _200;
        float _220 = _194 * 0.16666667163372039794921875;
        float _222 = _214 * 0.16666667163372039794921875;
        float _224 = _128 + (-0.5);
        float _226 = _174 * 0.16666667163372039794921875;
        float _228 = _128 + 1.5;
        float _230 = _130 + 1.5;
        float _232 = _198 * 0.16666667163372039794921875;
        float _234 = 1.0 / _222;
        float _236 = _208 * 0.16666667163372039794921875;
        float _238 = 1.0 / _216;
        float _240 = fma(_232, _218, _228);
        float _242 = 1.0 / _212;
        float _244 = fma(_220, _234, _210);
        float _246 = _240 * _126;
        float _248 = _244 * _136;
        float _250 = fma(_226, _238, _224);
        float _252 = _250 * _126;
        float _254 = fma(_236, _242, _230);
        float _256 = _254 * _136;
        float2 _642 = float2(_252, _248);
        float3 _260 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_642, float2(0.0), isnan(_642)), level(_96)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_642, float2(0.0), isnan(_642)), level(_96)).xyz;
        float _262 = _260.x;
        float _264 = _260.y;
        float _266 = _260.z;
        float2 _657 = float2(_246, _248);
        float3 _268 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_657, float2(0.0), isnan(_657)), level(_96)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_657, float2(0.0), isnan(_657)), level(_96)).xyz;
        float _270 = _268.x;
        float _272 = _268.y;
        float _274 = _268.z;
        float2 _672 = float2(_252, _256);
        float3 _276 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_672, float2(0.0), isnan(_672)), level(_96)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_672, float2(0.0), isnan(_672)), level(_96)).xyz;
        float _278 = _276.x;
        float _280 = _276.y;
        float _282 = _276.z;
        float2 _687 = float2(_246, _256);
        float3 _284 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_687, float2(0.0), isnan(_687)), level(_96)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_687, float2(0.0), isnan(_687)), level(_96)).xyz;
        float _286 = _284.x;
        float _288 = _284.y;
        float _290 = _284.z;
        float _292 = 0.0 + _94;
        float _294 = precise::clamp(_292, 0.0, 1.0);
        float _296 = -_270;
        float _298 = _262 + _296;
        float _300 = -_272;
        float _302 = _264 + _300;
        float _304 = -_274;
        float _306 = _266 + _304;
        float _308 = fma(_216, _298, _270);
        float _310 = fma(_216, _302, _272);
        float _312 = fma(_216, _306, _274);
        float _314 = -_286;
        float _316 = _278 + _314;
        float _318 = -_288;
        float _320 = _280 + _318;
        float _322 = -_290;
        float _324 = _282 + _322;
        float _326 = fma(_216, _316, _286);
        float _328 = fma(_216, _320, _288);
        float _330 = fma(_216, _324, _290);
        float _332 = -_326;
        float _334 = _332 + _308;
        float _336 = -_328;
        float _338 = _336 + _310;
        float _340 = -_330;
        float _342 = _340 + _312;
        float _344 = fma(_222, _334, _326);
        float _346 = fma(_222, _338, _328);
        float _348 = fma(_222, _342, _330);
        out.m_34.x = _344;
        out.m_34.y = _346;
        out.m_34.z = _348;
        out.m_34.w = _294;
        return out;
    }
    discard_fragment();
    return out;
}

