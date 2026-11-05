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
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_37.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_37.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.z;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_39.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_39.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _53;
    float _87 = _85 * _59;
    float _89 = _85 * _65;
    float _91 = _85 * _71;
    float _93 = _87 * _87;
    float _95 = fma(_89, _89, _93);
    float _97 = fma(_91, _91, _95);
    float _99 = rsqrt(_97);
    float _101 = _87 * _99;
    float _103 = _89 * _99;
    float _105 = _91 * _99;
    float _107 = _101 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _109 = _101 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _111 = _85 * _83;
    float _113 = fma(_103, (*spvDescriptorSet0.fp_c5)._m0[2].x, _107);
    float _115 = _85 * _77;
    float _117 = fma(_105, (*spvDescriptorSet0.fp_c5)._m0[2].z, _113);
    float _119 = fma(_109, 0.5, 0.5);
    float _121 = fma(_117, 0.5, 0.5);
    float2 _391 = float2(_115, _111);
    float4 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_391, float2(0.0), isnan(_391))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_391, float2(0.0), isnan(_391))).xyzw;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _124.z;
    float _132 = _124.w;
    float2 _410 = float2(_121, _119);
    float4 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_410, float2(0.0), isnan(_410))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_410, float2(0.0), isnan(_410))).xyzw;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float _142 = _134.w;
    float _144 = in.m_41.x;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _152 = fma(_117, (*spvDescriptorSet0.fp_c4)._m0[12].z, _150);
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = _85 * _148;
    bool _160 = _109 >= _156;
    float _162 = _117;
    float _164 = _156;
    if (!_160)
    {
        _162 = 0.0;
    }
    float _166 = _162;
    float _168 = 0.0;
    float _170 = _166;
    if (!_160)
    {
        _168 = 0.0;
        _164 = 0.0;
    }
    float _172 = _168;
    float _174 = _164;
    bool _176 = !_160;
    float _178 = _174;
    float _180 = _172;
    if (!_176)
    {
        float _182 = in.m_43.x;
        float _184 = gl_FragCoord.w;
        float _186 = _182 * _184;
        float _188 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _190 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _188;
        float _192 = fma(_109, 350.80767822265625, 53.62115478515625);
        float _194 = 1.0 / _190;
        float _196 = log2(_192);
        float _198 = _85 * _186;
        float _200 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _202 = _198 + _200;
        float _204 = _196 * 0.1155245304107666015625;
        float _206 = _202 * _194;
        float _208 = sqrt(_206);
        float2 _511 = float2(_204, _208);
        float3 _212 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_511, float2(0.0), isnan(_511))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_511, float2(0.0), isnan(_511))).xyz;
        float _214 = _212.x;
        float _216 = _212.y;
        float _218 = _212.z;
        _178 = _216;
        _170 = _218;
        _180 = _214;
    }
    float _220 = _178;
    float _222 = _170;
    float _224 = _180;
    float _226 = _136 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _228 = _138 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _230 = _140 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _232 = _142 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _234 = precise::clamp(_232, 0.0, 1.0);
    float _236 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _238 = _226 + _236;
    float _240 = _228 * _220;
    float _242 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _244 = _228 + _242;
    float _246 = _230 * _222;
    float _248 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _250 = _230 + _248;
    float _252 = _226 * _224;
    float _254 = _154 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _256 = fma(_234, _238, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _258 = fma(_234, _244, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _260 = fma(_234, _250, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _262 = fma(_252, _254, _256);
    float _264 = fma(_240, _254, _258);
    float _266 = fma(_246, _254, _260);
    float _268 = _262 * _132;
    float _270 = _264 * _132;
    float _272 = _266 * _132;
    float _274 = fma(_126, (*spvDescriptorSet0.fp_c4)._m0[13].y, _268);
    float _276 = fma(_128, (*spvDescriptorSet0.fp_c4)._m0[13].y, _270);
    float _278 = fma(_130, (*spvDescriptorSet0.fp_c4)._m0[13].y, _272);
    out.m_46.x = _274;
    out.m_46.y = _276;
    out.m_46.z = _278;
    out.m_46.w = 1.0;
    return out;
}

