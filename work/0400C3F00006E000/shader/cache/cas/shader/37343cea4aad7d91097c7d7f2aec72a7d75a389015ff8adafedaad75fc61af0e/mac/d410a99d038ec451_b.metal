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
    float2 _314 = float2(_75, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_314, float2(0.0), isnan(_314)), int2(0), component::x).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = in.m_33.z;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = _59 * _96;
    float _100 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _102 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _104 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _106 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _108 = -_100;
    float _110 = _108 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _112 = -_102;
    float _114 = _112 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _120 = -_106;
    float _122 = _120 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _124 = precise::max(0.0, _110);
    float _126 = precise::max(0.0, _114);
    float _128 = precise::max(0.0, _118);
    float _130 = precise::max(_124, _98);
    float _132 = precise::max(_126, _98);
    float _134 = precise::max(_128, _98);
    float _136 = precise::max(0.0, _122);
    float _138 = _130 + _132;
    float _140 = precise::max(_136, _98);
    float _142 = _134 + _138;
    float _144 = -_140;
    bool _148 = _142 != _144;
    bool _150 = isnan(_142);
    bool _152 = _148 || _150;
    bool _154 = isnan(_144);
    bool _156 = _152 || _154;
    if (!_156)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        out.m_38.x = 0.0;
        return out;
    }
    float _158 = _79 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _160 = _75 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float2 _451 = float2(_160, _158);
    float4 _162 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_451, float2(0.0), isnan(_451))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_451, float2(0.0), isnan(_451))).xyzw;
    float _164 = _162.x;
    float _166 = _162.y;
    float _168 = _162.z;
    float _170 = _162.w;
    float2 _467 = float2(_75, _158);
    float4 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_467, float2(0.0), isnan(_467))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_467, float2(0.0), isnan(_467))).xyzw;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float _180 = _172.w;
    float2 _483 = float2(_160, _79);
    float4 _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_483, float2(0.0), isnan(_483))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_483, float2(0.0), isnan(_483))).xyzw;
    float _184 = _182.x;
    float _186 = _182.y;
    float _188 = _182.z;
    float _190 = _182.w;
    float2 _499 = float2(_75, _79);
    float4 _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_499, float2(0.0), isnan(_499))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_499, float2(0.0), isnan(_499))).xyzw;
    float _194 = _192.x;
    float _196 = _192.y;
    float _198 = _192.z;
    float _200 = _192.w;
    float _202 = _140 + _142;
    float _204 = -_140;
    bool _206 = _142 > _204;
    float _208 = 1.0 / _202;
    float _210 = _132 * _170;
    float _212 = _132 * _164;
    float _214 = _132 * _166;
    float _216 = _132 * _168;
    float _218 = fma(_130, _180, _210);
    float _220 = fma(_130, _174, _212);
    float _222 = fma(_130, _176, _214);
    float _224 = fma(_130, _178, _216);
    float _226 = fma(_134, _190, _218);
    float _228 = _206 ? _208 : 1.0;
    float _230 = fma(_134, _184, _220);
    float _232 = fma(_134, _186, _222);
    float _234 = fma(_134, _188, _224);
    float _236 = fma(_140, _200, _226);
    float _238 = fma(_140, _194, _230);
    float _240 = fma(_140, _196, _232);
    float _242 = fma(_140, _198, _234);
    float _244 = _236 * _228;
    float _246 = _238 * _228;
    float _248 = _240 * _228;
    float _250 = _242 * _228;
    out.m_36.x = _246;
    out.m_36.y = _248;
    out.m_36.z = _250;
    out.m_36.w = _244;
    out.m_38.x = _244;
    return out;
}

