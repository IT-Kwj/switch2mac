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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_CSmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
    float4 m_40 [[color(1)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float _67 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[8].z, -0.5);
    float _69 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[8].w, -0.5);
    float _71 = floor(_67);
    float _73 = floor(_69);
    float _75 = _71 + 0.5;
    float _77 = _75 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _79 = _73 + 0.5;
    float _81 = _79 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float2 _326 = float2(_77, _81);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_326, float2(0.0), isnan(_326)), int2(0), component::x).xyzw;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float _92 = _84.w;
    float2 _345 = float2(_63, _65);
    float _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_345, float2(0.0), isnan(_345))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_345, float2(0.0), isnan(_345))).x;
    float _96 = in.m_35.z;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = _61 * _100;
    float _104 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _106 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _108 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _110 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _112 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _114 = _104 + _112;
    float _116 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _118 = _106 + _116;
    float _120 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _122 = _108 + _120;
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _126 = _110 + _124;
    float _128 = precise::max(0.0, _114);
    float _130 = precise::max(0.0, _118);
    float _132 = precise::max(0.0, _122);
    float _134 = precise::max(_128, _94);
    float _136 = precise::max(_130, _94);
    float _138 = precise::max(_132, _94);
    float _140 = precise::max(_134, _102);
    float _142 = precise::max(_136, _102);
    float _144 = precise::max(0.0, _126);
    float _146 = precise::max(_138, _102);
    float _148 = _140 + _142;
    float _150 = precise::max(_144, _94);
    float _152 = _146 + _148;
    float _154 = precise::max(_150, _102);
    float _156 = -_154;
    bool _160 = _152 != _156;
    bool _162 = isnan(_152);
    bool _164 = _160 || _162;
    bool _166 = isnan(_156);
    bool _168 = _164 || _166;
    if (!_168)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        out.m_40.x = 0.0;
        return out;
    }
    float _170 = _81 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _172 = _77 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float2 _483 = float2(_172, _170);
    float4 _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_483, float2(0.0), isnan(_483))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_483, float2(0.0), isnan(_483))).xyzw;
    float _176 = _174.x;
    float _178 = _174.y;
    float _180 = _174.z;
    float _182 = _174.w;
    float2 _499 = float2(_77, _170);
    float4 _184 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_499, float2(0.0), isnan(_499))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_499, float2(0.0), isnan(_499))).xyzw;
    float _186 = _184.x;
    float _188 = _184.y;
    float _190 = _184.z;
    float _192 = _184.w;
    float2 _515 = float2(_172, _81);
    float4 _194 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_515, float2(0.0), isnan(_515))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_515, float2(0.0), isnan(_515))).xyzw;
    float _196 = _194.x;
    float _198 = _194.y;
    float _200 = _194.z;
    float _202 = _194.w;
    float2 _531 = float2(_77, _81);
    float4 _204 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_531, float2(0.0), isnan(_531))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_531, float2(0.0), isnan(_531))).xyzw;
    float _206 = _204.x;
    float _208 = _204.y;
    float _210 = _204.z;
    float _212 = _204.w;
    float _214 = _154 + _152;
    float _216 = -_154;
    bool _218 = _152 > _216;
    float _220 = 1.0 / _214;
    float _222 = _142 * _182;
    float _224 = _142 * _176;
    float _226 = _142 * _178;
    float _228 = _142 * _180;
    float _230 = fma(_140, _192, _222);
    float _232 = fma(_140, _186, _224);
    float _234 = fma(_140, _188, _226);
    float _236 = fma(_140, _190, _228);
    float _238 = fma(_146, _202, _230);
    float _240 = fma(_146, _196, _232);
    float _242 = _218 ? _220 : 1.0;
    float _244 = fma(_146, _198, _234);
    float _246 = fma(_146, _200, _236);
    float _248 = fma(_154, _212, _238);
    float _250 = fma(_154, _206, _240);
    float _252 = fma(_154, _208, _244);
    float _254 = fma(_154, _210, _246);
    float _256 = _248 * _242;
    float _258 = _250 * _242;
    float _260 = _252 * _242;
    float _262 = _254 * _242;
    out.m_38.x = _258;
    out.m_38.y = _260;
    out.m_38.z = _262;
    out.m_38.w = _256;
    out.m_40.x = _256;
    return out;
}

