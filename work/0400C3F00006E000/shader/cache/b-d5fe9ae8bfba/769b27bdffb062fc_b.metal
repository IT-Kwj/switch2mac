#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _897, thread const int& _898, constant _10& support_buffer)
{
    int _901 = 1 + _898;
    float _903 = support_buffer._m5[_901].x;
    float _905 = abs(_903);
    bool _907 = _905 == 1.0;
    if (_907)
    {
        return _897;
    }
    float _909 = float(_897);
    float _911 = _909 / _905;
    int _913 = int(_911);
    return _913;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_31.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_31.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _430 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_430, float2(0.0), isnan(_430))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_430, float2(0.0), isnan(_430))).x;
    float _70 = in.m_33.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_35.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_33.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_35.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = _62 * _74;
    float _96 = _62 * _80;
    float _98 = _62 * _86;
    float _100 = _62 * _92;
    float _102 = -_68;
    float _104 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _106 = 1.0 / _104;
    float _108 = fma(_94, _106, _96);
    float _110 = precise::clamp(_108, 0.0, 1.0);
    bool _114 = _106 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _116 = fma(_98, _106, _100);
    float _118 = precise::clamp(_116, 0.0, 1.0);
    bool _120 = !_114;
    float _122 = _120 ? _110 : 0.0;
    float _124 = precise::max(_122, _118);
    bool _126 = _124 != 0.0;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan(0.0);
    bool _134 = _130 || _132;
    bool _136 = !_134;
    if (!_136)
    {
        float _138 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _140 = fma(_124, _138, 1.0);
        float _142 = log2(_140);
        float _144 = _142 + (-1.0);
        float _146 = trunc(_144);
        int _148 = int(_146);
        int _150 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_148), spvDescriptorSet0.fp_t_tcb_A.get_height(_148)).x;
        int _152 = _150;
        int _154 = 1;
        int _156 = _44(_152, _154, (*spvDescriptorSet0.support_buffer));
        int _158 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_148), spvDescriptorSet0.fp_t_tcb_A.get_height(_148)).y;
        int _160 = _158;
        int _162 = 1;
        int _164 = _44(_160, _162, (*spvDescriptorSet0.support_buffer));
        float _166 = float(_156);
        float _168 = float(_164);
        float _170 = fma(_64, _166, -0.5);
        float _172 = fma(_66, _168, -0.5);
        float _174 = 1.0 / _166;
        float _176 = floor(_170);
        float _178 = floor(_172);
        float _180 = -_176;
        float _182 = _170 + _180;
        float _184 = 1.0 / _168;
        float _186 = -_182;
        float _188 = _186 + 1.0;
        float _190 = -_182;
        float _192 = _190 + 2.0;
        float _194 = -_178;
        float _196 = _172 + _194;
        float _198 = _188 * _188;
        float _200 = -_196;
        float _202 = _200 + 1.0;
        float _204 = _188 * _198;
        float _206 = -_196;
        float _208 = _206 + 2.0;
        float _210 = _192 * _192;
        float _212 = _202 * _202;
        float _214 = _204 * 4.0;
        float _216 = _202 * _212;
        float _218 = _208 * _208;
        float _220 = -_214;
        float _222 = fma(_192, _210, _220);
        float _224 = -_204;
        float _226 = _224 + 6.0;
        float _228 = _216 * 4.0;
        float _230 = -_216;
        float _232 = _230 + 6.0;
        float _234 = _182 * _182;
        float _236 = -_222;
        float _238 = _236 + _226;
        float _240 = -_228;
        float _242 = fma(_208, _218, _240);
        float _244 = _196 * _196;
        float _246 = _182 * _234;
        float _248 = _238 * 0.16666667163372039794921875;
        float _250 = -_242;
        float _252 = _250 + _232;
        float _254 = _204 + _222;
        float _256 = _196 * _244;
        float _258 = _178 + (-0.5);
        float _260 = _252 * 0.16666667163372039794921875;
        float _262 = _216 + _242;
        float _264 = _254 * 0.16666667163372039794921875;
        float _266 = 1.0 / _248;
        float _268 = _242 * 0.16666667163372039794921875;
        float _270 = _262 * 0.16666667163372039794921875;
        float _272 = _176 + (-0.5);
        float _274 = _222 * 0.16666667163372039794921875;
        float _276 = _176 + 1.5;
        float _278 = _178 + 1.5;
        float _280 = _246 * 0.16666667163372039794921875;
        float _282 = 1.0 / _270;
        float _284 = _256 * 0.16666667163372039794921875;
        float _286 = 1.0 / _264;
        float _288 = fma(_280, _266, _276);
        float _290 = 1.0 / _260;
        float _292 = fma(_268, _282, _258);
        float _294 = _288 * _174;
        float _296 = _292 * _184;
        float _298 = fma(_274, _286, _272);
        float _300 = _298 * _174;
        float _302 = fma(_284, _290, _278);
        float _304 = _302 * _184;
        float2 _745 = float2(_300, _296);
        float3 _308 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_745, float2(0.0), isnan(_745)), level(_144)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_745, float2(0.0), isnan(_745)), level(_144)).xyz;
        float _310 = _308.x;
        float _312 = _308.y;
        float _314 = _308.z;
        float2 _760 = float2(_294, _296);
        float3 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_760, float2(0.0), isnan(_760)), level(_144)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_760, float2(0.0), isnan(_760)), level(_144)).xyz;
        float _318 = _316.x;
        float _320 = _316.y;
        float _322 = _316.z;
        float2 _775 = float2(_300, _304);
        float3 _324 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_775, float2(0.0), isnan(_775)), level(_144)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_775, float2(0.0), isnan(_775)), level(_144)).xyz;
        float _326 = _324.x;
        float _328 = _324.y;
        float _330 = _324.z;
        float2 _790 = float2(_294, _304);
        float3 _332 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_790, float2(0.0), isnan(_790)), level(_144)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_790, float2(0.0), isnan(_790)), level(_144)).xyz;
        float _334 = _332.x;
        float _336 = _332.y;
        float _338 = _332.z;
        float _340 = 0.0 + _142;
        float _342 = precise::clamp(_340, 0.0, 1.0);
        float _344 = -_318;
        float _346 = _310 + _344;
        float _348 = -_320;
        float _350 = _312 + _348;
        float _352 = -_322;
        float _354 = _314 + _352;
        float _356 = fma(_264, _346, _318);
        float _358 = fma(_264, _350, _320);
        float _360 = fma(_264, _354, _322);
        float _362 = -_334;
        float _364 = _326 + _362;
        float _366 = -_336;
        float _368 = _328 + _366;
        float _370 = -_338;
        float _372 = _330 + _370;
        float _374 = fma(_264, _364, _334);
        float _376 = fma(_264, _368, _336);
        float _378 = fma(_264, _372, _338);
        float _380 = -_374;
        float _382 = _380 + _356;
        float _384 = -_376;
        float _386 = _384 + _358;
        float _388 = -_378;
        float _390 = _388 + _360;
        float _392 = fma(_270, _382, _374);
        float _394 = fma(_270, _386, _376);
        float _396 = fma(_270, _390, _378);
        out.m_38.x = _392;
        out.m_38.y = _394;
        out.m_38.z = _396;
        out.m_38.w = _342;
        return out;
    }
    discard_fragment();
    return out;
}

