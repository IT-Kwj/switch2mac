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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
    float4 m_38 [[color(1)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[8].z, -0.5);
    float _65 = _59 * _57;
    float _67 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[8].w, -0.5);
    float _69 = floor(_63);
    float _71 = floor(_67);
    float _73 = _69 + 0.5;
    float _75 = _73 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _77 = _71 + 0.5;
    float _79 = _77 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float2 _330 = float2(_75, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_330, float2(0.0), isnan(_330)), int2(0), component::x).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = in.m_33.z;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = _59 * _96;
    float _100 = -_84;
    float _102 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _104 = -_86;
    float _106 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _108 = -_88;
    float _110 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _112 = -_90;
    float _114 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _116 = 1.0 / _102;
    float _118 = 1.0 / _106;
    float _120 = 1.0 / _110;
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _124 = _116 + _122;
    float _126 = precise::max(0.0, _124);
    float _128 = 1.0 / _114;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _132 = _118 + _130;
    float _134 = precise::max(_126, _98);
    float _136 = precise::max(0.0, _132);
    float _138 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _140 = _120 + _138;
    float _142 = precise::max(_136, _98);
    float _144 = precise::max(0.0, _140);
    float _146 = _134 + _142;
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _150 = _128 + _148;
    float _152 = precise::max(_144, _98);
    float _154 = precise::max(0.0, _150);
    float _156 = _152 + _146;
    float _158 = precise::max(_154, _98);
    float _160 = -_158;
    bool _164 = _156 != _160;
    bool _166 = isnan(_156);
    bool _168 = _164 || _166;
    bool _170 = isnan(_160);
    bool _172 = _168 || _170;
    if (!_172)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        out.m_38.x = 0.0;
        return out;
    }
    float _174 = _79 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _176 = _75 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float2 _483 = float2(_176, _174);
    float4 _178 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_483, float2(0.0), isnan(_483))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_483, float2(0.0), isnan(_483))).xyzw;
    float _180 = _178.x;
    float _182 = _178.y;
    float _184 = _178.z;
    float _186 = _178.w;
    float2 _499 = float2(_75, _174);
    float4 _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_499, float2(0.0), isnan(_499))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_499, float2(0.0), isnan(_499))).xyzw;
    float _190 = _188.x;
    float _192 = _188.y;
    float _194 = _188.z;
    float _196 = _188.w;
    float2 _515 = float2(_176, _79);
    float4 _198 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_515, float2(0.0), isnan(_515))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_515, float2(0.0), isnan(_515))).xyzw;
    float _200 = _198.x;
    float _202 = _198.y;
    float _204 = _198.z;
    float _206 = _198.w;
    float2 _531 = float2(_75, _79);
    float4 _208 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_531, float2(0.0), isnan(_531))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_531, float2(0.0), isnan(_531))).xyzw;
    float _210 = _208.x;
    float _212 = _208.y;
    float _214 = _208.z;
    float _216 = _208.w;
    float _218 = _158 + _156;
    float _220 = -_158;
    bool _222 = _156 > _220;
    float _224 = 1.0 / _218;
    float _226 = _142 * _186;
    float _228 = _142 * _180;
    float _230 = _142 * _182;
    float _232 = _142 * _184;
    float _234 = fma(_134, _196, _226);
    float _236 = fma(_134, _190, _228);
    float _238 = fma(_134, _192, _230);
    float _240 = fma(_134, _194, _232);
    float _242 = fma(_152, _206, _234);
    float _244 = _222 ? _224 : 1.0;
    float _246 = fma(_152, _200, _236);
    float _248 = fma(_152, _202, _238);
    float _250 = fma(_152, _204, _240);
    float _252 = fma(_158, _216, _242);
    float _254 = fma(_158, _210, _246);
    float _256 = fma(_158, _212, _248);
    float _258 = fma(_158, _214, _250);
    float _260 = _252 * _244;
    float _262 = _254 * _244;
    float _264 = _256 * _244;
    float _266 = _258 * _244;
    out.m_36.x = _262;
    out.m_36.y = _264;
    out.m_36.z = _266;
    out.m_36.w = _260;
    out.m_38.x = _260;
    return out;
}

