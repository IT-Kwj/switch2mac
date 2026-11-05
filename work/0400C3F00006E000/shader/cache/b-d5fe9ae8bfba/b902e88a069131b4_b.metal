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
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_31 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_29.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_29.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _350 = float2(_65, _67);
    float4 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_350, float2(0.0), isnan(_350))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_350, float2(0.0), isnan(_350))).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = in.m_31.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_33.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_35.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = _63 * _84;
    float _100 = _63 * _90;
    float _102 = _63 * _96;
    float _104 = in.m_33.z;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_37.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_37.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_37.z;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_31.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_31.y;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_31.z;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = _63 * _114;
    float _148 = _63 * _120;
    float _150 = _78 * _98;
    float _152 = _100 * _150;
    float _154 = 0.0 + _152;
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = _156 * _102;
    bool _162 = _158 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _164 = isnan(_158);
    bool _166 = _162 || _164;
    bool _168 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _170 = _166 || _168;
    float _172 = in.m_33.x;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_33.y;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    if (!_170)
    {
        discard_fragment();
    }
    float _184 = _74 * _74;
    float _186 = _72 * _72;
    float _188 = _63 * _176;
    float _190 = _63 * _182;
    float _192 = _63 * _108;
    float _194 = _63 * _126;
    float _196 = -_146;
    float _198 = _188 + _196;
    float _200 = -_148;
    float _202 = _190 + _200;
    float _204 = _76 * _76;
    float _206 = -_194;
    float _208 = _192 + _206;
    float _210 = fma(_186, _198, _146);
    float _212 = fma(_184, _202, _148);
    float _214 = _63 * _132;
    float _216 = fma(_204, _208, _194);
    float _218 = _63 * _138;
    float _220 = _63 * _144;
    float _222 = _210 * _214;
    float _224 = _212 * _218;
    float _226 = _216 * _220;
    if (!_170)
    {
        out.m_40.x = _222;
        out.m_40.y = _224;
        out.m_40.z = _226;
        out.m_40.w = _152;
        return out;
    }
    float _228 = in.m_42.w;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = _63 * _232;
    bool _236 = _234 != 1.0;
    bool _238 = isnan(_234);
    bool _240 = _236 || _238;
    bool _242 = isnan(1.0);
    bool _244 = _240 || _242;
    bool _246 = !_244;
    if (!_246)
    {
        float _248 = gl_FragCoord.x;
        float _250 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _252 = _248 / _250;
        float _254 = gl_FragCoord.y;
        float _256 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _258 = _254 / _256;
        float _260 = _234 * 256.0;
        float _262 = trunc(_260);
        int _265 = int(_262);
        float _267 = trunc(_252);
        int _269 = int(_267);
        float _271 = trunc(_258);
        int _273 = int(_271);
        int _275 = _269 + 2;
        int _277 = _275 >> 1;
        uint _280 = uint(int(uint(_273) >> uint(1)));
        int _282 = _277 ^ int(_280);
        int _284 = _282 << 16;
        int _286 = _284 ^ _277;
        int _288 = 983055 & _286;
        int _290 = _288 << 6;
        int _292 = _290 + _288;
        int _294 = _292 & 13369548;
        uint _296 = uint(int(uint(_294) >> uint(3)));
        int _298 = _294 | int(_296);
        uint _300 = uint(int(uint(_265) >> uint(7)));
        int _302 = int(_300) + _265;
        int _304 = _298 & 5570560;
        int _306 = _298 & 85;
        uint _308 = uint(int(uint(_304) >> uint(15)));
        int _310 = int(_308) + _306;
        bool _312 = uint(_302) > uint(_310);
        if (!_312)
        {
            discard_fragment();
        }
        if (!_312)
        {
            out.m_40.x = _222;
            out.m_40.y = _224;
            out.m_40.z = _226;
            out.m_40.w = _158;
            return out;
        }
    }
    float _314 = 0.0 + _158;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    out.m_40.x = 1.0;
    out.m_40.y = 1.0;
    out.m_40.z = 1.0;
    out.m_40.w = _316;
    return out;
}

