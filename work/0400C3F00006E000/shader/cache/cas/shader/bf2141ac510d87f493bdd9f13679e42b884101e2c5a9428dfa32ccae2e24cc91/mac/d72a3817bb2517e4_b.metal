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
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _43 = in.m_33.x;
    float _45 = in.m_33.y;
    float _47 = _43 + (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _49 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _51 = _43 + _49;
    float2 _303 = float2(_43, _45);
    float2 _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_303, float2(0.0), isnan(_303))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_303, float2(0.0), isnan(_303))).xy;
    float _57 = _55.x;
    float _59 = _55.y;
    float _61 = _45 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float2 _323 = float2(_47, _45);
    float2 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_323, float2(0.0), isnan(_323))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_323, float2(0.0), isnan(_323))).xy;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _71 = _45 + _69;
    float2 _341 = float2(_51, _45);
    float2 _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_341, float2(0.0), isnan(_341))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_341, float2(0.0), isnan(_341))).xy;
    float _75 = _73.x;
    float _77 = _73.y;
    float2 _353 = float2(_43, _45);
    float2 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_353, float2(0.0), isnan(_353))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_353, float2(0.0), isnan(_353))).xy;
    float _81 = _79.x;
    float _83 = _79.y;
    float2 _365 = float2(_43, _61);
    float2 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_365, float2(0.0), isnan(_365))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_365, float2(0.0), isnan(_365))).xy;
    float _87 = _85.x;
    float _89 = _85.y;
    float2 _377 = float2(_43, _71);
    float2 _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_377, float2(0.0), isnan(_377))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_377, float2(0.0), isnan(_377))).xy;
    float _93 = _91.x;
    float _95 = _91.y;
    float _97 = _59 + (-0.5);
    float _99 = _57 + (-0.5);
    float _101 = _67 + (-0.5);
    float _103 = _65 + (-0.5);
    float _105 = _97 * _97;
    float _107 = _77 + (-0.5);
    float _109 = _101 * _101;
    float _111 = _75 + (-0.5);
    float _113 = _83 + (-0.5);
    float _115 = fma(_99, _99, _105);
    float _117 = fma(_103, _103, _109);
    float _119 = _107 * _107;
    float _121 = _89 + (-0.5);
    float _123 = _81 + (-0.5);
    float _125 = _113 * _97;
    float _127 = _115 + 1.0;
    float _129 = _117 + 1.0;
    float _131 = fma(_111, _111, _119);
    float _133 = _87 + (-0.5);
    float _135 = _121 * _121;
    float _137 = _95 + (-0.5);
    float _139 = fma(_123, _99, _125);
    float _141 = _131 + 1.0;
    float _143 = fma(_133, _133, _135);
    float _145 = _93 + (-0.5);
    float _147 = _137 * _137;
    float _149 = rsqrt(_127);
    float _151 = _143 + 1.0;
    float _153 = _113 * _101;
    float _155 = fma(_145, _145, _147);
    float _157 = _113 * _107;
    float _159 = _139 + 1.0;
    float _161 = fma(_123, _103, _153);
    float _163 = _155 + 1.0;
    float _165 = rsqrt(_129);
    float _167 = fma(_123, _111, _157);
    float _169 = _161 + 1.0;
    float _171 = _113 * _121;
    float _173 = _113 * _137;
    float _175 = _167 + 1.0;
    float _177 = fma(_123, _133, _171);
    float _179 = rsqrt(_141);
    float _181 = _149 * _159;
    float _183 = fma(_123, _145, _173);
    float _185 = _177 + 1.0;
    float _187 = _183 + 1.0;
    float _189 = rsqrt(_151);
    float _191 = _165 * _169;
    float _193 = -_181;
    float _195 = -_191;
    float _197 = precise::min(_193, _195);
    float _199 = rsqrt(_163);
    float _201 = _179 * _175;
    bool _205 = _191 > _181;
    float _207 = -_201;
    float _209 = precise::min(_197, _207);
    float _211 = _189 * _185;
    float _213 = -_201;
    bool _215 = _197 > _213;
    bool _217 = !_205;
    int _220 = _217 ? 0 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _222 = -_211;
    bool _224 = _209 > _222;
    float _226 = -_211;
    float _228 = precise::min(_209, _226);
    float _230 = _199 * _187;
    bool _232 = !_215;
    float _234 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    int _236 = _232 ? _220 : as_type<int>(_234);
    float _238 = -_230;
    bool _240 = _228 > _238;
    bool _242 = !_224;
    int _244 = _242 ? _236 : 0;
    bool _246 = !_224;
    int _248 = _246 ? int(0x80000000) : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    bool _250 = !_240;
    float _252 = _250 ? as_type<float>(_244) : (-0.0);
    bool _254 = !_240;
    float _256 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _258 = _254 ? as_type<float>(_248) : _256;
    float _260 = _43 + _252;
    float _262 = _45 + _258;
    float2 _619 = float2(_43, _45);
    float _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_619, float2(0.0), isnan(_619))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_619, float2(0.0), isnan(_619))).y;
    float2 _627 = float2(_260, _262);
    float3 _268 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_627, float2(0.0), isnan(_627))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_627, float2(0.0), isnan(_627))).xyz;
    float _270 = _268.x;
    float _272 = _268.y;
    float _274 = _268.z;
    float _276 = _270 * _264;
    float _278 = _272 * _264;
    float _280 = _274 * _264;
    out.m_36.x = _276;
    out.m_36.y = _278;
    out.m_36.z = _280;
    return out;
}

