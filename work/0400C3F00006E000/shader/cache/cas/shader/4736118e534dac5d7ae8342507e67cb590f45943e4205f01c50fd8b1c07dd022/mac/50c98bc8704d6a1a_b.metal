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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _926, thread const int& _927, constant _10& support_buffer)
{
    int _930 = 1 + _927;
    float _932 = support_buffer._m5[_930].x;
    float _934 = abs(_932);
    bool _936 = _934 == 1.0;
    if (_936)
    {
        return _926;
    }
    float _938 = float(_926);
    float _940 = _938 / _934;
    int _942 = int(_940);
    return _942;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_31.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_31.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _434 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_434, float2(0.0), isnan(_434))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_434, float2(0.0), isnan(_434))).x;
    float _68 = in.m_33.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _94 = precise::clamp(_92, 0.0, 1.0);
    float _96 = precise::max(_94, _90);
    bool _100 = _96 != 0.0;
    bool _102 = isnan(_96);
    bool _104 = _100 || _102;
    bool _106 = isnan(0.0);
    bool _108 = _104 || _106;
    float _110 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _112 = precise::clamp(_110, 0.0, 1.0);
    float _114 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _116 = precise::clamp(_114, 0.0, 1.0);
    float _118 = precise::min(_112, _116);
    bool _120 = !_108;
    if (!_120)
    {
        float _122 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _124 = fma(_96, _122, 1.0);
        float _126 = log2(_124);
        float _128 = _126 + (-1.0);
        float _130 = trunc(_128);
        int _132 = int(_130);
        int _134 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_132), spvDescriptorSet0.fp_t_tcb_A.get_height(_132)).x;
        int _136 = _134;
        int _138 = 1;
        int _140 = _42(_136, _138, (*spvDescriptorSet0.support_buffer));
        int _142 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_132), spvDescriptorSet0.fp_t_tcb_A.get_height(_132)).y;
        int _144 = _142;
        int _146 = 1;
        int _148 = _42(_144, _146, (*spvDescriptorSet0.support_buffer));
        float _150 = float(_140);
        float _152 = float(_148);
        float _154 = fma(_62, _150, -0.5);
        float _156 = fma(_64, _152, -0.5);
        float _158 = 1.0 / _150;
        float _160 = floor(_154);
        float _162 = floor(_156);
        float _164 = -_160;
        float _166 = _154 + _164;
        float _168 = -_166;
        float _170 = _168 + 1.0;
        float _172 = -_166;
        float _174 = _172 + 2.0;
        float _176 = -_162;
        float _178 = _156 + _176;
        float _180 = _170 * _170;
        float _182 = _174 * _174;
        float _184 = -_178;
        float _186 = _184 + 1.0;
        float _188 = _170 * _180;
        float _190 = -_178;
        float _192 = _190 + 2.0;
        float _194 = _186 * _186;
        float _196 = -_188;
        float _198 = _196 + 6.0;
        float _200 = _192 * _192;
        float _202 = _186 * _194;
        float _204 = _188 * 4.0;
        float _206 = _202 * 4.0;
        float _208 = -_204;
        float _210 = fma(_174, _182, _208);
        float _212 = -_202;
        float _214 = _212 + 6.0;
        float _216 = 1.0 / _152;
        float _218 = -_206;
        float _220 = fma(_192, _200, _218);
        float _222 = -_210;
        float _224 = _222 + _198;
        float _226 = _188 + _210;
        float _228 = _210 * 0.16666667163372039794921875;
        float _230 = _202 + _220;
        float _232 = -_220;
        float _234 = _232 + _214;
        float _236 = _224 * 0.16666667163372039794921875;
        float _238 = _226 * 0.16666667163372039794921875;
        float _240 = _230 * 0.16666667163372039794921875;
        float _242 = _234 * 0.16666667163372039794921875;
        float _244 = 1.0 / _236;
        float _246 = _166 * _166;
        float _248 = _178 * _178;
        float _250 = _220 * 0.16666667163372039794921875;
        float _252 = _166 * _246;
        float _254 = _162 + (-0.5);
        float _256 = _178 * _248;
        float _258 = 1.0 / _240;
        float _260 = _160 + (-0.5);
        float _262 = _160 + 1.5;
        float _264 = _252 * 0.16666667163372039794921875;
        float _266 = _162 + 1.5;
        float _268 = _256 * 0.16666667163372039794921875;
        float _270 = 1.0 / _242;
        float _272 = fma(_264, _244, _262);
        float _274 = _272 * _158;
        float _276 = 1.0 / _238;
        float _278 = fma(_250, _258, _254);
        float _280 = _278 * _216;
        float _282 = fma(_268, _270, _266);
        float _284 = _282 * _216;
        float _286 = fma(_228, _276, _260);
        float _288 = _286 * _158;
        float2 _736 = float2(_288, _280);
        float3 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_736, float2(0.0), isnan(_736)), level(_128)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_736, float2(0.0), isnan(_736)), level(_128)).xyz;
        float _294 = _292.x;
        float _296 = _292.y;
        float _298 = _292.z;
        float2 _751 = float2(_274, _280);
        float3 _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_751, float2(0.0), isnan(_751)), level(_128)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_751, float2(0.0), isnan(_751)), level(_128)).xyz;
        float _302 = _300.x;
        float _304 = _300.y;
        float _306 = _300.z;
        float2 _766 = float2(_288, _284);
        float3 _308 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_766, float2(0.0), isnan(_766)), level(_128)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_766, float2(0.0), isnan(_766)), level(_128)).xyz;
        float _310 = _308.x;
        float _312 = _308.y;
        float _314 = _308.z;
        float2 _781 = float2(_274, _284);
        float3 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_781, float2(0.0), isnan(_781)), level(_128)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_781, float2(0.0), isnan(_781)), level(_128)).xyz;
        float _318 = _316.x;
        float _320 = _316.y;
        float _322 = _316.z;
        float _324 = 0.0 + _126;
        float _326 = precise::clamp(_324, 0.0, 1.0);
        float _328 = fma(_86, _326, _88);
        float _330 = -_302;
        float _332 = _294 + _330;
        float _334 = -_304;
        float _336 = _296 + _334;
        float _338 = fma(_238, _332, _302);
        float _340 = -_306;
        float _342 = _298 + _340;
        float _344 = -_318;
        float _346 = _310 + _344;
        float _348 = -_320;
        float _350 = _312 + _348;
        float _352 = -_322;
        float _354 = _314 + _352;
        float _356 = fma(_238, _336, _304);
        float _358 = fma(_238, _346, _318);
        float _360 = fma(_238, _342, _306);
        float _362 = fma(_238, _350, _320);
        float _364 = fma(_238, _354, _322);
        float _366 = -_358;
        float _368 = _366 + _338;
        float _370 = -_362;
        float _372 = _370 + _356;
        float _374 = -_364;
        float _376 = _374 + _360;
        float _378 = fma(_240, _368, _358);
        float _380 = fma(_240, _372, _362);
        float _382 = fma(_240, _376, _364);
        float _384 = -_378;
        float _386 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[13].x, _384);
        float _388 = -_380;
        float _390 = fma(_380, (*spvDescriptorSet0.fp_c3)._m0[13].y, _388);
        float _392 = -_382;
        float _394 = fma(_382, (*spvDescriptorSet0.fp_c3)._m0[13].z, _392);
        float _396 = fma(_118, _386, _378);
        float _398 = fma(_118, _390, _380);
        float _400 = fma(_118, _394, _382);
        out.m_36.x = _396;
        out.m_36.y = _398;
        out.m_36.z = _400;
        out.m_36.w = _328;
        return out;
    }
    discard_fragment();
    return out;
}

