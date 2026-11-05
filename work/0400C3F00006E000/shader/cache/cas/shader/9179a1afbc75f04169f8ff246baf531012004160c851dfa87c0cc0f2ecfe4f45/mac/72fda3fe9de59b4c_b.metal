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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_91 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_61 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
};

static inline __attribute__((always_inline))
void _104(thread const int& _6193, thread const int& _6194, thread const int& _6195, thread const int& _6196, thread int& _6197, thread int& _6198, thread int& _6199, thread int& _6200, thread int& _6201, thread int& _6202, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _6205 = _6194;
    int _6207 = _6195;
    float _6209 = as_type<float>(_6193) + 0.0;
    bool _6211 = _6209 != 0.0;
    bool _6213 = isnan(_6209);
    bool _6215 = _6211 || _6213;
    bool _6217 = isnan(0.0);
    bool _6219 = _6215 || _6217;
    int _6221 = as_type<int>(_6209);
    int _6223 = _6219 ? (-1) : 0;
    if (!_6219)
    {
        float _6225 = as_type<float>(_6193) * 1.0;
        _6221 = as_type<int>(_6225);
    }
    int _6227 = _6221;
    bool _6229 = !_6219;
    int _6231 = _6227;
    if (!_6229)
    {
        float _6233 = as_type<float>(_6193) + 0.0;
        bool _6235 = _6233 >= 0.0;
        bool _6237 = isnan(_6233);
        bool _6239 = _6235 || _6237;
        bool _6241 = isnan(0.0);
        bool _6243 = _6239 || _6241;
        int _6245 = as_type<int>(_6233);
        _6223 = _6243 ? (-1) : 0;
        if (!_6243)
        {
            _6245 = 2147483647;
        }
        int _6247 = _6245;
        bool _6249 = !_6243;
        _6231 = _6247;
        if (!_6249)
        {
            float _6251 = abs(as_type<float>(_6193));
            float _6253 = _6251 + 0.0;
            bool _6255 = _6253 > as_type<float>(0x7f800000u /* inf */);
            bool _6257 = isnan(_6253);
            bool _6259 = _6255 || _6257;
            bool _6261 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _6263 = _6259 || _6261;
            int _6265 = as_type<int>(_6253);
            _6223 = _6263 ? (-1) : 0;
            if (_6263)
            {
                float _6267 = as_type<float>(_6193) + 1.0;
                _6265 = as_type<int>(_6267);
            }
            int _6269 = _6265;
            _6231 = _6269;
            if (!_6263)
            {
                float _6271 = abs(as_type<float>(_6193));
                float _6273 = _6271 + (-0.0);
                float _6275 = 0.0 + _6273;
                bool _6277 = _6275 != as_type<float>(0x7f800000u /* inf */);
                bool _6279 = isnan(_6275);
                bool _6281 = _6277 || _6279;
                bool _6283 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _6285 = _6281 || _6283;
                int _6287 = as_type<int>(_6275);
                _6223 = _6285 ? (-1) : 0;
                if (!_6285)
                {
                    _6287 = _6193;
                }
                int _6289 = _6287;
                bool _6291 = !_6285;
                _6231 = _6289;
                if (!_6291)
                {
                    float _6293 = as_type<float>(_6193) * 18446744073709551616.0;
                    float _6295 = rsqrt(_6293);
                    float _6297 = _6293 * _6295;
                    float _6299 = _6295 * 0.5;
                    float _6301 = -_6297;
                    float _6303 = 0.0 + _6301;
                    float _6305 = fma(_6299, _6303, 0.5);
                    float _6307 = fma(_6297, _6305, _6297);
                    float _6309 = -_6307;
                    float _6311 = 0.0 + _6309;
                    float _6313 = fma(_6307, _6311, _6293);
                    float _6315 = fma(_6299, _6313, _6307);
                    float _6317 = _6315 * 2.3283064365386962890625e-10;
                    _6231 = as_type<int>(_6317);
                    _6205 = as_type<int>(_6307);
                    _6207 = as_type<int>(_6303);
                }
            }
        }
    }
    int _6319 = _6231;
    int _6321 = _6205;
    int _6323 = _6207;
    int _6325 = _6223;
    _6197 = _6319;
    _6198 = _6196;
    _6199 = 0;
    _6200 = _6321;
    _6201 = _6323;
    _6202 = _6325;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2071 = false;
    bool _1198 = false;
    bool _880 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _112 = int(_110);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2429 = as_type<float>(_126);
        out.gl_Position.z = _2429;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_53.w;
    float _132 = float(_112);
    float _134 = -_130;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_130);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    bool _148 = _136 >= _132;
    bool _150 = !_146;
    bool _152 = _148 || _150;
    float _154 = _130;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _128 = as_type<int>(_158);
    }
    int _160 = _128;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2493 = as_type<float>(_160);
        out.gl_Position.z = _2493;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = 1.0 / _132;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _136 * _162;
    bool _168 = !_164;
    float _186;
    if (!_168)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        _186 = _166;
    }
    _188 = false;
    float _190 = _186;
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = in.m_59.x;
    float _200 = in.m_59.y;
    float _202 = in.m_59.z;
    float _204 = precise::max(_166, 0.949999988079071044921875);
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _208 = fma(_206, 10.0, 10.0);
    float _210 = fma(_166, 0.2000000476837158203125, 1.0);
    float _212 = in.m_48.x;
    float _214 = in.m_48.y;
    float _216 = in.m_48.z;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _224 = _222 != 0;
    float _226 = in.m_55.y;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = 1.0 / _220;
    float _234 = in.m_61.y;
    int _236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _238 = _236 != 0;
    float _240 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.10471977293491363525390625;
    float _242 = fma(_192, 2.0, -1.0);
    float _244 = 1.0 / _230;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _246;
    float _250 = fma(_194, 2.0, -1.0);
    float _252 = fma(_196, 2.0, -1.0);
    float _254 = 0.0;
    float _256 = _234;
    if (_224)
    {
        float _258 = in.m_55.x;
        _254 = _258;
    }
    float _260 = _254;
    float _262 = precise::min(_204, 1.0);
    float _264 = _240 * _208;
    float _266 = -_252;
    float _268 = _266 + _202;
    float _270 = 1.0 / _248;
    float _272 = _214 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _274 = _214 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _276 = _214 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _278 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[4].x, _272);
    float _280 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[5].x, _274);
    float _282 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[6].x, _276);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _190 + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = _190 + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = _190 + _292;
    float _296 = _242 * _210;
    float _298 = _286 * _244;
    float _300 = _294 * _232;
    bool _302 = _226 > 0.5;
    bool _304 = _302 && _238;
    float _306 = _290 * _270;
    float _308 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[5].z, _280);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _318 = fma(_262, -19.999996185302734375, 19.999996185302734375);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = -_242;
    float _326 = _324 + _198;
    float _328 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[4].z, _278);
    float _330 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[6].z, _282);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _332;
    bool _336 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _338 = isnan(_190);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _356 = fma(_312, _300, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = fma(_322, _300, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _360 = _308 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _362 = fma(_334, _300, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _364 = fma(_316, _298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _366 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _368 = isnan(_190);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = fma(_350, _298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _380 = fma(_354, _298, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _382 = -_346;
    float _384 = _382 + 1.0;
    float _386 = in.m_61.x;
    float _388 = _264 * 0.15915493667125701904296875;
    float _390 = _328 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _392 = -_360;
    float _394 = _392 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _396 = _260 > 0.5;
    bool _398 = _396 && _224;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _408;
    float _412 = _376 * _384;
    float _414 = -_376;
    float _416 = _414 + 1.0;
    float _418 = _330 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _420 = -_390;
    float _422 = _420 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _424 = _394 * _394;
    float _426 = fma(_402, _306, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _428 = fma(_406, _306, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _430 = fma(_410, _306, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _432 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _434 = isnan(_190);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -_418;
    float _446 = _444 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _448 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _450 = isnan(_190);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = fma(_422, _422, _424);
    float _462 = _388 * 6.283185482025146484375;
    float _464 = sin(_462);
    float _466 = _442 * _416;
    float _468 = -_442;
    float _470 = _468 + 1.0;
    float _472 = fma(_446, _446, _460);
    float _474 = _460;
    if (_304)
    {
        float _476 = -_234;
        float _478 = _476 + 1.0;
        _256 = _478;
    }
    float _480 = _256;
    float _482 = _458 * _470;
    float _484 = 0.0;
    if (_224)
    {
        _484 = _386;
    }
    float _486 = _484;
    float _488 = rsqrt(_472);
    float _490 = _486;
    if (!_224)
    {
        _474 = _386;
    }
    float _492 = _474;
    float _494 = _356 * _482;
    float _496 = _358 * _482;
    float _498 = -_458;
    float _500 = _498 + 1.0;
    float _502 = _362 * _482;
    float _504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _506 = _360 + _504;
    float _508 = _492;
    if (_398)
    {
        float _510 = -_486;
        float _512 = _510 + 1.0;
        _490 = _512;
    }
    float _514 = _490;
    float _516 = fma(_464, 0.150000035762786865234375, 1.0499999523162841796875);
    float _518 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].x, _494);
    float _520 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].y, _496);
    float _522 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].z, _502);
    float _524 = _516 * _318;
    float _526 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _528 = _390 + _526;
    float _530 = _506 * _506;
    float _532 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _534 = _418 + _532;
    float _536 = _446 * _488;
    float _538 = _394 * _488;
    float _540 = fma(_528, _528, _530);
    float _542 = _422 * _488;
    float _544 = _536 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _546 = _538 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _548 = fma(_534, _534, _540);
    float _550 = fma(_364, _466, _518);
    float _552 = -_544;
    float _554 = fma(_542, (*spvDescriptorSet0.vp_c10)._m0[10].y, _552);
    float _556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _558 = -_546;
    float _560 = fma(_536, (*spvDescriptorSet0.vp_c10)._m0[9].y, _558);
    float _562 = _542 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _564 = _554 * _554;
    float _566 = fma(_378, _466, _520);
    if (_224)
    {
        _508 = _514;
    }
    float _568 = _508;
    float _570 = -_562;
    float _572 = fma(_538, (*spvDescriptorSet0.vp_c10)._m0[8].y, _570);
    float _574 = fma(_560, _560, _564);
    float _576 = rsqrt(_548);
    float _578 = fma(_426, _412, _550);
    float _580 = _568 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _582 = fma(_380, _466, _522);
    float _584 = fma(_428, _412, _566);
    float _586 = -_250;
    float _588 = _586 + _200;
    float _590 = _480 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _592 = fma(_430, _412, _582);
    float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _596 = fma(_572, _572, _574);
    float _598 = _580 * _556;
    float _600 = in.m_63.x;
    float _602 = in.m_63.y;
    float _604 = in.m_63.z;
    float _606 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[146].x, _578);
    float _608 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[146].z, _592);
    float _610 = fma(_326, _524, _296);
    float _612 = rsqrt(_596);
    float _614 = _506 * _576;
    float _616 = _528 * _576;
    float _618 = -_614;
    float _620 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[18].w, _506);
    float _622 = -_616;
    float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _528);
    float _626 = _590 * _594;
    float _628 = _620 * _620;
    float _630 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[146].y, _584);
    float _632 = fma(_624, _624, _628);
    float _634 = fma(_588, _524, _250);
    out.m_65.x = _598;
    out.m_65.y = _626;
    float _636 = _560 * _612;
    float _638 = _572 * _612;
    float _640 = fma(_268, _524, _252);
    float _642 = in.m_67.x;
    float _644 = in.m_67.y;
    float _646 = in.m_67.z;
    float _648 = _636 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _650 = _634 != 0.0;
    bool _652 = isnan(_634);
    bool _654 = _650 || _652;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    float _660 = _630 * _602;
    float _662 = _608 * _604;
    float _664 = -_648;
    float _666 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[8].y, _664);
    float _668 = _554 * _612;
    float _670 = _638 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _672 = _610 == 0.0;
    bool _674 = !_658;
    bool _676 = _672 && _674;
    float _678 = _666 * _666;
    float _680 = _668 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _682 = -_670;
    float _684 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[10].y, _682);
    float _686 = _534 * _576;
    bool _688 = _640 == 0.0;
    bool _690 = _688 && _676;
    float _692 = -_680;
    float _694 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[9].y, _692);
    float _696 = fma(_684, _684, _678);
    float _698 = -_686;
    float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[18].w, _534);
    float _702 = _606 * _600;
    out.m_69.x = _610;
    out.m_69.y = _634;
    out.m_69.z = _640;
    float _704 = fma(_694, _694, _696);
    float _706 = fma(_700, _700, _632);
    float _708 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _610);
    float _710 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _634);
    float _712 = rsqrt(_704);
    float _714 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _640);
    float _716 = _644;
    float _718 = _642;
    float _720 = _646;
    if (!_690)
    {
        float _722 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[17].y, _644);
        _716 = _722;
    }
    float _724 = _716;
    if (!_690)
    {
        float _726 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[17].y, _642);
        _718 = _726;
    }
    float _728 = _718;
    if (!_690)
    {
        float _730 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[17].y, _646);
        _720 = _730;
    }
    float _732 = _720;
    float _734 = _724 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _736 = sqrt(_706);
    float _738 = _724 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _740 = _724 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _742 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[8].x, _734);
    float _744 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[9].x, _738);
    float _746 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[10].x, _740);
    float _748 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[8].z, _742);
    float _750 = _684 * _712;
    float _752 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[9].z, _744);
    float _754 = _666 * _712;
    float _756 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[10].z, _746);
    float _758 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _760 = _694 * _712;
    float _762 = _754 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _764 = _702 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _766 = _576 * _736;
    float _768 = fma(_750, (*spvDescriptorSet0.vp_c10)._m0[8].z, _762);
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _772 = _758 * _766;
    float _774 = _764 * _766;
    float _776 = _662 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _778 = _770 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _780 = _772 * _710;
    float _782 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[10].z, _768);
    float _784 = _774 * _708;
    float _786 = _776 * _766;
    float _788 = _780 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _790 = abs(_782);
    float _792 = -_790;
    float _794 = _792 + 1.0;
    float _796 = _780 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _798 = _780 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _800 = _786 * _714;
    float _802 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[8].x, _788);
    int _804 = as_type<int>(_794) + (-218103808);
    float _806 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[9].x, _796);
    float _808 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[10].x, _798);
    float _810 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[8].z, _802);
    bool _812 = uint(_804) >= 1920991232u;
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[9].z, _806);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[10].z, _808);
    float _818 = abs(_782);
    float _820 = fma(_818, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _822 = abs(_782);
    float _824 = fma(_822, _820, -0.212114393711090087890625);
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _834 = abs(_782);
    float _836 = fma(_834, _824, 1.570728778839111328125);
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _840 = _826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _842 = _828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _844 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _846 = _832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _848 = _838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _850 = _782 < 0.0;
    float _852 = float(_850);
    bool _854 = !_812;
    float _856 = _814;
    float _878;
    if (!_854)
    {
        int _858 = as_type<int>(_794);
        int _860 = as_type<int>(_660);
        int _862 = as_type<int>(_662);
        int _864 = 4672;
        int _866;
        int _868;
        int _870;
        int _872;
        int _874;
        int _876;
        _104(_858, _860, _862, _864, _866, _868, _870, _872, _874, _876, out.gl_Position, out.gl_PointSize);
        _878 = as_type<float>(_866);
        _880 = true;
    }
    else
    {
        float _882 = rsqrt(_794);
        float _884 = _794 * _882;
        float _886 = _882 * 0.5;
        float _888 = -_884;
        float _890 = 0.0 + _888;
        float _892 = fma(_886, _890, 0.5);
        float _894 = fma(_884, _892, _884);
        float _896 = -_894;
        float _898 = 0.0 + _896;
        float _900 = fma(_894, _898, _794);
        float _902 = fma(_886, _900, _894);
        _878 = _902;
    }
    _880 = false;
    float _904 = _878;
    float _906 = _760 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _908 = _754 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _910 = _836 * _904;
    float _912 = -_906;
    float _914 = fma(_750, (*spvDescriptorSet0.vp_c10)._m0[10].z, _912);
    float _916 = _750 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _918 = -_908;
    float _920 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[9].z, _918);
    float _922 = _914 * _914;
    float _924 = -_916;
    float _926 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[8].z, _924);
    float _928 = fma(_920, _920, _922);
    float _930 = fma(_926, _926, _928);
    float _932 = _852 * 2.0;
    float _934 = -_932;
    float _936 = fma(_910, _934, _910);
    float _938 = rsqrt(_930);
    float _940 = fma(_852, 3.1415927410125732421875, _936);
    float _942 = _940 * 0.15915493667125701904296875;
    float _944 = _942 * 6.283185482025146484375;
    float _946 = cos(_944);
    float _948 = _914 * _938;
    float _950 = _920 * _938;
    float _952 = _926 * _938;
    float _954 = _948 * _948;
    float _956 = _942 * 6.283185482025146484375;
    float _958 = sin(_956);
    float _960 = fma(_950, _950, _954);
    float _962 = -_946;
    float _964 = _962 + 1.0;
    float _966 = fma(_952, _952, _960);
    float _968 = rsqrt(_966);
    float _970 = _952 * _968;
    float _972 = _950 * _968;
    float _974 = _948 * _968;
    float _976 = _970 * _958;
    float _978 = _972 * _964;
    float _980 = _972 * _958;
    float _982 = _974 * _964;
    float _984 = _974 * _958;
    float _986 = -_976;
    float _988 = fma(_974, _978, _986);
    float _990 = _970 * _970;
    float _992 = fma(_970, _982, _980);
    float _994 = fma(_972, _978, _946);
    float _996 = _814 * _988;
    float _998 = -_984;
    float _1000 = fma(_970, _978, _998);
    float _1002 = _814 * _992;
    float _1004 = fma(_964, _990, _946);
    float _1006 = fma(_810, _994, _996);
    float _1008 = fma(_970, _978, _984);
    float _1010 = fma(_810, _1000, _1002);
    float _1012 = fma(_974, _978, _976);
    float _1014 = fma(_816, _1008, _1006);
    float _1016 = fma(_816, _1004, _1010);
    float _1018 = _390 + _1014;
    float _1020 = _418 + _1016;
    float _1022 = fma(_974, _982, _946);
    float _1024 = -_980;
    float _1026 = fma(_970, _982, _1024);
    float _1028 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1030 = _1018 + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1034 = _1020 + _1032;
    float _1036 = _814 * _1022;
    float _1038 = _1030 * _1030;
    float _1040 = _1034 * _1034;
    float _1042 = fma(_810, _1012, _1036);
    float _1044 = _1038 + _1040;
    float _1046 = fma(_816, _1026, _1042);
    float _1048 = sqrt(_1044);
    float _1050 = _360 + _1046;
    bool _1052 = _1048 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1054 = _1042;
    float _1056 = _1018;
    float _1058 = _1036;
    float _1060 = _1038;
    float _1062 = _946;
    float _1064 = _1050;
    float _1066 = _970;
    if (!_1052)
    {
        _1054 = _1018;
    }
    float _1068 = _1054;
    float _1070 = _1068;
    if (!_1052)
    {
        _856 = _1040;
    }
    float _1072 = _856;
    float _1074 = _1072;
    if (!_1052)
    {
        _1056 = _1020;
    }
    float _1076 = _1056;
    float _1078 = _1076;
    if (!_1052)
    {
        _1058 = _1050;
    }
    float _1080 = _1058;
    bool _1082 = !_1052;
    float _1084 = _1080;
    if (!_1082)
    {
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1090 = _1048 + _1088;
        float _1092 = _1050 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1094 = rsqrt(_1044);
        float _1096 = _1090 * _1086;
        float _1098 = _1096 * 0.15915493667125701904296875;
        float _1100 = _1098 * 6.283185482025146484375;
        float _1102 = sin(_1100);
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = cos(_1104);
        float _1108 = fma(_1102, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1110 = _1094 * _1108;
        float _1112 = _1106 + (-1.0);
        float _1114 = _1034 * _1110;
        float _1116 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = _1030 * _1110;
        float _1120 = fma(_1050, _1106, _1116);
        float _1122 = _1118 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1124 = _1114 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1126 = _1118 * _1118;
        float _1128 = _1114 * _1114;
        _1084 = _1120;
        _1060 = _1126;
        _1074 = _1128;
        _1070 = _1122;
        _1078 = _1124;
        _1062 = _1098;
    }
    float _1130 = _1084;
    float _1132 = _1060;
    float _1134 = _1074;
    float _1136 = _1070;
    float _1138 = _1078;
    float _1140 = _1062;
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1144 = _1130 + _1142;
    out.m_71.x = _840;
    out.m_71.y = _842;
    out.m_71.z = _778;
    float _1146 = fma(_1144, _1144, _1132);
    out.m_73.x = _844;
    out.m_73.y = _846;
    out.m_73.z = _848;
    float _1148 = _1146 + _1134;
    out.m_75.x = _748;
    out.m_75.y = _752;
    out.m_75.z = _756;
    float _1150 = sqrt(_1148);
    bool _1152 = _1150 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1154 = isnan(_1150);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1160 = _1156 || _1158;
    float _1162 = _1132;
    if (!_1160)
    {
        _1162 = 1.0;
    }
    float _1164 = _1162;
    bool _1166 = !_1160;
    float _1168 = _1164;
    if (!_1166)
    {
        bool _1170 = _1150 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1172 = isnan(_1150);
        bool _1174 = _1170 || _1172;
        bool _1176 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1178 = _1174 || _1176;
        if (!_1178)
        {
            float _1180 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1182 = _1150 + _1180;
            float _1184 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1186 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1184;
            float _1188 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1190 = _1188 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1192 = 1.0 / _1186;
            float _1194 = _1182 * _1192;
            float _1196 = fma(_1194, _1190, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1168 = _1196;
            _1198 = true;
        }
        else
        {
            bool _1200 = _1150 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1202 = isnan(_1150);
            bool _1204 = _1200 || _1202;
            bool _1206 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1208 = _1204 || _1206;
            if (!_1208)
            {
                float _1210 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1212 = _1150 + _1210;
                float _1214 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1216 = _1214 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1218 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1220 = _1218 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1222 = 1.0 / _1216;
                float _1224 = _1212 * _1222;
                float _1226 = fma(_1224, _1220, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1168 = _1226;
                _1198 = true;
            }
            else
            {
                _1168 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1198 = false;
    float _1228 = _1168;
    float _1230 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1232 = _1130 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1236 = _1136 + _1234;
    float _1238 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1240 = _1138 + _1238;
    float _1242 = -_614;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _360);
    float _1246 = fma(_1232, _1228, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1248 = fma(_1236, _1228, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1250 = fma(_1240, _1228, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1252 = -_616;
    float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _390);
    float _1256 = -_614;
    float _1258 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1246);
    float _1260 = -_616;
    float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1248);
    float _1264 = -_686;
    float _1266 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1250);
    float _1268 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1270 = _1258 + _1268;
    float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1274 = _1262 + _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1278 = _1266 + _1276;
    float _1280 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1282 = _1270 * _1270;
    float _1284 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1286 = fma(_1274, _1274, _1282);
    float _1288 = precise::max(0.0, _1284);
    float _1290 = fma(_1278, _1278, _1286);
    float _1292 = rsqrt(_1290);
    float _1294 = _1274 * _1292;
    float _1296 = _1278 * _1292;
    float _1298 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1300 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1302 = _1298 * _1298;
    float _1304 = _1300 * _1300;
    float _1306 = _1302 + _1304;
    float _1308 = sqrt(_1306);
    bool _1310 = _1308 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1314 = _1308 + _1312;
    float _1316 = _778;
    float _1318 = _1314;
    float _1320 = _1302;
    if (_1310)
    {
        float _1322 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1316 = _1322;
    }
    float _1324 = _1316;
    if (_1310)
    {
        float _1326 = rsqrt(_1306);
        _1064 = _1326;
    }
    float _1328 = _1064;
    float _1330 = _1328;
    if (_1310)
    {
        float _1332 = _1314 * _1324;
        _1318 = _1332;
    }
    float _1334 = _1318;
    float _1336 = -_686;
    float _1338 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[18].w, _418);
    if (_1310)
    {
        float _1340 = _1334 * 0.15915493667125701904296875;
        _1066 = _1340;
    }
    float _1342 = _1066;
    float _1344 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1280);
    float _1346 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1348 = _1270 * _1292;
    float _1350 = _1140;
    float _1352 = _1346;
    if (_1310)
    {
        float _1354 = _1342 * 6.283185482025146484375;
        float _1356 = sin(_1354);
        _1350 = _1356;
    }
    float _1358 = _1350;
    float _1360 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1344);
    float _1362 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1346);
    float _1364 = -_1348;
    float _1366 = -_1288;
    float _1368 = fma(_1364, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1366);
    float _1370 = _1360 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1372 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1362);
    float _1374 = _1360;
    float _1376 = _1370;
    if (_1310)
    {
        float _1378 = _1368 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1352 = _1378;
    }
    float _1380 = _1352;
    float _1382 = _1284;
    if (_1310)
    {
        float _1384 = _1342 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        _1382 = _1386;
    }
    float _1388 = _1382;
    if (!_1310)
    {
        _1374 = _1298;
    }
    float _1390 = _1374;
    float _1392 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1394 = fma(_1338, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1396 = 1.0 / _1370;
    float _1398 = _1358;
    float _1400 = _1392;
    float _1402 = _1390;
    if (_1310)
    {
        float _1404 = fma(_1358, _1380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1398 = _1404;
    }
    float _1406 = _1398;
    float _1408 = fma(_1254, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1410 = _1392 + _1370;
    float _1412 = _1406;
    if (_1310)
    {
        float _1414 = _1328 * _1406;
        _1330 = _1414;
    }
    float _1416 = _1330;
    if (!_1310)
    {
        _1412 = _1368;
    }
    float _1418 = _1412;
    float _1420 = _1418;
    if (_1310)
    {
        float _1422 = _1388 + (-1.0);
        _1400 = _1422;
    }
    float _1424 = _1400;
    float _1426 = _1424;
    if (_1310)
    {
        float _1428 = _1298 * _1416;
        _1402 = _1428;
    }
    float _1430 = _1402;
    float _1432 = floor(_1408);
    float _1434 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1436 = _1432;
    if (_1310)
    {
        float _1438 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1376 = _1438;
    }
    float _1440 = _1376;
    float _1442 = _1440;
    if (!_1310)
    {
        _1426 = _1300;
    }
    float _1444 = _1426;
    float _1446 = _1444;
    if (_1310)
    {
        float _1448 = _1300 * _1416;
        _1446 = _1448;
    }
    float _1450 = _1446;
    if (_1310)
    {
        float _1452 = _1430 * _1430;
        _1320 = _1452;
    }
    float _1454 = _1320;
    float _1456 = _1410 * _1396;
    float _1458 = _1456 * 0.5;
    float _1460 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1310)
    {
        float _1462 = fma(_1368, _1388, _1440);
        _1420 = _1462;
    }
    float _1464 = _1420;
    if (!_1310)
    {
        _1442 = _1304;
    }
    float _1466 = _1442;
    float _1468 = _1466;
    if (_1310)
    {
        float _1470 = _1450 * _1450;
        _1468 = _1470;
    }
    float _1472 = _1468;
    float _1474 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1460);
    float _1476 = fma(_1464, _1464, _1454);
    float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1480 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1478);
    float _1482 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1474);
    float _1484 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1486 = _1476 + _1472;
    float _1488 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1490 = _1482 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1492 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1494 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1484);
    float _1496 = rsqrt(_1486);
    float _1498 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1500 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1492);
    bool _1502 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan(0.5);
    bool _1510 = _1506 || _1508;
    float _1512 = -_1498;
    float _1514 = fma(_1512, _1488, 1.0);
    float _1516 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1494);
    float _1518 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1500);
    float _1520 = sqrt(_1290);
    float _1522 = _1516 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1524 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1526 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1528 = _1496 * _1430;
    float _1530 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1532 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1526);
    float _1534 = 1.0 / _1480;
    float _1536 = _1496 * _1464;
    float _1538 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1530);
    float _1540 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1532);
    float _1542 = _1496 * _1450;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1546 = fma(_1520, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1544);
    float _1548 = precise::clamp(_1546, 0.0, 1.0);
    float _1550 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1538);
    float _1552 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1554 = floor(_1394);
    float _1556 = _1528 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1558 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1560 = -_1548;
    float _1562 = _1560 + 1.0;
    float _1564 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1566 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1540);
    float _1568 = -_1556;
    float _1570 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1568);
    float _1572 = log2(_1514);
    float _1574 = _1550;
    float _1576 = _1566;
    if (_1510)
    {
        _1574 = 1.0;
    }
    float _1578 = _1574;
    float _1580 = -_1542;
    float _1582 = fma(_1580, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1570);
    float _1584 = _1578;
    if (_1510)
    {
        _1434 = 1.0;
    }
    float _1586 = _1434;
    float _1588 = 1.0 / _1566;
    float _1590 = fma(_1582, -0.5, 0.5);
    float _1592 = abs(_1562);
    float _1594 = log2(_1592);
    float _1596 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1552);
    float _1598 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1600 = _1534 * _1598;
    float _1602 = _1586;
    if (!_1510)
    {
        float _1604 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1606 = _1604 * 0.15915493667125701904296875;
        float _1608 = _1606 * 6.283185482025146484375;
        float _1610 = cos(_1608);
        float _1612 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1614 = _1612 * 0.15915493667125701904296875;
        float _1616 = _1606 * 6.283185482025146484375;
        float _1618 = sin(_1616);
        float _1620 = 1.0 / _1610;
        float _1622 = _1614 * 6.283185482025146484375;
        float _1624 = cos(_1622);
        float _1626 = _1618 * _1620;
        float _1628 = _1614 * 6.283185482025146484375;
        float _1630 = sin(_1628);
        float _1632 = _1624 * _1626;
        float _1634 = 1.0 / _1632;
        float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1638 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1636;
        float _1640 = 1.0 / _1638;
        float _1642 = _1630 * _1634;
        float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1646 = fma(_1600, _1642, _1644);
        float _1648 = _1646 * _1640;
        float _1650 = precise::clamp(_1648, 0.0, 1.0);
        _1584 = _1650;
    }
    float _1652 = _1584;
    if (!_1510)
    {
        float _1654 = in.m_77.w;
        bool _1656 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 1;
        bool _1658 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 2;
        bool _1660 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 3;
        int _1662 = as_type<int>(_1654) << 16;
        int _1664 = as_type<int>(_1654) << 8;
        int _1666 = as_type<int>(_1654) << 24;
        int _1668 = _1662 >> 24;
        int _1670 = _1664 >> 24;
        int _1672 = as_type<int>(_1654) >> 24;
        int _1674 = _1666 >> 24;
        float _1676 = float(_1668);
        float _1678 = float(_1670);
        float _1680 = float(_1672);
        float _1682 = _1676 * 0.0078740157186985015869140625;
        float _1684 = float(_1674);
        float _1686 = _1678 * 0.0078740157186985015869140625;
        float _1688 = _1680 * 0.0078740157186985015869140625;
        float _1690 = precise::min(_1682, 1.0);
        float _1692 = _1684 * 0.0078740157186985015869140625;
        float _1694 = precise::min(_1686, 1.0);
        float _1696 = precise::min(_1688, 1.0);
        float _1698 = precise::min(_1692, 1.0);
        float _1700 = precise::max(_1690, -1.0);
        float _1702 = precise::max(_1694, -1.0);
        float _1704 = precise::max(_1696, -1.0);
        float _1706 = precise::max(_1698, -1.0);
        float _1708 = _1706;
        if (_1656)
        {
            _1708 = _1700;
        }
        float _1710 = _1708;
        float _1712 = _1710;
        if (_1658)
        {
            _1712 = _1702;
        }
        float _1714 = _1712;
        float _1716 = _1714;
        if (_1660)
        {
            _1716 = _1704;
        }
        float _1718 = _1716;
        float _1720 = abs(_1718);
        float _1722 = (-0.0) + _1720;
        _1602 = _1722;
    }
    float _1724 = _1602;
    bool _1726 = _1724 != 0.0;
    bool _1728 = isnan(_1724);
    bool _1730 = _1726 || _1728;
    bool _1732 = isnan(0.0);
    bool _1734 = _1730 || _1732;
    float _1736 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1564);
    float _1738 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1596);
    float _1740 = sqrt(_1590);
    float _1742 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1744 = fma(_1582, 0.5, 0.5);
    float _1746 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1736);
    float _1748 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1738);
    float _1750 = -_1432;
    float _1752 = _1408 + _1750;
    float _1754 = fma(_1744, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1756 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1746);
    float _1758 = exp2(_1742);
    float _1760 = -_1554;
    float _1762 = _1394 + _1760;
    float _1764 = fma(_1744, _1754, -0.212114393711090087890625);
    float _1766 = _1754;
    if (_1734)
    {
        _1766 = _1748;
    }
    float _1768 = _1766;
    float _1770 = _1536 + 1.0;
    float _1772 = _1768;
    if (_1734)
    {
        _1436 = _1756;
    }
    float _1774 = _1436;
    float _1776 = fma(_1744, _1764, 1.570728778839111328125);
    float _1778 = _1774;
    if (!_1734)
    {
        _1772 = 0.0;
    }
    float _1780 = _1772;
    float _1782 = _1740 * 0.636619746685028076171875;
    if (!_1734)
    {
        _1778 = 0.0;
    }
    float _1784 = _1778;
    float _1786 = _1572 * 0.693147182464599609375;
    float2 _5131 = float2(_1752, _1762);
    float _1788 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5131, float2(0.0), isnan(_5131)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5131, float2(0.0), isnan(_5131)), level(0.0)).x;
    float _1790 = _1588 * _1780;
    float _1792 = -_1776;
    float _1794 = fma(_1782, _1792, 1.0);
    float _1796 = _1588 * _1784;
    float _1798 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1800 = -_1536;
    float _1802 = fma(_1758, _1770, _1800);
    float _1804 = fma(_1790, 0.5, 0.5);
    float _1806 = fma(_1796, -0.5, 0.5);
    float _1808 = fma(_1802, 0.5, 0.5);
    float3 _5169 = float3(_1804, _1806, _1798);
    float _1810 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5169, float3(0.0), isnan(_5169)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5169, float3(0.0), isnan(_5169)), level(0.0)).x;
    float3 _5180 = float3(_1804, _1806, _1798);
    float4 _1813 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5180, float3(0.0), isnan(_5180)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5180, float3(0.0), isnan(_5180)), level(0.0)).xyzw;
    float _1815 = _1813.x;
    float _1817 = _1813.y;
    float _1819 = _1813.z;
    float _1821 = _1813.w;
    float2 _5196 = float2(_1794, _1808);
    float3 _1825 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5196, float2(0.0), isnan(_5196)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5196, float2(0.0), isnan(_5196)), level(0.0)).xyz;
    float _1827 = _1825.x;
    float _1829 = _1825.y;
    float _1831 = _1825.z;
    float _1833 = abs(_1600);
    float _1835 = log2(_1833);
    float _1837 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1839 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_79.x = _1262;
    out.m_79.y = _1258;
    out.m_79.z = _1266;
    float _1841 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1837);
    bool _1843 = _1520 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1845 = isnan(_1520);
    bool _1847 = _1843 || _1845;
    bool _1849 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1851 = _1847 || _1849;
    bool _1853 = _1600 <= 8000.0;
    bool _1855 = isnan(_1600);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan(8000.0);
    bool _1861 = _1857 || _1859;
    float _1863 = float(_1861);
    float _1865 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1867 = exp2(_1839);
    float _1869 = exp2(_1865);
    float _1871 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1841);
    float _1873 = _1652 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1875 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1871);
    float _1877 = _1873 * _1724;
    float _1879 = in.m_77.x;
    float _1881 = -_1867;
    float _1883 = _1881 + 1.0;
    out.gl_Position.x = _1748;
    out.gl_Position.y = _1756;
    out.gl_Position.z = _1875;
    out.gl_Position.w = _1566;
    float _1885 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1887 = _1804;
    float _1889 = _1875;
    if (!_1734)
    {
        _1887 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1891 = _1887;
    float _1893 = fma(_1869, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1895 = precise::clamp(_1893, 0.0, 1.0);
    float _1897 = fma(_1895, -2.0, 3.0);
    float _1899 = _1895 * _1895;
    float _1901 = _1899 * _1897;
    float _1903 = -_1901;
    float _1905 = _1903 + 1.0;
    float _1907 = fma(_1905, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1901);
    float _1909 = _1875 + _1566;
    int _1911 = as_type<int>(_1909);
    float _1913 = 0.0;
    float _1915 = 0.0;
    if (!_1851)
    {
        _1576 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1917 = _1576;
    float _1919 = _1863 * _1907;
    float _1921 = _1909 * 0.5;
    float _1923 = _1917;
    float _1925 = _1917;
    if (!_1734)
    {
        float _1927 = _1891 * 5.0;
        _1911 = as_type<int>(_1927);
    }
    int _1929 = _1911;
    float _1931 = as_type<float>(_1929);
    if (!_1851)
    {
        _1889 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1933 = _1889;
    float _1935 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_81.z = _1921;
    out.m_81.w = _1566;
    float _1937 = _1933;
    float _1939 = _1933;
    if (!_1734)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5396 = as_type<float>(_1929);
        out.gl_Position.z = _5396;
    }
    if (_1734)
    {
        _1931 = _1877;
    }
    float _1941 = _1931;
    float _1943 = _1941;
    if (!_1851)
    {
        _1913 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1945 = _1913;
    float _1947 = _1945;
    float _1949 = _1945;
    if (!_1851)
    {
        _1915 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1951 = _1915;
    float _1953 = _1951;
    float _1955 = _1951;
    if (!_1734)
    {
        _1943 = 0.0;
    }
    float _1957 = _1943;
    float _1959 = -_1788;
    float _1961 = _1959 + 1.0;
    float _1963 = _1961 * _1935;
    float _1965 = precise::clamp(_1963, 0.0, 1.0);
    float _1967 = -_1965;
    float _1969 = fma(_1967, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1971 = _1885 * _1810;
    float _1973 = _1969 * _1879;
    float _1975 = -_1885;
    float _1977 = _1975 + 1.0;
    float _1979 = _1821 * _1971;
    float _1981 = _1831 * _1971;
    float _1983 = _1973 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1985 = _1821 * _1977;
    float _1987 = fma(_1827, _1979, _1815);
    float _1989 = fma(_1829, _1979, _1817);
    float _1991 = fma(_1821, _1981, _1819);
    out.m_83.x = _1983;
    float _1993 = _1979;
    float _1995 = _1981;
    if (!_1851)
    {
        _1993 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1997 = _1993;
    float _1999 = _1997;
    float _2001 = _1997;
    if (!_1851)
    {
        _1995 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2003 = _1995;
    out.m_85.x = _1987;
    out.m_85.y = _1989;
    out.m_85.z = _1991;
    out.m_85.w = _1985;
    bool _2005 = !_1851;
    float _2007 = _2003;
    float _2009 = _2003;
    if (!_2005)
    {
        bool _2011 = _1520 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2013 = isnan(_1520);
        bool _2015 = _2011 || _2013;
        bool _2017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2019 = _2015 || _2017;
        if (!_2019)
        {
            float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2023 = _1520 + _2021;
            float _2025 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2027 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2025;
            float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2031 = _2029 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2033 = 1.0 / _2027;
            float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2037 = _2035 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2041 = _2039 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2045 = _2043 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2047 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2049 = _2047 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2051 = _2023 * _2033;
            float _2053 = precise::clamp(_2051, 0.0, 1.0);
            float _2055 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2057 = _2055 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2059 = fma(_2053, _2031, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2061 = fma(_2053, _2057, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2063 = fma(_2053, _2037, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2065 = fma(_2053, _2041, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2067 = fma(_2053, _2045, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2069 = fma(_2053, _2049, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1949 = _2059;
            _1939 = _2065;
            _1955 = _2063;
            _2001 = _2067;
            _1925 = _2061;
            _2009 = _2069;
            _2071 = true;
        }
        else
        {
            bool _2073 = _1520 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2075 = isnan(_1520);
            bool _2077 = _2073 || _2075;
            bool _2079 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2081 = _2077 || _2079;
            if (!_2081)
            {
                _1947 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2083 = _1947;
            _1949 = _2083;
            if (!_2081)
            {
                _1953 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2085 = _1953;
            _1955 = _2085;
            if (!_2081)
            {
                _1923 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2087 = _1923;
            _1925 = _2087;
            if (!_2081)
            {
                _1937 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2089 = _1937;
            _1939 = _2089;
            if (!_2081)
            {
                _1999 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2091 = _1999;
            _2001 = _2091;
            if (!_2081)
            {
                _2007 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2093 = _2007;
            bool _2095 = !_2081;
            _2009 = _2093;
            if (!_2095)
            {
                bool _2097 = _1520 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2099 = isnan(_1520);
                bool _2101 = _2097 || _2099;
                bool _2103 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2105 = _2101 || _2103;
                if (!_2105)
                {
                    float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2109 = _1520 + _2107;
                    float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2113 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2111;
                    float _2115 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2117 = _2115 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2119 = 1.0 / _2113;
                    float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2123 = _2121 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2125 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2127 = _2125 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2129 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2131 = _2129 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2133 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2135 = _2133 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2137 = _2109 * _2119;
                    float _2139 = precise::clamp(_2137, 0.0, 1.0);
                    float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2143 = _2141 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2145 = fma(_2139, _2117, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2147 = fma(_2139, _2143, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2149 = fma(_2139, _2123, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2151 = fma(_2139, _2127, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2153 = fma(_2139, _2131, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2155 = fma(_2139, _2135, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1949 = _2145;
                    _1939 = _2151;
                    _1955 = _2149;
                    _2001 = _2153;
                    _1925 = _2147;
                    _2009 = _2155;
                    _2071 = true;
                }
                else
                {
                    _1949 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1939 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1955 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2001 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1925 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2009 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2071 = false;
    float _2157 = _1949;
    float _2159 = _1939;
    float _2161 = _1955;
    float _2163 = _2001;
    float _2165 = _1925;
    float _2167 = _2009;
    float _2169 = fma(_752, -0.5, 0.5);
    float _2171 = precise::clamp(_2169, 0.0, 1.0);
    float _2173 = -_2157;
    float _2175 = _2173 + _2159;
    float _2177 = -_2161;
    float _2179 = _2177 + _2163;
    out.m_87.x = 0.0;
    float _2181 = fma(_2171, _2175, _2157);
    float _2183 = fma(_2171, _2179, _2161);
    out.m_51.x = 1.0;
    float _2185 = -_2165;
    float _2187 = _2185 + _2167;
    bool _2189 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2191 = _2183 * 0.586610972881317138671875;
    float _2193 = fma(_2171, _2187, _2165);
    float _2195 = _1957 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2197 = fma(_2181, 0.298911988735198974609375, _2191);
    out.m_89.x = 0.0;
    bool _2199 = _1652 > 0.0;
    bool _2201 = isnan(_1652);
    bool _2203 = _2199 || _2201;
    bool _2205 = isnan(0.0);
    bool _2207 = _2203 || _2205;
    float _2209 = fma(_2193, 0.114477999508380889892578125, _2197);
    out.m_83.w = _2195;
    float _2211 = -_2209;
    float _2213 = _2181 + _2211;
    float _2215 = -_2209;
    float _2217 = _2183 + _2215;
    float _2219 = -_2209;
    float _2221 = _2193 + _2219;
    float _2223 = fma(_2213, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2209);
    float _2225 = fma(_2217, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2209);
    float _2227 = fma(_2221, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2209);
    bool _2229 = !_2189;
    if (!_2229)
    {
        float _2231 = -_1258;
        float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2235 = -_1262;
        float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2239 = -_1266;
        float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2243 = _2233 * _2233;
        float _2245 = fma(_2237, _2237, _2243);
        float _2247 = fma(_2241, _2241, _2245);
        float _2249 = rsqrt(_2247);
        float _2251 = _2233 * _2249;
        float _2253 = _2237 * _2249;
        float _2255 = _2241 * _2249;
        float _2257 = -_1348;
        float _2259 = _2257 + _2251;
        float _2261 = -_1294;
        float _2263 = _2261 + _2253;
        float _2265 = sqrt(_2247);
        float _2267 = -_1296;
        float _2269 = _2267 + _2255;
        float _2271 = _2259 * _2259;
        float _2273 = fma(_2263, _2263, _2271);
        float _2275 = fma(_2269, _2269, _2273);
        float _2277 = rsqrt(_2275);
        float _2279 = -_2265;
        float _2281 = _2279 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2283 = _2281 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2285 = precise::clamp(_2283, 0.0, 1.0);
        float _2287 = abs(_2285);
        float _2289 = log2(_2287);
        float _2291 = _2259 * _2277;
        float _2293 = _2263 * _2277;
        float _2295 = _2269 * _2277;
        float _2297 = _752 * _2291;
        float _2299 = _752 * _2251;
        float _2301 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2303 = precise::clamp(_2301, 0.0, 1.0);
        float _2305 = fma(_748, _2293, _2297);
        float _2307 = fma(_748, _2253, _2299);
        float _2309 = _2303 * _2303;
        float _2311 = fma(_756, _2295, _2305);
        float _2313 = precise::clamp(_2311, 0.0, 1.0);
        float _2315 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2317 = _2309 + (-1.0);
        float _2319 = fma(_756, _2255, _2307);
        float _2321 = precise::clamp(_2319, 0.0, 1.0);
        float _2323 = _2313 * _2313;
        float _2325 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2327 = exp2(_2315);
        float _2329 = fma(_2323, _2317, 1.0);
        float _2331 = -_2251;
        float _2333 = -_2325;
        float _2335 = fma(_2331, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2333);
        float _2337 = _2329 * _2329;
        float _2339 = -_2255;
        float _2341 = fma(_2339, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2335);
        float _2343 = 1.0 / _2337;
        float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2347 = _2341 + _2345;
        float _2349 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2351 = precise::clamp(_2349, 0.0, 1.0);
        float _2353 = _2327 * _2351;
        float _2355 = _2321 * _2353;
        float _2357 = _2309 * _2343;
        float _2359 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2361 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2363 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2365 = _2355 * _2357;
        float _2367 = _2365 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2369 = _2365 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2371 = _2365 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2359;
        out.m_87.y = _2361;
        out.m_87.z = _2363;
        out.m_89.x = _2367;
        out.m_89.y = _2369;
        out.m_89.z = _2371;
    }
    out.m_91.x = _2223;
    out.m_91.y = _2225;
    out.m_91.z = _2227;
    if (_2207)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2373 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2373;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2071 = false;
    bool _1198 = false;
    bool _880 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _112 = int(_110);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2429 = as_type<float>(_126);
        out.gl_Position.z = _2429;
    }
    if (!_116)
    {
        return out;
    }
    float _130 = in.m_53.w;
    float _132 = float(_112);
    float _134 = -_130;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_130);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    bool _148 = _136 >= _132;
    bool _150 = !_146;
    bool _152 = _148 || _150;
    float _154 = _130;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _128 = as_type<int>(_158);
    }
    int _160 = _128;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2493 = as_type<float>(_160);
        out.gl_Position.z = _2493;
    }
    if (_152)
    {
        return out;
    }
    float _162 = 1.0 / _132;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _136 * _162;
    bool _168 = !_164;
    float _186;
    if (!_168)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        _186 = _166;
    }
    _188 = false;
    float _190 = _186;
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = in.m_59.x;
    float _200 = in.m_59.y;
    float _202 = in.m_59.z;
    float _204 = precise::max(_166, 0.949999988079071044921875);
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _208 = fma(_206, 10.0, 10.0);
    float _210 = fma(_166, 0.2000000476837158203125, 1.0);
    float _212 = in.m_48.x;
    float _214 = in.m_48.y;
    float _216 = in.m_48.z;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _224 = _222 != 0;
    float _226 = in.m_55.y;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = 1.0 / _220;
    float _234 = in.m_61.y;
    int _236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _238 = _236 != 0;
    float _240 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.10471977293491363525390625;
    float _242 = fma(_192, 2.0, -1.0);
    float _244 = 1.0 / _230;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _246;
    float _250 = fma(_194, 2.0, -1.0);
    float _252 = fma(_196, 2.0, -1.0);
    float _254 = 0.0;
    float _256 = _234;
    if (_224)
    {
        float _258 = in.m_55.x;
        _254 = _258;
    }
    float _260 = _254;
    float _262 = precise::min(_204, 1.0);
    float _264 = _240 * _208;
    float _266 = -_252;
    float _268 = _266 + _202;
    float _270 = 1.0 / _248;
    float _272 = _214 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _274 = _214 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _276 = _214 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _278 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[4].x, _272);
    float _280 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[5].x, _274);
    float _282 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[6].x, _276);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _190 + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = _190 + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = _190 + _292;
    float _296 = _242 * _210;
    float _298 = _286 * _244;
    float _300 = _294 * _232;
    bool _302 = _226 > 0.5;
    bool _304 = _302 && _238;
    float _306 = _290 * _270;
    float _308 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[5].z, _280);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _318 = fma(_262, -19.999996185302734375, 19.999996185302734375);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = -_242;
    float _326 = _324 + _198;
    float _328 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[4].z, _278);
    float _330 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[6].z, _282);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _332;
    bool _336 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _338 = isnan(_190);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _356 = fma(_312, _300, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = fma(_322, _300, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _360 = _308 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _362 = fma(_334, _300, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _364 = fma(_316, _298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _366 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _368 = isnan(_190);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = fma(_350, _298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _380 = fma(_354, _298, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _382 = -_346;
    float _384 = _382 + 1.0;
    float _386 = in.m_61.x;
    float _388 = _264 * 0.15915493667125701904296875;
    float _390 = _328 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _392 = -_360;
    float _394 = _392 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _396 = _260 > 0.5;
    bool _398 = _396 && _224;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _408;
    float _412 = _376 * _384;
    float _414 = -_376;
    float _416 = _414 + 1.0;
    float _418 = _330 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _420 = -_390;
    float _422 = _420 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _424 = _394 * _394;
    float _426 = fma(_402, _306, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _428 = fma(_406, _306, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _430 = fma(_410, _306, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _432 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _434 = isnan(_190);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -_418;
    float _446 = _444 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _448 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _450 = isnan(_190);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = fma(_422, _422, _424);
    float _462 = _388 * 6.283185482025146484375;
    float _464 = sin(_462);
    float _466 = _442 * _416;
    float _468 = -_442;
    float _470 = _468 + 1.0;
    float _472 = fma(_446, _446, _460);
    float _474 = _460;
    if (_304)
    {
        float _476 = -_234;
        float _478 = _476 + 1.0;
        _256 = _478;
    }
    float _480 = _256;
    float _482 = _458 * _470;
    float _484 = 0.0;
    if (_224)
    {
        _484 = _386;
    }
    float _486 = _484;
    float _488 = rsqrt(_472);
    float _490 = _486;
    if (!_224)
    {
        _474 = _386;
    }
    float _492 = _474;
    float _494 = _356 * _482;
    float _496 = _358 * _482;
    float _498 = -_458;
    float _500 = _498 + 1.0;
    float _502 = _362 * _482;
    float _504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _506 = _360 + _504;
    float _508 = _492;
    if (_398)
    {
        float _510 = -_486;
        float _512 = _510 + 1.0;
        _490 = _512;
    }
    float _514 = _490;
    float _516 = fma(_464, 0.150000035762786865234375, 1.0499999523162841796875);
    float _518 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].x, _494);
    float _520 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].y, _496);
    float _522 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].z, _502);
    float _524 = _516 * _318;
    float _526 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _528 = _390 + _526;
    float _530 = _506 * _506;
    float _532 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _534 = _418 + _532;
    float _536 = _446 * _488;
    float _538 = _394 * _488;
    float _540 = fma(_528, _528, _530);
    float _542 = _422 * _488;
    float _544 = _536 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _546 = _538 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _548 = fma(_534, _534, _540);
    float _550 = fma(_364, _466, _518);
    float _552 = -_544;
    float _554 = fma(_542, (*spvDescriptorSet0.vp_c10)._m0[10].y, _552);
    float _556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _558 = -_546;
    float _560 = fma(_536, (*spvDescriptorSet0.vp_c10)._m0[9].y, _558);
    float _562 = _542 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _564 = _554 * _554;
    float _566 = fma(_378, _466, _520);
    if (_224)
    {
        _508 = _514;
    }
    float _568 = _508;
    float _570 = -_562;
    float _572 = fma(_538, (*spvDescriptorSet0.vp_c10)._m0[8].y, _570);
    float _574 = fma(_560, _560, _564);
    float _576 = rsqrt(_548);
    float _578 = fma(_426, _412, _550);
    float _580 = _568 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _582 = fma(_380, _466, _522);
    float _584 = fma(_428, _412, _566);
    float _586 = -_250;
    float _588 = _586 + _200;
    float _590 = _480 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _592 = fma(_430, _412, _582);
    float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _596 = fma(_572, _572, _574);
    float _598 = _580 * _556;
    float _600 = in.m_63.x;
    float _602 = in.m_63.y;
    float _604 = in.m_63.z;
    float _606 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[146].x, _578);
    float _608 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[146].z, _592);
    float _610 = fma(_326, _524, _296);
    float _612 = rsqrt(_596);
    float _614 = _506 * _576;
    float _616 = _528 * _576;
    float _618 = -_614;
    float _620 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[18].w, _506);
    float _622 = -_616;
    float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _528);
    float _626 = _590 * _594;
    float _628 = _620 * _620;
    float _630 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[146].y, _584);
    float _632 = fma(_624, _624, _628);
    float _634 = fma(_588, _524, _250);
    out.m_65.x = _598;
    out.m_65.y = _626;
    float _636 = _560 * _612;
    float _638 = _572 * _612;
    float _640 = fma(_268, _524, _252);
    float _642 = in.m_67.x;
    float _644 = in.m_67.y;
    float _646 = in.m_67.z;
    float _648 = _636 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _650 = _634 != 0.0;
    bool _652 = isnan(_634);
    bool _654 = _650 || _652;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    float _660 = _630 * _602;
    float _662 = _608 * _604;
    float _664 = -_648;
    float _666 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[8].y, _664);
    float _668 = _554 * _612;
    float _670 = _638 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _672 = _610 == 0.0;
    bool _674 = !_658;
    bool _676 = _672 && _674;
    float _678 = _666 * _666;
    float _680 = _668 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _682 = -_670;
    float _684 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[10].y, _682);
    float _686 = _534 * _576;
    bool _688 = _640 == 0.0;
    bool _690 = _688 && _676;
    float _692 = -_680;
    float _694 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[9].y, _692);
    float _696 = fma(_684, _684, _678);
    float _698 = -_686;
    float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[18].w, _534);
    float _702 = _606 * _600;
    out.m_69.x = _610;
    out.m_69.y = _634;
    out.m_69.z = _640;
    float _704 = fma(_694, _694, _696);
    float _706 = fma(_700, _700, _632);
    float _708 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _610);
    float _710 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _634);
    float _712 = rsqrt(_704);
    float _714 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _640);
    float _716 = _644;
    float _718 = _642;
    float _720 = _646;
    if (!_690)
    {
        float _722 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[17].y, _644);
        _716 = _722;
    }
    float _724 = _716;
    if (!_690)
    {
        float _726 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[17].y, _642);
        _718 = _726;
    }
    float _728 = _718;
    if (!_690)
    {
        float _730 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[17].y, _646);
        _720 = _730;
    }
    float _732 = _720;
    float _734 = _724 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _736 = sqrt(_706);
    float _738 = _724 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _740 = _724 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _742 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[8].x, _734);
    float _744 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[9].x, _738);
    float _746 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[10].x, _740);
    float _748 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[8].z, _742);
    float _750 = _684 * _712;
    float _752 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[9].z, _744);
    float _754 = _666 * _712;
    float _756 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[10].z, _746);
    float _758 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _760 = _694 * _712;
    float _762 = _754 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _764 = _702 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _766 = _576 * _736;
    float _768 = fma(_750, (*spvDescriptorSet0.vp_c10)._m0[8].z, _762);
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _772 = _758 * _766;
    float _774 = _764 * _766;
    float _776 = _662 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _778 = _770 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _780 = _772 * _710;
    float _782 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[10].z, _768);
    float _784 = _774 * _708;
    float _786 = _776 * _766;
    float _788 = _780 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _790 = abs(_782);
    float _792 = -_790;
    float _794 = _792 + 1.0;
    float _796 = _780 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _798 = _780 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _800 = _786 * _714;
    float _802 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[8].x, _788);
    int _804 = as_type<int>(_794) + (-218103808);
    float _806 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[9].x, _796);
    float _808 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[10].x, _798);
    float _810 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[8].z, _802);
    bool _812 = uint(_804) >= 1920991232u;
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[9].z, _806);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[10].z, _808);
    float _818 = abs(_782);
    float _820 = fma(_818, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _822 = abs(_782);
    float _824 = fma(_822, _820, -0.212114393711090087890625);
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _834 = abs(_782);
    float _836 = fma(_834, _824, 1.570728778839111328125);
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _840 = _826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _842 = _828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _844 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _846 = _832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _848 = _838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _850 = _782 < 0.0;
    float _852 = float(_850);
    bool _854 = !_812;
    float _856 = _814;
    float _878;
    if (!_854)
    {
        int _858 = as_type<int>(_794);
        int _860 = as_type<int>(_660);
        int _862 = as_type<int>(_662);
        int _864 = 4672;
        int _866;
        int _868;
        int _870;
        int _872;
        int _874;
        int _876;
        _104(_858, _860, _862, _864, _866, _868, _870, _872, _874, _876, out.gl_Position, out.gl_PointSize);
        _878 = as_type<float>(_866);
        _880 = true;
    }
    else
    {
        float _882 = rsqrt(_794);
        float _884 = _794 * _882;
        float _886 = _882 * 0.5;
        float _888 = -_884;
        float _890 = 0.0 + _888;
        float _892 = fma(_886, _890, 0.5);
        float _894 = fma(_884, _892, _884);
        float _896 = -_894;
        float _898 = 0.0 + _896;
        float _900 = fma(_894, _898, _794);
        float _902 = fma(_886, _900, _894);
        _878 = _902;
    }
    _880 = false;
    float _904 = _878;
    float _906 = _760 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _908 = _754 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _910 = _836 * _904;
    float _912 = -_906;
    float _914 = fma(_750, (*spvDescriptorSet0.vp_c10)._m0[10].z, _912);
    float _916 = _750 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _918 = -_908;
    float _920 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[9].z, _918);
    float _922 = _914 * _914;
    float _924 = -_916;
    float _926 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[8].z, _924);
    float _928 = fma(_920, _920, _922);
    float _930 = fma(_926, _926, _928);
    float _932 = _852 * 2.0;
    float _934 = -_932;
    float _936 = fma(_910, _934, _910);
    float _938 = rsqrt(_930);
    float _940 = fma(_852, 3.1415927410125732421875, _936);
    float _942 = _940 * 0.15915493667125701904296875;
    float _944 = _942 * 6.283185482025146484375;
    float _946 = cos(_944);
    float _948 = _914 * _938;
    float _950 = _920 * _938;
    float _952 = _926 * _938;
    float _954 = _948 * _948;
    float _956 = _942 * 6.283185482025146484375;
    float _958 = sin(_956);
    float _960 = fma(_950, _950, _954);
    float _962 = -_946;
    float _964 = _962 + 1.0;
    float _966 = fma(_952, _952, _960);
    float _968 = rsqrt(_966);
    float _970 = _952 * _968;
    float _972 = _950 * _968;
    float _974 = _948 * _968;
    float _976 = _970 * _958;
    float _978 = _972 * _964;
    float _980 = _972 * _958;
    float _982 = _974 * _964;
    float _984 = _974 * _958;
    float _986 = -_976;
    float _988 = fma(_974, _978, _986);
    float _990 = _970 * _970;
    float _992 = fma(_970, _982, _980);
    float _994 = fma(_972, _978, _946);
    float _996 = _814 * _988;
    float _998 = -_984;
    float _1000 = fma(_970, _978, _998);
    float _1002 = _814 * _992;
    float _1004 = fma(_964, _990, _946);
    float _1006 = fma(_810, _994, _996);
    float _1008 = fma(_970, _978, _984);
    float _1010 = fma(_810, _1000, _1002);
    float _1012 = fma(_974, _978, _976);
    float _1014 = fma(_816, _1008, _1006);
    float _1016 = fma(_816, _1004, _1010);
    float _1018 = _390 + _1014;
    float _1020 = _418 + _1016;
    float _1022 = fma(_974, _982, _946);
    float _1024 = -_980;
    float _1026 = fma(_970, _982, _1024);
    float _1028 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1030 = _1018 + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1034 = _1020 + _1032;
    float _1036 = _814 * _1022;
    float _1038 = _1030 * _1030;
    float _1040 = _1034 * _1034;
    float _1042 = fma(_810, _1012, _1036);
    float _1044 = _1038 + _1040;
    float _1046 = fma(_816, _1026, _1042);
    float _1048 = sqrt(_1044);
    float _1050 = _360 + _1046;
    bool _1052 = _1048 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1054 = _1042;
    float _1056 = _1018;
    float _1058 = _1036;
    float _1060 = _1038;
    float _1062 = _946;
    float _1064 = _1050;
    float _1066 = _970;
    if (!_1052)
    {
        _1054 = _1018;
    }
    float _1068 = _1054;
    float _1070 = _1068;
    if (!_1052)
    {
        _856 = _1040;
    }
    float _1072 = _856;
    float _1074 = _1072;
    if (!_1052)
    {
        _1056 = _1020;
    }
    float _1076 = _1056;
    float _1078 = _1076;
    if (!_1052)
    {
        _1058 = _1050;
    }
    float _1080 = _1058;
    bool _1082 = !_1052;
    float _1084 = _1080;
    if (!_1082)
    {
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1090 = _1048 + _1088;
        float _1092 = _1050 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1094 = rsqrt(_1044);
        float _1096 = _1090 * _1086;
        float _1098 = _1096 * 0.15915493667125701904296875;
        float _1100 = _1098 * 6.283185482025146484375;
        float _1102 = sin(_1100);
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = cos(_1104);
        float _1108 = fma(_1102, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1110 = _1094 * _1108;
        float _1112 = _1106 + (-1.0);
        float _1114 = _1034 * _1110;
        float _1116 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = _1030 * _1110;
        float _1120 = fma(_1050, _1106, _1116);
        float _1122 = _1118 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1124 = _1114 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1126 = _1118 * _1118;
        float _1128 = _1114 * _1114;
        _1084 = _1120;
        _1060 = _1126;
        _1074 = _1128;
        _1070 = _1122;
        _1078 = _1124;
        _1062 = _1098;
    }
    float _1130 = _1084;
    float _1132 = _1060;
    float _1134 = _1074;
    float _1136 = _1070;
    float _1138 = _1078;
    float _1140 = _1062;
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1144 = _1130 + _1142;
    out.m_71.x = _840;
    out.m_71.y = _842;
    out.m_71.z = _778;
    float _1146 = fma(_1144, _1144, _1132);
    out.m_73.x = _844;
    out.m_73.y = _846;
    out.m_73.z = _848;
    float _1148 = _1146 + _1134;
    out.m_75.x = _748;
    out.m_75.y = _752;
    out.m_75.z = _756;
    float _1150 = sqrt(_1148);
    bool _1152 = _1150 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1154 = isnan(_1150);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1160 = _1156 || _1158;
    float _1162 = _1132;
    if (!_1160)
    {
        _1162 = 1.0;
    }
    float _1164 = _1162;
    bool _1166 = !_1160;
    float _1168 = _1164;
    if (!_1166)
    {
        bool _1170 = _1150 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1172 = isnan(_1150);
        bool _1174 = _1170 || _1172;
        bool _1176 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1178 = _1174 || _1176;
        if (!_1178)
        {
            float _1180 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1182 = _1150 + _1180;
            float _1184 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1186 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1184;
            float _1188 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1190 = _1188 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1192 = 1.0 / _1186;
            float _1194 = _1182 * _1192;
            float _1196 = fma(_1194, _1190, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1168 = _1196;
            _1198 = true;
        }
        else
        {
            bool _1200 = _1150 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1202 = isnan(_1150);
            bool _1204 = _1200 || _1202;
            bool _1206 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1208 = _1204 || _1206;
            if (!_1208)
            {
                float _1210 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1212 = _1150 + _1210;
                float _1214 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1216 = _1214 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1218 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1220 = _1218 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1222 = 1.0 / _1216;
                float _1224 = _1212 * _1222;
                float _1226 = fma(_1224, _1220, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1168 = _1226;
                _1198 = true;
            }
            else
            {
                _1168 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1198 = false;
    float _1228 = _1168;
    float _1230 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1232 = _1130 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1236 = _1136 + _1234;
    float _1238 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1240 = _1138 + _1238;
    float _1242 = -_614;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _360);
    float _1246 = fma(_1232, _1228, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1248 = fma(_1236, _1228, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1250 = fma(_1240, _1228, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1252 = -_616;
    float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _390);
    float _1256 = -_614;
    float _1258 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1246);
    float _1260 = -_616;
    float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1248);
    float _1264 = -_686;
    float _1266 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1250);
    float _1268 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1270 = _1258 + _1268;
    float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1274 = _1262 + _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1278 = _1266 + _1276;
    float _1280 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1282 = _1270 * _1270;
    float _1284 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1286 = fma(_1274, _1274, _1282);
    float _1288 = precise::max(0.0, _1284);
    float _1290 = fma(_1278, _1278, _1286);
    float _1292 = rsqrt(_1290);
    float _1294 = _1274 * _1292;
    float _1296 = _1278 * _1292;
    float _1298 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1300 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1302 = _1298 * _1298;
    float _1304 = _1300 * _1300;
    float _1306 = _1302 + _1304;
    float _1308 = sqrt(_1306);
    bool _1310 = _1308 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1314 = _1308 + _1312;
    float _1316 = _778;
    float _1318 = _1314;
    float _1320 = _1302;
    if (_1310)
    {
        float _1322 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1316 = _1322;
    }
    float _1324 = _1316;
    if (_1310)
    {
        float _1326 = rsqrt(_1306);
        _1064 = _1326;
    }
    float _1328 = _1064;
    float _1330 = _1328;
    if (_1310)
    {
        float _1332 = _1314 * _1324;
        _1318 = _1332;
    }
    float _1334 = _1318;
    float _1336 = -_686;
    float _1338 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[18].w, _418);
    if (_1310)
    {
        float _1340 = _1334 * 0.15915493667125701904296875;
        _1066 = _1340;
    }
    float _1342 = _1066;
    float _1344 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1280);
    float _1346 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1348 = _1270 * _1292;
    float _1350 = _1140;
    float _1352 = _1346;
    if (_1310)
    {
        float _1354 = _1342 * 6.283185482025146484375;
        float _1356 = sin(_1354);
        _1350 = _1356;
    }
    float _1358 = _1350;
    float _1360 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1344);
    float _1362 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1346);
    float _1364 = -_1348;
    float _1366 = -_1288;
    float _1368 = fma(_1364, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1366);
    float _1370 = _1360 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1372 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1362);
    float _1374 = _1360;
    float _1376 = _1370;
    if (_1310)
    {
        float _1378 = _1368 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1352 = _1378;
    }
    float _1380 = _1352;
    float _1382 = _1284;
    if (_1310)
    {
        float _1384 = _1342 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        _1382 = _1386;
    }
    float _1388 = _1382;
    if (!_1310)
    {
        _1374 = _1298;
    }
    float _1390 = _1374;
    float _1392 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1394 = fma(_1338, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1396 = 1.0 / _1370;
    float _1398 = _1358;
    float _1400 = _1392;
    float _1402 = _1390;
    if (_1310)
    {
        float _1404 = fma(_1358, _1380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1398 = _1404;
    }
    float _1406 = _1398;
    float _1408 = fma(_1254, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1410 = _1392 + _1370;
    float _1412 = _1406;
    if (_1310)
    {
        float _1414 = _1328 * _1406;
        _1330 = _1414;
    }
    float _1416 = _1330;
    if (!_1310)
    {
        _1412 = _1368;
    }
    float _1418 = _1412;
    float _1420 = _1418;
    if (_1310)
    {
        float _1422 = _1388 + (-1.0);
        _1400 = _1422;
    }
    float _1424 = _1400;
    float _1426 = _1424;
    if (_1310)
    {
        float _1428 = _1298 * _1416;
        _1402 = _1428;
    }
    float _1430 = _1402;
    float _1432 = floor(_1408);
    float _1434 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1436 = _1432;
    if (_1310)
    {
        float _1438 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1376 = _1438;
    }
    float _1440 = _1376;
    float _1442 = _1440;
    if (!_1310)
    {
        _1426 = _1300;
    }
    float _1444 = _1426;
    float _1446 = _1444;
    if (_1310)
    {
        float _1448 = _1300 * _1416;
        _1446 = _1448;
    }
    float _1450 = _1446;
    if (_1310)
    {
        float _1452 = _1430 * _1430;
        _1320 = _1452;
    }
    float _1454 = _1320;
    float _1456 = _1410 * _1396;
    float _1458 = _1456 * 0.5;
    float _1460 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1310)
    {
        float _1462 = fma(_1368, _1388, _1440);
        _1420 = _1462;
    }
    float _1464 = _1420;
    if (!_1310)
    {
        _1442 = _1304;
    }
    float _1466 = _1442;
    float _1468 = _1466;
    if (_1310)
    {
        float _1470 = _1450 * _1450;
        _1468 = _1470;
    }
    float _1472 = _1468;
    float _1474 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1460);
    float _1476 = fma(_1464, _1464, _1454);
    float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1480 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1478);
    float _1482 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1474);
    float _1484 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1486 = _1476 + _1472;
    float _1488 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1490 = _1482 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1492 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1494 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1484);
    float _1496 = rsqrt(_1486);
    float _1498 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1500 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1492);
    bool _1502 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan(0.5);
    bool _1510 = _1506 || _1508;
    float _1512 = -_1498;
    float _1514 = fma(_1512, _1488, 1.0);
    float _1516 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1494);
    float _1518 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1500);
    float _1520 = sqrt(_1290);
    float _1522 = _1516 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1524 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1526 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1528 = _1496 * _1430;
    float _1530 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1532 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1526);
    float _1534 = 1.0 / _1480;
    float _1536 = _1496 * _1464;
    float _1538 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1530);
    float _1540 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1532);
    float _1542 = _1496 * _1450;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1546 = fma(_1520, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1544);
    float _1548 = precise::clamp(_1546, 0.0, 1.0);
    float _1550 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1538);
    float _1552 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1554 = floor(_1394);
    float _1556 = _1528 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1558 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1560 = -_1548;
    float _1562 = _1560 + 1.0;
    float _1564 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1566 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1540);
    float _1568 = -_1556;
    float _1570 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1568);
    float _1572 = log2(_1514);
    float _1574 = _1550;
    float _1576 = _1566;
    if (_1510)
    {
        _1574 = 1.0;
    }
    float _1578 = _1574;
    float _1580 = -_1542;
    float _1582 = fma(_1580, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1570);
    float _1584 = _1578;
    if (_1510)
    {
        _1434 = 1.0;
    }
    float _1586 = _1434;
    float _1588 = 1.0 / _1566;
    float _1590 = fma(_1582, -0.5, 0.5);
    float _1592 = abs(_1562);
    float _1594 = log2(_1592);
    float _1596 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1552);
    float _1598 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1600 = _1534 * _1598;
    float _1602 = _1586;
    if (!_1510)
    {
        float _1604 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1606 = _1604 * 0.15915493667125701904296875;
        float _1608 = _1606 * 6.283185482025146484375;
        float _1610 = cos(_1608);
        float _1612 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1614 = _1612 * 0.15915493667125701904296875;
        float _1616 = _1606 * 6.283185482025146484375;
        float _1618 = sin(_1616);
        float _1620 = 1.0 / _1610;
        float _1622 = _1614 * 6.283185482025146484375;
        float _1624 = cos(_1622);
        float _1626 = _1618 * _1620;
        float _1628 = _1614 * 6.283185482025146484375;
        float _1630 = sin(_1628);
        float _1632 = _1624 * _1626;
        float _1634 = 1.0 / _1632;
        float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1638 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1636;
        float _1640 = 1.0 / _1638;
        float _1642 = _1630 * _1634;
        float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1646 = fma(_1600, _1642, _1644);
        float _1648 = _1646 * _1640;
        float _1650 = precise::clamp(_1648, 0.0, 1.0);
        _1584 = _1650;
    }
    float _1652 = _1584;
    if (!_1510)
    {
        float _1654 = in.m_77.w;
        bool _1656 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 1;
        bool _1658 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 2;
        bool _1660 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 3;
        int _1662 = as_type<int>(_1654) << 16;
        int _1664 = as_type<int>(_1654) << 8;
        int _1666 = as_type<int>(_1654) << 24;
        int _1668 = _1662 >> 24;
        int _1670 = _1664 >> 24;
        int _1672 = as_type<int>(_1654) >> 24;
        int _1674 = _1666 >> 24;
        float _1676 = float(_1668);
        float _1678 = float(_1670);
        float _1680 = float(_1672);
        float _1682 = _1676 * 0.0078740157186985015869140625;
        float _1684 = float(_1674);
        float _1686 = _1678 * 0.0078740157186985015869140625;
        float _1688 = _1680 * 0.0078740157186985015869140625;
        float _1690 = precise::min(_1682, 1.0);
        float _1692 = _1684 * 0.0078740157186985015869140625;
        float _1694 = precise::min(_1686, 1.0);
        float _1696 = precise::min(_1688, 1.0);
        float _1698 = precise::min(_1692, 1.0);
        float _1700 = precise::max(_1690, -1.0);
        float _1702 = precise::max(_1694, -1.0);
        float _1704 = precise::max(_1696, -1.0);
        float _1706 = precise::max(_1698, -1.0);
        float _1708 = _1706;
        if (_1656)
        {
            _1708 = _1700;
        }
        float _1710 = _1708;
        float _1712 = _1710;
        if (_1658)
        {
            _1712 = _1702;
        }
        float _1714 = _1712;
        float _1716 = _1714;
        if (_1660)
        {
            _1716 = _1704;
        }
        float _1718 = _1716;
        float _1720 = abs(_1718);
        float _1722 = (-0.0) + _1720;
        _1602 = _1722;
    }
    float _1724 = _1602;
    bool _1726 = _1724 != 0.0;
    bool _1728 = isnan(_1724);
    bool _1730 = _1726 || _1728;
    bool _1732 = isnan(0.0);
    bool _1734 = _1730 || _1732;
    float _1736 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1564);
    float _1738 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1596);
    float _1740 = sqrt(_1590);
    float _1742 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1744 = fma(_1582, 0.5, 0.5);
    float _1746 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1736);
    float _1748 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1738);
    float _1750 = -_1432;
    float _1752 = _1408 + _1750;
    float _1754 = fma(_1744, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1756 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1746);
    float _1758 = exp2(_1742);
    float _1760 = -_1554;
    float _1762 = _1394 + _1760;
    float _1764 = fma(_1744, _1754, -0.212114393711090087890625);
    float _1766 = _1754;
    if (_1734)
    {
        _1766 = _1748;
    }
    float _1768 = _1766;
    float _1770 = _1536 + 1.0;
    float _1772 = _1768;
    if (_1734)
    {
        _1436 = _1756;
    }
    float _1774 = _1436;
    float _1776 = fma(_1744, _1764, 1.570728778839111328125);
    float _1778 = _1774;
    if (!_1734)
    {
        _1772 = 0.0;
    }
    float _1780 = _1772;
    float _1782 = _1740 * 0.636619746685028076171875;
    if (!_1734)
    {
        _1778 = 0.0;
    }
    float _1784 = _1778;
    float _1786 = _1572 * 0.693147182464599609375;
    float2 _5131 = float2(_1752, _1762);
    float _1788 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5131, float2(0.0), isnan(_5131)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5131, float2(0.0), isnan(_5131)), level(0.0)).x;
    float _1790 = _1588 * _1780;
    float _1792 = -_1776;
    float _1794 = fma(_1782, _1792, 1.0);
    float _1796 = _1588 * _1784;
    float _1798 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1800 = -_1536;
    float _1802 = fma(_1758, _1770, _1800);
    float _1804 = fma(_1790, 0.5, 0.5);
    float _1806 = fma(_1796, -0.5, 0.5);
    float _1808 = fma(_1802, 0.5, 0.5);
    float3 _5169 = float3(_1804, _1806, _1798);
    float _1810 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5169, float3(0.0), isnan(_5169)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5169, float3(0.0), isnan(_5169)), level(0.0)).x;
    float3 _5180 = float3(_1804, _1806, _1798);
    float4 _1813 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5180, float3(0.0), isnan(_5180)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5180, float3(0.0), isnan(_5180)), level(0.0)).xyzw;
    float _1815 = _1813.x;
    float _1817 = _1813.y;
    float _1819 = _1813.z;
    float _1821 = _1813.w;
    float2 _5196 = float2(_1794, _1808);
    float3 _1825 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5196, float2(0.0), isnan(_5196)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5196, float2(0.0), isnan(_5196)), level(0.0)).xyz;
    float _1827 = _1825.x;
    float _1829 = _1825.y;
    float _1831 = _1825.z;
    float _1833 = abs(_1600);
    float _1835 = log2(_1833);
    float _1837 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1839 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_79.x = _1262;
    out.m_79.y = _1258;
    out.m_79.z = _1266;
    float _1841 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1837);
    bool _1843 = _1520 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1845 = isnan(_1520);
    bool _1847 = _1843 || _1845;
    bool _1849 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1851 = _1847 || _1849;
    bool _1853 = _1600 <= 8000.0;
    bool _1855 = isnan(_1600);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan(8000.0);
    bool _1861 = _1857 || _1859;
    float _1863 = float(_1861);
    float _1865 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1867 = exp2(_1839);
    float _1869 = exp2(_1865);
    float _1871 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1841);
    float _1873 = _1652 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1875 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1871);
    float _1877 = _1873 * _1724;
    float _1879 = in.m_77.x;
    float _1881 = -_1867;
    float _1883 = _1881 + 1.0;
    out.gl_Position.x = _1748;
    out.gl_Position.y = _1756;
    out.gl_Position.z = _1875;
    out.gl_Position.w = _1566;
    float _1885 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1887 = _1804;
    float _1889 = _1875;
    if (!_1734)
    {
        _1887 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1891 = _1887;
    float _1893 = fma(_1869, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1895 = precise::clamp(_1893, 0.0, 1.0);
    float _1897 = fma(_1895, -2.0, 3.0);
    float _1899 = _1895 * _1895;
    float _1901 = _1899 * _1897;
    float _1903 = -_1901;
    float _1905 = _1903 + 1.0;
    float _1907 = fma(_1905, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1901);
    float _1909 = _1875 + _1566;
    int _1911 = as_type<int>(_1909);
    float _1913 = 0.0;
    float _1915 = 0.0;
    if (!_1851)
    {
        _1576 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1917 = _1576;
    float _1919 = _1863 * _1907;
    float _1921 = _1909 * 0.5;
    float _1923 = _1917;
    float _1925 = _1917;
    if (!_1734)
    {
        float _1927 = _1891 * 5.0;
        _1911 = as_type<int>(_1927);
    }
    int _1929 = _1911;
    float _1931 = as_type<float>(_1929);
    if (!_1851)
    {
        _1889 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1933 = _1889;
    float _1935 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_81.z = _1921;
    out.m_81.w = _1566;
    float _1937 = _1933;
    float _1939 = _1933;
    if (!_1734)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5396 = as_type<float>(_1929);
        out.gl_Position.z = _5396;
    }
    if (_1734)
    {
        _1931 = _1877;
    }
    float _1941 = _1931;
    float _1943 = _1941;
    if (!_1851)
    {
        _1913 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1945 = _1913;
    float _1947 = _1945;
    float _1949 = _1945;
    if (!_1851)
    {
        _1915 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1951 = _1915;
    float _1953 = _1951;
    float _1955 = _1951;
    if (!_1734)
    {
        _1943 = 0.0;
    }
    float _1957 = _1943;
    float _1959 = -_1788;
    float _1961 = _1959 + 1.0;
    float _1963 = _1961 * _1935;
    float _1965 = precise::clamp(_1963, 0.0, 1.0);
    float _1967 = -_1965;
    float _1969 = fma(_1967, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1971 = _1885 * _1810;
    float _1973 = _1969 * _1879;
    float _1975 = -_1885;
    float _1977 = _1975 + 1.0;
    float _1979 = _1821 * _1971;
    float _1981 = _1831 * _1971;
    float _1983 = _1973 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1985 = _1821 * _1977;
    float _1987 = fma(_1827, _1979, _1815);
    float _1989 = fma(_1829, _1979, _1817);
    float _1991 = fma(_1821, _1981, _1819);
    out.m_83.x = _1983;
    float _1993 = _1979;
    float _1995 = _1981;
    if (!_1851)
    {
        _1993 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1997 = _1993;
    float _1999 = _1997;
    float _2001 = _1997;
    if (!_1851)
    {
        _1995 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2003 = _1995;
    out.m_85.x = _1987;
    out.m_85.y = _1989;
    out.m_85.z = _1991;
    out.m_85.w = _1985;
    bool _2005 = !_1851;
    float _2007 = _2003;
    float _2009 = _2003;
    if (!_2005)
    {
        bool _2011 = _1520 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2013 = isnan(_1520);
        bool _2015 = _2011 || _2013;
        bool _2017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2019 = _2015 || _2017;
        if (!_2019)
        {
            float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2023 = _1520 + _2021;
            float _2025 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2027 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2025;
            float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2031 = _2029 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2033 = 1.0 / _2027;
            float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2037 = _2035 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2041 = _2039 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2045 = _2043 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2047 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2049 = _2047 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2051 = _2023 * _2033;
            float _2053 = precise::clamp(_2051, 0.0, 1.0);
            float _2055 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2057 = _2055 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2059 = fma(_2053, _2031, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2061 = fma(_2053, _2057, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2063 = fma(_2053, _2037, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2065 = fma(_2053, _2041, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2067 = fma(_2053, _2045, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2069 = fma(_2053, _2049, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1949 = _2059;
            _1939 = _2065;
            _1955 = _2063;
            _2001 = _2067;
            _1925 = _2061;
            _2009 = _2069;
            _2071 = true;
        }
        else
        {
            bool _2073 = _1520 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2075 = isnan(_1520);
            bool _2077 = _2073 || _2075;
            bool _2079 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2081 = _2077 || _2079;
            if (!_2081)
            {
                _1947 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2083 = _1947;
            _1949 = _2083;
            if (!_2081)
            {
                _1953 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2085 = _1953;
            _1955 = _2085;
            if (!_2081)
            {
                _1923 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2087 = _1923;
            _1925 = _2087;
            if (!_2081)
            {
                _1937 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2089 = _1937;
            _1939 = _2089;
            if (!_2081)
            {
                _1999 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2091 = _1999;
            _2001 = _2091;
            if (!_2081)
            {
                _2007 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2093 = _2007;
            bool _2095 = !_2081;
            _2009 = _2093;
            if (!_2095)
            {
                bool _2097 = _1520 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2099 = isnan(_1520);
                bool _2101 = _2097 || _2099;
                bool _2103 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2105 = _2101 || _2103;
                if (!_2105)
                {
                    float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2109 = _1520 + _2107;
                    float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2113 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2111;
                    float _2115 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2117 = _2115 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2119 = 1.0 / _2113;
                    float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2123 = _2121 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2125 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2127 = _2125 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2129 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2131 = _2129 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2133 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2135 = _2133 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2137 = _2109 * _2119;
                    float _2139 = precise::clamp(_2137, 0.0, 1.0);
                    float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2143 = _2141 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2145 = fma(_2139, _2117, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2147 = fma(_2139, _2143, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2149 = fma(_2139, _2123, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2151 = fma(_2139, _2127, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2153 = fma(_2139, _2131, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2155 = fma(_2139, _2135, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1949 = _2145;
                    _1939 = _2151;
                    _1955 = _2149;
                    _2001 = _2153;
                    _1925 = _2147;
                    _2009 = _2155;
                    _2071 = true;
                }
                else
                {
                    _1949 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1939 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1955 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2001 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1925 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2009 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2071 = false;
    float _2157 = _1949;
    float _2159 = _1939;
    float _2161 = _1955;
    float _2163 = _2001;
    float _2165 = _1925;
    float _2167 = _2009;
    float _2169 = fma(_752, -0.5, 0.5);
    float _2171 = precise::clamp(_2169, 0.0, 1.0);
    float _2173 = -_2157;
    float _2175 = _2173 + _2159;
    float _2177 = -_2161;
    float _2179 = _2177 + _2163;
    out.m_87.x = 0.0;
    float _2181 = fma(_2171, _2175, _2157);
    float _2183 = fma(_2171, _2179, _2161);
    out.m_51.x = 1.0;
    float _2185 = -_2165;
    float _2187 = _2185 + _2167;
    bool _2189 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2191 = _2183 * 0.586610972881317138671875;
    float _2193 = fma(_2171, _2187, _2165);
    float _2195 = _1957 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2197 = fma(_2181, 0.298911988735198974609375, _2191);
    out.m_89.x = 0.0;
    bool _2199 = _1652 > 0.0;
    bool _2201 = isnan(_1652);
    bool _2203 = _2199 || _2201;
    bool _2205 = isnan(0.0);
    bool _2207 = _2203 || _2205;
    float _2209 = fma(_2193, 0.114477999508380889892578125, _2197);
    out.m_83.w = _2195;
    float _2211 = -_2209;
    float _2213 = _2181 + _2211;
    float _2215 = -_2209;
    float _2217 = _2183 + _2215;
    float _2219 = -_2209;
    float _2221 = _2193 + _2219;
    float _2223 = fma(_2213, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2209);
    float _2225 = fma(_2217, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2209);
    float _2227 = fma(_2221, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2209);
    bool _2229 = !_2189;
    if (!_2229)
    {
        float _2231 = -_1258;
        float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2235 = -_1262;
        float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2239 = -_1266;
        float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2243 = _2233 * _2233;
        float _2245 = fma(_2237, _2237, _2243);
        float _2247 = fma(_2241, _2241, _2245);
        float _2249 = rsqrt(_2247);
        float _2251 = _2233 * _2249;
        float _2253 = _2237 * _2249;
        float _2255 = _2241 * _2249;
        float _2257 = -_1348;
        float _2259 = _2257 + _2251;
        float _2261 = -_1294;
        float _2263 = _2261 + _2253;
        float _2265 = sqrt(_2247);
        float _2267 = -_1296;
        float _2269 = _2267 + _2255;
        float _2271 = _2259 * _2259;
        float _2273 = fma(_2263, _2263, _2271);
        float _2275 = fma(_2269, _2269, _2273);
        float _2277 = rsqrt(_2275);
        float _2279 = -_2265;
        float _2281 = _2279 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2283 = _2281 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2285 = precise::clamp(_2283, 0.0, 1.0);
        float _2287 = abs(_2285);
        float _2289 = log2(_2287);
        float _2291 = _2259 * _2277;
        float _2293 = _2263 * _2277;
        float _2295 = _2269 * _2277;
        float _2297 = _752 * _2291;
        float _2299 = _752 * _2251;
        float _2301 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2303 = precise::clamp(_2301, 0.0, 1.0);
        float _2305 = fma(_748, _2293, _2297);
        float _2307 = fma(_748, _2253, _2299);
        float _2309 = _2303 * _2303;
        float _2311 = fma(_756, _2295, _2305);
        float _2313 = precise::clamp(_2311, 0.0, 1.0);
        float _2315 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2317 = _2309 + (-1.0);
        float _2319 = fma(_756, _2255, _2307);
        float _2321 = precise::clamp(_2319, 0.0, 1.0);
        float _2323 = _2313 * _2313;
        float _2325 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2327 = exp2(_2315);
        float _2329 = fma(_2323, _2317, 1.0);
        float _2331 = -_2251;
        float _2333 = -_2325;
        float _2335 = fma(_2331, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2333);
        float _2337 = _2329 * _2329;
        float _2339 = -_2255;
        float _2341 = fma(_2339, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2335);
        float _2343 = 1.0 / _2337;
        float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2347 = _2341 + _2345;
        float _2349 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2351 = precise::clamp(_2349, 0.0, 1.0);
        float _2353 = _2327 * _2351;
        float _2355 = _2321 * _2353;
        float _2357 = _2309 * _2343;
        float _2359 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2361 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2363 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2365 = _2355 * _2357;
        float _2367 = _2365 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2369 = _2365 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2371 = _2365 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2359;
        out.m_87.y = _2361;
        out.m_87.z = _2363;
        out.m_89.x = _2367;
        out.m_89.y = _2369;
        out.m_89.z = _2371;
    }
    out.m_91.x = _2223;
    out.m_91.y = _2225;
    out.m_91.z = _2227;
    if (_2207)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2373 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2373;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2071 = false;
    bool _1198 = false;
    bool _880 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _112 = int(_110);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2429 = as_type<float>(_126);
        out.gl_Position.z = _2429;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_53.w;
    float _132 = float(_112);
    float _134 = -_130;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_130);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    bool _148 = _136 >= _132;
    bool _150 = !_146;
    bool _152 = _148 || _150;
    float _154 = _130;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _128 = as_type<int>(_158);
    }
    int _160 = _128;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2493 = as_type<float>(_160);
        out.gl_Position.z = _2493;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = 1.0 / _132;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _136 * _162;
    bool _168 = !_164;
    float _186;
    if (!_168)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        _186 = _166;
    }
    _188 = false;
    float _190 = _186;
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = in.m_59.x;
    float _200 = in.m_59.y;
    float _202 = in.m_59.z;
    float _204 = precise::max(_166, 0.949999988079071044921875);
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _208 = fma(_206, 10.0, 10.0);
    float _210 = fma(_166, 0.2000000476837158203125, 1.0);
    float _212 = in.m_48.x;
    float _214 = in.m_48.y;
    float _216 = in.m_48.z;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _224 = _222 != 0;
    float _226 = in.m_55.y;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = 1.0 / _220;
    float _234 = in.m_61.y;
    int _236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _238 = _236 != 0;
    float _240 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.10471977293491363525390625;
    float _242 = fma(_192, 2.0, -1.0);
    float _244 = 1.0 / _230;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _246;
    float _250 = fma(_194, 2.0, -1.0);
    float _252 = fma(_196, 2.0, -1.0);
    float _254 = 0.0;
    float _256 = _234;
    if (_224)
    {
        float _258 = in.m_55.x;
        _254 = _258;
    }
    float _260 = _254;
    float _262 = precise::min(_204, 1.0);
    float _264 = _240 * _208;
    float _266 = -_252;
    float _268 = _266 + _202;
    float _270 = 1.0 / _248;
    float _272 = _214 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _274 = _214 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _276 = _214 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _278 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[4].x, _272);
    float _280 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[5].x, _274);
    float _282 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[6].x, _276);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _190 + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = _190 + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = _190 + _292;
    float _296 = _242 * _210;
    float _298 = _286 * _244;
    float _300 = _294 * _232;
    bool _302 = _226 > 0.5;
    bool _304 = _302 && _238;
    float _306 = _290 * _270;
    float _308 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[5].z, _280);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _318 = fma(_262, -19.999996185302734375, 19.999996185302734375);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = -_242;
    float _326 = _324 + _198;
    float _328 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[4].z, _278);
    float _330 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[6].z, _282);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _332;
    bool _336 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _338 = isnan(_190);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _356 = fma(_312, _300, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = fma(_322, _300, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _360 = _308 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _362 = fma(_334, _300, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _364 = fma(_316, _298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _366 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _368 = isnan(_190);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = fma(_350, _298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _380 = fma(_354, _298, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _382 = -_346;
    float _384 = _382 + 1.0;
    float _386 = in.m_61.x;
    float _388 = _264 * 0.15915493667125701904296875;
    float _390 = _328 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _392 = -_360;
    float _394 = _392 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _396 = _260 > 0.5;
    bool _398 = _396 && _224;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _408;
    float _412 = _376 * _384;
    float _414 = -_376;
    float _416 = _414 + 1.0;
    float _418 = _330 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _420 = -_390;
    float _422 = _420 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _424 = _394 * _394;
    float _426 = fma(_402, _306, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _428 = fma(_406, _306, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _430 = fma(_410, _306, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _432 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _434 = isnan(_190);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -_418;
    float _446 = _444 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _448 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _450 = isnan(_190);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = fma(_422, _422, _424);
    float _462 = _388 * 6.283185482025146484375;
    float _464 = sin(_462);
    float _466 = _442 * _416;
    float _468 = -_442;
    float _470 = _468 + 1.0;
    float _472 = fma(_446, _446, _460);
    float _474 = _460;
    if (_304)
    {
        float _476 = -_234;
        float _478 = _476 + 1.0;
        _256 = _478;
    }
    float _480 = _256;
    float _482 = _458 * _470;
    float _484 = 0.0;
    if (_224)
    {
        _484 = _386;
    }
    float _486 = _484;
    float _488 = rsqrt(_472);
    float _490 = _486;
    if (!_224)
    {
        _474 = _386;
    }
    float _492 = _474;
    float _494 = _356 * _482;
    float _496 = _358 * _482;
    float _498 = -_458;
    float _500 = _498 + 1.0;
    float _502 = _362 * _482;
    float _504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _506 = _360 + _504;
    float _508 = _492;
    if (_398)
    {
        float _510 = -_486;
        float _512 = _510 + 1.0;
        _490 = _512;
    }
    float _514 = _490;
    float _516 = fma(_464, 0.150000035762786865234375, 1.0499999523162841796875);
    float _518 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].x, _494);
    float _520 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].y, _496);
    float _522 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].z, _502);
    float _524 = _516 * _318;
    float _526 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _528 = _390 + _526;
    float _530 = _506 * _506;
    float _532 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _534 = _418 + _532;
    float _536 = _446 * _488;
    float _538 = _394 * _488;
    float _540 = fma(_528, _528, _530);
    float _542 = _422 * _488;
    float _544 = _536 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _546 = _538 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _548 = fma(_534, _534, _540);
    float _550 = fma(_364, _466, _518);
    float _552 = -_544;
    float _554 = fma(_542, (*spvDescriptorSet0.vp_c10)._m0[10].y, _552);
    float _556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _558 = -_546;
    float _560 = fma(_536, (*spvDescriptorSet0.vp_c10)._m0[9].y, _558);
    float _562 = _542 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _564 = _554 * _554;
    float _566 = fma(_378, _466, _520);
    if (_224)
    {
        _508 = _514;
    }
    float _568 = _508;
    float _570 = -_562;
    float _572 = fma(_538, (*spvDescriptorSet0.vp_c10)._m0[8].y, _570);
    float _574 = fma(_560, _560, _564);
    float _576 = rsqrt(_548);
    float _578 = fma(_426, _412, _550);
    float _580 = _568 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _582 = fma(_380, _466, _522);
    float _584 = fma(_428, _412, _566);
    float _586 = -_250;
    float _588 = _586 + _200;
    float _590 = _480 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _592 = fma(_430, _412, _582);
    float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _596 = fma(_572, _572, _574);
    float _598 = _580 * _556;
    float _600 = in.m_63.x;
    float _602 = in.m_63.y;
    float _604 = in.m_63.z;
    float _606 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[146].x, _578);
    float _608 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[146].z, _592);
    float _610 = fma(_326, _524, _296);
    float _612 = rsqrt(_596);
    float _614 = _506 * _576;
    float _616 = _528 * _576;
    float _618 = -_614;
    float _620 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[18].w, _506);
    float _622 = -_616;
    float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _528);
    float _626 = _590 * _594;
    float _628 = _620 * _620;
    float _630 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[146].y, _584);
    float _632 = fma(_624, _624, _628);
    float _634 = fma(_588, _524, _250);
    out.m_65.x = _598;
    out.m_65.y = _626;
    float _636 = _560 * _612;
    float _638 = _572 * _612;
    float _640 = fma(_268, _524, _252);
    float _642 = in.m_67.x;
    float _644 = in.m_67.y;
    float _646 = in.m_67.z;
    float _648 = _636 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _650 = _634 != 0.0;
    bool _652 = isnan(_634);
    bool _654 = _650 || _652;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    float _660 = _630 * _602;
    float _662 = _608 * _604;
    float _664 = -_648;
    float _666 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[8].y, _664);
    float _668 = _554 * _612;
    float _670 = _638 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _672 = _610 == 0.0;
    bool _674 = !_658;
    bool _676 = _672 && _674;
    float _678 = _666 * _666;
    float _680 = _668 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _682 = -_670;
    float _684 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[10].y, _682);
    float _686 = _534 * _576;
    bool _688 = _640 == 0.0;
    bool _690 = _688 && _676;
    float _692 = -_680;
    float _694 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[9].y, _692);
    float _696 = fma(_684, _684, _678);
    float _698 = -_686;
    float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[18].w, _534);
    float _702 = _606 * _600;
    out.m_69.x = _610;
    out.m_69.y = _634;
    out.m_69.z = _640;
    float _704 = fma(_694, _694, _696);
    float _706 = fma(_700, _700, _632);
    float _708 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _610);
    float _710 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _634);
    float _712 = rsqrt(_704);
    float _714 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _640);
    float _716 = _644;
    float _718 = _642;
    float _720 = _646;
    if (!_690)
    {
        float _722 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[17].y, _644);
        _716 = _722;
    }
    float _724 = _716;
    if (!_690)
    {
        float _726 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[17].y, _642);
        _718 = _726;
    }
    float _728 = _718;
    if (!_690)
    {
        float _730 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[17].y, _646);
        _720 = _730;
    }
    float _732 = _720;
    float _734 = _724 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _736 = sqrt(_706);
    float _738 = _724 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _740 = _724 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _742 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[8].x, _734);
    float _744 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[9].x, _738);
    float _746 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[10].x, _740);
    float _748 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[8].z, _742);
    float _750 = _684 * _712;
    float _752 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[9].z, _744);
    float _754 = _666 * _712;
    float _756 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[10].z, _746);
    float _758 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _760 = _694 * _712;
    float _762 = _754 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _764 = _702 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _766 = _576 * _736;
    float _768 = fma(_750, (*spvDescriptorSet0.vp_c10)._m0[8].z, _762);
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _772 = _758 * _766;
    float _774 = _764 * _766;
    float _776 = _662 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _778 = _770 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _780 = _772 * _710;
    float _782 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[10].z, _768);
    float _784 = _774 * _708;
    float _786 = _776 * _766;
    float _788 = _780 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _790 = abs(_782);
    float _792 = -_790;
    float _794 = _792 + 1.0;
    float _796 = _780 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _798 = _780 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _800 = _786 * _714;
    float _802 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[8].x, _788);
    int _804 = as_type<int>(_794) + (-218103808);
    float _806 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[9].x, _796);
    float _808 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[10].x, _798);
    float _810 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[8].z, _802);
    bool _812 = uint(_804) >= 1920991232u;
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[9].z, _806);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[10].z, _808);
    float _818 = abs(_782);
    float _820 = fma(_818, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _822 = abs(_782);
    float _824 = fma(_822, _820, -0.212114393711090087890625);
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _834 = abs(_782);
    float _836 = fma(_834, _824, 1.570728778839111328125);
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _840 = _826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _842 = _828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _844 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _846 = _832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _848 = _838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _850 = _782 < 0.0;
    float _852 = float(_850);
    bool _854 = !_812;
    float _856 = _814;
    float _878;
    if (!_854)
    {
        int _858 = as_type<int>(_794);
        int _860 = as_type<int>(_660);
        int _862 = as_type<int>(_662);
        int _864 = 4672;
        int _866;
        int _868;
        int _870;
        int _872;
        int _874;
        int _876;
        _104(_858, _860, _862, _864, _866, _868, _870, _872, _874, _876, out.gl_Position, out.gl_PointSize);
        _878 = as_type<float>(_866);
        _880 = true;
    }
    else
    {
        float _882 = rsqrt(_794);
        float _884 = _794 * _882;
        float _886 = _882 * 0.5;
        float _888 = -_884;
        float _890 = 0.0 + _888;
        float _892 = fma(_886, _890, 0.5);
        float _894 = fma(_884, _892, _884);
        float _896 = -_894;
        float _898 = 0.0 + _896;
        float _900 = fma(_894, _898, _794);
        float _902 = fma(_886, _900, _894);
        _878 = _902;
    }
    _880 = false;
    float _904 = _878;
    float _906 = _760 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _908 = _754 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _910 = _836 * _904;
    float _912 = -_906;
    float _914 = fma(_750, (*spvDescriptorSet0.vp_c10)._m0[10].z, _912);
    float _916 = _750 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _918 = -_908;
    float _920 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[9].z, _918);
    float _922 = _914 * _914;
    float _924 = -_916;
    float _926 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[8].z, _924);
    float _928 = fma(_920, _920, _922);
    float _930 = fma(_926, _926, _928);
    float _932 = _852 * 2.0;
    float _934 = -_932;
    float _936 = fma(_910, _934, _910);
    float _938 = rsqrt(_930);
    float _940 = fma(_852, 3.1415927410125732421875, _936);
    float _942 = _940 * 0.15915493667125701904296875;
    float _944 = _942 * 6.283185482025146484375;
    float _946 = cos(_944);
    float _948 = _914 * _938;
    float _950 = _920 * _938;
    float _952 = _926 * _938;
    float _954 = _948 * _948;
    float _956 = _942 * 6.283185482025146484375;
    float _958 = sin(_956);
    float _960 = fma(_950, _950, _954);
    float _962 = -_946;
    float _964 = _962 + 1.0;
    float _966 = fma(_952, _952, _960);
    float _968 = rsqrt(_966);
    float _970 = _952 * _968;
    float _972 = _950 * _968;
    float _974 = _948 * _968;
    float _976 = _970 * _958;
    float _978 = _972 * _964;
    float _980 = _972 * _958;
    float _982 = _974 * _964;
    float _984 = _974 * _958;
    float _986 = -_976;
    float _988 = fma(_974, _978, _986);
    float _990 = _970 * _970;
    float _992 = fma(_970, _982, _980);
    float _994 = fma(_972, _978, _946);
    float _996 = _814 * _988;
    float _998 = -_984;
    float _1000 = fma(_970, _978, _998);
    float _1002 = _814 * _992;
    float _1004 = fma(_964, _990, _946);
    float _1006 = fma(_810, _994, _996);
    float _1008 = fma(_970, _978, _984);
    float _1010 = fma(_810, _1000, _1002);
    float _1012 = fma(_974, _978, _976);
    float _1014 = fma(_816, _1008, _1006);
    float _1016 = fma(_816, _1004, _1010);
    float _1018 = _390 + _1014;
    float _1020 = _418 + _1016;
    float _1022 = fma(_974, _982, _946);
    float _1024 = -_980;
    float _1026 = fma(_970, _982, _1024);
    float _1028 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1030 = _1018 + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1034 = _1020 + _1032;
    float _1036 = _814 * _1022;
    float _1038 = _1030 * _1030;
    float _1040 = _1034 * _1034;
    float _1042 = fma(_810, _1012, _1036);
    float _1044 = _1038 + _1040;
    float _1046 = fma(_816, _1026, _1042);
    float _1048 = sqrt(_1044);
    float _1050 = _360 + _1046;
    bool _1052 = _1048 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1054 = _1042;
    float _1056 = _1018;
    float _1058 = _1036;
    float _1060 = _1038;
    float _1062 = _946;
    float _1064 = _1050;
    float _1066 = _970;
    if (!_1052)
    {
        _1054 = _1018;
    }
    float _1068 = _1054;
    float _1070 = _1068;
    if (!_1052)
    {
        _856 = _1040;
    }
    float _1072 = _856;
    float _1074 = _1072;
    if (!_1052)
    {
        _1056 = _1020;
    }
    float _1076 = _1056;
    float _1078 = _1076;
    if (!_1052)
    {
        _1058 = _1050;
    }
    float _1080 = _1058;
    bool _1082 = !_1052;
    float _1084 = _1080;
    if (!_1082)
    {
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1090 = _1048 + _1088;
        float _1092 = _1050 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1094 = rsqrt(_1044);
        float _1096 = _1090 * _1086;
        float _1098 = _1096 * 0.15915493667125701904296875;
        float _1100 = _1098 * 6.283185482025146484375;
        float _1102 = sin(_1100);
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = cos(_1104);
        float _1108 = fma(_1102, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1110 = _1094 * _1108;
        float _1112 = _1106 + (-1.0);
        float _1114 = _1034 * _1110;
        float _1116 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = _1030 * _1110;
        float _1120 = fma(_1050, _1106, _1116);
        float _1122 = _1118 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1124 = _1114 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1126 = _1118 * _1118;
        float _1128 = _1114 * _1114;
        _1084 = _1120;
        _1060 = _1126;
        _1074 = _1128;
        _1070 = _1122;
        _1078 = _1124;
        _1062 = _1098;
    }
    float _1130 = _1084;
    float _1132 = _1060;
    float _1134 = _1074;
    float _1136 = _1070;
    float _1138 = _1078;
    float _1140 = _1062;
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1144 = _1130 + _1142;
    out.m_71.x = _840;
    out.m_71.y = _842;
    out.m_71.z = _778;
    float _1146 = fma(_1144, _1144, _1132);
    out.m_73.x = _844;
    out.m_73.y = _846;
    out.m_73.z = _848;
    float _1148 = _1146 + _1134;
    out.m_75.x = _748;
    out.m_75.y = _752;
    out.m_75.z = _756;
    float _1150 = sqrt(_1148);
    bool _1152 = _1150 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1154 = isnan(_1150);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1160 = _1156 || _1158;
    float _1162 = _1132;
    if (!_1160)
    {
        _1162 = 1.0;
    }
    float _1164 = _1162;
    bool _1166 = !_1160;
    float _1168 = _1164;
    if (!_1166)
    {
        bool _1170 = _1150 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1172 = isnan(_1150);
        bool _1174 = _1170 || _1172;
        bool _1176 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1178 = _1174 || _1176;
        if (!_1178)
        {
            float _1180 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1182 = _1150 + _1180;
            float _1184 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1186 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1184;
            float _1188 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1190 = _1188 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1192 = 1.0 / _1186;
            float _1194 = _1182 * _1192;
            float _1196 = fma(_1194, _1190, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1168 = _1196;
            _1198 = true;
        }
        else
        {
            bool _1200 = _1150 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1202 = isnan(_1150);
            bool _1204 = _1200 || _1202;
            bool _1206 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1208 = _1204 || _1206;
            if (!_1208)
            {
                float _1210 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1212 = _1150 + _1210;
                float _1214 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1216 = _1214 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1218 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1220 = _1218 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1222 = 1.0 / _1216;
                float _1224 = _1212 * _1222;
                float _1226 = fma(_1224, _1220, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1168 = _1226;
                _1198 = true;
            }
            else
            {
                _1168 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1198 = false;
    float _1228 = _1168;
    float _1230 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1232 = _1130 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1236 = _1136 + _1234;
    float _1238 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1240 = _1138 + _1238;
    float _1242 = -_614;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _360);
    float _1246 = fma(_1232, _1228, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1248 = fma(_1236, _1228, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1250 = fma(_1240, _1228, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1252 = -_616;
    float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _390);
    float _1256 = -_614;
    float _1258 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1246);
    float _1260 = -_616;
    float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1248);
    float _1264 = -_686;
    float _1266 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1250);
    float _1268 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1270 = _1258 + _1268;
    float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1274 = _1262 + _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1278 = _1266 + _1276;
    float _1280 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1282 = _1270 * _1270;
    float _1284 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1286 = fma(_1274, _1274, _1282);
    float _1288 = precise::max(0.0, _1284);
    float _1290 = fma(_1278, _1278, _1286);
    float _1292 = rsqrt(_1290);
    float _1294 = _1274 * _1292;
    float _1296 = _1278 * _1292;
    float _1298 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1300 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1302 = _1298 * _1298;
    float _1304 = _1300 * _1300;
    float _1306 = _1302 + _1304;
    float _1308 = sqrt(_1306);
    bool _1310 = _1308 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1314 = _1308 + _1312;
    float _1316 = _778;
    float _1318 = _1314;
    float _1320 = _1302;
    if (_1310)
    {
        float _1322 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1316 = _1322;
    }
    float _1324 = _1316;
    if (_1310)
    {
        float _1326 = rsqrt(_1306);
        _1064 = _1326;
    }
    float _1328 = _1064;
    float _1330 = _1328;
    if (_1310)
    {
        float _1332 = _1314 * _1324;
        _1318 = _1332;
    }
    float _1334 = _1318;
    float _1336 = -_686;
    float _1338 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[18].w, _418);
    if (_1310)
    {
        float _1340 = _1334 * 0.15915493667125701904296875;
        _1066 = _1340;
    }
    float _1342 = _1066;
    float _1344 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1280);
    float _1346 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1348 = _1270 * _1292;
    float _1350 = _1140;
    float _1352 = _1346;
    if (_1310)
    {
        float _1354 = _1342 * 6.283185482025146484375;
        float _1356 = sin(_1354);
        _1350 = _1356;
    }
    float _1358 = _1350;
    float _1360 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1344);
    float _1362 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1346);
    float _1364 = -_1348;
    float _1366 = -_1288;
    float _1368 = fma(_1364, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1366);
    float _1370 = _1360 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1372 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1362);
    float _1374 = _1360;
    float _1376 = _1370;
    if (_1310)
    {
        float _1378 = _1368 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1352 = _1378;
    }
    float _1380 = _1352;
    float _1382 = _1284;
    if (_1310)
    {
        float _1384 = _1342 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        _1382 = _1386;
    }
    float _1388 = _1382;
    if (!_1310)
    {
        _1374 = _1298;
    }
    float _1390 = _1374;
    float _1392 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1394 = fma(_1338, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1396 = 1.0 / _1370;
    float _1398 = _1358;
    float _1400 = _1392;
    float _1402 = _1390;
    if (_1310)
    {
        float _1404 = fma(_1358, _1380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1398 = _1404;
    }
    float _1406 = _1398;
    float _1408 = fma(_1254, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1410 = _1392 + _1370;
    float _1412 = _1406;
    if (_1310)
    {
        float _1414 = _1328 * _1406;
        _1330 = _1414;
    }
    float _1416 = _1330;
    if (!_1310)
    {
        _1412 = _1368;
    }
    float _1418 = _1412;
    float _1420 = _1418;
    if (_1310)
    {
        float _1422 = _1388 + (-1.0);
        _1400 = _1422;
    }
    float _1424 = _1400;
    float _1426 = _1424;
    if (_1310)
    {
        float _1428 = _1298 * _1416;
        _1402 = _1428;
    }
    float _1430 = _1402;
    float _1432 = floor(_1408);
    float _1434 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1436 = _1432;
    if (_1310)
    {
        float _1438 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1376 = _1438;
    }
    float _1440 = _1376;
    float _1442 = _1440;
    if (!_1310)
    {
        _1426 = _1300;
    }
    float _1444 = _1426;
    float _1446 = _1444;
    if (_1310)
    {
        float _1448 = _1300 * _1416;
        _1446 = _1448;
    }
    float _1450 = _1446;
    if (_1310)
    {
        float _1452 = _1430 * _1430;
        _1320 = _1452;
    }
    float _1454 = _1320;
    float _1456 = _1410 * _1396;
    float _1458 = _1456 * 0.5;
    float _1460 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1310)
    {
        float _1462 = fma(_1368, _1388, _1440);
        _1420 = _1462;
    }
    float _1464 = _1420;
    if (!_1310)
    {
        _1442 = _1304;
    }
    float _1466 = _1442;
    float _1468 = _1466;
    if (_1310)
    {
        float _1470 = _1450 * _1450;
        _1468 = _1470;
    }
    float _1472 = _1468;
    float _1474 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1460);
    float _1476 = fma(_1464, _1464, _1454);
    float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1480 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1478);
    float _1482 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1474);
    float _1484 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1486 = _1476 + _1472;
    float _1488 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1490 = _1482 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1492 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1494 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1484);
    float _1496 = rsqrt(_1486);
    float _1498 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1500 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1492);
    bool _1502 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan(0.5);
    bool _1510 = _1506 || _1508;
    float _1512 = -_1498;
    float _1514 = fma(_1512, _1488, 1.0);
    float _1516 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1494);
    float _1518 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1500);
    float _1520 = sqrt(_1290);
    float _1522 = _1516 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1524 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1526 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1528 = _1496 * _1430;
    float _1530 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1532 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1526);
    float _1534 = 1.0 / _1480;
    float _1536 = _1496 * _1464;
    float _1538 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1530);
    float _1540 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1532);
    float _1542 = _1496 * _1450;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1546 = fma(_1520, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1544);
    float _1548 = precise::clamp(_1546, 0.0, 1.0);
    float _1550 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1538);
    float _1552 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1554 = floor(_1394);
    float _1556 = _1528 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1558 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1560 = -_1548;
    float _1562 = _1560 + 1.0;
    float _1564 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1566 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1540);
    float _1568 = -_1556;
    float _1570 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1568);
    float _1572 = log2(_1514);
    float _1574 = _1550;
    float _1576 = _1566;
    if (_1510)
    {
        _1574 = 1.0;
    }
    float _1578 = _1574;
    float _1580 = -_1542;
    float _1582 = fma(_1580, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1570);
    float _1584 = _1578;
    if (_1510)
    {
        _1434 = 1.0;
    }
    float _1586 = _1434;
    float _1588 = 1.0 / _1566;
    float _1590 = fma(_1582, -0.5, 0.5);
    float _1592 = abs(_1562);
    float _1594 = log2(_1592);
    float _1596 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1552);
    float _1598 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1600 = _1534 * _1598;
    float _1602 = _1586;
    if (!_1510)
    {
        float _1604 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1606 = _1604 * 0.15915493667125701904296875;
        float _1608 = _1606 * 6.283185482025146484375;
        float _1610 = cos(_1608);
        float _1612 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1614 = _1612 * 0.15915493667125701904296875;
        float _1616 = _1606 * 6.283185482025146484375;
        float _1618 = sin(_1616);
        float _1620 = 1.0 / _1610;
        float _1622 = _1614 * 6.283185482025146484375;
        float _1624 = cos(_1622);
        float _1626 = _1618 * _1620;
        float _1628 = _1614 * 6.283185482025146484375;
        float _1630 = sin(_1628);
        float _1632 = _1624 * _1626;
        float _1634 = 1.0 / _1632;
        float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1638 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1636;
        float _1640 = 1.0 / _1638;
        float _1642 = _1630 * _1634;
        float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1646 = fma(_1600, _1642, _1644);
        float _1648 = _1646 * _1640;
        float _1650 = precise::clamp(_1648, 0.0, 1.0);
        _1584 = _1650;
    }
    float _1652 = _1584;
    if (!_1510)
    {
        float _1654 = in.m_77.w;
        bool _1656 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 1;
        bool _1658 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 2;
        bool _1660 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 3;
        int _1662 = as_type<int>(_1654) << 16;
        int _1664 = as_type<int>(_1654) << 8;
        int _1666 = as_type<int>(_1654) << 24;
        int _1668 = _1662 >> 24;
        int _1670 = _1664 >> 24;
        int _1672 = as_type<int>(_1654) >> 24;
        int _1674 = _1666 >> 24;
        float _1676 = float(_1668);
        float _1678 = float(_1670);
        float _1680 = float(_1672);
        float _1682 = _1676 * 0.0078740157186985015869140625;
        float _1684 = float(_1674);
        float _1686 = _1678 * 0.0078740157186985015869140625;
        float _1688 = _1680 * 0.0078740157186985015869140625;
        float _1690 = precise::min(_1682, 1.0);
        float _1692 = _1684 * 0.0078740157186985015869140625;
        float _1694 = precise::min(_1686, 1.0);
        float _1696 = precise::min(_1688, 1.0);
        float _1698 = precise::min(_1692, 1.0);
        float _1700 = precise::max(_1690, -1.0);
        float _1702 = precise::max(_1694, -1.0);
        float _1704 = precise::max(_1696, -1.0);
        float _1706 = precise::max(_1698, -1.0);
        float _1708 = _1706;
        if (_1656)
        {
            _1708 = _1700;
        }
        float _1710 = _1708;
        float _1712 = _1710;
        if (_1658)
        {
            _1712 = _1702;
        }
        float _1714 = _1712;
        float _1716 = _1714;
        if (_1660)
        {
            _1716 = _1704;
        }
        float _1718 = _1716;
        float _1720 = abs(_1718);
        float _1722 = (-0.0) + _1720;
        _1602 = _1722;
    }
    float _1724 = _1602;
    bool _1726 = _1724 != 0.0;
    bool _1728 = isnan(_1724);
    bool _1730 = _1726 || _1728;
    bool _1732 = isnan(0.0);
    bool _1734 = _1730 || _1732;
    float _1736 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1564);
    float _1738 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1596);
    float _1740 = sqrt(_1590);
    float _1742 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1744 = fma(_1582, 0.5, 0.5);
    float _1746 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1736);
    float _1748 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1738);
    float _1750 = -_1432;
    float _1752 = _1408 + _1750;
    float _1754 = fma(_1744, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1756 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1746);
    float _1758 = exp2(_1742);
    float _1760 = -_1554;
    float _1762 = _1394 + _1760;
    float _1764 = fma(_1744, _1754, -0.212114393711090087890625);
    float _1766 = _1754;
    if (_1734)
    {
        _1766 = _1748;
    }
    float _1768 = _1766;
    float _1770 = _1536 + 1.0;
    float _1772 = _1768;
    if (_1734)
    {
        _1436 = _1756;
    }
    float _1774 = _1436;
    float _1776 = fma(_1744, _1764, 1.570728778839111328125);
    float _1778 = _1774;
    if (!_1734)
    {
        _1772 = 0.0;
    }
    float _1780 = _1772;
    float _1782 = _1740 * 0.636619746685028076171875;
    if (!_1734)
    {
        _1778 = 0.0;
    }
    float _1784 = _1778;
    float _1786 = _1572 * 0.693147182464599609375;
    float2 _5131 = float2(_1752, _1762);
    float _1788 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5131, float2(0.0), isnan(_5131)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5131, float2(0.0), isnan(_5131)), level(0.0)).x;
    float _1790 = _1588 * _1780;
    float _1792 = -_1776;
    float _1794 = fma(_1782, _1792, 1.0);
    float _1796 = _1588 * _1784;
    float _1798 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1800 = -_1536;
    float _1802 = fma(_1758, _1770, _1800);
    float _1804 = fma(_1790, 0.5, 0.5);
    float _1806 = fma(_1796, -0.5, 0.5);
    float _1808 = fma(_1802, 0.5, 0.5);
    float3 _5169 = float3(_1804, _1806, _1798);
    float _1810 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5169, float3(0.0), isnan(_5169)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5169, float3(0.0), isnan(_5169)), level(0.0)).x;
    float3 _5180 = float3(_1804, _1806, _1798);
    float4 _1813 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5180, float3(0.0), isnan(_5180)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5180, float3(0.0), isnan(_5180)), level(0.0)).xyzw;
    float _1815 = _1813.x;
    float _1817 = _1813.y;
    float _1819 = _1813.z;
    float _1821 = _1813.w;
    float2 _5196 = float2(_1794, _1808);
    float3 _1825 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5196, float2(0.0), isnan(_5196)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5196, float2(0.0), isnan(_5196)), level(0.0)).xyz;
    float _1827 = _1825.x;
    float _1829 = _1825.y;
    float _1831 = _1825.z;
    float _1833 = abs(_1600);
    float _1835 = log2(_1833);
    float _1837 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1839 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_79.x = _1262;
    out.m_79.y = _1258;
    out.m_79.z = _1266;
    float _1841 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1837);
    bool _1843 = _1520 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1845 = isnan(_1520);
    bool _1847 = _1843 || _1845;
    bool _1849 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1851 = _1847 || _1849;
    bool _1853 = _1600 <= 8000.0;
    bool _1855 = isnan(_1600);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan(8000.0);
    bool _1861 = _1857 || _1859;
    float _1863 = float(_1861);
    float _1865 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1867 = exp2(_1839);
    float _1869 = exp2(_1865);
    float _1871 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1841);
    float _1873 = _1652 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1875 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1871);
    float _1877 = _1873 * _1724;
    float _1879 = in.m_77.x;
    float _1881 = -_1867;
    float _1883 = _1881 + 1.0;
    out.gl_Position.x = _1748;
    out.gl_Position.y = _1756;
    out.gl_Position.z = _1875;
    out.gl_Position.w = _1566;
    float _1885 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1887 = _1804;
    float _1889 = _1875;
    if (!_1734)
    {
        _1887 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1891 = _1887;
    float _1893 = fma(_1869, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1895 = precise::clamp(_1893, 0.0, 1.0);
    float _1897 = fma(_1895, -2.0, 3.0);
    float _1899 = _1895 * _1895;
    float _1901 = _1899 * _1897;
    float _1903 = -_1901;
    float _1905 = _1903 + 1.0;
    float _1907 = fma(_1905, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1901);
    float _1909 = _1875 + _1566;
    int _1911 = as_type<int>(_1909);
    float _1913 = 0.0;
    float _1915 = 0.0;
    if (!_1851)
    {
        _1576 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1917 = _1576;
    float _1919 = _1863 * _1907;
    float _1921 = _1909 * 0.5;
    float _1923 = _1917;
    float _1925 = _1917;
    if (!_1734)
    {
        float _1927 = _1891 * 5.0;
        _1911 = as_type<int>(_1927);
    }
    int _1929 = _1911;
    float _1931 = as_type<float>(_1929);
    if (!_1851)
    {
        _1889 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1933 = _1889;
    float _1935 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_81.z = _1921;
    out.m_81.w = _1566;
    float _1937 = _1933;
    float _1939 = _1933;
    if (!_1734)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5396 = as_type<float>(_1929);
        out.gl_Position.z = _5396;
    }
    if (_1734)
    {
        _1931 = _1877;
    }
    float _1941 = _1931;
    float _1943 = _1941;
    if (!_1851)
    {
        _1913 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1945 = _1913;
    float _1947 = _1945;
    float _1949 = _1945;
    if (!_1851)
    {
        _1915 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1951 = _1915;
    float _1953 = _1951;
    float _1955 = _1951;
    if (!_1734)
    {
        _1943 = 0.0;
    }
    float _1957 = _1943;
    float _1959 = -_1788;
    float _1961 = _1959 + 1.0;
    float _1963 = _1961 * _1935;
    float _1965 = precise::clamp(_1963, 0.0, 1.0);
    float _1967 = -_1965;
    float _1969 = fma(_1967, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1971 = _1885 * _1810;
    float _1973 = _1969 * _1879;
    float _1975 = -_1885;
    float _1977 = _1975 + 1.0;
    float _1979 = _1821 * _1971;
    float _1981 = _1831 * _1971;
    float _1983 = _1973 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1985 = _1821 * _1977;
    float _1987 = fma(_1827, _1979, _1815);
    float _1989 = fma(_1829, _1979, _1817);
    float _1991 = fma(_1821, _1981, _1819);
    out.m_83.x = _1983;
    float _1993 = _1979;
    float _1995 = _1981;
    if (!_1851)
    {
        _1993 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1997 = _1993;
    float _1999 = _1997;
    float _2001 = _1997;
    if (!_1851)
    {
        _1995 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2003 = _1995;
    out.m_85.x = _1987;
    out.m_85.y = _1989;
    out.m_85.z = _1991;
    out.m_85.w = _1985;
    bool _2005 = !_1851;
    float _2007 = _2003;
    float _2009 = _2003;
    if (!_2005)
    {
        bool _2011 = _1520 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2013 = isnan(_1520);
        bool _2015 = _2011 || _2013;
        bool _2017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2019 = _2015 || _2017;
        if (!_2019)
        {
            float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2023 = _1520 + _2021;
            float _2025 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2027 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2025;
            float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2031 = _2029 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2033 = 1.0 / _2027;
            float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2037 = _2035 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2041 = _2039 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2045 = _2043 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2047 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2049 = _2047 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2051 = _2023 * _2033;
            float _2053 = precise::clamp(_2051, 0.0, 1.0);
            float _2055 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2057 = _2055 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2059 = fma(_2053, _2031, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2061 = fma(_2053, _2057, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2063 = fma(_2053, _2037, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2065 = fma(_2053, _2041, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2067 = fma(_2053, _2045, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2069 = fma(_2053, _2049, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1949 = _2059;
            _1939 = _2065;
            _1955 = _2063;
            _2001 = _2067;
            _1925 = _2061;
            _2009 = _2069;
            _2071 = true;
        }
        else
        {
            bool _2073 = _1520 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2075 = isnan(_1520);
            bool _2077 = _2073 || _2075;
            bool _2079 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2081 = _2077 || _2079;
            if (!_2081)
            {
                _1947 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2083 = _1947;
            _1949 = _2083;
            if (!_2081)
            {
                _1953 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2085 = _1953;
            _1955 = _2085;
            if (!_2081)
            {
                _1923 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2087 = _1923;
            _1925 = _2087;
            if (!_2081)
            {
                _1937 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2089 = _1937;
            _1939 = _2089;
            if (!_2081)
            {
                _1999 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2091 = _1999;
            _2001 = _2091;
            if (!_2081)
            {
                _2007 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2093 = _2007;
            bool _2095 = !_2081;
            _2009 = _2093;
            if (!_2095)
            {
                bool _2097 = _1520 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2099 = isnan(_1520);
                bool _2101 = _2097 || _2099;
                bool _2103 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2105 = _2101 || _2103;
                if (!_2105)
                {
                    float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2109 = _1520 + _2107;
                    float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2113 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2111;
                    float _2115 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2117 = _2115 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2119 = 1.0 / _2113;
                    float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2123 = _2121 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2125 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2127 = _2125 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2129 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2131 = _2129 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2133 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2135 = _2133 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2137 = _2109 * _2119;
                    float _2139 = precise::clamp(_2137, 0.0, 1.0);
                    float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2143 = _2141 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2145 = fma(_2139, _2117, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2147 = fma(_2139, _2143, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2149 = fma(_2139, _2123, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2151 = fma(_2139, _2127, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2153 = fma(_2139, _2131, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2155 = fma(_2139, _2135, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1949 = _2145;
                    _1939 = _2151;
                    _1955 = _2149;
                    _2001 = _2153;
                    _1925 = _2147;
                    _2009 = _2155;
                    _2071 = true;
                }
                else
                {
                    _1949 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1939 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1955 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2001 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1925 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2009 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2071 = false;
    float _2157 = _1949;
    float _2159 = _1939;
    float _2161 = _1955;
    float _2163 = _2001;
    float _2165 = _1925;
    float _2167 = _2009;
    float _2169 = fma(_752, -0.5, 0.5);
    float _2171 = precise::clamp(_2169, 0.0, 1.0);
    float _2173 = -_2157;
    float _2175 = _2173 + _2159;
    float _2177 = -_2161;
    float _2179 = _2177 + _2163;
    out.m_87.x = 0.0;
    float _2181 = fma(_2171, _2175, _2157);
    float _2183 = fma(_2171, _2179, _2161);
    out.m_51.x = 1.0;
    float _2185 = -_2165;
    float _2187 = _2185 + _2167;
    bool _2189 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2191 = _2183 * 0.586610972881317138671875;
    float _2193 = fma(_2171, _2187, _2165);
    float _2195 = _1957 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2197 = fma(_2181, 0.298911988735198974609375, _2191);
    out.m_89.x = 0.0;
    bool _2199 = _1652 > 0.0;
    bool _2201 = isnan(_1652);
    bool _2203 = _2199 || _2201;
    bool _2205 = isnan(0.0);
    bool _2207 = _2203 || _2205;
    float _2209 = fma(_2193, 0.114477999508380889892578125, _2197);
    out.m_83.w = _2195;
    float _2211 = -_2209;
    float _2213 = _2181 + _2211;
    float _2215 = -_2209;
    float _2217 = _2183 + _2215;
    float _2219 = -_2209;
    float _2221 = _2193 + _2219;
    float _2223 = fma(_2213, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2209);
    float _2225 = fma(_2217, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2209);
    float _2227 = fma(_2221, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2209);
    bool _2229 = !_2189;
    if (!_2229)
    {
        float _2231 = -_1258;
        float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2235 = -_1262;
        float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2239 = -_1266;
        float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2243 = _2233 * _2233;
        float _2245 = fma(_2237, _2237, _2243);
        float _2247 = fma(_2241, _2241, _2245);
        float _2249 = rsqrt(_2247);
        float _2251 = _2233 * _2249;
        float _2253 = _2237 * _2249;
        float _2255 = _2241 * _2249;
        float _2257 = -_1348;
        float _2259 = _2257 + _2251;
        float _2261 = -_1294;
        float _2263 = _2261 + _2253;
        float _2265 = sqrt(_2247);
        float _2267 = -_1296;
        float _2269 = _2267 + _2255;
        float _2271 = _2259 * _2259;
        float _2273 = fma(_2263, _2263, _2271);
        float _2275 = fma(_2269, _2269, _2273);
        float _2277 = rsqrt(_2275);
        float _2279 = -_2265;
        float _2281 = _2279 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2283 = _2281 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2285 = precise::clamp(_2283, 0.0, 1.0);
        float _2287 = abs(_2285);
        float _2289 = log2(_2287);
        float _2291 = _2259 * _2277;
        float _2293 = _2263 * _2277;
        float _2295 = _2269 * _2277;
        float _2297 = _752 * _2291;
        float _2299 = _752 * _2251;
        float _2301 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2303 = precise::clamp(_2301, 0.0, 1.0);
        float _2305 = fma(_748, _2293, _2297);
        float _2307 = fma(_748, _2253, _2299);
        float _2309 = _2303 * _2303;
        float _2311 = fma(_756, _2295, _2305);
        float _2313 = precise::clamp(_2311, 0.0, 1.0);
        float _2315 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2317 = _2309 + (-1.0);
        float _2319 = fma(_756, _2255, _2307);
        float _2321 = precise::clamp(_2319, 0.0, 1.0);
        float _2323 = _2313 * _2313;
        float _2325 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2327 = exp2(_2315);
        float _2329 = fma(_2323, _2317, 1.0);
        float _2331 = -_2251;
        float _2333 = -_2325;
        float _2335 = fma(_2331, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2333);
        float _2337 = _2329 * _2329;
        float _2339 = -_2255;
        float _2341 = fma(_2339, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2335);
        float _2343 = 1.0 / _2337;
        float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2347 = _2341 + _2345;
        float _2349 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2351 = precise::clamp(_2349, 0.0, 1.0);
        float _2353 = _2327 * _2351;
        float _2355 = _2321 * _2353;
        float _2357 = _2309 * _2343;
        float _2359 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2361 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2363 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2365 = _2355 * _2357;
        float _2367 = _2365 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2369 = _2365 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2371 = _2365 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2359;
        out.m_87.y = _2361;
        out.m_87.z = _2363;
        out.m_89.x = _2367;
        out.m_89.y = _2369;
        out.m_89.z = _2371;
    }
    out.m_91.x = _2223;
    out.m_91.y = _2225;
    out.m_91.z = _2227;
    if (_2207)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2373 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2373;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

