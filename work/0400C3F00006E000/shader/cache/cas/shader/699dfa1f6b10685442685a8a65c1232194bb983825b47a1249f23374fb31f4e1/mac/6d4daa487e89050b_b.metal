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
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _41 = in.m_31.x;
    float _43 = in.m_31.y;
    float _45 = _41 + (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _47 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _49 = _41 + _47;
    float2 _293 = float2(_41, _43);
    float2 _53 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_293, float2(0.0), isnan(_293))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_293, float2(0.0), isnan(_293))).xy;
    float _55 = _53.x;
    float _57 = _53.y;
    float _59 = _43 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float2 _313 = float2(_45, _43);
    float2 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_313, float2(0.0), isnan(_313))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_313, float2(0.0), isnan(_313))).xy;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _69 = _43 + _67;
    float2 _331 = float2(_49, _43);
    float2 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_331, float2(0.0), isnan(_331))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_331, float2(0.0), isnan(_331))).xy;
    float _73 = _71.x;
    float _75 = _71.y;
    float2 _343 = float2(_41, _43);
    float2 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_343, float2(0.0), isnan(_343))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_343, float2(0.0), isnan(_343))).xy;
    float _79 = _77.x;
    float _81 = _77.y;
    float2 _355 = float2(_41, _59);
    float2 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_355, float2(0.0), isnan(_355))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_355, float2(0.0), isnan(_355))).xy;
    float _85 = _83.x;
    float _87 = _83.y;
    float2 _367 = float2(_41, _69);
    float2 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_367, float2(0.0), isnan(_367))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_367, float2(0.0), isnan(_367))).xy;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _55 + (-0.5);
    float _97 = _57 + (-0.5);
    float _99 = _65 + (-0.5);
    float _101 = _63 + (-0.5);
    float _103 = _97 * _97;
    float _105 = _99 * _99;
    float _107 = _75 + (-0.5);
    float _109 = _73 + (-0.5);
    float _111 = _81 + (-0.5);
    float _113 = fma(_95, _95, _103);
    float _115 = fma(_101, _101, _105);
    float _117 = _107 * _107;
    float _119 = _87 + (-0.5);
    float _121 = _79 + (-0.5);
    float _123 = _111 * _97;
    float _125 = _113 + 1.0;
    float _127 = _115 + 1.0;
    float _129 = fma(_109, _109, _117);
    float _131 = _85 + (-0.5);
    float _133 = _119 * _119;
    float _135 = _93 + (-0.5);
    float _137 = fma(_121, _95, _123);
    float _139 = _129 + 1.0;
    float _141 = fma(_131, _131, _133);
    float _143 = _91 + (-0.5);
    float _145 = _135 * _135;
    float _147 = rsqrt(_125);
    float _149 = _141 + 1.0;
    float _151 = _111 * _99;
    float _153 = fma(_143, _143, _145);
    float _155 = _111 * _107;
    float _157 = _137 + 1.0;
    float _159 = fma(_121, _101, _151);
    float _161 = _153 + 1.0;
    float _163 = rsqrt(_127);
    float _165 = fma(_121, _109, _155);
    float _167 = _159 + 1.0;
    float _169 = _111 * _119;
    float _171 = _111 * _135;
    float _173 = _165 + 1.0;
    float _175 = fma(_121, _131, _169);
    float _177 = rsqrt(_139);
    float _179 = _147 * _157;
    float _181 = fma(_121, _143, _171);
    float _183 = _175 + 1.0;
    float _185 = _181 + 1.0;
    float _187 = rsqrt(_149);
    float _189 = _163 * _167;
    float _191 = -_179;
    float _193 = -_189;
    float _195 = precise::min(_191, _193);
    float _197 = rsqrt(_161);
    float _199 = _177 * _173;
    bool _203 = _189 > _179;
    float _205 = -_199;
    float _207 = precise::min(_195, _205);
    float _209 = _187 * _183;
    float _211 = -_199;
    bool _213 = _195 > _211;
    bool _215 = !_203;
    int _218 = _215 ? 0 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _220 = -_209;
    bool _222 = _207 > _220;
    float _224 = -_209;
    float _226 = precise::min(_207, _224);
    float _228 = _197 * _185;
    bool _230 = !_213;
    float _232 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    int _234 = _230 ? _218 : as_type<int>(_232);
    float _236 = -_228;
    bool _238 = _226 > _236;
    bool _240 = !_222;
    int _242 = _240 ? _234 : 0;
    bool _244 = !_222;
    int _246 = _244 ? int(0x80000000) : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    bool _248 = !_238;
    float _250 = _248 ? as_type<float>(_242) : (-0.0);
    bool _252 = !_238;
    float _254 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _256 = _252 ? as_type<float>(_246) : _254;
    float _258 = _41 + _250;
    float _260 = _43 + _256;
    float2 _609 = float2(_258, _260);
    float3 _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_609, float2(0.0), isnan(_609))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_609, float2(0.0), isnan(_609))).xyz;
    float _266 = _264.x;
    float _268 = _264.y;
    float _270 = _264.z;
    out.m_34.x = _266;
    out.m_34.y = _268;
    out.m_34.z = _270;
    return out;
}

