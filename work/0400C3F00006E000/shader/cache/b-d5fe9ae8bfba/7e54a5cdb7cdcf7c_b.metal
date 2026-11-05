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
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_31 [[user(locn3)]];
    float4 m_42 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _328 = float2(_65, _67);
    float4 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_328, float2(0.0), isnan(_328))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_328, float2(0.0), isnan(_328))).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = in.m_33.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_35.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_37.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = _63 * _84;
    float _100 = _63 * _90;
    float _102 = in.m_33.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_33.y;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_33.z;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = _63 * _96;
    float _122 = _78 * _98;
    float _124 = 0.0 + _122;
    float _126 = precise::clamp(_124, 0.0, 1.0);
    float _128 = _126 * _100;
    bool _132 = _128 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _134 = isnan(_128);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _140 = _136 || _138;
    float _142 = in.m_37.z;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_37.y;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    if (!_140)
    {
        discard_fragment();
    }
    float _154 = _72 * _72;
    float _156 = _74 * _74;
    float _158 = _76 * _76;
    float _160 = -_154;
    float _162 = _160 + 1.0;
    float _164 = -_156;
    float _166 = _164 + 1.0;
    float _168 = _120 * _162;
    float _170 = 0.0 + (*spvDescriptorSet0.fp_c7)._m0[0].x;
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = fma(_172, -0.5, 1.0);
    float _176 = _63 * _146;
    float _178 = _63 * _152;
    float _180 = -_158;
    float _182 = _180 + 1.0;
    float _184 = _178 * _166;
    float _186 = _176 * _182;
    float _188 = _63 * _106;
    float _190 = _63 * _112;
    float _192 = _63 * _118;
    float _194 = fma(_154, _188, _168);
    float _196 = fma(_156, _190, _184);
    float _198 = fma(_158, _192, _186);
    float _200 = _194 * _174;
    float _202 = _196 * _174;
    float _204 = _198 * _174;
    if (!_140)
    {
        out.m_40.x = _200;
        out.m_40.y = _202;
        out.m_40.z = _204;
        out.m_40.w = _122;
        return out;
    }
    float _206 = in.m_42.w;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = _63 * _210;
    bool _214 = _212 != 1.0;
    bool _216 = isnan(_212);
    bool _218 = _214 || _216;
    bool _220 = isnan(1.0);
    bool _222 = _218 || _220;
    bool _224 = !_222;
    if (!_224)
    {
        float _226 = gl_FragCoord.x;
        float _228 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _230 = _226 / _228;
        float _232 = gl_FragCoord.y;
        float _234 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _236 = _232 / _234;
        float _238 = _212 * 256.0;
        float _240 = trunc(_238);
        int _243 = int(_240);
        float _245 = trunc(_230);
        int _247 = int(_245);
        float _249 = trunc(_236);
        int _251 = int(_249);
        int _253 = _247 + 2;
        int _255 = _253 >> 1;
        uint _258 = uint(int(uint(_251) >> uint(1)));
        int _260 = _255 ^ int(_258);
        int _262 = _260 << 16;
        int _264 = _262 ^ _255;
        int _266 = 983055 & _264;
        int _268 = _266 << 6;
        int _270 = _268 + _266;
        int _272 = _270 & 13369548;
        uint _274 = uint(int(uint(_272) >> uint(3)));
        int _276 = _272 | int(_274);
        uint _278 = uint(int(uint(_243) >> uint(7)));
        int _280 = int(_278) + _243;
        int _282 = _276 & 5570560;
        int _284 = _276 & 85;
        uint _286 = uint(int(uint(_282) >> uint(15)));
        int _288 = int(_286) + _284;
        bool _290 = uint(_280) > uint(_288);
        if (!_290)
        {
            discard_fragment();
        }
        if (!_290)
        {
            out.m_40.x = _200;
            out.m_40.y = _202;
            out.m_40.z = _204;
            out.m_40.w = _128;
            return out;
        }
    }
    float _292 = 0.0 + _128;
    float _294 = precise::clamp(_292, 0.0, 1.0);
    out.m_40.x = 1.0;
    out.m_40.y = 1.0;
    out.m_40.z = 1.0;
    out.m_40.w = _294;
    return out;
}

