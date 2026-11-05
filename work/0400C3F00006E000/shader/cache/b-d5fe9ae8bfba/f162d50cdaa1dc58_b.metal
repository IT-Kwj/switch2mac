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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _254 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_254, float2(0.0), isnan(_254))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_254, float2(0.0), isnan(_254))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = _57 * _69;
    float _79 = _57 * _75;
    float _81 = -_63;
    float _83 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _85 = 1.0 / _83;
    float _87 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _89 = precise::clamp(_87, 0.0, 1.0);
    bool _93 = _89 != 0.0;
    bool _95 = isnan(_89);
    bool _97 = _93 || _95;
    bool _99 = isnan(0.0);
    bool _101 = _97 || _99;
    bool _103 = !_101;
    if (!_103)
    {
        float2 _325 = float2(_77, _79);
        float2 _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_325, float2(0.0), isnan(_325))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_325, float2(0.0), isnan(_325))).xy;
        float _109 = _107.x;
        float _111 = _107.y;
        float _113 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[1].z;
        float _115 = _111 + (-0.5);
        float _117 = _109 + (-0.5);
        float _119 = _115 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
        float _121 = _117 * _113;
        float _123 = _119 * _119;
        float _125 = _89 * _119;
        float _127 = fma(_121, _121, _123);
        float _129 = rsqrt(_127);
        float _131 = _119 * _129;
        float _133 = _121 * _129;
        float _135 = _89 * _121;
        float _137 = _131 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
        float _139 = _133 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        float _141 = fma(_137, 4.0, _125);
        float _143 = fma(_139, 4.0, _135);
        float _145 = _61 + _141;
        float _147 = _59 + _143;
        float2 _396 = float2(_147, _145);
        float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_396, float2(0.0), isnan(_396))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_396, float2(0.0), isnan(_396))).x;
        float _151 = _85 + (-0.001000000047497451305389404296875);
        float _153 = (*spvDescriptorSet0.fp_c3)._m0[0].y + (-1.0);
        float _155 = fma(_89, _153, 1.0);
        float _157 = log2(_155);
        float _159 = -_149;
        float _161 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
        float _163 = 1.0 / _161;
        bool _165 = _163 >= _151;
        bool _167 = isnan(_163);
        bool _169 = _165 || _167;
        bool _171 = isnan(_151);
        bool _173 = _169 || _171;
        float _175 = float(_173);
        float _177 = fma(_175, _135, _59);
        float _179 = precise::clamp(_177, 0.0, 1.0);
        float _181 = fma(_175, _125, _61);
        float _183 = precise::clamp(_181, 0.0, 1.0);
        float2 _453 = float2(_179, _183);
        float3 _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_453, float2(0.0), isnan(_453)), bias(_157)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_453, float2(0.0), isnan(_453)), bias(_157)).xyz;
        float _189 = _187.x;
        float _191 = _187.y;
        float _193 = _187.z;
        float _195 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
        float _197 = precise::clamp(_195, 0.0, 1.0);
        float _199 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
        float _201 = precise::clamp(_199, 0.0, 1.0);
        float _203 = precise::min(_197, _201);
        float _205 = -_189;
        float _207 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[13].x, _205);
        float _209 = -_191;
        float _211 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[13].y, _209);
        float _213 = -_193;
        float _215 = fma(_193, (*spvDescriptorSet0.fp_c3)._m0[13].z, _213);
        float _217 = fma(_203, _207, _189);
        float _219 = fma(_203, _211, _191);
        float _221 = fma(_203, _215, _193);
        out.m_36.x = _217;
        out.m_36.y = _219;
        out.m_36.z = _221;
        out.m_36.w = 1.0;
        return out;
    }
    discard_fragment();
    return out;
}

