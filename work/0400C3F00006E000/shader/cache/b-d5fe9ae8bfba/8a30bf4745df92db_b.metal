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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _51;
    float _73 = _71 * _57;
    float _75 = _71 * _63;
    float _77 = _71 * _69;
    float _79 = _73 * _73;
    float _81 = fma(_75, _75, _79);
    float _83 = fma(_77, _77, _81);
    float _85 = rsqrt(_83);
    float _87 = _73 * _85;
    float _89 = _75 * _85;
    float _91 = _77 * _85;
    float _93 = _87 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _95 = _87 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _97 = fma(_89, (*spvDescriptorSet0.fp_c5)._m0[2].x, _93);
    float _99 = fma(_91, (*spvDescriptorSet0.fp_c5)._m0[2].z, _97);
    float _101 = fma(_95, 0.5, 0.5);
    float _103 = fma(_99, 0.5, 0.5);
    float2 _377 = float2(_103, _101);
    float4 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_377, float2(0.0), isnan(_377))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_377, float2(0.0), isnan(_377))).xyzw;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float _114 = _106.w;
    float _116 = in.m_37.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = 0.0 + _95;
    float _124 = precise::clamp(_122, 0.0, 1.0);
    float _126 = in.m_39.x;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = abs(_124);
    float _134 = log2(_132);
    float _136 = -(*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _138 = _136 + (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _140 = _134 * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _142 = exp2(_140);
    float _144 = _71 * _120;
    bool _148 = _95 >= _144;
    float _150 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _152 = fma(_99, (*spvDescriptorSet0.fp_c4)._m0[12].z, _150);
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = _99;
    float _158 = _134;
    float _160 = _144;
    if (!_148)
    {
        _156 = 0.0;
    }
    float _162 = _156;
    float _164 = _162;
    if (!_148)
    {
        _158 = 0.0;
        _160 = 0.0;
    }
    float _166 = _158;
    float _168 = _160;
    bool _170 = !_148;
    float _172 = _168;
    float _174 = _166;
    if (!_170)
    {
        float _176 = in.m_41.x;
        float _178 = gl_FragCoord.w;
        float _180 = _176 * _178;
        float _182 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _184 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _182;
        float _186 = 1.0 / _184;
        float _188 = _71 * _180;
        float _190 = fma(_95, 350.80767822265625, 53.62115478515625);
        float _192 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _194 = _188 + _192;
        float _196 = log2(_190);
        float _198 = _194 * _186;
        float _200 = sqrt(_198);
        float _202 = _196 * 0.1155245304107666015625;
        float2 _511 = float2(_202, _200);
        float3 _206 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_511, float2(0.0), isnan(_511))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_511, float2(0.0), isnan(_511))).xyz;
        float _208 = _206.x;
        float _210 = _206.y;
        float _212 = _206.z;
        _172 = _208;
        _174 = _210;
        _164 = _212;
    }
    float _214 = _172;
    float _216 = _174;
    float _218 = _164;
    float _220 = _108 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _222 = _110 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _224 = _112 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _226 = _114 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = _220 * _214;
    float _232 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _234 = _220 + _232;
    float _236 = _222 * _216;
    float _238 = _224 * _218;
    float _240 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _242 = _222 + _240;
    float _244 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _246 = _224 + _244;
    float _248 = _154 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _250 = fma(_228, _234, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _252 = fma(_228, _242, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _254 = fma(_228, _246, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _256 = _71 * _130;
    float _258 = fma(_230, _248, _250);
    float _260 = fma(_142, _138, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _262 = fma(_236, _248, _252);
    float _264 = fma(_238, _248, _254);
    float _266 = -_258;
    float _268 = _266 + (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _270 = _260 * _256;
    float _272 = -_262;
    float _274 = _272 + (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _276 = -_264;
    float _278 = _276 + (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _280 = fma(_270, _268, _258);
    float _282 = fma(_270, _274, _262);
    float _284 = fma(_270, _278, _264);
    out.m_44.x = _280;
    out.m_44.y = _282;
    out.m_44.z = _284;
    out.m_44.w = 1.0;
    return out;
}

