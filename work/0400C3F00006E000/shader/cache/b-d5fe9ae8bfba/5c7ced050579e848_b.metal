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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_33.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_35.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _65 = in.m_37.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_33.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_35.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _91 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[32].x;
    float _93 = _63 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _95 = _93 * 1.39999997615814208984375;
    float _97 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _99 = _89 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _101 = 1.0 / _49;
    float _103 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _105 = _101 * _55;
    float _107 = _101 * _61;
    float _109 = _101 * _81;
    float _111 = _105 + (-0.5);
    float _113 = -_107;
    float _115 = _113 + 1.0;
    float _117 = floor(_105);
    float _119 = _109 + (-0.5);
    float _121 = fma(_95, _111, 0.5);
    float _123 = _99 * _107;
    float _125 = _99 * _115;
    float _127 = _91 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _129 = _97 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _131 = _103 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _133 = floor(_121);
    float _135 = _101 * _69;
    float _137 = _101 * _75;
    float _139 = _131 * 1.39999997615814208984375;
    float _141 = _135 + (-0.5);
    float _143 = _137 + (-0.5);
    float _145 = fma(_139, _119, 0.5);
    float _147 = -_117;
    float _149 = _105 + _147;
    float _151 = fma(_127, _141, 0.3499999940395355224609375);
    float _153 = fma(_129, _143, 0.5);
    float _155 = precise::min(_125, _123);
    float _157 = _101 * _87;
    float2 _463 = float2(_135, _137);
    float4 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_463, float2(0.0), isnan(_463))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_463, float2(0.0), isnan(_463))).xyzw;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _160.w;
    float _170 = -_133;
    float _172 = _121 + _170;
    float2 _488 = float2(_155, _157);
    float4 _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_488, float2(0.0), isnan(_488))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_488, float2(0.0), isnan(_488))).xyzw;
    float _176 = _174.x;
    float _178 = _174.y;
    float _180 = _174.z;
    float _182 = _174.w;
    float2 _504 = float2(_172, _145);
    float _184 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_504, float2(0.0), isnan(_504))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_504, float2(0.0), isnan(_504))).x;
    float2 _512 = float2(_149, _109);
    float _186 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_512, float2(0.0), isnan(_512))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_512, float2(0.0), isnan(_512))).y;
    float2 _520 = float2(_151, _153);
    float3 _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_520, float2(0.0), isnan(_520))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_520, float2(0.0), isnan(_520))).xyz;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    float _198 = in.m_39.w;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = (*spvDescriptorSet0.fp_c3)._m0[18].z * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _206 = _101 * _202;
    float _208 = _176 * _168;
    float _210 = _178 * (*spvDescriptorSet0.fp_c3)._m0[18].x;
    float _212 = precise::min(_184, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _214 = _182 * _204;
    float _216 = -_208;
    float _218 = _216 + 1.0;
    float _220 = _210 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _222 = _212 * _186;
    float _224 = -_214;
    float _226 = _224 + 1.0;
    float _228 = fma(_220, _218, _208);
    float _230 = _222 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _232 = _226 * _208;
    float _234 = fma(_228, _226, _214);
    float _236 = -_230;
    float _238 = _236 + 1.0;
    float _240 = _162 * _232;
    float _242 = _192 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _244 = _164 * _232;
    float _246 = fma(_234, _238, _230);
    float _248 = _194 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _250 = _166 * _232;
    float _252 = _196 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _254 = 1.0 / _246;
    float _256 = fma(_242, _214, _240);
    float _258 = fma(_248, _214, _244);
    float _260 = fma(_252, _214, _250);
    float _262 = _256 * _238;
    float _264 = _258 * _238;
    float _266 = _260 * _238;
    float _268 = (*spvDescriptorSet0.fp_c3)._m0[4].w * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _270 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[3].x, _262);
    float _272 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[3].y, _264);
    float _274 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[3].z, _266);
    float _276 = _268 * _180;
    float _278 = _246 * _206;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _270 * _254;
    float _284 = _272 * _254;
    float _286 = _274 * _254;
    float _288 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[4].x, _282);
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[4].y, _284);
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[4].z, _286);
    float _298 = precise::clamp(_296, 0.0, 1.0);
    out.m_42.x = _290;
    out.m_42.y = _294;
    out.m_42.z = _298;
    out.m_42.w = _280;
    return out;
}

